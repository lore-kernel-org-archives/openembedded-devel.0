Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <plyatov@gmail.com>) id 1PPYHS-0000PI-6S
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Dec 2010 11:26:50 +0100
Received: by eya28 with SMTP id 28so5756237eya.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Dec 2010 02:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=ABNg/02owd/oQSvbZltBGir613dzKSwQqsU7Y8B58jU=;
	b=QyDN8RV/yhylaRoxwruw7NwuDsChQfsJY5AjhyDpu/Dzor1CoZz3XJlv0BOol7PJQx
	pVC755Jm0kHHU89oB5VrKZFA2NVGjLpJ3155QVOHC3wygUlOvt+brIhX3Rei55GQ73AL
	RI1FJqyf/sGTtmMjIiVbwqHpxk2qbrT+86tcg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=UBjKQxIcPfjVVerwpfUvZfyBS9dw4ik/mxOlIPX3ZttgWD0Rx1XPaRS9fKMVrt+Naf
	RMK1nEO/3WEW72kLQKR1Wz7qxUOyK5p5Cu4mn5lmqfrzTNJMrYhKbBcSVlEdh/3gSSZY
	MTVcJ5cg3eDLbundQSsztOsknzDnWsbyiUqDg=
Received: by 10.213.33.133 with SMTP id h5mr1771015ebd.87.1291631122418;
	Mon, 06 Dec 2010 02:25:22 -0800 (PST)
Received: from localhost.localdomain ([109.165.57.173])
	by mx.google.com with ESMTPS id x54sm4566234eeh.11.2010.12.06.02.25.20
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 06 Dec 2010 02:25:21 -0800 (PST)
From: Igor Plyatov <plyatov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Dec 2010 13:25:07 +0300
Message-Id: <1291631107-4711-1-git-send-email-plyatov@gmail.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 209.85.215.175
X-SA-Exim-Mail-From: plyatov@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.4 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] linux: 2.6.36 recipe update for gms machine.
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
X-List-Received-Date: Mon, 06 Dec 2010 10:26:50 -0000

The gms machine added into the linux-2.6.36 recipe.

Signed-off-by: Igor Plyatov <plyatov@gmail.com>
---
 recipes/linux/linux_2.6.36.bb |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/recipes/linux/linux_2.6.36.bb b/recipes/linux/linux_2.6.36.bb
index 10692b9..a1da17c 100644
--- a/recipes/linux/linux_2.6.36.bb
+++ b/recipes/linux/linux_2.6.36.bb
@@ -1,11 +1,12 @@
 require linux.inc
 
-PR = "r2"
+PR = "r3"
 
 # Mark archs/machines that this kernel supports
 DEFAULT_PREFERENCE = "-1"
 DEFAULT_PREFERENCE_mx31ads = "1"
 DEFAULT_PREFERENCE_ts72xx = "1"
+DEFAULT_PREFERENCE_gms = "1"
 
 SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/${P}.tar.bz2;name=kernel \
            ${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/patch-${PV}.1.bz2;apply=yes;name=stablepatch \
@@ -37,6 +38,11 @@ SRC_URI_append_ts72xx = " \
 	file://0024-ts72xx-add-GPIO-keys.patch \
 	"
 
+SRC_URI_append_gms = " \
+    file://0001-stamp9g20gms.patch \
+    file://0002-Makefile.patch \
+	"
+
 SRC_URI[kernel.md5sum] = "61f3739a73afb6914cb007f37fb09b62"
 SRC_URI[kernel.sha256sum] = "15a076d1a435a6bf8e92834eba4b390b4ec094ce06d47f89d071ca9e5788ce04"
 SRC_URI[stablepatch.md5sum] = "dd38a6caf08df2822f93541ee95aed7d"
-- 
1.7.0.4



