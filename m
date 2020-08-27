Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.15157.1598520603428297228
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Aug 2020 02:30:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=58710 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kBEEM-0005Nx-2n; Thu, 27 Aug 2020 12:30:02 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-twitter: Upgrade 3.8.0 -> 3.9.0
Date: Thu, 27 Aug 2020 12:29:51 +0300
Message-Id: <20200827092951.15749-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200827092951.15749-1-leon.anavi@konsulko.com>
References: <20200827092951.15749-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=-0.2
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

Upgrade tweepy to release 3.9.0:

- Add API.create_media_metadata
- Update allowed parameters for API.update_status
- Add allowed parameters to API.get_status
- Add allowed parameters to API.statuses_lookup
- Improve API.lookup_users
- Improve and optimize API.statuses_lookup,
  API.create_media_metadata, API.update_status
- Add reverse as allowed parameter for API.lists_all
- Add count as allowed parameter for API.lists_memberships
- Add count as allowed parameter for API.lists_subscriptions
- Add include_entities as allowed parameter for API.list_timeline
- Add allowed parameters to API.list_subscribers
- Add support for Python 3.8
- Update and improve setup.py
- Use requests socks extra instead of requiring PySocks directly
- Allow uploading of images with file names without extensions
- Support uploading WebP images
- Add missing attributes to Relationship model
- Update max allowed size for uploaded GIFs
- Add _json attribute to DirectMessage model
- Update and improve tests
- Add documentation for extended Tweets
- Document API.lookup_users
- Add documentation for running tests
- Add Korean translation of documentation
- Add Polish translation of documentation
- Document API.lookup_friendships
- Update and improve various documentation
- Fix handling of invalid credentials for API.verify_credentials
- Handle boolean value for API.verify_credentials include_email
  parameter
- Allow Cursor to be used with API.list_direct_messages by adding
  DMCursorIterator

License-Update: Use the exact line from PKG-INFO.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-twitter_3.8.0.bb => python3-twitter_3.9.0.bb}  | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-twitter_3.8.0.bb => python3-twitter_3.9.0.bb} (53%)

diff --git a/meta-python/recipes-devtools/python/python3-twitter_3.8.0.bb b/meta-python/recipes-devtools/python/python3-twitter_3.9.0.bb
similarity index 53%
rename from meta-python/recipes-devtools/python/python3-twitter_3.8.0.bb
rename to meta-python/recipes-devtools/python/python3-twitter_3.9.0.bb
index 78f66a443..01bbf831a 100644
--- a/meta-python/recipes-devtools/python/python3-twitter_3.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twitter_3.9.0.bb
@@ -2,10 +2,10 @@ SUMMARY = "Twitter for Python"
 DESCRIPTION = "Python module to support twitter API"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=8f702b489acb6863cec8b261a55931d8"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489"
 
-SRC_URI[md5sum] = "8aeff278b7cefcd384c65929bc921e2c"
-SRC_URI[sha256sum] = "8abd828ba51a85a2b5bb7373715d6d3bb32d18ac624e3a4db02e4ef8ab48316b"
+SRC_URI[md5sum] = "b5bc640fa9f6baff6471c127aba1fec0"
+SRC_URI[sha256sum] = "bfd19a5c11f35f7f199c795f99d9cbf8a52eb33f0ecfb6c91ee10b601180f604"
 
 PYPI_PACKAGE = "tweepy"
 
-- 
2.17.1

