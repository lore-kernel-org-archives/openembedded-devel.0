Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 1297879307
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Aug 2018 09:44:31 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id q8-v6so6856673wmq.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Aug 2018 02:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Z0kcUHFBoFh/FMElQF0VTuPFQvUSjNnQQVQPFPb8rYg=;
	b=MhIpmlx2uUQVK3b7qDmQQlqeVVL4PHQEGQSitqegsLhbNN30zLQQVFk+dO28xw0yYT
	7qSy0BJe9m8+q61VhMnjcKnasgQbVHIG4Ie6dOx+rP80pPnNEd9MedPr8u2jBbP9lSaJ
	QHrz6tZ8J2cHGPdoRsMKD3qjS/4s6FJoFuFzbAq3As8y6DoJdZLLrJk4ehRfKYBQUHS3
	hw/fqTLzSzHkPNE6hdJXpQuJ2ho0F1+vS8At+OVkYEj+rgciURoVm3DgCyJ3+mp1tZfQ
	B2oM9R31ZqsUpLZ9NZWLWsrV7OXov/XhdFh7ljUUwhRCksqoYQwQ1erLY4sUaRGRhBe1
	593Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Z0kcUHFBoFh/FMElQF0VTuPFQvUSjNnQQVQPFPb8rYg=;
	b=ljR8BwKXzpoGv4TjKmES83H7Pgxr2tupybbkqzf3AO58KLBx4w72G7BpVwSBwxLUey
	EPlldjrS6n8xXztHEOnkyOtcq3ZEpnarqD666o+TVcHSj4lXMqyGVLe/n391ZE3FbfNy
	Wjv1H9Da7lY0HOvcLH5Pa1d/D68u/j0HJ2W0Q6XMUNG+f0rP5BLcX+ADB1MlQLckNg2n
	Z5vYSUeJS3t1AXJjZ5kbb3D3y8PtVJlFJzcQuDm6v+dlSaHh6zeJG0bk2BfLEc2CdzrX
	9EYPuqnxvUBJyn0haaet2kPG/WeBx3e7UMxRrPyRIXCd8SAZ2a5nMv151/ZgA4GmbE25
	hr+g==
X-Gm-Message-State: AOUpUlFVdtgpNJjnHLburB68SStXhUY2f54fuGR1mWJB+V9VeGRQsC60
	8cb4Mny/3DQgNJcLM4ObQghuGpEX3HzLP41Irj4=
X-Google-Smtp-Source: AA+uWPyreS0WN/J+wr3tWeyz33Fu7y+T+dLjJdqsd5jPHcXja/vFjUHLMHIlig9F4U8mzrNJCdF0xyjmuaWZAiFKzbQ=
X-Received: by 2002:a1c:8c08:: with SMTP id
	o8-v6mr17349624wmd.60.1534499072642; 
	Fri, 17 Aug 2018 02:44:32 -0700 (PDT)
MIME-Version: 1.0
References: <1534499269-29908-1-git-send-email-dengke.du@windriver.com>
In-Reply-To: <1534499269-29908-1-git-send-email-dengke.du@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 17 Aug 2018 11:44:20 +0200
Message-ID: <CA+chaQev7OU47E-bV+x4OX9ZVgE7ZGX8ZWg1h27e-rVkPQ9Ayw@mail.gmail.com>
To: Dengke Du <dengke.du@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/2] kernel-selftest: compatible with latest kernel
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
X-List-Received-Date: Fri, 17 Aug 2018 09:44:32 -0000
Content-Type: text/plain; charset="UTF-8"

see
http://lists.openembedded.org/pipermail/openembedded-devel/2018-August/120021.html

On Fri, Aug 17, 2018 at 11:37 AM Dengke Du <dengke.du@windriver.com> wrote:

> From: "Hongzhi.Song" <hongzhi.song@windriver.com>
>
> There are some new program added for bpf. So we make corresponding
> modifications.
>
> Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
> ---
>  meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
> b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
> index 27d98a3..d5ccace 100644
> --- a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
> +++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
> @@ -79,7 +79,7 @@ do_configure() {
>      :
>  }
>
> -do_patch[prefuncs] += "copy_kselftest_source_from_kernel
> remove_clang_related"
> +do_patch[prefuncs] += "copy_kselftest_source_from_kernel remove_unrelated"
>  python copy_kselftest_source_from_kernel() {
>      sources = (d.getVar("KERNEL_SELFTEST_SRC") or "").split()
>      src_dir = d.getVar("STAGING_KERNEL_DIR")
> @@ -94,8 +94,9 @@ python copy_kselftest_source_from_kernel() {
>              bb.utils.copyfile(src, dest)
>  }
>
> -remove_clang_related() {
> -       sed -i -e '/test_pkt_access/d' -e '/test_pkt_md_access/d'
> ${S}/tools/testing/selftests/bpf/Makefile
> +remove_unrelated() {
> +       sed -i -e '/test_pkt_access/d' -e '/test_pkt_md_access/d' -e
> '/sockmap_verdict_prog/d' ${S}/tools/testing/selftests/bpf/Makefile
> +       sed -i '/llc/d' ${S}/tools/testing/selftests/bpf/Makefile
>  }
>
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

