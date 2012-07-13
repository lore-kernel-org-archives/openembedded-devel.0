Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Spc6v-0006VU-DC
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jul 2012 11:24:29 +0200
Received: by mail-ey0-f175.google.com with SMTP id l1so885914eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2012 02:13:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=Rooy0qHdeibR78XzDafOgmINySYbKJp0TGUsnCpKDto=;
	b=b8XduZ0qzH6z/f59wGc3qRXo0N23JyI8Oh3tveGgnwyLAVIsr5xhJoqIIlPP7yFhfo
	7lrerv3jn3p87+apSMCsXcA5MiT4xZXhNdorvLEKU6OY7ggKOudHfKnsC4LCv8KnHU94
	J5P+cXaqTcxwfDG9u1vhOURiskEDBpxG5GFmSsYks+d8zCCsYjJDA/4aBxQbugFpxlsd
	it8a2YLR3/7kDscPBpeJls5jbee8I0ijn6jgJlWEGZ4j78zwv7U7266gq2q0vuhjdpPq
	AKKWbOZaGmSPO+AnmaJ/zK3PAsfKogv33N15uUCoZXpQmKp02XVBb8g/JB3gnKgCstgC
	Hexg==
Received: by 10.14.98.129 with SMTP id v1mr61175eef.214.1342170797451;
	Fri, 13 Jul 2012 02:13:17 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id m46sm23174311eeh.9.2012.07.13.02.13.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Jul 2012 02:13:16 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Jul 2012 11:12:04 +0200
Message-Id: <1342170730-14982-18-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1342170730-14982-1-git-send-email-koen@dominion.thruhere.net>
References: <1342170730-14982-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQlKQYWT/8tPZjzfTGsWXCR/7gVCRrEiKbRZR+XgwxZlbeavKsxruhzhc5gt+8kD1aegxFGI
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Martin Jansa <martin.jansa@gmail.com>, eric@eukrea.com
Subject: [for-denzil][meta-oe 18/24] libjpeg-turbo: add LEAD_SONAME to fix upgrade to 8d
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
X-List-Received-Date: Fri, 13 Jul 2012 09:27:25 -0000

From: Martin Jansa <martin.jansa@gmail.com>

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb b/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
index 16fb2c7..f061f41 100644
--- a/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
+++ b/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://cdjpeg.h;endline=12;md5=78fa8dbac547bb5b2a0e6457a6cfe
                     file://djpeg.c;endline=13;md5=e85613b52f2906c5dfc0e21ec902cb33 \
 "
 PV = "8d+1.2.1"
+PR = "r1"
 SRCREV = "837"
 SRC_URI = "svn://libjpeg-turbo.svn.sourceforge.net/svnroot/libjpeg-turbo;proto=https;module=trunk"
 
@@ -29,3 +30,5 @@ INSANE_SKIP_libturbojpeg = "dev-so"
 
 BBCLASSEXTEND = "native"
 DEPENDS_virtclass-native = "nasm-native"
+
+LEAD_SONAME = "libjpeg.so.8"
-- 
1.7.10



