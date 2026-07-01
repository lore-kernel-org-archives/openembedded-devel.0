Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E6FFC43458
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 12:09:01 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43449.1782907738850246815
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Jul 2026 05:08:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=iwWoUtvH;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D2E9F4E40BE9
	for <openembedded-devel@lists.openembedded.org>; Wed,  1 Jul 2026 12:08:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A0CDB60288;
	Wed,  1 Jul 2026 12:08:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BE81A104C9600;
	Wed,  1 Jul 2026 14:08:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782907736; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=ioJBxzTxLDeMsF7Swre0fYEfMHz3TIZgtKOEzCl6QUQ=;
	b=iwWoUtvH1Lroz4WbbQBEOTTgEE3pK1lHcxx4TAfzW3QS28fpLEefneCNwb3/1su2DV7YcN
	G80dupv7jhkglVvNB4je5lI3rZmuXF75UqMVbpdzqGV84gDkuWd7moDyRz3hE/H22q1NOW
	31jl1MIgw+YMc945Ddohhb0cWmhIuuDCZs/g45f9dTEdfvrMMNiz3u11JRbJsu0mHHhp3E
	aOlJtmUmWilg7sAEYKa6U1YpOQNZh/9QLzLLrlXVVc46JwljdjhDvnqsn/aMHnyXDgiY/m
	IsBWWZQH7FMpXAyDlz8/aJbgDK+3Kf1daGVOd4odOQw4vafap63z6yptgOVa7w==
From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
Date: Wed, 01 Jul 2026 14:08:45 +0200
Subject: [scarthgap][meta-networking][PATCH] dnsmasq: fix CVE-2026-2291
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-dnsmasq-cve-2026-2291-v1-1-7fae2dd40e84@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMyw6DIBCF4Vcxs+4kgElvr0JYIIxIG9EyaJsY3
 73YLr+TnH8DphyJ4d5skGmNHKdUIU8NuMGmQBh9NSihzuIiJPrEo+UXupXwGFGpm8TeKd+1rfd
 09VC/c6Y+fn5dbf7mpXuQK0dMs7O5DMHORo9ULCYq7yk/YwoG9v0L7/eMpJUAAAA=
X-Change-ID: 20260701-dnsmasq-cve-2026-2291-fc2db33dde8d
To: openembedded-devel@lists.openembedded.org
Cc: olivier.benjamin@bootlin.com, mathieu.dubois-briand@bootlin.com, 
 pascal.eberhard@se.com, wahid.essid@se.com, 
 "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Jul 2026 12:09:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127993

dnsmasqs extract_name() function can be abused to cause a heap buffer
overflow, allowing an attacker to inject false DNS cache entries, which
could result in DNS lookups to redirect to an attacker-controlled IP
address, or to cause a DoS.

This patch is used by debian bookworm (2.90-4_deb12u2).

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
---
 .../recipes-support/dnsmasq/dnsmasq_2.90.bb        |  1 +
 .../dnsmasq/files/CVE-2026-2291.patch              | 40 ++++++++++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.90.bb b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.90.bb
index 7830c9c81f68..3a7af56c34d7 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.90.bb
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.90.bb
@@ -20,6 +20,7 @@ SRC_URI = "http://www.thekelleys.org.uk/dnsmasq/${@['archive/', ''][float(d.getV
            file://CVE-2026-4892.patch \
            file://CVE-2026-4893.patch \
            file://CVE-2026-5172.patch \
+           file://CVE-2026-2291.patch \
 "
 SRC_URI[sha256sum] = "8f6666b542403b5ee7ccce66ea73a4a51cf19dd49392aaccd37231a2c51b303b"
 
diff --git a/meta-networking/recipes-support/dnsmasq/files/CVE-2026-2291.patch b/meta-networking/recipes-support/dnsmasq/files/CVE-2026-2291.patch
new file mode 100644
index 000000000000..78545159d0c7
--- /dev/null
+++ b/meta-networking/recipes-support/dnsmasq/files/CVE-2026-2291.patch
@@ -0,0 +1,40 @@
+From c3059821cd52b423592aeffef7935fdf81035a81 Mon Sep 17 00:00:00 2001
+From: Simon Kelley <simon@thekelleys.org.uk>
+Date: Fri, 10 Apr 2026 16:29:31 +0100
+Subject: [PATCH] Fix buffer overflow in struct bigname. CVE-2026-2291
+
+All buffers capable of holding a domain name should be
+at least MAXDNAME*2 + 1 bytes long, where MAXDNAME is the maximum
+size of a domain name. The accounts for the trailing zero and the
+fact that some characters are escaped in the internal representation
+of a domain name in dnsmasq.
+
+The declaration of struct bigname get this wrong, with the effect
+that a remote attacker capable of asking DNS queries or answering DNS
+queries can cause a large OOB write in the heap.
+
+This was first spotted by Andrew S. Fasano.
+
+CVE: CVE-2026-2291
+Upstream-Status: Backport [https://sources.debian.org/src/dnsmasq/2.90-4~deb12u2/debian/patches/CVE-2026-2291.patch]
+
+Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
+---
+ src/dnsmasq.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/dnsmasq.h b/src/dnsmasq.h
+index e455c3f7..be8cf2ad 100644
+--- a/src/dnsmasq.h
++++ b/src/dnsmasq.h
+@@ -467,7 +467,7 @@ struct interface_name {
+ };
+
+ union bigname {
+-  char name[MAXDNAME];
++  char name[(2*MAXDNAME) + 1];
+   union bigname *next; /* freelist */
+ };
+
+--
+2.43.0

---
base-commit: b0c2c648a1af89e7a8dd4c2ec841f3bc0ed0ccb9
change-id: 20260701-dnsmasq-cve-2026-2291-fc2db33dde8d

Best regards,
--  
Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>


