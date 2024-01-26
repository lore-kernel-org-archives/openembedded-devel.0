Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3673C47422
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 15:44:17 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.930.1706283848482225684
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Jan 2024 07:44:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RgziLBhd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3394b892691so336734f8f.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Jan 2024 07:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1706283847; x=1706888647; darn=lists.openembedded.org;
        h=mime-version:user-agent:autocrypt:references:date:to:from:subject
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ie00hYX3Gc+TQktfwgz1hHmNc3IIY3VdchRqu4JAi2I=;
        b=RgziLBhd/HBm51SOHjCaJoFOTi0zSlwZ0RzJv1yF7YASGwZuMpcmIke2hjiWQwMjJQ
         Z5/cEyCQgvOJWNSKqw4oKuL2LkDtkjGkr2xReAOL+Je2WBDQRBQgWNjNYMVuMedMe7II
         RVFV6YPHduRjA/FdELAwVUCdkfzOH4m5g1OIY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706283847; x=1706888647;
        h=mime-version:user-agent:autocrypt:references:date:to:from:subject
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ie00hYX3Gc+TQktfwgz1hHmNc3IIY3VdchRqu4JAi2I=;
        b=ORYeUJxPBfO6OkdVMM3qht05nZ8eDgpJrHtS4X53nx0nC3NP9t/L7QOCtVSR2/ujVl
         LFl1XogwgPLr5vb15LwEM4agRei/AUpgp9p7jeMnl7InfVFAaOmilTrZjfL4cCKM8tSN
         Vuri0/KdqeEtdPS5uuWZO9FzFHaM2HFS/PL7tLTEPO/YiFZeAWJhE7TGvHPq7GHZcsGN
         JqVMU34dOlJbfJ+/d/gWEE7eJQ5I2BOiTvRNV2ZqXMc5yCn8pug02u3x91BjsawhEK3g
         kFadeqf5IQKXpsF6K8woRhULG9fZkfvFxKXd8w6DzKLhuiQ7nXh4gQvRylWIt240mpoo
         +3Fw==
X-Gm-Message-State: AOJu0YyelmXgGwP8iZ43yInU8vnZRkHx21QddY7yhIebRxp+6KOzouNx
	L4dHEbqVp95M/ZOxlpeZL3Jt+U0utJi7d2dc9yaPHsvzB7RBBu8U1Z7aNAqAdpqhUjJNF+6L/tH
	c
X-Google-Smtp-Source: AGHT+IF29sOZtdAk44Sp1x6FIZA/sXSY5COoViuPxic9UFDNiZRGBUvlfRXzc72f9gwEG9tvk6T7wg==
X-Received: by 2002:a5d:534e:0:b0:339:47d7:6527 with SMTP id t14-20020a5d534e000000b0033947d76527mr880262wrv.0.1706283846468;
        Fri, 26 Jan 2024 07:44:06 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:eef:5a49:b13d:a655? ([2001:8b0:aba:5f3c:eef:5a49:b13d:a655])
        by smtp.gmail.com with ESMTPSA id d2-20020adf9c82000000b0033929310ae4sm1510440wre.73.2024.01.26.07.44.05
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 07:44:06 -0800 (PST)
Message-ID: <16604c51c5eb7649ea454e2dd011b0e0105c879e.camel@linuxfoundation.org>
Subject: Fwd: [yocto] [yocto-autobuilder2][PATCH] schedulers: drop
 meta-oe-mirror and reproducible-meta-oe from SWAT monitoring
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Date: Fri, 26 Jan 2024 15:44:05 +0000
References: <20240126153952.1596315-1-alexandre.belloni@bootlin.com>
Autocrypt: addr=richard.purdie@linuxfoundation.org; prefer-encrypt=mutual; keydata=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
 YNvg==
Content-Type: multipart/mixed; boundary="=-7aUJNut82Uo5b+pTUQWn"
User-Agent: Evolution 3.50.0-1 
MIME-Version: 1.0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Jan 2024 15:44:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108462

--=-7aUJNut82Uo5b+pTUQWn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi All,

I just wanted to make sure people using meta-openembedded see this.

The implication here is that we're not seeing improvements to the point
where Yocto Project can keep up with the failures being generated from
meta-openembedded so were having to take it out some of our processes.

We can add it back if things improve.

Cheers,

Richard

--=-7aUJNut82Uo5b+pTUQWn
Content-Disposition: inline
Content-Description: Forwarded message =?UTF-8?Q?=E2=80=94?= [yocto]
 [yocto-autobuilder2][PATCH] schedulers: drop meta-oe-mirror and
 reproducible-meta-oe from SWAT monitoring
Content-Type: message/rfc822

Return-Path: <richard.purdie+caf_=rpurdie=rpsys.net@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on dan.rpsys.net
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=6.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
Authentication-Results: dan.rpsys.net; dkim=pass (1024-bit key;
 unprotected) header.d=lists.yoctoproject.org
 header.i=@lists.yoctoproject.org header.a=rsa-sha256 header.s=20140610
 header.b=b5UORzug; dkim-atps=neutral
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com
 [209.85.219.170]) by dan.rpsys.net (8.15.2/8.15.2/Debian-22ubuntu3) with
 ESMTPS id 40QFf8iS3794136 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256
 bits=128 verify=NOT) for <rpurdie@rpsys.net>; Fri, 26 Jan 2024 15:41:10 GMT
Received: by mail-yb1-f170.google.com with SMTP id
 3f1490d57ef6-dc25e12cc63so1655501276.0 for <rpurdie@rpsys.net>; Fri, 26 Jan
 2024 07:41:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1e100.net;
 s=20230601; t=1706283603; x=1706888403;
 h=list-unsubscribe:list-unsubscribe-post:reply-to:delivered-to
 :mailing-list:list-id:sender:list-help:list-subscribe:precedence
 :mime-version:message-id:date:subject:cc:to:from:dkim-signature
 :delivered-to:x-forwarded-for:x-forwarded-to:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ueMi+uaULq7PM4lhmmhhyd41azNnkwsb3dWdFFVhy14=;
 b=Jf9Uol0T7SGVyyrirQ+02Dkc1vKhPooj53cT6NuB3q7hvaCByNoR9Ef5rwRF9EFN2t
 3iCjaN/E1nZGpclTXnX1U6wOfKbJIlDZDhTxfcGBYuXerJqQoanrjmoe13vlz/pC+KEz
 NdQV9cBSgw8Ze2aCcqwftBHikLviMD72BAsmJjY6GVgipUYdYWxlJR3bII5GZcR5oZqg
 vgToJ6l39OQZKPAqMiLdoSdasCgWojwQQlv1DrYB9m9jPtEdd657pAKPmFOYGFZUMGIF
 1MHatKpgMCMALG3RYVZ3kyXjPQRAzUbcjc1Ie0UChdHQFAutE03MGtYhUpHpiee3cDtS q+tA==
X-Gm-Message-State: 
 AOJu0YznHWud7MW2fzCB5rrqoFrygAQ7nH8WFoqId1e5KIM4Bx4IsvPh
 XmD1sVTKAbSkpqQKqC7uBf7JQngl8GYJt8Z7VQq/eurtDKsoRid3VaIIYOa7O96VzvAyLposEn7
 cMMPa/FO5OnVylBs8ogrtEMzyLIBRL4gJ53PopACG+PqllOhh3BNYvz21jLR5oCQnAkd6SGfCOF
 Ko
X-Received: by 2002:a25:d6cb:0:b0:dc6:3571:a5fd with SMTP id
 n194-20020a25d6cb000000b00dc63571a5fdmr35223ybg.23.1706283603332; Fri, 26
 Jan 2024 07:40:03 -0800 (PST)
X-Forwarded-To: rpurdie@rpsys.net
X-Forwarded-For: richard.purdie@linuxfoundation.org rpurdie@rpsys.net
Delivered-To: richard.purdie@linuxfoundation.org
Received: by 2002:a05:7010:cb0f:b0:3aa:f774:dbee with SMTP id
 ix15csp51211mdb; Fri, 26 Jan 2024 07:40:01 -0800 (PST)
X-Google-Smtp-Source: 
 AGHT+IFvrMNY8SSsrD2QTsVnze+WDOAky21K565PL5eVDIgGXiI508skN7k5sHI1TeyRJSAY65oN
X-Received: by 2002:a05:6a00:21c9:b0:6d9:bf50:196e with SMTP id
 t9-20020a056a0021c900b006d9bf50196emr1621854pfj.19.1706283601693; Fri, 26
 Jan 2024 07:40:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706283601; cv=none; d=google.com;
 s=arc-20160816;
 b=lNxMGTTSEPB5zYc5Aw3DSlMvp6z9iKSyPyqUqWiHuFdZHtzUUmATtJwMkxSY20FqDL
 Ol3d2H/vml00o6e+vQizoDFlpStjcapo3BqZ8ymvHjKjyTv1dM709QRAr33ia9MB2/iP
 nXCsKcAnCrujdA/1KXd3AjjmuPqywO3Yl3s0zoi64Zs11VCbrqgBVgkWALIHCUDGPmip
 m4WSUdQ92TAx2/0ejo5iPbG+gWCrC9Nt0UqWJa8Y6cbNkdu45/K0AqHsxpE8mS7I4hVE
 MlFwE4NID9rFo6Bg919CqJ1vp2g/tc4bs3CxVOTjndPgtFXh4J6rTi3pOLuADgVxSz3o LcCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20160816;
 h=list-unsubscribe:list-unsubscribe-post:reply-to:delivered-to
 :mailing-list:list-id:sender:list-help:list-subscribe:precedence
 :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
 bh=ueMi+uaULq7PM4lhmmhhyd41azNnkwsb3dWdFFVhy14=;
 fh=37SjlLaIG4WV+v6+wl7W6lSWfdEXDzCTTB2Ms3ATECw=;
 b=S+TwcWXcs4MchTyfKYTu3y6TmzhM9cxq+r7O3Z+YxAfHs3frhBTgI/ifHMpXrSmtTt
 5ATbkuJu0aGqyT4ptx1MiXqJg3NW2WZAqBZL/UJnwEVPgTYGxeUcQY1XcLa/Jm1w9HZO
 OYNf9SgZDPW+U7qLNDhLqMCH005CL0whP40iHWsARkiyl8SoJuHGvb3JwQ+6tWOHoLbD
 M5W8bzLTAiGM6L4fCBAYavQOdaZn2Z517Cx2QntT0CH1ver0ReN84Q3GdBjnqvotCRpY
 nOFq2Fdl8KDvZVXZyr6oQIB+A5xVfalca4jyPlHi4DjVa0KL/jSuxGhidzah/9x9CRDV qknQ==
ARC-Authentication-Results: i=1; mx.google.com; dkim=pass
 header.i=@lists.yoctoproject.org header.s=20140610 header.b=b5UORzug;
 spf=pass (google.com: domain of
 bounce+53643+62302+1686473+6692191@lists.yoctoproject.org designates
 66.175.222.12 as permitted sender)
 smtp.mailfrom=bounce+53643+62302+1686473+6692191@lists.yoctoproject.org;
 dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=yoctoproject.org
Received: from mail01.groups.io (web01.groups.io. [66.175.222.12]) by
 mx.google.com with ESMTPS id
 t25-20020a62d159000000b006dbdbe0a9b8si1330672pfl.209.2024.01.26.07.40.01
 for <richard.purdie@linuxfoundation.org> (version=TLS1_3
 cipher=TLS_AES_128_GCM_SHA256 bits=128/128); Fri, 26 Jan 2024 07:40:01
 -0800 (PST)
Received-SPF: pass (google.com: domain of
 bounce+53643+62302+1686473+6692191@lists.yoctoproject.org designates
 66.175.222.12 as permitted sender) client-ip=66.175.222.12;
Authentication-Results: mx.google.com; dkim=pass
 header.i=@lists.yoctoproject.org header.s=20140610 header.b=b5UORzug;
 spf=pass (google.com: domain of
 bounce+53643+62302+1686473+6692191@lists.yoctoproject.org designates
 66.175.222.12 as permitted sender)
 smtp.mailfrom=bounce+53643+62302+1686473+6692191@lists.yoctoproject.org;
 dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=yoctoproject.org
DKIM-Signature: a=rsa-sha256;
 bh=HcRpBzHFAAeFlay+mfU850OC3W6QLo7DaMljwuuty5I=; c=relaxed/simple;
 d=lists.yoctoproject.org;
 h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Precedence:List-Subscribe:List-Help:Sender:List-Id:Mailing-List:Delivered-To:Reply-To:List-Unsubscribe-Post:List-Unsubscribe:Content-Type;
 s=20140610; t=1706283601; v=1;
 b=b5UORzughSTO4tbo4J0HEiXodiKKDIcWFxsIXL36DIXJu11esbx5KTlFSQv2HL/mfe/Ojxy1
 jznoRvwFJHJ101kABrQrwlvxJec30IcWd9LDoAyoL4f3U0zoKRcA9nd6qj+22tgXxxizhgWr9et
 qcWmzTnkFHfdMqZOtYMYn/Gw=
X-Received: by 127.0.0.2 with SMTP id J4dOYY1687808xeYie5d7wuz; Fri, 26 Jan
 2024 07:40:01 -0800
X-Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199]) by mx.groups.io with SMTP id
 smtpd.web10.766.1706283598376487825 for <yocto@lists.yoctoproject.org>;
 Fri, 26 Jan 2024 07:39:58 -0800
X-Received: by mail.gandi.net (Postfix) with ESMTPSA id D59B4FF804;
	Fri, 26 Jan 2024 15:39:55 +0000 (UTC)
From: "Alexandre Belloni via lists.yoctoproject.org" <alexandre.belloni=bootlin.com@lists.yoctoproject.org>
To: yocto@lists.yoctoproject.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [yocto] [yocto-autobuilder2][PATCH] schedulers: drop
 meta-oe-mirror and reproducible-meta-oe from SWAT monitoring
Date: Fri, 26 Jan 2024 16:39:52 +0100
Message-ID: <20240126153952.1596315-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: alexandre.belloni@bootlin.com
Precedence: Bulk
List-Subscribe: <mailto:yocto+subscribe@lists.yoctoproject.org>
List-Help: <mailto:yocto+help@lists.yoctoproject.org>
Sender: yocto@lists.yoctoproject.org
List-Id: <yocto.lists.yoctoproject.org>
Mailing-List: list yocto@lists.yoctoproject.org; contact
 yocto+owner@lists.yoctoproject.org
Delivered-To: mailing list yocto@lists.yoctoproject.org
Reply-To: yocto@lists.yoctoproject.org, alexandre.belloni@bootlin.com
List-Unsubscribe-Post: List-Unsubscribe=One-Click
List-Unsubscribe: 
 <https://lists.yoctoproject.org/g/yocto/leave/6692191/1686473/1860277780/plugh>
Content-Type: multipart/mixed; boundary="YeAvFtxT14wdqxL8vIPx"
X-Virus-Scanned: clamav-milter 0.103.9 at dan
X-Virus-Status: Clean

--YeAvFtxT14wdqxL8vIPx
Content-Transfer-Encoding: 8bit

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 schedulers.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/schedulers.py b/schedulers.py
index 9ffa88f5f384..5ddcc7a68ce9 100644
--- a/schedulers.py
+++ b/schedulers.py
@@ -283,6 +283,8 @@ def repos_for_builder(buildername):
 def parent_default_props(buildername, branchname=None):
     props = {}
     props["swat_monitor"] = True
+    if buildername in ['reproducible-meta-oe', 'meta-oe-mirror']:
+        props["swat_monitor"] = False
     repos = config.buildertorepos.get(buildername)
     if not repos:
         repos = config.buildertorepos["default"]
-- 
2.43.0


--YeAvFtxT14wdqxL8vIPx
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#62302): https://lists.yoctoproject.org/g/yocto/message/=
62302
Mute This Topic: https://lists.yoctoproject.org/mt/103978367/1686473
Group Owner: yocto+owner@lists.yoctoproject.org
Unsubscribe: https://lists.yoctoproject.org/g/yocto/unsub [richard.purdie@l=
inuxfoundation.org]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


--YeAvFtxT14wdqxL8vIPx--


--=-7aUJNut82Uo5b+pTUQWn--

