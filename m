Return-Path: <eu@felipetonello.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 41CAF6FF9F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Apr 2016 15:37:12 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id e201so18686608wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Apr 2016 08:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=felipetonello-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=YZH6KrD0uJf8XCZfrj+x05NS5JMiQeq4bcIPwoT1Fwk=;
	b=PW31LusUFXB888NxnrhpMMHbGpSCSzLA4ZyM41G0I+os24G4TXDF712c4NZ1Tw34uJ
	LEBmoODthy01wI6Yo0fOrWthQSjLx6Ha0UtpqiVzbllCkjobD2Dm7oy1BurOxJBeRf6g
	yovF0FaKt02tWJGVTeit1fdd2ihKRLJuMGOZlUtX/dlGs1WrQcjwUH56XYdjEF2a1Vbo
	hSiDRRMB+n+2QDYoRl5LjXZSe9y+lhGx59vp2AkOdtera/UqAqDqwKEBIenSQdm6mhEi
	LyEyz2RSM2O5wWquHHJi0y9HkwTD48irPQcOrtXiHPAqwELAN4oXEWlkANbH0ynYPMWf
	/uzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=YZH6KrD0uJf8XCZfrj+x05NS5JMiQeq4bcIPwoT1Fwk=;
	b=WKqZhKwxH8YfABAFpvGPxDjTWhJNYwl4aVQa5/dUmfuLtV/B/ZMCo8V2JWj36RNA4I
	TMFCIPMXriv8oWZHaAIf3IhPBLFz6yWuoEBY3+VJyBbtb9s0rPJG6WbLHRZxpXDZJx6/
	yL6SqGvGygkm5CsojzwX3L+5C/9w+Df+7hCJErmEYX2DQJtpI5ZDjz8z81Zg7l5nn0+F
	0S4f+SvUNi4NtVCC2RZYGHkD5/XG+YtbQ9z7zcShQ2TBTTZMtSYwvW4irS9TnjlsXYm2
	zRdHtq76fOb6RvDf17QgepCnpyAWGXZFq6cUMbg81Raae3dtgYwiHYjt0Nbs9g7Gnrns
	knWQ==
X-Gm-Message-State: AOPr4FUkmHiOpBokrOUDtSjB0Jym8jcqMzN/G/cNq287LSpR5LOwlFpL5zP72gMFDK/lVQ==
X-Received: by 10.194.216.40 with SMTP id on8mr4148037wjc.40.1461080232783;
	Tue, 19 Apr 2016 08:37:12 -0700 (PDT)
Received: from felipe-arch.localdomain ([81.145.202.106])
	by smtp.gmail.com with ESMTPSA id v64sm4952474wmv.1.2016.04.19.08.37.10
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 19 Apr 2016 08:37:12 -0700 (PDT)
From: "Felipe F. Tonello" <eu@felipetonello.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Apr 2016 16:40:16 +0100
Message-Id: <1461080418-9229-1-git-send-email-eu@felipetonello.com>
X-Mailer: git-send-email 2.8.0
Subject: [PATCH 0/2] Protobuf recipes update
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
X-List-Received-Date: Tue, 19 Apr 2016 15:37:16 -0000

Added protobuf-c recipe which is the protobuf implementation in C. Also split
protobuf package into two packages, one for the run-time libraries and other
for the compiler.

Felipe F. Tonello (2):
  protobuf: add protobuf-c recipe
  protobuf: Split package to main and compiler packages

 .../recipes-devtools/protobuf/protobuf-c_1.2.1.bb  | 26 ++++++++++++++++++++++
 .../recipes-devtools/protobuf/protobuf_2.6.1.bb    |  4 ++++
 2 files changed, 30 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/protobuf/protobuf-c_1.2.1.bb

-- 
2.8.0


