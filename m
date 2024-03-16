Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1474CC48BF6
	for <webhook@archiver.kernel.org>; Sat, 16 Mar 2024 21:09:02 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.6056.1710623340559818153
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 Mar 2024 14:09:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=xH0LOe6D;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id BAFED87A80;
	Sat, 16 Mar 2024 22:08:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1710623331;
	bh=1uQClu6SEVszP775qGiK6MMzyoE+66SAyghXqmAQ9yA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=xH0LOe6DDeqhRke1Q0O5tH4k7F3xZRsTKQnlXxkV9Uyvoq+qbWB8Q54FI0egfFuWA
	 S1hZy6QhkReL6OsZvxrLv+04ZWMrG2M1gyNmx76W2uaOCcObx1VJYvzXTeArCDL3Z6
	 PLAy+FuN6NOqubaJXoF91W9yO+2ys7VNs+N3LbGtIgSCoO9AFevWcdkJofHL5Sgany
	 bBr0zWSm+0rsWKjC3wsUlw4RV0pm07XMHgg7JGq0Gf1UE2m2lqx4OskseHFLjfr14r
	 fLrnxQyIFgFI0EP0FwsOLd3pZG/ttAy0XHGp90Dtoey7s1wwBO9GOVScanBoh7ZvxT
	 NQv1oaYPGoiPg==
Message-ID: <e407e03c-eca4-4b6f-a8b6-c10645d85b44@denx.de>
Date: Sat, 16 Mar 2024 21:39:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-oe][PATCH v3 1/5] lvgl: fix typo in lv-conf.inc
Content-Language: en-US
To: Christophe Chapuis <chris.chapuis@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>,
 Fabio Estevam <festevam@denx.de>, Martin Jansa <martin.jansa@gmail.com>
References: <20240315180314.9111-1-chris.chapuis@gmail.com>
 <fa0889e8-cce7-46a0-8a27-41b807453bd5@denx.de>
 <CACA7eUQ3aucjaAb897rRXS9AEt8x2nvedZzHnt9tijiO-QrLBw@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CACA7eUQ3aucjaAb897rRXS9AEt8x2nvedZzHnt9tijiO-QrLBw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 16 Mar 2024 21:09:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109374

On 3/16/24 9:21 AM, Christophe Chapuis wrote:
> On Sat, Mar 16, 2024 at 3:59=E2=80=AFAM Marek Vasut <marex@denx.de> wro=
te:
>=20
>> On 3/15/24 7:03 PM, Christophe Chapuis wrote:
>>> Fix a typo in the first sed instruction, where the #if 0 is
>>> never changed to #if 1 at the beginning of lv_conf.h.
>>>
>>> Signed-off-by: Christophe Chapuis <chris.chapuis@gmail.com>
>>> ---
>>>    meta-oe/recipes-graphics/lvgl/lv-conf.inc | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta-oe/recipes-graphics/lvgl/lv-conf.inc
>> b/meta-oe/recipes-graphics/lvgl/lv-conf.inc
>>> index cb676ac62..3dbdf769f 100644
>>> --- a/meta-oe/recipes-graphics/lvgl/lv-conf.inc
>>> +++ b/meta-oe/recipes-graphics/lvgl/lv-conf.inc
>>> @@ -24,7 +24,7 @@ do_configure:append() {
>>>        # If there is a configuration template, start from that
>>>        [ -r "${S}/lv_conf_template.h" ] && cp -Lv
>> "${S}/lv_conf_template.h" "${S}/lv_conf.h"
>>>
>>> -    sed -e "s|#if 0 .*Set it to \"1\" to enable the content.*|#if 1 =
//
>> Enabled by ${PN}|g" \
>>> +    sed -e "s|#if 0 .*Set it to \"1\" to enable content.*|#if 1 //
>> Enabled by ${PN}|g" \
>>
>> Just to be on the safe side, can you please check if this also modifie=
s
>> the lv_conf.h in lvgl-demo-fb recipe correctly ? (I think it does not,
>>
>>
> It does not, but this won't be a problem: it's already activated in
> lvgl-demo-fb's source code. More generally, if a lv_conf.h file already
> exists, it means the app has already customized it a bit, so we can
> consider it to be already active.

OK

> However, this pointed to a little issue I introduced: the do_install:ap=
pend
> for lv_conf.h is only needed for lvgl.bb, not for other recipes that us=
e
> lv-conf.inc. I'll move it to the main lvgl recipe.
>=20
> I'll also generalize the sed instructions a bit more, to catch spaces a=
nd
> tabs. So in the end, each sed line would look like this:
>     -e "s|\(^[ \t]*#define LV_USE_ASSERT_OBJ[ \t]\).*|\1${DEBUG_BUILD}|=
g"
>=20
> What is the preferred way to do this ? Do I do a v4, or do I add two mo=
re
> patches?

V4 please.

Also please collect Reviewed-by tags in each new version .

