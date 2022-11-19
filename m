Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F2EEC4332F
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 15:58:57 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web11.23298.1668873535752006538
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Nov 2022 07:58:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=a9mQIhsv;
 spf=pass (domain: gmail.com, ip: 209.85.160.171, mailfrom: akuster808@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id h21so4961262qtu.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 07:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dDEbofX4lA6D8x8iC26MozM5U2dyUXKXven13nSAz1w=;
        b=a9mQIhsvnkNFX0G5yl/dpezb7JD8/7G7gzkFfU5Y8+VNR1gc0sKn6imtPoWBhGNeIE
         lJQUssOdj51/7gTzbxIzDNjfa00Y54pmLcfDUMghUcL/iDe1mNMbWUfW7EGUQZIjQAhF
         OqOhaK6n3TJPZN3GVME1fRtjVPUIAi+e6EKFp0xw0XnpU/9qf5pBFMnt6OuRaNmqprfh
         Vg9v9PVMajwNztiHtiBnZN2CLxCIWSXLkuh/617OX+sPxlKPHeLIEEWiuReF4j8Yp3KM
         VKxOQRhocCf7cXBDNxnJmp8xukvZNHv1fgja9yjVvjanrREdV6G8HT3iqqfOjOqRAw5R
         LGaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dDEbofX4lA6D8x8iC26MozM5U2dyUXKXven13nSAz1w=;
        b=xcGbsC8B6wjmFtmM1DaNTQNMdh2w39MdHeSIFI3WqJhBckgtuNbrbxJe05My8Hhx7d
         aC+OQ/gkl3K0DmpbQDZ0UT7RX+YKnJwt9HV09x5WN/xEbqfbNqtUwBIN8Y994YBP1xfu
         4eJvX8hMmRUTTwT8aH1AuRlyRpdV0Q8HVpD8EKcT9DnAj7HED+ri7P8DUET7P6/ooeqD
         7bPvB8wiyXAH4If1vAtJgtBKMr3qrrZUvriDNntZQ8aN7t6oKqZnqXcRj2t+4jIfIKIj
         pQOLJYeWk3nL092FpUqudVv3s7oA639Tz8j/IuOcqROZmMNL/MnivDp+i1DRoU0hbecg
         kHsw==
X-Gm-Message-State: ANoB5pnGD5RJzcTOKtV5ggX0kQRrul5ftyrTyYn2SMQoBnohyL1sza+a
	teoD+ptPIduL8fJIA9XWou5jJ1SKW1SFsQ==
X-Google-Smtp-Source: AA0mqf4pQxo0wbE7kd8agQdH8BL8nNlqCNqWuWdnSoWWvPMAytAfh9tJir48OQbDmh8XovurpXDBcg==
X-Received: by 2002:ac8:7608:0:b0:3a5:6797:c57a with SMTP id t8-20020ac87608000000b003a56797c57amr11088686qtq.34.1668873534425;
        Sat, 19 Nov 2022 07:58:54 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:8dbe:f48d:8b1a:1569])
        by smtp.gmail.com with ESMTPSA id c7-20020a05620a268700b006fb112f512csm4821314qkp.74.2022.11.19.07.58.53
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 07:58:53 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 34/35] chrony: Make it possible to enable editline support again
Date: Sat, 19 Nov 2022 10:57:58 -0500
Message-Id: <aa811aa7762109661c8978d19ef930059d07d63f.1668873377.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668873377.git.akuster808@gmail.com>
References: <cover.1668873377.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 15:58:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99673

From: Peter Kjellerstedt <pkj@axis.com>

Support for readline was dropped in Chrony 4.2. However, the
--disable-readline option still remains (it is used to completely ignore
all forms of command line editing, even though the only remaining
variant is editline). So keeping the readline PACKAGECONFIG and making
it pass --disable-readline when it is not enabled disabled support for
editline, and if it was enabled it instead passed --without-editline,
which also disabled support for editline. Thus there was no way to
enable editline support.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 .../recipes-support/chrony/chrony_4.3.bb            | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/meta-networking/recipes-support/chrony/chrony_4.3.bb b/meta-networking/recipes-support/chrony/chrony_4.3.bb
index d0e2c4b540..dad09f826c 100644
--- a/meta-networking/recipes-support/chrony/chrony_4.3.bb
+++ b/meta-networking/recipes-support/chrony/chrony_4.3.bb
@@ -53,14 +53,6 @@ USERADD_PACKAGES = "${@bb.utils.contains('PACKAGECONFIG', 'privdrop', '${PN}', '
 USERADD_PARAM:${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'privdrop', '--system -d / -M --shell /bin/nologin chronyd;', '', d)}"
 
 # Configuration options:
-# - For command line editing support in chronyc, you may specify either
-#   'editline' or 'readline' but not both.  editline is smaller, but
-#   many systems already have readline for other purposes so you might want
-#   to choose that instead.  However, beware license incompatibility
-#   since chrony is GPLv2 and readline versions after 6.0 are GPLv3+.
-#   You can of course choose neither, but if you're that tight on space
-#   consider dropping chronyc entirely (you can use it remotely with
-#   appropriate chrony.conf options).
 # - Security-related:
 #   - 'sechash' is omitted by default because it pulls in nss which is huge.
 #   - 'privdrop' allows chronyd to run as non-root; would need changes to
@@ -70,7 +62,6 @@ USERADD_PARAM:${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'privdrop', '--sys
 PACKAGECONFIG ??= "editline \
     ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
 "
-PACKAGECONFIG[readline] = "--without-editline,--disable-readline,readline"
 PACKAGECONFIG[editline] = ",--without-editline,libedit"
 PACKAGECONFIG[sechash] = "--without-tomcrypt,--disable-sechash,nss"
 PACKAGECONFIG[privdrop] = "--with-libcap,--disable-privdrop --without-libcap,libcap"
@@ -79,6 +70,10 @@ PACKAGECONFIG[ipv6] = ",--disable-ipv6,"
 PACKAGECONFIG[nss] = "--with-nss,--without-nss,nss"
 PACKAGECONFIG[libcap] = "--with-libcap,--without-libcap,libcap"
 
+# This is left for backwards compatibility, to avoid breaking existing
+# configurations.
+PACKAGECONFIG[readline] = ""
+
 # --disable-static isn't supported by chrony's configure script.
 DISABLE_STATIC = ""
 
-- 
2.25.1


