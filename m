Return-Path: <otavio.salvador@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 96C1660034
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Apr 2015 00:31:36 +0000 (UTC)
Received: by wixo5 with SMTP id o5so39800362wix.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Apr 2015 17:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=/QKz7aTsX5NyJfFSUotsCPLHboTo3VnrBMjZt6i8lUc=;
	b=Thr4A12HIAGcMmwyOCTL+FQGI0mREOrMYhf6c4T4jcvqO/TJIZxyQkGGteVxMI7JZ5
	23skARd0IJkkcQj/7OGlk3gv9GzbS8rchLSp4DZWQou7XuBWaQi0T+ikLx06MqQB+qQd
	Nafc0GRWE8bWrONbWoVCsxBONRQ/DrGZWyYZZh6XG9Rtq7tJUwf+BWaPYkQstPCL4ECg
	O4UpPkK5cg4amZeOe2lwJXgzPh5K26xPt3W5m76Gc69YPCdKHmPMlJiSynBXXz3SdGOj
	MxFVLSZtGFkIqDIvihZAb1qQdfWgZErM12mNcFPICyKUv/rHtoQGCI58Bfg/it+MKVFT
	4Qfw==
MIME-Version: 1.0
X-Received: by 10.181.13.146 with SMTP id ey18mr19069784wid.21.1427934697997; 
	Wed, 01 Apr 2015 17:31:37 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.27.131.224 with HTTP; Wed, 1 Apr 2015 17:31:37 -0700 (PDT)
In-Reply-To: <1427927005-7808-2-git-send-email-gary.robertson@linaro.org>
References: <CA+chaQdOQKZRW7QH0qHS-ta8+oZDspRVGguF3iMDgOyrPAxg_Q@mail.gmail.com>
	<1427927005-7808-1-git-send-email-gary.robertson@linaro.org>
	<1427927005-7808-2-git-send-email-gary.robertson@linaro.org>
Date: Wed, 1 Apr 2015 21:31:37 -0300
X-Google-Sender-Auth: JuvC-k-PPma50agv-WwS2LS3TNg
Message-ID: <CAP9ODKpZOQRq8zPth=Svap7v8GuzOT739aGhSRe4uzJKjkrP6g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] libhugetlbfs: Add i586 to list of compatible host architectures
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
X-List-Received-Date: Thu, 02 Apr 2015 00:31:39 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Apr 1, 2015 at 7:23 PM, Gary S. Robertson
<gary.robertson@linaro.org> wrote:
> COMPATIBLE_HOST included support for x86_64 but not for
> 32-bit x86 architectures - added i586 arch name to cover qemux86, etc.
>
> Upstream-Status: Inappropriate - OE recipe change only

This field is used in patch files, not commit log of the Git changes. Drop this.

> Signed-off-by: Gary S. Robertson <gary.robertson@linaro.org>
> ---
>  meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> index 4ce6a19..6fe5dce 100644
> --- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> +++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> @@ -24,7 +24,7 @@ SRC_URI = "git://git.code.sf.net/p/libhugetlbfs/code \
>
>  S = "${WORKDIR}/git"
>
> -COMPATIBLE_HOST = "(x86_64|powerpc|powerpc64|aarch64|arm).*-linux*"
> +COMPATIBLE_HOST = "(i586|x86_64|powerpc|powerpc64|aarch64|arm).*-linux*"
>
>  LIBARGS = "LIB32=${baselib} LIB64=${baselib}"
>  LIBHUGETLBFS_ARCH = "${TARGET_ARCH}"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

