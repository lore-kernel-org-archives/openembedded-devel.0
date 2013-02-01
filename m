Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U1FZe-0006IZ-Td
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Feb 2013 13:18:50 +0100
Received: from mail-we0-f200.google.com ([74.125.82.200])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 01 Feb 2013 04:02:42 -0800
Received: by mail-we0-f200.google.com with SMTP id d7so4440529wer.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Feb 2013 04:02:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=hs8fLk1Hjo6fBogf7qTkmCLqjxn2ous2zssVgGpYOnE=;
	b=avRESvIu7qP57ql9kaN4W4KHu8PO8bQ6D2qLtADr4Y9pm4JFc8edeB7gitH23AlKnr
	7KIZ6IoRJdh83B7uOXRT6AcOHWkk4zGB42CrnPah6mikyi4oo197JUYoZFMbphSanffe
	wR8ItmcR1tZpXrShpr972V4Cvf6pUsSYP00XV1Vw2TrXOM7e5AeQn1r2HkWm53Ayqwzz
	Iu94VxD5J07f0c6nZjxwC6MWkr2t00bU8n0Uo/gMFLDK0QsdY8eUYzslrfO9PF1HD75k
	PqrmsmvnlBdRLMewSO8iY030B10MKFntuL40W9bErxUdrSZoqq8F+XjNDMBNKxVbHOTR
	HLXQ==
X-Received: by 10.180.93.100 with SMTP id ct4mr2019075wib.32.1359720160038;
	Fri, 01 Feb 2013 04:02:40 -0800 (PST)
X-Received: by 10.180.93.100 with SMTP id ct4mr2019053wib.32.1359720159841;
	Fri, 01 Feb 2013 04:02:39 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id bw9sm2811709wib.5.2013.02.01.04.02.38
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 01 Feb 2013 04:02:38 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Feb 2013 12:00:34 +0000
Message-Id: <1359720034-16649-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQmEz2PHg0zzgWCBKsQ9mlxgZQSRmgvru7OdWlUaWHT3TfORdtCOg9VIVjOGcxoGbVjGRqPBLRqBQ2TvOF80q2vk6J7xd/CdNyqK1tqEjHTfNQcodIz5Y52nmYaRSWmWC2Y5OJYQmNtd9Ohw4ByMuKCvJK8GAjN5mSAoGUR+LBhBZ1dOo+s3Xp5pH5k6BKyhDEr+kvUv
Subject: [PATCH] midori: remove libsexy dependency
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
X-List-Received-Date: Fri, 01 Feb 2013 12:18:52 -0000

The use of libsexy was removed in Midori 0.0.19 back in 2008.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-gnome/recipes-connectivity/midori/midori_0.4.7.bb |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-connectivity/midori/midori_0.4.7.bb b/meta-gnome/recipes-connectivity/midori/midori_0.4.7.bb
index 5b1a959..75249a2 100644
--- a/meta-gnome/recipes-connectivity/midori/midori_0.4.7.bb
+++ b/meta-gnome/recipes-connectivity/midori/midori_0.4.7.bb
@@ -2,7 +2,9 @@ DESCRIPTION = "Midori is a lightweight web browser."
 HOMEPAGE = "http://www.twotoasts.de/index.php?/pages/midori_summary.html"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
-DEPENDS = "webkit-gtk libsoup-2.4 libsexy openssl python-native python-docutils-native librsvg-native libnotify"
+DEPENDS = "webkit-gtk libsoup-2.4 openssl python-native python-docutils-native librsvg-native libnotify"
+
+PR = "r1"
 
 SRC_URI = "http://archive.xfce.org/src/apps/midori/0.4/midori-${PV}.tar.bz2;name=midori \
           "
-- 
1.7.10.4



