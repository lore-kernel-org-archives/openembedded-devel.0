Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f52.google.com (mail-oi0-f52.google.com
	[209.85.218.52])
	by mail.openembedded.org (Postfix) with ESMTP id 7EE2C74D2B
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Jul 2018 09:53:01 +0000 (UTC)
Received: by mail-oi0-f52.google.com with SMTP id q11-v6so9158492oic.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Jul 2018 02:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=fFuDst0aKn8szwuuHpLcG/e1bMyzQ69wFBnHVYRDIoE=;
	b=ZQdOFUkZQJ3OFhzGHVg9Tt+0tu3e+WS7yP0iVULZyvrkVDb8HuxoxhJtPCyiYymlwE
	aw1tBju1IXm+CaYgpc4osa8zmfX6/PnHNl/3xhr4bPWoxe+yC24ZmLj2BosEd4nX7Wdn
	iqDC+tcY8lfxwQhZthLnKCOht98GNweNy2WC4QOm5mCPtI28c+xFP34EBPHUi4IKNJRv
	yXCaW4jIedb6aBqFNA7dn+BATWVU5xWF0/ZpJ3LFCbz2vieZMuxWXyw01SlSh+9jR8t/
	YdyitqRM8UkONd4doe7k3SLcPEu2E8C++W0e0/bhR3CymPRu+6MgQsIOTv9t/bwwbq+x
	QElQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=fFuDst0aKn8szwuuHpLcG/e1bMyzQ69wFBnHVYRDIoE=;
	b=Dp7KEy0IR35AEYXmWiM8OiCFRJO9yOksT9sW828X7MlcwwFhUNi9C2iUVEy3NMnjnP
	jHohePjDOjfsPMsoDLx4U3zTq/ZDRSYe2a6j7H9XoLikgk3Q1/7cGuQRwZPHYtQACUQu
	YFKLmpHo4LusdF/mNVAbKRtndmYuHWMcmBqYyxc0KzGLEODjtukisi2kDnu0SW5fAgW/
	k4vQCUKrdMlGV5YIvfecNskPj+eSKagRUDUcb9jqghlNDJ5T4OjO8F3QK71KDiOb+nNl
	hym5ki6D6jArrkb4a26uGxH0k1od9R1ffNV9qTT8XcKmJ7/e++gxNU6wG/80E0T8Ggl7
	kJxQ==
X-Gm-Message-State: APt69E0hqyTiVgCwaWaOMK1K+gkGRCBnKp+YUx7xo8imNxEs9hjhApqa
	3CNeCohnekeDX+JUZoubB34BVN+YJBCp/WpAEVlcxg==
X-Google-Smtp-Source: AAOMgpe1mv2hcMitzEB16b28teH/aQkKJiPO2cyV6qtRAtubfvWzgrlG1megJhr8XpkFBnMcF95dBuMbToUJqskMopM=
X-Received: by 2002:aca:f409:: with SMTP id
	s9-v6mr23595629oih.102.1531129982450; 
	Mon, 09 Jul 2018 02:53:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6845:0:0:0:0:0 with HTTP;
	Mon, 9 Jul 2018 02:52:41 -0700 (PDT)
In-Reply-To: <20180708080640.39121-2-raj.khem@gmail.com>
References: <20180708080640.39121-1-raj.khem@gmail.com>
	<20180708080640.39121-2-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 9 Jul 2018 10:52:41 +0100
Message-ID: <CAJTo0LYmnfFkq6bVsQ47TCwvYgbE6OUnZRQUg5h5hR69tDht-w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH 2/2] python3-lxml, python3-pandas, python3-protobuf: Set CLEANBROKEN
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
X-List-Received-Date: Mon, 09 Jul 2018 09:53:01 -0000
Content-Type: text/plain; charset="UTF-8"

The lxml failure can be fixed with a tweak to the class, so I'll run
the tweak through all of meta-python to see if it regresses anything
else.  Please hold this off until I report back.

Ross

On 8 July 2018 at 09:06, Khem Raj <raj.khem@gmail.com> wrote:
> The distutils class got a clean via "setup.py clean", but these
> recipes doesn't support this yet so disable clean target during
> configure
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-python/recipes-devtools/python/python3-lxml_4.2.3.bb     | 1 +
>  meta-python/recipes-devtools/python/python3-pandas_0.23.1.bb  | 1 +
>  meta-python/recipes-devtools/python/python3-protobuf_3.6.0.bb | 1 +
>  3 files changed, 3 insertions(+)
>
> diff --git a/meta-python/recipes-devtools/python/python3-lxml_4.2.3.bb b/meta-python/recipes-devtools/python/python3-lxml_4.2.3.bb
> index ff4bc7faad..b95d7bae71 100644
> --- a/meta-python/recipes-devtools/python/python3-lxml_4.2.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-lxml_4.2.3.bb
> @@ -1,2 +1,3 @@
>  inherit setuptools3
>  require python-lxml.inc
> +CLEANBROKEN = "1"
> diff --git a/meta-python/recipes-devtools/python/python3-pandas_0.23.1.bb b/meta-python/recipes-devtools/python/python3-pandas_0.23.1.bb
> index b5dd5e0924..c1e57189cf 100644
> --- a/meta-python/recipes-devtools/python/python3-pandas_0.23.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-pandas_0.23.1.bb
> @@ -1,2 +1,3 @@
>  inherit setuptools3
>  require python-pandas.inc
> +CLEANBROKEN = "1"
> diff --git a/meta-python/recipes-devtools/python/python3-protobuf_3.6.0.bb b/meta-python/recipes-devtools/python/python3-protobuf_3.6.0.bb
> index 781d1dc4da..53d5528c4b 100644
> --- a/meta-python/recipes-devtools/python/python3-protobuf_3.6.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-protobuf_3.6.0.bb
> @@ -1,2 +1,3 @@
>  inherit setuptools3
>  require python-protobuf.inc
> +CLEANBROKEN = "1"
> --
> 2.18.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

