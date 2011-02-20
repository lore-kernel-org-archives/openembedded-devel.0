Received: from mail-bw0-f51.google.com ([209.85.214.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pespin.shar@gmail.com>) id 1PrFfQ-0004dX-8S
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Feb 2011 21:14:04 +0100
Received: by bwz10 with SMTP id 10so1377292bwz.10
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Feb 2011 12:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=UNxBooineQH9W5jO3rT19HySy14lBfM2FCSKix+Tm6o=;
	b=fjN5xmFYCdHo/Z5NMzxyg+wZGbNHZjVZuj8B5hmSYpSQIS9rSEh9yCZGrdrTLos9VR
	XIAz26LwAGRYzmN85MUjcAnjEhfQt93RmQ3lyoOUgYfr1Kn+tsScz4dxnTCgSyXPHp2O
	740D+bbcKM+YleujoS89tjrbQpoyQhcsgAQ4w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=d7rW7rwmGeUaMFEQ4LutA3Po4MW1+oJL30ThxU8YL4N5HQ9bkqKoFS7ncml631N/nq
	ZxLdzvQfkO0OkUdu2me2cVL0nGMXrszbadA/U/MeD9AX04goGYU57Z/1XW4cpNQ5T+/y
	ZvduYwlr+KTlSEZ731+n7tMTw0O9PgJ4lhzZI=
Received: by 10.204.59.8 with SMTP id j8mr564242bkh.26.1298232767392;
	Sun, 20 Feb 2011 12:12:47 -0800 (PST)
Received: from localhost.localdomain (171.pool85-50-76.dynamic.orange.es
	[85.50.76.171])
	by mx.google.com with ESMTPS id x38sm3226652bkj.13.2011.02.20.12.12.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 20 Feb 2011 12:12:46 -0800 (PST)
From: Pau Espin Pedrol <pespin.shar@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 20 Feb 2011 21:12:36 +0100
Message-Id: <1298232756-24526-1-git-send-email-pespin.shar@gmail.com>
X-Mailer: git-send-email 1.7.2
Subject: [PATCH] libacpi: SET OE LDFLAGS in recipe
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
X-List-Received-Date: Sun, 20 Feb 2011 20:14:04 -0000

Fixes ld problem related to GNU_HASH
---
 recipes/libacpi/libacpi_0.2.bb |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/recipes/libacpi/libacpi_0.2.bb b/recipes/libacpi/libacpi_0.2.bb
index 458fc30..77d266b 100644
--- a/recipes/libacpi/libacpi_0.2.bb
+++ b/recipes/libacpi/libacpi_0.2.bb
@@ -14,6 +14,8 @@ FILES_${PN}-bin = "${bindir}"
 
 COMPATIBLE_HOST = '(x86_64|i.86.*)-(linux|freebsd.*)'
 
+EXTRA_OEMAKE = "LDFLAGS='${LDFLAGS}'"
+
 do_install() {
 	oe_runmake install DESTDIR=${D} PREFIX=${exec_prefix}
 }
-- 
1.7.2



