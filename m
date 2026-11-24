Received: from aer-iport-1.cisco.com (aer-iport-1.cisco.com [173.38.203.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12224.1795500042120444151
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Nov 2026 22:00:42 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=I4hwz0Yl;
 spf=pass (domain: cisco.com, ip: 173.38.203.51, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3271; q=dns/txt;
  s=iport01; t=1795500042; x=1796709642;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2BxF+BbT5vfM4TIpxZtdNO3Mk5j0EtKVMd6eex3IQrg=;
  b=I4hwz0YlQyYwioUJSj5WmHMI3mu8CTw0UBnrQC9/7vj3um3aSlGaorga
   XuPj/LH9Adj4QR9xxoNrWpcFf+v8NIHB9lf5GtLmBTWgtw6q3xH08uHoR
   RGhbUMQuUB5Jn50rCeZfcatKBdbWfZtSESUWhv8rzneLv8N8A89gnPSAd
   a3vztHeG/IvyuvJqeVH8kMlWlaI1FO8XDgttlkp+shLM+H2TLCt7XO5nH
   T4Y4FXZDa96y8XrKP5SAu7JCOPe1OKf8PGoX335VAq0KQDTB4S2Nr6xvZ
   geZOg+rmhYgKdLQ83bV9lTsDIzaZBM2m276QgHUIbLc7f/JOvL0t5b6oY
   A==;
X-CSE-ConnectionGUID: nI1m41MIS1KlcVdiDX4Iog==
X-CSE-MsgGUID: l0qiwl59RZyvcOzfgJFaLg==
X-IPAS-Result: =?us-ascii?q?A0BXAwBEJQVr/81K/pBaglmDTGBDSZQqoE2Bfg8BAQEPN?=
 =?us-ascii?q?xoEAQGTKQImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBBwWBDhOGX?=
 =?us-ascii?q?JBLARgBG4Eeg0YBgnQDunqCLIEBgykBgVTZS4F0FYE4jWZ2hH0nG4FJRIR/i?=
 =?us-ascii?q?wkEgxwSkDyISUiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjOxeBBxsGBYEcg?=
 =?us-ascii?q?R6BEoEDXYErKF4hgQiBdgKCUYIAAgFJQQ4HRVMJJUMSRyQiCBIJARMaLAqBG?=
 =?us-ascii?q?jU8CSY/FQxnCxoFYQgCDQx0ORAwHiQvBRomPhsKgQwnHx4bDgIfEAYWIQsbG?=
 =?us-ascii?q?A1IESw3FRkEPm4HlBSDGoEPgleldaERhCuMJJU6GjOqcpkIpA5NhGqBaDyBW?=
 =?us-ascii?q?TMaCBsVgyIJShkP4H8mMgI7AgcCBw4DC5NmAQE?=
IronPort-Data: A9a23:CAvqOahYGyGoFPpYzXeSEwTzX161NREKZh0ujC45NGQN5FlHY01je
 htvXG2Pa/jfZjHyftAlOYW3/E0G6JPQm9ZgQFE/+yowF3ljpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FHwdOCn/SMhvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeAULOZ82QsaDxNsvjY8EkHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUe279yXThr1
 MdBCzQGUByCq9Lq4bW0H7wEasQLdKEHPasWt2slyXTSCuwrBMifBa7L/tRfmjw3g6iiH96HO
 5ZfM2czKkucJUcXZz/7C7pm9AusrmjiaTRUpXqepLE85C7YywkZPL3FboCKJ4LaHZU9ckCwo
 jrf/nv9X0AgBs2Bwh2X/H2OqObrknauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8hkOgVtZ3L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4GuAgrQXIwa3O7kPBWi4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rEnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:v5PgeKAWwHZ8Q9HlHemc55DYdb4zR+YMi2TDsHoBKyC9Hfb3qy
 nDppkmPHzP+VUssQ8b+OxoUZPoKRi3yXcf2+Ys1NmZMDUOwFHJEKhSqa3/3jbnByryssRZ1a
 tmbuxCLeeYNykesS4/izPIdOrJB7K8gcSVuds=
X-Talos-CUID: 9a23:ZmH2C2NhVuu+lu5DXgg+8RJNP+EeK17Zx0ncImOIVUduR+jA
X-Talos-MUID: 9a23:vjw2BgoYxoDz3H8OyaQezzU6LcZ35/n/MnIcj54hqceLFwJ5HzjI2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,229,1787011200"; 
   d="scan'208";a="62756808"
Received: from aer-l-core-04.cisco.com ([144.254.74.205])
  by aer-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Nov 2026 06:00:38 +0000
Received: from sjc-ads-7310.cisco.com (sjc-ads-7310.cisco.com [10.30.220.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-04.cisco.com (Postfix) with ESMTPS id F3AF6180001C7
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 06:00:37 +0000 (GMT)
Received: by sjc-ads-7310.cisco.com (Postfix, from userid 1889728)
	id A571BCC12A6; Mon, 23 Nov 2026 22:00:36 -0800 (PST)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][wrynose][PATCH 0/5] python3-twisted: Security fixes
Date: Mon, 23 Nov 2026 22:00:30 -0800
Message-Id: <20261124060035.1651451-1-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-7310.cisco.com [10.30.220.95];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.220.95, sjc-ads-7310.cisco.com
X-Outbound-Node: aer-l-core-04.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 06:00:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132923
Content-Type: text/plain; charset="utf-8"

Backport 5 python3-twisted security fixes to the python3-twisted 25.5.0
recipe on wrynose. The series adds the fixes as patches and updates
the recipe to apply them.

The fixes for CVE-2026-115774 and CVE-2026-115776 are each carried
in two patches. The CVE-2026-115877 fix is carried in three patches
and CVE-2026-115778 in four patches. The CVE-2026-83813 fix is
carried in four patches and one regression patch. The patches
retain upstream references.

Yogita Urade (5):
  python3-twisted: Fix CVE-2026-83813
  python3-twisted: Fix CVE-2026-115877
  python3-twisted: Fix CVE-2026-115774
  python3-twisted: Fix CVE-2026-115776
  python3-twisted: Fix CVE-2026-115778

 .../python3-twisted/CVE-2026-115774_p1.patch  |  55 ++++
 .../python3-twisted/CVE-2026-115774_p2.patch  |  26 ++
 .../python3-twisted/CVE-2026-115776_p1.patch  | 111 +++++++
 .../python3-twisted/CVE-2026-115776_p2.patch  |  79 +++++
 .../python3-twisted/CVE-2026-115778_p1.patch  | 105 +++++++
 .../python3-twisted/CVE-2026-115778_p2.patch  | 286 ++++++++++++++++++
 .../python3-twisted/CVE-2026-115778_p3.patch  | 108 +++++++
 .../python3-twisted/CVE-2026-115778_p4.patch  |  36 +++
 .../python3-twisted/CVE-2026-115877_p1.patch  |  71 +++++
 .../python3-twisted/CVE-2026-115877_p2.patch  |  30 ++
 .../python3-twisted/CVE-2026-115877_p3.patch  |  78 +++++
 .../CVE-2026-83813-regression.patch           |  62 ++++
 .../python3-twisted/CVE-2026-83813_p1.patch   |  62 ++++
 .../python3-twisted/CVE-2026-83813_p2.patch   |  36 +++
 .../python3-twisted/CVE-2026-83813_p3.patch   |  35 +++
 .../python3-twisted/CVE-2026-83813_p4.patch   |  28 ++
 .../python/python3-twisted_25.5.0.bb          |  16 +
 17 files changed, 1224 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-twisted/CVE-2026-115774_p1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-twisted/CVE-2026-115774_p2.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-twisted/CVE-2026-115776_p1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-twisted/CVE-2026-115776_p2.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-twisted/CVE-2026-115778_p1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-twisted/CVE-2026-115778_p2.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-twisted/CVE-2026-115778_p3.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-twisted/CVE-2026-115778_p4.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-twisted/CVE-2026-115877_p1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-twisted/CVE-2026-115877_p2.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-twisted/CVE-2026-115877_p3.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-twisted/CVE-2026-83813-regression.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-twisted/CVE-2026-83813_p1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-twisted/CVE-2026-83813_p2.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-twisted/CVE-2026-83813_p3.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-twisted/CVE-2026-83813_p4.patch

-- 
2.53.0

