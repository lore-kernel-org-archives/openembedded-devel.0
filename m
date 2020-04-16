Received: from esa2.mentor.iphmx.com (esa2.mentor.iphmx.com [68.232.141.98])
 by mx.groups.io with SMTP id smtpd.web10.3681.1587032985956034524
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Apr 2020 03:29:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: mentor.com, ip: 68.232.141.98, mailfrom: haseeb_ashraf@mentor.com)
IronPort-SDR: eDnvdWzDbXt28Ze4/gF8STEHxELpQA/CPRHf9bkEobV+29ANvKIfawarxW1JlqL3HHR7hscXEF
 T4tv0yejIsf2BGzZbt94UY0RP9jqLAgy41jR/EZLPpXiNVkE7EXnzQbgda5llWtVwIpcqmg/VH
 MaW1bDe+kOicHnmt/SBngK/dnJpGgrhEffVDJLHa+QWesvb06rfx7tt81q88pLFd/DrkSz0XcP
 5zaV7uCn9uuayFlILboAQVsurlxETKO6PNOWlUuzZEe/AS16Du5l9JvWuSDJwut4taUAoGgiVe
 bCo=
X-IronPort-AV: E=Sophos;i="5.72,390,1580803200"; 
   d="scan'208";a="47759022"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa2.mentor.iphmx.com with ESMTP; 16 Apr 2020 02:29:45 -0800
IronPort-SDR: hF9PbGB+PFgJNoI6jYhAtvZTizPqEO1FDqEie774GpvdiF1amOkkFfjTmSRkn0Vhbk/LIsns/J
 Tyx1aeyuV/A2i3AGGeWDKX/4BB8fkeiKJcnzPqk3sgXubdVj5WgsZE0+wF5AdT0V4xMAUeUiO/
 +yi2Rl1w49bMfXQqiUbFOkQJwkIWLv086rJ8YLW3ptZa12LeQ+4PHbwReJbwsnmyQ2gmmZu5s8
 8HCtmoJPsyQXlelAB6WZkDANNDdVqMCV/B7DBIQRJCH6rtsLl0h60pz6VENfYuQ2toBUwvA9dl
 u2g=
From: haseeb_ashraf@mentor.com
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 1/2] modify LUA_CPATH_DEFAULT for 64-bit architectures
Date: Thu, 16 Apr 2020 15:29:22 +0500
Message-ID: <20200416102923.27122-1-Haseeb_Ashraf@mentor.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Return-Path: Haseeb_Ashraf@mentor.com
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-08.mgc.mentorg.com (139.181.222.8) To
 svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1)
Content-Type: text/plain

LUA_CPATH_DEFAULT for *.so files should include
LUA_ROOT/lib64/lua/LUA_VDIR not LUA_ROOT/lib/lua/LUA_VDIR

Signed-off-by: Haseeb Ashraf <Haseeb_Ashraf@mentor.com>
---
 meta-oe/recipes-devtools/lua/lua_5.3.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/lua/lua_5.3.4.bb b/meta-oe/recipes-devtools/lua/lua_5.3.4.bb
index 8f4e8fe68..1f077e501 100644
--- a/meta-oe/recipes-devtools/lua/lua_5.3.4.bb
+++ b/meta-oe/recipes-devtools/lua/lua_5.3.4.bb
@@ -28,6 +28,7 @@ EXTRA_OEMAKE = "'CC=${CC} -fPIC' 'MYCFLAGS=${CFLAGS} -DLUA_USE_LINUX -fPIC' MYLD
 
 do_configure_prepend() {
     sed -i -e s:/usr/local:${prefix}:g src/luaconf.h
+    sed -i -e s:lib/lua/:${baselib}/lua/:g src/luaconf.h
 }
 
 do_compile () {
-- 
2.17.1

