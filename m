Return-Path: <andre.draszik@gmail.com>
Received: from mail-qt0-f176.google.com (mail-qt0-f176.google.com
	[209.85.216.176])
	by mail.openembedded.org (Postfix) with ESMTP id EDC4E78EF4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2018 14:48:45 +0000 (UTC)
Received: by mail-qt0-f176.google.com with SMTP id m13-v6so1949506qth.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2018 07:48:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Yl0du+vEg6YBvZrMGLK6Noj1ieHrQQDILwwv09QN6S4=;
	b=P3UVWgrk2R2oU8HJlB0vGmZ6Du7MVpUmvlfXGhDsYa1HP0299levWTDSn3ft094GDq
	aV0b5YKLk4gLjs3TPzxn0jlgTCT+hE4KvjipQmV6lHFLQdro8kSLCCZIap7WkeJdL4vK
	dXfW9Fjrw2a4Ou+IObO5i0rlUz8jwwVmIy9JKAf/q/ht6b4n9UrkrOqLRmJkKyInkGSt
	P/pyJPo/fh0Bxx+PB8jq6p3bR93CR2tUDBq/7NKHuZv+Kmr0h3vHzv7BEH+H7+Sa4eCw
	Cxi6aG1nrC6GlZky3DmJrG6cPx7W4msYq7jQBoCNtxmGn5TDtMWfpKWar+8F8aVO/Avf
	hbfA==
X-Gm-Message-State: APzg51AWUnSlPmEl86H4xp22Sjeo8hTQ/M2Xgz8SMX+MnpiICbwCs/jV
	uIjYanLC7PV2VidkpTJcLlhpIVTf
X-Google-Smtp-Source: ANB0VdZoktx7Xf02wxw1y1um1zvIakj2NQkVqH0gaQ7BuLoBM49MCvnpIhKEooK2SVCKx0jr7ua+LQ==
X-Received: by 2002:ac8:22f2:: with SMTP id
	g47-v6mr21913701qta.105.1537282126801; 
	Tue, 18 Sep 2018 07:48:46 -0700 (PDT)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	r187-v6sm10107062qke.24.2018.09.18.07.48.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Sep 2018 07:48:46 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Sep 2018 15:48:44 +0100
Message-Id: <20180918144844.28163-1-git@andred.net>
X-Mailer: git-send-email 2.19.0
MIME-Version: 1.0
Subject: [meta-java][PATCH v2] openjdk: remove incorrect PROVIDES (java2-vm java2-runtime)
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
X-List-Received-Date: Tue, 18 Sep 2018 14:48:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

There are two issues here:
* PROVIDES is not package specific
* it doesn't look like the intention is to be able to
  DEPENDS on java2-vm or java2-runtime anyway

Regarding java2-vm:
-------------------
java2-vm was originally used in the OpenJDK 6 & 7 recipes to be able to
select shark, zero, cacao, or jamvm VMs. OpenJDK-6 is not available any
more, and OpenJDK-7 has removed support for most of this in commit
38f4c1365c11 ("openjdk7: remove broken/unsupported VM's")

It is not clear why it was added to the OpenJDK-8 recipe either.

Given OpenJDK-7 has no way of using the VM compiled as part of OpenJDK-8,
and given that no part of the OpenJDK-8 makes use of the java2-vm part, the
correct solution here is to actually *remove* the incorrect PROVIDES as
well as *R*PROVIDES statements for java2-vm completely.

Regarding java2-runtime:
------------------------
Again, looking at the other uses of this:
java2-runtime is a virtual runtime package name, which is provided by
different *runtime* packages (created by the OpenJDK-7, OpenJDK-8, JamVM, or
Cacao recipes). Other recipes only ever RDEPEND on java2-runtime. It makes
no sense for the OpenJDK-8 recipe to PROVIDES java2-runtime given the above.

Remove the incorrect (R)PROVIDES statements.

Signed-off-by: André Draszik <andre.draszik@jci.com>

---
This applies on top of commit ec5aae3d ("conf: distro: add mejate{,-musl} distributions")

v2:
also remove incorrect RPROVIDES java2-vm statements as per description
---
 recipes-core/openjdk/openjdk-8_172b11.bb | 3 ---
 recipes-core/openjdk/openjre-8_172b11.bb | 3 ---
 2 files changed, 6 deletions(-)

diff --git a/recipes-core/openjdk/openjdk-8_172b11.bb b/recipes-core/openjdk/openjdk-8_172b11.bb
index c1c6e1e..72f208e 100644
--- a/recipes-core/openjdk/openjdk-8_172b11.bb
+++ b/recipes-core/openjdk/openjdk-8_172b11.bb
@@ -47,10 +47,7 @@ FILES_${PN}-doc_append = "\
 
 FILES_${PN}-source = " ${JDK_HOME}/src.zip "
 
-RPROVIDES_${PN} = "java2-vm"
-PROVIDES_${PN} = "java2-vm"
 RPROVIDES_${PN} = "java2-runtime"
-PROVIDES_${PN} = "java2-runtime"
 
 inherit update-alternatives
 
diff --git a/recipes-core/openjdk/openjre-8_172b11.bb b/recipes-core/openjdk/openjre-8_172b11.bb
index dd29691..e9b930b 100644
--- a/recipes-core/openjdk/openjre-8_172b11.bb
+++ b/recipes-core/openjdk/openjre-8_172b11.bb
@@ -35,10 +35,7 @@ FILES_${PN}-doc_append = "\
     ${JRE_HOME}/THIRD_PARTY_README \
 "
 
-RPROVIDES_${PN} = "java2-vm"
-PROVIDES_${PN} = "java2-vm"
 RPROVIDES_${PN} = "java2-runtime"
-PROVIDES_${PN} = "java2-runtime"
 
 inherit update-alternatives
 
-- 
2.19.0


