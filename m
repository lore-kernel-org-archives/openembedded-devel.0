Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.56479.1600074270272305927
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Sep 2020 02:04:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=52584 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kHkPS-0007z1-ID; Mon, 14 Sep 2020 12:04:27 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 01/10] python3-hyperframe: Upgrade 5.2.0 -> 6.0.0
Date: Mon, 14 Sep 2020 12:04:10 +0300
Message-Id: <20200914090419.19171-1-leon.anavi@konsulko.com>
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

Upgrade to release 6.0.0:

API Changes (Backward-incompatible):
- Introduce HyperframeError base exception class for all errors
  raised within hyperframe.
- Change exception base class of UnknownFrameError to
  HyperframeError
- Change exception base class of InvalidPaddingError to
  HyperframeError
- Change exception base class of InvalidFrameError to
  HyperframeError
- Invalid frames with wrong stream id (zero vs. non-zero) now
  raise InvalidDataError.
- Invalid SETTINGS frames (non-empty but ACK) now raise
  InvalidDataError.
- Invalid ALTSVC frames with non-bytestring field or origin now
  raise InvalidDataError.

API Changes (Backward-compatible)
- Deprecate total_padding - use pad_length instead.
- Improve repr() output for all frame classes.
- Introduce Frame.explain(data) for quick introspection of raw
  data.

Bugfixes
- Fixed padding parsing for PushPromiseFrame.
- Fixed unchecked frame length for PriorityFrame. It now correctly
  raises InvalidFrameError.
- Fixed promised stream id validation for PushPromiseFrame. It now
  raises InvalidDataError.
- Fixed unchecked frame length for WindowUpdateFrame. It now
  correctly raises InvalidFrameError.
- Fixed window increment value range validation. It now raises
  InvalidDataError.
- Fixed parsing of SettingsFrame with mutual exclusion of ACK flag
  and payload.

Other Changes
- Removed support for Python 2.7, 3.4, 3.5, pypy.
- Added support for Python 3.8.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-hyperframe_5.2.0.bb => python3-hyperframe_6.0.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-connectivity/python-hyperframe/{python3-hyperframe_5.2.0.bb => python3-hyperframe_6.0.0.bb} (61%)

diff --git a/meta-python/recipes-connectivity/python-hyperframe/python3-hyperframe_5.2.0.bb b/meta-python/recipes-connectivity/python-hyperframe/python3-hyperframe_6.0.0.bb
similarity index 61%
rename from meta-python/recipes-connectivity/python-hyperframe/python3-hyperframe_5.2.0.bb
rename to meta-python/recipes-connectivity/python-hyperframe/python3-hyperframe_6.0.0.bb
index e5ef1ff38..4a936b49a 100644
--- a/meta-python/recipes-connectivity/python-hyperframe/python3-hyperframe_5.2.0.bb
+++ b/meta-python/recipes-connectivity/python-hyperframe/python3-hyperframe_6.0.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5bf1c68e73fbaec2b1687b7e71514393"
 
-SRC_URI[md5sum] = "6919183242feb26d8bce3b4cba81defd"
-SRC_URI[sha256sum] = "a9f5c17f2cc3c719b917c4f33ed1c61bd1f8dfac4b1bd23b7c80b3400971b41f"
+SRC_URI[md5sum] = "30136a712e092b1a45ae3cad3ae93131"
+SRC_URI[sha256sum] = "742d2a4bc3152a340a49d59f32e33ec420aa8e7054c1444ef5c7efff255842f1"
 
 inherit pypi setuptools3
-- 
2.17.1

