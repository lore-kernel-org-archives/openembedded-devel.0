Received: from aer-iport-6.cisco.com (aer-iport-6.cisco.com [173.38.203.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14513.1795513749734606834
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Nov 2026 01:49:10 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=cSmAg4Ig;
 spf=pass (domain: cisco.com, ip: 173.38.203.68, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1283; q=dns/txt;
  s=iport01; t=1795513749; x=1796723349;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=oSeB56gcRmAw0vNifUctHUuq/qYtMXPvdKWBZoiDkV8=;
  b=cSmAg4Igwt6aTDeKt/8k688FbiXLnLib2WH7cu4ycLTRU9toy7CUqdo0
   IZyD/QCxpmiZQQ6uxZt2hQj3tGA8XgdDL728vUQDPi27SU+MtEQEirbUf
   0IJa+CK5qhU1XJR9AzEtQ+4fCbHOIUXzrPeJdtD5Dscmo2/QdJ5INNBlm
   Keews4W/T9cnUY01IsNidd0j2m1RiMrNSjfwz+HReQ9+oI/KIJz9R+FgW
   HAtTRIIca/ir1Jd6VH7wGCr09UajfOkQVQDxCiBPiUHaOTf+MYEGHxRUl
   fytmVTcGfMFu0quI1Q+PgGvau7YAAWaCTkTkr5l0w6sKHX4IK18Wqblxz
   A==;
X-CSE-ConnectionGUID: INaw/DlUTc6QNkN+uIvFPg==
X-CSE-MsgGUID: O3DPuCReSMqUiAi/7DcVcA==
X-IPAS-Result: =?us-ascii?q?A0BAAgBZWwVr/8pK/pBaglmCV3VgQ0kDlCeCIZ4sgX4PA?=
 =?us-ascii?q?QEBDz0UBAEBkykCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4Thk8NkEsBdlxEgwIBgnQDEQa6XoIsgQGDWwKBIdszAQUGFAGBOIVCiCR2h?=
 =?us-ascii?q?H0nGxuBcoR/gQWBXAIDgUVlhXkEgiKBDIFyjHmKGkiBHgNZLAFVEw0KCwcFg?=
 =?us-ascii?q?WgDNRIqFW4yHYEjOxeBBxsGBYEcgR6BEoEDXYErKF4hgQiBdgKCUYIAAgFJQ?=
 =?us-ascii?q?Q4HRVMJJUMSRyQiCBIJARMaLAqBGjU8CSY/FQxnCxoFYQgCDQx0ORAwHiQvB?=
 =?us-ascii?q?RomPhsKgQwnHx4bDgIfEAYWIQsbGA1IESw3FRkEPm4HlBSDGgGBDSwggUxAE?=
 =?us-ascii?q?aVkoREKKIN5jCSVOhozqnKZCI4KllGEaoFoPIFZcBWDIhJBGQ+OOYh+yUgmM?=
 =?us-ascii?q?g4wAQcCBw8CgXORfgEB?=
IronPort-Data: A9a23:TqAImqAygm1gARVW/37iw5YqxClBgxIJ4kV8jS/XYbTApGxx1jMOy
 TFLWGCHOPmJNDSjKN50aYW+oUoPvcDXzdZgOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGcYZsCC+G+39BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXGthh
 fuo+5eBYQb/gGYuWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE4tNnEwYaObAk8bhOJ2Jot
 uE5Nh41YUXW7w626OrTpuhEj8k5ac2uN4QFtzQ4lHfSDO0tRtbIRKCiCd1whWtswJoTQbCBO
 4xDMWAHgBfoO3WjPn8bBYw3mvyonlH0ciZTrxSeoq9fD237klQpiOa3aoa9ltqiYp55pluzn
 G/92n3EAzgbc4OzwgSO2yf57gPItWahMG4IL5W/7vNsjViZy2AfBRFTWValrP2Rjk+lR8kZL
 FQZ/Ccrp6U++EGnCN7nUHWFTGWstxMGHt4VGOog5UTVk+zf4h2SAS4PSTsphMEaifLajAcCj
 jeh9+4FzxQ22FFJYRpxLoupkA4=
IronPort-HdrOrdr: A9a23:JyFw0a/T1IHUgHoO20Buk+DoI+orL9Y04lQ7vn2ZLiYlEPBw+P
 rBoB1273LJYVUqKRIdcK67WZVoKEm0nfUe3WB7B9iftWfd1FdAVLsD0aLShxv9Bib56ulRkY
 1kc6R4FZnMKGISt7ee3OF9eOxQp+VuN8uT9IPj80s=
X-Talos-CUID: =?us-ascii?q?9a23=3A1qFUOmlpoFwhT1fhnBWqH7u42HzXOVz7xWiXD0u?=
 =?us-ascii?q?FNW03cZuWbxyN2b1Kq8U7zg=3D=3D?=
X-Talos-MUID: 9a23:T0i/ggthfl7k1csG482no2pODNpD2amVLVkwkLwH/JaoPhJ7EmLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,229,1787011200"; 
   d="scan'208";a="60006224"
Received: from aer-l-core-01.cisco.com ([144.254.74.202])
  by aer-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Nov 2026 09:49:06 +0000
Received: from sjc-ads-4935.cisco.com (sjc-ads-4935.cisco.com [10.28.39.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-01.cisco.com (Postfix) with ESMTPS id D71A234429
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 09:49:05 +0000 (GMT)
Received: by sjc-ads-4935.cisco.com (Postfix, from userid 1887503)
	id 8CF58CC2EF3; Tue, 24 Nov 2026 01:49:04 -0800 (PST)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] tnftp: mark CVE-2004-1294 as fixed
Date: Tue, 24 Nov 2026 01:49:04 -0800
Message-Id: <20261124094904.1559178-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4935.cisco.com [10.28.39.199];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.39.199, sjc-ads-4935.cisco.com
X-Outbound-Node: aer-l-core-01.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 09:49:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132946
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

