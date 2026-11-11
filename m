Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3283.1794374983856874227
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Nov 2026 21:29:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Wsasd7Ws;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2962; q=dns/txt;
  s=iport01; t=1794374983; x=1795584583;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+R7kzHxXYu8AlWol0P/NopjPvSGJK8JlgfjRFIE9Bbk=;
  b=Wsasd7WsZkWAHWC5FDtfvACOq6aNjgnOhFmJWHhNjKod9LqMcQ70Tb1g
   XUimUXeIvVPoE7OsdHOVRN0ANYkvxyjCoqe1hGOyniKdgRwyQFVXG3i1m
   E8f19nSQmrTVldifz1IFxPSMmi2MtH19qR3orG4rerGVu14CRCYP4SsmI
   AU93fuCqMiQrCyap8owVNv/IHX9NiN3jE80vLg/QLP2HZHA+XIZp0yHWH
   sCVcEJKLLX0LucPntMeseQ08CyKL+j7jpTVXaYehs79IQrPOWL1B+Tzox
   n3pwVKWkA5AHTvQi5YkXiiEOOo4hpJcJGdy/4p/cT85K+rmgqIEoJpcjk
   Q==;
X-CSE-ConnectionGUID: g0p/SJECS4u4xniPKOEqUA==
X-CSE-MsgGUID: j5h9Or5GRdytrlJSW08Jyw==
X-IPAS-Result: =?us-ascii?q?A0C/BABQ/PNq/5P/Ja1aglmDTGBDSZNaAYJwoCMPAQEBD?=
 =?us-ascii?q?zcaBAEBhQWOIAImNwYOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBBwWBD?=
 =?us-ascii?q?hOGXJAVNgEYAS0wXB0BJoMCAYJ0AxG5WIIsgQGDKQGBVNs/FYE4hUKIJHaEf?=
 =?us-ascii?q?ScbG4FyhAh2hAqBBoVXIgSCDRV6EoJlghmDG4ZbgVGHJUiBHgNZLAFVEw0KC?=
 =?us-ascii?q?wcFgWgDNRIqFW4yHYEjPheBBxsGBYEcgR6BEoEHXYErKF0BIYEIgXYCglGCA?=
 =?us-ascii?q?AIBSUEOB0VTCSVDEkckIggSCQETGiwKgRo1PAkmPxUMZwsaBWEIAg0MdDkQM?=
 =?us-ascii?q?B4kLwUaJj4bCn4YDUgRLDcVGQQ+bgeSboMVgQ4BL1BGFT1ADzySbZI+oREKK?=
 =?us-ascii?q?IN4jCSVOhozqnKZCKQOTYRqgX4mRoETcBWDIglKGQ+OLhbSOyYyAjsCBwIHD?=
 =?us-ascii?q?gMLkWiBfgEB?=
IronPort-Data: A9a23:jotPWaoYoIHtsEQEtDWUNV4Kj+9eBmJIZBIvgKrLsJaIsI4StFCzt
 garIBmFMvaPYGvxe4ggbNvg8EgF7JbUzdEySAE/qS40Ei4UouPIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOWn9T8jhfngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgDNNwJcaDpOtfva8Uo35ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0ukvGSZ11
 9EzE2wQMgCFhtqV55+id8A506zPLOGzVG8ekmtrwTecCbMtRorOBvySo9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5LV/rSn8/w7pX7WzFbpVacpLs+y2PS1wd2lrPqNbI5f/TXGZsOxhnG9
 jiuE2LRAEwaZfuFlBW//mOwnOvtphyjCKADC+jtnhJtqBjJroAJMzURTVa9rPyzh0KyVt4aJ
 0EK9y4Gqakp6FftScHwWRC9qnOIshMQHd1KHIUHBBql0KHY5UOdQ2MDVDMEMYRgv84tTjts3
 ViM9z/0OQFSXHSuYSr13t+pQfmaYED58Udqifc4cDY4
IronPort-HdrOrdr: A9a23:FFDJAKntolp6OcGWvybUvcaq9BvpDfIa3DAbv31ZSRFFG/FwWf
 rAoB19726QtN9/YhAdcLy7VZVoIkmsl6Kdn7NwAV7KZmCP0wGVxepZg7cKrQeNJ8SHzJ8/6Y
 5QN45jFdb3EV92yez+4AW+DpIc5ePvytHNuQ8bpE0dKz2DrMpbnmBENjo=
X-Talos-CUID: 9a23:YlZrSW4RUMh24DovpNss+xYMXfsHX1bmkGqMM0m5MUVOZaSoYArF
X-Talos-MUID: 9a23:QTT7HAtOt3298h3lts2nhmxiZeByvouUBFERi5EkgPbcZQ5hJGLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,207,1787011200"; 
   d="scan'208";a="546307682"
Received: from rcdn-l-core-10.cisco.com ([173.37.255.147])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 11 Nov 2026 05:29:43 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-10.cisco.com (Postfix) with ESMTPS id F31671800025B;
	Wed, 11 Nov 2026 05:29:42 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 9B481CC1611; Tue, 10 Nov 2026 21:29:42 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-python][wrynose][PATCH 0/9] python3-filelock: Security fixes
Date: Tue, 10 Nov 2026 21:29:29 -0800
Message-Id: <20261111052938.3691463-1-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-10.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 05:29:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132112
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

Backport six filelock security fixes to the 3.25.2 recipe on Wrynose.
Record three Windows-only CVEs as not applicable to the Linux target.

The fixes cover soft-lock marker permissions, atomic stale-marker
takeover, UnixFileLock integrity, ReadWriteLock symlink handling,
bounded SQLite schema work, and private SQLite database and side-file
names in shared directories.

Include the upstream recovery-PID, raced-restoration, ENOSYS ownership,
descriptor-test, WAL-header and inherited-ACL corrections with their
corresponding fixes. Retain the 3.25.2 public API and persistent
ReadWriteLock connections.

The final three patches set CVE_STATUS for CVE-2026-112907,
CVE-2026-112910 and CVE-2026-112913, which affect Windows oplock,
permission and SQLite side-file handling.

Darsh Kelaiya (9):
  python3-filelock: fix CVE-2026-112939
  python3-filelock: fix CVE-2026-112935
  python3-filelock: fix CVE-2026-112909
  python3-filelock: fix CVE-2026-112936
  python3-filelock: fix CVE-2026-112915
  python3-filelock: fix CVE-2026-112940
  python3-filelock: ignore CVE-2026-112907
  python3-filelock: ignore CVE-2026-112910
  python3-filelock: ignore CVE-2026-112913

 .../python3-filelock/CVE-2026-112909_p1.patch      | 312 +++++++
 .../python3-filelock/CVE-2026-112909_p2.patch      |  53 ++
 .../python/python3-filelock/CVE-2026-112915.patch  | 280 ++++++
 .../python3-filelock/CVE-2026-112935_p1.patch      | 945 +++++++++++++++++++++
 .../python3-filelock/CVE-2026-112935_p2.patch      |  90 ++
 .../python3-filelock/CVE-2026-112935_p3.patch      | 425 +++++++++
 .../python/python3-filelock/CVE-2026-112936.patch  | 382 +++++++++
 .../python/python3-filelock/CVE-2026-112939.patch  | 107 +++
 .../python3-filelock/CVE-2026-112940_p1.patch      | 699 +++++++++++++++
 .../python3-filelock/CVE-2026-112940_p2.patch      | 104 +++
 .../python/python3-filelock_3.25.2.bb              |  20 +-
 11 files changed, 3416 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-filelock/CVE-2026-112909_p1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-filelock/CVE-2026-112909_p2.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-filelock/CVE-2026-112915.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-filelock/CVE-2026-112935_p1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-filelock/CVE-2026-112935_p2.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-filelock/CVE-2026-112935_p3.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-filelock/CVE-2026-112936.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-filelock/CVE-2026-112939.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-filelock/CVE-2026-112940_p1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-filelock/CVE-2026-112940_p2.patch

-- 
2.35.6
