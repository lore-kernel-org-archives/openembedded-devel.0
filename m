Received: from [209.85.146.182] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <shawn.t.rutledge@gmail.com>) id 1KIfsb-0002Ne-M2
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Jul 2008 10:27:26 +0200
Received: by wa-out-1112.google.com with SMTP id j37so2916304waf.22
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jul 2008 01:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:mime-version:content-type:content-transfer-encoding
	:content-disposition;
	bh=lCu0v71DGHbAY2RyHCK2gfqwRi7RedPgHFkLcjn8ubU=;
	b=tVpk9T+lbzb9zdo0KEBAf78StSNCw4vRAAKkAqc3Wd3qHXTH9Nyvth0ezEbcotxyAu
	7OMq6w/U6XEmz1vCiV1jtV4rDp5ETXiXRtnVB0f9C8kv8rZRgk0vmckNWt9QfNUva6uh
	qE5O+a37lFfuklgMnOmQ8tm47Ox/9mRpf3fX8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:mime-version:content-type
	:content-transfer-encoding:content-disposition;
	b=UW82rqcg2sm/aiN7KMoHXeihru2WlSmBJZzL/tN9BXGSvZhpyM41E5ICKaTOMiM7qG
	moqeDj7HwmV1s/rYPMBR8LHJnNx1IaDKNAFV1Gs5PxfcHSRSHpGCNZB+I6KpLwOWasSj
	T/CZPeUrsGsC1a4xG8DNQ0dQP2o1HWQpVrCg4=
Received: by 10.114.201.1 with SMTP id y1mr18680967waf.93.1216110410141;
	Tue, 15 Jul 2008 01:26:50 -0700 (PDT)
Received: by 10.114.131.13 with HTTP; Tue, 15 Jul 2008 01:26:50 -0700 (PDT)
Message-ID: <d9a6586e0807150126w6ceb8a0aj5a5b6bab4cb42cfc@mail.gmail.com>
Date: Tue, 15 Jul 2008 01:26:50 -0700
From: "Shawn Rutledge" <shawn.t.rutledge@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: help with bitbake recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Tue, 15 Jul 2008 08:27:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I'm trying to build some Chicken Scheme ipk's for OpenMoko.  It's
making them, but putting some docs in the main package, and not enough
stuff in the chicken-doc package.  Judging from other bb files it
looks like the thing to do is something like this, at the end:

FILES_chicken-doc = "${prefix}/share/chicken/doc ${prefix}/share/info
${prefix}/share/man"

or maybe

FILES_${PN}-doc = "${prefix}/share/chicken/doc ${prefix}/share/info
${prefix}/share/man"

However that's not taking effect:

/var/media/moko/build/tmp/work/armv4t-angstrom-linux-gnueabi/chicken-3.3.0-r0
[neutron][01:08:10 AM] grep -r FILES_chick * 2>/dev/null
staging-pkg/staging/pkgdata/armv4t-angstrom-linux-gnueabi/runtime/chicken:FILES_chicken:
/usr/bin/* /usr/sbin/* /usr/libexec/* /usr/lib/lib*.so.* /etc /usr/com
/var /bin/* /sbin/* /lib/*.so* /usr/share/chicken /usr/lib/chicken/*
/usr/share/pixmaps /usr/share/applications /usr/share/idl
/usr/share/omf /usr/share/sounds /usr/lib/bonobo/servers
staging-pkg/staging/pkgdata/armv4t-angstrom-linux-gnueabi/runtime/chicken-dbg:FILES_chicken-dbg:
/usr/bin/.debug /usr/sbin/.debug /usr/libexec/.debug /usr/lib/.debug
/bin/.debug /sbin/.debug /lib/.debug /usr/lib/chicken/.debug
/usr/lib/matchbox-panel/.debug
staging-pkg/staging/pkgdata/armv4t-angstrom-linux-gnueabi/runtime/chicken-dev:FILES_chicken-dev:
/usr/include /usr/lib/lib*.so /usr/lib/*.la /usr/lib/*.a /usr/lib/*.o
/usr/lib/pkgconfig /lib/*.a /lib/*.o /usr/share/aclocal
staging-pkg/staging/pkgdata/armv4t-angstrom-linux-gnueabi/runtime/chicken-doc:FILES_chicken-doc:
/usr/share/doc /usr/share/man /usr/share/info /usr/share/gtk-doc
/usr/share/gnome/help
staging-pkg/staging/pkgdata/armv4t-angstrom-linux-gnueabi/runtime/chicken-locale:FILES_chicken-locale:
/usr/share/locale

I keep trying by doing
bitbake -vD chicken -c rebuild

after I make a change.  I wish I didn't have to recompile it too, just
to retry the packaging.

Another one:  at what point is EXTRA_OEMAKE applied?  I was hoping it
would set some extra env variables every time make is run, but doesn't
seem to.

EXTRA_OEMAKE = "PLATFORM=linux PREFIX=/usr"


