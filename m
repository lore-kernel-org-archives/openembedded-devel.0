Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3881.1794729049208981958
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:50:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=jBdckzea;
 spf=pass (domain: gmail.com, ip: 74.125.82.171, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so4584971eec.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794729049; x=1795333849; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DTezacW/JULDHRby4cqXsfMJ0yzx5FW9C8qBV6XVyyE=;
        b=jBdckzeatAbZTmMdcCoH8MP5uoUlR4YgusjiM5z+e0V5X1Eu0s1uc6gjrfD1PT4Trj
         NAYhUJrN2enpo+TTlxCQk3Za/SYO2/mC5ysFzDuo5mel8fA0XvlgksEyRSonECVN9snc
         1b5XrgSaqzt4FuRJLth0j1yEM8mUo2D14/6B2D2HYBSpq1CDXfzFhzq2563O1p6FE9JU
         /Z48mZnm9eWdrGfLbLgnbO3NnduJLnFkC3xkSR6liBd5BNwTSxRAibx5B2OOuyRuHWHM
         68n79j/2FkA2CPhgyhvrt78Xon3A+Nx+noBelX5dKpBUdlbTIxEHciF+qSvtAdD8UXCs
         d+PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794729049; x=1795333849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DTezacW/JULDHRby4cqXsfMJ0yzx5FW9C8qBV6XVyyE=;
        b=SwBVDcNICziy8+w88QPUpXAKh2NmVYpQdp33aePomBaBM/dUGE2U/xNFioG7ti4XQ9
         z4p2t2/Gj32lxtdgksWq6/RWbh0z1/sSnRkrXB8AmcL3GbgDY9CThmYF9pN2Y7rwT4qK
         jgywj0oF10IPBl+OG6d/tDHWP0gm1DsAWZ3eyiTmAbvpRByODxHSBTQ3EUYtKoXGifx0
         JedBH6Ktxs5fhj4HHr0vmLw8Wagf6k1UJQ07/ZaZygxpZaZubvXs9CvJKbEUUnU1v6+X
         M+YKo+eMIanEaKjzefYoVLHawE9NX3Dy1R7d05UeHhJYxJCYwuVMCQxS1B/EL8K3dvC3
         Vh6w==
X-Gm-Message-State: APuU4Z8ktmawEpRr3NBah/PQuRoKNy+UmeL6aopqEM8S48EyWlh5c4ib
	E2SUYisbVFbChw4UoDCfe3qvgBv4wPuLIopjCbYPpHO5yCqou1xFV1FPP8F+pZDG
X-Gm-Gg: AYBFou21vQjj7z5w2DGkMTsWle+ebY3eKJs4YvH1KZ9tBgqKYoFjxNlXP1XwpnLnkFd
	rHkZoR4w4y/r1svNMHlGmf6SCP4hiAC32yXQ2sj5jJDR22erWyfsKJMNnHA2g1h5xIxR3tMVCOo
	vXZuBe+mh997pvYzB1D9o6JZ/QzMQaSuQ0vVuR47MF/k2vfazkvNmYzF72XcWGGBlsD0wwuzrcJ
	v9kBCtdW12me8fczcn6gpAtTcAClTut9ELTz6mZkvRat0GhmA0h5xlRMKOxs7yFaBNQ+uiKi0lC
	YFLavhGP5PCv7ggdyX3ko1JMS3hwWcC9GI9og3JzMqvJjQDBH2kGQOvX3ewVLSO9aaUp9nkO2f3
	Yeuo1672rRQUVeJ5GTXey7kMAQYZnYCQW+Apw8e60rB0xLbwgqWjXgFfp8ZFhBbpwQiLKbu6g2R
	oukGwWKVNRNt/NxOAXhLgqxw1YC0xrzE3wrS8h4/S+rmmsjxMx+RfTCjqmGtm3jzi6keZ8F4EwI
	bg7XpXPRCx5cSfgmz0l3MsrH4JNqSXRxUOw9dtrTwwbISEiq54YJcx+AMalo4JDMhJllChJwC+9
	dg+9iB5he5HyaRynF8HdoY2IiekDI2TROI6F0TNVrHIEXKsuXNl3oHoa1SDbGqgMYI4A9aduAW8
	uv5zMMK77h0JD1JusNESknRw2/nGqhM1cRHdoK+nr1h6nBnLe3Iu9akUCVWgA9bLCCeNS79nPbn
	i+tPiC0LJXQIYigdtSuaqnVlOJZLhOnWBTzqrakYmV9A9BlC0C4Q+OfeJx9+nalax64oHdtpl1B
	ekW+p9lo2pMMjzk4+Z9kqvF3YWy96aWLKT3LArKwBHgUHVfgBonQt332yLJfITX2meaz2zNrcyL
	NGHG
X-Received: by 2002:a05:693c:8115:b0:36a:1008:5815 with SMTP id 5a478bee46e88-37963372d85mr7757617eec.5.1794729048469;
        Sat, 14 Nov 2026 23:50:48 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:50:47 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 55/96] libyui, libyui-ncurses: upgrade 4.6.2 -> 4.7.7
Date: Sat, 14 Nov 2026 23:48:33 -0800
Message-ID: <20261115074918.2932593-55-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:50:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132325
Content-Type: text/plain; charset="utf-8"

Drop 0001-NCurses-cast-wchar_t-before-streaming-to-narrow-ostr.patch,
upstream now streams these as std::wstring.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ar_t-before-streaming-to-narrow-ostr.patch | 46 -------------------
 ...urses_4.6.2.bb => libyui-ncurses_4.7.7.bb} |  3 +-
 .../{libyui_4.6.2.bb => libyui_4.7.7.bb}      |  2 +-
 3 files changed, 2 insertions(+), 49 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/libyui/files/0001-NCurses-cast-wchar_t-before-streaming-to-narrow-ostr.patch
 rename meta-oe/recipes-graphics/libyui/{libyui-ncurses_4.6.2.bb => libyui-ncurses_4.7.7.bb} (92%)
 rename meta-oe/recipes-graphics/libyui/{libyui_4.6.2.bb => libyui_4.7.7.bb} (95%)

diff --git a/meta-oe/recipes-graphics/libyui/files/0001-NCurses-cast-wchar_t-before-streaming-to-narrow-ostr.patch b/meta-oe/recipes-graphics/libyui/files/0001-NCurses-cast-wchar_t-before-streaming-to-narrow-ostr.patch
deleted file mode 100644
index 3193147b4b..0000000000
--- a/meta-oe/recipes-graphics/libyui/files/0001-NCurses-cast-wchar_t-before-streaming-to-narrow-ostr.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 25 Jun 2026 00:00:00 +0000
-Subject: [PATCH] NCurses: cast wchar_t before streaming to narrow ostream
-
-GCC 16 / libstdc++ implements the C++20 deletion of
-std::operator<<(std::ostream&, wchar_t). Two debug-output sites stream a
-wchar_t directly into a narrow std::ostream, which is now ill-formed:
-
-  NCtext.cc:348:34: error: use of deleted function
-  'std::basic_ostream<char, _Traits>& std::operator<<(basic_ostream<char,
-  _Traits>&, wchar_t)'
-  NCRichText.cc:521:59: error: use of deleted function ... wchar_t ...
-
-Both values are ASCII characters used purely for debug output, so cast
-them to char to keep the previous behaviour.
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/NCRichText.cc | 2 +-
- src/NCtext.cc     | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
---- a/src/NCtext.cc
-+++ b/src/NCtext.cc
-@@ -345,7 +345,7 @@
-     str << "[label" << obj.size() << ':' << obj[0].str();
-
-     if ( obj.hasHotkey() )
--	str << ':' << obj.hotkey() << " at " << obj.hotpos();
-+	str << ':' << static_cast<char>( obj.hotkey() ) << " at " << obj.hotpos();
-
-     return str  << ']';
- }
---- a/src/NCRichText.cc
-+++ b/src/NCRichText.cc
-@@ -518,7 +518,7 @@
- 			    break;
-
- 			default:
--			    yuiDebug() << "Ignoring " << *wch << std::endl;
-+			    yuiDebug() << "Ignoring " << static_cast<char>( *wch ) << std::endl;
- 		    }
- 		    ++wch;
- 		}
diff --git a/meta-oe/recipes-graphics/libyui/libyui-ncurses_4.6.2.bb b/meta-oe/recipes-graphics/libyui/libyui-ncurses_4.7.7.bb
similarity index 92%
rename from meta-oe/recipes-graphics/libyui/libyui-ncurses_4.6.2.bb
rename to meta-oe/recipes-graphics/libyui/libyui-ncurses_4.7.7.bb
index d2d786c66f..43b5afa2f2 100644
--- a/meta-oe/recipes-graphics/libyui/libyui-ncurses_4.6.2.bb
+++ b/meta-oe/recipes-graphics/libyui/libyui-ncurses_4.7.7.bb
@@ -5,12 +5,11 @@ LIC_FILES_CHKSUM = "file://../COPYING.lgpl-3;md5=e6a600fd5e1d9cbde2d983680233ad0
 "
 
 SRC_URI = "git://github.com/libyui/libyui.git;branch=master;protocol=https;tag=${PV} \
-           file://0001-NCurses-cast-wchar_t-before-streaming-to-narrow-ostr.patch \
           "
 
 SRC_URI:append:class-target = " file://0001-Fix-the-error-of-can-t-find-header-file.patch"
 
-SRCREV = "e691b563262306a40a61bbf228839fa06e4f0516"
+SRCREV = "9149299f60237acc8d360403d317854d484bcde3"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
diff --git a/meta-oe/recipes-graphics/libyui/libyui_4.6.2.bb b/meta-oe/recipes-graphics/libyui/libyui_4.7.7.bb
similarity index 95%
rename from meta-oe/recipes-graphics/libyui/libyui_4.6.2.bb
rename to meta-oe/recipes-graphics/libyui/libyui_4.7.7.bb
index 19b53a3e00..e48755c80a 100644
--- a/meta-oe/recipes-graphics/libyui/libyui_4.6.2.bb
+++ b/meta-oe/recipes-graphics/libyui/libyui_4.7.7.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://github.com/libyui/libyui.git;branch=master;protocol=https;tag=$
            file://0001-Use-relative-install-paths-for-CMake.patch \
            "
 
-SRCREV = "e691b563262306a40a61bbf228839fa06e4f0516"
+SRCREV = "9149299f60237acc8d360403d317854d484bcde3"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
