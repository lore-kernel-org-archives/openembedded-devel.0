Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C3E2C433EF
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 07:07:58 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web09.4566.1646377677086755582
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Mar 2022 23:07:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lQBWsT7A;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 8so6006074qvf.2
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Mar 2022 23:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4I1+jG/OylOahkX/aOAh8ngt4bo+IUcG6+zTm+grzDg=;
        b=lQBWsT7ATS9sai1wiWOeM4yRaCREYcROioCODKcw+wpphnEkW9dS1sp4lkb+NdKmtK
         5L7iphEBxB0W6G/sGrppmrIFrDxaK/sAiPNOQpMz1c05ePcwT5jLoB1yQKg4OL8FLIJ9
         qLnfS4g8z6konH6+k0/oSPcvZloJZU8/GJ/YIzMc+qiasIQJ/uQ5LHBhoQknx1GoNgQ9
         ecbpxrIqpB47u9HAHyTk7vWVDxz+nE24O2q7r9oSSahBM/wYzcwMa0rjsWvyYxzmZE1e
         qt0TP6FSULkoU274gDhapW8TTXgqfXhDYuXmTtfoklMzl0SRn09wX6GmZrB9fRZnJtnI
         hJbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4I1+jG/OylOahkX/aOAh8ngt4bo+IUcG6+zTm+grzDg=;
        b=7WRy+2YZcaOWSj5DReCcldDgKMNXla7Oc7J1FUY6mm/VNfC0+BfP2VBJZcAOgjMr6Q
         oir2citne+DWPC6UW8LB5VX3JbbSLRTXUT+qMw/Yf1g9uBW8MGpEhasP38hs10SpXnZF
         JseoYr5kXCFnw4YI34l6iHN7cHQ/EFzw40qpa1OD8TupXAe1RfcKAaDzVLT7KI9NkAP2
         oONcIqekYfh0qoB6oLuEaaTEnPOb3/WX7YTvnpenlOOHlAwj1mC3hfBHdCxyIyTMVCZ6
         nyVfK5RQiNX8IR/vDJDK4EQqS1BzkVAsyipE04Y7Kw9mJXeGnhQjzC2ifSY4iiD/BeTT
         dCgw==
X-Gm-Message-State: AOAM53056CcfR0jBPWUnJ90mJnLVN2Vnlei71tk8es6/UX6MQm+4SceT
	yAgyEXTn9Uk47JSeIb78kocJlf1oYMIWcQW9s3I=
X-Google-Smtp-Source: 
 ABdhPJzLem/XXux13jtjWBSkuSaG6pvSDkRA81lgoBQtoEqNe8H1uSMn7kgsGRFfGdD09Nw9oyMlc/sgDhnpgd3ZeNU=
X-Received: by 2002:ad4:5ca7:0:b0:435:49f5:394b with SMTP id
 q7-20020ad45ca7000000b0043549f5394bmr2263034qvh.36.1646377676029; Thu, 03 Mar
 2022 23:07:56 -0800 (PST)
MIME-Version: 1.0
References: <20220303102758.36283-1-nisha.m.parrakat@bmw.de>
In-Reply-To: <20220303102758.36283-1-nisha.m.parrakat@bmw.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 3 Mar 2022 23:07:28 -0800
Message-ID: 
 <CAMKF1spxuZyhzZmNU1EKoiX+hrQ279gWBJQ0gd43_WshF7ca1g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][master][PATCH] libtinyxml2: fix packaging of test
 files
To: Nisha Parrakat <nishaparrakat@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Mar 2022 07:07:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95766

this patch does not apply cleanly, how has this patch been tested ?

patching file CMakeLists.txt
Hunk #1 FAILED at 50 (different line endings).
1 out of 1 hunk FAILED -- rejects in file CMakeLists.txt
Patch copy_resources_with_tests_in_CMakelists.patch does not apply
(enforce with -f)

also see

https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1479

On Thu, Mar 3, 2022 at 2:28 AM Nisha Parrakat <nishaparrakat@gmail.com> wrote:
>
> The xml files inside the resources are to be used for the
> run of test named xmltest
> they were not getting copied from the source directory to the directory
> where xmltest was installed
>
> fixes the below error when code built with cmake
> ./xmltest
> Error opening test file 'dream.xml'.
> Is your working directory the same as where
> the xmltest.cpp and dream.xml file are?
>
> Upstream-Status: Submitted (https://github.com/leethomason/tinyxml2/pull/902)
>
> Signed-off-by: Nisha Parrakat <nisha.m.parrakat@bmw.de>
> ---
>  ...y_resources_with_tests_in_CMakelists.patch | 31 +++++++++++++++++++
>  .../libtinyxml2/libtinyxml2_9.0.0.bb          |  4 ++-
>  2 files changed, 34 insertions(+), 1 deletion(-)
>  create mode 100644 meta-oe/recipes-support/libtinyxml2/files/copy_resources_with_tests_in_CMakelists.patch
>
> diff --git a/meta-oe/recipes-support/libtinyxml2/files/copy_resources_with_tests_in_CMakelists.patch b/meta-oe/recipes-support/libtinyxml2/files/copy_resources_with_tests_in_CMakelists.patch
> new file mode 100644
> index 000000000..ac05dc2ae
> --- /dev/null
> +++ b/meta-oe/recipes-support/libtinyxml2/files/copy_resources_with_tests_in_CMakelists.patch
> @@ -0,0 +1,31 @@
> +The xml files inside the resources are to be used for the
> +run of test named xmltest
> +they were not getting copied from the source directory to the directory
> +where xmltest was installed
> +
> +fixes the below error when code built with cmake
> +./xmltest
> +Error opening test file 'dream.xml'.
> +Is your working directory the same as where
> +the xmltest.cpp and dream.xml file are?
> +
> +Signed-off-by: Nisha Parrakat <nisha.m.parrakat@bmw.de>
> +Signed-off-by: Nisha Parrakat <nishaparrakat@gmail.com>
> +
> +Upstream-Status: Submitted (https://github.com/leethomason/tinyxml2/pull/902)
> +--- a/CMakeLists.txt   2022-03-01 12:28:46.780447542 +0000
> ++++ b/CMakeLists.txt   2022-03-01 12:28:55.951951478 +0000
> +@@ -50,7 +50,12 @@
> +         COMMAND xmltest
> +         WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}"
> +     )
> +-
> ++     # Copy test resources and create test output directory
> ++    add_custom_command(TARGET xmltest POST_BUILD
> ++        COMMAND ${CMAKE_COMMAND} -E copy_directory ${CMAKE_CURRENT_SOURCE_DIR}/resources $<TARGET_FILE_DIR:xmltest>/resources
> ++        COMMAND ${CMAKE_COMMAND} -E make_directory $<TARGET_FILE_DIR:xmltest>/resources/out
> ++        COMMENT "Configuring xmltest resources directory: ${CMAKE_CURRENT_BINARY_DIR}/resources"
> ++    )
> +     set_tests_properties(xmltest PROPERTIES PASS_REGULAR_EXPRESSION ", Fail 0")
> + endif ()
> +
> diff --git a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_9.0.0.bb b/meta-oe/recipes-support/libtinyxml2/libtinyxml2_9.0.0.bb
> index 7f205987f..06410ab6e 100644
> --- a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_9.0.0.bb
> +++ b/meta-oe/recipes-support/libtinyxml2/libtinyxml2_9.0.0.bb
> @@ -4,7 +4,9 @@ SECTION = "libs"
>  LICENSE = "Zlib"
>  LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=135624eef03e1f1101b9ba9ac9b5fffd"
>
> -SRC_URI = "git://github.com/leethomason/tinyxml2.git;branch=master;protocol=https"
> +SRC_URI = "git://github.com/leethomason/tinyxml2.git;branch=master;protocol=https \
> +           file://copy_resources_with_tests_in_CMakelists.patch \
> +          "
>
>  SRCREV = "1dee28e51f9175a31955b9791c74c430fe13dc82"
>
> --
> 2.17.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95737): https://lists.openembedded.org/g/openembedded-devel/message/95737
> Mute This Topic: https://lists.openembedded.org/mt/89522514/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

