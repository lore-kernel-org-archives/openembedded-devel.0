Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.5629.1601033011879769242
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Sep 2020 04:23:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=56930 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kLlp4-0008RR-9V; Fri, 25 Sep 2020 14:23:30 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/4] python3-gevent: Upgrade 20.6.2 -> 20.9.0
Date: Fri, 25 Sep 2020 14:23:20 +0300
Message-Id: <20200925112321.3195-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200925112321.3195-1-leon.anavi@konsulko.com>
References: <20200925112321.3195-1-leon.anavi@konsulko.com>
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

Upgrade to release 20.9.0:

- The embedded libev is now asked to detect the availability of
  clock_gettime and use the realtime and/or monotonic clocks, if
  they are available. On Linux, this can reduce the number of
  system calls libev makes. Originally provided by Josh Snyder.
- On CPython, depend on greenlet >= 0.4.17. This version is binary
  incompatible with earlier releases on CPython 3.7 and later.
- On Python 3.7 and above, the module gevent.contextvars is no
  longer monkey-patched into the standard library. contextvars are
  now both greenlet and asyncio task local.
- The DummyThread objects created automatically by certain
  operations when the standard library threading module is
  monkey-patched now match the naming convention the standard
  library uses ("Dummy-12345"). Previously (since gevent 1.2a2)
  they used "DummyThread-12345".
- Fix compatibility with dnspython 2.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-gevent_20.6.2.bb => python3-gevent_20.9.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-gevent_20.6.2.bb => python3-gevent_20.9.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-gevent_20.6.2.bb b/meta-python/recipes-devtools/python/python3-gevent_20.9.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-gevent_20.6.2.bb
rename to meta-python/recipes-devtools/python/python3-gevent_20.9.0.bb
index dbeb3a60c1..06c45f2ed9 100644
--- a/meta-python/recipes-devtools/python/python3-gevent_20.6.2.bb
+++ b/meta-python/recipes-devtools/python/python3-gevent_20.9.0.bb
@@ -20,8 +20,8 @@ SRC_URI_append = " \
     file://libev-conf.patch;patch=1;pnum=1 \
 "
 
-SRC_URI[md5sum] = "27b07fe9fdfff2d75e3d140e890489b1"
-SRC_URI[sha256sum] = "a23c2abf08e851c988723f6a2996d495f513a2c0dc70f9956af03af8debdb5d1"
+SRC_URI[md5sum] = "9366ee7eebed48003f8a748568ef1f70"
+SRC_URI[sha256sum] = "5f6d48051d336561ec08995431ee4d265ac723a64bba99cc58c3eb1a4d4f5c8d"
 
 # The python-gevent has no autoreconf ability
 # and the logic for detecting a cross compile is flawed
-- 
2.17.1

