Return-Path: <akuster808@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id A2DC465CBC
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Oct 2015 14:24:39 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so31033292wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Oct 2015 07:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=6RdQMtad+fkVXFS5uPgzx5asbV0oJiylEoUzs6GKduw=;
	b=Suht3OYXLiTN4L36WSeGzC7KPE7ar6Josw6s9OQkp6JqOfXxTsql6pidYPUxFVZqDc
	xeg2PecoJMLhMwKuf4Aa7agy0m9gmFSNBIxGpDMMBFHEUHNZqrVnIRx86xOMO3qCZsHp
	ifO5Xc3v7iFEXGfn1WXuRMiM9YZEfm/20+6ZLF5LxLrwt86lwhBjnRcbtlKjaTI28/eU
	0KZIQmSDWktyQlXQOn+kJkO2VjYid2w8v6QuWqszKFdrkVFNe5yKQOLlkewXXUMcXyka
	V62sSiNaX910U5gT+RFg7N/Brc3Om474EDTxhyESsfcN5LZ1C/BTjq3EUc5O53Cm4hyv
	p8eg==
X-Received: by 10.194.80.197 with SMTP id t5mr8015867wjx.143.1444314278977;
	Thu, 08 Oct 2015 07:24:38 -0700 (PDT)
Received: from [10.200.207.200] ([89.101.192.72])
	by smtp.googlemail.com with ESMTPSA id
	l1sm46471785wjx.13.2015.10.08.07.24.37
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Oct 2015 07:24:37 -0700 (PDT)
Message-ID: <56167C9C.8060200@gmail.com>
Date: Thu, 08 Oct 2015 07:24:28 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1444129120-5101-1-git-send-email-adrian.ratiu@ni.com>
In-Reply-To: <1444129120-5101-1-git-send-email-adrian.ratiu@ni.com>
Subject: Re: [meta-security][PATCH] clamav: Update source mirror
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
X-List-Received-Date: Thu, 08 Oct 2015 14:24:41 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 10/06/2015 03:58 AM, Ioan-Adrian Ratiu wrote:
> The source archive was deleted from the debian mirror; get it from
> launchpad for now

thanks.

Merged.

- armin
> 
> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> ---
>  recipes-security/clamav/clamav_0.98.5.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-security/clamav/clamav_0.98.5.bb b/recipes-security/clamav/clamav_0.98.5.bb
> index 08604a7..8820461 100644
> --- a/recipes-security/clamav/clamav_0.98.5.bb
> +++ b/recipes-security/clamav/clamav_0.98.5.bb
> @@ -7,7 +7,7 @@ DEPENDS = "libtool db openssl zlib ncurses bzip2 libmspack"
>  
>  LIC_FILES_CHKSUM = "file://COPYING.LGPL;beginline=2;endline=3;md5=4b89c05acc71195e9a06edfa2fa7d092"
>  
> -SRC_URI = "${DEBIAN_MIRROR}/main/c/${BPN}/${BPN}_${PV}+dfsg.orig.tar.xz;name=archive \
> +SRC_URI = "https://launchpad.net/debian/+archive/primary/+files/clamav_0.98.5%2Bdfsg.orig.tar.xz;name=archive \
>      file://0001-Change-paths-in-sample-conf-file-to-match-Debian.patch \
>      file://0002-Add-an-additional-n-after-the-number-in-the-pidfile.patch \
>      file://0003-unit_tests-increment-test-timeout-from-40secs-to-5mi.patch \
> 

