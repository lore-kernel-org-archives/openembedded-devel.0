Return-Path: <andrey.z@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id F239B7D27B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Dec 2019 21:13:02 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id j42so24510446wrj.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Dec 2019 13:13:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=BC059ghwrWUJl/lW8csqOCxNN0NFS5uIDWlrAMvGDjw=;
	b=IbfoOzSKidieQUXl8e5lGC2RUpn2DasiGAhmQbXQWgNbSicrK5etKVIYqc8MKvu4OG
	jGmAVKUnjljMXev3V6CFBLhd1mORwRasLIx/xOmAv5SbhNx3agbMNoMd+Bv7m8Vey6Av
	UMfNcgFcPtPhhtovKcesDrLHEZBs6GkltpDmy6sxyPmUW6/SnKz1hkV//UxpkvKK8BWj
	cIDrp2MotZhNqmjum3aKrRRRcoo7Pkq/d1yc9MmusGoYAXx1VSn3+LXRpDE49+y3tD4Z
	D1NjKN1403GSjPoNGKoavHN1Z8eh9HKJ6lLaGUAdab1t60AuNeOQTTOyyWQ5pXuCx7kA
	ctDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=BC059ghwrWUJl/lW8csqOCxNN0NFS5uIDWlrAMvGDjw=;
	b=Q0yX4iIQH5z6uh/V28v011wqTYa33/M9NupltIekOWjC8w1002XEjRL2xubfstCshQ
	cg53Z/6OBCU28Np8IG1VFQH1SqoD8Ma9WmBAiFCZgoPycZVdiGCyOe8FYqv+/i5ardWr
	Fs9lqbqI17Jcue1R4PZozoAzYakp6zwdcojOzdWIeeu8ctmyWyeyclDeK0QlCvGPYTCj
	lj5hYl4hAzwcOJC9QPrBRQtfT0U5XI0X5MsC7w0OvvhDesHNZcOqYNL27IS8BuY2TZ98
	Ivt4kjWrSeVsV6PM/H9kWwyY8auSagd5HOKeqRZ3ZvsKd8eL1ug+ifeehz17sAHqp21/
	wbxA==
X-Gm-Message-State: APjAAAV93PAPWIdyQVGIHNviAQlabSAP71oUr5W0q4hVRiXmuRbR6x4M
	b3pRpc3LtrPTeCQxGX0vr0hhXxOD
X-Google-Smtp-Source: APXvYqzayfUgvlQ6WegmqH4cMKHdR9yo3FIkHFTnFgqjtZgeZDJ4NptG4Xr/az12mHZVaaEznptSXQ==
X-Received: by 2002:adf:e5cb:: with SMTP id a11mr45206890wrn.28.1577394782608; 
	Thu, 26 Dec 2019 13:13:02 -0800 (PST)
Received: from lab-linux-pc.tendawifi.com (cable-static2-2-7.rsnweb.ch.
	[146.185.2.7]) by smtp.gmail.com with ESMTPSA id
	y139sm9920853wmd.24.2019.12.26.13.13.02
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 26 Dec 2019 13:13:02 -0800 (PST)
From: Andrey Zhizhikin <andrey.z@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 26 Dec 2019 21:13:00 +0000
Message-Id: <20191226211300.7350-1-andrey.z@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] flatbuffers: add PIC compiler flag required for aarch64
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
X-List-Received-Date: Thu, 26 Dec 2019 21:13:03 -0000

Add PIC flag to CXXFLAGS in order to solve the issue with linking
against the library for aarch64.

Without PIC enabled, linking against this library fails with
following messages:

relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `[snap]'
which may bind externally can not be used when making a
shared object; recompile with -fPIC

Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
---
 meta-oe/recipes-devtools/flatbuffers/flatbuffers_1.11.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/flatbuffers/flatbuffers_1.11.0.bb b/meta-oe/recipes-devtools/flatbuffers/flatbuffers_1.11.0.bb
index bd6dcef4e..529441de1 100644
--- a/meta-oe/recipes-devtools/flatbuffers/flatbuffers_1.11.0.bb
+++ b/meta-oe/recipes-devtools/flatbuffers/flatbuffers_1.11.0.bb
@@ -17,8 +17,8 @@ SRC_URI = "git://github.com/google/flatbuffers.git \
           "
 
 # Make sure C++11 is used, required for example for GCC 4.9
-CXXFLAGS += "-std=c++11"
-BUILD_CXXFLAGS += "-std=c++11"
+CXXFLAGS += "-std=c++11 -fPIC"
+BUILD_CXXFLAGS += "-std=c++11 -fPIC"
 
 # BUILD_TYPE=Release is required, otherwise flatc is not installed
 EXTRA_OECMAKE += "\
-- 
2.17.1


