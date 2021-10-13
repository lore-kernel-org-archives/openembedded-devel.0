Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A06CBC433EF
	for <webhook@archiver.kernel.org>; Wed, 13 Oct 2021 05:04:14 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web10.3929.1634101453269129463
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Oct 2021 22:04:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nY1NO0Bi;
 spf=pass (domain: gmail.com, ip: 209.85.160.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id w8so1504552qts.4
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Oct 2021 22:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3M9BoLzsEjOdF/0S2ey1BXuHePn831ysk12vhKXlQTg=;
        b=nY1NO0BiSdejTnt6H21DFYfK68oZM7CIykXGmw49xFd2QixiwMTKreYYqe1gFN1deX
         0UAWHX4sOd/yxqhIjmI73KnjYYH8G3jbqEZHlb8AzuIcTivi9SjAtBw2t/MomUILEcV1
         nUlRFFa8GXbglYC6uxLzHrH2nRIRoC0hRH0Y601+wvgzgnx3g47F9rx1JU6w96q33DES
         JAeqU6fho5iyQnkIZuLnpu1MIVipByVAikLefJzAVvT42VvepMsL8zi6Uv6+ncfkZYVW
         pPdKR0L0KxQ7qnA+JyRi26I1sW4XDLsV0mhbMk45bfINzrVOGu0uQWpSCJFbxun0AMvK
         /jGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3M9BoLzsEjOdF/0S2ey1BXuHePn831ysk12vhKXlQTg=;
        b=I5F+yqBBSFQH1HHlGdY0SEV74XMQmlxMtiAQqhCp3Xq/JxvWCdgxBF68bnXvFC5VZ5
         8CMJdYzpMbFBDw2mMRY6DZPQdOEe/1ZHrNBlWTs7TxFV9bjCbnU3bFCA59gX5Yw6izNS
         z4lCCp6915Je7odw+flCVDzUEBe6A4pi0OsjZX1MiG9zsJrmIGOJEY24jxZnwWBSe1PB
         1lIcLyiAzC9RQYP9bBEuMiS7aZkQ5JNZqVEUPvSp6jhSdSTFl+kuQH8J4mwQZm7Wv+kK
         16UsJ0k++BDFXFF7ArGi4ip664BV0CXpA7vh6oNJtaQpKPTy/ucgQVtkvo6sCu2/QFxd
         T4YA==
X-Gm-Message-State: AOAM533oAkf/M7wKpxfJoyBERrj347QAruPsdFsXMjG15S85JWahKFYF
	au0qh/k5mDjAAWUo1B7g4TnYG2yd6iR1CzQT070=
X-Google-Smtp-Source: 
 ABdhPJw8yykYt3/QPqSjMJnUXonludtE91+g/zyIj2uIm8EzBqNE61h6ttNjFchGXIrvNRXtxaT4rL6GUuzohXebHDY=
X-Received: by 2002:a05:622a:11d5:: with SMTP id
 n21mr28318782qtk.112.1634101452283;
 Tue, 12 Oct 2021 22:04:12 -0700 (PDT)
MIME-Version: 1.0
References: <20211012214827.3477092-1-raj.khem@gmail.com>
 <CANx9H-AGt0Z+cR59_Gk2ZXLOSij17xctcbG1nKDGqgUF73B5Gg@mail.gmail.com>
In-Reply-To: 
 <CANx9H-AGt0Z+cR59_Gk2ZXLOSij17xctcbG1nKDGqgUF73B5Gg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 12 Oct 2021 22:03:46 -0700
Message-ID: 
 <CAMKF1spiL4f9XPXfsu8GrT8bHkGsdEyhqMiaVX2-Gg7S8Et86g@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH 1/3] gjs: Inherit pkgconfig
To: Tim Orling <ticotimo@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Oct 2021 05:04:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93267

On Tue, Oct 12, 2021 at 7:20 PM Tim Orling <ticotimo@gmail.com> wrote:
>
>
>
> On Tue, Oct 12, 2021 at 2:48 PM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> Fixes
>> configure: error: Package requirements (glib-2.0 >= 2.58.0 gobject-2.0 >= 2.58.0 gio-2.0 >= 2.58.0 gobject-introspection-1.0 libffi gthread-2.0 gio-2.0 >= 2.58.0 mozjs-60) were not met:
>>
>> No package 'mozjs-60' found
>
>
> Thank you this. I caught it during a forthcoming upgrade to gjs that I have in the works.
>

I think the real issue is that I am using mozjs 91 and gjs is not yet
ready for this new mozjs version. The changes to support mozjs 91 are
in master
lets see when the new gjs release comes out until then it stays broken
with mozjs 91

>>
>> Consider adjusting the PKG_CONFIG_PATH environment variable if you
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>
>> ---
>>  meta-gnome/recipes-gnome/gjs/gjs_1.58.8.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-gnome/recipes-gnome/gjs/gjs_1.58.8.bb b/meta-gnome/recipes-gnome/gjs/gjs_1.58.8.bb
>> index ccac08d060..096e277bb4 100644
>> --- a/meta-gnome/recipes-gnome/gjs/gjs_1.58.8.bb
>> +++ b/meta-gnome/recipes-gnome/gjs/gjs_1.58.8.bb
>> @@ -9,7 +9,7 @@ GNOMEBASEBUILDCLASS = "autotools"
>>
>>  DEPENDS = "mozjs gtk+3"
>>
>> -inherit gnomebase gsettings gobject-introspection vala gettext features_check upstream-version-is-even
>> +inherit gnomebase gsettings gobject-introspection vala gettext features_check upstream-version-is-even pkgconfig
>>
>>  SRC_URI[archive.sha256sum] = "7fb3eb746c17363d9ee47f4a5d0bb048f0075611763eb0da11d85e0e57aff381"
>>  SRC_URI += "file://0001-Disable-tests-on-host.patch \
>> --
>> 2.33.0
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#93257): https://lists.openembedded.org/g/openembedded-devel/message/93257
>> Mute This Topic: https://lists.openembedded.org/mt/86274322/924729
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [ticotimo@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

