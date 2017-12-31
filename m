Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f50.google.com (mail-pl0-f50.google.com
	[209.85.160.50])
	by mail.openembedded.org (Postfix) with ESMTP id 5DB5171BA6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 31 Dec 2017 23:01:51 +0000 (UTC)
Received: by mail-pl0-f50.google.com with SMTP id bi12so26213350plb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 31 Dec 2017 15:01:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=pLyizFMEyImehndMIePFoR7qDa6/Kc64kPpIV5ysf0Y=;
	b=XbJFvOGM6s9hXs+Q0DNQr44RDlzeb5SJ/sYrJENBFpfclehcjkEQ0k8EdzJa1hjmnU
	av3j5M5e/8kI3jjyLMK4oox/TMawpSwGFeAI1oXwlhrKjEJNoXci0BLbBqQOYMPuUEBt
	wIMOyy0+nmaJmYa86RBNhQ5lMuEWdXG48DyNIwnfozp/tblfiLfpA+AoAxvwIVQdWsO/
	tyMT8TiRNJO4WQHM0Gdg/tze+UJiwLAigyEIYX3VOxmPk63tHAk6lv0x0ADLFydrklrh
	WusX230YpwJWcvEZot/ZnpqCvZ1zmSs+uiw2ZzGR6k8CB4XGU0iq5rt0307LNl8luZ02
	WbsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=pLyizFMEyImehndMIePFoR7qDa6/Kc64kPpIV5ysf0Y=;
	b=fVuEsqLhVK8UV2T8SWKMl98YJxRvt5kzvbSxZUfe6QB6i7mnCRWSAnFInhYE+lvGAD
	KOt3cHIUv/pyMRDq3ZmOOu5mrQpVsU3qo/bj3SqYOtWaWgN2t7syxqvriq8u0bcyeUAa
	JRAeVuMT3xj6omGtbi3snO6MqUW74fqM2XmkgHWP5qzxKTumCFUBHZxz8ehiJAazwi6w
	bQ3PgTpbV85z2mmb4VzjvPDvODt0i5D/8vM9hyUAGBqFPz3Zxx5Ed7QVdmrqbffRX1GE
	EW3536N1J3txUsytmpEEk7PvpXx5mHJoV377BLhz3jLX4Z6Oc1KiypIUFBp6iOe8j+7A
	yVnA==
X-Gm-Message-State: AKGB3mLIpNSoVixOHbJrAmsUCbMHxJzjz1lheW/KsA1p05GWEsx//i3q
	4W6NHgq1kP8r5fJwBxvsWfQFZQ==
X-Google-Smtp-Source: ACJfBovM2eqFVKtDbw9BijPd4BwCjbIzgc/VLz6IDPM3osF+SziEbgk/VF+telVphRGDiH56O5CTTw==
X-Received: by 10.159.247.193 with SMTP id v1mr40541979plz.102.1514761312339; 
	Sun, 31 Dec 2017 15:01:52 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1184:20c4:d690:9df8:7161?
	([2601:202:4000:1184:20c4:d690:9df8:7161])
	by smtp.gmail.com with ESMTPSA id
	q9sm92318146pfl.116.2017.12.31.15.01.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 31 Dec 2017 15:01:51 -0800 (PST)
To: Bill Randle <bill.randle@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <20171231170823.29570-1-bill.randle@gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <cc55814b-99f8-8598-7c54-74558253efa3@gmail.com>
Date: Sun, 31 Dec 2017 15:01:50 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <20171231170823.29570-1-bill.randle@gmail.com>
Subject: Re: [meta-oe][PATCH] smstools3: remove bash dependency on packaged scripts
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
X-List-Received-Date: Sun, 31 Dec 2017 23:01:51 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 12/31/2017 09:08 AM, Bill Randle wrote:
> An earlier patch to update smstools3 to v3.1.21 dropped the RDEPENDS for
> bash, which caused qc errors during packaging, since the example scripts
> still used /bin/bash as the command executor. This patch updates the scripts
> to use /bin/sh instead. No known bash-only syntax is present in the packaged
> scripts and they run ok under Busybox.

Thanks. Your fix is much better than what I was looking at.

kind regards and Happy New Year.

- Armin
>
> Upstream-Status: Submitted [http://smstools3.kekekasvi.com/topic.php?post=6188#post6188]
> Signed-off-by: Bill Randle <bill.randle@gmail.com>
> ---
>  .../smstools3/smstools3/scripts_no_bash.patch      | 32 ++++++++++++++++++++++
>  .../smstools3/smstools3_3.1.21.bb                  |  3 +-
>  2 files changed, 34 insertions(+), 1 deletion(-)
>  create mode 100644 meta-oe/recipes-connectivity/smstools3/smstools3/scripts_no_bash.patch
>
> diff --git a/meta-oe/recipes-connectivity/smstools3/smstools3/scripts_no_bash.patch b/meta-oe/recipes-connectivity/smstools3/smstools3/scripts_no_bash.patch
> new file mode 100644
> index 000000000..f7529d8cb
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/smstools3/smstools3/scripts_no_bash.patch
> @@ -0,0 +1,32 @@
> +--- smstools3.orig/scripts/sendsms	2006-02-04 11:52:06.000000000 -0800
> ++++ smstools3/scripts/sendsms	2017-12-30 15:40:28.009169106 -0800
> +@@ -1,4 +1,4 @@
> +-#!/bin/bash
> ++#!/bin/sh
> + # This script send a text sms at the command line by creating
> + # a sms file in the outgoing queue.
> + 
> +--- smstools3.orig/scripts/sms2html	2006-02-04 11:52:06.000000000 -0800
> ++++ smstools3/scripts/sms2html	2017-12-30 15:39:17.496694390 -0800
> +@@ -1,4 +1,4 @@
> +-#!/bin/bash
> ++#!/bin/sh
> + 
> + # This script converts a received sms file into a html file. 
> + 
> +--- smstools3.orig/scripts/sms2unicode	2006-02-04 11:52:06.000000000 -0800
> ++++ smstools3/scripts/sms2unicode	2017-12-30 15:33:14.477250179 -0800
> +@@ -1,4 +1,4 @@
> +-#!/bin/bash
> ++#!/bin/sh
> + 
> + # This script converts a received sms file into a pure unicode text file.
> + 
> +--- smstools3/scripts/unicode2sms	2006-02-04 11:52:06.000000000 -0800
> ++++ smstools3/scripts/unicode2sms.new	2017-12-30 15:33:56.918536044 -0800
> +@@ -1,4 +1,4 @@
> +-#!/bin/bash
> ++#!/bin/sh
> + 
> + # This script converts a pure unicode text file into an sms file for sending.
> + 
> diff --git a/meta-oe/recipes-connectivity/smstools3/smstools3_3.1.21.bb b/meta-oe/recipes-connectivity/smstools3/smstools3_3.1.21.bb
> index 86c8ede1d..6e6413b4b 100644
> --- a/meta-oe/recipes-connectivity/smstools3/smstools3_3.1.21.bb
> +++ b/meta-oe/recipes-connectivity/smstools3/smstools3_3.1.21.bb
> @@ -6,7 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4d21efa1bb2a186360dde4035f860682"
>  HOMEPAGE = "http://smstools3.kekekasvi.com"
>  
>  SRC_URI = "http://smstools3.kekekasvi.com/packages/${BP}.tar.gz \
> -           file://sms_binpath.patch"
> +           file://sms_binpath.patch \
> +           file://scripts_no_bash.patch"
>  
>  SRC_URI[md5sum] = "6a9f038fb38a49cc3a4f8f14a88fb8af"
>  SRC_URI[sha256sum] = "a26ba4c02b16f6cf13177bffca6c9230dc5fefaeba8e3030cd4e4905f6a92084"


