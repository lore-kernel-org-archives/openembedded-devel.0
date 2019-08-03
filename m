Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
	[209.85.214.180])
	by mail.openembedded.org (Postfix) with ESMTP id CC24A71CBD
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Aug 2019 01:10:48 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id m9so34121878pls.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Aug 2019 18:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ICv9E5izMfYJWYQEncSv34iMvi0lMUSl70bbNykKSAg=;
	b=YKVwswd4uYKcybFB+BZybHXfqK3bN8hJ2Cce7sskK+yKnwioyL/ovqwD5w9hm6f+ic
	VI8UKE8Yxryck0zoKPRhH76ZNdUQwCWch4jfkDJbAt9MUOkwtvMswPvaZsBqAFRPi/Ob
	l939bxmU0rUkHRnUCRWZ45zIyXQByAgnaNpNyiKZl1xpqgHfX3t4PJbVwc6j3IynxS/q
	ciDuH5NQZ5gd4vVcCeArfKJUAYtvb4Nlbvk229kuHQj+aKta1XgkBcmt6/hdDp7Lp1QU
	/+hkP9EsshrCO0AfMKDZuujY5mWX1dF70PjQpSwCcP83vXoX9uhppya11Sv+ZXBYHMpd
	xZOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ICv9E5izMfYJWYQEncSv34iMvi0lMUSl70bbNykKSAg=;
	b=WMn3vkZa5vvQW/y203M6A8JzWY68J6UAU3/H4SFbhtkCKhFigjY/Y9zGBPASvbJaLK
	f0paZOjU/J20RZy2ky1KSqZVSUc81T1n3ahBPNkjWgoowWd31I7BKTylzHgG7KuUPMMd
	PWr6nHGVkUhMVZapM1fGxfQZQhCS++ZB4xqqi1oGmXBTegorx+0ODA/2VkT0sq1DC8mh
	8oq2sXSmEA1SOUTCGpmdQqEjaLQgff9x43m/t37ne4eAlEmhTV7MRk7Ym5KrYqhOo+xi
	58K6m5JMydAAoOf/Fk36j5nCLM18YzE/qMLxLX35BrONPTM6yW2FJFzA+CIJJ2emqpGu
	ouiQ==
X-Gm-Message-State: APjAAAVv1bzzEYKsZibrEd+iX+KmE7JDRUS5V9OK03Otb6uiDjhqtN2h
	H9tTzn2qRbOj5MDea3sTxaw/19w7YEE=
X-Google-Smtp-Source: APXvYqzxNRcQtEX1AgSXT2eiXCjPUJZPm184GbZu79Uh9Bnqyhdm8S53AL0WQMUMxrtDNlaSIVZc8A==
X-Received: by 2002:a17:902:8ec3:: with SMTP id
	x3mr22245983plo.313.1564794649363; 
	Fri, 02 Aug 2019 18:10:49 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	22sm86976937pfu.179.2019.08.02.18.10.48
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 02 Aug 2019 18:10:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  2 Aug 2019 18:10:36 -0700
Message-Id: <20190803011037.41864-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [meta-perl][PATCH 1/2] libsub-exporter-progressive-perl: Replace DEPENDS_PN with DEPENDS
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
X-List-Received-Date: Sat, 03 Aug 2019 01:10:48 -0000
Content-Transfer-Encoding: 8bit

Fixes
libsub-exporter-progressive-perl_0.001013.bb: QA Issue: recipe uses DEPENDS_${PN}, should use DEPENDS [pkgvarcheck]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libsub/libsub-exporter-progressive-perl_0.001013.bb         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libsub/libsub-exporter-progressive-perl_0.001013.bb b/meta-perl/recipes-perl/libsub/libsub-exporter-progressive-perl_0.001013.bb
index 64d19c0f1f..e484f4a7a0 100644
--- a/meta-perl/recipes-perl/libsub/libsub-exporter-progressive-perl_0.001013.bb
+++ b/meta-perl/recipes-perl/libsub/libsub-exporter-progressive-perl_0.001013.bb
@@ -13,7 +13,7 @@ HOMEPAGE = "https://metacpan.org/pod/Sub-Exporter-Progressive/"
 LICENSE = "Artistic-1.0 | GPL-1.0+"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=003fa970662359a43ac2c2961108b0f1"
 
-DEPENDS_${PN} = " perl-module-test-more"
+DEPENDS += " perl-module-test-more"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/F/FR/FREW/Sub-Exporter-Progressive-${PV}.tar.gz"
 SRC_URI[md5sum] = "72cf6acdd2a0a8b105821a4db98e4ebe"
-- 
2.22.0


