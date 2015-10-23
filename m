Return-Path: <danismostlikely@gmail.com>
Received: from mail-vk0-f41.google.com (mail-vk0-f41.google.com
	[209.85.213.41])
	by mail.openembedded.org (Postfix) with ESMTP id 0601F73CBD
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Oct 2015 22:34:10 +0000 (UTC)
Received: by vkgy127 with SMTP id y127so72191364vkg.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Oct 2015 15:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=hCPF3sde7i5C7PGznU4jy3ScEbbFqA7LN+oxJ+9tSKI=;
	b=ejJMUndE8lXhJY5O7in/VC1NnuL9a3ORvQd8EML3dS0/jbz7pflTjqeKaplO65487m
	Mc1NvAGnWUG+K7IodR0TxmOzDB/bKuTJvts0GezET6CuQpCNkPeFlC07bUy5AkmfQcNl
	jBmUpK/9edFWWYHfwrIE2nVsEN/LZE/ia6Vg/wu4vVi7WqHe9BsWwnprmtlMuCYFvhXD
	KPPOBbFOoDNwGEY1ewggsDOAgtUnVYl/FtoXzxBm65FQtJeFFub2Wx//D3Egd0rdSFa2
	F2HilSb66aJJUDx60TaiZQ1KfHCXYiWjdR3mhtqmcCuG4NpBCl0SVkojHDSVUTLVoa0s
	zpsg==
MIME-Version: 1.0
X-Received: by 10.31.182.208 with SMTP id g199mr8921963vkf.21.1445639650601;
	Fri, 23 Oct 2015 15:34:10 -0700 (PDT)
Received: by 10.31.237.197 with HTTP; Fri, 23 Oct 2015 15:34:10 -0700 (PDT)
Received: by 10.31.237.197 with HTTP; Fri, 23 Oct 2015 15:34:10 -0700 (PDT)
In-Reply-To: <1445420509-1807-1-git-send-email-erkka.kaaria@intel.com>
References: <1445420509-1807-1-git-send-email-erkka.kaaria@intel.com>
Date: Fri, 23 Oct 2015 16:34:10 -0600
Message-ID: <CACS+7ZTfv0MqEYUVLhEVp9rD+8DTqZjd8rVj_+Wp=-5NfPEPdg@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-java][PATCH] cacao-initial-native: Fix undefined behaviour in gc
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
X-List-Received-Date: Fri, 23 Oct 2015 22:34:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 21 Oct 2015 3:42 a.m., "Erkka K=C3=A4=C3=A4ri=C3=A4" <erkka.kaaria@intel=
.com> wrote:
>
> Upstream-Status: Backport
>
> Fixes undefined behaviour in boehm GC used by cacao-initial-native
> as suggested at
>
https://github.com/ivmai/bdwgc/commit/16780405c899f01119bc45167122b4242f6b3=
4fb
.
>
> The undefined behaviour at very least causes a segmentation fault during
> classpath-native configure step with Fedora 22.
>
> Signed-off-by: Erkka K=C3=A4=C3=A4ri=C3=A4 <erkka.kaaria@intel.com>
> ---
>  recipes-core/cacao/cacao-initial-native_0.98.bb    |  1 +
>  ...-0.9.8-initial-fix-gc-undefined-behaviour.patch | 35
++++++++++++++++++++++
>  2 files changed, 36 insertions(+)
>  create mode 100644
recipes-core/cacao/files/cacao-0.9.8-initial-fix-gc-undefined-behaviour.pat=
ch
>
> diff --git a/recipes-core/cacao/cacao-initial-native_0.98.bb
b/recipes-core/cacao/cacao-initial-native_0.98.bb
> index ec7fbdb..2a8ced5 100644
> --- a/recipes-core/cacao/cacao-initial-native_0.98.bb
> +++ b/recipes-core/cacao/cacao-initial-native_0.98.bb
> @@ -14,6 +14,7 @@ SRC_URI =3D "\
>
http://www.complang.tuwien.ac.at/cacaojvm/download/cacao-${PV}/cacao-${PV}.=
tar.bz2;
\
>          file://cacao-0.98-initial.patch \
>          file://disable_hw_exceptions.patch \
> +        file://cacao-0.9.8-initial-fix-gc-undefined-behaviour.patch \
>          "
>
>  # libjvm disabled - it would conflict with cacao-native installations
> diff --git
a/recipes-core/cacao/files/cacao-0.9.8-initial-fix-gc-undefined-behaviour.p=
atch
b/recipes-core/cacao/files/cacao-0.9.8-initial-fix-gc-undefined-behaviour.p=
atch
> new file mode 100644
> index 0000000..ccc35cb
> --- /dev/null
> +++
b/recipes-core/cacao/files/cacao-0.9.8-initial-fix-gc-undefined-behaviour.p=
atch
> @@ -0,0 +1,35 @@
> +Upstream-Status: Backport
> +
> +This fixes undefined behaviour in boehm GC as suggested at
> +
https://github.com/ivmai/bdwgc/commit/16780405c899f01119bc45167122b4242f6b3=
4fb
.
> +
> +The undefined behaviour at very least causes a segmentation fault during
> +classpath-native configure step.
> +
> +Signed-off-by: Erkka K=C3=A4=C3=A4ri=C3=A4 <erkka.kaaria@intel.com>
> +
> +--- cacao-0.98/src/mm/boehm-gc/mark_rts.c
> ++++ cacao-0.98/src/mm/boehm-gc/mark_rts.c
> +@@ -371,18 +371,7 @@ ptr_t p;
> +
> + ptr_t GC_approx_sp()
> + {
> +-    VOLATILE word dummy;
> +-
> +-    dummy =3D 42;       /* Force stack to grow if necessary.    Otherwi=
se
the   */
> +-              /* later accesses might cause the kernel to think we're *=
/
> +-              /* doing something wrong.                               *=
/
> +-#   ifdef _MSC_VER
> +-#     pragma warning(disable:4172)
> +-#   endif
> +-    return((ptr_t)(&dummy));
> +-#   ifdef _MSC_VER
> +-#     pragma warning(default:4172)
> +-#   endif
> ++    return __builtin_frame_address(0);
> + }
> +
> + /*
> +--
> +2.1.4
> +
> --
> 2.1.4
>

Nice, I've been trying to find this one for a while. I knew there was
probably some UB somewhere, I just couldn't find it.

> ---------------------------------------------------------------------
> Intel Finland Oy
> Registered Address: PL 281, 00181 Helsinki
> Business Identity Code: 0357606 - 4
> Domiciled in Helsinki
>
> This e-mail and any attachments may contain confidential material for
> the sole use of the intended recipient(s). Any review or distribution
> by others is strictly prohibited. If you are not the intended
> recipient, please contact the sender and delete all copies.
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

