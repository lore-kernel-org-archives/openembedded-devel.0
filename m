Received: from mail-ee0-f54.google.com ([74.125.83.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1URPEb-0000Cq-0m
	for openembedded-devel@lists.openembedded.org;
	Sun, 14 Apr 2013 17:52:53 +0200
Received: by mail-ee0-f54.google.com with SMTP id e51so1843824eek.27
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Apr 2013 08:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=JHuoaKo8LRzD44otT0Rqpsax3MDJ69x46njkHi5vkS0=;
	b=QN+PgFl3FJmbSHx3qBoGmKowhq6gk5rqoRXZ9YqJz3D2W+rlldtrmjxSs2Ordu7RPG
	3gsV0+0CLDamuf67KRemJxOj9LTwcFs+pnLSznUYt/vPgrz2zEVhImdQ+00GzS8+gvcd
	WN00nYPtWh0IQLX9r2T3jPLUSe2Dhm85A6APJFCW5rGEN8dvYZgVM1k8r0tzI4ICDE+8
	FAM4mQCq44sbqM72xkS4Uh8RzpQbi6uF2UUsTjv6xP6q22lvSOCaxOJjhzCky24FgbvO
	z+6PnZb4Vd8N9LOG+OycAtUSJ6zNIa+qgz5KRuToI8Sh/xtES0g69QR8pRY+ab+WjB+g
	+r+g==
X-Received: by 10.15.43.73 with SMTP id w49mr52354768eev.12.1365953725793;
	Sun, 14 Apr 2013 08:35:25 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id x42sm2792115eee.0.2013.04.14.08.35.25
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 14 Apr 2013 08:35:25 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 14 Apr 2013 17:35:26 +0200
Message-Id: <1365953726-4464-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <1365953726-4464-1-git-send-email-Martin.Jansa@gmail.com>
References: <1365953726-4464-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-systemd][PATCH 2/2] dbus: add bbappend to fix upgrade path
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
X-List-Received-Date: Sun, 14 Apr 2013 15:53:02 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-systemd/oe-core/recipes-core/dbus/dbus_1.6.8.bbappend | 5 +++++
 1 file changed, 5 insertions(+)
 create mode 100644 meta-systemd/oe-core/recipes-core/dbus/dbus_1.6.8.bbappend

diff --git a/meta-systemd/oe-core/recipes-core/dbus/dbus_1.6.8.bbappend b/meta-systemd/oe-core/recipes-core/dbus/dbus_1.6.8.bbappend
new file mode 100644
index 0000000..e90c555
--- /dev/null
+++ b/meta-systemd/oe-core/recipes-core/dbus/dbus_1.6.8.bbappend
@@ -0,0 +1,5 @@
+PRINC := "${@int(PRINC) + 1}"
+
+RPROVIDES_${PN} += "${PN}-systemd"
+RREPLACES_${PN} += "${PN}-systemd"
+RCONFLICTS_${PN} += "${PN}-systemd"
-- 
1.8.1.5



