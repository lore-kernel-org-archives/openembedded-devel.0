Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heroor@gmail.com>) id 1Q757M-000124-JB
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Apr 2011 14:12:21 +0200
Received: by ywg8 with SMTP id 8so87023ywg.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Apr 2011 05:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=VKaqxw7gbtIH8sGD3cAVMlYqxRyz4b6dknLlxKqQhaQ=;
	b=xIKrbxvKg6r99fqS9y/LMXWy3opJEYYAIhUJnG3gpQ++po6jWKfkvh52zcdWMGi4rq
	WttLmsLnhnTbEaxrveTs4NaNbUXNQdrCQuakdJ76CGN/6T2sG3sKoqf7Y2uxl7KNSsUn
	P2hmLV6QiLBTLhonl00o12CQwXEmv7aUvZbYs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=H3N/qptxJCAWSwsevoXiyEFaxFA+QDL2KbX3MxMSq8LTzjg1bcUgifvW6L0uPuvRXR
	kyYVtydtbUtih/37ZGEAo/xxdPudg8fPoTPGQmfn7II0XS/MnksnmMkBq25DKY4W7Bbb
	sVRGUbXrDXSkXnRfgdpDSBUlhtsJRgV8KOdI0=
Received: by 10.236.185.134 with SMTP id u6mr11956393yhm.217.1302005414656;
	Tue, 05 Apr 2011 05:10:14 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id h43sm2798378yhm.22.2011.04.05.05.10.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 05 Apr 2011 05:10:14 -0700 (PDT)
From: Siddharth Heroor <heroor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Apr 2011 17:40:02 +0530
Message-Id: <1302005404-21580-2-git-send-email-heroor@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1302005404-21580-1-git-send-email-heroor@gmail.com>
References: <1302005404-21580-1-git-send-email-heroor@gmail.com>
Cc: Siddharth Heroor <heroor@ti.com>
Subject: [PATCH 2/4] ti-sysbios: Copy installer unpack to recipe versions.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Apr 2011 12:12:21 -0000

From: Siddharth Heroor <heroor@ti.com>

* Newer versions of Sys/Bios have a different unpack sequence.
  This patch is in preparation for a new versions that use the
  new unpack sequence.

Signed-off-by: Siddharth Heroor <heroor@ti.com>
---
 recipes/ti/ti-sysbios_6.21.01.16.bb |    1 +
 recipes/ti/ti-sysbios_6.31.00.18.bb |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/recipes/ti/ti-sysbios_6.21.01.16.bb b/recipes/ti/ti-sysbios_6.21.01.16.bb
index f26858a..848ae36 100644
--- a/recipes/ti/ti-sysbios_6.21.01.16.bb
+++ b/recipes/ti/ti-sysbios_6.21.01.16.bb
@@ -5,3 +5,4 @@ PV = "6_21_01_16"
 SRC_URI[sysbiosbin.md5sum] = "411cd0fac224126ed2a81e67fc79c81a"
 SRC_URI[sysbiosbin.sha256sum] = "63d2704ff294fe0834411d010d19c0a0bfd0249520f5ee5ddc2c115df2be8ddd"
 
+TI_BIN_UNPK_CMDS="Y: qY:workdir:Y"
diff --git a/recipes/ti/ti-sysbios_6.31.00.18.bb b/recipes/ti/ti-sysbios_6.31.00.18.bb
index 8bed7f4..a25c924 100644
--- a/recipes/ti/ti-sysbios_6.31.00.18.bb
+++ b/recipes/ti/ti-sysbios_6.31.00.18.bb
@@ -5,3 +5,4 @@ PV = "6_31_00_18"
 SRC_URI[sysbiosbin.md5sum] = "a37fe51f208d7cb63a6fae09d3285c69"
 SRC_URI[sysbiosbin.sha256sum] = "2d5cedffdc554e545ee9e233ba760e95b97904f6ea0ca3dbdd56a422b05e2b62"
 
+TI_BIN_UNPK_CMDS="Y: qY:workdir:Y"
-- 
1.7.0.4



