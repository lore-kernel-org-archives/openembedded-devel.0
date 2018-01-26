Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f178.google.com (mail-pf0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id EB92878493
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jan 2018 04:01:11 +0000 (UTC)
Received: by mail-pf0-f178.google.com with SMTP id m26so7400297pfj.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jan 2018 20:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=TmT9yAU11AydOQz0/13T/n82S72IDyVSGsid1jwMa7g=;
	b=C5SF+ytbk3G8HwamNFY9v6vxCn9VQ+RQOtQUYScuMS7rJRy0GstH5hSsatS5qOQbrE
	LtxCj1OWkW4ITaf7rH3nnZQACA7haKE7FAvCHzZeWB5qeuYnG4hNUo/9y33sXJbVt8be
	Lr1aGAvc67VMlOkUKUi23NzRilrlYW2tiWHJ9Ffk1hbwXTZot0yscE5uUdNfXcQFhJri
	VwZJvoYF2V7/N0S3kuidHJ0UX5oEpRNl8A848za8SgZwptMsPcLUk6ggkbDiRXBpZWWb
	ZMK1chhS4V1tpFwl+LXTRYpITUN2ScILqCtZ7ViN4Gw0s6/c9V9GVdhAe9BkYw88QqKF
	bXIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=TmT9yAU11AydOQz0/13T/n82S72IDyVSGsid1jwMa7g=;
	b=pdqnch3AjRf8BvyQiw+fptWIR14bg7SLhtQc7Aj7pCMJpV40fJzf0OyEgOjaBUCxG2
	o+1flkNd3u85l0Gra2oQ7HG5fb2u265IL3Q/UC9hvhSmK/YLDeDq3FpUQ/OB6AtHV19q
	F9u3JTpnoy2eVzYR5tG2JxDhJNNH31In1t1tUDxp7JJ12O2Yu3De1zGG079Irb4y3znt
	UKOd4Zbqi5xSd499OCMop7wXHtJwRPjr7DQQk62kgh9V1eBOVlFTA20jICDDXddhTsgS
	YzHGBpAsumgLXpbhQQKmpukZ5eUi9MAKWFp+8Omakdy5/v1Vr/l/Tet79R1MIga7nO4N
	ra/g==
X-Gm-Message-State: AKwxytdc7iT0NEJjI1heRMt9YmF6eCCxEVSxy3uPszDlMFcb9t2HmQAc
	9Nmr5QB7nXdkmpXWKdYtga0YxoY+
X-Google-Smtp-Source: AH8x226dFKrux2cdIkS6quNGAZxA6N02zqpsuHe8zuMfNuPUAUpk4BwQVL2fiZwvEZJvI6VizJyYEQ==
X-Received: by 2002:a17:902:8f8b:: with SMTP id
	z11-v6mr13484128plo.43.1516939272635; 
	Thu, 25 Jan 2018 20:01:12 -0800 (PST)
Received: from hermes.local ([2601:646:8880:466c:3012:7af4:dd04:6cda])
	by smtp.gmail.com with ESMTPSA id
	t80sm6099721pgb.88.2018.01.25.20.01.11
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Jan 2018 20:01:11 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <1513699918-7720-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<53571896-e752-6e16-c51b-bfa9096b4f72@gmail.com>
	<33D4DBCAC5F2D74E96B07F6E7632BF7363A90578@G08CNEXMBPEKD01.g08.fujitsu.local>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <9a838b96-e5ba-29c6-cd0c-5810952f7e67@gmail.com>
Date: Thu, 25 Jan 2018 20:01:10 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:58.0)
	Gecko/20100101 Thunderbird/58.0
MIME-Version: 1.0
In-Reply-To: <33D4DBCAC5F2D74E96B07F6E7632BF7363A90578@G08CNEXMBPEKD01.g08.fujitsu.local>
Subject: Re: [meta-oe][PATCH] xorgxrdp: new add
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
X-List-Received-Date: Fri, 26 Jan 2018 04:01:12 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 12/27/17 6:25 PM, Zheng, Ruoqin wrote:
> Hi armin
>      Could you give me some advice about how to fix it?
>      


you probably require xorg-driver-common.inc to be included in this recipe.

>      Thank you.
> 
> --------------------------------------------------
> Zheng Ruoqin
> Nanjing Fujitsu Nanda Software Tech. Co., Ltd.(FNST)
> ADDR.: No.6 Wenzhu Road, Software Avenue,
>         Nanjing, 210012, China
> MAIL : zhengrq.fnst@cn.fujistu.com
> 
> 
> -----Original Message-----
> From: akuster808 [mailto:akuster808@gmail.com]
> Sent: Wednesday, December 27, 2017 11:18 AM
> To: Zheng, Ruoqin/郑 若钦 <zhengrq.fnst@cn.fujitsu.com>; openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-oe][PATCH] xorgxrdp: new add
> 
> 
> 
> On 12/19/2017 08:11 AM, zhengrq wrote:
>> Add a new recipe xorgxrdp_0.2.5.bb.
> 
> I am seeing
> 
> ERROR: xorgxrdp-0.2.5+gitAUTOINC+c122544f18-r0 do_package_qa: QA Issue: Package xorgxrdp contains Xorg driver (xrdpdev_drv.so) but no xorg-abi- dependencies [xorg-driver-abi]
> ERROR: xorgxrdp-0.2.5+gitAUTOINC+c122544f18-r0 do_package_qa: QA run found fatal errors. Please consider fixing them.
> ERROR: xorgxrdp-0.2.5+gitAUTOINC+c122544f18-r0 do_package_qa: Function failed: do_package_qa
> 
> please fix.
> 
> - armin
> 
>> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
>> ---
>>   meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb | 20
>> ++++++++++++++++++++
>>   1 file changed, 20 insertions(+)
>>   create mode 100644
>> meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb
>>
>> diff --git a/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb
>> b/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb
>> new file mode 100644
>> index 0000000..b41190d
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb
>> @@ -0,0 +1,20 @@
>> +SUMMARY = "Xorg drivers for xrdp."
>> +
>> +LICENSE = "X11"
>> +LIC_FILES_CHKSUM =
>> +"file://COPYING;md5=a2523660329fdca3d954c0a87390e007 \ "
>> +
>> +inherit autotools pkgconfig
>> +
>> +DEPENDS = "virtual/libx11 xserver-xorg xrdp nasm-native"
>> +
>> +SRC_URI = "git://github.com/neutrinolabs/xorgxrdp.git \
>> +           "
>> +
>> +SRCREV = "c122544f184d4031bbae1ad80fbab554c34a9427"
>> +
>> +PV = "0.2.5+git${SRCPV}"
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +FILES_${PN} += "${libdir}/xorg/modules/*"
> 
> 
> 
> 
> 

