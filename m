Received: from aer-iport-8.cisco.com (aer-iport-8.cisco.com [173.38.203.70])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14511.1795513748214485139
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Nov 2026 01:49:08 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=k3/MbIwT;
 spf=pass (domain: cisco.com, ip: 173.38.203.70, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1283; q=dns/txt;
  s=iport01; t=1795513748; x=1796723348;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=oSeB56gcRmAw0vNifUctHUuq/qYtMXPvdKWBZoiDkV8=;
  b=k3/MbIwTa+XeluibTPn/ytjf+UTHA/RKfaCvArHJ4PPIhvdrjv+FiWaa
   3HVt/HNk/AeZ2fWkBG36XZ3vR+pWrbftgI4DSeLO//2YgACq0H+l2klds
   ltbRfkjFmHVpzPbzSPgfC+sQyE9vMnHDNHbCrfTt1Idv5LUZE3CSfoWS1
   UHEFhsOqklA4lPNV0qMoFKcFBZoCi4DJUFWpb70VhOgc61E6BLPD2zsgi
   4r0goQqD/XQH4ZIQLIt19tI29tG/q4KSRHeNU0uLDHGo5ZKdbdKI9vCM5
   y3v40bkFURZyGgOuiXDbUNiW6r9UYy+UsiVnISPvBlAXGciEbk0XayOSZ
   A==;
X-CSE-ConnectionGUID: GJnAbbyVRd2zDgmohzfD0Q==
X-CSE-MsgGUID: t7Z1qtbqReGJ+WauinZjnA==
X-IPAS-Result: =?us-ascii?q?A0BAAgBZWwVr/9VK/pBaglmCV3VgQ0kDlCeCIZ4sgX4PA?=
 =?us-ascii?q?QEBDz0UBAEBkykCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4Thk8NkEsBdlxEgwIBgnQDEQa6XoIsgQGDWwKBIdszAQUGFAGBOIVCiCR2h?=
 =?us-ascii?q?H0nGxuBcoR/gQWBXAIDgUVlhXkEgiKBDIFyjHmKGkiBHgNZLAFVEw0KCwcFg?=
 =?us-ascii?q?WgDNRIqFW4yHYEjOxeBBxsGBYEcgR6BEoEDXYErKF4hgQiBdgKCUYIAAgFJQ?=
 =?us-ascii?q?Q4HRVMJJUMSRyQiCBIJARMaLAqBGjU8CSY/FQxnCxoFYQgCDQx0ORAwHiQvB?=
 =?us-ascii?q?RomPhsKgQwnHx4bDgIfEAYWIQsbGA1IESw3FRkEPm4HlBSDGgGBDSwggUxAE?=
 =?us-ascii?q?aVkoREKKIN5jCSVOhozqnKZCI4KllGEaoFoPIFZcBWDIhJBGQ+OOYh+yUgmM?=
 =?us-ascii?q?g4vAQEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:QR8u4qA1Yjb3zBVW/37iw5YqxClBgxIJ4kV8jS/XYbTApGkl12EAx
 2IfWzvSO/6JZWqnL9p3OoXk80pUv5TXx9BhOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGcYZsCC+G+39BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXGthh
 fuo+5eBYQb/gGYuWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE7NdoJUs8LLMi9rxlLW5L8
 vwKJhxVV0XW7w626OrTpuhEj8k5ac2uN4QFtzQ5l3fSDO0tRtbIRKCiCd1whWtswJoTQbCBO
 4xDMGEHgBfoO3WjPn8bBYw3mvyonlH0ciZTrxSeoq9fD237klQogee2a4G9ltqiWZpnx1+Er
 Hv88kvbQS4TKd2Z+ziD2yf57gPItWahMG4IL5W/7vNsjViZy2AfBRFTWValrP2Rjk+lR8kZL
 FQZ/Ccrp6U++EGnCN7nUHWFTGWstxMGHt4VGOog5UTUkOzf4h2SAS4PSTsphMEaifLajAcCj
 jeh9+4FzxQ22FFJYRpxLoupkA4=
IronPort-HdrOrdr: A9a23:AP8yuqqQEynrbH3WVsmJEjsaV5obeYIsimQD101hICG9Ffbo9f
 xG88506faZslsssRIb6LO90de7IE80nKQdieJ6AV7IZmbbUQWTQL2KlbGD/xTQXwvj6+Vaya
 BsN4J6CNH2EBxGqPyS2njcLz7lq+P3l5xBQozlvhNQcT0=
X-Talos-CUID: 9a23:6ZxI02G3K8BHtVtKqmJI1kg9EMo0TEfRlmX8LEq/CXRnZOWsHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3AInwKYQxzqqnlNhkXEt0jnHO/z9+aqLjxOhkUjZ8?=
 =?us-ascii?q?fgcSrF29PMiqciga1RKZyfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,229,1787011200"; 
   d="scan'208";a="60197333"
Received: from aer-l-core-12.cisco.com ([144.254.74.213])
  by aer-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Nov 2026 09:49:06 +0000
Received: from sjc-ads-4935.cisco.com (sjc-ads-4935.cisco.com [10.28.39.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-12.cisco.com (Postfix) with ESMTPS id 0357818000210
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 09:49:06 +0000 (GMT)
Received: by sjc-ads-4935.cisco.com (Postfix, from userid 1887503)
	id A975BCC2EFA; Tue, 24 Nov 2026 01:49:04 -0800 (PST)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][blacksail][PATCH] tnftp: mark CVE-2004-1294 as fixed
Date: Tue, 24 Nov 2026 01:49:04 -0800
Message-Id: <20261124094904.1559231-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4935.cisco.com [10.28.39.199];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.39.199, sjc-ads-4935.cisco.com
X-Outbound-Node: aer-l-core-12.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 09:49:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132944
Content-Type: text/plain; charset="utf-8"

From: Devansh Patel <devanshp@cisco.com>

CVE-2004-1294 was fixed upstream in tnftp 20050103 [1]. The
20260211 source used by this recipe retains the mget() check that
rejects server-provided filenames outside the local directory [2].

Record the fixed version so CVE scanning does not report this
already-fixed issue.

[1] https://security.gentoo.org/glsa/200501-24
[2] https://ftp.netbsd.org/pub/NetBSD/misc/tnftp/tnftp-20260211.tar.gz

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta-networking/recipes-support/tnftp/tnftp_20260211.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-support/tnftp/tnftp_20260211.bb b/meta-networking/recipes-support/tnftp/tnftp_20260211.bb
index 70123eaa86..2f878da9e6 100644
--- a/meta-networking/recipes-support/tnftp/tnftp_20260211.bb
+++ b/meta-networking/recipes-support/tnftp/tnftp_20260211.bb
@@ -13,6 +13,9 @@ HOMEPAGE = "https://en.wikipedia.org/wiki/Tnftp"
 SECTION = "net"
 LICENSE = "BSD-2-Clause"
 
+# Fixed upstream in 20050103: https://security.gentoo.org/glsa/200501-24
+CVE_STATUS[CVE-2004-1294] = "fixed-version: Fixed upstream in 20050103"
+
 DEPENDS = "ncurses"
 
 SRC_URI = "https://ftp.netbsd.org/pub/NetBSD/misc/tnftp/${BPN}-${PV}.tar.gz \
-- 
2.35.6

