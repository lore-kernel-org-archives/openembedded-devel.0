Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f54.google.com (mail-pg0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id 3FA086093A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jan 2018 15:43:57 +0000 (UTC)
Received: by mail-pg0-f54.google.com with SMTP id g16so535247pgn.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jan 2018 07:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=r4eWCB9y+K+e1pTVGaEvr8zeMvcSKzrmwl1kBlYg/Ho=;
	b=fPbZ8tycWoRIwlW3DohCrv3DCSg9AaPKp+qCX+MoLlqtSmjZ8NBATgoCl52OLNp2nV
	psSVFSk8ChKtuKWPTKJ3TUw2B/NH8+jp0NeNk9JdC9/IdzHdyP9ThwVr7lhIdRNUTrv+
	LcLVlEuys90QgIj+DoxHhW0IGa6kEAdxGeh5qiwd9kM1g8KIbL5iALFBiekqJbJrMxAr
	hli4/ZLx7HY7xUuxX0Sm7Es7JCBObJx7pg+LUCjgb5pm28KyDAhKmLrCOXKDS+NBtSAT
	EoD1oRLBJQcTZ7jLWlfd4RlE/oKyfy25rkz0flRCXVOskseFyKLtAhvP/7vk6syj4GI4
	UMkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=r4eWCB9y+K+e1pTVGaEvr8zeMvcSKzrmwl1kBlYg/Ho=;
	b=mw4mTBW7qRPRQAWckXvTV7PyODosV0509ayyZf91Rs7ydBWxhekdhl74bXxphUxUH3
	NWDGqK4ByoY2DftlN4KrcqcooST2R3Wh9G3fQI2yYFUAegJqDgmwgPw3mQq8H+JOVEnk
	e+rLF8gQ0FwjjTk7KQQqQ4FQrMTaNck85DYCzaeFv6Yeg+enAbTqta5KaKc7ytNTK9Ee
	++S2cANhGjbfGja6HTUcIqRL0MqZ+Zm6EMoEHc9CY2lSrErrWRrE46MhgBLpPM60WHuF
	O+1YtaKbmk6w5PhJL0JQmdruYX7mt9YvYwoN9HY+zh0om+MDhEzb70hDVYracP8nx7rL
	2zoQ==
X-Gm-Message-State: AKwxytdOqaB5mUqWDOsSPUtdD7EnejFjTiKiDbcPEBu3VnYW12wKf2xn
	q/VRFoBshnQdPGyDv4cVo9bsnw==
X-Google-Smtp-Source: AH8x227fpkx0c+cc9wrAwIq0j4b4Ho+Ums8gUyqfKeEpepGtQQueePobvSV/25OKUzPwB8/+H6EJgA==
X-Received: by 10.98.170.24 with SMTP id e24mr10764397pff.177.1516722239306;
	Tue, 23 Jan 2018 07:43:59 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1184:c15:67c4:d558:a329?
	([2601:202:4000:1184:c15:67c4:d558:a329])
	by smtp.gmail.com with ESMTPSA id
	y17sm7305787pfk.67.2018.01.23.07.43.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Jan 2018 07:43:58 -0800 (PST)
To: "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <1515141913-120084-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<33D4DBCAC5F2D74E96B07F6E7632BF7363A9A981@G08CNEXMBPEKD01.g08.fujitsu.local>
From: akuster808 <akuster808@gmail.com>
Message-ID: <3a00bb76-d692-19bf-764a-a2508dd1de19@gmail.com>
Date: Tue, 23 Jan 2018 07:43:56 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <33D4DBCAC5F2D74E96B07F6E7632BF7363A9A981@G08CNEXMBPEKD01.g08.fujitsu.local>
Subject: Re: [meta-oe][PATCH v2] xorgxrdp: new add
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
X-List-Received-Date: Tue, 23 Jan 2018 15:43:58 -0000
Content-Type: text/plain; charset=gbk
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 01/22/2018 11:38 PM, Zheng, Ruoqin wrote:
> ping

its in master
http://cgit.openembedded.org/meta-openembedded/commit/?id=5e4dfb7ee63cdaa2de447e24e916474fc19f9560

>
> --------------------------------------------------
> Zheng Ruoqin
> Nanjing Fujitsu Nanda Software Tech. Co., Ltd.(FNST)
> ADDR.: No.6 Wenzhu Road, Software Avenue,
>        Nanjing, 210012, China
> MAIL : zhengrq.fnst@cn.fujistu.com
>
>
> -----Original Message-----
> From: Zheng, Ruoqin/÷£ »Ù«’ 
> Sent: Friday, January 05, 2018 4:45 PM
> To: openembedded-devel@lists.openembedded.org
> Cc: Zheng, Ruoqin/÷£ »Ù«’ <zhengrq.fnst@cn.fujitsu.com>
> Subject: [oe][meta-oe][PATCH v2] xorgxrdp: new add
>
> Add a new recipe xorgxrdp_0.2.5.bb.
>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  .../recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb    | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb
>
> diff --git a/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb b/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb
> new file mode 100644
> index 0000000..20cf45f
> --- /dev/null
> +++ b/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb
> @@ -0,0 +1,22 @@
> +SUMMARY = "Xorg drivers for xrdp."
> +
> +LICENSE = "X11"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=a2523660329fdca3d954c0a87390e007 
> +\ "
> +
> +inherit autotools pkgconfig
> +
> +DEPENDS = "virtual/libx11 xserver-xorg xrdp nasm-native"
> +
> +SRC_URI = "git://github.com/neutrinolabs/xorgxrdp.git \
> +           "
> +
> +SRCREV = "c122544f184d4031bbae1ad80fbab554c34a9427"
> +
> +PV = "0.2.5+git${SRCPV}"
> +
> +S = "${WORKDIR}/git"
> +
> +FILES_${PN} += "${libdir}/xorg/modules/*"
> +
> +INSANE_SKIP_${PN} += "xorg-driver-abi"
> --
> 2.7.4
>
>
>


