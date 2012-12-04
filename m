Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tfi2q-00023S-9k
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 03:15:36 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so1377522eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2012 18:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=hOKZQra3MTtJ8+OACB7kcsDg8dpOgvvoXWqSoWO85ws=;
	b=hChCK+gs7t0lwK4OkPOmlG2Cxq3RnXcQmQhVCgg/fUgNvwAkjOhPpsxMrKwG3qwhaq
	ZQOomGjE4r/L5GCV6DMuVkbEyUqlst7A1x771q/lWlPz2MsHuOvjcK1n70mVIkS8zePN
	KT+oYpHZmU9WIYWT8zgHSo8cK9dfSg74h89cnO8tNu9AzJcygEL3od6Q6wcmIwilxf5P
	nIdh6JMIvIRb3KiCsqIHNfVbRYS52bp8p3bKPCWDwPstuZaLcqhqPSbORgoU2E8TRJD7
	CvgjL2lJ5+iHZc/oc+y2GWNvSW/+hNiPMbfkT0tyf/8GWYHinV4CVIGxYgS4GsM2kxjZ
	L6iw==
Received: by 10.14.221.9 with SMTP id q9mr43196651eep.3.1354586476707;
	Mon, 03 Dec 2012 18:01:16 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id d3sm8828932eeo.13.2012.12.03.18.01.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 18:01:16 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Dec 2012 02:58:45 +0100
Message-Id: <ed4a4ecb9ef85de5f22b986d4a666e74994ce410.1354586187.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
Subject: [PATCH 12/58] gcalctool: add SRC_URI checksums
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
X-List-Received-Date: Tue, 04 Dec 2012 02:15:37 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/gcalctool/gcalctool_5.8.17.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-gnome/recipes-gnome/gcalctool/gcalctool_5.8.17.bb b/meta-gnome/recipes-gnome/gcalctool/gcalctool_5.8.17.bb
index 981a073..61b28e4 100644
--- a/meta-gnome/recipes-gnome/gcalctool/gcalctool_5.8.17.bb
+++ b/meta-gnome/recipes-gnome/gcalctool/gcalctool_5.8.17.bb
@@ -7,6 +7,9 @@ PR = "r0"
 SRC_URI = "http://download.gnome.org/sources/${PN}/5.8/${PN}-${PV}.tar.gz \
 	file://fix-includedir.patch"
 
+SRC_URI[md5sum] = "dd9d4f326d7d925a5ad9fbb1c5b32142"
+SRC_URI[sha256sum] = "8806e7696eeee62f2df21135fc488ba99f7d55dfd2a40bb9615e2edd95391589"
+
 inherit autotools pkgconfig
 
 EXTRA_OECONF = "--disable-gnome"
-- 
1.8.0



