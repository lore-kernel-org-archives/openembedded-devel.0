Return-Path: <martin.jansa@gmail.com>
Received: from mail-yb0-f194.google.com (mail-yb0-f194.google.com
	[209.85.213.194])
	by mail.openembedded.org (Postfix) with ESMTP id ABEA471C14
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Jun 2017 19:48:33 +0000 (UTC)
Received: by mail-yb0-f194.google.com with SMTP id 202so1886017ybd.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Jun 2017 12:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sUg/wqByWeVPeDH9E/G/awn49MclCBzFchcYDIzl0OU=;
	b=TWsb9vO4Koc2W/vliTWlvSAKfjyYC2v3CE2blCXeFDaXpzg1fg/fFsU1yUJE77uPJa
	kZSPbjDYG2AwasMIxTScN+EO7Tu2SiEv4pGbPzZnSlpP/E2spspSAXv1itLbeHH09H0K
	CCF04kxCTvR7J9qQ9vHm7QcoVfEr9MSLXU2zwtUfipyS4lER90K4zbHl64cq5AyZVROH
	ktwF2S4ZudOVoyDTK26SHiqLd3fEzcwIZOhaTOv+OsCJy9hEXB87eGp4pESuU+OuYUmJ
	TMcu1RVsWCsrUhrh5KPFrX4V52X9WYblXFs297OIHs7xFUJZFI1mGuq1sOk2920JzfMP
	YaDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sUg/wqByWeVPeDH9E/G/awn49MclCBzFchcYDIzl0OU=;
	b=tX3p1SLV+qiQH6AIq9DUEDwGFpyEtCjt5wZe+nq/TxBwiLbf7uL42JAW5kNIRJcoZM
	dBRX+n42UsvgW8/jsw2HuNAZ6wX+phzjq5N5h4m2iMrWt5oC6XlNCOwYQMZl3MSPcD62
	cGTXdB/hFrFfyKhACmviH60V7tfz5oqcgrQzjsJOE2GtKFFwqVWynzMgmHvKtUos2o9X
	SNSCS1VIvZ954+bWEdLPS7sNpkuzUZvWK/KEogUIoUtgHnsZPlmLjQ8teb2ubRAIe/OT
	H1RgB4mm9cgPV254WXfGMQsABOXTFF43/kassI+DT3OYz5Xwce6gLbuyLlkbXwJV8il4
	820A==
X-Gm-Message-State: AODbwcCkAJx/HjgFAaFbMZSlTUUr00Irst17omLss+MJxlOY9pXLla90
	p1BnliQOwKBKQnUEV81EEudzjLTPOA==
X-Received: by 10.37.32.195 with SMTP id g186mr13023251ybg.109.1496951314414; 
	Thu, 08 Jun 2017 12:48:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.181.204 with HTTP; Thu, 8 Jun 2017 12:48:33 -0700 (PDT)
In-Reply-To: <1496722041-19402-1-git-send-email-liu.ming50@gmail.com>
References: <1496722041-19402-1-git-send-email-liu.ming50@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 8 Jun 2017 21:48:33 +0200
Message-ID: <CA+chaQcH8DmvqNZ5KgvHOR+YpK2vWYyAAq6UJ9b76Yu-0Ti=Gw@mail.gmail.com>
To: Ming Liu <liu.ming50@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe] [PATCH] librcf: fix a clang compiling issue
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
X-List-Received-Date: Thu, 08 Jun 2017 19:48:33 -0000
Content-Type: text/plain; charset="UTF-8"

http://errors.yoctoproject.org/Errors/Details/144182/

On Tue, Jun 6, 2017 at 6:07 AM, <liu.ming50@gmail.com> wrote:

> From: Ming Liu <peter.x.liu@external.atlascopco.com>
>
> A error was observed with clang compiler, as follows:
> | src/RCF/RCF.cpp:49:
> | src/RCF/ClientStub.cpp:28:
> | include/RCF/Future.hpp:49:26: error: 'enrol' is a private member of
> 'RCF::ClientStub'
>
> it can be fixed by declaring Future as a friend class of ClientStub.
>
> Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
> ---
>  ...lientStub.hpp-fix-a-clang-compiling-issue.patch | 35
> ++++++++++++++++++++++
>  meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb  |  1 +
>  2 files changed, 36 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/
> librcf/librcf/0001-ClientStub.hpp-fix-a-clang-compiling-issue.patch
>
> diff --git a/meta-oe/recipes-devtools/librcf/librcf/0001-ClientStub.
> hpp-fix-a-clang-compiling-issue.patch b/meta-oe/recipes-devtools/
> librcf/librcf/0001-ClientStub.hpp-fix-a-clang-compiling-issue.patch
> new file mode 100644
> index 0000000..3b39fa1
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/librcf/librcf/0001-ClientStub.
> hpp-fix-a-clang-compiling-issue.patch
> @@ -0,0 +1,35 @@
> +From d78851b6f87f2472f041102d7b3726ffc009bfad Mon Sep 17 00:00:00 2001
> +From: Ming Liu <peter.x.liu@external.atlascopco.com>
> +Date: Tue, 6 Jun 2017 05:54:20 +0200
> +Subject: [PATCH] ClientStub.hpp: fix a clang compiling issue
> +
> +A error was observed with clang compiler, as follows:
> +| src/RCF/RCF.cpp:49:
> +| src/RCF/ClientStub.cpp:28:
> +| include/RCF/Future.hpp:49:26: error: 'enrol' is a private member of
> 'RCF::ClientStub'
> +
> +it can be fixed by declaring Future as a friend class of ClientStub.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
> +---
> + include/RCF/ClientStub.hpp | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/include/RCF/ClientStub.hpp b/include/RCF/ClientStub.hpp
> +index 9882cf4..8465625 100755
> +--- a/include/RCF/ClientStub.hpp
> ++++ b/include/RCF/ClientStub.hpp
> +@@ -372,6 +372,8 @@ namespace RCF {
> +
> +     private:
> +
> ++        template<typename U>
> ++        friend class Future;
> +         friend class FutureImplBase;
> +
> +         template<
> +--
> +2.7.4
> +
> diff --git a/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb
> b/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb
> index 51ad7ec..05ffa7a 100644
> --- a/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb
> +++ b/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb
> @@ -13,6 +13,7 @@ LIC_FILES_CHKSUM = "file://license.txt;md5=
> 137c2935b51c95068a8b1bbd434ffe2d"
>  SRC_URI = "http://www.deltavsoft.com/downloads/RCF-${PV}.tar.gz \
>             file://0001-Add-CMake-build-files.patch \
>             file://aarch64-support.patch \
> +           file://0001-ClientStub.hpp-fix-a-clang-compiling-issue.patch \
>            "
>
>  SRC_URI[md5sum] = "7ecb3c73f7eb66dba8790b659374f690"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

