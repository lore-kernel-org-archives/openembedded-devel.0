Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f42.google.com (mail-pl0-f42.google.com
	[209.85.160.42])
	by mail.openembedded.org (Postfix) with ESMTP id 1551C78258
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Jan 2018 22:23:41 +0000 (UTC)
Received: by mail-pl0-f42.google.com with SMTP id s3so2069743plp.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Jan 2018 14:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=u1Px3iY39oajHFatBgCQ7q7t88AtYX0JEaoVmtJG64U=;
	b=nb4lEqUpqYfy1i/w1TPw/Zc7bVafIKJ/9hjWzLIWtuM0NiUGjSeqCm6juX/Z5DZY4g
	kATKvviFeMcIy4eBA0DkTW/bULYktCXzakamoTxvqDFfbNoFhhDjALhWOJ6T8T9MrBVo
	6PVXydzlxbL1w6h8dCALDE/7KeNLCsJDHIZ9E+8Shro0vaowtrNd9I42SMSJEdOG74se
	TJ8Me2aulWwgojR9z7LwrLBRmvLli7WmGNOz/piXT14so9ZVs2qh91lAKlekP68Rkcji
	MGWrS2BobKjPboUNp5EZk38QHrVRJVOvufvrIJWD2PIOsiE5I2fpEuPAuZx1XZTzjhP1
	47yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=u1Px3iY39oajHFatBgCQ7q7t88AtYX0JEaoVmtJG64U=;
	b=AAHKq5kvuZ5rDorpnsuhDGDFMtVFBz9oQP6HpwJKl7Ed7bB4Xt96ssEmp7zzck9kl+
	p8/hbBvno7WC8Ok73z2NIMR7StH04HcGgUzmUKUBV8uaSsgYhklrVY4FC8tkYkpAqXFf
	mv8fVYtWYGLbM8DwKGgtZPAZilaI+IoqMi3RuIghrU08Cn999gswBHgnZQlyWRpIIQcK
	4DrW81/TqUPkf80TksyYxRUVBU/dVcICqHVitbmo+HgXauWsxcIg5qNEyi7wRChIiULK
	DnBiBdnUU5EUYBFzbxg1y+/jRVwVm9644r1e9KKDonNCVS/A5Ef8ZrBQKZG/Yb23dvxe
	4XwQ==
X-Gm-Message-State: AKGB3mJPSLNbTvBcGrA1r3PAxGzl9Bic47Jew2QXQ62TDGG1kb0PkIhk
	Nt/3cCzKDi5qILCerL+OEY87fA==
X-Google-Smtp-Source: ACJfBosCooeaIt8gFSwdn95gQ5/h3SjgooRWMNdHsVFKobcQJwfm+ruCQhcflyYtI29mAd5ELPfyOQ==
X-Received: by 10.84.197.35 with SMTP id m32mr2673417pld.214.1515018222777;
	Wed, 03 Jan 2018 14:23:42 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1184:118f:a6ff:8496:e77b?
	([2601:202:4000:1184:118f:a6ff:8496:e77b])
	by smtp.gmail.com with ESMTPSA id r1sm4674164pfg.98.2018.01.03.14.23.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Jan 2018 14:23:42 -0800 (PST)
To: Zhixiong Chi <zhixiong.chi@windriver.com>,
	openembedded-devel@lists.openembedded.org
References: <20180103083412.9689-1-zhixiong.chi@windriver.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <5125ab2e-8aba-4381-6bd1-4275f58a815e@gmail.com>
Date: Wed, 3 Jan 2018 14:23:40 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <20180103083412.9689-1-zhixiong.chi@windriver.com>
Subject: Re: [meta-networking][PATCH] wireshark: CVE-2017-17935
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
X-List-Received-Date: Wed, 03 Jan 2018 22:23:42 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 01/03/2018 12:34 AM, Zhixiong Chi wrote:
> Backport patch from the upstream:
> https://code.wireshark.org/review/gitweb?p=wireshark.git;
> a=commit;h=137ab7d5681486c6d6cc8faac4300b7cd4ec0cf1
> https://nvd.nist.gov/vuln/detail/CVE-2017-17935
>
> The File_read_line function in epan/wslua/wslua_file.c in Wireshark
> through 2.2.11 does not properly strip '\n' characters, which allows
> remote attackers to cause a denial of service (buffer underflow and
> application crash) via a crafted packet that triggers the attempted
> processing of an empty line.
Thank you for the security patch.

In master-next is an update to wireshark to version 2.2.11.  I think
this wont be necessary once the update hits master.

- armin
>
> Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
> ---
>  .../wireshark/wireshark/CVE-2017-17935.patch       | 37 ++++++++++++++++++++++
>  .../recipes-support/wireshark/wireshark_2.2.10.bb  |  4 ++-
>  2 files changed, 40 insertions(+), 1 deletion(-)
>  create mode 100644 meta-networking/recipes-support/wireshark/wireshark/CVE-2017-17935.patch
>
> diff --git a/meta-networking/recipes-support/wireshark/wireshark/CVE-2017-17935.patch b/meta-networking/recipes-support/wireshark/wireshark/CVE-2017-17935.patch
> new file mode 100644
> index 000000000..46ad83ea0
> --- /dev/null
> +++ b/meta-networking/recipes-support/wireshark/wireshark/CVE-2017-17935.patch
> @@ -0,0 +1,37 @@
> +From 137ab7d5681486c6d6cc8faac4300b7cd4ec0cf1 Mon Sep 17 00:00:00 2001
> +From: Martin Mathieson <martin.r.mathieson@googlemail.com>
> +Date: Tue, 26 Dec 2017 11:48:04 +0000
> +Subject: [PATCH 1/1] potential buffer underflow in File_read_line function in
> + epan/wslua/wslua_file.c
> +
> +Putting up for review, though I am not completely convinced that
> +file_gets() can return an empty line.
> +
> +Bug: 14295
> +Change-Id: If36761ea511b66c01a9f167809a218a7eadbfcc5
> +Reviewed-on: https://code.wireshark.org/review/24997
> +Petri-Dish: Martin Mathieson <martin.r.mathieson@googlemail.com>
> +Tested-by: Petri Dish Buildbot
> +Reviewed-by: Anders Broman <a.broman58@gmail.com>
> +
> +Upstream-Status: Backport
> +Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
> +---
> + epan/wslua/wslua_file.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/epan/wslua/wslua_file.c b/epan/wslua/wslua_file.c
> +index 79bf4f7..73bacc6 100644
> +--- a/epan/wslua/wslua_file.c
> ++++ b/epan/wslua/wslua_file.c
> +@@ -192,7 +192,7 @@ static int File_read_line(lua_State *L, FILE_T ft) {
> +     length = (gint)(file_tell(ft) - pos_before);
> + 
> +     /* ...but don't want to include newline in line length */
> +-    if (linebuff[length-1] == '\n') {
> ++    if (length > 0 && linebuff[length-1] == '\n') {
> +         length--;
> +         /* Nor do we want '\r' (as will be written when log is created on windows) */
> +         if (length > 0 && linebuff[length - 1] == '\r') {
> +-- 
> +2.7.4
> diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.2.10.bb b/meta-networking/recipes-support/wireshark/wireshark_2.2.10.bb
> index 5358ba07f..e3915d203 100644
> --- a/meta-networking/recipes-support/wireshark/wireshark_2.2.10.bb
> +++ b/meta-networking/recipes-support/wireshark/wireshark_2.2.10.bb
> @@ -6,7 +6,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6e271234ba1a13c6e512e76b94ac2f77"
>  
>  DEPENDS = "pcre expat glib-2.0 glib-2.0-native"
>  
> -SRC_URI = "https://2.na.dl.wireshark.org/src/all-versions/${BP}.tar.bz2"
> +SRC_URI = "https://2.na.dl.wireshark.org/src/all-versions/${BP}.tar.bz2 \
> +           file://CVE-2017-17935.patch \
> +"
>  
>  PE = "1"
>  


