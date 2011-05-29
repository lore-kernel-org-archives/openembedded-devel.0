Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QQo1p-00039A-OK
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 May 2011 00:00:09 +0200
Received: by mail-fx0-f47.google.com with SMTP id 19so2550305fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 May 2011 14:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references;
	bh=BCHWVAoDezEojEgVsojiHwVVC2TfnKw03WNJx4bs7Pg=;
	b=iUHJDTozYc3pKV9tFDYYfuO0LNVPXL+LSbUtXwoFu1GKrA1hSeyYT3IvMaebkYs9WT
	b8/YWvg6G7EfxhUnvaiG/52sazLbFm9q8SbriZ66rBdkP1Cy7I3OAGl3C5OUvXPxv11C
	TI0836Y24jbS0dNzGfFziz9QCw5jr+NyhmG1k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=BAZKfStyc8+FS89ZfVzdWz5M+4Wap2dxG6TKxeJpfqTe2QDP+J66vwc0Ibcg5Ndreb
	X26fDL54bPyIoXkVN0OnvmCFUMpKIy+ddfpjhJmR8KmZ1vSNfZhddtNq3p243THmxgi/
	HtR0AqUe/DUKlqQXIm5rFqr7wdSyg8TpznZ4Q=
Received: by 10.223.21.215 with SMTP id k23mr4814306fab.88.1306706224579;
	Sun, 29 May 2011 14:57:04 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id o23sm527589faa.9.2011.05.29.14.57.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 May 2011 14:57:04 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 29 May 2011 23:56:30 +0200
Message-Id: <8d32b449c98731949d8929907dac9b79361a7a0d.1306706130.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc3
In-Reply-To: <355a220b55867ef7a2fd485fbc1fcb76c06ef5d1.1306706130.git.Martin.Jansa@gmail.com>
References: <355a220b55867ef7a2fd485fbc1fcb76c06ef5d1.1306706130.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1306706130.git.Martin.Jansa@gmail.com>
References: <cover.1306706130.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 05/14] mbuffer: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
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
X-List-Received-Date: Sun, 29 May 2011 22:00:10 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-support/mbuffer/mbuffer_20091227.bb    |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/mbuffer/mbuffer_20091227.bb

diff --git a/meta-oe/recipes-support/mbuffer/mbuffer_20091227.bb b/meta-oe/recipes-support/mbuffer/mbuffer_20091227.bb
new file mode 100644
index 0000000..5dda2fb
--- /dev/null
+++ b/meta-oe/recipes-support/mbuffer/mbuffer_20091227.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "mbuffer is a tool for buffering data streams with a large set of unique features."
+HOMEPAGE = "http://www.maier-komor.de/mbuffer.html"
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d32239bcb673463ab874e80d47fae504"
+SECTION = "console/network"
+PR = "r1"
+
+SRC_URI = "http://www.maier-komor.de/software/mbuffer/mbuffer-20091227.tgz"
+SRC_URI[md5sum] = "191663396b4b1752d7104803631b9e54"
+SRC_URI[sha256sum] = "e708b66f6cec9ba090877e8eb38e5627ac69aea9ebd9bca1360a29c7398a88ce"
+
+inherit autotools
+
+do_configure() {
+	gnu-configize
+	oe_runconf
+}
+
-- 
1.7.5.rc3



