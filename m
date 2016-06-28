Return-Path: <ticotimo@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id 718ED60119
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jun 2016 14:56:45 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id w130so2096247lfd.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jun 2016 07:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=6dvz1o9adjdFxqRxGe+U5BPxOHqNIYrqmtL+YTYDEDQ=;
	b=iZIr6SQgjOKKcAlllUUg5uAKB2i1jw+0ngXCFXbCE2H75ij2qeQXxhLSK7EBBJR8kI
	vY7dGt3jD5gCOOestZ2/5/4zpSztj2wd1qCLqX1n9hGz0Mp6675fgg5Bk2BS18aaM0iW
	XaXxTUyYDkw9J4K8bcjI97+rQR/v7+aCPH94OQFzKJv0O4ueulbKMi4N8pZZrCZwKKiR
	F/Pt0KCcAZ5iE0lUdgcFtLYgixQuLIX3AXQc9V6/zhQu9oGe+hTIRIQFsJSlP2Z+601U
	tvM0hgCi3WjtYdZrG8ieNPHigoJmpj8gfTy6gwPmxa3u6knzfakKDrTq0HwAg7ZfE0UA
	hAOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=6dvz1o9adjdFxqRxGe+U5BPxOHqNIYrqmtL+YTYDEDQ=;
	b=RvPQMjSpq5nesTqsbKw5cxZzus3ISCSN0J+Lda1Nptwi/qNBAS7lBz4i3U9PqD6RR7
	scVWhtUGeE3GNzqN1+yLrvw+rHSprpizNvD1uBtdUMjly665AXB67ymUyPy5z+GUwku9
	84NvSGKn20qzQef8Iu3hFlNYTTHmPc4kpu/jN60BtXVpG1y3rIb5oVtWRxOTqoPlD+xb
	JbQh330oCRuIfOa4RAjgY8j4Ew0JZ4vZ/wJ+2QKClvBgIguvXBSXwR2D2ud5Jwz0zuuK
	PAvkYByqgPpW20nm+WaYxkkWAJbGD50juAXj8+wifZOh7WHkp4GcssI7zVb0EIW56D2V
	hXcA==
X-Gm-Message-State: ALyK8tIso9dDSvLacBo8JzDUDLoObWTUvt9P8zsSu5wo8I0SvmjGd7Af4Fpuy2HE2ZPoQfuvpVoUh5TPogQgjw==
X-Received: by 10.25.4.202 with SMTP id 193mr1377344lfe.204.1467125805615;
	Tue, 28 Jun 2016 07:56:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.23.39 with HTTP; Tue, 28 Jun 2016 07:56:45 -0700 (PDT)
In-Reply-To: <1467102993-4925-3-git-send-email-mingli.yu@windriver.com>
References: <1467102993-4925-1-git-send-email-mingli.yu@windriver.com>
	<1467102993-4925-3-git-send-email-mingli.yu@windriver.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Tue, 28 Jun 2016 07:56:45 -0700
Message-ID: <CANx9H-BvJ1ONU6ebaEYR8NSaNdYhAioMuMxNmE6ntWTBn7ZBYQ@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH 2/3] python-pbr: add python-pbr bb
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
X-List-Received-Date: Tue, 28 Jun 2016 14:56:46 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jun 28, 2016 at 1:36 AM, <mingli.yu@windriver.com> wrote:

> From: Mingli Yu <mingli.yu@windriver.com>
>
> * Add python-pbr bb file as python-mock depends on
>   python-pbr-native
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  .../recipes-devtools/python/python-pbr_1.10.0.bb   | 22
> ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/
> python-pbr_1.10.0.bb
>
> diff --git a/meta-python/recipes-devtools/python/python-pbr_1.10.0.bb
> b/meta-python/recipes-devtools/python/python-pbr_1.10.0.bb
> new file mode 100644
> index 0000000..4a08bde
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-pbr_1.10.0.bb
> @@ -0,0 +1,22 @@
> +DESCRIPTION = "Python Build Reasonableness: PBR is a library that injects
> some useful and sensible default behaviors into your setuptools run"
> +HOMEPAGE = "https://pypi.python.org/pypi/pbr"
> +SECTION = "devel/python"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
> +
> +SRCNAME = "pbr"
> +
> +SRC_URI = "
> https://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz
> "
>

You don't need to do this if you inherit pypi.


> +
> +SRC_URI[md5sum] = "8e4968c587268f030e38329feb9c8f17"
> +SRC_URI[sha256sum] =
> "186428c270309e6fdfe2d5ab0949ab21ae5f7dea831eab96701b86bd666af39c"
> +
> +S = "${WORKDIR}/${SRCNAME}-${PV}"
> +
> +inherit setuptools
> +
> +DEPENDS_class-target += " \
> +        python-pip \
> +        "
> +
> +BBCLASSEXTEND = "native"
> --
> 2.8.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

