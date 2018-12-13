Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 540F86C45F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Dec 2018 15:27:50 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id y20so2497814qtm.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Dec 2018 07:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=l2DGoZIU0OrexW8/AMhUcYI22tgEYbMDSKSR2fj2lJk=;
	b=nlidGBP2E+eB6pLN0WHba6hH7Og0bWh1mvMo4XIibwMfXANyv0GvVGRFN4yPK95ySM
	esVXyE31UJpMYKA079xTl54CEHKP4UUGBZWnEgQICU+o6FTlGtIAaxzlzhssNQ+3YJgv
	5rlKCmonb7m0T9xUotUue4iKEI+cnzf80Ct1CvXeWaHE/N1NVNaIuU+ksWNUufqwCGu6
	BBoBY7MsNwCmBvyiG+X3EqSJghXZY7RQIpQZVB+8sxQl4V/YFR0az04e1rqiT3F55yHU
	VsQaw90q0NBnDJ7D/H4gf3QByHlNwf+B+YdJFWpqWbozxtpRoRJU0N/lKkWOY2FGkw/e
	v5Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=l2DGoZIU0OrexW8/AMhUcYI22tgEYbMDSKSR2fj2lJk=;
	b=ZdVIUuSlTHNp5KAsGRLtSJQvNZ4H+oNtqTy2I9n55lLvr613EJ8eaVn0jrCL8wsKvZ
	+zhYZ33cfjHYh4/kfHm0duP3lAOAzaIGtxifwgNzx++QD+yLFITv60YUHPyjCQNaQzr3
	OccdSclV4ZfAUG5xUzh5k32h7CAxNgddAbsYPWXWm5kAjGqgaedpVj8gpf0NmUBg0xl7
	I9/l8QUVL0Cq4J0uslF4NbZjmwaTFCxZ6bwvoCzqZMJdtxCIUxvSI4FiAd707D6w0p4/
	AKTa/76jVLmsap43HHFuidhoBReHJ6O/J6sbNVvASjlqq1WCjvri1a4pQrwuTK2pB5nC
	e7QA==
X-Gm-Message-State: AA+aEWakIw2QkZpf/sFLUcZrgnIHtTqYOI5g03DQJseOPhV869C/Ap9d
	LihJEpjYZAgtULLwLTRbFTiKNAG7RnOyZvu5fZM=
X-Google-Smtp-Source: AFSGD/XLprn6OifHXgD1kqq24/AGYTsySbN0bBc2ORRLOR897ItVbCDK6UYKgzXvQQcTdy3PfyYScN40fEFZxt9dImE=
X-Received: by 2002:ac8:36ba:: with SMTP id a55mr23980766qtc.236.1544714870967;
	Thu, 13 Dec 2018 07:27:50 -0800 (PST)
MIME-Version: 1.0
References: <20181213151533.13730-1-paolo.valente@linaro.org>
In-Reply-To: <20181213151533.13730-1-paolo.valente@linaro.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Dec 2018 07:27:24 -0800
Message-ID: <CAMKF1srK53HOyMG4+773eELKOigsqHwK0-bMkQnZagwR1gYssw@mail.gmail.com>
To: paolo.valente@linaro.org
Cc: ulf.hansson@linaro.org,
	openembeded-devel <openembedded-devel@lists.openembedded.org>,
	broonie@linaro.org
Subject: Re: [meta-oe][PATCH] s-suite: push SRCREV to version 3.0
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
X-List-Received-Date: Thu, 13 Dec 2018 15:27:50 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 13, 2018 at 7:16 AM Paolo Valente <paolo.valente@linaro.org> wrote:
>
> Signed-off-by: Paolo Valente <paolo.valente@linaro.org>
> ---
>  meta-oe/recipes-benchmark/s-suite/s-suite_git.bb | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb b/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
> index 77d172814..166f3000a 100644
> --- a/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
> +++ b/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
> @@ -2,7 +2,7 @@ SUMMARY = "Small collection of benchmarks for storage I/O"
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=b529aaa6a0c50f15d29f89609b5c22f3"
>
> -SRCREV = "79698f645bfb28d0d966484ddad3a1efb562246d"
> +SRCREV = "e2727f70ed79b5461689c062a4a66a87f1adb4ce"
>  PV = "0.0+git${SRCPV}"
>  SRC_URI = "git://github.com/Algodev-github/S.git;protocol=https;branch=master"
>
> @@ -21,7 +21,8 @@ do_install() {
>      install -m0755 ${S}/def_config_params.sh ${D}/opt/S-suite
>  }
>
> -RDEPENDS_${PN} = "bash bc coreutils gawk g++ gcc fio libaio libaio-dev sysstat"
> +RDEPENDS_${PN} = "bash bc coreutils gawk g++ gcc fio libaio libaio-dev sysstat \
> +                 psmisc git"

why these new rdeps
>
>  FILES_${PN} = "/opt/S-suite/"
>
> --
> 2.16.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

