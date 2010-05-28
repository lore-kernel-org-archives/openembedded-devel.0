Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OHt6c-0006cA-3f
	for openembedded-devel@lists.openembedded.org;
	Fri, 28 May 2010 08:31:45 +0200
Received: by gya1 with SMTP id 1so521923gya.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 May 2010 23:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=aFsRJudnruFlTTl0+pCUcfW3DGN50ZSwBE03BZNSvog=;
	b=YNFVvAU0z4loQhkb4fmhU1aS4QwwudBaZ0Ar4E7mMSuxCw4w0RV/BWemoTo36Lh3Xb
	D5uWX/cghZS/Ev0N9lQpXG5TvW8jv8O20f/fZFq/DVV0f99Eca4rWNglHL3ysU5x3L9P
	AFz1Ppx/YEZCv/HRMkO3MlPOLg/XnOT7Evw6A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=Qm3NuJcEj2pVO+81jYmvWyxcMEX+RFJFpVKoBy79V/PkxFiO5G0HiKjAHprgSerb0Z
	HENF/7JrfZ82zBaL4JXQLjISEuSJYkLlfyQbbYx4FY/Bz1ghDgxElX2QRgsyYdtIzu/K
	qnJjmIyBBfmxxiv/YJdO/1Pef5Q2skvPom1ks=
MIME-Version: 1.0
Received: by 10.90.225.16 with SMTP id x16mr430743agg.71.1275028046493; Thu, 
	27 May 2010 23:27:26 -0700 (PDT)
Received: by 10.90.71.4 with HTTP; Thu, 27 May 2010 23:27:26 -0700 (PDT)
In-Reply-To: <20100528052720.GA15949@gmail.com>
References: <20100528052720.GA15949@gmail.com>
Date: Fri, 28 May 2010 08:27:26 +0200
Message-ID: <AANLkTimtQkUN5yex9NJLyyFikTHxlAGLUZhK2oRo5lQh@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL, BAYES_00, SPF_PASS,
	URI_HEX autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: <package>-static name conflict with some recipes
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
X-List-Received-Date: Fri, 28 May 2010 06:31:45 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/5/28 Khem Raj <raj.khem@gmail.com>:
> Hi
>
> I have seen that we have parallel recipes for some applications for static
> build
> called package-static.bb like below
>
> ./dialog/dialog-static_1.1-20080819.bb
> ./busybox/busybox-static_1.2.1.bb
> ./busybox/busybox-static_1.11.3.bb
> ./kexec-tools/kexec-tools-klibc-static_1.101.bb
> ./kexec-tools/kexec-tools-klibc-static_2.0.1.bb
> ./zaurus-utils/nandlogical-klibc-static_1.0.0.bb
> ./klibc/klibc-utils-static_1.5.15+1.5.16.bb
> ./klibc/klibc-utils-static_1.5.18.bb
> ./klibc/klibc-utils-static_1.5.15.bb
> ./klibc/klibc-utils-static_1.5.bb
> ./klibc/klibc-utils-static_1.5.17.bb
> ./skype/skype-static_2.0.0.72.bb
> ./udev/udev-static-devices.bb
> ./udev/udev-static_124.bb
>
> Now they conflict with the automatic package that we generate to bundle
> static libraries. Since the the packages which bundle static libraries
> are essentially development packages may be they should be called
>
> <package>-dev-static instead of <package>-static
>
> IMO that will avoid the conflict and also clarify the package content
> a bit
>
> Thoughts?

I have no problems with the rename but wouldn't it be nice to have a
conf flag to specify if you want to build static or dynamic  (not that
I know how to implement it).
Alternately we could cook up something like BBCLASSEXTEND = "static".
(not sure how to do that either).

The idea is to give the user a choice whether to get a static or
dynamic linked package.

Frans.

PS: helloworld is also a static package (despite the name not having -static)


