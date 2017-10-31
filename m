Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 1DCEF71A32
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Oct 2017 15:34:13 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id p1so21216402qtg.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Oct 2017 08:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:organization;
	bh=fAo1VMAFmragSbHWaIaG/Mr/YwaXAmEhR3C9ei5uwVE=;
	b=waA1HjV2PDoKH5egvhRfPVU+LG0VkFm+feRAeYPcN0zuR4liAi0gVFW+VCqwjlQ1oK
	ehW3AkQ9Fy6d5Y87gmgh18NInPC5en0zZKv068+/+Ps/Hp26pfLCeN56ycvxsOuUjmL9
	uH48rd1gOgvYLouFxwEsqqfD877ncUAciOsIr5RWzZEAgJT1oosb/8fnu2ntb7+LuKBW
	lRvSjh0z1tweYUg63F/VUgJ8YIi0LtwldQWhwJRaFHq5E2CE0mTTMWhJF6PgIbU4dkKT
	EhSckKUhOqjrAVRCv0cU7EKyQSBsTA6qlk47/hFPT4LeKVquVe6QRDSt6rDPheGnwNVN
	D0zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=fAo1VMAFmragSbHWaIaG/Mr/YwaXAmEhR3C9ei5uwVE=;
	b=UepgOFvv+nhTtdNpBWBLfKo4z63/k9Eh8Dn710m0J6G4j0ZFWvDoQJ+u1yzG8rVCDJ
	PsD+8CX5PVVk/9Su+GeuFxAIZtrcCg/ud3YUabLNu3NX7FKum9mzn7RmHa60UPNMcUwa
	W2aExj9EAije3b0edyDi+Ua4jQ6laQHd9MHwR599X/6inkQaLrZC/yKReoyfmU25772O
	Ow7I2aPy1OoESltP4GXnoKMTka1EbhdkCnoYzse3z6YkuoBp0uDFWAbutYpQb63SOgLG
	YmAWwYaKwfPEopkxxoPQqsjGgWcQwH3koHOTpd++CRuy9xweLbDCkEBuY4V51bB/ekoa
	EdkA==
X-Gm-Message-State: AMCzsaXdDefB+8/G7uCldXSK4O+1lNU15NiOcFSWTBcOVzj46n2+mbnW
	ob+MMPziwV1F9SglgNr1wWGKcg1x
X-Google-Smtp-Source: ABhQp+SZim2AUEY5mTSORGYjHwhdwqfPVK0wVbl2WvWmQdHzquJECYwa6ElzcqSXM52fexrQxloL0Q==
X-Received: by 10.237.63.17 with SMTP id p17mr3534080qtf.235.1509464054611;
	Tue, 31 Oct 2017 08:34:14 -0700 (PDT)
Received: from centrium.lab.ossystems ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	a26sm1063718qta.50.2017.10.31.08.34.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 31 Oct 2017 08:34:13 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 Oct 2017 13:33:47 -0200
Message-Id: <20171031153347.18989-1-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.14.2
Organization: O.S. Systems Software LTDA.
Subject: [meta-networking][PATCH v2] arptables: Fix do_install task
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 31 Oct 2017 15:34:14 -0000

We need to set DESTDIR variable and run oe_runmake install to install all
arptables files. Without this the only file installed in package is
systemd unit.

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 meta-networking/recipes-support/arptables/arptables_git.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-support/arptables/arptables_git.bb b/meta-networking/recipes-support/arptables/arptables_git.bb
index 274a55d91..99d8de90f 100644
--- a/meta-networking/recipes-support/arptables/arptables_git.bb
+++ b/meta-networking/recipes-support/arptables/arptables_git.bb
@@ -21,12 +21,13 @@ SYSTEMD_SERVICE_${PN} = "arptables.service"
 
 inherit systemd
 
-EXTRA_OEMAKE = "'BINDIR=${sbindir}' 'MANDIR=${mandir}'"
+EXTRA_OEMAKE += "'DESTDIR=${D}' 'BINDIR=${sbindir}' 'MANDIR=${mandir}'"
 
-do_install_append() {
+do_install() {
+    oe_runmake install
     if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
         install -d ${D}${systemd_unitdir}/system
-        install -m 644 ${WORKDIR}/arptables.service ${D}${systemd_unitdir}/system
+        install -m 0755 ${WORKDIR}/arptables.service ${D}${systemd_unitdir}/system
     fi
 }
 
-- 
2.14.2


