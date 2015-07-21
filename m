Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 8807676152
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jul 2015 14:41:49 +0000 (UTC)
Received: by pabkd10 with SMTP id kd10so49418611pab.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jul 2015 07:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=8VWFE0kVxUWGiDVFFJke3rgrQ8lmRlX9aFAb0tyCS+g=;
	b=sg0JmSxTi8xBK+R3ee1ugt4TKkkd4KH+lFsE18bNMs8TjFrxD6oN5m8MNNm5BAsaWO
	34S1K0B1omEcq68UhYLK87VXkQOapr23G4cUesqQVjIkNPfaeXON6FyqH6W+1kG8dd40
	Io4RBo4tc2IztY2XIpb7M/+qu89GZhuXzmmMkDYiEP+xrO+slZ4YQ/V6D6PP+pJVFYkh
	6scApKIG6kbI4XlXAwT8VioPqc9Sz3O7Cr3cPMSOTTfq7OHNwVaZlcpcmkWolME0pxyq
	bjsshFp5DLCmt1NdoVjY5LGQ1kfxqlKn9nWDtwW3jYRUyMhOl0+6dml4qoiTO6LyypDP
	uMcw==
X-Received: by 10.66.121.163 with SMTP id ll3mr75399045pab.100.1437489709646; 
	Tue, 21 Jul 2015 07:41:49 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1239:7879:5e78:5a27:38d9?
	([2601:202:4000:1239:7879:5e78:5a27:38d9])
	by smtp.googlemail.com with ESMTPSA id
	db1sm27940676pdb.50.2015.07.21.07.41.47
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 21 Jul 2015 07:41:48 -0700 (PDT)
Message-ID: <55AE5A26.7070209@gmail.com>
Date: Tue, 21 Jul 2015 07:41:42 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1430300563-20254-1-git-send-email-dominic.sacre@gmx.de>
In-Reply-To: <1430300563-20254-1-git-send-email-dominic.sacre@gmx.de>
Subject: Re: [meta-oe][fido][PATCH] fio: add missing build dependency on zlib
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
X-List-Received-Date: Tue, 21 Jul 2015 14:41:51 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

merged to staging

- armin

On 04/29/2015 02:42 AM, Dominic Sacré wrote:
> Fixes:
> | WARNING: QA Issue: fio rdepends on zlib, but it isn't a build dependency? [build-deps]
>
> Signed-off-by: Dominic Sacré <dominic.sacre@gmx.de>
> ---
>   meta-oe/recipes-benchmark/fio/fio_2.2.6.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-benchmark/fio/fio_2.2.6.bb b/meta-oe/recipes-benchmark/fio/fio_2.2.6.bb
> index 016b1f2..13534cc 100644
> --- a/meta-oe/recipes-benchmark/fio/fio_2.2.6.bb
> +++ b/meta-oe/recipes-benchmark/fio/fio_2.2.6.bb
> @@ -10,7 +10,7 @@ SECTION = "console/tests"
>   LICENSE = "GPLv2"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
>
> -DEPENDS = "libaio"
> +DEPENDS = "libaio zlib"
>
>   # rev for v2.2.6
>   SRCREV = "f52c9691bc8c285f3445235c69acdfd6de7f9b82"
>

