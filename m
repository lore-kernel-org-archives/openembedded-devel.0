Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 806C1C433EF
	for <webhook@archiver.kernel.org>; Fri, 11 Mar 2022 05:05:23 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web12.2470.1646975122944519080
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Mar 2022 21:05:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=W3f1VUG3;
 spf=pass (domain: gmail.com, ip: 209.85.222.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id k125so823753qkf.0
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Mar 2022 21:05:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=g9leHbN7dQtydQwkBSp8MU0LpuQhTTi34CtpVkROWsk=;
        b=W3f1VUG3IfSktZuz0etipR5/kfTJnTK97tGqXP/Sxgcp5kbdrucs0lpCd17Tj/J0Xj
         PBaoFP9ctH5qKjKrXofuBfLM553H1WaMNhv2BFeKFOGuLtUsRUCFTHKbPcyy/ltC1ubx
         IjC9O0jB4MJeNabbZCU7BPudFFRIH9CHFmEnr/LLIR21o3g6b9CBy0WIfiazD8Gr5Q2p
         cShH4d4P2k1ZL6yC8NyevBvl3dBdQ6UtVsotC3ukrJbp6o3LfeFh05yPB4LadRW0KBIn
         ChcxNSMS79maid0z70xCiHBdQxGh5ABoQ7WXx3bQ5GhZXaI6b6ypmB1RI2uVUeJBgBFk
         fDAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g9leHbN7dQtydQwkBSp8MU0LpuQhTTi34CtpVkROWsk=;
        b=iTeiVHYDClfmdYgW+DvOAJbSbMAvA2Mrz/t1qH8EItHD/M0qXgXxucP+QNBMoo1wEN
         TvW4hswBrqc/wtSNUe11V+UjEPJkpHZMhopkE8IjwfWlTQkrqYduzcP6mJgpTHW3fD6U
         WgglL5LjCqWwUBmsLrwDN+Ydz+mbDdGiSR1ZZAo12hkbKaNlDhhJxN4F2apFCttT437P
         bnKiPbxNpO8sTY7u2Jt1flerV9e2+n5+A7seMygT5SQP44+JoGrvloZ4oh4RLZ/ZbPmX
         9Fa/R4GnHR85bqHa//UrF1YkPVuQdQaWKqdd/s3x615NlYim+JzwBwQBT96ritAcKBYz
         GADQ==
X-Gm-Message-State: AOAM530abSfPK6ctrOWaWHLGX0Pf1+raB4+yjoOhbxKzJFDv7A7fqhz8
	SWsjOEe078uBuu01yQCfMaRMdJ9NxHsVHNqPjmI=
X-Google-Smtp-Source: 
 ABdhPJytqQMe5SFyo8JznHr3Nh/g+VjQbBYolWoF1Ob+xVry2/Nb/dZ0V8+TAJZ0fSZWtjeXIbh98dQi7NlO/PzPptY=
X-Received: by 2002:a05:620a:29c3:b0:67b:31ff:bfb2 with SMTP id
 s3-20020a05620a29c300b0067b31ffbfb2mr5275692qkp.463.1646975121904; Thu, 10
 Mar 2022 21:05:21 -0800 (PST)
MIME-Version: 1.0
References: <20220311041033.1684086-1-shin.matsunaga@fujitsu.com>
In-Reply-To: <20220311041033.1684086-1-shin.matsunaga@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 10 Mar 2022 21:04:55 -0800
Message-ID: 
 <CAMKF1sprmowXndi=Fuu0u6PxweGBtkWEt065SGNcb+x-6ZZqTQ@mail.gmail.com>
Subject: Re: [oe] [PATCH] ecryptfs-utils: add CVE-2016-1572 to allowlist
To: Matsunaga-Shinji <shin.matsunaga@fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Mar 2022 05:05:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95946

I guess this belongs to meta-security, please prefix the patch subject
with layer name [meta-security] in this case.

On Thu, Mar 10, 2022 at 8:14 PM Matsunaga-Shinji
<shin.matsunaga@fujitsu.com> wrote:
>
> Patch for CVE-2016-1572 is applied in version 109.
>
> Signed-off-by: matsunaga-shinji <shin.matsunaga@fujitsu.com>
> ---
>  recipes-security/ecryptfs-utils/ecryptfs-utils_111.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/recipes-security/ecryptfs-utils/ecryptfs-utils_111.bb b/recipes-security/ecryptfs-utils/ecryptfs-utils_111.bb
> index 9aefc32..d98724c 100644
> --- a/recipes-security/ecryptfs-utils/ecryptfs-utils_111.bb
> +++ b/recipes-security/ecryptfs-utils/ecryptfs-utils_111.bb
> @@ -68,3 +68,6 @@ FILES:${PN} += "${base_libdir}/security/* ${base_libdir}/ecryptfs/*"
>
>  RDEPENDS:${PN} += "cryptsetup"
>  RRECOMMENDS:${PN} = "gettext-runtime"
> +
> +# Patch for CVE-2016-1572 is applied in version 109.
> +CVE_CHECK_IGNORE += "CVE-2016-1572"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95945): https://lists.openembedded.org/g/openembedded-devel/message/95945
> Mute This Topic: https://lists.openembedded.org/mt/89704285/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

