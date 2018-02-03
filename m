Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id EA8A66FFCD
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Feb 2018 16:18:05 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id g1so18382058wmg.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 Feb 2018 08:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=9Xm0n+qznA+YmQkhJuAxG1ZPI9geJV3osbeNMFCYGUo=;
	b=Z+Msk5T641SrGMuU7zNDDb1rnJuICnsnije+Nd717g3UM6t+fMY9f3m2iCtjBM8cip
	6vcjc0+LDKu8Cp5eprQI8+X+VmsBQS8mx7Wa2oyyF5hcVROGXopNHn6ZHBzhyXAfm0bf
	AxndZVZA2UvxRlWjUlqJMqXlqAHAmsMxOb5fCVcM5oUjmNnW4P657azyQe5pMbgGo68/
	RatSHlh8TR1hjROGLdz8tkoUWPB35rcdlb9MWPy3yK04Wm/uM55Xsqx0t9LkEKAvl7AP
	gH1JV6kTRpL3M9xHJm4YUZhu/A7GI1QjHvDHVoEMZ5h50swZFYOLzZoCFA6cT2aQ3zcH
	9+ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9Xm0n+qznA+YmQkhJuAxG1ZPI9geJV3osbeNMFCYGUo=;
	b=g4ibxCFA5T2KGs+nFDj+YY4kz16i8nrHH4kadHaACtGSy4AZyENBOUSx6tzK7GrJ/J
	G4m4okMlXNQJiBBrxrEsDbY8CATxQ7lpvAJfE6hxUQXlAh7H417OsxXPZ00rhZ3WYoDe
	5fOZle4YqGo2VyBC1cvMQ+K4s4YltRp5Cr4n7NNpTHMrmYoY1DBAfCJja40k+6OO9Jtb
	RCjcLgDOfIuE683cQaVBhuFsccHhBRW4CAogAevblg5ytyRTEKPJnULmDt7c4I3EwgXH
	swJ62N51fUT7np82qA4lZ0TsBo5nwghzXO6+tcJwSt2lU0ckvy4MfkFGLjJSG/EISlNE
	Aljw==
X-Gm-Message-State: AKwxytfvZtOMa484h5M1D2agP88q5XSWaunXasBlaRj0xXJ8rQZCqY2g
	9wZsuIBYQ4f7jpwYh4IPGjdApw==
X-Google-Smtp-Source: AH8x227DoLUj4umKVyxSk+twLU7lsUfze5I09VkjrWEo0y6K1OazvH0/hZX9DlNNG6LOiCv4PHcQKQ==
X-Received: by 10.80.205.221 with SMTP id h29mr70015357edj.159.1517674686466; 
	Sat, 03 Feb 2018 08:18:06 -0800 (PST)
Received: from andrea-ThinkPad-T520.homenet.telecomitalia.it
	(host57-10-dynamic.248-95-r.retail.telecomitalia.it. [95.248.10.57])
	by smtp.gmail.com with ESMTPSA id
	f55sm4486380ede.77.2018.02.03.08.18.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 03 Feb 2018 08:18:05 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  3 Feb 2018 17:18:01 +0100
Message-Id: <1517674681-15173-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-handheld] zaurus-installer: replace deprecated base_conditional with appends
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
X-List-Received-Date: Sat, 03 Feb 2018 16:18:06 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-bsp/zaurus-utils/zaurus-installer.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/zaurus-utils/zaurus-installer.bb b/recipes-bsp/zaurus-utils/zaurus-installer.bb
index 2956f15..24d0fe1 100644
--- a/recipes-bsp/zaurus-utils/zaurus-installer.bb
+++ b/recipes-bsp/zaurus-utils/zaurus-installer.bb
@@ -1,8 +1,11 @@
 DESCRIPTION = "Installkit for kexecboot-kernel"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
-DEPENDS = "${@base_conditional('MACHINE', 'collie', 'linux-kexecboot', 'zaurus-updater linux-kexecboot', d)}"
-DEPENDS += "${@base_conditional('MACHINE', 'spitz', 'zaurus-legacy-tar', '', d)}"
+
+DEPENDS = "zaurus-updater linux-kexecboot"
+DEPENDS_collie = "linux-kexecboot"
+DEPENDS_append_spitz = " zaurus-legacy-tar"
+
 PV = "2017.05"
 
 INHIBIT_DEFAULT_DEPS = "1"
-- 
2.7.4


