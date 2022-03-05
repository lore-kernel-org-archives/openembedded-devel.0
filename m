Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A22AC433EF
	for <webhook@archiver.kernel.org>; Sat,  5 Mar 2022 21:49:10 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.9815.1646516949197265219
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Mar 2022 13:49:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hU+DxGEp;
 spf=pass (domain: gmail.com, ip: 209.85.216.52,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id
 k5-20020a17090a3cc500b001befa0d3102so7693652pjd.1
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Mar 2022 13:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=NqoTnogxfZBKDotnuU58eos1ZLCmdsQFEfRn+yU9BrY=;
        b=hU+DxGEpAuEhzKGpWT4G62QsEUVwa3Th13IR9Mi2DbrXjRHnbstzjrnaA1eFbSdb/G
         4mlBJONQO4I8dIyS+/sfBx8wkPosjWukuxj4zLwVz+/aza7GbJQgqL0rvNNV6YtT4VDi
         m+LlX2OEFxYuUoi6ftoYix7+1DboorLnnb3dlTm7r82PL/b0Lpv3wtTGJSfWXqDvbvoz
         AP0TPAJYDgRikeNwSRUL1NCijssGuFEQxro7wqd11A6U5xc9x7npUMTjCd+dw0rumgGL
         yZI1NtkIhx8KfEpzeifYEZZMu53knmOsdob83OTEf+CKL2kM8sKAArDWrwAeRLn69ZKh
         rZRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=NqoTnogxfZBKDotnuU58eos1ZLCmdsQFEfRn+yU9BrY=;
        b=cQlYvx2NsPLG22AedaerbQVYLAMJhLnv9qD8+rY9N7m2hik8PIzMFb1yhVIf0qPism
         ep6WAzlTvqeFqyJO4xPtWz36lSsfZIW8MeIXNgNYPDiKvfkdj55xPN0BFy+YCHsx3ux8
         3KFJj3cyA6lsKHakANkjpDFos5u3AHE77+fdqpNTO9nuMHF65pA8gE3dgZCKH+NHRho3
         LcBSbo+Qh/SnFTPzY1yKA0q/MEI1GOrm4c0jaf8JugAZaN1jc3P4XibuZ0NRGLKsUhQ8
         Wz2pA/f0UAdw+B1DTXiOL5OaroSTYHhiEyDrnDjCNnJzsEvo/bvC9MJBS2k4UOud3H0z
         uNYg==
X-Gm-Message-State: AOAM533snQN1hneAvO7CpCe+nKyhNxZk69N+NZgKNf8Je0aYDBM5D9X3
	Bm3LB061C9FuQWPrj1N8M5w=
X-Google-Smtp-Source: 
 ABdhPJy1vXfhQAqoIxp5ohV9BTVKKPd+czz0jORL3/2B+uhLTuNHi3PJ/SJ7Xs5fpJ759VQfr44lhg==
X-Received: by 2002:a17:902:b490:b0:151:6ee1:8034 with SMTP id
 y16-20020a170902b49000b001516ee18034mr5084824plr.28.1646516948470;
        Sat, 05 Mar 2022 13:49:08 -0800 (PST)
Received: from ?IPV6:2601:202:4180:a5c0:2999:fd67:72a5:6dc5?
 ([2601:202:4180:a5c0:2999:fd67:72a5:6dc5])
        by smtp.gmail.com with ESMTPSA id
 t14-20020a63f34e000000b00372738b27a4sm7547732pgj.42.2022.03.05.13.49.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Mar 2022 13:49:08 -0800 (PST)
Message-ID: <6a14ee75-6c38-c7c4-7942-09db621ac036@gmail.com>
Date: Sat, 5 Mar 2022 13:49:01 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [oe] [meta-oe][master][PATCH] libtinyxml2: fix packaging of test
 files
Content-Language: en-US
To: Nisha Parrakat <nishaparrakat@gmail.com>,
 openembedded-devel@lists.openembedded.org, raj.khem@gmail.com
References: <20220305213515.5572-1-nisha.m.parrakat@bmw.de>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <20220305213515.5572-1-nisha.m.parrakat@bmw.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 05 Mar 2022 21:49:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95808

Nisha,

thanks for the patch. feedback in-lined below.

On 3/5/22 13:35, Nisha Parrakat wrote:
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

This seems to confuse folks a lot. The "Upstream-Status" needs to be in 
the patch it self, not the commit message.

see below.

>
> Signed-off-by: Nisha Parrakat <nisha.m.parrakat@bmw.de>
> ---
>   ...y_resources_with_tests_in_CMakelists.patch | 30 +++++++++++++++++++
>   .../libtinyxml2/libtinyxml2_9.0.0.bb          |  4 ++-
>   2 files changed, 33 insertions(+), 1 deletion(-)
>   create mode 100644 meta-oe/recipes-support/libtinyxml2/files/copy_resources_with_tests_in_CMakelists.patch
>
> diff --git a/meta-oe/recipes-support/libtinyxml2/files/copy_resources_with_tests_in_CMakelists.patch b/meta-oe/recipes-support/libtinyxml2/files/copy_resources_with_tests_in_CMakelists.patch
> new file mode 100644
> index 000000000..09245ad36
> --- /dev/null
> +++ b/meta-oe/recipes-support/libtinyxml2/files/copy_resources_with_tests_in_CMakelists.patch
> @@ -0,0 +1,30 @@
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

Here:

Upstream-Status: Submitted (https://github.com/leethomason/tinyxml2/pull/902)


-armin
> +
> +Signed-off-by: Nisha Parrakat <nisha.m.parrakat@bmw.de>
> +Signed-off-by: Nisha Parrakat <nishaparrakat@gmail.com>
> +
> +Upstream-Status: Submitted (https://github.com/leethomason/tinyxml2/pull/902)
> +--- a/CMakeLists.txt	2022-03-05 22:00:33.361601287 +0100
> ++++ b/CMakelist.txt	2022-03-05 22:05:19.953940006 +0100
> +@@ -51,6 +51,12 @@
> +         WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}"
> +     )
> +
> ++    # Copy test resources and create test output directory
> ++    add_custom_command(TARGET xmltest POST_BUILD
> ++	COMMAND ${CMAKE_COMMAND} -E copy_directory ${CMAKE_CURRENT_SOURCE_DIR}/resources $<TARGET_FILE_DIR:xmltest>/resources
> ++	COMMAND ${CMAKE_COMMAND} -E make_directory $<TARGET_FILE_DIR:xmltest>/resources/out
> ++	COMMENT "Configuring xmltest resources directory: ${CMAKE_CURRENT_BINARY_DIR}/resources"
> ++    )
> +     set_tests_properties(xmltest PROPERTIES PASS_REGULAR_EXPRESSION ", Fail 0")
> + endif ()
> +
> diff --git a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_9.0.0.bb b/meta-oe/recipes-support/libtinyxml2/libtinyxml2_9.0.0.bb
> index 7f205987f..06410ab6e 100644
> --- a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_9.0.0.bb
> +++ b/meta-oe/recipes-support/libtinyxml2/libtinyxml2_9.0.0.bb
> @@ -4,7 +4,9 @@ SECTION = "libs"
>   LICENSE = "Zlib"
>   LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=135624eef03e1f1101b9ba9ac9b5fffd"
>   
> -SRC_URI = "git://github.com/leethomason/tinyxml2.git;branch=master;protocol=https"
> +SRC_URI = "git://github.com/leethomason/tinyxml2.git;branch=master;protocol=https \
> +           file://copy_resources_with_tests_in_CMakelists.patch \
> +          "
>   
>   SRCREV = "1dee28e51f9175a31955b9791c74c430fe13dc82"
>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95806): https://lists.openembedded.org/g/openembedded-devel/message/95806
> Mute This Topic: https://lists.openembedded.org/mt/89522514/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


