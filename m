Return-Path: <anders.roxell@linaro.org>
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
	[209.85.208.172])
	by mail.openembedded.org (Postfix) with ESMTP id 6A2BB7F95D
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Nov 2019 16:11:00 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id 139so2922786ljf.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Nov 2019 08:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=T43CLwwj7QSgC5q/QabAR99dOs2KwEjE/2fE2yLMQ9o=;
	b=r8VPsSUKM663r3+3D+OaeSR/sWSI0DtQg100XubfXehQdt0aDZ9VndNtwIst5opJec
	u7lPxS4fFnQrX5Q5FbmB2J02phAI8gV+y8xAriRfW0hpRd7VdZkvhonQjjIPN1ip4mDs
	CbBS5FsXHsa8UoXrKxTD2E8k65NIE8CP4jgUUQ/9Vryr/fa3RdopqrXVnBfKgQkQb/M3
	o7x70fPRAoLiVvQpTmE/oVmTcnIQ1XiLSUpro2gpv34LewwDhRi/gTL9TeBTUs7k3F3F
	gglxdRxuOC8MTNeG9UvjbMQ1fQ2ho3LM3Rs3HIizM57RMWV4OLoyAZ2hMhmilQkqBriw
	IIrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=T43CLwwj7QSgC5q/QabAR99dOs2KwEjE/2fE2yLMQ9o=;
	b=lf6hzj1aGApaRSk7a9eiJHSXVctOmN4PqH7mq5l4kB6N0uQ5iX5wNLVCDbgnXizXiT
	CWEdTHwgn6QvIDrSfohQdoMaAZPpOV0U5TdnE2+cbPn+/TWmNsy+ngtRh3cCQEerb3re
	4MCbKRmVdHRqaM8v3HpvDa0Lfm2/wHzRZCQOZ72UR5BaYQGTdpxmoGbhf7R0TaJjz8AR
	im7GW/jOQvqSVsLrRltktMV1G4sQTaqabUjOEDDOclqDWvXeQh6wKpsdsT6hQcZA/5et
	eISo3B2MUm/O0XwJ6BQjkaUKp35GIUXAUwqg4Estlpg6emTu+fWhffZ7kGAEcp2aqCGk
	tp6Q==
X-Gm-Message-State: APjAAAWys9LrThmp5G7ZH07cuA7hGv5fLEPlDDZu9Zonv9StYfgp+PrE
	+OkuNmX7h0J5Ud/g1N99XLVBZxVvgCsC1Q==
X-Google-Smtp-Source: APXvYqzCRT5dZhJk8L4ebPOo2Uv+INHXq37nG0xhi5koaOQ06vgMkTBJKQzRoJDDPRaMjoFH3/KxpQ==
X-Received: by 2002:a2e:9e4c:: with SMTP id g12mr3101114ljk.103.1573143060847; 
	Thu, 07 Nov 2019 08:11:00 -0800 (PST)
Received: from localhost (c-413e70d5.07-21-73746f28.bbcust.telenor.se.
	[213.112.62.65]) by smtp.gmail.com with ESMTPSA id
	k25sm1297528ljg.22.2019.11.07.08.11.00
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 07 Nov 2019 08:11:00 -0800 (PST)
From: Anders Roxell <anders.roxell@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Nov 2019 17:10:55 +0100
Message-Id: <20191107161055.908-1-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: paolo.valente@linaro.org
Subject: [PATCH] s-suite: install missing create_config.sh
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Nov 2019 16:11:00 -0000
Content-Transfer-Encoding: 8bit

When running s-suite v3.6, it complains that create_config.sh isn't
installed.

./config_params.sh: line 1: ../create_config.sh: No such file or directory

Rework so that create_config.sh is installed.

Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 meta-oe/recipes-benchmark/s-suite/s-suite_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb b/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
index 71483d88be1d..d6852e29fb34 100644
--- a/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
+++ b/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
@@ -19,6 +19,7 @@ do_install() {
 
     install -m0755 ${S}/def_config.sh ${D}/opt/S-suite
     install -m0755 ${S}/config_params.sh ${D}/opt/S-suite
+    install -m0755 ${S}/create_config.sh ${D}/opt/S-suite
     install -m0755 ${S}/process_config.sh ${D}/opt/S-suite
 }
 
-- 
2.20.1


