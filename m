Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id 378556FF64
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Dec 2015 15:30:12 +0000 (UTC)
Received: by mail-ig0-f175.google.com with SMTP id xm8so53543150igb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Dec 2015 07:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=OuxtMfcWN5MPKaInap85baqQUxL8v+uKkWaao+NdLBE=;
	b=O8hZ1HgW2j6eCpce4xi3bEQoK9h7BMwLbsdSwglfFwRPZSVQ8MeyXGWlIpOIqEKEgS
	Doiv6XYZAW+tLvX6QI48X0b5f40RNoyAPa7f/6LQKb1jwAojQEWmv0knd2H/lnvXuNxw
	YJIIg+LzEBf6NYBRyUDmcfNmsz7ylvsPtwp7t50G7H7prT2pvm64zbi85u9e2nukN3Ho
	ndKd9VOwvbLacMQtMOkX0oUXREmPQ/FGZVHaz8jrJuy/FYcJT/crIgif5dD6oqDpY8kZ
	NkHHuA9UrWb+xcfYM+R2fQVuPE5hFf87fNwazKDKDxeNCryrTzLNkNizz+uDLiSkE7b0
	v2Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=OuxtMfcWN5MPKaInap85baqQUxL8v+uKkWaao+NdLBE=;
	b=kyc9ROnmMoWWqsqolpyUWNj8P364mDlH0tuSBFTpRk/+UIrEtpkgxwO0m48EW6ETih
	j8I53WzHNveEoq9+93xxA2LSI+fZ/jVATSb22PlOJ/0uJvcAgmk0voZ16C0mTU0bfQs1
	Zbk/KxK3z6JJU4Z+G2D9UoDx/RRu79Fi5dIRmcN18ZEOygkhehfbWyDWis9o3S5tYVfj
	cFT4VJW9LRNIYlAAedhv0pTuD9FTrQ0LHxQgI7e3YzCUZkpq+Dsle2niy3OiA76xVUuT
	H/LPFF+98623ZlzVx/fcvxtnKpZXouxBJ83CNKTzwvbSRY/xCXLoJMfHr1YGgiEwdBTo
	YeRw==
X-Gm-Message-State: ALoCoQmjhdhYRRexOUwikerpbZgSGayTy3gFnODorl49v0f+GhBnSF0lV7SpqRXW037qbnCf+ZRpiqOIOuEEdPKktQJ6Qg1JnzYqvAat1U3YRFRsksnZNUU=
X-Received: by 10.107.164.161 with SMTP id d33mr261733ioj.148.1450279813125;
	Wed, 16 Dec 2015 07:30:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Wed, 16 Dec 2015 07:29:53 -0800 (PST)
In-Reply-To: <1450270689-9022-1-git-send-email-thomas.perrot@tupi.fr>
References: <1450270689-9022-1-git-send-email-thomas.perrot@tupi.fr>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 16 Dec 2015 15:29:53 +0000
Message-ID: <CAJTo0Lb2powZHsuzJnqeYwKddYJfOaLpOiurW3RmFELu3LoC7A@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [fido][PATCH v2] Fix build issue on openssl 1.0.2d on Fido branch. OpenSSL's URIs of old releases have changed to /source/old/<x.y.z> instead of /source.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 16 Dec 2015 15:30:13 -0000
Content-Type: text/plain; charset=UTF-8

On 16 December 2015 at 12:58, Thomas Perrot <thomas.perrot@tupi.fr> wrote:

> -SRC_URI += "file://configure-targets.patch \
> -            file://shared-libs.patch \
> -            file://oe-ldflags.patch \
> -            file://engines-install-in-libdir-ssl.patch \
> -            file://debian1.0.2/block_diginotar.patch \
> -            file://debian1.0.2/block_digicert_malaysia.patch \
> -            file://debian/ca.patch \
> -            file://debian/c_rehash-compat.patch \
> -            file://debian/debian-targets.patch \
> -            file://debian/man-dir.patch \
> -            file://debian/man-section.patch \
> -            file://debian/no-rpath.patch \
> -            file://debian/no-symbolic.patch \
> -            file://debian/pic.patch \
> -            file://debian/version-script.patch \
> -            file://openssl_fix_for_x32.patch \
> -            file://fix-cipher-des-ede3-cfb1.patch \
> -
> file://openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch \
> -            file://find.pl \
> -            file://openssl-fix-des.pod-error.patch \
> -            file://Makefiles-ptest.patch \
> -            file://ptest-deps.patch \
> -            file://run-ptest \
> -            file://crypto_use_bigint_in_x86-64_perl.patch \
> -           "
> +SRC_URI = "http://www.openssl.org/source/old/1.0.2/openssl-${PV}.tar.gz \
> +           file://configure-targets.patch \
> +           file://shared-libs.patch \
> +           file://oe-ldflags.patch \
> +           file://engines-install-in-libdir-ssl.patch \
> +           file://debian1.0.2/block_diginotar.patch \
> +           file://debian1.0.2/block_digicert_malaysia.patch \
> +           file://debian/ca.patch \
> +           file://debian/c_rehash-compat.patch \
> +           file://debian/debian-targets.patch \
> +           file://debian/man-dir.patch \
> +           file://debian/man-section.patch \
> +           file://debian/no-rpath.patch \
> +           file://debian/no-symbolic.patch \
> +           file://debian/pic.patch \
> +           file://debian/version-script.patch \
> +           file://openssl_fix_for_x32.patch \
> +           file://fix-cipher-des-ede3-cfb1.patch \
> +
>  file://openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch \
> +           file://find.pl \
> +           file://openssl-fix-des.pod-error.patch \
> +           file://Makefiles-ptest.patch \
> +           file://ptest-deps.patch \
> +           file://run-ptest \
> +           file://crypto_use_bigint_in_x86-64_perl.patch \
> +          "
>

This was sent to the wrong mailing list (openembedded-core@, please), the
commit log is incorrectly formatted (we use standard git style with a
recipe prefix), and it's probably best just to edit the SRC_URI entry in
openssl.inc instead of overwriting it from the .bb.

(insert standard moan about pointless bb/inc splits here)

Ross

