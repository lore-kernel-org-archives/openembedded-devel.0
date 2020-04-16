Received: from esa2.mentor.iphmx.com (esa2.mentor.iphmx.com [68.232.141.98])
 by mx.groups.io with SMTP id smtpd.web11.11481.1587058071699550674
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Apr 2020 10:27:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: mentor.com, ip: 68.232.141.98, mailfrom: haseeb_ashraf@mentor.com)
IronPort-SDR: JiRhL1/a/oLeLiabPCugYBB9YIXVGG8WwjFGORLPKD8Z8MRdkJeNJtP+7op85wPGmpV23/Bfl/
 7VeDMf8IhtbcYuaLSFZuUY1YE/42zl+OfAYIMQcxksX6eJqq5Q/bv3JEMrMFY9f/QSvuJU80x1
 rBXfezdoPIok/osERlYNmtrawfGQ5KLs+dXaf4c0cNoxLh/2Mtl76N0BVdrUprcX8iE5vF3xwS
 BLZFj4Op7TOPf1PkjBNbwYBRh4J/itgqzUmDCr803CAVjZF6K+tX09IRz4Ss3nNBFSm0ml+d8B
 AbQ=
X-IronPort-AV: E=Sophos;i="5.72,391,1580803200"; 
   d="scan'208";a="47780723"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa2.mentor.iphmx.com with ESMTP; 16 Apr 2020 09:27:50 -0800
IronPort-SDR: GdmZNUPttUTHaqZlhWm4X810Ob5+1eJooEYIqvtk9NEPqE2St9K6NOc78hbOU9l2B4fHqHq8KY
 qIDCSJlwR4MM1T7ItKxQoUBAc95zhbKPrFYJhdPF901QArKhFnkz4ol/jtUyJWT35Ku62htYoD
 w9/IQkEADl2zAr2IZ7NhFwHqDyc/kn2D7v1ARb97Y27weJI4XAKiS75l5sZOCjDk3NvAGxHckO
 1Cc7C5mO4UEAkSS3XUjMyFB+WFzNg22ZCxlybAkhLA0kSvXEe1Vo/X/im4VXAOA7PxnAmsCO/v
 58I=
From: "Haseeb Ashraf" <haseeb_ashraf@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH v2] modify LUA_CPATH_DEFAULT for 64-bit architectures
Date: Thu, 16 Apr 2020 22:27:29 +0500
Message-ID: <20200416172729.21184-1-Haseeb_Ashraf@mentor.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Return-Path: Haseeb_Ashraf@mentor.com
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-02.mgc.mentorg.com (139.181.222.2) To
 svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1)
Content-Type: text/plain

LUA_CPATH_DEFAULT for *.so files should include
LUA_ROOT/lib64/lua/LUA_VDIR not LUA_ROOT/lib/lua/LUA_VDIR

Signed-off-by: Haseeb Ashraf <Haseeb_Ashraf@mentor.com>
---
 meta-oe/recipes-devtools/lua/lua_5.3.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/lua/lua_5.3.5.bb b/meta-oe/recipes-devtools/lua/lua_5.3.5.bb
index ae41e627f..a23a4a5da 100644
--- a/meta-oe/recipes-devtools/lua/lua_5.3.5.bb
+++ b/meta-oe/recipes-devtools/lua/lua_5.3.5.bb
@@ -35,6 +35,7 @@ EXTRA_OEMAKE = "'CC=${CC} -fPIC' 'MYCFLAGS=${CFLAGS} -fPIC' MYLDFLAGS='${LDFLAGS
 
 do_configure_prepend() {
     sed -i -e s:/usr/local:${prefix}:g src/luaconf.h
+    sed -i -e s:lib/lua/:${baselib}/lua/:g src/luaconf.h
 }
 
 do_compile () {
-- 
2.17.1

