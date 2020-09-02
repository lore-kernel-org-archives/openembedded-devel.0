Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.9886.1599059737219336732
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2020 08:15:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=46838 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kDUU1-0004pK-FI; Wed, 02 Sep 2020 18:15:34 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-networking][PATCH 1/3] znc: Upgrade 1.7.5 -> 1.8.1
Date: Wed,  2 Sep 2020 18:15:19 +0300
Message-Id: <20200902151521.16097-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
X-OutGoing-Spam-Status: No, score=-0.5
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.icnhost.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.icnhost.net: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.icnhost.net: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Upgrade to release 1.8.1:

- Bug fix: authenticated users can trigger an application crash
  (with a NULL pointer dereference) if echo-message is not enabled
  and there is no network.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 meta-networking/recipes-irc/znc/{znc_1.7.5.bb => znc_1.8.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-irc/znc/{znc_1.7.5.bb => znc_1.8.1.bb} (94%)

diff --git a/meta-networking/recipes-irc/znc/znc_1.7.5.bb b/meta-networking/recipes-irc/znc/znc_1.8.1.bb
similarity index 94%
rename from meta-networking/recipes-irc/znc/znc_1.7.5.bb
rename to meta-networking/recipes-irc/znc/znc_1.8.1.bb
index a3d4b7cc5..c54e617fd 100644
--- a/meta-networking/recipes-irc/znc/znc_1.7.5.bb
+++ b/meta-networking/recipes-irc/znc/znc_1.8.1.bb
@@ -8,7 +8,7 @@ DEPENDS = "openssl zlib icu"
 SRC_URI = "git://github.com/znc/znc.git;name=znc \
            git://github.com/jimloco/Csocket.git;destsuffix=git/third_party/Csocket;name=Csocket \
           "
-SRCREV_znc = "c7f72f8bc800115ac985e7e13eace78031cb1b50"
+SRCREV_znc = "0a3909beaa15e0da499473d6d041e5b75c14e885"
 SRCREV_Csocket = "e8d9e0bb248c521c2c7fa01e1c6a116d929c41b4"
 
 # This constructs a composite revision based on multiple SRCREV's.
-- 
2.17.1

