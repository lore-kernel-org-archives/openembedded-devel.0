Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <harvey.tim@gmail.com>) id 1PH0nq-0007nu-Cd
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Nov 2010 22:05:03 +0100
Received: by pxi17 with SMTP id 17so690070pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Nov 2010 13:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=ae6GT3NwEqUWTx92Tkige+f+/Oh1/rVjLu6cLXIEmFw=;
	b=rXwfwKcD4/RmtRdsrRDB0G5n+3foWEwR/3ZwQqyA+4qQudIHPJisJFSzANuZ32I0MN
	BK2LRumQfl64NO+woP55ZayRZlv1XorGWhGS9XtTztKPObAayRhT4BBUZ7emQo1ELv1G
	ZMlJBMbgBuOISeWAvd12gQFpJy7jQi1sfKo0Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=Ymhc+OhPAf/S7akW0uRJMR43+NMF//HYwAqn3ztv2P8Yp8vV1YXvCZYY5Ks7Qcf8MP
	nhBUGSOcqPkJuBBTUvLdjXEPNRxZpG3Ggffxr6qdnB90SqGnnXGOAnv/FTsnZTTUOz7M
	J7kXhF9GK+LSWz0nFd4dBBn2q2MVURWIQgn9U=
Received: by 10.142.187.20 with SMTP id k20mr1950470wff.409.1289595835942;
	Fri, 12 Nov 2010 13:03:55 -0800 (PST)
Received: from localhost.localdomain
	(adsl-76-205-222-173.dsl.snlo01.sbcglobal.net [76.205.222.173])
	by mx.google.com with ESMTPS id x35sm4364266wfd.1.2010.11.12.13.03.54
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 12 Nov 2010 13:03:55 -0800 (PST)
From: Tim Harvey <harvey.tim@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Nov 2010 13:03:29 -0800
Message-Id: <1289595809-8087-1-git-send-email-harvey.tim@gmail.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: harvey.tim@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] iftop: new recipe
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
X-List-Received-Date: Fri, 12 Nov 2010 21:05:03 -0000

Signed-off-by: Tim Harvey <harvey.tim@gmail.com>
---
 recipes/iftop/iftop_0.17.bb |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)
 create mode 100644 recipes/iftop/iftop_0.17.bb

diff --git a/recipes/iftop/iftop_0.17.bb b/recipes/iftop/iftop_0.17.bb
new file mode 100644
index 0000000..2cfa441
--- /dev/null
+++ b/recipes/iftop/iftop_0.17.bb
@@ -0,0 +1,11 @@
+DESCRIPTION = "Network usage monitor"
+HOMEPAGE = "http://www.ex-parrot.com/pdw/iftop/"
+SECTION = "console/network"
+LICENSE = "GPLV2"
+DEPENDS = "libpcap ncurses"
+
+SRC_URI = "http://www.ex-parrot.com/pdw/iftop/download/iftop-${PV}.tar.gz"
+SRC_URI[md5sum] = "062bc8fb3856580319857326e0b8752d"
+SRC_URI[sha256sum] = "d032547c708307159ff5fd0df23ebd3cfa7799c31536fa0aea1820318a8e0eac"
+
+inherit autotools
-- 
1.7.0.4



