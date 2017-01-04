Return-Path: <george.mccollister@gmail.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9F5DD719B4
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Jan 2017 23:14:58 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id v84so76437765oie.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Jan 2017 15:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=ghXVaMnCT879xsBChAyb43kDBoNzNmv+fclkYn1TBHk=;
	b=jQrk2Ab4NVwR/oxGlxfyumOcaKDyU4IXLF6d94ZAeGk9RV0aQK9SLQ1SrXdI0y3NEk
	yTVLyH4jueLCHCSCMeyuUIe/UfGZH6efxRSrTNyYBVD5c1pt8eGDOv8kKugq4yoFjGDl
	Gydg+6oVRUJ+VRddWumNTYtwSVzW0SxzIpS0u9Gl2HqjmsiF+JH2lSPp3Ff3kAcqdzwv
	/EqQVzqcfODZupgvfkDhDYPbqISleA1ksxvnkinq3Qmi9C2gsT192ZlS7Lur6Hf/nwgF
	DUMoF0zwXMt2Pc9WqX4YADxDpPZcl12K1tBpSN7YkGDngb3NuIVvkXkXd6qIj4iaMlzq
	tGQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=ghXVaMnCT879xsBChAyb43kDBoNzNmv+fclkYn1TBHk=;
	b=d6a0F37Lyj5trSm3rqKoo6BQDEX3bUjc9/LHpa19lHYLHQ8BGJH6GD9rfqgonMVKZl
	haiIsTpgh/EWSPwM+gMLyVF85jfJXc7epeHvldvMPt1reiQSB0E+iWbj9gFLHZnoPGOf
	RJCBhXVfj/mNfcLcOT6/oXUaNmmipkeXNRUOIE+WshN4vItyW8jgKgwfHhllROWu4lEo
	hgCLsv27WF7A4scWnv04uQR7DCWU4o5MLnymyswgVaQLuIzRVas1ywX119Z+0rOp+8AD
	bLNFuJ+pSF1An2GvyRtWTwEhx8GUt8m8GudTfTYZjvDe69OhCPg/rkT9IV/dTMx8VBYf
	ShKA==
X-Gm-Message-State: AIkVDXJKb4dKzPLWOku2pOTrX4sfkAR22xAxTRMCeEh4k6+lxf35kYk1EjkW30Ki+5XydP14DfgNvDvvVjV7yQ==
X-Received: by 10.202.241.130 with SMTP id p124mr30212735oih.85.1483571698219; 
	Wed, 04 Jan 2017 15:14:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.202.46.9 with HTTP; Wed, 4 Jan 2017 15:14:57 -0800 (PST)
In-Reply-To: <1482531919-26391-1-git-send-email-derek@asterius.io>
References: <1482531919-26391-1-git-send-email-derek@asterius.io>
From: George McCollister <george.mccollister@gmail.com>
Date: Wed, 4 Jan 2017 17:14:57 -0600
Message-ID: <CAFSKS=Oct=fUXDEDRLvm9VVkeEZ7uVqtiPZdjUsf9_Uq=XxYyg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-webserver][PATCH] apache2: always use the archive.apache.org to ensure older releases are always available
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
X-List-Received-Date: Wed, 04 Jan 2017 23:14:58 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Dec 23, 2016 at 4:25 PM, Derek Straka <derek@asterius.io> wrote:
> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
>  meta-webserver/recipes-httpd/apache2/apache2-native_2.4.25.bb | 2 +-
>  meta-webserver/recipes-httpd/apache2/apache2_2.4.25.bb        | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.25.bb b/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.25.bb
> index ca8ebaf..7a2b236 100644
> --- a/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.25.bb
> +++ b/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.25.bb
> @@ -8,7 +8,7 @@ LICENSE = "Apache-2.0"
>
>  inherit autotools pkgconfig native
>
> -SRC_URI = "http://www.apache.org/dist/httpd/httpd-${PV}.tar.bz2 \
> +SRC_URI = "http://archive.apache.org/dist/httpd/httpd-${PV}.tar.bz2 \

Probably should have used ${APACHE_MIRROR} here.

>             file://0001-configure-use-pkg-config-for-PCRE-detection.patch \
>            "
>
> diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.25.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.25.bb
> index 3bd8579..9446082 100644
> --- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.25.bb
> +++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.25.bb
> @@ -6,7 +6,7 @@ DEPENDS = "libtool-native apache2-native openssl expat pcre apr apr-util"
>  SECTION = "net"
>  LICENSE = "Apache-2.0"
>
> -SRC_URI = "http://www.apache.org/dist/httpd/httpd-${PV}.tar.bz2 \
> +SRC_URI = "http://archive.apache.org/dist/httpd/httpd-${PV}.tar.bz2 \
>             file://server-makefile.patch \
>             file://httpd-2.4.1-corelimit.patch \
>             file://httpd-2.4.4-export.patch \
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

