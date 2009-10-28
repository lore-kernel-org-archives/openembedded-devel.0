Received: from [74.125.78.147] (helo=ey-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <eballetbo@gmail.com>) id 1N344A-0004uJ-IO
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Oct 2009 09:39:41 +0100
Received: by ey-out-1920.google.com with SMTP id 4so123548eyg.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Oct 2009 01:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=rmOmfVEnYC7eqW1v5aW46kzR5dgmz17NYKJID15lCI0=;
	b=lr8Sza313nBh2YTAvMHyAUl+Us4Cu/AwIVRlmXQT7Rcx1hj5CqZ7sG5v2Kl9ouKNJZ
	g9DmRUMa+soTJUjFSsWU4hAtaix7r1Pepk4amCH6Ay3BD/vTxxGvfJIJT8Ln9Ks1yaJY
	9XWhoqHeX6on3b+NMTYrATZchSOfxnOpL1N/A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=EGkZf0HOkw9AqSNCUy8IJCWT5N3YXwzHYEW1/dQbDStPq74eX0ekhbM0GoDZ8gPlc9
	DWkkj/18ANSMbLh6IA+JeOyFl8c2kJHCq9LmIX2pZT2joxyKjux2CozzPz4h7hpuoulL
	hzQIJwBXaMoA5jT805llPiClnTa3fkFBU9LUM=
Received: by 10.211.132.3 with SMTP id j3mr4137111ebn.81.1256719113688;
	Wed, 28 Oct 2009 01:38:33 -0700 (PDT)
Received: from localhost.localdomain (248.Red-213-97-239.staticIP.rima-tde.net
	[213.97.239.248])
	by mx.google.com with ESMTPS id 10sm2203065eyz.19.2009.10.28.01.38.31
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 28 Oct 2009 01:38:32 -0700 (PDT)
From: Enric Balletbo i Serra <eballetbo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Oct 2009 09:38:35 +0100
Message-Id: <1256719119-2413-2-git-send-email-eballetbo@gmail.com>
X-Mailer: git-send-email 1.6.0.4
In-Reply-To: <1256719119-2413-1-git-send-email-eballetbo@gmail.com>
References: <1256719119-2413-1-git-send-email-eballetbo@gmail.com>
X-SA-Exim-Connect-IP: 74.125.78.147
X-SA-Exim-Mail-From: eballetbo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Enric Balletbo i Serra <eballetbo@iseebcn.com>
Subject: [STABLE][PATCH 1/5] u-boot 2009.08
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
X-List-Received-Date: Wed, 28 Oct 2009 08:39:41 -0000

From: Konrad Mattheis <mattheis@ukma.de>

Hi,

I have this patch to get the new Version of u-boot working. Please could you apply this an the repository or tell me how I can do this.

bye
Konrad Mattheis

Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
Signed-off-by: Enric Balletbo i Serra <eballetbo@iseebcn.com>
---
 conf/checksums.ini               |    4 ++++
 recipes/u-boot/u-boot_2009.06.bb |    1 -
 recipes/u-boot/u-boot_2009.08.bb |   16 ++++++++++++++++
 3 files changed, 20 insertions(+), 1 deletions(-)
 create mode 100644 recipes/u-boot/u-boot_2009.08.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index a8c8263..b73f806 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -29298,3 +29298,7 @@ sha256=f57c4e33eb2cdd87a6c2f01bfa4794340fbe61ea1a1cfc7dac3b6671e1dd22af
 md5=5f7b88ebb2bcd7e8044328482d079661
 sha256=f57c4e33eb2cdd87a6c2f01bfa4794340fbe61ea1a1cfc7dac3b6671e1dd22af
 
+[ftp://ftp.denx.de/pub/u-boot/u-boot-2009.08.tar.bz2]
+md5=cd4788ea1c6ac4f9b100b888a1063a6b
+sha256=858fd04efd5b98e99fd1a074998b1a8ac5fbd07b176de1d20d8eb148492d949d
+
diff --git a/recipes/u-boot/u-boot_2009.06.bb b/recipes/u-boot/u-boot_2009.06.bb
index cefbed2..3ea182a 100644
--- a/recipes/u-boot/u-boot_2009.06.bb
+++ b/recipes/u-boot/u-boot_2009.06.bb
@@ -3,7 +3,6 @@ require u-boot.inc
 
 DEFAULT_PREFERENCE = "-1"
 DEFAULT_PREFERENCE_mpc8315e-rdb = "1"
-DEFAULT_PREFERENCE_at91sam9g20ek = "1"
 
 SRC_URI = "ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2 "
 
diff --git a/recipes/u-boot/u-boot_2009.08.bb b/recipes/u-boot/u-boot_2009.08.bb
new file mode 100644
index 0000000..d0e387c
--- /dev/null
+++ b/recipes/u-boot/u-boot_2009.08.bb
@@ -0,0 +1,16 @@
+PR = "r0"
+require u-boot.inc
+
+DEFAULT_PREFERENCE = "-1"
+DEFAULT_PREFERENCE_at91sam9g20ek = "1"
+
+SRC_URI = "ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2 "
+
+TARGET_LDFLAGS = ""
+
+inherit base
+
+do_compile () {
+       oe_runmake ${UBOOT_MACHINE}
+       oe_runmake all
+}
-- 
1.5.4.3



