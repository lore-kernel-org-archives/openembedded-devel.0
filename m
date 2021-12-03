Return-Path: <sanakazisk19@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BAA1C433FE
	for <webhook@archiver.kernel.org>; Fri,  3 Dec 2021 12:29:25 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web08.10944.1638534564722226250
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Dec 2021 04:29:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hFiuUSwS;
 spf=pass (domain: gmail.com, ip: 209.85.210.174,
 mailfrom: sanakazisk19@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id u80so2761479pfc.9
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Dec 2021 04:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=hUENN41hxQ/Z/nyz40dtHipHy+8V49FjnJMZixErBtc=;
        b=hFiuUSwSu4XC48UUYeLKQ+Xo3nYX3tcEhP/3j5PyTBg0NkaXnof8rTXVMqeAXUmZi8
         YbtiONWUcuRBG4ScL+VfSllW/uVeZTKLnxGcz0aNRNcAuATWfGscdvQXgNg2ujvQctO0
         oZd9GJ22z0pkWR43rLd+mEWhFg6R+2v8SkRqTziulI8jx1e30dBy4AnzNlSe+p84bfIl
         lGtYisqu9u2MH9iiwzkL/DZqmAV9mFlAlpV8lPdNUHf+n4hcw8HyunM1mnVKH6PQv9MR
         zBiyIZ7/jSTS3wjIY5yUHhO2GGbmK9qqfM1qqcxJalAsLgkaE1XKdkikjXKhcPCu9LIL
         GBlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=hUENN41hxQ/Z/nyz40dtHipHy+8V49FjnJMZixErBtc=;
        b=tuxEtZrM3ih4Md8tFrhh47VzO308sJXguPevJIax2JF4KiWcpiP366w215eGFAjyyI
         aWcsSonH3nKrXYZP4eEMbd8RASa9jpsxw5BpAXT0Riy8210pa9Vleyw58xB5YlHseZKg
         CIaRChIxrXNy9cs9zZAIc8RTVJE+GjKAmDc3tffdXH1J8DoFWStDZWo8o1Trw2nQzy9X
         ey9iZBCVk5QNFUlK0L+do0yylxIsSdw6JQY4x78wPSW30/u0XY1+JhcM/EQokO+Bzc8Q
         XNVN4Uu2yyXJQ2WLDG1Lzt6cAAxFDbU4FnlaP/7Pjh/cTTO4WoJzIELqCD1eU6eWN+JV
         VGtw==
X-Gm-Message-State: AOAM5334b6odBMuUV2Gt1GThUUKYk9v0FrsxMwD6IpVJOgu9kgzaPVBb
	KRnZdb9dmyZFPWekPreuxRoXRe9aoMOLzQ==
X-Google-Smtp-Source: 
 ABdhPJwG8s2+yj/HrSKrsAgWummB1JMD+QYyp7RO2ydvTGG/dATvZZQcE+Wj2N2cpnjuoPNmShv5gw==
X-Received: by 2002:a05:6a00:1ad3:b0:4a0:36d:d067 with SMTP id
 f19-20020a056a001ad300b004a0036dd067mr18498607pfv.19.1638534563874;
        Fri, 03 Dec 2021 04:29:23 -0800 (PST)
Received: from localhost.localdomain
 ([2401:4900:54f0:8398:fd18:923a:23c6:43e3])
        by smtp.gmail.com with ESMTPSA id
 pf15sm5562836pjb.40.2021.12.03.04.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 04:29:22 -0800 (PST)
From: Sana Kazi <sanakazisk19@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Sana Kazi <sanakazisk19@gmail.com>
Subject: [oe][meta-networking][dunfell][PATCH 2/3] dovecot: Fix CVE-2020-12673
Date: Fri,  3 Dec 2021 17:59:08 +0530
Message-Id: <20211203122908.2130-1-sanakazisk19@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Dec 2021 12:29:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94200

Added patch for CVE-2020-12673

Link: http://archive.ubuntu.com/ubuntu/pool/main/d/dovecot/dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz

Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
Signed-off-by: Sana Kazi <sanakazisk19@gmail.com>
---
 ...tlm-Check-buffer-length-on-responses.patch | 37 +++++++++++++++++++
 .../dovecot/dovecot_2.2.36.4.bb               |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta-networking/recipes-support/dovecot/dovecot/0002-lib-ntlm-Check-buffer-length-on-responses.patch

diff --git a/meta-networking/recipes-support/dovecot/dovecot/0002-lib-ntlm-Check-buffer-length-on-responses.patch b/meta-networking/recipes-support/dovecot/dovecot/0002-lib-ntlm-Check-buffer-length-on-responses.patch
new file mode 100644
index 0000000000..81aead8aad
--- /dev/null
+++ b/meta-networking/recipes-support/dovecot/dovecot/0002-lib-ntlm-Check-buffer-length-on-responses.patch
@@ -0,0 +1,37 @@
+Backport of:
+
+From 1c6405d3026e5ceae3d214d63945bba85251af4c Mon Sep 17 00:00:00 2001
+From: Aki Tuomi <aki.tuomi@open-xchange.com>
+Date: Mon, 18 May 2020 12:33:39 +0300
+Subject: [PATCH 2/3] lib-ntlm: Check buffer length on responses
+
+Add missing check for buffer length.
+
+If this is not checked, it is possible to send message which
+causes read past buffer bug.
+
+Broken in c7480644202e5451fbed448508ea29a25cffc99c
+---
+ src/lib-ntlm/ntlm-message.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
+
+CVE: CVE-2020-12673
+Upstream-Status: Backport [http://archive.ubuntu.com/ubuntu/pool/main/d/dovecot/dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz]
+Comment: No change in any hunk
+
+--- a/src/lib-ntlm/ntlm-message.c
++++ b/src/lib-ntlm/ntlm-message.c
+@@ -184,6 +184,11 @@ static int ntlmssp_check_buffer(const st
+ 	if (length == 0 && space == 0)
+ 		return 1;
+ 
++	if (length > data_size) {
++		*error = "buffer length out of bounds";
++		return 0;
++	}
++
+ 	if (offset >= data_size) {
+ 		*error = "buffer offset out of bounds";
+ 		return 0;
diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.2.36.4.bb b/meta-networking/recipes-support/dovecot/dovecot_2.2.36.4.bb
index 407604c819..e36e51c283 100644
--- a/meta-networking/recipes-support/dovecot/dovecot_2.2.36.4.bb
+++ b/meta-networking/recipes-support/dovecot/dovecot_2.2.36.4.bb
@@ -24,6 +24,7 @@ SRC_URI = "http://dovecot.org/releases/2.2/dovecot-${PV}.tar.gz \
            file://0012-lib-mail-Fix-handling-trailing-in-MIME-boundaries.patch \
            file://0013-lib-mail-Fix-parse_too_many_nested_mime_parts.patch \
            file://buffer_free_fix.patch \
+           file://0002-lib-ntlm-Check-buffer-length-on-responses.patch \
            "
 
 SRC_URI[md5sum] = "66c4d71858b214afee5b390ee602dee2"
-- 
2.17.1


