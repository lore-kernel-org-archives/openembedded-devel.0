Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 52B1773C5B
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 May 2015 19:09:17 +0000 (UTC)
Received: by igbpi8 with SMTP id pi8so84534506igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 May 2015 12:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=dJTk8Qvp/OmY9gCYqxGaFn5O/uN4JMgJV0VlolQdrzA=;
	b=xqvPrNvVqPngE9NbJU0LYo19QWAMvFb9X6x4bR5MideC20RDCsGSYawmWa5IGx9Dkv
	ba/UObyJAqqoG6K8lOomDdXkSEoZ/K1GGk1kv2ROLkWGTRHCmTVtSDyyB487IRbkPKig
	2ETovaVyVr3PKq+Gj29nMwxxELHw8IsP69HPq5pILOWmHU0N5QBfpEuX92RnuuAVhoIc
	94M2q/wGkmec8wX0pDDjdKEWLEeiXSirw2LKR69QBNgBOGiyCvdTqn0uu/LqsR++6DfQ
	q7T4XdOHli9xEuXzyLGiOX/f6gHmU5XTCU34t+Pn6kX0jMEks03rnN6V+M8536XZJx4s
	UPvA==
X-Received: by 10.107.133.27 with SMTP id h27mr35368535iod.31.1430852959358;
	Tue, 05 May 2015 12:09:19 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by mx.google.com with ESMTPSA id vk8sm135395igb.4.2015.05.05.12.09.18
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 05 May 2015 12:09:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 May 2015 12:09:09 -0700
Message-Id: <1430852951-18707-5-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1430852951-18707-1-git-send-email-raj.khem@gmail.com>
References: <1430852951-18707-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 5/7] libsigc++: Use http instead of ftp in SRC_URI
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 May 2015 19:09:18 -0000

Fixes fetch failures

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.2.11.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.2.11.bb b/meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.2.11.bb
index b6ce5fc..546305f 100644
--- a/meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.2.11.bb
+++ b/meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.2.11.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499"
 
 DEPENDS = "mm-common"
 
-SRC_URI = "ftp://ftp.gnome.org/pub/GNOME/sources/libsigc++/2.2/libsigc++-${PV}.tar.xz"
+SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/libsigc++/2.2/libsigc++-${PV}.tar.xz"
 SRC_URI[md5sum] = "815d0c6d61601f51bbcaeef6826606b0"
 SRC_URI[sha256sum] = "9834045f74f56752c2c6b3cdc195c30ab8314ad22dc8e626d6f67f940f1e4957"
 
-- 
2.1.4


