Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web11.173840.1598189415780450020
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Aug 2020 06:30:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: enedino.org, ip: 13.77.154.182, mailfrom: alejandro@enedino.org)
Received: from ALSAMON-X.corp.microsoft.com (unknown [131.107.159.250])
	by linux.microsoft.com (Postfix) with ESMTPSA id B3E2520B4908
	for <openembedded-devel@lists.openembedded.org>; Sun, 23 Aug 2020 06:30:14 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com B3E2520B4908
From: "Alejandro Hernandez Samaniego" <alejandro@enedino.org>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] weechat: Upgrade to 2.9
Date: Sun, 23 Aug 2020 06:30:07 -0700
Message-Id: <20200823133007.27537-1-alejandro@enedino.org>
X-Mailer: git-send-email 2.17.1

- Add python3 rdepends on PACKAGECONFIG

Signed-off-by: Alejandro Hernandez Samaniego <alejandro@enedino.org>
---
 .../recipes-irc/weechat/{weechat_2.8.bb => weechat_2.9.bb}   | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-irc/weechat/{weechat_2.8.bb => weechat_2.9.bb} (91%)

diff --git a/meta-networking/recipes-irc/weechat/weechat_2.8.bb b/meta-networking/recipes-irc/weechat/weechat_2.9.bb
similarity index 91%
rename from meta-networking/recipes-irc/weechat/weechat_2.8.bb
rename to meta-networking/recipes-irc/weechat/weechat_2.9.bb
index cdfb1a963..512ed0e49 100644
--- a/meta-networking/recipes-irc/weechat/weechat_2.8.bb
+++ b/meta-networking/recipes-irc/weechat/weechat_2.9.bb
@@ -9,13 +9,14 @@ DEPENDS = "openssl zlib icu libgcrypt gnutls curl aspell"
 SRC_URI = "https://weechat.org/files/src/weechat-${PV}.tar.xz \
            file://0001-use-pkg-config-for-gcrypt-instead.patch \
            "
-SRC_URI[sha256sum] = "553ea295edad3b03cf88e6029c21e7bde32ff1cc026d35386ba9da3e56a6018c"
+
+SRC_URI[sha256sum] = "eab406c385c3a10d0107ddc3aac6596ae8c59af99e9158c6d769e90ec9adfa0e"
 
 inherit cmake pkgconfig
 
 PACKAGECONFIG ??= " ncurses python"
 PACKAGECONFIG[ncurses] = "-DENABLE_NCURSES=ON,-DENABLE_NCURSES=OFF,ncurses"
-PACKAGECONFIG[python] = "-DENABLE_PYTHON=ON,-DENABLE_PYTHON=OFF,python3"
+PACKAGECONFIG[python] = "-DENABLE_PYTHON=ON,-DENABLE_PYTHON=OFF,python3,python3"
 
 EXTRA_OECMAKE_append = " -DENABLE_PHP=OFF -DENABLE_TCL=OFF -DENABLE_LUA=OFF -DENABLE_JAVASCRIPT=OFF -DENABLE_RUBY=OFF -DENABLE_GUILE=OFF -DENABLE_PERL=OFF -DENABLE_ASPELL=ON"
 
-- 
2.17.1

