Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <coolaj86@gmail.com>) id 1On0rZ-0002TH-5D
	for openembedded-devel@lists.openembedded.org;
	Sun, 22 Aug 2010 05:04:56 +0200
Received: by fxm6 with SMTP id 6so2563738fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Aug 2010 20:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=sErixqJ4fjPQYCAFHxjQGISwS9HH9qSIGvUUXAOsWCg=;
	b=eTyMSTShEmQuqQHpiIpakyPRSxFtfS/dWgc/jd73CRTrr1M3o8IiebQ8/ww8ESLqEk
	f+TnPYLonDZCs6PCm7Y6/TFJUyUOQaJK8y8Df7gq2k3RLNG0iY21gQuH/sFkg7xg/bH9
	2HVNppQ51w0uy3KVc868Ld8Npzj8Oa6KYXD6o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=FLwafFvzXzwi4dccPthSqNi0VgCEQjuHgxCjBdWSBrOJf+uKb3u6AHzJqZ7IcRd5M5
	cv6XpK9qbxDPkWS32bGiDsyU0me4AR73X+9WJbHo2Ks+RpocxpwgLrSJbaIf9tFWOZ3Y
	GadBV6JVwBbLARPQIFqmroTrCJN9MrayTQctI=
Received: by 10.223.104.148 with SMTP id p20mr2753969fao.11.1282446261116;
	Sat, 21 Aug 2010 20:04:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.125.209 with HTTP; Sat, 21 Aug 2010 20:04:01 -0700 (PDT)
In-Reply-To: <i4iqg8$g6i$2@dough.gmane.org>
References: <1282198068-25415-1-git-send-email-coolaj86@gmail.com>
	<i4iqg8$g6i$2@dough.gmane.org>
From: AJ ONeal <coolaj86@gmail.com>
Date: Sat, 21 Aug 2010 21:04:01 -0600
Message-ID: <AANLkTim2hsYd7ya-SZ6hRpjU2_MHRAQAeczkTnQVuRD3@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: coolaj86@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] added a .bb for node.js
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
X-List-Received-Date: Sun, 22 Aug 2010 03:04:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

>
>
> > +do_install () {
> > +install -d ${D}${bindir}/
> > +install -m 0755 ${S}/node ${D}${bindir}/
> > +}
>
> 'make install' doesn't work?
>
>
No, if I do `make install` it will try to install to the host location. I
tried adding ./configure --prefix=${D}, but that ends up installing to
`./work/arm......./usr/bin/bin`


I don't know how to add the [v2] onto a patch, but I'm going to submit again
with what I have working.

