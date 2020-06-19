Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.3196.1592560034445466088
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Jun 2020 02:47:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=53780 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jmDqg-0001eB-96; Fri, 19 Jun 2020 13:02:23 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-msgpack: Upgrade 0.6.2 -> 1.0.0
Date: Fri, 19 Jun 2020 12:46:38 +0300
Message-Id: <20200619094638.7116-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200619094638.7116-1-leon.anavi@konsulko.com>
References: <20200619094638.7116-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.0.0:

- Remove Python 2 support from the msgpack/_cmsgpack.
  msgpack/fallback still supports Python 2.
- Remove encoding option from the Packer and Unpacker.
- Unpacker: The default value of max_buffer_type is changed to
  100MiB.
- Unpacker: strict_map_key is True by default now.
- Unpacker: String map keys are interned.
- Drop old buffer protocol support.
- Support Timestamp type.
- Support serializing and decerializing datetime object with
  tzinfo.
- Unpacker: Fix Unpacker.read_bytes() in fallback implementation.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-msgpack_0.6.2.bb => python3-msgpack_1.0.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-msgpack_0.6.2.bb => python3-msgpack_1.0.0.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-msgpack_0.6.2.bb b/meta-python/recipes-devtools/python/python3-msgpack_1.0.0.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-msgpack_0.6.2.bb
rename to meta-python/recipes-devtools/python/python3-msgpack_1.0.0.bb
index 6d7e7a0dc..d744738a2 100644
--- a/meta-python/recipes-devtools/python/python3-msgpack_0.6.2.bb
+++ b/meta-python/recipes-devtools/python/python3-msgpack_1.0.0.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=cd9523181d9d4fbf7ffca52eaa2a5751"
 PYPI_PACKAGE = "msgpack"
 inherit pypi setuptools3 ptest
 
-SRC_URI[md5sum] = "ba46fdee995565f40e332bd7eea882f1"
-SRC_URI[sha256sum] = "ea3c2f859346fcd55fc46e96885301d9c2f7a36d453f5d8f2967840efa1e1830"
+SRC_URI[md5sum] = "c35ee8f991dad3969884e9585e56ebba"
+SRC_URI[sha256sum] = "9534d5cc480d4aff720233411a1f765be90885750b07df772380b34c10ecb5c0"
 
 RDEPENDS_${PN}_class-target += "\
     ${PYTHON_PN}-io \
-- 
2.17.1

