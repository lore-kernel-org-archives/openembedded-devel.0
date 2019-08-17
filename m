Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
	[209.85.214.181])
	by mail.openembedded.org (Postfix) with ESMTP id C08677F270
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Aug 2019 19:40:55 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id go14so3551875plb.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Aug 2019 12:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7RArKWeGp9xqWPkmK2kbdpWKKTYHcvVTgdrSiPi9p0E=;
	b=ET2dgsYhLZDCcCOMx6ZhD+npr4sHGqwq0CbKPCQ7tgnlnl6TW/Pl02nr61FmWJO7qH
	xR+Fu0IcY1TN1Lk81aFGhnfi8sv9N9WS1cuUWKwan5n6kygN24t5VSx/iCcoN1vfVE1k
	fEKOdUn6XWepX4/dqe9x6DU1DB6TLsOvTDb5qC3abfzJzsvbp/cDESM/lYmEc8evZx2Q
	tAjbJMwh+zOC6ek6bzOHRysE2OM7AyYHCY9de9/XLPk2F9RuK0FcLDn8a1SXa7wSU4Jk
	MGZrM1w3SrFJx+El0D/UCTuO1FJIdvCgW0tbt4dIRsvvcsq8nmDBZ6VsSpdTR8k0VR0i
	MYEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7RArKWeGp9xqWPkmK2kbdpWKKTYHcvVTgdrSiPi9p0E=;
	b=mYYb2vk3ZxN85nEFo61mF58Hgm9tTgSsOwXvOczyH39SyV1bnYGczdPjEqp+Mr+cDd
	T0cWBX856XEt+s0U1nN13WwWdsN5/bj1gv1cZIN6qqfmHMe3lasAhd0lXiVW4BYscVMq
	2tzPxoOuxcsNXrbL+OTjPsu+LRkaM+8BMj2BreudPPzextE48hQVLjIlzZRFUpSkdbyJ
	OivhBAXO3DFLLAtd3s1XsjKgLCiegTd3KS3jKt/2Sd4XJykFXZ9cK1AJA6VbIrnk5R8m
	vXhVEyjwxaI9hjvVp5DCYcO5NC4hqy7Vvz+ODtlYoCsm3zJ3hMjb2EEG472QQEvcEpQd
	Yo3Q==
X-Gm-Message-State: APjAAAUAmvBMXAMRS9utqAMGbjsyqKugDjOQeP56IK2m24drbMDNZ3ay
	eBFc8O6YzGBgHJqx0efngRatg0Y4Hlc=
X-Google-Smtp-Source: APXvYqyOqS/1J/ewxx6l6nA4Rqqir1acYzvKTXXhJVX9+zAGNhVPH5jIJHlVZa+gl5HaYRd2S0RFIA==
X-Received: by 2002:a17:902:e613:: with SMTP id
	cm19mr8320258plb.299.1566070856395; 
	Sat, 17 Aug 2019 12:40:56 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	u24sm9679542pgk.31.2019.08.17.12.40.55
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 17 Aug 2019 12:40:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 17 Aug 2019 12:40:48 -0700
Message-Id: <20190817194049.40413-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.1
MIME-Version: 1.0
Subject: [meta-python][PATCH 1/2] python3-blivet: Add python3 to rdeps
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
X-List-Received-Date: Sat, 17 Aug 2019 19:40:55 -0000
Content-Transfer-Encoding: 8bit

Fix do_package_qa error
ERROR: QA Issue: /usr/libexec/blivetd contained in package python3-blivet requires /usr/bin/python3, but no providers found in RDEPENDS_python3-blivet? [file-rdeps]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-extended/python-blivet/python3-blivet_3.1.4.bb      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet_3.1.4.bb b/meta-python/recipes-extended/python-blivet/python3-blivet_3.1.4.bb
index 817ef9bafb..fe9d27ab8f 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivet_3.1.4.bb
+++ b/meta-python/recipes-extended/python-blivet/python3-blivet_3.1.4.bb
@@ -30,7 +30,7 @@ REQUIRED_DISTRO_FEATURES = "systemd"
 
 inherit setuptools3 python3native
 
-RDEPENDS_${PN} = "python3-pykickstart python3-pyudev \
+RDEPENDS_${PN} += "python3-pykickstart python3-pyudev \
                   parted python3-pyparted multipath-tools \
                   lsof cryptsetup libblockdev \
                   libbytesize \
-- 
2.22.1


