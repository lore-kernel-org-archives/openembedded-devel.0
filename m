Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.6327.1611829760938185423
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Jan 2021 02:29:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=43042 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1l54Y4-00080R-9W; Thu, 28 Jan 2021 12:29:17 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-gevent: Upgrade 20.9.0 -> 21.1.2
Date: Thu, 28 Jan 2021 12:28:59 +0200
Message-Id: <20210128102903.11760-1-leon.anavi@konsulko.com>
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

- Update the embedded libev from 4.31 to 4.33.
- Update the embedded libuv from 1.38.0 to 1.40.0.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-gevent_20.9.0.bb => python3-gevent_21.1.2.bb}     | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-gevent_20.9.0.bb => python3-gevent_21.1.2.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-gevent_20.9.0.bb b/meta-python/recipes-devtools/python/python3-gevent_21.1.2.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-gevent_20.9.0.bb
rename to meta-python/recipes-devtools/python/python3-gevent_21.1.2.bb
index 06c45f2ed..5edd96b34 100644
--- a/meta-python/recipes-devtools/python/python3-gevent_20.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-gevent_21.1.2.bb
@@ -20,8 +20,7 @@ SRC_URI_append = " \
     file://libev-conf.patch;patch=1;pnum=1 \
 "
 
-SRC_URI[md5sum] = "9366ee7eebed48003f8a748568ef1f70"
-SRC_URI[sha256sum] = "5f6d48051d336561ec08995431ee4d265ac723a64bba99cc58c3eb1a4d4f5c8d"
+SRC_URI[sha256sum] = "520cc2a029a9eef436e4e56b007af7859315cafa21937d43c1d5269f12f2c981"
 
 # The python-gevent has no autoreconf ability
 # and the logic for detecting a cross compile is flawed
-- 
2.17.1

