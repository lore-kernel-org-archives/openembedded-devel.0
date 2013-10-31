Return-Path: <p.patat@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id BBBE46D011
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2013 09:55:44 +0000 (UTC)
Received: by mail-wi0-f174.google.com with SMTP id cb5so8061272wib.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2013 02:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:content-type;
	bh=21fgm/Jmcgu+/b5LLIA+7Lj1fkS1mWLqLvbMDlfJWDk=;
	b=IaDsLn6a9k0I8pwl+ii9yMcKfowBnCbKM3J1rtEPXYJDYapECq0ETp/nThir/NKKga
	Rqky9ho5SRCUgJuxg0qro2/2B02LBwjpjw8gifWAqdEmZe58jN5hPnaD5dqIW47RXEml
	f0fau1I4gdKWlXJo5yUXB0p9a9hFSAPMX63oYPr47tl+5Y+hVYfdSSqOGVGBCrjHjOWI
	1z3+QmnTUCtCSmHgkcisFyEibr/Ygd+MTo6Pt9eibEkKzCo4h5OBiXXdPJoUISwBFd8V
	BVFM0ygbEb4iuvoeolWxVL+tWu31RZ0OovFJRUOrDAM8cQY9ijJVO+/LOXLt9bKk96LF
	7UXg==
X-Received: by 10.180.108.131 with SMTP id hk3mr5903417wib.10.1383213346163;
	Thu, 31 Oct 2013 02:55:46 -0700 (PDT)
MIME-Version: 1.0
Sender: p.patat@gmail.com
Received: by 10.194.19.225 with HTTP; Thu, 31 Oct 2013 02:55:26 -0700 (PDT)
In-Reply-To: <CAF+NyK4AwYazpXtYHYjeb99HMkJ_FRpozStLYVQ4OwY-TZkhDA@mail.gmail.com>
References: <CAF+NyK5UinxiRecimtV3fpFrGuKsu9jQ60nyskfgR60tTYdJ_A@mail.gmail.com>
	<CAF+NyK4AwYazpXtYHYjeb99HMkJ_FRpozStLYVQ4OwY-TZkhDA@mail.gmail.com>
From: patrick patat <patrick.patat@innotis.org>
Date: Thu, 31 Oct 2013 10:55:26 +0100
X-Google-Sender-Auth: _6DW2W0ZKJjfmPAvkJPruH-fTH4
Message-ID: <CAF+NyK7G6BU4tQ8C5ExY624jnLDRtRGW26RXsME=sSyj++rosQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: perl module Crypt-OpenSSL-RSA
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 31 Oct 2013 09:55:45 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

I send this to yocto and didn't get any answer,
maybe someone here could help me.

Thanks

Pat

---------- Forwarded message ----------
From: patrick patat <patrick.patat@innotis.org>
Date: Wed, Oct 23, 2013 at 11:12 AM
Subject: Re: perl module Crypt-OpenSSL-RSA
To: yocto <yocto@yoctoproject.org>


Hello,

I found that the problem could be related to libcrypto path which is in
${base_libdir} instead of ${libdir}.
So if I use this EXTRA_CPANFLAGS = "LIBS='
-L${STAGING_DIR_TARGET}${base_libdir} -lssl -lcrypto'"
instead of my ugly sed it's compiling with libcrypto but then I have the
following error:
QA Issue: package Crypt-OpenSSL-RSA contains bad RPATH pathtosysroot/lib in
file
pathtobuilddir/Crypt-OpenSSL-RSA/0.28-r0/packages-split/Crypt-OpenSSL-RSA/usr/lib/perl/vendor_perl/5.14.3/auto/Crypt/OpenSSL/RSA/RSA.so

How can I fix this rpath issue?

Thanks,

Pat



On Tue, Oct 22, 2013 at 3:48 PM, patrick patat <patrick.patat@innotis.org>wrote:

> Hello,
>
> I'm trying to create a recipe for perl module Crypt-OpenSSL-RSA, I'm using
> inherit cpan to do it. Build and install is working but at run time I have
> the following error:
>
> Can't load
> '/usr/lib/perl/vendor_perl/5.14.3//auto/Crypt/OpenSSL/RSA/RSA.so' for
> module Crypt::OpenSSL::RSA:
> /usr/lib/perl/vendor_perl/5.14.3//auto/Crypt/OpenSSL/RSA/RSA.so: undefined
> symbol: RSA_public_encrypt at /usr/lib/perl/5.14.3//.
>
> After some research I found this in configure log :
> Note (probably harmless): No library found for -lcrypto
>
> Because of this -lcrypto as been remove in Makefile, if I manually edit
> Makefile to add -lcrypto and rebuild I don't have undefined symbol error.
>
> Does anybody know if there is a better way than a sed in Makefile to fix
> the problem?
>
> you can find the recipe here http://pastebin.com/u2fd9MJq
>
> Thanks,
>
> Pat
>

