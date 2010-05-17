Received: from mail-ww0-f51.google.com ([74.125.82.51])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1OE5KX-0007D9-IB
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 May 2010 20:46:52 +0200
Received: by wwb28 with SMTP id 28so269830wwb.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 May 2010 11:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=KSDBkOvt5HfjMaRTK7jzTAJfo5wVFf00xlaJv+MTvDE=;
	b=c8Gweju4DtTh5WzC7oHWMu/oPBAqEr2wTfikpUgWtzbPOAuJ8ebnpoBBMxjo9m0WgI
	w/f0v40tup0hBcs9OHXS3fQC7vFVwD6y5FsvDPzpRP2y6hRA2yFU+LJx4jQlrkwGOcpR
	IdmpMpgeqt5QTHw11T7mTiZl7jySTiPMgvtUg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=cBYpFA9tQBZcztsrLOcEjFkpbfvOz0smUj0Bk722oMj7yAGidjcbscEYD13SMRKiH/
	HAaXVe4lK8+ufkobPqpwLA/3SaAcdy0xlGAeLN4oMEX0NlAM1nWVJa5+M4IzfQUinPpc
	CLHYttDbpp05aYreUK+Xm6ve3+3QOns8S/pIE=
MIME-Version: 1.0
Received: by 10.227.137.20 with SMTP id u20mr5333807wbt.134.1274121742345; 
	Mon, 17 May 2010 11:42:22 -0700 (PDT)
Received: by 10.216.49.206 with HTTP; Mon, 17 May 2010 11:42:22 -0700 (PDT)
In-Reply-To: <1273877583-31604-1-git-send-email-eric@eukrea.com>
References: <1273877583-31604-1-git-send-email-eric@eukrea.com>
Date: Mon, 17 May 2010 14:42:22 -0400
Message-ID: <AANLkTin_5G8442pqEHh8IBQ5CRGyyYxQ5eKSLJwkCMNx@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.51
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] cross.bbclass: fix build of meta-toolchain
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
X-List-Received-Date: Mon, 17 May 2010 18:46:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, May 14, 2010 at 6:53 PM, Eric Benard <eric@eukrea.com> wrote:
> - without this bitbake meta-toolchain fails because it doesn't find who
> =A0provides gdb-cross-sdk
> - found thanks to a hint from Phil Blundell on IRC
> - tested with Angstrom/ARMv5te
>
> Signed-off-by: Eric Benard <eric@eukrea.com>
> ---
> =A0classes/cross.bbclass | =A0 =A02 --
> =A01 files changed, 0 insertions(+), 2 deletions(-)
>
> diff --git a/classes/cross.bbclass b/classes/cross.bbclass
> index 69f6511..5c2d5be 100644
> --- a/classes/cross.bbclass
> +++ b/classes/cross.bbclass
> @@ -17,8 +17,6 @@ PACKAGE_ARCH =3D "${OLD_PACKAGE_ARCH}"
> =A0OLD_BASE_PACKAGE_ARCH :=3D "${BASE_PACKAGE_ARCH}"
> =A0BASE_PACKAGE_ARCH =3D "${OLD_BASE_PACKAGE_ARCH}"
>
> -PACKAGES =3D ""
> -
> =A0HOST_ARCH =3D "${BUILD_ARCH}"
> =A0HOST_VENDOR =3D "${BUILD_VENDOR}"
> =A0HOST_OS =3D "${BUILD_OS}"
> --
> 1.6.3.3


This fixes meta-toolchain builds for me.

Thanks,
Cliff


