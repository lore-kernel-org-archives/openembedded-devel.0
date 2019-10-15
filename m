Return-Path: <prvs=184014d2e=alistair.francis@wdc.com>
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	by mail.openembedded.org (Postfix) with ESMTP id 0F4837F46F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2019 22:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1571180345; x=1602716345;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=E8hdTGahktb+l5F+aQfk4Lvr0sPRxhqOS+KoRrtLveE=;
	b=UR9pCF1YasdsDuIQVdUwxOb9GPkL0ZG01YSAHO1o4Zxw6HfWXIlJiAbw
	o4i4c96pXDZPROqtNTBDCgFmPQtU1KZ5KVQTeKHLtrAtHiyFo7UwEc29Z
	KhSZgASw9gKxsF1HWouVNadw177KFKPH2+wW8/9EDbADGWWCRcy3D/fI8
	Tx8GrH7aE8oqoifOeAVa+K+5fob9M30sL6H3yjKQMkzN6r1KA97WgFqHS
	kM3qPPxEsh7u0uotkMnxzW6XgjCU71stDQKoYf9cBdKezahUvwL868Rmm
	CP21Lhelc6We93yrgyySi6hKEhzqsvjUjJS5XS6ndteXugMfEaIXYFS5H A==;
IronPort-SDR: pzMI4gG2/rHnh2N680j9yg7t5m2fEpXceRo7c/Q89knNLz7c6t/FuSW6uQR/bvyZC1H+8nFHXj
	LqB4bufeG/hdl25xWiiMy8bqnupAKl8kx+wOKcH3nqn0fJ2LExXqqyzcnukU+QcDz/xzNifEoz
	nzDXTacjwcBruhGc4iP4K/uaGNUtEwz8H/vA1zNeH3wrMrmXnemNjtozxoI0VgEFg74GazZA5m
	6+ZeSI0yiSZfqd2w1+/GT/AWHuvF5jfNUAQA5XtE/lknp/vatUWU0SH4cvzm2SCMSvYX3t+T/S
	UtQ=
X-IronPort-AV: E=Sophos;i="5.67,301,1566835200"; d="scan'208";a="122194676"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 16 Oct 2019 06:59:04 +0800
IronPort-SDR: 2nIf7H+Nh78Yki/C9rrTviJpwRlzdMd2rmXm6KUOyC2NzXk9IbfhVn7t5uRMhByTuzSQrcvOn3
	ZOQV0+1iYlX29K+eFGKVKM51qiONgRC9+VfO0Tt5UIN9Ml7xhV9nH6G8E+FCjhdp9tawQrW1de
	1u+Ezq0tDkmrn1GN5tyVcDy+LnQ8JFX4yVmunab3DilO70cOEubjaJHO8MH7AP2eaywsA5n23r
	hatugMAklbuopQxIgrFmDvzpkgHYVNzfyK9YzdttHwafJemEHtxS7Vm5M13jcwsVHIDz8AYidu
	h8NU4BnRZqYjSam1ZM4I+mST
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	15 Oct 2019 15:54:52 -0700
IronPort-SDR: pRjbAJ7UPC0WIVRyBLflqjJFq8XgmWw+MvxKEtbvJBkXpX1fkQ/j5vCCV/bTDzs+Fnf6kRgQwz
	T3rJi3+xg6qp6xgy2E2CnkTHs60pJy3NYU2PUz2kpOIBwyOtFQtXw1gjLyi19foyvztVm6Nise
	Jaht5Acr3SQevIa9CIwALI2oqeFiMcJrombApLQWiDLZcObDL0Ff/dxSC8XT0NZuHkmfT7L6yw
	MZO5JLm5tJ9URL7l18dgv2aB1yxB7HxNlmk7FXiPi5cm+orJtqCqWjbBMfmHNKH3ygDvW9U8tP
	RfU=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.157.58])
	by uls-op-cesaip01.wdc.com with ESMTP; 15 Oct 2019 15:59:04 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Oct 2019 15:54:22 -0700
Message-Id: <20191015225422.18179-7-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191015225422.18179-1-alistair.francis@wdc.com>
References: <20191015225422.18179-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Subject: [meta-multimedia][PATCH 7/7] mycroft: Run the files from /var
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
X-List-Received-Date: Tue, 15 Oct 2019 22:59:03 -0000
Content-Transfer-Encoding: 8bit

To avoid errors when running on a read only /lib/ file system copy the
files to /var and run mycroft from there.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 .../recipes-multimedia/mycroft/files/mycroft-setup.service  | 3 ++-
 .../recipes-multimedia/mycroft/files/mycroft.service        | 6 +++---
 .../recipes-multimedia/mycroft/mycroft_19.8.1.bb            | 1 +
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/mycroft/files/mycroft-setup.service b/meta-multimedia/recipes-multimedia/mycroft/files/mycroft-setup.service
index 07598235e..4b4bcdd77 100644
--- a/meta-multimedia/recipes-multimedia/mycroft/files/mycroft-setup.service
+++ b/meta-multimedia/recipes-multimedia/mycroft/files/mycroft-setup.service
@@ -5,7 +5,8 @@ After=systemd-user-sessions.service
 
 [Service]
 Type=oneshot
-ExecStart=@LIBDIR@/mycroft/dev_setup.sh --allow-root
+ExecStart=cp -rf @LIBDIR@/mycroft /var/
+ExecStart=/var/mycroft/dev_setup.sh --allow-root
 
 [Install]
 WantedBy=multi-user.target
diff --git a/meta-multimedia/recipes-multimedia/mycroft/files/mycroft.service b/meta-multimedia/recipes-multimedia/mycroft/files/mycroft.service
index 28729f6b1..c7f477f13 100644
--- a/meta-multimedia/recipes-multimedia/mycroft/files/mycroft.service
+++ b/meta-multimedia/recipes-multimedia/mycroft/files/mycroft.service
@@ -5,10 +5,10 @@ After=mycroft-setup.service
 
 [Service]
 Type=forking
-WorkingDirectory=@LIBDIR@/mycroft
+WorkingDirectory=/var/mycroft
 ExecStartPre=mkdir -p /var/log/mycroft
-ExecStart=@LIBDIR@/mycroft/start-mycroft.sh all
-ExecStop=@LIBDIR@/mycroft/stop-mycroft.sh all
+ExecStart=/var/mycroft/start-mycroft.sh all
+ExecStop=/var/mycroft/stop-mycroft.sh all
 
 [Install]
 WantedBy=multi-user.target
diff --git a/meta-multimedia/recipes-multimedia/mycroft/mycroft_19.8.1.bb b/meta-multimedia/recipes-multimedia/mycroft/mycroft_19.8.1.bb
index 54c06f5b6..d4ac4096b 100644
--- a/meta-multimedia/recipes-multimedia/mycroft/mycroft_19.8.1.bb
+++ b/meta-multimedia/recipes-multimedia/mycroft/mycroft_19.8.1.bb
@@ -24,6 +24,7 @@ inherit systemd
 
 # Mycroft installs itself on the host
 # Just copy the setup files to the rootfs
+# The mycroft-setup service will copy the files to /var/ where we run them from
 do_install() {
     install -d ${D}${libdir}/
     cp -r ${B} ${D}${libdir}/mycroft
-- 
2.23.0


