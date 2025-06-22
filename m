Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B903C7115A
	for <webhook@archiver.kernel.org>; Sun, 22 Jun 2025 09:17:20 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.23263.1750583838318316357
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Jun 2025 02:17:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GDUTOZnC;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: alperyasinak1@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b31d0dcfea3so2246818a12.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Jun 2025 02:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750583837; x=1751188637; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LRAvngFA7R+ulteq2D2nFW/3gr0MQZV6GD7zormE5dk=;
        b=GDUTOZnCQoZALvsoiezS87CaBF8X9CcWqsTqDCMBwW+eaVgbcK1H9Y3MreavkYr1ng
         nbrJ4m6odr235+ZQul4216RqnRUkze33Uf6QGz1lJtnyVsx1ugScL2vnRxE07u7IAUOK
         NnJkPGkwBRvTrInBh5M30RhOYvNXfBJH1Ovcn2BX/Q2w9Fym8vqw82rQ/DGbLlcweXMd
         XO2xNEVT6/kFNTc3Y3bRayfciZHPhy3ZlJYYvwh5YSWI/dsIjSj/6qdxaMhJeYKIkNEM
         nVHx82XAd/KTOa/CDEkvxJKOFOM6/8nUZuf0cXbHOC1Pw6RY6DazbInSvMVklCmjvQAO
         mYLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750583837; x=1751188637;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LRAvngFA7R+ulteq2D2nFW/3gr0MQZV6GD7zormE5dk=;
        b=TDAUg9if1G3njc9lg1I4M1ABsugpYz4p9RYElIJ+RCxJARENNfcNLU9dswnQcuBX1J
         0HtOdZbqrmZywqUh/ZkAF7Ue4VAmu1JYt37UISWb2PPvyA4h/aY3HgQ3nhpvs7IkCuw4
         GWQK6C6qCFU7AYit1FdIkPgficc9cNL43KovuJ+uVZfg8zQzZ8JrUUGuG+8Qk2NYQ584
         2tNx0rseDiqA44AcS6e4Fb7QSpb7LOPC1zbocTn3EMXWlii+eIjuYu6rYOEoiSIOjHkw
         1LfUnkUMLQ6fO+nG1HsjYKzFne2DbdEmRr8FZrseULSfhwtbDrDa3FXw3804/pDqe2+e
         hsoA==
X-Gm-Message-State: AOJu0Yw3jeyzAEfoM7WqYOlsaXr6J4Z+61aKyOYGsfrYcfDph9f0Sa5q
	AK/NS4mc6UpVjZTq4f9kIAknbgwrQdbul0JbalSb1DwiNnVyyzVN/vafWoft1zaOnRi8LPEvGJ+
	MbrlUAIiTEJLhAB/n+WJ574sxhPuI1wA=
X-Gm-Gg: ASbGncsDKw1p69rUq6t5kShODjPIbTJaed5W5WHLjvIISLSGzoiXDP91NxheEyheXn1
	MzFoFMLnM8i7ftMK0Lt8oG2+GJJ8NcI/aaNIRetkdqu7eIGPToqQSdG9Z3rCAc8fzWg8ZzxSI5E
	FHa55mpf3Elqc502Gx5DRk4JLY8Mf+H2FMBZwocLVBgAQ=
X-Google-Smtp-Source: AGHT+IHOd72JfBLX9PwGv7IKo/wXSwP+aBMGAjUVko4QlTo4CXeM10sos4FZOnH6RswPci3QrKGsN5U0OFc7obTLr9k=
X-Received: by 2002:a17:90b:4cc5:b0:312:639:a058 with SMTP id
 98e67ed59e1d1-3159d8d9d72mr12405265a91.27.1750583837361; Sun, 22 Jun 2025
 02:17:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250621102550.1523918-1-alperyasinak1@gmail.com> <CAMSfU+5ymAa0RFBaSkfuke3H_Bimui5sJn8_BNZ+yKE1hCvYSA@mail.gmail.com>
In-Reply-To: <CAMSfU+5ymAa0RFBaSkfuke3H_Bimui5sJn8_BNZ+yKE1hCvYSA@mail.gmail.com>
From: Alper Ak <alperyasinak1@gmail.com>
Date: Sun, 22 Jun 2025 12:17:06 +0300
X-Gm-Features: AX0GCFsSh-XLBGNa_eGkDpd1hXn6e41ZsUwKZMPVwJMr0i62nKdOnwzJjVJO4ak
Message-ID: <CAGpma=61wNNLVtKYC_okEvvU-31f2xP69=VtUKqHCJZC05Dy2g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] ace: Fix contains reference to TMPDIR
 [buildpaths] error
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 22 Jun 2025 09:17:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118018

> Hello,
> ${DEBUG_PREFIX_MAP} is usually in CXXFLAGS (set in poky/meta/conf/bitbake=
.conf)
> Do you know why it is not the case here? or why does it not work?
> Thanks!

Although Yocto/BitBake sets variables like CXXFLAGS and passes them to
the build environment, if i'm not wrong, these flags will only affect
the final compiler invocation if the project's own build system
actually uses those variables in its Makefiles or build scripts.

Looks like ACE doesn't use CXXFLAGS in its main Makefiles or compiler
calls.  Instead of it, it often uses variables like CCFLAGS, CPPFLAGS
or directly invokes the compiler using the CXX, without including
CXXFLAGS. As a result, any flags added to CXXFLAGS, such as
${DEBUG_PREFIX_MAP}, don't reach the compiler and the QA buildpaths
issue remains unresolved.

Appending the flag directly to CXX works because ACE always calls the
compiler as "$(CXX) ...", so anything added to CXX is included in
every compiler invocation regardless of how the build system is
structured.  As I said, I was found that ACE's Makefiles do include
CPPFLAGS in the compiler calls. So, adding ${DEBUG_PREFIX_MAP} to
CPPFLAGS allows the flag to be properly propagated to the compiler and
resolves the QA issue.

My thought before you asked the question was just "the problem is
caused by the project.". Now we have detailed it and figured out why.

It seems that our solution here should be CPPFLAGS:append =3D "
${DEBUG_PREFIX_MAP}". Let me know if I'm wrong or if there is a better
way.


Yoann Congal <yoann.congal@smile.fr>, 21 Haz 2025 Cmt, 16:00 tarihinde
=C5=9Funu yazd=C4=B1:
>
>
>
> Le sam. 21 juin 2025 =C3=A0 12:26, Alper Ak via lists.openembedded.org <a=
lperyasinak1=3Dgmail.com@lists.openembedded.org> a =C3=A9crit :
>>
>> ERROR: ace-8.0.2-r0 do_package_qa: QA Issue: File /usr/lib/.debug/libACE=
_Compression.so.8.0.2 in package ace-dbg contains reference to TMPDIR [buil=
dpaths]
>> ERROR: ace-8.0.2-r0 do_package_qa: QA Issue: File /usr/lib/.debug/libACE=
_ETCL_Parser.so.8.0.2 in package ace-dbg contains reference to TMPDIR [buil=
dpaths]
>> ERROR: ace-8.0.2-r0 do_package_qa: QA Issue: File /usr/lib/.debug/libACE=
_ETCL.so.8.0.2 in package ace-dbg contains reference to TMPDIR [buildpaths]
>> ERROR: ace-8.0.2-r0 do_package_qa: QA Issue: File /usr/lib/.debug/libACE=
.so.8.0.2 in package ace-dbg contains reference to TMPDIR [buildpaths]
>> ERROR: ace-8.0.2-r0 do_package_qa: QA Issue: File /usr/lib/.debug/libACE=
_Monitor_Control.so.8.0.2 in package ace-dbg contains reference to TMPDIR [=
buildpaths]
>> ERROR: ace-8.0.2-r0 do_package_qa: QA Issue: File /usr/lib/.debug/libACE=
_RLECompression.so.8.0.2 in package ace-dbg contains reference to TMPDIR [b=
uildpaths]
>> ERROR: ace-8.0.2-r0 do_package_qa: Fatal QA errors were found, failing t=
ask.
>>
>> Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
>> ---
>>  meta-oe/recipes-connectivity/ace/ace_8.0.2.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-oe/recipes-connectivity/ace/ace_8.0.2.bb b/meta-oe/rec=
ipes-connectivity/ace/ace_8.0.2.bb
>> index b730b0a86c..e62ed39d0b 100644
>> --- a/meta-oe/recipes-connectivity/ace/ace_8.0.2.bb
>> +++ b/meta-oe/recipes-connectivity/ace/ace_8.0.2.bb
>> @@ -27,7 +27,7 @@ export ACE_ROOT =3D "${UNPACKDIR}/ACE_wrappers"
>>  inherit pkgconfig
>>
>>  CXXFLAGS:append =3D " -fpermissive -Wnodeprecated-declarations"
>> -CXX:append =3D " -ffile-prefix-map=3D${UNPACKDIR}=3D "
>> +CXX:append =3D " ${DEBUG_PREFIX_MAP} -ffile-prefix-map=3D${UNPACKDIR}=
=3D "
>
>
> Hello,
>
> ${DEBUG_PREFIX_MAP} is usually in CXXFLAGS (set in poky/meta/conf/bitbake=
.conf)
>
> Do you know why it is not the case here? or why does it not work?
>
> Thanks!
>
>>
>>  EXTRA_OEMAKE +=3D "INSTALL_LIB=3D${baselib} install_rpath=3D0"
>>
>>  do_install() {
>> --
>> 2.43.0
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#117996): https://lists.openembedded.org/g/openembedd=
ed-devel/message/117996
>> Mute This Topic: https://lists.openembedded.org/mt/113755735/4316185
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [=
yoann.congal@smile.fr]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>
>
> --
> Yoann Congal
> Smile ECS

