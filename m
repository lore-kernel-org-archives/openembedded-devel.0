Received: from esa2.mentor.iphmx.com (esa2.mentor.iphmx.com [])
 by mx.groups.io with SMTP id smtpd.web10.3681.1587032985956034524
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Apr 2020 03:29:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: mentor.com, ip: <nil>, mailfrom: haseeb_ashraf@mentor.com)
IronPort-SDR: ozr/SkwFe+CUrF/03mWMj6fDt+OHDEJutyjpuBwFDAmzod8+IdE7HpFp72PtNXYXUtqg2F1eXp
 /SIS4OWmwgE+3Y7SDU81uHkkBXgFadUcDxQtnZeOdGJr3bYhmW9zD7Ups4ZbFTTcirdjPfVTvR
 EoHjVKSDCfhSGWt/kdjuxrmS/bXoFHTdtzV+tcFsTkm1OhFg4ZjUY5tYrUQT1YFcGtpsikosws
 ShnRHDczNnTQJsPP6s4ovTW2HWm1ksYrY5S4k0gwHdumig532gtfFvY6jPoOmP1dSkZq9u/nfo
 2sA=
X-IronPort-AV: E=Sophos;i="5.72,390,1580803200"; 
   d="scan'208";a="47759024"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa2.mentor.iphmx.com with ESMTP; 16 Apr 2020 02:29:49 -0800
IronPort-SDR: 9RIS6o37TX0ALqPg/Mxe6YNOwBPHdCircAW5yVPdA3gl/C0sXyWts1jenh9PLZ/OcFgG/NNoi1
 NkjmLYA5vnirkaino0q2iLHM296auljHKStlwhG1fZKoTsZ0nVcEDur2jjjZemuUlCSNB7crmm
 hldjuGhbBh3JkIThvjfgThop35rYwtfhKc0pq7YDUrTS2vRdkJPAwwtKVsQAv48NcNy/hB91AW
 dF6GbDtLpSQngnzMyZMyTZF2IPBieZnIfVmtIdBCGTlgYphHA2cRS/6kurXz9mfUMKbIwpowHb
 r3g=
From: "Haseeb Ashraf" <haseeb_ashraf@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 2/2] luaposix: add 33.4.0 version recipe which is compatible with lua5.3
Date: Thu, 16 Apr 2020 15:29:23 +0500
Message-ID: <20200416102923.27122-2-Haseeb_Ashraf@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200416102923.27122-1-Haseeb_Ashraf@mentor.com>
References: <20200416102923.27122-1-Haseeb_Ashraf@mentor.com>
MIME-Version: 1.0
Return-Path: Haseeb_Ashraf@mentor.com
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-08.mgc.mentorg.com (139.181.222.8) To
 svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1)
Content-Type: text/plain

Signed-off-by: Haseeb Ashraf <Haseeb_Ashraf@mentor.com>
---
 .../luaposix/luaposix_33.4.0.bb               | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/luaposix/luaposix_33.4.0.bb

diff --git a/meta-oe/recipes-devtools/luaposix/luaposix_33.4.0.bb b/meta-oe/recipes-devtools/luaposix/luaposix_33.4.0.bb
new file mode 100644
index 000000000..869181848
--- /dev/null
+++ b/meta-oe/recipes-devtools/luaposix/luaposix_33.4.0.bb
@@ -0,0 +1,21 @@
+DESCRIPTION = "luaposix is a POSIX binding for Lua."
+LICENSE = "MIT"
+HOMEPAGE = "https://github.com/luaposix/luaposix"
+LIC_FILES_CHKSUM = "file://COPYING;md5=7dd2aad04bb7ca212e69127ba8d58f9f"
+
+SRC_URI[md5sum] = "b36ff049095f28752caeb0b46144516c"
+SRC_URI[sha256sum] = "e66262f5b7fe1c32c65f17a5ef5ffb31c4d1877019b4870a5d373e2ab6526a21"
+
+DEPENDS += "lua-native lua"
+
+SRC_URI = "https://github.com/luaposix/luaposix/archive/release-v${PV}.tar.gz"
+S = "${WORKDIR}/luaposix-release-v${PV}"
+LUA_VDIR = "5.3"
+
+inherit autotools pkgconfig
+
+do_install() {
+    oe_runmake 'DESTDIR=${D}' 'luadir=${datadir}/lua/${LUA_VDIR}' 'luaexecdir=${libdir}/lua/${LUA_VDIR}' install
+}
+
+FILES_${PN} = "${datadir}/lua/${LUA_VDIR} ${libdir}/lua/${LUA_VDIR}"
-- 
2.17.1

