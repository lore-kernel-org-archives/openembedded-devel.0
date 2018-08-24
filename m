Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8FE34745F2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Aug 2018 20:35:12 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id b129-v6so4773818pga.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Aug 2018 13:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=JSIhKxmNq3YmwwhUsiZh9/tcNKyNGEgO97Pe/a8X8SU=;
	b=gMZpuaB/tcb39OHpD1Mj2PFHaJkLxsn5zDAyD98n+TNOMjd7rv8ONrKAgCpEg0g1kO
	g9KY+9oygrDVBuy6SP2VvvOd2baHQWjYr+o5VcPLMFCrmVL31QYYurXkOHfyVffSf3ds
	xmU0ZYoG5oIYbmvkdGtVrBvLfbZTTrQgawbAxOEaAwpWlyickNTF5XgmzXCFzM4bedPf
	kzXmVtdz5MDihcA8DpFamyosWJliYoMi+aKY7GqWKEbHPVLkhQoDsTrpsXCvTWWBLKhq
	4uxga+v52lGhB44bhxLtC1Q1l+jnmQeysjp1TE8IbhLmgIQOzHqlkLFeSoChBrhaJ+ip
	xwFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=JSIhKxmNq3YmwwhUsiZh9/tcNKyNGEgO97Pe/a8X8SU=;
	b=X7Q7BQncO0PAvm5McAqs+ARsl8blU/JPzH/N1UFWmE26XYA9R/r+c2cKfQqlueZCWo
	koU8v+IL9/02hEaWtpuk+aKDyrBZjy73QEsamLUP9bScSwjpZ2mW9xetEd7ahaPTjnCp
	8w244ByocGYWH2LjhVv97MCY1ZrKdBg04ipozlS3uiIGrA4N/RGQyrO0LPheKVgBN1Qi
	96hd3r8iJGoAyKRomokgkS+tQ+ylaQDBBXPWCqz02AmxA+FTY+n+UrgHvGbR0MDOaNWU
	4/BlAHRlgCSYs2sPmiJKi/SIfn2ppvfAsVvZj+O5nezgfrs/nasKhIR73lV7eKi9ZBCj
	s9/A==
X-Gm-Message-State: APzg51AEs+yYXoEZU+FDMsuvmmOk7a2G7sNQR8yfSDXDbUXF64ayZvhP
	sAS5kbAeCaumV7rjogzj0WUy0OsQ
X-Google-Smtp-Source: ANB0VdaXn1OnPqxcazanUl0dfSCcd8/TBSC6Ko+XqAVnLae5nyy/dLjjUQIcvi8nqk1uDwAOOsYm6g==
X-Received: by 2002:a65:4384:: with SMTP id
	m4-v6mr3027278pgp.265.1535142913103; 
	Fri, 24 Aug 2018 13:35:13 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::4add])
	by smtp.gmail.com with ESMTPSA id
	b14-v6sm15241540pfc.178.2018.08.24.13.35.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 24 Aug 2018 13:35:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Aug 2018 13:35:03 -0700
Message-Id: <20180824203504.699-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [PATCH 1/2] Update maintainers
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
X-List-Received-Date: Fri, 24 Aug 2018 20:35:12 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 README                  | 5 ++++-
 meta-filesystems/README | 2 +-
 meta-initramfs/README   | 2 +-
 meta-oe/README          | 2 +-
 4 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/README b/README
index 204966ac8d..7318f09cdb 100644
--- a/README
+++ b/README
@@ -1,4 +1,7 @@
 Collection of layers for the OE-core universe
 
-Please see the respective READMEs in the layer subdirectories
+Main layer maintainer: Khem Raj <raj.khem@gmail.com>
 
+This repository is a collection of layers to suppliment OE-Core
+with additional packages, Each layer have designated maintainer
+Please see the respective READMEs in the layer subdirectories
diff --git a/meta-filesystems/README b/meta-filesystems/README
index 97d0e94bfe..87cb685b4a 100644
--- a/meta-filesystems/README
+++ b/meta-filesystems/README
@@ -27,7 +27,7 @@ Please submit any patches against the filesystems layer to the
 OpenEmbedded development mailing list (openembedded-devel@lists.openembedded.org)
 with '[meta-filesystems]' in the subject.
 
-Layer maintainer: Armin Kuster <akuster808@gmail.com>
+Layer maintainer: Khem Raj <raj.khem@gmail.com>
 
 When sending single patches, please use something like:
 
diff --git a/meta-initramfs/README b/meta-initramfs/README
index 7185383123..79244d43f0 100644
--- a/meta-initramfs/README
+++ b/meta-initramfs/README
@@ -25,7 +25,7 @@ with '[meta-initramfs]' in the subject.
 When sending single patches, please using something like:
 'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-initramfs][PATCH'
 
-Interm layer maintainer: Armin Kuster <akuster808@gmail.com>
+Interm layer maintainer: Khem Raj <raj.khem@gmail.com>
 
 
 License
diff --git a/meta-oe/README b/meta-oe/README
index db5697dd90..0e9f8423bd 100644
--- a/meta-oe/README
+++ b/meta-oe/README
@@ -19,4 +19,4 @@ Other services like gitorious, repo.or.cz or self-hosted setups are of course ac
 'git fetch <remote>' works the same on all of them. We recommend GitHub because it is free, easy
 to use, has been proven to be reliable and has a really good web GUI.
 
-Main layer maintainer: Armin Kuster <akuster808@gmail.com>
+layer maintainer: Khem Raj <raj.khem@gmail.com>
-- 
2.18.0


