Return-Path: <ninette@thehoodiefirm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92FC5CD11C2
	for <webhook@archiver.kernel.org>; Wed, 10 Apr 2024 13:00:18 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.165186.1712754011264597264
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Apr 2024 06:00:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=W1PPHJG3;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.218.47, mailfrom: ninette@thehoodiefirm.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a4644bde1d4so911953966b.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Apr 2024 06:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1712754009; x=1713358809; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7O6ldlVkzDpLtLY+fjBZ0fkrgC+DuIn5nFwKUYGlfUE=;
        b=W1PPHJG3au2h6qMdSvgH5KzwsV7bbnebB99gkr5pecm3mxE+vs9NmR7KyT1iHEGcLP
         xnIUx4cypkbrdcUGAC7eSy955QNOwILrFmfka3umw7jHBz+mcr2E78xbPydOvRT2U1+a
         II6HHR+SHF07Ae4KsOBjfr6ZWcWYJ4azyFhI8gKev8/FNJdIRRv0ozAZw8mv7Klkp7Oo
         mnslPvp0a+Mu3V4107rdiawSS3gIepzEGBDmfBSOxwT9BzngqwhoK2yPAk1HDsTpKCKW
         +UVpc2cCFVeCGHWn3Z8XtFDtUuNVmeKLxJ2LsfS+fc4sVS3vQkhh4jbSjG0YeleZamM6
         7O3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712754009; x=1713358809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7O6ldlVkzDpLtLY+fjBZ0fkrgC+DuIn5nFwKUYGlfUE=;
        b=F2HEs6wcTCQVIqiRcr3XAKKnqMjfP8LA3VF3p+omWEBrPZKVmd3bIByt7aMND41Eki
         GU+XeWQy0yu6MExH/TZ/aBMOY9PREioEzF5meS+Fzg+H7eZGU5LN+uHtzgSj5Ofd+4DD
         nJs7FF6NnxOvVczjEXmlTIC8CY6Gw+P0M2fXjhrsY4PpJ0dCGN+pzB5SYa3SLImqyI/7
         5pgU4sO2KRzJ1xoG4FrHh3I/0jVJsBnFbCBvlsr7Zxr49nO0g/WcihvPDWbwwq+QEudP
         2wK4zLpOeCgJSm7t/H+uVPTiEhYx/ENayU15GLlx3wKecrhdVQFa7UPMsTSZ4KQdq3TF
         JoZg==
X-Gm-Message-State: AOJu0YwVNoqk59IxgtD+CDN4+t9ncOuP4CFECzwFwQLjb24nx8lqCsg5
	Gw89YpdT4Q6a5nUgJKCAnfCPBnXnWZesgfeA6sDgndi1gsTCz3Wu7kUdB5omobWuLLC47u2Vqdn
	t
X-Google-Smtp-Source: AGHT+IGxe+TdsUyaprwbZdJXTgBp7NYIs2inxuFRkFVFoKuAKv5aEgzdb9toE9zenCultap6Qe07pA==
X-Received: by 2002:a17:906:f108:b0:a51:c88e:e95a with SMTP id gv8-20020a170906f10800b00a51c88ee95amr1252622ejb.23.1712754009546;
        Wed, 10 Apr 2024 06:00:09 -0700 (PDT)
Received: from localhost.localdomain ([62.72.77.226])
        by smtp.gmail.com with ESMTPSA id gc7-20020a170906c8c700b00a51a259fa60sm6862506ejb.118.2024.04.10.06.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 06:00:09 -0700 (PDT)
From: Ninette Adhikari <ninette@thehoodiefirm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ninette Adhikari <ninette@thehoodiefirm.com>
Subject: [PATCH 1/1] proftpd: Update CVE-2001-0027 status 
Date: Wed, 10 Apr 2024 14:59:47 +0200
Message-ID: <20240410125947.44723-2-ninette@thehoodiefirm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240410125947.44723-1-ninette@thehoodiefirm.com>
References: <20240410125947.44723-1-ninette@thehoodiefirm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Apr 2024 13:00:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109894

CVE-2001-0027 is only for ProFTPD running the mod_sqlpw module. This module is not used by meta-openembedded.
This CVE is not relevant anymore.

Signed-off-by: Ninette Adhikari <ninette@thehoodiefirm.com>
---
 meta-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb
index ecd277724..d2af1f27f 100644
--- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb
+++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb
@@ -19,6 +19,8 @@ SRC_URI = "git://github.com/proftpd/proftpd.git;branch=${BRANCH};protocol=https
 
 S = "${WORKDIR}/git"
 
+CVE_STATUS[CVE-2001-0027] = "cpe-incorrect: This is only for ProFTPD running the mod_sqlpw module. This module is not used by meta-openembedded."
+
 inherit autotools-brokensep useradd update-rc.d systemd multilib_script
 
 EXTRA_OECONF += "--enable-largefile"
-- 
2.44.0


