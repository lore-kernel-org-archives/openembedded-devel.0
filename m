Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
	[209.85.208.52])
	by mail.openembedded.org (Postfix) with ESMTP id 0ACA17DD6E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jun 2019 07:52:45 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id z25so25720641edq.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jun 2019 00:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=oPCJ5W5GJ62o4lzI7rAYXIKQQzsDrnZiiwhchg5RRp8=;
	b=XhTzoGDfDTT4sm5YLZSUyUnkaId8dE261oewP5ZNk1QdKTpcuzPRvY2NbF/xN7qggc
	9xx0LevGNusU14KQ/Sl6Pw4M1C/cm1NfgKggjCUcuNh8mA2Tgo6f3Z1wMN8F094rGNuP
	U+X+Hn0MI/pSLNYcmNjHiAthiIylLoQ0nuC9Gyv5DhJeSJiAePdB6tfBtzk0auCUOyPV
	OD9va+efsmPMnjcNvnTlF1KYeYUrYFWJNCtYP3Ha+JdNge0gANkBnGRDMGxCoBev9UQy
	GpX5+Yb9pE0rRQPhMant7a9+247f1EQb3on/6o9Sv/Wp83kftHYJ5jOXKHuqGrvldF3b
	ni/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=oPCJ5W5GJ62o4lzI7rAYXIKQQzsDrnZiiwhchg5RRp8=;
	b=YTMlWKBHefHcDYnC87c68gPgRSnXnVWtuVnApT4Wbd/rU38ydpLEG16Q17s4nXmt6O
	hBvJiOWJ579ZWbSRbkghqMfi8OEXOYBCykNb+ae76SjSCXFrjq64y7jLkOjXGIVDNOoB
	jw7EEcsxt7+TQdthy+rXN0XYm0wVZS/zI009YpIZpykCGgSnWw+Rxl45gO9kC4SezRtN
	MhQivO9ImcYSITMy2cOxmxXf/jtH5U3OQV5IvwdGBANPR3I87ClgPcTm3VrYISmRwNek
	WNCaHOHkq5swUU/6zNCsGn6GPU4K6XiInrT4XHFbJC7AYn1oL7HFUKrJ0Rndxn8QshqV
	NjoQ==
X-Gm-Message-State: APjAAAWP4AzntM/lUsGw5VpgL/WrMnjt4k1A47SeP7rThrPMP6giJu4F
	3h6iOcyQtHA1trIaPXaZQj4xo+jyyes=
X-Google-Smtp-Source: APXvYqwDrA9FzEndrZiyGFYAajE/Qa236aIOcq4l0AMMmJC3pLaz6/GHzp9hvLL/Qs38Y2xMZgUwGQ==
X-Received: by 2002:a50:94b1:: with SMTP id s46mr69498287eda.188.1561449166248;
	Tue, 25 Jun 2019 00:52:46 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	y22sm4308640edw.94.2019.06.25.00.52.45
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 25 Jun 2019 00:52:45 -0700 (PDT)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: Ricardo Ribalda Delgado <ricardo@ribalda.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Jun 2019 09:52:14 +0200
Message-Id: <20190625075223.13585-15-ricardo@ribalda.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190625075223.13585-1-ricardo@ribalda.com>
References: <20190625075223.13585-1-ricardo@ribalda.com>
MIME-Version: 1.0
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [meta-java][PATCH 14/23] ca-certificates: Cannot be an allarch package
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
X-List-Received-Date: Tue, 25 Jun 2019 07:52:46 -0000
Content-Transfer-Encoding: 8bit

It RDEPENDS on PACKAGE_ARCH!=all packages

Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
---
 .../ca-certificates-java/ca-certificates-java_20180516.bb       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/ca-certificates-java/ca-certificates-java_20180516.bb b/recipes-core/ca-certificates-java/ca-certificates-java_20180516.bb
index 2db1915..feaa7dc 100644
--- a/recipes-core/ca-certificates-java/ca-certificates-java_20180516.bb
+++ b/recipes-core/ca-certificates-java/ca-certificates-java_20180516.bb
@@ -24,7 +24,7 @@ SRC_URI = "\
 
 SRCREV = "793b846dcd4e79371bbe8069e4125ec2fd462e57"
 
-inherit java allarch
+inherit java
 
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build"
-- 
2.20.1


