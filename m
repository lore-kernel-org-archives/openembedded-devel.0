Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6428BC433EF
	for <webhook@archiver.kernel.org>; Sun,  6 Mar 2022 03:55:54 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web09.12754.1646538953334327249
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Mar 2022 19:55:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ibRQdqqn;
 spf=pass (domain: gmail.com, ip: 209.85.160.171,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id w1so10718941qtj.2
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Mar 2022 19:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eoaWXhcsElyTfdtZ11CWIsomyQ1MJjrH2MJXkUiAj30=;
        b=ibRQdqqnLe+0M5UptVWFj8yEclB7iL2nv2CLVFJ5o3LyQ1WU9ajr8XsFPlcaubFxLY
         m79+p/lNmkKkHHaSrIn2UQAJIyo8vv6Ck2P5vnz7AeXIb+fj520OO6R3XILVpJvhWfxK
         fsHeMBjA1qsaHD0PyNZ7aULeGVljxJ3QNNRvYmqaNae4kEeBvn/39bs7PY2WFeAX8sYl
         gNq25dAzfNKi19ZAIBKqrC7rbz+pqviWElFGznItNQpw6elbsntaR8vQrAqFO5VTPOiW
         EjzubhpYBMGsXGlaOlEHOoFUGlq8v1SPY9itkVWW1o67/n6SWXYIzTRehGyC7RXUKGto
         Gi3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eoaWXhcsElyTfdtZ11CWIsomyQ1MJjrH2MJXkUiAj30=;
        b=6tpx7DHSM7sIvIA1EmYi+y5RxKsCygn5RbB102N1aWT/MYV62xfBYQKA0OTWY5HcC1
         3//4e3KPn5JeWnDP2kV5TRxcnmDIFr7WCJ20WxR/Z3rYJ9KhSWsn+XgW/FA2IxML25/a
         hWaajUT8wrt64Zhe8vHZrwBrIyKdf7NUbtelRlVsUAuUkD76l6WDzEtM0f/+hlh57m06
         7e4zxLyukBCELlWz71rYzluKwN5jAkBtE5imIUkfAmuVximUjqiCgh00tiB4SYIhzv1m
         +aSabpg8O1q7mz8tKrYQGbGDl5dK2lSyLy0DFM9c6iS8gTLRy7qRZk2KTT2v2nywRBj7
         77pw==
X-Gm-Message-State: AOAM531t/xeZtk7xhC0eakaIEGIBidWEtEIhp9zkyXpv5TNWdfvwngOn
	6Ine1G6IaU8HrUxA7EGraTFWrgaoulAm11NGMNI=
X-Google-Smtp-Source: 
 ABdhPJyERi/ObCqaJe4abRoKqf1NErVqEQufzDaH3JP/NbrINB8llJBgGKODrZXep7JUAd1K7D71CiHUQRPWF7++g9c=
X-Received: by 2002:ac8:7dd1:0:b0:2de:600:a5ab with SMTP id
 c17-20020ac87dd1000000b002de0600a5abmr4900638qte.532.1646538952380; Sat, 05
 Mar 2022 19:55:52 -0800 (PST)
MIME-Version: 1.0
References: <20220305213515.5572-1-nisha.m.parrakat@bmw.de>
 <6a14ee75-6c38-c7c4-7942-09db621ac036@gmail.com>
In-Reply-To: <6a14ee75-6c38-c7c4-7942-09db621ac036@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 5 Mar 2022 19:55:26 -0800
Message-ID: 
 <CAMKF1spcUmsW=1sVwH7jCXVaobTTLLQ7=3i1ODgVk3qf+Q3V7A@mail.gmail.com>
Subject: Re: [oe] [meta-oe][master][PATCH] libtinyxml2: fix packaging of test
 files
To: akuster808 <akuster808@gmail.com>
Cc: Nisha Parrakat <nishaparrakat@gmail.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 06 Mar 2022 03:55:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95809

this patch does not apply again

https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1488

On Sat, Mar 5, 2022 at 1:49 PM akuster808 <akuster808@gmail.com> wrote:
>
> Nisha,
>
> thanks for the patch. feedback in-lined below.
>
> On 3/5/22 13:35, Nisha Parrakat wrote:
> > The xml files inside the resources are to be used for the
> > run of test named xmltest
> > they were not getting copied from the source directory to the directory
> > where xmltest was installed
> >
> > fixes the below error when code built with cmake
> > ./xmltest
> > Error opening test file 'dream.xml'.
> > Is your working directory the same as where
> > the xmltest.cpp and dream.xml file are?
> >
> > Upstream-Status: Submitted (https://github.com/leethomason/tinyxml2/pull/902)
>
> This seems to confuse folks a lot. The "Upstream-Status" needs to be in
> the patch it self, not the commit message.
>
> see below.
>
> >
> > Signed-off-by: Nisha Parrakat <nisha.m.parrakat@bmw.de>
> > ---
> >   ...y_resources_with_tests_in_CMakelists.patch | 30 +++++++++++++++++++
> >   .../libtinyxml2/libtinyxml2_9.0.0.bb          |  4 ++-
> >   2 files changed, 33 insertions(+), 1 deletion(-)
> >   create mode 100644 meta-oe/recipes-support/libtinyxml2/files/copy_resources_with_tests_in_CMakelists.patch
> >
> > diff --git a/meta-oe/recipes-support/libtinyxml2/files/copy_resources_with_tests_in_CMakelists.patch b/meta-oe/recipes-support/libtinyxml2/files/copy_resources_with_tests_in_CMakelists.patch
> > new file mode 100644
> > index 000000000..09245ad36
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/libtinyxml2/files/copy_resources_with_tests_in_CMakelists.patch
> > @@ -0,0 +1,30 @@
> > +The xml files inside the resources are to be used for the
> > +run of test named xmltest
> > +they were not getting copied from the source directory to the directory
> > +where xmltest was installed
> > +
> > +fixes the below error when code built with cmake
> > +./xmltest
> > +Error opening test file 'dream.xml'.
> > +Is your working directory the same as where
> > +the xmltest.cpp and dream.xml file are?
>
> Here:
>
> Upstream-Status: Submitted (https://github.com/leethomason/tinyxml2/pull/902)
>
>
> -armin
> > +
> > +Signed-off-by: Nisha Parrakat <nisha.m.parrakat@bmw.de>
> > +Signed-off-by: Nisha Parrakat <nishaparrakat@gmail.com>
> > +
> > +Upstream-Status: Submitted (https://github.com/leethomason/tinyxml2/pull/902)
> > +--- a/CMakeLists.txt 2022-03-05 22:00:33.361601287 +0100
> > ++++ b/CMakelist.txt  2022-03-05 22:05:19.953940006 +0100
> > +@@ -51,6 +51,12 @@
> > +         WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}"
> > +     )
> > +
> > ++    # Copy test resources and create test output directory
> > ++    add_custom_command(TARGET xmltest POST_BUILD
> > ++    COMMAND ${CMAKE_COMMAND} -E copy_directory ${CMAKE_CURRENT_SOURCE_DIR}/resources $<TARGET_FILE_DIR:xmltest>/resources
> > ++    COMMAND ${CMAKE_COMMAND} -E make_directory $<TARGET_FILE_DIR:xmltest>/resources/out
> > ++    COMMENT "Configuring xmltest resources directory: ${CMAKE_CURRENT_BINARY_DIR}/resources"
> > ++    )
> > +     set_tests_properties(xmltest PROPERTIES PASS_REGULAR_EXPRESSION ", Fail 0")
> > + endif ()
> > +
> > diff --git a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_9.0.0.bb b/meta-oe/recipes-support/libtinyxml2/libtinyxml2_9.0.0.bb
> > index 7f205987f..06410ab6e 100644
> > --- a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_9.0.0.bb
> > +++ b/meta-oe/recipes-support/libtinyxml2/libtinyxml2_9.0.0.bb
> > @@ -4,7 +4,9 @@ SECTION = "libs"
> >   LICENSE = "Zlib"
> >   LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=135624eef03e1f1101b9ba9ac9b5fffd"
> >
> > -SRC_URI = "git://github.com/leethomason/tinyxml2.git;branch=master;protocol=https"
> > +SRC_URI = "git://github.com/leethomason/tinyxml2.git;branch=master;protocol=https \
> > +           file://copy_resources_with_tests_in_CMakelists.patch \
> > +          "
> >
> >   SRCREV = "1dee28e51f9175a31955b9791c74c430fe13dc82"
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#95806): https://lists.openembedded.org/g/openembedded-devel/message/95806
> > Mute This Topic: https://lists.openembedded.org/mt/89522514/3616698
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>

