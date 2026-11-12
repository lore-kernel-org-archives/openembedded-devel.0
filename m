Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7986.1794465754719531940
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Nov 2026 22:42:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=t43Zqih3;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3b0e61a4decso2984545a91.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 22:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794465754; x=1795070554; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B5xeQDPepjG1TmQ/2eQC0dQTft0IH4BC7wMhpSkYpaI=;
        b=t43Zqih3EudS/h7pMESwHwgd91pSsaPzZpkTeUKy5UEq1EaJG1tL5Tdnw8NCj3mJ2g
         uffXAWoV5OSm1B8XCMxvwOHbKQ6tgIJ8CyDCBXSmswlJCUFf8NdyUp1O/sWFu4HGJ7+T
         HR4Ij+VhDIpwimJBMQZsuHvIK0veUBufgL06yklL/q1HXlTgUgTRxzPsSWCi8bpkmQUE
         Ijadbdnmf0g/Xoqy37vC2hyHsJ4/baDA6SBbWnO0PF7OJgOJeHfZC5ztiysoz5Q1AZtf
         Bz5auaO6wBoiCccOLM9Z2POZJnWkJnL9x61hwbt3rkmoh3uoN4/fjQPBwPLjoYsgQqvd
         RN5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794465754; x=1795070554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B5xeQDPepjG1TmQ/2eQC0dQTft0IH4BC7wMhpSkYpaI=;
        b=UMvqDUtDLGjIdRkRWhHC5Ew4YXSt+vz6PnVxLG8v+t7g1OZ9R/KOuPXS5HxzW/wzq0
         kitgXI3aJO+TIEWwWpzI9Y4EmemzGcZBE2geAhS7iTG+RCPNh+xQVrPkk+YtPqPbk1KE
         xqrMIqPFAvvSpHis6Ax7Hok5r4rOBkaZGFjREAA+UsMju+RZ4n6MHFNeIADYHQV2LG/a
         O7QXEuZB+wbodGLRsfZp6i4N2b1kkV1ibRyG43YVTf68cU/DR/JRtMFN/f9nrWQIXYF9
         ecOxXaGx6qm3+A16IQaWlvUuxjXSgYU0tt3zCqWMImpn+Kyktjc5gQ3SovYVBYw2DmT2
         stkQ==
X-Gm-Message-State: APuU4Z8oT3xxXkm4gaKEzL7idRQLAXHBpXh3L2JFVv8bTk2IWHw5gY+W
	/WYej1IYbgL1JYA7HwLZZEB1wxydClen0SdcSc9fbR03I3+jcWMfPhoHwmtW7XpEjBo=
X-Gm-Gg: AYBFou1HstT91y4ZCgbkC+HIkyEuIN8nOqZavNX8oGi196UX8A5v3zMONrZVXXwMLwO
	7cG3/y9uSoEagbojY+2eXButxvH9SFJxzK6I7D8/tscq+ptauWJjqqv7zA3R35dgUmlCf2yk/tF
	8Df9bMG2+whQ9ANZcYqj5Is5V79o7GZdqJBpJtJGWCxLaKMKNWknM695/E3pbHTnc6cY3KKY9DQ
	3qvRV/7WVFqvVdfCBjyMqMSBgHx1BhMUWHacfcj61VwLQHnpzP1OZHnaeYgp47Ujb1D2Xq19rIw
	anV+QUv9KyogjHfRNN3/z+vkT0PHlJTwUtajuZTWoSiSH46k5GOh/uqxc+buWBjn5QWFhut2itU
	fsbdWr+nvAnBJiqvWhQW4/m4SwKvJOyQGKlIJDERPDjlsCILq07j7eDDYA8K82c6VOwuucqyk9K
	Xnw81Vuif4UwsqfgxzVPYyNugQqTtLGwLC2Xj6Hb2A/Q9H2JHKRtyrq2z3tYuUWxQqxZz7s6eTs
	I2lOpsewdDHlfnRKJ2ujoQ4v6XtVu350NIoNdv4x+XE8iAr14YWOeMd3Ymrt6u6H3imMQTHGL5b
	VKOqfaSr5JauNF87qWesecM1ITPkyxWIxWzzbdiYkS1n4HXzZEvF7IOOEzbTiPJ2ITbAGzBhOp5
	gHS3FH7ivFfOHDu/7wLJ7GEqkYIAnUgRUYiXlCIX8j8Sp17Vu/ZY2bXxwktM6pkKzshQMzLGCgE
	To/+kIpU6v1aFeMgQlzCflZjWxqiJkr/v8GUI+ln3Z25w7ABUH9riDUGdhg+YJibeyfIntxf0Ov
	OZgoUKcTduuj2U0uCTAeOMwIbZlF+u9Yp5hdKGpzBq/08fcSV2k44TvqSQX/aFtoaGnWWJiY2Qg
	+E+W
X-Received: by 2002:a17:90b:4ecc:b0:3ac:a521:959 with SMTP id 98e67ed59e1d1-3b182edaefemr4398653a91.29.1794465754078;
        Wed, 11 Nov 2026 22:42:34 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c768e8sm2984715a91.11.2026.11.11.22.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 22:42:33 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 05/24] networkmanager: upgrade 1.58.0 -> 1.58.1
Date: Wed, 11 Nov 2026 22:42:05 -0800
Message-ID: <20261112064225.2410019-5-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261112064225.2410019-1-khem.raj@oss.qualcomm.com>
References: <20261112064225.2410019-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 06:42:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132174
Content-Type: text/plain; charset="utf-8"

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../{networkmanager_1.58.0.bb => networkmanager_1.58.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/networkmanager/{networkmanager_1.58.0.bb => networkmanager_1.58.1.bb} (99%)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.58.0.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.58.1.bb
similarity index 99%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager_1.58.0.bb
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager_1.58.1.bb
index 003ef86c02..3173aa3ace 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.58.0.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.58.1.bb
@@ -45,7 +45,7 @@ SRC_URI = " \
 "
 SRC_URI:append:libc-musl = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', ' file://0001-linker-scripts-Do-not-export-_IO_stdin_used.patch', '', d)}"

-SRCREV = "61302aac7f2e7411f3b42159544926484eacd37e"
+SRCREV = "7406dfbcc35beed79bf2734e3e7376ead320bd99"

 # ['auto', 'symlink', 'file', 'netconfig', 'resolvconf']
 NETWORKMANAGER_DNS_RC_MANAGER_DEFAULT ??= "auto"
