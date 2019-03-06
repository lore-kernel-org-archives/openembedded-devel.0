Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id BA3457C752
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Mar 2019 01:53:20 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id h8so7000228pgp.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Mar 2019 17:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=qpO0kT4C9v5a4PUFFL8Y8C70I9v2UTAxtMNLmExC+Wg=;
	b=Ts6CjuJeXel2HZUjvMyueBJtdlF2TizQibGUgiz0vtRVCU0ixKahwrgtXXtW2tFchI
	hXlOy0kDyMc3qJvRoZqDtGz/VVaXc7TW1kQNrzAJzS/VqIh876hGSGMRxD8uRc9FJb8D
	oeo08uwXBw6/ZOrNSt5azTnBOtcs/3nKhgOSNJqHUxFFo6NlhomsjFmd/34xXiz5G1YF
	aPFE+F2ZVZM9RLc+u6oebS2u43xJfBFs9q4WY6sqtfnHKdDFNidyCEuLmMGr3A35xDVq
	4Ljgr1BzXm71YlH6eNyIuOBTa+2vy5u212jtSgoaxS9HONzH0sn1bm2+MDoVb/ELqPuz
	QlyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=qpO0kT4C9v5a4PUFFL8Y8C70I9v2UTAxtMNLmExC+Wg=;
	b=H93BpU66joeh+Gq3D92mn44lqrKutHIt0nFd5KWX2AkcS+IHMGx9lD0a49mbtNxIvt
	50k7w5OWNe/DmQCcH7pS/p9mxSErrubha/mRvZxNWAn6A9aVVL3BgKVsGOPmZYcU0FVd
	Xo8OUNzMnpbtFmMyt0GTxRZi/WI9u7cSFh2YlR654vm0lW6OOnv/hQL659heL/sGcOHE
	3t5gSkq16OY2r1KyLdp/pEgQfUqhyfPPSPud11T6e0fxJfJ3Yn1FT289RRDgxuXrmVNW
	MoUUWhZkei+MD30jgZuXMTNzMkWVtq4AmMsbZyGQ51iErfncCFHJU9IcegNx+uaYm9ue
	kNdQ==
X-Gm-Message-State: APjAAAWYOhJylG1U4boJHP+IL5KjIoK2jJGVmbPaapkhhuN57ZaZ6gWx
	sfJInxixFN8h/Z8B9s1qs1CshXuV
X-Google-Smtp-Source: APXvYqyQ5hcDJrVszA4Q3ulOWI0y0XngesPoOG/iPH4wZLwVeZtD09mHKg/bvFNztPbQM07z1YMTLw==
X-Received: by 2002:a62:1c45:: with SMTP id c66mr4842305pfc.90.1551837201299; 
	Tue, 05 Mar 2019 17:53:21 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::3401])
	by smtp.gmail.com with ESMTPSA id c13sm524624pfm.34.2019.03.05.17.53.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Mar 2019 17:53:20 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Mar 2019 17:53:13 -0800
Message-Id: <20190306015313.25163-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [meta-filesystems][PATCH] xfsprogs: Fix build with riscv/musl
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
X-List-Received-Date: Wed, 06 Mar 2019 01:53:20 -0000
Content-Transfer-Encoding: 8bit

The riscv tuples do not exist in older gnu-config

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.18.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.18.0.bb b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.18.0.bb
index 0a1bacb935..88603db805 100644
--- a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.18.0.bb
+++ b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.18.0.bb
@@ -58,6 +58,8 @@ do_configure () {
     rm -f ${B}/include/builddefs ${B}/include/platform_defs.h ${B}/configure
     # Recreate configure script.
     oe_runmake configure
+    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}
+    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}
     oe_runconf
 }
 
-- 
2.21.0


