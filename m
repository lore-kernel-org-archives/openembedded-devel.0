Return-Path: <ticotimo@gmail.com>
Received: from mail-ua0-f179.google.com (mail-ua0-f179.google.com
	[209.85.217.179])
	by mail.openembedded.org (Postfix) with ESMTP id E66C0789F7
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Mar 2018 13:40:05 +0000 (UTC)
Received: by mail-ua0-f179.google.com with SMTP id b23so1395603uak.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Mar 2018 05:40:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=14Dq8TpBMFtTbHRrqFOln36wW5Cv0l3O51n/7yuima0=;
	b=s5G24piPLy1xTdOB+gLvFF076NNTSmCDWCbjwzvfnNm5w5+qur9YrydAD1iDYNHlRj
	m5zTrMFF3/jGgcdbbGXSAl3a7pvTwSruWP+kuyYDMZ4BWC+ZgNRYMlJv8hGiHsUkgD54
	pyDNEtKtNzTC2UTHBJr7Sg2oio8tbPYnI8wjtCU5loFC6Q8ZZPt9bzcSmcO3NUOmeroC
	b54Hy8ZL8kNR9Dw+6ffbJYBH6WjvPTK8Qw5TCZNuCB6Z0d4TFkvXrS0GRIfJ17SwYtDk
	wOdEFu+EA8slUGzw97NxQpGt+072h7QipNsJHl0OTgWG5wkW5q1zPi+NAvLjQxfkVNh3
	H3kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=14Dq8TpBMFtTbHRrqFOln36wW5Cv0l3O51n/7yuima0=;
	b=GU5XlbGW9QL2gRd7OMI4aotmWvq3LrYlppTs9f6XR2ale44hnDtbsHsaupda2nXpnH
	1KunqfDafNjwwcBgYw1cco4WRpm9dsfa80w6gEp/5QQn3IX+FdrBSZJ9ygyGxanj/RQ7
	w76k57ap1EQJLdluLPWj5ug03tZSltQI4iKcLBmy09eiqT7mlsjDnHGnyNNEyLKtb5if
	tCJAlnDAOweD97pRpWKh11o6lbEOVmjL8ylK77qCdZG8tLOuoHE02w1MC1QLX5QqxIC/
	Befjykf3WnGmJFmTtfPqFIaHvCUxfKJlwWC4CdYlDg7VKOL4afZPbOmVr6G/ood5c/VR
	wzcg==
X-Gm-Message-State: APf1xPBVgBAHaWMp5Um5LTvHq0FazkgRTlBJQan0e14nz9PCCvxA3SAd
	kj49PD+OEPi6WgFYjCQ2XWs8WRoINNTV1ZHUEvc=
X-Google-Smtp-Source: AG47ELtunuaTCkvwuMZHW9TF2aGDkw5LPJ+8AzAjQ3cKpc5frnv8syyvyP8taayIbhfgEq4FiD8MRVTOi71zJSoofGM=
X-Received: by 10.159.44.78 with SMTP id s14mr16334522uaj.86.1520430006596;
	Wed, 07 Mar 2018 05:40:06 -0800 (PST)
MIME-Version: 1.0
References: <1520385452-205564-1-git-send-email-hongxu.jia@windriver.com>
In-Reply-To: <1520385452-205564-1-git-send-email-hongxu.jia@windriver.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Wed, 07 Mar 2018 13:39:56 +0000
Message-ID: <CANx9H-CNoBQUc2_GmrcO8y5wCTQN-9Dr-u7=Dxv7kP9ScTLP1w@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-python][PATCH] python3-blivet: fix invoking dd timeout caused partition failed
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
X-List-Received-Date: Wed, 07 Mar 2018 13:40:06 -0000
Content-Type: text/plain; charset="UTF-8"

Can we make the default not be infinite timeout? You are solving a corner
case, special need with a default infinite timeout that may have unforeseen
side effects in the general case (like a system that never responds). Just
a thought. What does upstream think?
On Tue, Mar 6, 2018 at 5:18 PM Hongxu Jia <hongxu.jia@windriver.com> wrote:

> This large timeout is needed when running on machines with
> lots of disks, or with slow disks.
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  .../0014-invoking-dd-with-infinite-timeout.patch   | 31
> ++++++++++++++++++++++
>  .../python-blivet/python3-blivet_2.2.0.bb          |  1 +
>  2 files changed, 32 insertions(+)
>  create mode 100644
> meta-python/recipes-extended/python-blivet/python3-blivet/0014-invoking-dd-with-infinite-timeout.patch
>
> diff --git
> a/meta-python/recipes-extended/python-blivet/python3-blivet/0014-invoking-dd-with-infinite-timeout.patch
> b/meta-python/recipes-extended/python-blivet/python3-blivet/0014-invoking-dd-with-infinite-timeout.patch
> new file mode 100644
> index 0000000..12a9e4f
> --- /dev/null
> +++
> b/meta-python/recipes-extended/python-blivet/python3-blivet/0014-invoking-dd-with-infinite-timeout.patch
> @@ -0,0 +1,31 @@
> +From 92fe7dfd01131c93a9b2013cabf77d5f46900fab Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Tue, 6 Mar 2018 17:28:56 +0800
> +Subject: [PATCH] invoking dd with infinite timeout
> +
> +This large timeout is needed when running on machines with
> +lots of disks, or with slow disks.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + blivet/devices/partition.py | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/blivet/devices/partition.py b/blivet/devices/partition.py
> +index a7372fb..8947472 100644
> +--- a/blivet/devices/partition.py
> ++++ b/blivet/devices/partition.py
> +@@ -594,7 +594,7 @@ class PartitionDevice(StorageDevice):
> +         cmd = ["dd", "if=/dev/zero", "of=%s" % device, "bs=%d" % bs,
> +                "seek=%d" % start, "count=%d" % count]
> +         try:
> +-            util.run_program(cmd)
> ++            util.run_program(cmd, timeout=-1)
> +         except OSError as e:
> +             log.error(str(e))
> +         finally:
> +--
> +1.8.3.1
> +
> diff --git a/meta-python/recipes-extended/python-blivet/
> python3-blivet_2.2.0.bb b/meta-python/recipes-extended/python-blivet/
> python3-blivet_2.2.0.bb
> index cacca67..46dc32d 100644
> --- a/meta-python/recipes-extended/python-blivet/python3-blivet_2.2.0.bb
> +++ b/meta-python/recipes-extended/python-blivet/python3-blivet_2.2.0.bb
> @@ -23,6 +23,7 @@ SRC_URI = "git://
> github.com/rhinstaller/blivet;branch=2.2-devel \
>             file://0011-invoking-fsck-with-infinite-timeout.patch \
>             file://0012-invoking-mkfs-with-infinite-timeout.patch \
>             file://0013-Revert-Adapt-to-logging-module-name-change.patch \
> +           file://0014-invoking-dd-with-infinite-timeout.patch \
>  "
>
>  inherit distro_features_check
> --
> 1.8.3.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

