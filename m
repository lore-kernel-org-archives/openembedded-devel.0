Return-Path: <jun.nie@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D632C77B7C
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 06:59:00 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.25758.1683615533541838512
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 May 2023 23:58:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=YfvRr4/S;
 spf=pass (domain: linaro.org, ip: 209.85.214.178, mailfrom: jun.nie@linaro.org)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1aae46e62e9so39263815ad.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 May 2023 23:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683615533; x=1686207533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kjmCgzp3gI3qq41jmx5MKJ+usrhi/yGXrg62g7cybjk=;
        b=YfvRr4/Sm8mXWGOlJN5JY695qRm+im7VXpZROxlFynfnBxhV6NV5f4xpDepwRPQmfS
         2fP1IZjyrX9cc4OvV3f0vBa6oiJGmyRcTUqIPOQxub6vVQQAiiu/eamFOKsa+4mz5e1u
         o4lTM83+GiSpv3GlEW3KmCDk2CKK2LqrtkewCs/rFy/vZfXNnz9Ktb0XVEQuWhVSlr5T
         cUJyNPNoDs+ktYDM1On0q8SV4STE/jPh/dKwaEyVCOOYM8OkcKcmrcryuIAfNfx8TJNK
         T8oYRvtpPZyGnu1/nTikg89PaB9MoQMiQ6TpIb4qoB2QzVmlgwfMdyBbrgxcyyywSWT0
         xrgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683615533; x=1686207533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kjmCgzp3gI3qq41jmx5MKJ+usrhi/yGXrg62g7cybjk=;
        b=TuJh7mTVOHxihqp9TiIdzEOry9m66rpQvT93VkVsBBlSWBM9HMRmoTSdZQCoVNeV+R
         OvhnJne9gN75ln7a6RzrDi5qjIOjKJXaN5H8N6WTeS8KY2WfqOc5gxOpWxsNOLWOVt0R
         QG4G47HV96r1vu0L6ZlsgeZcKkdj+Iwgwxlv0s5gBcuGCAJGiHfSkqQkMw854As8LDKW
         JSguQ/fHq/akKLjScPcX/qJbYPadCthZPJ9gnMlYcuv0iwax1ZxoEHBBzYC46ithqRPa
         nA4TTJM72gik84Boodzxxxvl1yxA8vclzfNMjF8EFX5bEotvFAr/WN93JrJY1pGNUXV+
         48Rw==
X-Gm-Message-State: AC+VfDyJKgmHo0WZPgFP8KIGMX2cNBP+veVfClWQ2ltI/Wz2uKWtx7L1
	+ZmIIHpkM/mvJ0cXRL94jExt/0EwCdViXeXjFvo=
X-Google-Smtp-Source: ACHHUZ406FBpdIHdTom7I04FofkHAUOXpt7WcwNd1sBTygJP+Fy1Qk+KHPlgjWYtcKGCa5tVd91RXg==
X-Received: by 2002:a17:903:11c4:b0:1a9:7365:fc2a with SMTP id q4-20020a17090311c400b001a97365fc2amr16339597plh.26.1683615533042;
        Mon, 08 May 2023 23:58:53 -0700 (PDT)
Received: from niej-dt-7B47.. (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id t24-20020a170902b21800b001a505f04a06sm700038plr.190.2023.05.08.23.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 23:58:52 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
To: richard@hughsie.com,
	raj.khem@gmail.com
Cc: openembedded-devel@lists.openembedded.org,
	Jun Nie <jun.nie@linaro.org>
Subject: [meta-oe 3/3] python3-uswid: Add initial support
Date: Tue,  9 May 2023 14:59:40 +0800
Message-Id: <20230509065940.1584276-4-jun.nie@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230509065940.1584276-1-jun.nie@linaro.org>
References: <20230509065940.1584276-1-jun.nie@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 06:59:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102467

Software Identification (SWID) tags provide an extensible XML-based structure
to identify and describe individual software components, patches, and
installation bundles.

CoSWID supports a similar set of semantics and features as SWID tags, as well
as new semantics that allow us to describe additional types of information,
all in a more memory efficient format.

python3-uswid is used to generate the CoSWID data blob. For example, fwupd
project requires CoSWID data to be embedded into firmware binary to hold the
version information.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 .../recipes-devtools/python/python3-uswid_git.bb  | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-uswid_git.bb

diff --git a/meta-python/recipes-devtools/python/python3-uswid_git.bb b/meta-python/recipes-devtools/python/python3-uswid_git.bb
new file mode 100644
index 0000000000..6b2089893f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-uswid_git.bb
@@ -0,0 +1,15 @@
+SUMMARY = "A pure-python library for embedding CoSWID data"
+HOMEPAGE = "https://github.com/hughsie/python-uswid"
+SECTION = "devel/python"
+LICENSE = "LGPL-2.1-or-later"
+
+DEPENDS += " python3-cbor2 python3-lxml python3-pefile"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=40d2542b8c43a3ec2b7f5da31a697b88"
+
+SRC_URI = "git://github.com/hughsie/python-uswid.git;branch=main;protocol=https"
+SRCREV = "3223034abef88ae29cf79fdc7fe11ec7e21e11ff"
+S = "${WORKDIR}/git"
+
+inherit setuptools3 python3native
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


