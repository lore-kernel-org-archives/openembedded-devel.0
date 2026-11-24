Received: from aer-iport-5.cisco.com (aer-iport-5.cisco.com [173.38.203.67])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14512.1795513749303975347
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Nov 2026 01:49:09 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=e60QjvdK;
 spf=pass (domain: cisco.com, ip: 173.38.203.67, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1283; q=dns/txt;
  s=iport01; t=1795513749; x=1796723349;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=oSeB56gcRmAw0vNifUctHUuq/qYtMXPvdKWBZoiDkV8=;
  b=e60QjvdKiiQNms8ohQDKFabDglJauEHveG6A92A5ZTlE1lB1Sjtv1R3/
   lquZOZZaJoc07d6zAaURa+foryp2FRw0bQDl8Vzr2V3uuPNaOxFRzAh49
   UuZdxMCjbJsaAjp1qn3a96jrL+voHaqTdYMDlwQPVYkN8Dl7dnchEWbcy
   YnFa79VrG/Iyo7q8E8wLeiFdzv/8a8kwfLrJW9z+DixuQ+z4y0Bhx2Lp6
   2248z7Ix4aOf2RccpXKvaDY8pol144fnn8vW66FK9hokFfLaTytaWeD6+
   AUiznQGg1BrPgYCjPDECVthYGBOtooZIvZMqTHMLyFZeKY7u0zckgqKTg
   g==;
X-CSE-ConnectionGUID: DXgYAjt2RfqviCi9q2W1QA==
X-CSE-MsgGUID: O6S4qOjfS1GebkIzhKQNRw==
X-IPAS-Result: =?us-ascii?q?A0BAAgBHXAVr/9RK/pBaglmCV3VgQ0kDlCeCIZ4sgX4PA?=
 =?us-ascii?q?QEBDz0UBAEBkykCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4Thk8NkEsBdlxEgwIBgnQDEQa6XYIsgQGDWwKBIdszAQUGFAGBOIVCiCR2h?=
 =?us-ascii?q?H0nGxuBcoR/gQWBXAIDgUVlhXkEgiKBDIFyjHmKGkiBHgNZLAFVEw0KCwcFg?=
 =?us-ascii?q?WgDNRIqFW4yHYEjOxeBBxsGBYEcgR6BEoEDXYErKF4hgQiBdgKCUYIAAgFJQ?=
 =?us-ascii?q?Q4HRVMJJUMSRyQiCBIJARMaLAqBGjU8CSY/FQxnCxoFYQgCDQx0ORAwHiQvB?=
 =?us-ascii?q?RomPhsKgQwnHx4bDgIfEAYWIQsbGA1IESw3FRkEPm4HlBSDGgGBDSwggUxAE?=
 =?us-ascii?q?aVkoREKKIN5jCSVOhozqnKZCI4KllGEaoFoPIFZcBWDIhJBGQ+OOYh+yUgmM?=
 =?us-ascii?q?g4vAQEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:op8MKaD5Xhyn9BVW/37iw5YqxClBgxIJ4kV8jS/XYbTApD9z1jUCx
 jAZDWzXPa6Oa2P8KY93OYW2phgBsJ6EyINnOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGcYZsCC+G+39BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXGthh
 fuo+5eBYQb/gGYuWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE78VhPWg0Idci9P9pAEpPp
 OVCF2k0R0XW7w626OrTpuhEj8k5ac2uN4QFtzQ5lHfSDO0tRtbIRKCiCd1whWtswJoTQbCBO
 4xDMGAHgBfoO3WjPn8bBYw3mvyonlH0ciZTrxSeoq9fD237klQoj+G2a4G9ltqiYptuwl+/p
 Gz9pkv0CBI7Jty88By/7Sf57gPItWahMG4IL5W/7vNsjViZy2AfBRFTWValrP2Rjk+lR8kZL
 FQZ/Ccrp6U++EGnCN7nUHWFTGWstxMGHt4VGOog5UTUk+zf4h2SAS4PSTsphMEaifLajAcCj
 jeh9+4FzxQ22FFJYRpxLoupkA4=
IronPort-HdrOrdr: A9a23:cM+8dasykkytsvItNDYi170v7skDRtV00zEX/kB9WHVpm6uj5q
 KTdZsguyMc5Ax9ZJhCo6HiBED/exLhHPdOiOF7V4tKNzOIhILHFu1fBPPZowHIKmnZ6vNX07
 tmfuxVDd39CkU/sOPBiTPIdurJBLK8gceVbSC09QYIcT1X
X-Talos-CUID: 9a23:5kt4pmHHpYD+FYIxqmJLxEElM8I5KEfT1WnRCE7pEDxWEYS8HAo=
X-Talos-MUID: 9a23:3iCghQmFAa7FjFUgTBRRdnpFavw0+oOsBntUvpgMuOiWNQ9JHQ2C2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,230,1787011200"; 
   d="scan'208";a="60171333"
Received: from aer-l-core-11.cisco.com ([144.254.74.212])
  by aer-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Nov 2026 09:49:07 +0000
Received: from sjc-ads-4935.cisco.com (sjc-ads-4935.cisco.com [10.28.39.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-11.cisco.com (Postfix) with ESMTPS id E966A180001FD
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 09:49:06 +0000 (GMT)
Received: by sjc-ads-4935.cisco.com (Postfix, from userid 1887503)
	id 9D621CCA798; Tue, 24 Nov 2026 01:49:05 -0800 (PST)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][wrynose][PATCH] tnftp: mark CVE-2004-1294 as fixed
Date: Tue, 24 Nov 2026 01:49:05 -0800
Message-Id: <20261124094905.1559300-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4935.cisco.com [10.28.39.199];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.39.199, sjc-ads-4935.cisco.com
X-Outbound-Node: aer-l-core-11.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 09:49:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132945
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

