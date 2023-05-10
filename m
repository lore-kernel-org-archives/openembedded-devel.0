Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B981BC77B7D
	for <webhook@archiver.kernel.org>; Wed, 10 May 2023 13:44:09 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web10.17260.1683726243618948900
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 May 2023 06:44:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=pJLrB/O1;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-55c939fb24dso66989317b3.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 May 2023 06:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683726243; x=1686318243;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y0+t9scupvtYwjfuGo91L2qX5khGln0Bc+EK+u7hBBg=;
        b=pJLrB/O1TsfkdlyBfRPSJyF6gfEnX8v+V0jfzXpQMqf8EGrMithLPkE/Dd0My6LJsG
         bz5LYs+rsagSStP+CMOiVUatoFRgsbCJu77hfEtDWsp1TF+FV/csLqOGcGoYI3a3cnF0
         EsiCmSDPxx52fdaeNc7tqOQm1URfsufwoAcJftwxmTUmZcR5ZXOKsKReQ5h+4SlctgNA
         8uoNMA3CIyYG3RyLPSlJPNlUQOi/F3ChkPfDUud5Ejm25wkt5kqwrZl9QNNt6BfmAL1W
         G5STaA76ORer29XgFcLF4i2gOtoGuY6+sEPbHxcQDd8HJqV1tJic0/DrmSM239qxwwbW
         B+8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683726243; x=1686318243;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y0+t9scupvtYwjfuGo91L2qX5khGln0Bc+EK+u7hBBg=;
        b=QP07RFlPPdh9vZL+UXkV6ep8QeTiQCnAKFav69DmyloYYqNJ8Dd1SJbhyLhjsj4miK
         1UQpuRQEPbGtzkcLT2FEsevPIqUzWD1oZtfwrnJUU6QyttuYXMIvvm5LEukdvURKC9SZ
         xlrSv5Ia2hFkXtc7UgDDFESmDwVFfMLh4L/2Y38olQxAtThBuUug4wdNuRbw6GzK3Kgo
         qBHqarH+AtyNfa/Ce5lhUKSw3VAUtloj4DbVrMuiMqBbNhNHCkIgU09fpgzZCQTO/Wlp
         l0saWmCcCnBl4f9mxXjhm3VTUUTq65Pae97nl0QxtvdacwrqHvN9ouId2eWKVoTBexHY
         uhOw==
X-Gm-Message-State: AC+VfDzPfRT74cVKB7o4ciV5WR0ttwFgoeC+0sBvVUrNUzQuAM2yUGZR
	A0PX5p702fdWNyZHLnpUqzmq5ffr2BQ=
X-Google-Smtp-Source: ACHHUZ5hJo0CiZvTj4Jaq+WuRVocRVxL1KKrULcKDDB7L24VcqNVytuzo70Raoma9n/0yN/QwXlGeA==
X-Received: by 2002:a81:6cc6:0:b0:55a:3c8e:da37 with SMTP id h189-20020a816cc6000000b0055a3c8eda37mr19946316ywc.1.1683726242619;
        Wed, 10 May 2023 06:44:02 -0700 (PDT)
Received: from ?IPV6:2600:1700:9190:ba10:8122:c224:cc78:85c7? ([2600:1700:9190:ba10:8122:c224:cc78:85c7])
        by smtp.gmail.com with ESMTPSA id t204-20020a0dead5000000b0055a1069886fsm4063193ywe.129.2023.05.10.06.44.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 May 2023 06:44:01 -0700 (PDT)
Message-ID: <ce62c9b1-4a4e-7806-1fe7-c00155f5066e@gmail.com>
Date: Wed, 10 May 2023 09:44:01 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [oe]
 [meta-oe][master][mickledore][langdale][kirkstone][dunfell][PATCH] apache2:
 upgrade 2.4.56 -> 2.4.57
Content-Language: en-US
To: valeria.petrov@spinetix.com,
 "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <20230419133608.21415-1-valeria.petrov@spinetix.com>
 <ZR0P278MB0379D116A3DF0347A89767E0F1679@ZR0P278MB0379.CHEP278.PROD.OUTLOOK.COM>
 <GV0P278MB037292CCD7795E4475D80CCDF1679@GV0P278MB0372.CHEP278.PROD.OUTLOOK.COM>
 <GV0P278MB0372BC3906CEF8665DCB3796F1679@GV0P278MB0372.CHEP278.PROD.OUTLOOK.COM>
 <CAMKF1sp+uVAmX71kHp848ECD0HJU6eeOGnrFqP+=g7Ec29ZWcQ@mail.gmail.com>
 <ZR0P278MB037961755FD5E7A3AC9B3B0DF1649@ZR0P278MB0379.CHEP278.PROD.OUTLOOK.COM>
 <CAMKF1spHFXPLwiQp1N1HTpn71Y_gSemFBYsBQPoUafoV0_xFdA@mail.gmail.com>
 <ZR0P278MB037949AAECC0B4739455041AF1649@ZR0P278MB0379.CHEP278.PROD.OUTLOOK.COM>
 <ZR0P278MB0379861BF84AC65FB567E6ABF1769@ZR0P278MB0379.CHEP278.PROD.OUTLOOK.COM>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <ZR0P278MB0379861BF84AC65FB567E6ABF1769@ZR0P278MB0379.CHEP278.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 May 2023 13:44:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102531



On 5/9/23 10:12 AM, Valeria Petrov via lists.openembedded.org wrote:
> Ping.

for which branch? Langdale just landed the other should follow in do course.

- armin


>
> Thanks,
>
> -----Original Message-----
> From: Valeria Petrov
> Sent: Tuesday, 25 April 2023 17:45
> To: Khem Raj <raj.khem@gmail.com>
> Cc: openembedded-devel@lists.openembedded.org
> Subject: RE: [oe] [meta-oe][master][mickledore][langdale][kirkstone][dunfell][PATCH] apache2: upgrade 2.4.56 -> 2.4.57
>
> Khem,
>
> Thank you for your correction.
> You can put the Signed-off-by on my behalf.
>
> But if you prefer or if it's better, know that I can always send the patch properly.
> Thank you also for the link, I will take into account your advice for the next time.
>
> Have a nice day.
>
> Best regards,
> Valeria
>
>
> -----Original Message-----
> From: Khem Raj <raj.khem@gmail.com>
> Sent: Tuesday, 25 April 2023 17:22
> To: Valeria Petrov <Valeria.Petrov@spinetix.com>
> Cc: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-oe][master][mickledore][langdale][kirkstone][dunfell][PATCH] apache2: upgrade 2.4.56 -> 2.4.57
>
> Thanks, The patch still would not apply cleanly on master-next, I have manually fixed the conflicts and staged it on master-next this time.
> See
> https://git.openembedded.org/meta-openembedded/commit/?h=master-next&id=0b9305faa29f6e26871e7662391efbaae4ae92d9
>
> I see that it is missing Signed-off-by from the submitter as well, so in future keep that in mind. You can send a v3 with this. Or I can also add your sign-off to existing patch if you approve of it. Also read through below it is helpful in submission stuff.
>
> https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded
>
> On Tue, Apr 25, 2023 at 2:57 AM Valeria Petrov <Valeria.Petrov@spinetix.com> wrote:
>> Hello Khem,
>>
>> Thank you for your response.
>>
>> Indeed, I verified the patch from my duplicate mail sent on 2023-04-24 and I found the same problems.
>>
>> However, the correct version of the patch is the one I sent in my first message (on 2023-04-19) to the mailing list, which you can find at the following link:
>> https://patc/
>> hwork.yoctoproject.org%2Fproject%2Foe%2Fpatch%2F20230419133608.21415-1
>> -valeria.petrov%40spinetix.com%2F&data=05%7C01%7CValeria.Petrov%40spin
>> etix.com%7C48411cc8c146493f24ff08db45a0ed8d%7C5f4034faed2d4840a93facb1
>> e9633b93%7C0%7C0%7C638180329707265315%7CUnknown%7CTWFpbGZsb3d8eyJWIjoi
>> MC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7
>> C%7C&sdata=0um7yv%2FSR8a2EDdBXB2eG5gXrA2Glnu0Z7%2BPjhOJnps%3D&reserved
>> =0
>>
>> Please disregard the two emails I sent on 2023-04-24, as they contain errors. The correct version of the patch is the one I sent on 2023-04-19.
>>
>> Please let me know if you if you have the same problems with this one.
>>
>> Thank you for your understanding and apologies for any confusion caused.
>>
>> Best regards,
>> Valeria
>>
>>
>> -----Original Message-----
>> From: Khem Raj <raj.khem@gmail.com>
>> Sent: Monday, 24 April 2023 18:19
>> To: Valeria Petrov <Valeria.Petrov@spinetix.com>
>> Cc: openembedded-devel@lists.openembedded.org
>> Subject: Re: [oe]
>> [meta-oe][master][mickledore][langdale][kirkstone][dunfell][PATCH]
>> apache2: upgrade 2.4.56 -> 2.4.57
>>
>> Hello Valeria
>>
>> Thanks for your contribution. I tried to apply this patch and it can not be applied. Perhaps your email agent is not set up correctly or something. Secondly, the Upstream-Status in the patch seems to be edited to point to some intermediate URL as well. Please try to address it and send a v2.
>>
>> Thanks
>> -Khem
>>
>> On Mon, Apr 24, 2023 at 8:13 AM Valeria Petrov via lists.openembedded.org <valeria.petrov=spinetix.com@lists.openembedded.org> wrote:
>>> Hello,
>>>
>>> Sorry for the for any inconvenience caused by my duplicate email.
>>> Unfortunately, it appears that the email got stuck or did not go through due to technical issues, and I was not sure if you received it.
>>>
>>> Thank you for your understanding.
>>>
>>> Best regards,
>>> Valeria
>>>
>>> -----Original Message-----
>>> From: Valeria Petrov <Valeria.Petrov@spinetix.com>
>>> Sent: Monday, 24 April 2023 16:30
>>> To: openembedded-devel@lists.openembedded.org
>>> Cc: Valeria Petrov <Valeria.Petrov@spinetix.com>
>>> Subject:
>>> [meta-oe][master][mickledore][langdale][kirkstone][dunfell][PATCH]
>>> apache2: upgrade 2.4.56 -> 2.4.57
>>>
>>> Changelog:
>>> Changes with Apache 2.4.57
>>>
>>>    *) mod_proxy: Check before forwarding that a nocanon path has not been
>>>       rewritten with spaces during processing.  [Yann Ylavic]
>>>
>>>    *) mod_proxy: In case that AllowEncodedSlashes is set to NoDecode do not
>>>       double encode encoded slashes in the URL sent by the reverse proxy to the
>>>       backend. [Ruediger Pluem]
>>>
>>>    *) mod_http2: fixed a crash during connection termination. See PR 66539.
>>>       [Stefan Eissing]
>>>
>>>    *) mod_rewrite: Fix a 2.4.56 regression for substitutions ending
>>>       in a question mark. PR66547. [Eric Covener]
>>>
>>>    *) mod_rewrite: Add "BCTLS" and "BNE" RewriteRule flags. Re-allow encoded
>>>       characters on redirections without the "NE" flag.
>>>       [Yann Ylavic, Eric Covener]
>>>
>>>    *) mod_proxy: Fix double encoding of the uri-path of the request forwarded
>>>       to the origin server, when using mapping=encoded|servlet.
>>> [Yann Ylavic]
>>>
>>>    *) mod_mime: Do not match the extention against possible query string
>>>       parameters in case ProxyPass was used with the nocanon option.
>>>       [Ruediger Pluem]
>>>
>>> New patch:
>>> 0011-modules-mappers-config9.m4-Add-server-directory-to-i.patch
>>> Accepted in upstream, expected to be removed at next apache2 2.4.58 update.
>>> ---
>>>   ...config9.m4-Add-server-directory-to-i.patch | 31
>>> +++++++++++++++++++  .../{apache2_2.4.56.bb => apache2_2.4.57.bb}  |
>>> 3 +-
>>>   2 files changed, 33 insertions(+), 1 deletion(-)  create mode
>>> 100644
>>> meta-webserver/recipes-httpd/apache2/apache2/0011-modules-mappers-co
>>> nf ig9.m4-Add-server-directory-to-i.patch
>>>   rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.56.bb =>
>>> apache2_2.4.57.bb} (98%)
>>>
>>> diff --git
>>> a/meta-webserver/recipes-httpd/apache2/apache2/0011-modules-mappers-
>>> co nfig9.m4-Add-server-directory-to-i.patch
>>> b/meta-webserver/recipes-httpd/apache2/apache2/0011-modules-mappers-
>>> co nfig9.m4-Add-server-directory-to-i.patch
>>> new file mode 100644
>>> index 000000000..996eabf58
>>> --- /dev/null
>>> +++ b/meta-webserver/recipes-httpd/apache2/apache2/0011-modules-mapp
>>> +++ er
>>> +++ s- config9.m4-Add-server-directory-to-i.patch
>>> @@ -0,0 +1,31 @@
>>> +From 5c9257fa34335ff83f7c01581cf953111072a457 Mon Sep 17 00:00:00
>>> +2001
>>> +From: Valeria Petrov <valeria.petrov@spinetix.com>
>>> +Date: Tue, 18 Apr 2023 15:38:53 +0200
>>> +Subject: [PATCH] * modules/mappers/config9.m4: Add 'server'
>>> +directory to  include path if mod_rewrite is enabled.
>>> +
>>> +Upstream-Status: Accepted
>>> +[https://svn/.
>>> +apache.org%2Fviewvc%3Fview%3Drevision%26revision%3D1909241&data=05%
>>> +7C
>>> +01
>>> +%7Cvaleria.petrov%40spinetix.com%7Cdd425f6a28c44f7070f008db40db139b
>>> +%7
>>> +C5
>>> +f4034faed2d4840a93facb1e9633b93%7C0%7C0%7C638175081881994084%7CUnkn
>>> +ow
>>> +n%
>>> +7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiL
>>> +CJ
>>> +XV
>>> +CI6Mn0%3D%7C3000%7C%7C%7C&sdata=XR38OeEdzVwgIAn0s32t%2F%2BkxnRFiIv1
>>> +l2
>>> +ne
>>> +51BIRcwA%3D&reserved=0]
>>> +
>>> +---
>>> + modules/mappers/config9.m4 | 5 +++++
>>> + 1 file changed, 5 insertions(+)
>>> +
>>> +diff --git a/modules/mappers/config9.m4
>>> +b/modules/mappers/config9.m4 index 55a97ab993..7120b729b7 100644
>>> +--- a/modules/mappers/config9.m4
>>> ++++ b/modules/mappers/config9.m4
>>> +@@ -14,6 +14,11 @@ APACHE_MODULE(userdir, mapping of requests to
>>> +user-specific directories, , , mos  APACHE_MODULE(alias, mapping of
>>> +requests to different filesystem parts, , , yes)
>>> +APACHE_MODULE(rewrite, rule based URL manipulation, , , most)
>>> +
>>> ++if test "x$enable_rewrite" != "xno"; then
>>> ++    # mod_rewrite needs test_char.h
>>> ++    APR_ADDTO(INCLUDES, [-I\$(top_builddir)/server]) fi
>>> ++
>>> + APR_ADDTO(INCLUDES, [-I\$(top_srcdir)/$modpath_current])
>>> +
>>> + APACHE_MODPATH_FINISH
>>> +--
>>> +2.25.1
>>> +
>>> diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.56.bb
>>> b/meta-webserver/recipes-httpd/apache2/apache2_2.4.57.bb
>>> similarity index 98%
>>> rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.56.bb
>>> rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.57.bb
>>> index ed5690a4a..669d27756 100644
>>> --- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.56.bb
>>> +++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.57.bb
>>> @@ -15,6 +15,7 @@ SRC_URI = "${APACHE_MIRROR}/httpd/httpd-${PV}.tar.bz2 \
>>>              file://0007-apache2-allow-to-disable-selinux-support.patch \
>>>              file://0008-Fix-perl-install-directory-to-usr-bin.patch
>>> \
>>>
>>> file://0009-support-apxs.in-force-destdir-to-be-empty-string.patch \
>>> +
>>> + file://0011-modules-mappers-config9.m4-Add-server-directory-to-i.p
>>> + at
>>> + ch
>>> + \
>>>             "
>>>
>>>   SRC_URI:append:class-target = " \
>>> @@ -26,7 +27,7 @@ SRC_URI:append:class-target = " \
>>>              "
>>>
>>>   LIC_FILES_CHKSUM = "file://LICENSE;md5=bddeddfac80b2c9a882241d008bb41c3"
>>> -SRC_URI[sha256sum] = "d8d45f1398ba84edd05bb33ca7593ac2989b17cb9c7a0cafe5442d41afdb2d7c"
>>> +SRC_URI[sha256sum] = "dbccb84aee95e095edfbb81e5eb926ccd24e6ada55dcd83caecb262e5cf94d2a"
>>>
>>>   S = "${WORKDIR}/httpd-${PV}"
>>>
>>> --
>>> 2.25.1
>>>
>>>
>>>
>>>
>>>
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#102512): https://lists.openembedded.org/g/openembedded-devel/message/102512
>>> Mute This Topic: https://lists.openembedded.org/mt/98471662/3616698
>>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>


