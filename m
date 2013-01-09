Received: from mail-ee0-f44.google.com ([74.125.83.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TskH1-0008B6-Qv
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Jan 2013 02:16:10 +0100
Received: by mail-ee0-f44.google.com with SMTP id b47so555736eek.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Jan 2013 17:00:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=s6JbjXvt4ghy13KllUeq7BV7DBT3llcat3dLyVnht3k=;
	b=MSJWr3q09IKgi4eLOMMzsd7jCsCFuJvB5oFBDpA/r0krqpLbyGKD60ItYejIJ3WQ72
	BJ/eaCNonKOkMsYijhedty3g1VwHmyCuQ6YVef+Atoomp9NwzV9MA3AOcIO1nhiasFdh
	wceiKt0UNizM9BO7Hg//OzWt2ri9+k1Bs5Vd6XjGjb+qm5qO8yLKYTIi+2GjFsg/E3g5
	xmgKFe17ZW+DSsa76l8Mhe99AC4dedzL7ZbLLkIMS/ab56AyGjbcqlXodlsq2/1yZlEI
	7HKw7wBZ3zWB3uueoS4KHkZI5SfDCJ3IS8nWPRgyS2Phn3Aas9hlByzZeuauisqknNSY
	JRaQ==
X-Received: by 10.14.215.194 with SMTP id e42mr178068160eep.32.1357693256780; 
	Tue, 08 Jan 2013 17:00:56 -0800 (PST)
Received: from localhost.localdomain (p5B0A0819.dip.t-dialin.net. [91.10.8.25])
	by mx.google.com with ESMTPS id q44sm138552893eep.5.2013.01.08.17.00.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 08 Jan 2013 17:00:56 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Jan 2013 02:00:39 +0100
Message-Id: <1357693239-13210-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1357693239-13210-1-git-send-email-schnitzeltony@googlemail.com>
References: <1357693239-13210-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe/meta-multimedia 2/2] physfs: initial add 2.0.3
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 09 Jan 2013 01:16:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-support/physfs/physfs_2.0.3.bb |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/physfs/physfs_2.0.3.bb

diff --git a/meta-oe/recipes-support/physfs/physfs_2.0.3.bb b/meta-oe/recipes-support/physfs/physfs_2.0.3.bb
new file mode 100644
index 0000000..641d7ec
--- /dev/null
+++ b/meta-oe/recipes-support/physfs/physfs_2.0.3.bb
@@ -0,0 +1,11 @@
+DESCRIPTION = "PhysicsFS is a library to provide abstract access to various archives"
+HOMEAPAGE = "http://icculus.org/physfs"
+LICENSE = "Zlib"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5d94e3eaaa10b00ca803ba35a3e87cde"
+DEPENDS = "readline zlib"
+
+inherit cmake
+
+SRC_URI = "http://icculus.org/${PN}/downloads/${PN}-${PV}.tar.bz2"
+SRC_URI[md5sum] = "c2c727a8a8deb623b521b52d0080f613"
+SRC_URI[sha256sum] = "ca862097c0fb451f2cacd286194d071289342c107b6fe69079c079883ff66b69"
-- 
1.7.4.4



