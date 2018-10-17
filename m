Return-Path: <maxime.roussinbelanger@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3C0E2796EE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Oct 2018 20:33:03 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id q41-v6so31698291qtq.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Oct 2018 13:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Piz27WsE8ir+60wZWuJkhQf7mbKeYjeCboCwzARWzkY=;
	b=kw3W2tlnurMfW8yN2duNWWxGLjb/YJgpNWYNlYWn9bqDS3ZOqwkuHSDnOcXErwjw7J
	Z4eCYYSfKAcLebOmPv/LjvQgldF8gV/gSWtNiXQwrSn821fXDlkyYKf2keE/XK6Kpj1g
	4DKHeXpFvAIE43iCVCGH/FTIYdJ6aAQ2Iz/jzp+G/Icj+mQflvmxsuRmGmYW8leOMT3z
	2skZ6+RLnjINDmNF+xQUrfhUPPk7KTYVF2Jj4cDomdaF7OD3mBwWsACP1q9/mCHPQEtG
	Uc7uYSKVeqgKyLQMHhTzht6hY3CLM3eHuihuip4UQW3U0pQd+HT0eK+T/pw6qcZVvRYA
	T94g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Piz27WsE8ir+60wZWuJkhQf7mbKeYjeCboCwzARWzkY=;
	b=RxvQbdgYF12OMrauXZMhoplfP3Zvd0g+r/0VkRKo+CORrPmaNx1Vm9rrFwcJHpP228
	nRRJK3Ik0bPq5xD856z1fRwGf5voJg8u1cNmrPB76rYy1jALDtbaTJrLqPT6Sse4HvRR
	rHlKIuVoff7X0bGQVYjLoTO2YhY6q5/sT6uzGJBPRUbETytSi+66Q/aRAHfrNJfX3ICW
	Na6IWonz8MjGZDo8r9hAEKyfGmN44U9M+b0Swhe2oGZISk4paG0JpHhqKG/sxaRnVntq
	5PS38hJUmgOzXRnDJzXtovRc6m1PoSmiXVaKQsV3/vHsVFdIw4zRGEJIH9mz2uPFkBi9
	geNQ==
X-Gm-Message-State: ABuFfoi4rmqbP79s70i3Vv4qdfK/NOORL+UFpbKEsaaKLKZUO03zYeiF
	KOoxr6Tvw5hBtXpMD2eoUG+M+KXp
X-Google-Smtp-Source: ACcGV60VAzs0jsZEkpUA56cnQm79BYKjQNRgdPQOUVluCzPcGcM2iOhrI1OgiDx/pR3mcrUN9AeZBQ==
X-Received: by 2002:ac8:3397:: with SMTP id
	c23-v6mr26102182qtb.190.1539808383906; 
	Wed, 17 Oct 2018 13:33:03 -0700 (PDT)
Received: from mbedesk.Sonatest.net
	(ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca.
	[174.94.156.236]) by smtp.gmail.com with ESMTPSA id
	y28-v6sm13640181qtk.15.2018.10.17.13.33.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 Oct 2018 13:33:02 -0700 (PDT)
From: =?UTF-8?q?Maxime=20Roussin-B=C3=A9langer?=
	<maxime.roussinbelanger@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Oct 2018 16:33:00 -0400
Message-Id: <20181017203300.23376-1-maxime.roussinbelanger@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH v3] libeigen: update to 3.3.5
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
X-List-Received-Date: Wed, 17 Oct 2018 20:33:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Maxime Roussin-Bélanger <maxime.roussinbelanger@gmail.com>
---
 .../libeigen/{libeigen_3.3.4.bb => libeigen_3.3.5.bb}       | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/libeigen/{libeigen_3.3.4.bb => libeigen_3.3.5.bb} (79%)

diff --git a/meta-oe/recipes-support/libeigen/libeigen_3.3.4.bb b/meta-oe/recipes-support/libeigen/libeigen_3.3.5.bb
similarity index 79%
rename from meta-oe/recipes-support/libeigen/libeigen_3.3.4.bb
rename to meta-oe/recipes-support/libeigen/libeigen_3.3.5.bb
index 31a42a9d66..7078e50bb0 100644
--- a/meta-oe/recipes-support/libeigen/libeigen_3.3.4.bb
+++ b/meta-oe/recipes-support/libeigen/libeigen_3.3.5.bb
@@ -5,10 +5,10 @@ LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING.MPL2;md5=815ca599c9df247a0c7f619bab123dad"
 
 SRC_URI = "http://bitbucket.org/eigen/eigen/get/${PV}.tar.bz2;downloadfilename=${BP}.tar.bz2"
-SRC_URI[md5sum] = "a7aab9f758249b86c93221ad417fbe18"
-SRC_URI[sha256sum] = "dd254beb0bafc695d0f62ae1a222ff85b52dbaa3a16f76e781dce22d0d20a4a6"
+SRC_URI[md5sum] = "e83549a79d1b721da0f8899ab34edf95"
+SRC_URI[sha256sum] = "7352bff3ea299e4c7d7fbe31c504f8eb9149d7e685dec5a12fbaa26379f603e2"
 
-S = "${WORKDIR}/eigen-eigen-5a0156e40feb"
+S = "${WORKDIR}/eigen-eigen-b3f3d4950030"
 
 inherit cmake
 
-- 
2.19.1


