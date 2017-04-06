Return-Path: <raj.khem@gmail.com>
Received: from mail-wr0-f178.google.com (mail-wr0-f178.google.com
	[209.85.128.178])
	by mail.openembedded.org (Postfix) with ESMTP id F3F2371A3E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Apr 2017 01:14:40 +0000 (UTC)
Received: by mail-wr0-f178.google.com with SMTP id w11so36364142wrc.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Apr 2017 18:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=V78VMKHGtz6CGeL3YOCb9fFghAI+ql7jYueZmkOg31k=;
	b=iL6o4MREfjF7ThzABrbOm7GszTfh75v2wR2MdJ3BZGhLgoBLoL8tUOa3Vnu5B+QLz1
	E/gNZVHuI211B01EyuVPq9Inzw7azBZmHoxVh6+Zz95uRmWjOEOs77T/7RYlnYjkfXdX
	PAh49a73sLYHkCOjRiKFLDmabT1yDX7YmoakVgA/aDY8g9DbR2s8U62kQU4ojnLgYvwr
	vRLtCHAoGG1r1Xa5atCH/3abvd2ZNwgsv3JsygaWYpcouVtj50LVXXWLcwIwStUGX872
	GPF0CvX+OQwnrHt5No3tbwUYRn1UTvIa2QQEQFARTaa4c6OiN4/pklMywmqy8rBxBm49
	9BJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=V78VMKHGtz6CGeL3YOCb9fFghAI+ql7jYueZmkOg31k=;
	b=JSSaUSeF0ukPRwwdmhKw5Kb6ods8P2h4JuJ0JQAzFnFY1J3ZcEnpLBAhSRgI8XyvI7
	0sbEEFVhR+7Vr+JTNY3Hcvvdzw9+QlYb0CdjYcUvsdiZI/UNP17ZQG+IFV+Ap+0MC5Io
	8Pks3uBLr5E+l39XhVfI+C16BO9fEJX1nN80HRkd0LT5vBiB2x7Xg9Ve5g7kkdqTUh0z
	4JRPEmBjDYOtutrMeIv+hNRiJLNHErKEesqlxUZd3GYZIoOzRCteNf6KG2M0EhK8w2S0
	OBHaxBycZW9lU1S05J/2ZDtZJqbVfcINooos9pygm6QLeOTL3WbrRfuEe6Uvd3E0xRjV
	2bwA==
X-Gm-Message-State: AFeK/H1sSiFrJuBUk1IeotFev2vFWr3BK2oWfRK1Mt6gk2tgM1aHWygI
	7EMGMow1vRob6sWWawxnbPqyLfYvHw==
X-Received: by 10.28.45.212 with SMTP id t203mr20226167wmt.37.1491441281682;
	Wed, 05 Apr 2017 18:14:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.180.162 with HTTP; Wed, 5 Apr 2017 18:14:11 -0700 (PDT)
In-Reply-To: <20170406011225.25591-1-andrej.rode@ettus.com>
References: <20170406011225.25591-1-andrej.rode@ettus.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 5 Apr 2017 18:14:11 -0700
Message-ID: <CAMKF1sqSvhmEf06V-EHgfQG1kno9Czhf-sv0k8oCi3iHR+qUmw@mail.gmail.com>
To: Andrej Rode <andrej.rode@ettus.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH] systemd-python: add a new recipe
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
X-List-Received-Date: Thu, 06 Apr 2017 01:14:41 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Apr 5, 2017 at 6:12 PM, Andrej Rode <andrej.rode@ettus.com> wrote:
> Adds new recipe for systemd-python, python bindings for libsystemd
>
> Signed-off-by: Andrej Rode <andrej.rode@ettus.com>
> ---
>  meta-python/recipes-devtools/python/systemd-python_234.bb | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/systemd-python_234.bb
>
> diff --git a/meta-python/recipes-devtools/python/systemd-python_234.bb b/meta-python/recipes-devtools/python/systemd-python_234.bb
> new file mode 100644
> index 0000000..4cfa629
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/systemd-python_234.bb
> @@ -0,0 +1,11 @@
> +SUMMARY = "Python interface for libsystemd"
> +HOMEPAGE = "https://github.com/systemd/systemd-python"
> +LICENSE = "LGPLv2+"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4fbd65380cdd255951079008b364516c"
> +DEPENDS += "systemd"
> +RDEPENDS_${PN} += "systemd"

here it seems to me that inheriting systemd bbclass based solution would
be more appropriate here.

> +
> +SRC_URI[md5sum] = "5071ea5bcb976186e92a3f5e75df221d"
> +SRC_URI[sha256sum] = "fd0e44bf70eadae45aadc292cb0a7eb5b0b6372cd1b391228047d33895db83e7"
> +
> +inherit pypi setuptools
> --
> 2.10.2
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

