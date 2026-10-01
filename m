Return-Path: <leonid.iziumtsev@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14D30CA5FA5
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 10:09:11 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.60])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7618.1790849344738688748
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Oct 2026 03:09:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=zRkwGF5C;
 spf=pass (domain: est.tech, ip: 52.101.66.60, mailfrom: leonid.iziumtsev@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IiSNrwLM+nR6k9TOgm/ve+XJG33mUscXZmvAptqHVaLhhbBMc8Aldsazb3Wu1lMhUy9B9U9uqNVs+4Gl5v4ErB3w5QmiObBKGeddTUsbZnZMITfqUVVAO13DnMjjfIQYgu7ZcGzD4senDOBBVAxIKgga/8ikCC6Y48Wly+mkaqlMyZhu+bG5+i7hVshhiw03ST1RWLXj2R3Uv7VuKH/Qm2iyIlQ2tafMgcl8npD9WRd+oT09IwRXsu0Arvki3jpcwaSduHGwsmoCPG9ujr54hCqOWSs6fIJDVB7RrxbDvibnOHrq31FkhCjsdTXRHkfHjC69YyH56gmuFrZin5Joyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U6x6blkHPEo7I0Sv/24LyP7tZ6heuTrdI9hQhjkQirE=;
 b=iAVpHdCspdBMZji+D/wK0sOblN0eb0x0e4fDIhVaoTeMbv260fwcgygNTPyZsZ8oycbLuBWiK90Gg2R0sLtW+85IoNz5l1ZpBu77C7CX2Mb0UR1HfGbMndgwBATegnbzw40SIHpwu3u+ELhDzHL2jFrMM9YJDF2i2u+lIjPOSAydy4SdOD90BruBXLD8Yi23tBqdzAKUDSjXcvVW0jx3wk78dquo8BQHTu9YSU5t9lKa5gduVyF0NpiUbuBeheo+UdEK9R8upED6eX7e6MIz3X4XgAtFjkUjLL4wAO3HqhGUeLNGEOaRL7aJ+DkLpnavJu2wxYp7QaJmQei5QWFDSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U6x6blkHPEo7I0Sv/24LyP7tZ6heuTrdI9hQhjkQirE=;
 b=zRkwGF5Cf8ALyPeYOyvkwzbZus6La7nIaG2y9ET8dK4AiInfmhCZL9azbjl9/MzI1xRYtNBLJ/6WAFBRmDHJuKre99KX1b++RVttItAZGLTHDuGoZH8CVCXXvcp86bsEgoqYYuzLneYAoep6MJfluD/m56StbBdcaxd/GV0OTKwWgMpXfZ0HrqikF70PyXURXPeoGlBcJnhE6zju0umH9GcUtB/nfiUx1cBk5qPy+IXk3pmN5ap6MSsP98r18TQMjgQVoZk2TbJdKqcKy9KNsnrICst9aApLnOXijkaS7AMz08OlqljTiC2tgWMMcT0CkJxtfQMQc+12lyOShkl0fQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM9P189MB1731.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:2ff::18)
 by PAWP189MB2610.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:330::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Thu, 1 Oct
 2026 10:09:00 +0000
Received: from AM9P189MB1731.EURP189.PROD.OUTLOOK.COM
 ([fe80::a809:5156:7172:6c1f]) by AM9P189MB1731.EURP189.PROD.OUTLOOK.COM
 ([fe80::a809:5156:7172:6c1f%4]) with mapi id 15.21.0472.015; Thu, 1 Oct 2026
 10:09:00 +0000
From: Leonid Iziumtsev <leonid.iziumtsev@est.tech>
To: openembedded-devel@lists.openembedded.org
CC: Leonid Iziumtsev <leonid.iziumtsev@est.tech>
Subject: [meta-oe][PATCH] kernel-selftest: remove flag assignments only
Date: Thu,  1 Oct 2026 12:08:47 +0200
Message-ID: <20261001100847.1218020-1-leonid.iziumtsev@est.tech>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0588.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:295::18) To AM9P189MB1731.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:2ff::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9P189MB1731:EE_|PAWP189MB2610:EE_
X-MS-Office365-Filtering-Correlation-Id: 04da6cc2-138a-49d1-e801-08df1fa40343
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|23010399003|10070799003|366016|10067099003|56012099006|11063799006|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	2BtT2GTnFNKUs9bZDzJ11LIL7oM0IQeARl7UMDp47n+36GGSkla4Aw6Pu5TFu9QQDYC7An5FuB1LEY9GmPwMUY/mVVse5J0KgFM3DvSmYqq1wj6W9bbqDnT4yVMNw6Zossb1VZETe9xAaV853NqUeNninQPj6NQngifaxBtPmUqD9J3HyGmdTqdZ8TvO2BTcfjNp/Wr21DBde/towHpxigVvkK7WB+qr9wODwf7k/Tmt67ku4Py2dM2BQNELSUyqrCnl+224esHQy4zZzfEcK8boiBmJdwS6rcK/yQPY2JFpQFe8OFnYJe08tdXPPgZkfibJ7zxoI37lAPyZNbvb6w/nbp4wMtGVw18/vV/rIatHH8Cp/i7USTc9oyEZtBFbmkZ7sWbLQqy9yFR4o1TgFZ+zAWhYqfD+9oC/Vn1Of0oCGnOQkaxJPkoElSlAkNA3iLoZA5KBnVLlJKNQUdtnj7TnKPvwW41YMRo2i3jhAEIX3eBzokgBUMO62Hn/bIdAgtbT8ZMLnomc0WPcTxDmObKHBF2H5lhhL5AG+s0c03R8eQbr4jHvuXaUpwlXmOPWNof7wS6Qy6vTRkoeQu20/+jrQwQBC6SraFS4OXNk8qHgzbDclviJqh7hi5fceTXcssRa9KM+PIxYbpW4bdWc0JYXJNtZR4BJ7mpN7igl7Bk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P189MB1731.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(10070799003)(366016)(10067099003)(56012099006)(11063799006)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Dn1mU/WDRRIqatGUYtrB+GaKEZjyYSn4ZWkpXGBUH1CaHL9aTVN9vKrgah6A?=
 =?us-ascii?Q?A2AWRYvR7/lW0GZ//9p51LpjsZ4ZgVUn5tXbOBF2AS/KAdmpVlrKF3yHbhPI?=
 =?us-ascii?Q?MdevrfsPfSNfljheF9F1nYgaAWrCMVmYpJDFQXWGa/s9Ct6EU3AhPtmhuSka?=
 =?us-ascii?Q?a4mIk+LAGXUFpU9bi+frvc9l+Q0RH1Kq2mi8MW63MPp2Gam8tHMJhYV9e151?=
 =?us-ascii?Q?GF+MJwkWdHcWXBOAGbaszCwE9HKLw1Rx0hPY+hj2GXaTDoO10UfpkgS1SMru?=
 =?us-ascii?Q?3o15IgJk9f0/crRbaxML9Aj0ncTMGfJz659dTimgJLAhjXTf/OeuYDYphjJQ?=
 =?us-ascii?Q?MUfUDAR1pyu3PwJYsrzZnoXPjv94WU7igmIGrQZ+fLCRzvVINXg5sm8el05f?=
 =?us-ascii?Q?gFpcUfGshJs5WJWHMpjnYQkITBTncOqIA5FVp3WaViQn3FzVCvFC7AXe3ds7?=
 =?us-ascii?Q?Ta2r7gH0kvLpkLjppg3TLIb3wx3oMxRYEyqd6G8LhO27Mt58TMFIwFyVHtJE?=
 =?us-ascii?Q?x8C4VgV60rhvNxsAjDHjtr36uWqE9Ixg670n7aeg5oYnIjSsQOalMyv0POrM?=
 =?us-ascii?Q?sJkF9NtINaQDiNf9LtYl35ltieYu/J+jeRIj1BNTQHcOruzMju4hdGwmEC6e?=
 =?us-ascii?Q?WysEJK9SGlByuEgutC1N6qktk43JVIbAoMiPKEXUAhberqKAGi1OJkGnm1S9?=
 =?us-ascii?Q?78UHO8OXsG8qpWgotOJWB575/mZ4Z3A0kpPz5AhjotGYQQ4CHhAPMnUa+YnY?=
 =?us-ascii?Q?E6QzxEGmchQgB8w3oSiOKlaxSpEsYGqxo0iIsPHBOfTX3ISHimJtzXnl5uIB?=
 =?us-ascii?Q?3ZgYfFmBsX8SA+sX16p/puAayttYZGmKvNKDDgi76aoXbBh5blePXqALnowq?=
 =?us-ascii?Q?OI57HMmSyxmroynWLddYb3MvhyEsNokuxacCjB2JFwYRTLy0ws92/dNGoPlU?=
 =?us-ascii?Q?AaYhajdSlldSuIwdg4zycyNnv+5ohiQn2eDHIecZXCucgHusKnKx0rKjdH1n?=
 =?us-ascii?Q?GuuEqx/q1RFa5nyNLyM0z9myrMh79IhqsL5wj1rpTTVSV2PJPqvD36eL+UYs?=
 =?us-ascii?Q?Uu/vXPj+fqOOtlZeHi1eh83Am3qS6sF1FImxcbS3tzW/+lD7NGJCudRleU0P?=
 =?us-ascii?Q?5CZ2jtJPVfwCAy/l60bM6Jft5Kgk1HdsqOgzndmO3un/3ZbnNA0UjBz06oq3?=
 =?us-ascii?Q?x5et0t96jQnIGCKWXrR4lfEm02cPy6A5yDMwRAXLDRfrfEhf83AIteAjrM68?=
 =?us-ascii?Q?/BkYjUhrY74ar6rVQGpBTsCIi+nnDNY4HnNsButd8JN3tYTrrVYRX2i4LN6O?=
 =?us-ascii?Q?DOXOHcULcpZ/e2KdqbQG861ZKx1QDReY/g8xGZlIYUXLSnuBjQM25bFc5FDB?=
 =?us-ascii?Q?VzSU1IpkVNjLSJ+qLduNmcMXmaacu++BShVhfuS7DxxfSdxeH+9tzBg6L72y?=
 =?us-ascii?Q?22w7nAnDfhtuO/Iih/D1L1Yh1R4LVNtIrZvZIj9tksGTEseK7YaMkCoyFWlm?=
 =?us-ascii?Q?y0zW8oYwuLTjv4BSK3klX8QSuTygMjI3lOaU8waeiGLjfzlZzAlAD4lszkzR?=
 =?us-ascii?Q?n6RMsXWg0IYQZCxpZe9J9JXVJa35KaT5wpjR18JPybUuYz1mBSaSiCj+72Q5?=
 =?us-ascii?Q?T2lt4soDopNW9ePKD2O72HOODlpihq9PL/nh6XvKhqAyCMjSCdfJtbO8BtQt?=
 =?us-ascii?Q?zNHUbZ5fVssXXIGeRjZM3g01EGUEqp2RZNpQHC+efbhggMiHL7QAW+Di06CB?=
 =?us-ascii?Q?UTgigkcC1UyuH2e2dHNDrO5/A4UP4LflFPe2NApyMovW2zPL6cyaiYpWGE62?=
X-MS-Exchange-AntiSpam-MessageData-1: NkqCH+zyolUXAJzbhzHIJVwhRGj00aQx4o4=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 04da6cc2-138a-49d1-e801-08df1fa40343
X-MS-Exchange-CrossTenant-AuthSource: AM9P189MB1731.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 10:09:00.0853
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9ClzNUMx5zIRltUJ26Zw/klxVfgD3G1TzxsJkZ4YTBwESiRWAnInOVVMnMg1f9g2K4HTIsWFhImyNc6ugGF8nvduaphFEkvxRAFN9YcaGcY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWP189MB2610
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Oct 2026 10:09:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130578

The do_compile() step removes flags from the kernel Makefile
before building the selftests.

On older kernels (pre-5.12), -mrecord-mcount is guarded by a
cc-option probe:
    ifeq ($(call cc-option-yn,-mrecord-mcount),y)
        CC_FLAGS_FTRACE +=3D -mrecord-mcount
    endif
Previously, the sed expression matched mrecord-mcount regardless
of its context in the line. This removed both the flag assignment
and the ifeq guard, leaving an orphaned endif and causing the
selftest build to fail.

Anchor the expression on +=3D so that the sed only removes flag
assignments, giving us more precise control over which Makefile
lines are deleted.
Apply the same adjustment to the -Wno-alloc-size-larger-than
expressions for consistency.

Signed-off-by: Leonid Iziumtsev <leonid.iziumtsev@est.tech>
---
 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb b/me=
ta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
index 6519b4ee4b..7a27ada2f0 100644
--- a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
@@ -170,9 +170,9 @@ either install it and add it to HOSTTOOLS, or add clang=
-native from meta-clang t
     fi
     oe_runmake -C ${S} headers
     sed -i -e 's|^all: docs|all:|' ${S}/tools/testing/selftests/bpf/Makefi=
le
-    sed -i -e '/mrecord-mcount/d' ${S}/Makefile
-    sed -i -e '/Wno-alloc-size-larger-than/d' ${S}/Makefile
-    sed -i -e '/Wno-alloc-size-larger-than/d' ${S}/scripts/Makefile.*
+    sed -i -e '/+=3D[[:space:]]*-mrecord-mcount/d' ${S}/Makefile
+    sed -i -e '/+=3D[[:space:]]*-Wno-alloc-size-larger-than/d' ${S}/Makefi=
le
+    sed -i -e '/+=3D[[:space:]]*-Wno-alloc-size-larger-than/d' ${S}/script=
s/Makefile.*
=20
     # Add kernel headers to CFLAGS to fix PTP selftest compilation
     # Required for PTP_MASK_CLEAR_ALL and PTP_MASK_EN_SINGLE definitions

