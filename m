Return-Path: <prvs=156d039a9=alistair.francis@wdc.com>
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	by mail.openembedded.org (Postfix) with ESMTP id 2E9F87FD96
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Sep 2019 22:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1568760126; x=1600296126;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=HX29FAzhokoYCmPUFbW324HGqiK75OO8ZruhaAWz13w=;
	b=qizfO1Novhlj7oDYUn2ucbHOzsMf7vTUZkMb1rKx6c/cRJLWlEWN2aRN
	8xR5GWLFydh6aoFqDdegkmVQGaoz6aYfZksmBij1aRfonyk6jfMATmGcp
	MeE9+bsrZWaa5q+26f0IfZQ7W5402HCt9mX9MbOmAv6EMTGBYhXa0rj7S
	hV2ZOn2NkN8p6GP3crM8OyB/mcFA+z6NzwoeCPQKp8DDHYOuTyM27OObi
	xdFBRI92SGk+LzgX1BLpwqxk19aixL50otp8c07en5sfRVtbMSO3Q1A2e
	tRR/9a6rnTdw3ArK11+VzQofxUn3kDQSwDcoLC1C2Z3A0TJNi+8kiItSb A==;
IronPort-SDR: +gLz9ib0U+Nxx5+313ckkuqzP/x18mn//gjTunqaLHJx2wtYypjO79Xng4WYe2qesMPgFr80uF
	CoVsG+hMh2wP1joAN4gtGevGvMEfjarS4NEiQqPMbOrWmCd8/Fs8dtGul8vtivsSr+Rr0vh8U8
	/ms8dDRQdQZpjryVotcOyQ15Dx0d3vOm24Hfezm1tDOmJ7OKiH+6xfv+STONA4aG59wF9Ie+Zw
	hgXrPNIMEcq/drYFTzA7l5XjkB8uRtdjTwycp7sE7+XWzN4mlK4TWCtaqBv7FFEwFwtg1yhHkf
	STg=
X-IronPort-AV: E=Sophos;i="5.64,518,1559491200"; d="scan'208";a="120052161"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 18 Sep 2019 06:42:04 +0800
IronPort-SDR: Nw3CrXnN91dsY3itMNJItvxyTqJedbB2uMzAZ6i/f5O448q9x8PDLgcz8LBIIYTiw2t1vdgIp7
	R2tFNJLVddHjpm7BFoTGwXZlSRM8xwp18nHw4/LKVEpXXCDm+Kit7gC0EJ/Ttdhm55/o5JS9gg
	oBb5+RzP18AUTnGlsPaQ8Vx+YtEwEN5/AExd2BUW8QINvBVlfM6j0jlXhSejLe9dryfKJr3isi
	UfgSHNlQCFz+1BEPQE31deCMq6Y+mY8O5YIwHfgTquJvA2ermGtFL35UtKhzGLhjKUEmBQBCP4
	hvitkPg6SgfKKxM4TOmNP0XK
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	17 Sep 2019 15:38:40 -0700
IronPort-SDR: a21tYgW/utH/ia+nuRdLKiTzLhlHm/s2bzHtPKyVxL7YbDdpqXGYLxjpqBe8jsQAW6a/3f35Yu
	ZZGUhmT9YGyFKgWC9JHaRBr9L7layU6EMbrcUJuFDL/HCNn3OLW4k0r+KAJVUSjdDJ+YqSpSHe
	nsZKcrPaM14VuFNKnLIasByQR+4SPQoQSK0GK5tJpx/EeYvcoS59swGu6IWfejag2HiSCfUs61
	8+xifroOUsPZNNdnlmJfy8evLSxFrNu7m8lmuCiVRUxHXisMOybpaSENAE18LDYk4YHFHCxtx5
	Gx0=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.157.58])
	by uls-op-cesaip01.wdc.com with ESMTP; 17 Sep 2019 15:42:05 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Sep 2019 15:37:56 -0700
Message-Id: <20190917223757.19701-5-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190917223757.19701-1-alistair.francis@wdc.com>
References: <20190917223757.19701-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Subject: [PATCH 5/6] python3-pulsectl: Initial version of 18.12.5
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
X-List-Received-Date: Tue, 17 Sep 2019 22:42:04 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 .../python/python3-pulsectl_18.12.5.bb                | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pulsectl_18.12.5.bb

diff --git a/meta-python/recipes-devtools/python/python3-pulsectl_18.12.5.bb b/meta-python/recipes-devtools/python/python3-pulsectl_18.12.5.bb
new file mode 100644
index 000000000..9882ea6a8
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pulsectl_18.12.5.bb
@@ -0,0 +1,11 @@
+SUMMARY = "Python (3.x and 2.x) high-level interface and ctypes-based bindings for PulseAudio (libpulse), mostly focused on mixer-like controls and introspection-related operations (as opposed to e.g. submitting sound samples to play, player-like client)."
+HOMEPAGE = "https://github.com/mk-fg/python-pulse-control"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f1d10048469ff90123263eb5e214061d"
+
+SRC_URI[md5sum] = "8e79ef002856c1858058ca0b08bf1a01"
+SRC_URI[sha256sum] = "41db4dd19e7cd28e2609baf2b551f34991f1890024be119b6075a286abfb65d3"
+
+RDEPENDS_${PN} += "pulseaudio"
+
+inherit pypi setuptools3
-- 
2.23.0


