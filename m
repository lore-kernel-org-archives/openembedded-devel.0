Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PaVN9-0006qY-Ee
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Jan 2011 16:33:59 +0100
Received: by bwz10 with SMTP id 10so14949573bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Jan 2011 07:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=IQ6+vbSut+rXRjz6CphErQ/CaKyl69RF86EScBo5sN8=;
	b=LNy9gT3TQL3onm1hxabxJCr6hJXwlMvcAXYTXy6jonA/62mepOZZ0p7tlLOLgmvRYI
	8WhBsylHM2Mud3iB4+GcrFi8zQrqqrX4yx4L1nhL7aOr+4eJS+ao83aXc5JIJitETkS/
	p7tY643vosEkvtXdmskmmywE2CsbLARPYvB9g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=I8gJPg7KPz4qRSPsBaddEfLbh95N8LmvUR0+l/AQfLQVadvMfuYJ+bSJqiUthYWWTP
	OIwulTqsa/XWWpndKEG4Rpse1TCB/N1jEYoSIIAv2cDFCJp3kS2E2GujM93XEl6mgmn9
	s8XYgL1ZidPwlQLn3QSwqC4TGngyGkyj3LG8E=
Received: by 10.204.68.13 with SMTP id t13mr759816bki.164.1294241616980;
	Wed, 05 Jan 2011 07:33:36 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id j11sm12983289bka.12.2011.01.05.07.33.36
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 05 Jan 2011 07:33:36 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Jan 2011 16:33:32 +0100
Message-Id: <1294241612-28405-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1294241612-28405-1-git-send-email-Martin.Jansa@gmail.com>
References: <1294241612-28405-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 2/2] mysql5-native: put make install to do_install after autotools_stage_all was removed with do_stage in eaf0fc03acfb262bcd614a14086a1b28ec850f46
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
X-List-Received-Date: Wed, 05 Jan 2011 15:33:59 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/mysql/mysql5-native_5.1.40.bb |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/recipes/mysql/mysql5-native_5.1.40.bb b/recipes/mysql/mysql5-native_5.1.40.bb
index 40d07ec..8001783 100644
--- a/recipes/mysql/mysql5-native_5.1.40.bb
+++ b/recipes/mysql/mysql5-native_5.1.40.bb
@@ -12,6 +12,10 @@ EXTRA_OEMAKE = ""
 EXTRA_OECONF = " --with-embedded-server "
 
 do_install() {
+        oe_runmake 'DESTDIR=${D}' install
+        mv -f ${D}${libdir}/mysql/* ${D}${libdir}
+        rmdir ${D}${libdir}/mysql
+
         install -d ${D}${bindir}
         install -m 0755 sql/gen_lex_hash ${D}${bindir}/
 }
-- 
1.7.3.4



