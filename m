Return-Path: <omri.sarig13@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73C94C35FFA
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 13:15:31 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.7457.1742390129133979783
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Mar 2025 06:15:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SbCmdCGV;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: omri.sarig13@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54954fa61c8so6851911e87.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 06:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742390127; x=1742994927; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M7DZtK0Bh8UP4mzDPXPGZgJTty+QWwy7MeycgUujNmc=;
        b=SbCmdCGVLxEtho2RkAmzJmkn4K7DrrS5gtogV2a2CVlsjT3pArBQwjtvmfCHM0Ysnq
         y4rKYEA+k0uqiwnpG0oGh7BsZ8np8nHWBANza+sInE1rojcS5AWcvI38d9YMb8CwWO2A
         QF4HCIC0aXnDBcb9Y9eqIFS4Ygg10x0d8Xt+KPv4ylWqHXRVvXuUzDZYz1oRWnElQ5sx
         zblUKgZMfQFzIXAn9oiFNUwVC0L2oysmnBUwvNlk1ZSYSJjeBLSVDhw6TQTkA1gMPyu1
         0vEjHUTWYzFn3NnByAti1H3IyFpBfN9UMQNq3THdf6STzEl28KL6XhAktzw3DtJeSKna
         ehZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742390127; x=1742994927;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M7DZtK0Bh8UP4mzDPXPGZgJTty+QWwy7MeycgUujNmc=;
        b=FOXjmm+gmDDr2kgo9DJARbKiiaXJvjBx+d9oR4x8uMenfxjfqdElFSDrFRrf8M2LfM
         mw4vH6lLUjCRZmp/ZNvbK1CNwaPUMlO4+lpNVrztrVKNbeeMKqGySrJBLo3IK6J4ETBz
         IXSUidX1lqBZMen4jLk32ibxAoHAR8bxzkf/PTqPeQ+ep1KKvdjaIwliYEGoQ7bXExXt
         lH6/xsdOpNPdU9vGvNBMfpP5NXdVh7oRmwS0CSBE0gsnSpqw8/xiqYLPAEAQZDPfpSLq
         XtJQPhy0LDRfvIsOHl4SXurUH2aG9t3gEjTame0fGQT1KsQRbAZ6KDi5vOSeD4DpI/GZ
         7r5A==
X-Gm-Message-State: AOJu0YzWZghjCzz5bdTDM/Fcvdp5nAK/NNbyJAtaVdlVjhxMXlPlj9y+
	MRY6I46pXOQDy4nH0xzeaJ5JDpZh3JGMXf7MwnNavcjX2uIlCXtaO1yNiRNW
X-Gm-Gg: ASbGncu44nsg4PyMCjaItqASJUaefLEQdH6i4yLQwSyBDOgABYSOQemZOqiN6YTDGNc
	MDhfgWnzzNPmP4JkYiQouJrA6IMX+5E+xvKx+6Z5jaXIO9I/drYc5e4PWcPBKy45Mpt/mvRfaf6
	DOuL9OVT4htAEvtxkYecy3ymCqvDOaADZWZQ4Y8gmLBiKWsBMUsNjoZnW5w2b8zjL6BBd4PWoiW
	hNIU0mbFPiaG69E4M5HGE9PB8Vphjg6i9FN2ZJXpcRWcomFp7lVbhZnZSAk+FPpEuwFI61Bi5qk
	hNRlXVcTiitY3gL7WjZm7WYOUliGZSt9PXD5yfkmXsVXsG2dVnFwCpPhHuJYyL+8hYGHgyObAfv
	EzGb39JxKsIU63GjR/Odl3BPRIoo=
X-Google-Smtp-Source: AGHT+IGK9PdppymWl0Ge5gBra1ovRP6m/5rKeg6imN2Y727puThnMcNPxHcniifuSPiRls5XbyIWoA==
X-Received: by 2002:a05:6512:3d17:b0:545:2871:7cd5 with SMTP id 2adb3069b0e04-54acb1b6ce0mr1136495e87.15.1742390126779;
        Wed, 19 Mar 2025 06:15:26 -0700 (PDT)
Received: from omsa-HP-EliteBook-840-14-inch-G9-Notebook-PC.prevas.se ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f1c22a1sm23370041fa.86.2025.03.19.06.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 06:15:26 -0700 (PDT)
From: Omri Sarig <omri.sarig13@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Omri Sarig <omri.sarig13@gmail.com>
Subject: [meta-networking][PATCH] chrony: Add nts support through PACKAGECONFIG
Date: Wed, 19 Mar 2025 14:14:07 +0100
Message-ID: <20250319131407.609660-1-omri.sarig13@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 13:15:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116077

Chronyd is supporting NTS (network time security) protocol, however, to
build the application with this support, it require having gnutls at
build time.
This commit adds a PACKAGECONFIG line, allowing users to control whether
the supporting application will have nts or not.

Signed-off-by: Omri Sarig <omri.sarig13@gmail.com>
---
 meta-networking/recipes-support/chrony/chrony_4.6.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-support/chrony/chrony_4.6.1.bb b/meta-networking/recipes-support/chrony/chrony_4.6.1.bb
index e45d5c6ba0..83dee9143b 100644
--- a/meta-networking/recipes-support/chrony/chrony_4.6.1.bb
+++ b/meta-networking/recipes-support/chrony/chrony_4.6.1.bb
@@ -67,6 +67,7 @@ PACKAGECONFIG[sechash] = "--without-tomcrypt,--disable-sechash,nss"
 PACKAGECONFIG[privdrop] = ",--disable-privdrop,libcap"
 PACKAGECONFIG[scfilter] = "--enable-scfilter,--without-seccomp,libseccomp"
 PACKAGECONFIG[ipv6] = ",--disable-ipv6,"
+PACKAGECONFIG[nts] = ",--disable-nts,gnutls"
 
 # --disable-static isn't supported by chrony's configure script.
 DISABLE_STATIC = ""

