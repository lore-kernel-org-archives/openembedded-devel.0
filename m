Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7D25271A71
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Aug 2017 13:45:45 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id i19so5771753qte.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Aug 2017 06:45:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=RiSS5uYULksUEFy4zGU8/HkBk/R5j1gMW1VFTY9ANys=;
	b=oChpGaw33afAsVRJZJHNTSpt9yVnLahSmWUwf8P6lsmomztFr+RL5b/XJNqudRIaQN
	o1QU/UFKbjRofydxjigO9ZMRI/gh+wRrQ8Yfpa3R6eRsdMke2xmtUPAMiGgc8oMnLLNH
	79h84CCE8xElFzyCWc1jZBTBGKsN+uGHRrDyojxpEYt1Of4gDnrrydILsItJVDUS2U6I
	Stb3+ruB8GXs/H7+sPDvJB+/66TPDFIQo50psHdxtbgUV0wip1ASxYyTOSjGboaAMHo4
	5wUa3awuAzgZnIIq//MqHYTd4l3FkV4ggUfcFtMGOQgW/FmWCRtQupUhmjtW2apF2Fox
	xUUg==
X-Gm-Message-State: AHYfb5hRx5EMPIMfOibsWJTEjMHuAaZzcsqLr9CPxJiT+ez07hs3li0a
	HBhLkkLXNI5Y6xPaYto=
X-Received: by 10.237.32.172 with SMTP id 41mr11040124qtb.260.1502286346139;
	Wed, 09 Aug 2017 06:45:46 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id
	s36sm2056303qts.77.2017.08.09.06.45.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 09 Aug 2017 06:45:45 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Aug 2017 09:45:19 -0400
Message-Id: <1502286319-9513-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-webserver][PATCH] webmin: update to version 1.850
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
X-List-Received-Date: Wed, 09 Aug 2017 13:45:45 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-webadmin/webmin/{webmin_1.801.bb => webmin_1.850.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-webadmin/webmin/{webmin_1.801.bb => webmin_1.850.bb} (97%)

diff --git a/meta-webserver/recipes-webadmin/webmin/webmin_1.801.bb b/meta-webserver/recipes-webadmin/webmin/webmin_1.850.bb
similarity index 97%
rename from meta-webserver/recipes-webadmin/webmin/webmin_1.801.bb
rename to meta-webserver/recipes-webadmin/webmin/webmin_1.850.bb
index d96c0f2..6acff03 100644
--- a/meta-webserver/recipes-webadmin/webmin/webmin_1.801.bb
+++ b/meta-webserver/recipes-webadmin/webmin/webmin_1.850.bb
@@ -20,8 +20,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/webadmin/webmin-${PV}.tar.gz \
            file://mysql-config-fix.patch \
             "
 
-SRC_URI[md5sum] = "91d05b4e31ad1bd14bab14e0f155c088"
-SRC_URI[sha256sum] = "ad477edb41dc1a900448afc8b5528e136b3778d2d303f23bc564afb975eb5bed"
+SRC_URI[md5sum] = "cd6ee98f73f9418562197675b952d81b"
+SRC_URI[sha256sum] = "c66caa9e4cb50d5447bc8aceb7989d2284dde060278f404b13e171c7ce1690e1"
 
 inherit perlnative update-rc.d
 
-- 
2.7.4


