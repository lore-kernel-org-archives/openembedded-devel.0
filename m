Return-Path: <sanakazisk19@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A321EC433F5
	for <webhook@archiver.kernel.org>; Fri,  3 Dec 2021 12:30:16 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.10861.1638534615837439266
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Dec 2021 04:30:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ttuvockj;
 spf=pass (domain: gmail.com, ip: 209.85.216.51,
 mailfrom: sanakazisk19@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id
 cq22-20020a17090af99600b001a9550a17a5so5041692pjb.2
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Dec 2021 04:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=vEieqafpPnueAOoR7QGaMbd33IXVWYyYkKW6u7jvg2s=;
        b=TtuvockjLkEpXiC8qCl9ihjjRl84m9u5rvHNFOHL14WIhwGRnclHODwTuMY+LV9gbo
         quBXe5l9/noF8Jk/lPEhTJmnLhvyg3FLLiY+bJOrgRGGQO3YJLJKxnahLeuOVjhDEQJl
         56UC51IU1m5EVR6owq6LWUDgrrQs328PVxCZbBhtXjDL2aNoH6l2ViscrUNqBhNim9ni
         Jk7Tow70bqQP+Wfz58P0YlZOpXatoL+krWLOb/EC4xGSm122NYV14AplBGbAwCM5n3p1
         r3DeXxzUnwqU+JYIv2pOFLflR/BBC49xDzktyP4nRRjpRvbX8i89cvrTapG5Na5+9FTO
         0DsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=vEieqafpPnueAOoR7QGaMbd33IXVWYyYkKW6u7jvg2s=;
        b=A6LifM89/pSH1B1gpVKriH+H1t99C1FVJySWInivDB4cEkW0UWlHNYrjETcxnUK4xK
         Qu7L68zfNS5NoKy9sd9RjuGMbWZzg96oGk+k4pBowuD44G8scJQJvCCJPmCVUrSBd6pN
         myQpFDKvReTR5w4hnry3XHrfACqmjW2Vxa3eB6mw+BDYGA0lpl7lcgqa3O7WSGCV1Hx8
         sP6VETp6SFEtX2sn80BBUL2IEuI/6wrbPO1p5uNen6i2MguPwkKYX22O99qRZtZh94tE
         1aLRqtd+VTsDqd4Zf7Nl0OYLePMBOX2s4C4o7EXLGrAOrUauqKS8KyaoiM0NI/ApigJl
         AgdQ==
X-Gm-Message-State: AOAM532oOumqqbMpvAq+s6TkgHwDnpyDilFM2MSbxNYR/DUr6+MJbeYX
	v2yse7MqY/4Ry7/yK3unhUHcq4IBnU62iQ==
X-Google-Smtp-Source: 
 ABdhPJwmamncznNHOQ/FgTr3f7eS0YI9MWY6Hnl6VJI8873FbIC6C3qolMpIZBCOcTzoH8uByjdxOg==
X-Received: by 2002:a17:903:408c:b0:142:45a9:672c with SMTP id
 z12-20020a170903408c00b0014245a9672cmr22434583plc.7.1638534615029;
        Fri, 03 Dec 2021 04:30:15 -0800 (PST)
Received: from localhost.localdomain
 ([2401:4900:54f0:8398:fd18:923a:23c6:43e3])
        by smtp.gmail.com with ESMTPSA id
 d17sm3281923pfj.215.2021.12.03.04.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 04:30:14 -0800 (PST)
From: Sana Kazi <sanakazisk19@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Sana Kazi <sanakazisk19@gmail.com>
Subject: [oe][meta-networking][dunfell][PATCH 3/3] dovecot: Fix CVE-2020-12674
Date: Fri,  3 Dec 2021 17:59:58 +0530
Message-Id: <20211203122958.2366-1-sanakazisk19@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Dec 2021 12:30:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94201

Added patch for CVE-2020-12674

Link: http://archive.ubuntu.com/ubuntu/pool/main/d/dovecot/dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz

Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
Signed-off-by: Sana Kazi <sanakazisk19@gmail.com>
---
 ...uth-mech-rpa-Fail-on-zero-len-buffer.patch | 30 +++++++++++++++++++
 .../dovecot/dovecot_2.2.36.4.bb               |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta-networking/recipes-support/dovecot/dovecot/0001-auth-mech-rpa-Fail-on-zero-len-buffer.patch

diff --git a/meta-networking/recipes-support/dovecot/dovecot/0001-auth-mech-rpa-Fail-on-zero-len-buffer.patch b/meta-networking/recipes-support/dovecot/dovecot/0001-auth-mech-rpa-Fail-on-zero-len-buffer.patch
new file mode 100644
index 0000000000..5580cd409f
--- /dev/null
+++ b/meta-networking/recipes-support/dovecot/dovecot/0001-auth-mech-rpa-Fail-on-zero-len-buffer.patch
@@ -0,0 +1,30 @@
+From bd9d2fe7da833f0e4705a8280efc56930371806b Mon Sep 17 00:00:00 2001
+From: Aki Tuomi <aki.tuomi@open-xchange.com>
+Date: Wed, 6 May 2020 13:40:36 +0300
+Subject: [PATCH 1/3] auth: mech-rpa - Fail on zero len buffer
+
+---
+ src/auth/mech-rpa.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
+
+CVE: CVE-2020-12674
+Upstream-Status: Backport [http://archive.ubuntu.com/ubuntu/pool/main/d/dovecot/dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz]
+Comment: No change in any hunk
+
+diff --git a/src/auth/mech-rpa.c b/src/auth/mech-rpa.c
+index 08298ebdd6..2de8705b4f 100644
+--- a/src/auth/mech-rpa.c
++++ b/src/auth/mech-rpa.c
+@@ -224,7 +224,7 @@ rpa_read_buffer(pool_t pool, const unsigned char **data,
+ 		return 0;
+ 
+ 	len = *p++;
+-	if (p + len > end)
++	if (p + len > end || len == 0)
+ 		return 0;
+ 
+ 	*buffer = p_malloc(pool, len);
+-- 
+2.11.0
diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.2.36.4.bb b/meta-networking/recipes-support/dovecot/dovecot_2.2.36.4.bb
index e36e51c283..29905196b6 100644
--- a/meta-networking/recipes-support/dovecot/dovecot_2.2.36.4.bb
+++ b/meta-networking/recipes-support/dovecot/dovecot_2.2.36.4.bb
@@ -25,6 +25,7 @@ SRC_URI = "http://dovecot.org/releases/2.2/dovecot-${PV}.tar.gz \
            file://0013-lib-mail-Fix-parse_too_many_nested_mime_parts.patch \
            file://buffer_free_fix.patch \
            file://0002-lib-ntlm-Check-buffer-length-on-responses.patch \
+           file://0001-auth-mech-rpa-Fail-on-zero-len-buffer.patch \
            "
 
 SRC_URI[md5sum] = "66c4d71858b214afee5b390ee602dee2"
-- 
2.17.1


