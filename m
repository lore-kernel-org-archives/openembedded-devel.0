Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P5eNT-0005dJ-8l
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Oct 2010 14:54:49 +0200
Received: by iwn2 with SMTP id 2so1028321iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Oct 2010 05:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=nZ57tM+3/yGwhC2yphsrFQ/lFglUvCKyKRb4RjcJaQQ=;
	b=WBljhi2QaQCZOXGv+9aC9qIHEc55wlbNXlyM7BP8aoW0dW++6LDYVEGV6NeZBNcEeP
	Gr4xJD/+FRPVZI1zXQv/n9bAC+tz4j3UIf022fy6C0BObzRcDKdwdVyl6RmSy0kt9unD
	PhP8rK3Ltp12QXRs7yOHYWYUNuPcfoZcAkiyY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=CcZtNd0UtuXpcs9n/jnWY/2nRoCIMJAGhVCuFtnKC8PHjZINXYzw/ZykHVUHoJ1my+
	vn8OjjLwu8O4gjhX3XYjye9YakSyi+kduHxaSxDjC+RFz83bCj1ZCHKQmKU2+9SsiQt7
	fSaM/pkCkrVTIDdcdTE72sgaPShNloWHuqHYw=
MIME-Version: 1.0
Received: by 10.231.16.75 with SMTP id n11mr5306250iba.49.1286888059905; Tue,
	12 Oct 2010 05:54:19 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Tue, 12 Oct 2010 05:54:19 -0700 (PDT)
In-Reply-To: <1286783755-19145-3-git-send-email-koen@openembedded.org>
References: <1286783755-19145-1-git-send-email-koen@openembedded.org>
	<1286783755-19145-3-git-send-email-koen@openembedded.org>
Date: Tue, 12 Oct 2010 14:54:19 +0200
Message-ID: <AANLkTinuwD5MRBXNXNF5y_-gJdNrCVMjF2oXUx73PTKV@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCHv3 3/3] multi-kernel: adapt to kernel_do_compile_kernelmodules change in kernel.bbclass
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
X-List-Received-Date: Tue, 12 Oct 2010 12:54:49 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/10/11 Koen Kooi <koen.kooi@gmail.com>:
> ---
> =A0recipes/linux/multi-kernel.inc | =A0 =A01 +
> =A01 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/recipes/linux/multi-kernel.inc b/recipes/linux/multi-kernel.=
inc
> index 70cfd87..0523a33 100644
> --- a/recipes/linux/multi-kernel.inc
> +++ b/recipes/linux/multi-kernel.inc
> @@ -41,6 +41,7 @@ do_compileconfigs () {
> =A0 =A0 =A0 =A0 # Build and Install this alternative kernel
> =A0 =A0 =A0 =A0 do_configure
> =A0 =A0 =A0 =A0 kernel_do_compile
> + =A0 =A0 =A0 =A0do_compile_kernelmodules
> =A0 =A0 =A0 =A0 kernel_do_install
>
> =A0 =A0 =A0 =A0 # Drop the resulting images in the deploy dir
> --

This is where I found it would probably better be called
kernel_do_compile_modules or so.

Still:
Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>


