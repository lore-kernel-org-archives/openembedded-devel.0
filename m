Return-Path: <akuster808@gmail.com>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id CED4477D00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 13:38:20 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id y18so2038405itc.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 06:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=RYCoWb3Xr+bkt+C8B/sRdp6jYOYAep19RXfyT9hedgA=;
	b=DVAqduk87uCnFEsefozbUNJcq82sVNJKwkOv2RqLJ/ghXW2XOupRixxHPhPG/5IBUE
	y8HMchrLZcwzAmfon/K4QGU+0kg6YXiiCZm0R8uscWk2MFvDzgjUNUgvN7OVttdjozAg
	+G9ul1Omxnj0oG+41o2a7Ip0wwI5YBtZumDGPX/ROu1C0rPkCjc0nvj2u1psHze7qU4V
	pgYPoukbCN8IDXCrn6amoSJA2FUnfkQthXcpw1ROXXZqfwia+lfQcGUitkEc3G3TnykC
	Xo+Qkoj7e7bKKJDkCoMVzFMtw5ew/2UlQWpmeIpzN0FkUXG2qFtLEC6m7Y7hO/YMmpGI
	rVTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=RYCoWb3Xr+bkt+C8B/sRdp6jYOYAep19RXfyT9hedgA=;
	b=BXH70T893gPGLD+VBuCIAls4HkwyRefaPe3xU2HsgnM6EsEgwZRA1zLgGTTBslZYEU
	m74K3B4pQrX/Uex0vZlVoDB36KcXYc2SIoLgyNp/LlnzoxgJzyQzTGOt26LF8EcdGb0/
	a9Cofjfn06ODbzUCaEQCZNQTc0CSdvrjcWpZpHjNhBJotlVEyaswve2UyZHDSGCZ2Qj7
	wn+xkdQyqqhTa4vajnCSRrJx8AqJBeNvHeXJRAF8UMXazOaYCrXyNGUt1tiIfhf0d4wq
	oyCK6yVQ2AucXoD55ogh69QGOANf10VmyLJ5D9m4GCzvjMYoKZAd43YxPqcb+BfTifpG
	zmOg==
X-Gm-Message-State: AFeK/H2WjLRRCRrkplWDamzXrbJq9UfetHQOlqBLpuUVd9Xswa9kXz6LfQhBCAOlDptK5w==
X-Received: by 10.36.23.86 with SMTP id 83mr2638807ith.30.1490967502197;
	Fri, 31 Mar 2017 06:38:22 -0700 (PDT)
Received: from [172.30.15.4] ([67.133.97.100])
	by smtp.gmail.com with ESMTPSA id
	y203sm3146362iod.11.2017.03.31.06.38.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Mar 2017 06:38:21 -0700 (PDT)
To: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <20170331113803.31535-1-Martin.Jansa@gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <adec7310-ce23-cef8-0c06-ea4b5bf9036c@gmail.com>
Date: Fri, 31 Mar 2017 06:38:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170331113803.31535-1-Martin.Jansa@gmail.com>
Subject: Re: [PATCH][meta-oe][morty 1/7] lftp: change SRC_URI source
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
X-List-Received-Date: Fri, 31 Mar 2017 13:38:22 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Martin


On 03/31/2017 04:37 AM, Martin Jansa wrote:
> From: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
>
> Changed SRC_URI source to official web-site, which keeps tarballs with
> old releases.
>
> Cherry-picked from master, but without the upgrade to 4.7.5.
Missing hash from master.

- armin
>
> Signed-off-by: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>   meta-networking/recipes-connectivity/lftp/lftp_4.7.3.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-networking/recipes-connectivity/lftp/lftp_4.7.3.bb b/meta-networking/recipes-connectivity/lftp/lftp_4.7.3.bb
> index 287821194..d62453745 100644
> --- a/meta-networking/recipes-connectivity/lftp/lftp_4.7.3.bb
> +++ b/meta-networking/recipes-connectivity/lftp/lftp_4.7.3.bb
> @@ -6,7 +6,7 @@ SECTION = "console/network"
>   LICENSE = "GPLv3"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>   
> -SRC_URI = "http://fossies.org/linux/misc/lftp-${PV}.tar.gz \
> +SRC_URI = "http://lftp.yar.ru/ftp/lftp-${PV}.tar.gz \
>              file://fix-gcc-6-conflicts-signbit.patch \
>             "
>   SRC_URI[md5sum] = "8eb1fe5f113126b60f172643c7f6c2e6"


