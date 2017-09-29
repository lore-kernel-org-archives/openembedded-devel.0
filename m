Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2D02D71974
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Sep 2017 05:27:49 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id u136so440024pgc.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Sep 2017 22:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=l7MrkU9819zynUVD+YCpd9oBxJn/0CyghzyXv5ys8Ok=;
	b=ssXVDzMu93fY5dJzzxpN5TKINBre0wVKDh5ktUUx1rGK2kPsGHTzv5lzu8JgUxSzjf
	W+TTwYJ3ziL1uNMdaSwLsmHw3VkpKXYd81toeNcfDV9M0SBcC52MXk+Nk1QaXLGt0B9G
	hQB6gfD6tfjNebQjL/PnnEZEho3sjA2L0rgiW7uYuowqRVIicvjn7LCsGM90RqtnXt/c
	+3vC3d/txoUKZ9eUal6g7f/eR86kddoHZ57/W0u94HSmP9chnoEPdAtm5COyz1fPVwph
	NdQGozXxJvioBCFYhUnYtpymN2Fs0C9IWdpcaatCtnZYpmgV0XWNpd5nVC22KMsGGctJ
	bZAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=l7MrkU9819zynUVD+YCpd9oBxJn/0CyghzyXv5ys8Ok=;
	b=sS0rpL4+F/Ikna5QqCkZKDv/8UWntMAEKaeNEukChHzxenMPGSDTJrXkguNubVxQ9l
	cjYZPTimc0bvS27TugvC25XaVBjK2jDrgCf/fVe27WR/3lvSUeJCnGEQrVsAz7iV3loV
	EM/mQBXyt/r9n8Pq9T1PAAtqwxaX7z6RnSJ6mhUojV2JBS6WIM2qTlrjPZKhDtwSmmTn
	+ukTj1XhuFZG0ucvasFNB2+oF4ihts4UbuxbiGUPZniuRzGJR6BlPl0SzJ2itGMqEjzT
	k6mLIlrcoLECSgUc4NKoMqAyE4vhVSBKTh4lTT9Dqu2WF1s5vzsckWDf0KvVAfhaWMhW
	E+2Q==
X-Gm-Message-State: AHPjjUg+1twthM79eTXUq4KBS9OJKIj3Zga00p07CgoEDLAXiVzPCJdp
	nEZF83qE/xg5vrul0JFvXnAGjA==
X-Google-Smtp-Source: AOwi7QDQzXTclZTUpUMTnhHe6RJFcm0HhbUQE3cIPHRxDpk5j0zKUaqpeeUy1mYGoAERLW2LFOY7sw==
X-Received: by 10.99.191.75 with SMTP id i11mr6128957pgo.136.1506662871198;
	Thu, 28 Sep 2017 22:27:51 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::1f76])
	by smtp.gmail.com with ESMTPSA id
	t25sm5302552pfe.96.2017.09.28.22.27.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Sep 2017 22:27:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 28 Sep 2017 22:27:41 -0700
Message-Id: <20170929052741.7787-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.2
Subject: [meta-oe][PATCH V3] mongodb: Pass computed endian variable
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
X-List-Received-Date: Fri, 29 Sep 2017 05:27:50 -0000

If not passed to SCon, it will try to guess it
and do it by poking at build host, which wont
work in cross environment

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
Changes in V3: Inherit siteinfo class

 meta-oe/recipes-support/mongodb/mongodb_git.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/mongodb/mongodb_git.bb b/meta-oe/recipes-support/mongodb/mongodb_git.bb
index d44d8d3c7..0ff7d0b59 100644
--- a/meta-oe/recipes-support/mongodb/mongodb_git.bb
+++ b/meta-oe/recipes-support/mongodb/mongodb_git.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://GNU-AGPL-3.0.txt;md5=73f1eb20517c55bf9493b7dd6e480788
 
 DEPENDS = "openssl libpcre libpcap zlib python boost"
 
-inherit scons dos2unix
+inherit scons dos2unix siteinfo
 
 PV = "3.4.6+git${SRCPV}"
 SRCREV = "c55eb86ef46ee7aede3b1e2a5d184a7df4bfb5b5"
@@ -58,6 +58,7 @@ EXTRA_OESCONS = "--prefix=${D}${prefix} \
                  --use-system-zlib \
                  --js-engine=none \
                  --nostrip \
+                 --endian=${@base_conditional('SITEINFO_ENDIANNESS', 'le', 'little', 'big', d)} \
                  ${PACKAGECONFIG_CONFARGS} \
                  mongod mongos"
 
-- 
2.14.2


