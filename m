Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.10046.1599059744158142558
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2020 08:15:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=46838 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kDUUA-0004pK-0t; Wed, 02 Sep 2020 18:15:43 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-networking][PATCH 3/3] fping: Upgrade 4.4 -> 5.0
Date: Wed,  2 Sep 2020 18:15:21 +0300
Message-Id: <20200902151521.16097-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200902151521.16097-1-leon.anavi@konsulko.com>
References: <20200902151521.16097-1-leon.anavi@konsulko.com>
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

Upgrade to release 5.0:

- In non-quiet loop and count mode, a line is printed for every
  lost packet
- The returned size in bytes now always excludes the IP header, so
  if before it reported '84 bytes' e.g. when using 'fping -l', now
  it reports '64 bytes'. This is to make the reported size
  consistent with ping(8) from iputils and also with fping when
  pinging a IPv6 host (which never included the IPv6 header size).
- The number of sent pings is only counted when the pings are
  received or have timed out, ensuring that the loss ratio will be
  always correct. This makes it possible, for example, to use loop
  mode (-l) with interval statistics (-Q) and a timeout larger
  than period, without having the issue that initially some pings
  would be reported as missing
- Improved precision of measurements from 10us to 1us
- The reported size of received packets is now always correct on
  Linux even for packets > 4096 bytes
- Travis CI automated testing now also macos testing and additional
  ubuntu distributions

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../recipes-support/fping/{fping_4.4.bb => fping_5.0.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/fping/{fping_4.4.bb => fping_5.0.bb} (91%)

diff --git a/meta-networking/recipes-support/fping/fping_4.4.bb b/meta-networking/recipes-support/fping/fping_5.0.bb
similarity index 91%
rename from meta-networking/recipes-support/fping/fping_4.4.bb
rename to meta-networking/recipes-support/fping/fping_5.0.bb
index 125fdfa70..54606e8b6 100644
--- a/meta-networking/recipes-support/fping/fping_4.4.bb
+++ b/meta-networking/recipes-support/fping/fping_5.0.bb
@@ -12,7 +12,7 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c6170fbadddfcd74f011515291d96901"
 
 SRC_URI = "http://www.fping.org/dist/fping-${PV}.tar.gz"
-SRC_URI[sha256sum] = "9f854b65a52dc7b1749d6743e35d0a6268179d1a724267339fc9a066b2b72d11"
+SRC_URI[sha256sum] = "ed38c0b9b64686a05d1b3bc1d66066114a492e04e44eef1821d43b1263cd57b8"
 
 S = "${WORKDIR}/fping-${PV}"
 
-- 
2.17.1

