Return-Path: <rehsack@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 8A429770F7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Oct 2015 11:54:42 +0000 (UTC)
Received: by wicgb1 with SMTP id gb1so24723994wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Oct 2015 04:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:date:message-id
	:cc:to:mime-version;
	bh=NKQt8H5qux1eQM81qssVaH4UlHJt60tHYgjUL24Xg4U=;
	b=FW3ec7P9PZ9Q11XuDtBoxKgdmRlqU/1gvYHqxDjkie+209iuAlRRYlPgUktFN/nZj6
	7Cu77fEoeTkXbTmnMsxWBpo7tIG5/ntUDWwU229LGOQpeEWSsCT9QIVxeH0de/8LXr9j
	RXgqOcbEUtnjS40Td1XXj6K3OO4nbVr8xF9BYG9x7odcPhvHNNs4y9PtFo2W9qFkgFd4
	+/IpU1gN+HbIHZyMhgdzdbEAdIzUjR9KbXYR50cayiay0kl2Y9cq9REXovgf6VJ9NEIZ
	uDsBp14Z4aZckf3Gth3P1fl1ZG0GuDEJ8cx5VGhwbACjFRd4xUviytI6dEcEDWIoOTu3
	iRQw==
X-Received: by 10.194.6.66 with SMTP id y2mr10997032wjy.82.1444910082412;
	Thu, 15 Oct 2015 04:54:42 -0700 (PDT)
Received: from ernie.muppets.liwing.de (p578b540c.dip0.t-ipconnect.de.
	[87.139.84.12]) by smtp.gmail.com with ESMTPSA id
	x9sm16039374wjf.44.2015.10.15.04.54.41
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Oct 2015 04:54:41 -0700 (PDT)
From: Jens Rehsack <rehsack@gmail.com>
Date: Thu, 15 Oct 2015 13:54:41 +0200
Message-Id: <24E7CB6C-3158-46FC-A68A-C37E0A72234C@gmail.com>
To: OE-devel <openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Mailer: Apple Mail (2.2104)
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-java][PATCH 5/6] openjdk: Avoid extra-noise because of self-satisfying dependency
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
X-List-Received-Date: Thu, 15 Oct 2015 11:54:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


I realized one small issue last days: the dependency of openjdk-*-demos =
on java2-vm, which is
provided by the current recipe (eg. openjdk-7) causes bitbake scan for =
alternatives (eg. java2-vm
provided by openjdk-6) without any need.

I would recommend to remove such a generic dependency:
* openjdk-6-demos require openjdk-6-jre, period.
* openjdk-7-demos require openjdk-7-jre, period.
* openjdk-8-demos require openjdk-8-jre, period.

There is no sense in satisfying openjdk-8-demos with openjdk-6-jre (even =
if it might be possible).

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 recipes-core/openjdk/openjdk-6-common.inc | 2 +-
 recipes-core/openjdk/openjdk-7-common.inc | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-core/openjdk/openjdk-6-common.inc =
b/recipes-core/openjdk/openjdk-6-common.inc
index 7ad7097..cf192d0 100644
--- a/recipes-core/openjdk/openjdk-6-common.inc
+++ b/recipes-core/openjdk/openjdk-6-common.inc
@@ -303,7 +303,7 @@ FILES_${JDKPN}-dbg =3D "\
        "
=20
 FILES_${JDKPN}-demo =3D "${JDK_HOME}/demo ${JDK_HOME}/sample"
-RDEPENDS_${JDKPN}-demo =3D "java2-runtime"
+RDEPENDS_${JDKPN}-demo =3D "${JDKPN}-jre"
 FILES_${JDKPN}-demo-dbg =3D "\
 	${JDK_HOME}/demo/jvmti/gctest/lib/.debug \
 	${JDK_HOME}/demo/jvmti/heapTracker/lib/.debug \
diff --git a/recipes-core/openjdk/openjdk-7-common.inc =
b/recipes-core/openjdk/openjdk-7-common.inc
index 13f3460..74b93d9 100644
--- a/recipes-core/openjdk/openjdk-7-common.inc
+++ b/recipes-core/openjdk/openjdk-7-common.inc
@@ -248,7 +248,7 @@ FILES_${JDKPN}-dbg =3D "\
        "
=20
 FILES_${JDKPN}-demo =3D "${JDK_HOME}/demo ${JDK_HOME}/sample"
-RDEPENDS_${JDKPN}-demo =3D "java2-runtime"
+RDEPENDS_${JDKPN}-demo =3D "${JDKPN}-jre"
 FILES_${JDKPN}-demo-dbg =3D "\
 	${JDK_HOME}/demo/jvmti/gctest/lib/.debug \
 	${JDK_HOME}/demo/jvmti/heapTracker/lib/.debug \
--=20
2.3.8 (Apple Git-58)

--=20
Jens Rehsack - rehsack@gmail.com


