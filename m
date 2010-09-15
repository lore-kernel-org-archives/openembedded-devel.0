Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1OvzOs-0003Ui-U7
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Sep 2010 23:20:20 +0200
Received: by qwa26 with SMTP id 26so191208qwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Sep 2010 14:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=f+oUYbZ+VQwvW/JiVlkWdDEdzr5Dva2vLD36rGmqURM=;
	b=ctTZx1weCrv0IYStVgLPev6TDroiNrIsYx8WneVCWQFm5OWsIYiu8uyKVV6ZO+RPkJ
	XjAt7GsjqdQxweLFjPkxATw8NL/rEUlPukJ53KYrU7pxUfvebhrOSI1AR1bQClwqQzZt
	1qex7x7fXI1GuBeWxtGAVLKKtd3FCwwSWJHOY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=pNlCIt6P/DiFdg08vJrBmxv3giq1jjN2rIP8yjGPQVO6022ov+mwcx9X8tB4vKFVPr
	RX0D62ZVQAaNb9IQY/5aalL/F/RhCEKOqy9hfJNvM2OzM3j+K72+RaOZvdAdPuaaqZkA
	U8TSa/ChDFgtqLF2W08QUGr898mUynfblbGYI=
MIME-Version: 1.0
Received: by 10.229.11.32 with SMTP id r32mr1298352qcr.242.1284585544432; Wed,
	15 Sep 2010 14:19:04 -0700 (PDT)
Received: by 10.229.71.78 with HTTP; Wed, 15 Sep 2010 14:19:04 -0700 (PDT)
In-Reply-To: <201009152053.55754.pieterg@gmx.com>
References: <201009152053.55754.pieterg@gmx.com>
Date: Wed, 15 Sep 2010 23:19:04 +0200
Message-ID: <AANLkTiniT0yN9D3x=ksGJRBRkdmKX1pVM8964BaTTZot@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.47
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: using klibc shared objects
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
X-List-Received-Date: Wed, 15 Sep 2010 21:20:20 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Sep 15, 2010 at 8:53 PM, pieterg <pieterg@gmx.com> wrote:
> I have an initramfs image which contains a few klibc utils, and a custom
> executable (which displays a progress bar).
> I'm not using klibc-static, because the total size of all static klibc utils
> and the custom binary is much larger than klibc.so plus dynamically linked
> binaries.

This can happen, it all depends on how many binaries.

>
> However, with one of the recent klibc recipe rewrites, the klibc package now
> contains ~5.3MB of header files. These end up in my initramfs image, making
> it quite big.
>
> What would be the best solution (if I don't want to switch to static
> linking)? Should we perhaps move the header files to klibc-dev?
>
> Rgds, Pieter

In the first version there was an error about this.
Pls retry and pull klibc_1.5.20-r1 which has been fixed (it seems).

Regards

Andrea
...
RDEPENDS_klibc:..
PKG_klibc: klibc
FILES_klibc: /lib/klibc-*.so

...
RRECOMMENDS_klibc-dev: klibc-dev
PKG_klibc-dev: klibc-dev
ALLOW_EMPTY_klibc-dev: 1
FILES_klibc-dev: /lib/klibc.so                    /lib/klibc/lib/*
      /lib/klibc/include/*                    /bin/klcc




>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


