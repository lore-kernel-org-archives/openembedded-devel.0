Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OZoSz-0003VG-Cv
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Jul 2010 19:13:07 +0200
Received: by ewy7 with SMTP id 7so839811ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jul 2010 10:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=++qhT7c/8QaVHAhdpcBE2z6MB6Ai/X+GuMc0Wh1cGFM=;
	b=p32vx13yDvz85ltUDzJUgQfSWrjoWQRai/bR4+hr0yULUTbCNLkx6lFIiNOeH5Xkg6
	sYmyM01gxwAOAlhfW3jbmv1Mejiyek1Y3n/OR2D8eXX40HdCPNqT/u0PUqf6xwoc3JHt
	gD11rXXhILcIN3HAL+N10uXni+G4l0TsSMLN0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=irKOQbyoEgA7YQOi1BkuK/ORbOsMPepgIcIdhhQL2B6XAa+GzSHZVpAgCUd8CPvDf3
	YTnZb4IGFioZrQuvjQr5xUPt8VzoUyUrKR2IZrepBBISemZBlETYq9BKuE4j7mtSbXsj
	Q82OKsl7KfJv/9xaFNAJIDaQHDJ5E9LWBjQuE=
Received: by 10.213.31.147 with SMTP id y19mr1320375ebc.81.1279300369744;
	Fri, 16 Jul 2010 10:12:49 -0700 (PDT)
Received: from localhost.localdomain (j200125.upc-j.chello.nl [24.132.200.125])
	by mx.google.com with ESMTPS id z55sm19656640eeh.21.2010.07.16.10.12.49
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 16 Jul 2010 10:12:49 -0700 (PDT)
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Jul 2010 19:12:41 +0200
Message-Id: <1279300361-3838-2-git-send-email-fransmeulenbroeks@gmail.com>
X-Mailer: git-send-email 1.6.4.2
In-Reply-To: <1279300361-3838-1-git-send-email-fransmeulenbroeks@gmail.com>
References: <1279300361-3838-1-git-send-email-fransmeulenbroeks@gmail.com>
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH v2] linux-libc-headers: added COMPATIBLE_TARGET_SYS
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
X-List-Received-Date: Fri, 16 Jul 2010 17:13:07 -0000

added COMPATIBLE_TARGET_SYS = "(?!nios2)" to the inc file
and COMPATIBLE_TARGET_SYS = "" to the only recipe that does
support nios2

Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
---

Modified as suggested by Marcin.

 recipes/linux-libc-headers/linux-libc-headers.inc  |    2 ++
 .../linux-libc-headers_2.6.34.bb                   |    2 ++
 2 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/recipes/linux-libc-headers/linux-libc-headers.inc b/recipes/linux-libc-headers/linux-libc-headers.inc
index 3410f35..6ad6764 100644
--- a/recipes/linux-libc-headers/linux-libc-headers.inc
+++ b/recipes/linux-libc-headers/linux-libc-headers.inc
@@ -8,3 +8,5 @@ RDEPENDS_${PN}-dev = ""
 RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPV})"
 
 inherit kernel-arch
+
+COMPATIBLE_TARGET_SYS = "(?!nios2)"
diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.34.bb b/recipes/linux-libc-headers/linux-libc-headers_2.6.34.bb
index e547399..92f18a0 100644
--- a/recipes/linux-libc-headers/linux-libc-headers_2.6.34.bb
+++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.34.bb
@@ -7,6 +7,8 @@ INHIBIT_DEFAULT_DEPS = "1"
 DEPENDS += "unifdef-native"
 PR = "r1"
 
+COMPATIBLE_TARGET_SYS = ""
+
 SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2 \
 	  "
 
-- 
1.6.4.2



