Received: from [216.239.58.187] (helo=gv-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1N132N-0002bY-He
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Oct 2009 21:09:30 +0200
Received: by gv-out-0910.google.com with SMTP id e6so1891755gvc.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Oct 2009 12:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=WOv4CUWst5lcFVgZlXUbF3OirwXe1t9Q4rU0cyv/FDg=;
	b=L9in4eGGNpNAM/6+JHDOPriYdjFdZFwjh/IjZ6qc3Tknn8x5yuZBHA30hrGDzXIj7G
	qNos+gskO3OJ9ijKIpzg95iwD62qJy7GkjyYpab5I8tq3g1thSysfv8ErmKIJ1b9UIv3
	8vZw5oZ28CtfYwL4Q/qws4m/EiTmkcKF0O0oE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=PD8jQWastVkow+FJ4kjl/GETVEobuohvOHFHJwzAPRsF05dBC0wL7lTRmTUv8XSvix
	KoQEB+vMdRmgZFKw7ZlOY+DGdyiFharM3tpLvlCSgZcFFfRCiRWsrK6UAu2yI8QsnazH
	CSvYnP6VcqmZhca9HlRb/wCnAcCYpK6k9CGX0=
MIME-Version: 1.0
Received: by 10.239.139.211 with SMTP id u19mr813859hbu.97.1256238507034; Thu, 
	22 Oct 2009 12:08:27 -0700 (PDT)
Date: Thu, 22 Oct 2009 21:08:27 +0200
Message-ID: <c384c5ea0910221208y3efee675t6c292de20ed1d8f1@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 216.239.58.187
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [RFC] package complete ${datadir} ${libdir} by default
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Oct 2009 19:09:30 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

Why does FILES_${PN} have ${PN} after ${datadir} and ${libdir}?

I would propose to just package ${datadir} and ${libdir} as-is.
Or am I overlooking something?

All the recipes where ${PN} does not match the actual package name
currently need workarounds for this.

Regards,

Leon.


FILES_${PN}

    The base package, this includes everything needed to actually run
the application on the target system.

    FILES_${PN} = "\
        ${bindir}/* \
        ${sbindir}/* \
        ${libexecdir}/* \
        ${libdir}/lib*.so.* \
        ${sysconfdir} \
        ${sharedstatedir} \
        ${localstatedir} \
        /bin/* \
        /sbin/* \
        /lib/*.so* \
        ${datadir}/${PN} \
        ${libdir}/${PN}/* \
        ${datadir}/pixmaps \
        ${datadir}/applications \
        ${datadir}/idl \
        ${datadir}/omf \
        ${datadir}/sounds \
        ${libdir}/bonobo/servers"

-- 
Leon


