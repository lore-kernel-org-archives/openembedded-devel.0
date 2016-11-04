Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f193.google.com (mail-ua0-f193.google.com
	[209.85.217.193])
	by mail.openembedded.org (Postfix) with ESMTP id E4E096FF78
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Nov 2016 03:06:06 +0000 (UTC)
Received: by mail-ua0-f193.google.com with SMTP id b35so2680687uaa.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Nov 2016 20:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=E3qZTotmJwN2ENMyikGUGiEWN6ylQUw7aeikfGXTLwM=;
	b=LtQmnfOew+EAVgqkqgcC+zsgtexflHBjt6gJCJTIjtHz008i30nE2Ky2Y89OBtTxhj
	XCK8P6RxvXKdKRouLUE9vTWrgqC66Iy9x7Gbw+zf5UgCw6Olt4TrKtykdZ6WEJv2GOZ6
	RdlXpC9ZJLEPMudg87b9MoacHsM/2wnMwSCVNnrh1k2zI0+naX71nJ26sLQAzeV0Aaix
	nxGbIsSET3EfkFmgcyHTvP5nQZkNNhNsliEB0xJ85/QOzjAKNX0E/x9UC7u+xEKBlb1j
	CRk/sUjSAdVutsX4Y5skqaluIXvhS5NhkvSmfr0oUj2aYXvnPGbFvviu1/C+HOFbXE+1
	1XCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=E3qZTotmJwN2ENMyikGUGiEWN6ylQUw7aeikfGXTLwM=;
	b=Dq0OAnZbR134kZvTwQUhCJTTe1IfpKYP8FEudDv4Z4XR4MYRIVcQLzb/Dgd+I+EpKX
	yGcYdiHpeH8ETHOiErnrePPPljqYIZBSVXN4KMB/jqV5QTjLvytLWtxTWJauUxd7UrmM
	iuys/3jS+Rjdy1+8A+Jprf2QP1oc1dXI5ideF2RzKbJmio7Plt6Kf3fOkoGDHg/jhqIR
	SfaDqKJmGDrHr5tc+TEC6AO1jdk7hNozZK/VnatValgYVzj3DA9MdxFsgSIHxCEo2aQm
	0h3m3SHYrkc3YzVBeUvlIpEFVvorLbdqKW2qukJelX2g14VVE3D+HS0uXF0a+nJEM4N8
	Runw==
X-Gm-Message-State: ABUngvdCP1gcjEwEglOUPwHN7+I1YKh9H5Yr3dOyg/HxBSBXcw+5bKB4DfSr+nPfzYCsemtGOHgj2mx/f0WeZA==
X-Received: by 10.159.38.225 with SMTP id 88mr8753868uay.138.1478228768144;
	Thu, 03 Nov 2016 20:06:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.5.136 with HTTP; Thu, 3 Nov 2016 20:05:37 -0700 (PDT)
In-Reply-To: <1478225282-27345-1-git-send-email-timothy.t.orling@linux.intel.com>
References: <1478225282-27345-1-git-send-email-timothy.t.orling@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 3 Nov 2016 20:05:37 -0700
Message-ID: <CAMKF1spNzuAWTGU+S_n2v8PD8yZSz8OhRfj6NwZs_Qfu3rK5KA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] mariadb: use faster download URL
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
X-List-Received-Date: Fri, 04 Nov 2016 03:06:08 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Nov 3, 2016 at 7:08 PM, Tim Orling
<timothy.t.orling@linux.intel.com> wrote:
> The current URL takes about 2 hours to download.

how fast is new one, do they keep the tarballs there for long time ?
or shove them into archive after new release is out

>
> Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
> ---
>  meta-oe/recipes-support/mysql/mariadb.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-support/mysql/mariadb.inc b/meta-oe/recipes-support/mysql/mariadb.inc
> index edef40b..689b8ab 100644
> --- a/meta-oe/recipes-support/mysql/mariadb.inc
> +++ b/meta-oe/recipes-support/mysql/mariadb.inc
> @@ -4,7 +4,7 @@ SECTION = "libs"
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
>
> -SRC_URI = "http://archive.mariadb.org/mariadb-${PV}/source/mariadb-${PV}.tar.gz \
> +SRC_URI = "http://downloads.mariadb.com/MariaDB/mariadb-${PV}/source/mariadb-${PV}.tar.gz \
>             file://fix-cmake-module-path.patch \
>             file://remove-bad-path.patch \
>             file://fix-mysqlclient-r-version.patch \
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

