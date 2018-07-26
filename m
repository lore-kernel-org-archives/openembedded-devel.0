Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id CAAF878C32
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jul 2018 16:49:11 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id a132-v6so1433790qkg.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jul 2018 09:49:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=FEKRBFPVn0d40cjEOnTliPo9fCfbvYIqhVGr7JQtBhY=;
	b=bWpe2MwSuG9XQ0uakixBuLcwjIk77aAVW4yUFQDnJ45jAy4g7qMUrmpqYuGQ1ZTtC5
	NwK+SYgLgxDfjSVhiNt3RXjtPAh6NfyppV5aI8pnFC0hKWXWgXXp0dpVCp7jdOnvdlMJ
	Qu2WyZGbbkNIvtZfl4Cwf6onaQhZPtVFBZ/SMRQc04zoKg5FjxBjGAgk+V2C7/BQBTLA
	FlLTW+h0NVNCQpSr5SdKPcx4IY2dQ0VAfUf3pBjxsSC3uZtxVrJXKSLiJoFr7huUn8FH
	cXEkDyd31HtfCvh5RGllr403Kb63Yn2/HTaUvO58rt1t1VAaHy0Ah45lCpM9cuXIqZIK
	rqsw==
X-Gm-Message-State: AOUpUlGSjCADC03n+HM8bQ5w1j9guR7EIWfvrQDhOWG8y6hiCA0ryvrE
	Dk15Gpiz9lyPus3+dFArHXoFrkdI
X-Google-Smtp-Source: AAOMgpfpGr24gqcdRUvSYa5Zcn5OXRnfACnIBa0YuzmSTALjnbzP/sDup0iWXV7BLk+KP+ZZFT7Xvw==
X-Received: by 2002:a37:aa86:: with SMTP id
	t128-v6mr2532492qke.135.1532623752399; 
	Thu, 26 Jul 2018 09:49:12 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.61.164])
	by smtp.gmail.com with ESMTPSA id
	y128-v6sm763170qkc.1.2018.07.26.09.49.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 26 Jul 2018 09:49:11 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 26 Jul 2018 12:49:06 -0400
Message-Id: <1532623746-3295-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCHv2] python-dateutil: add dependency on setuptools-scm-native
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
X-List-Received-Date: Thu, 26 Jul 2018 16:49:12 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-dateutil.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-dateutil.inc b/meta-python/recipes-devtools/python/python-dateutil.inc
index d96d84f..9c5a89d 100644
--- a/meta-python/recipes-devtools/python/python-dateutil.inc
+++ b/meta-python/recipes-devtools/python/python-dateutil.inc
@@ -13,6 +13,8 @@ inherit pypi
 PACKAGES =+ "${PN}-zoneinfo"
 FILES_${PN}-zoneinfo = "${libdir}/${PYTHON_DIR}/site-packages/dateutil/zoneinfo"
 
+DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
+
 RDEPENDS_${PN}_class-target = "\
     ${PYTHON_PN}-datetime \
     ${PYTHON_PN}-numbers \
-- 
2.7.4


