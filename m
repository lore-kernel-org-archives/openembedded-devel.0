Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <aalonso00@gmail.com>) id 1Sa7Fz-0001if-3o
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 May 2012 17:25:47 +0200
Received: by yhjj56 with SMTP id j56so794172yhj.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 May 2012 08:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=uGVzy1zte+dv9UKeBKUI8kVUo6HjFFfUEkdk6N0shMA=;
	b=lJGWyvMSu5Rht5vgu87zpJjkbFrrkDOFKEqSlOd1kHPqLK57HrOWHyVebMZXQYurGW
	1XA+zvPrc6e/0mvHOBRhpOYhO6qidupFfv5Gz2EuQSbynaq8/dDdQ1PSf7BhU63V8bvx
	AF87xElE07FnwVQyk+B0JPo8iKG8nniRTDeb3gkpKmstr4gmwzSuawL5dq8Q5VGghVcW
	nN+shO2/81bHfMdM6EwuAFQpwInrW5ylv+pflo0JA3AJ5TmRDHfVTJNf+jhAwXJoogTf
	7PK0N0auReZSWJVBNqGjIiyxP4DX1v/LOD7CYo94nmanU70yIekwo+4pqld1R/FJXiB/
	7RjA==
MIME-Version: 1.0
Received: by 10.50.159.227 with SMTP id xf3mr14428398igb.24.1338477326730;
	Thu, 31 May 2012 08:15:26 -0700 (PDT)
Received: by 10.64.0.77 with HTTP; Thu, 31 May 2012 08:15:26 -0700 (PDT)
In-Reply-To: <1338445392-39723-1-git-send-email-elvis.dowson@gmail.com>
References: <1338445392-39723-1-git-send-email-elvis.dowson@gmail.com>
Date: Thu, 31 May 2012 10:15:26 -0500
Message-ID: <CAAB-1ywGdhaePDp05Cmm90NtGVSUPbRqGtRtO2XkVMd9NnK+Gg@mail.gmail.com>
From: Adrian Alonso <aalonso00@gmail.com>
To: Elvis Dowson <elvis.dowson@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-xilinx] tune-ppc440.inc: Update support for the PowerPC 440 processor in the Xilinx Virtex-5 FXT FPGA.
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
X-List-Received-Date: Thu, 31 May 2012 15:25:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Elvis,

Please update your meta-xilinx repo,
commit: 04633e44b5401288ceee2d36eb2413dfa5308a54
does something similar, but I fail to use "powerpc-nf"

I would accept a new patch for that :)

Regards
Adrian Alonso

On Thu, May 31, 2012 at 1:23 AM, Elvis Dowson <elvis.dowson@gmail.com> wrot=
e:
> This commit updates support for the PowerPC 440 processor in the Xilinx
> Virtex-5 FXT FPGA.
>
> Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
> ---
> =A0conf/machine/include/tune-ppc440.inc | =A0 10 +++++-----
> =A01 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/conf/machine/include/tune-ppc440.inc b/conf/machine/include/=
tune-ppc440.inc
> index f77f628..394364d 100644
> --- a/conf/machine/include/tune-ppc440.inc
> +++ b/conf/machine/include/tune-ppc440.inc
> @@ -4,11 +4,11 @@ require conf/machine/include/powerpc/arch-powerpc.inc
>
> =A0TUNEVALID[ppc440] =3D "Enable ppc440 specific processor optimizations"
> =A0TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "ppc440", "-mc=
pu=3D440", "", d)}"
> -TUNE_PKGARCH =3D "${@bb.utils.contains("TUNE_FEATURES", "ppc440", "ppc44=
0", "${PPCPKGARCH}", d)}"
>
> -TARGET_FPU =3D "soft"
> =A0AVAILTUNES +=3D "ppc440"
> -TUNE_FEATURES_tune-ppc440 =3D "m32 ppc440"
> -PACKAGE_EXTRA_ARCHS_tune-ppc440 =3D "ppc440"
> +TUNE_FEATURES_tune-ppc440 =3D "m32 fpu-soft ppc440"
> +TUNE_PKGARCH_tune-ppc440 =3D "ppc440"
> +PACKAGE_EXTRA_ARCHS_tune-ppc440 =3D "${PACKAGE_EXTRA_ARCHS_tune-powerpc-=
nf} ppc440"
>
> -#MACHINEOVERRIDES .=3D "ppc440"
> +# glibc configure options to get 440 specific library (for sqrt)
> +GLIBC_EXTRA_OECONF +=3D "${@bb.utils.contains("TUNE_FEATURES", "ppc440",=
 "-with-cpu=3D440", "", d)}"
> --
> 1.7.9.5
>



--=20
Saludos
Adrian Alonso
http://aalonso.wordpress.com


