Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4690E103E30E
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 10:52:46 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18512.1773312758453691684
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Mar 2026 03:52:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qeQLpzt1;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773312762; x=1804848762;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4FxlEsbaosl0R/mARAjjqhjn4hTe1Qx3lLlDhe2OzjA=;
  b=qeQLpzt16qNkHUnk7xfm6O0NSJwH5LMce7AS8mU/YGSpqfLj2RnghALq
   Fgt41A5fBXKNQV1PzduS6ffZhIhQ8FF6jqYsY2yYfBQ2vHUDyS+8Wjrvw
   c8gcEpqd7swvngea8ossEGYIsHlWqqwt7tJB1Adxe1chEAiHqbDKK494c
   30Hiv5a4C10mPS1PDPej//gsJSrBLSeik1cagRK6ERcIultZyZbG/mGX9
   t5geGhlcY11ouHSXvwgDFkBrE6yTqEPXjoabJRAJ0JZPyh+5rKl6jWd5v
   WNqifPivEqgioMhCuoZbIjcii/oFxz6AwyP6FT+oTFve0JTt/4IyZM1h+
   Q==;
X-CSE-ConnectionGUID: WRmlgp1STCq0CIe6wCZ/dQ==
X-CSE-MsgGUID: BuK5+HAmQfWeSS8KiPdjVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="232425537"
X-IronPort-AV: E=Sophos;i="6.23,116,1770562800"; 
   d="scan'208";a="232425537"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 19:52:41 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 4B57C1C166D4
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:52:41 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id EC2CF14042C1
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:52:40 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 1279918029A5;
	Thu, 12 Mar 2026 10:52:37 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 07/64] graphviz: upgrade 14.1.2 -> 14.1.3
Date: Thu, 12 Mar 2026 18:51:23 +0800
Message-ID: <20260312105220.1856-7-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260312105220.1856-1-wangmy@fujitsu.com>
References: <20260312105220.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:52:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125107

From: Wang Mingyu <wangmy@fujitsu.com>

### Changed
--------------
- Using long node names in combination with the fdp layout algorithm no longer
  results in truncated generated names.
- Vertical centering of text within HTML-like table cells has been improved.
- The existing ability to provide a numeric parameter to '-v'
  to specify verbosity level are newly documented in 'dot --help'.

### Fixed
------------
- 'gvmap' no longer dereferences a null pointer when reading position-less
  graphs.
- 'gvmap' no longer crashes when adding coordinate data.
- 'mm2gv' no longer accepts input matrices with non-'real' element type.
  Previously these would be accepted but processed incorrectly leading to
  out-of-bounds memory reads and writes.
- The 'Tcldot_Init', 'Tcldot_builtin_Init', and 'Tcldot_SafeInit' symbols in
  'tcldot.dll' are externally visible on Windows. #2809
- The 'Tclpathplan_Init' and 'Tclpathplan_SafeInit' symbols in 'tclpathplan.dll'
  are externally visible on Windows. #2809
- The Autotools build system more consistently uses '$PYTHON3' instead of
  'python3' when invoking Python. This ensures developers are more easily able
  to control the Python installation in use from the top level.
- The Autotools build system explicitly links against libglu libraries when
  linking against libglut.
- Corrected time formatting in verbose info/debug messages (enabled by -v).
  Previously, minutes was missing, showing HH:SS instead of HH:MM:SS.
- Further parts of the network simplex algorithm have been rewritten in a
  non-recursive style. This allows processing larger graphs that previously
  caused stack overflows. #2782
- Canonicalizing an empty string or a string entirely made up of characters
  needing escaping no longer triggers an out-of-bounds memory write. This was a
  regression in Graphviz 13.0.1. #2743
- An off-by-one error in the network simplex algorithm has been corrected. This
  could have led to suboptimal layout in some edge cases. This was a regression
  in Graphviz 13.0.0.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../graphviz/{graphviz_14.1.2.bb => graphviz_14.1.3.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/graphviz/{graphviz_14.1.2.bb => graphviz_14.1.3.bb} (97%)

diff --git a/meta-oe/recipes-graphics/graphviz/graphviz_14.1.2.bb b/meta-oe/recipes-graphics/graphviz/graphviz_14.1.3.bb
similarity index 97%
rename from meta-oe/recipes-graphics/graphviz/graphviz_14.1.2.bb
rename to meta-oe/recipes-graphics/graphviz/graphviz_14.1.3.bb
index 9a1d9927ce..d885dc43ac 100644
--- a/meta-oe/recipes-graphics/graphviz/graphviz_14.1.2.bb
+++ b/meta-oe/recipes-graphics/graphviz/graphviz_14.1.3.bb
@@ -23,7 +23,7 @@ SRC_URI = "https://gitlab.com/api/v4/projects/4207231/packages/generic/${BPN}-re
 SRC_URI:append:class-nativesdk = "\
            file://graphviz-setup.sh \
 "
-SRC_URI[sha256sum] = "65572cd29317cfb96eac8434fac1d8861c905e9b761bd0442beb2cfcc0211354"
+SRC_URI[sha256sum] = "fe76529477c22c0cf833ec5a35b430cf710f4705afc465d86292bf13560be584"
 
 UPSTREAM_CHECK_URI = "https://graphviz.org/download/"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.43.0


