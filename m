Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11959.1794070351873559189
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Nov 2026 08:52:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Mj6wAY7x;
 spf=pass (domain: konsulko.com, ip: 209.85.221.41, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-492f6b7f70dso961645f8f.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Nov 2026 08:52:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794070350; x=1794675150; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZyjboQHSvTz7kX/kf2NI3g/8pE/ub0UHsiS6LnBW0qU=;
        b=Mj6wAY7x9QbXLXJiI0KL0tXoAQPfU/BTuNugvRZ8auqhX0f2pEwCjuklAiFSproXZn
         XWh+VNY5MW7A6MSSXAK50plPiTqxd4Qzc9YoTxa3dJPLzRwrptjlCKPrh9l23zT2DMCS
         ZEg3RPNw8qj3XMjj0w+WTxqe+L1EEfZ+cMBpc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794070350; x=1794675150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZyjboQHSvTz7kX/kf2NI3g/8pE/ub0UHsiS6LnBW0qU=;
        b=2QJrC3ttPTGDEyYYaWcEBP/oCVywCYnAteV/zFZxKXDgVrJh2rsmzJZ5wPDO9B08hI
         xySR8yyWfOxNGPsnRCWBO1NB5LOFjxm6E58o9f5h11az8h+j85HVD1cav3fEnuDKL1bp
         Hqu2Ww1gRYuzmXieiL+opNOlVpMmAsdZpiKEQekhWSNIE6xRJbznlrN4BFjZwFBT+lJW
         deXnXM9F2zHcBUfXFKfsIn6RAS2GwnQNaBzgBXXtUM7epTzzDKu2G1LgqLoCRzv1VaJG
         1VjzMwEDr6tLVjuwdR1iLyLTzckO6QwYngTMSVMkgvX1BDfWgHDVdGPwto+Fj3zuzL0v
         qWsQ==
X-Gm-Message-State: APuU4Z8yXqWxRlxydkL/PMxOn7NHMgnX/DtQe/zG7zCLfYX1HNc7+vU8
	C/qeVenI9y0/0eETU30RsZ8S6fw0TMnWwfA1+MwTbvGK/8qLS3p/zGxtHIbp2h2dPDKI+sXcj1q
	IOx/X
X-Gm-Gg: AYBFou16w3b0BKHhHpkwWzpVxhdfEUXQRJ02L/qDfKtyfuYoKfDoIZH7cYeSPkzNWxe
	4MzmIeNUVSPC+q8EU5zG4Wml0DItW46gHf+tPNtPlfZYc9Qh6kY2p3S836BC9UE7fwG/g7Ow+Nr
	b5s1jc5k9b7mEvb9XolEJlLglxkpI+EaTayKFIzjQDdd9P31Xq9ZZcrZ3q5u9UUvaJZJbP2D0//
	OCJe3jQ6pW2q5XgXNHc5eol+MHLk+lhIStbv+bQRcIql5VZg04V8XLMT69Jgvn51SfFFqVqI3Rh
	OE0E0MQTzs4a/gcsF+aU+vnqHkOtotwxsvbSiF/PcWaPY4Yr8aQ7HRkPL9VRTGyVkzXdcN19mbt
	X67IkTs3qfqkuPW6OC/+O1ZDoQsBL3ueOaQlU7Dh69ALNCel3uLLsqSldV/lUD7rJGjoUW091XD
	3Jxa1D5Nln1V2FpCQBRdVOot4Fqjcc5u0tidRTO7FsBgy6Axd+sSlOgVMPYPeEzo4yzigMiRG29
	yhVJsOJkMjZyWUwQlOc30QCnVICXnwpAn6UbdPLYbJMYnLRATxQMxg8oTAqzBWhqPdiOsIfEc1o
	2vbvwevs9iKuMk92BgkFByCUjlrzgE1YJk4vScrX0Wrup/t9eAFhrRYjm0C0nf5iaIzy3l4D+lT
	Xv9uIQtXwXV5BYQbG8DwcFzGpyOECq2BhU72yx7wy/G2IDrTPMNaPYQ==
X-Received: by 2002:a05:6000:40de:b0:48e:202:6718 with SMTP id ffacd0b85a97d-4927ec0b304mr11805317f8f.25.1794070350125;
        Sat, 07 Nov 2026 08:52:30 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4948a99b9b0sm4127090f8f.4.2026.11.07.08.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 08:52:29 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH 07/22] graphviz: Upgrade 15.1.1 -> 16.1.0
Date: Sat,  7 Nov 2026 18:52:06 +0200
Message-ID: <20261107165221.122340-7-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261107165221.122340-1-leon.anavi@konsulko.com>
References: <20261107165221.122340-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 07 Nov 2026 16:52:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131992
Content-Type: text/plain; charset="utf-8"

Upgrade to release 16.1.0:

Added

- Graph attribute svgid sets the id property of the <svg> of a
  graph.

Fixed

- An sfdp crash has been fixed. This was a regression in Graphviz
  15.1.1.
- Graphs that induce invalid trapezoids during ortho routing no
  longer cause Graphviz crashes on non-Windows platforms. These
scenarios now exit with failure gracefully.
- edgepaint no longer crashes when passed the illegal option -s.
- cluster no longer crashes when passed single character
  command-line options without arguments (e.g. cluster -C).
- cluster of trivial graphs with no nodes no longer crashes.
- cluster on large chains of nodes no longer references
  out-of-bounds memory. This was a regression in Graphviz 7.1.0.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../graphviz/{graphviz_15.1.1.bb => graphviz_16.1.0.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/graphviz/{graphviz_15.1.1.bb => graphviz_16.1.0.bb} (97%)

diff --git a/meta-oe/recipes-graphics/graphviz/graphviz_15.1.1.bb b/meta-oe/recipes-graphics/graphviz/graphviz_16.1.0.bb
similarity index 97%
rename from meta-oe/recipes-graphics/graphviz/graphviz_15.1.1.bb
rename to meta-oe/recipes-graphics/graphviz/graphviz_16.1.0.bb
index 7ea33b8d8a..99ee0b088a 100644
--- a/meta-oe/recipes-graphics/graphviz/graphviz_15.1.1.bb
+++ b/meta-oe/recipes-graphics/graphviz/graphviz_16.1.0.bb
@@ -23,7 +23,7 @@ SRC_URI = "https://gitlab.com/api/v4/projects/4207231/packages/generic/${BPN}-re
 SRC_URI:append:class-nativesdk = "\
            file://graphviz-setup.sh \
 "
-SRC_URI[sha256sum] = "afc7c28dd43d3639910f58820bdce7d89655aa9ac0a4961ac67ffcf77e6a9ac3"
+SRC_URI[sha256sum] = "0f661718f3e5268dc3bad0fb53ab646605d26db70f4080799aff1dc2f61783c3"
 
 UPSTREAM_CHECK_URI = "https://graphviz.org/download/"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.47.3

