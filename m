Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BDC6EB107F
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 21:51:59 +0000 (UTC)
Received: from PH8PR06CU001.outbound.protection.outlook.com (PH8PR06CU001.outbound.protection.outlook.com [40.107.209.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6995.1773179509707429909
 for <Openembedded-devel@lists.openembedded.org>;
 Tue, 10 Mar 2026 14:51:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=ZxVTl2o1;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.209.64, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AcFAIxi+VKst6UlbGNj0J9EQ7StXRvyG2evuXpJSaNDxL8NFToSYSYnAqrzYU+4v7vFP1jNrTnSwL+HWKfunc9KY8bzWf5dx+FxZx3vOZTF2s1cntBtfsY4GhcMwV9LDOIaULmulwSLP66cYkpMlYkg8BOutZufzt4fsfRFBBa6gTbehFoKj5dsPWP9ZNG7nV0EFxaayU2zLzcKsV43GQV4e/8mS+lIUHR5stoDJDkZoEXw7WJt9Ygf4vNagYYifiGgjwQhu1zWUtV7yKcSRZfr/YiKHADr/j/FzRbJ+m0JwIOTneri+btXFZUF/7VVxoB6TIp5gh7YX5iV00na9Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uwTC0EUOi0MJBmcMJQxjSrhua/YEIEq24nOt1vcn3lI=;
 b=f6HUqsJx20LkxkeNka7glZjTwAN1xStnxGIJX3trzGFz14LbcY76vcf3CndjhYs1zMO13ppMkrL7wFdHgkpjS46kUI+RsEWHzKGB0264YyaLidyUE5ZjioEmfe1PJJ1+ZYQNKxjJlYGjlQvoSB4oLDsFQTDh6E1zxzzr5v6wL4B3FkzhG57fVyjkfqTUhaUdU8KSUi/7otpPqCnX6+6Wchm47GSiFBG1g/MmSu+34elSAbztrU1pLAoCEFC+1mNHp+XTw9Hf9/UeodLCjnu7BDftL/SJ+TYBbJP3jXZoLglvY43JlCY5NluovGXjf6f2THn9l7ops6RkDHuxqhEqwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uwTC0EUOi0MJBmcMJQxjSrhua/YEIEq24nOt1vcn3lI=;
 b=ZxVTl2o1n0+i6PJKI3yF4JZAXjSoEpvuXccDyh1oQzcBcbCYQ93+WREALo4JCpHLDFnYj3x5N/eEjtKa9K7uFgNZBYVHtAe+P3GSJpyIbeZVktm3vPA5MqW3/1Bx1vV9UuchMYelKgagKY0S8yJRXsrNJUyn+L3gLxvzymI7uAc=
Received: from BYAPR02CA0016.namprd02.prod.outlook.com (2603:10b6:a02:ee::29)
 by DS4PR10MB997573.namprd10.prod.outlook.com (2603:10b6:8:31a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 21:51:47 +0000
Received: from MWH0EPF000A6735.namprd04.prod.outlook.com
 (2603:10b6:a02:ee:cafe::f2) by BYAPR02CA0016.outlook.office365.com
 (2603:10b6:a02:ee::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Tue,
 10 Mar 2026 21:51:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 MWH0EPF000A6735.mail.protection.outlook.com (10.167.249.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Tue, 10 Mar 2026 21:51:45 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 10 Mar
 2026 16:51:43 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 10 Mar
 2026 16:51:42 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 10 Mar 2026 16:51:42 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62ALpgVM3845569;
	Tue, 10 Mar 2026 16:51:42 -0500
From: <rs@ti.com>
To: <kai.kang@windriver.com>, <raj.khem@gmail.com>
CC: <Openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-xfce][PATCH] xfce4-session: update for emptty
Date: Tue, 10 Mar 2026 16:51:06 -0500
Message-ID: <20260310215105.2835722-2-rs@ti.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6735:EE_|DS4PR10MB997573:EE_
X-MS-Office365-Filtering-Correlation-Id: ca45e1bb-d436-4349-e454-08de7eef397b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	TNLcCy7Tj3rcmhrhszNbks7M+jUykvpjKOur437u1oLkgdCU66FIwEcOLGJSsWAPanmXfgFt3sbnGb92QHQ5LqX2qlIVGv5li3YrEuk3UbRsRiZMsii8icqHhaN3kgWfp3zbJyyX1ACBkBsyeL0jXb7Mv5Y9i5a1y+vNAnA9sVK4efFqSlxfjVJIcc4WaSZQw3y3XyiuscNl11tEMyB0nnA6fhBBHwfW/EcyZGTIt//Mrl5uZucTLfNJLpGG0MiYliPPll3E48o20BTiTe1vfwSO0ku+IBaD3ojijMeEDk2roX9uNJvbE4za4ih/k5Np2CluvK4QxlZGolS9t3f/Vpdy6gOo2BQQ7vZRwwLmb3yslL2QKR3GW3Av2LzTaNZ/Og9jlhY1bJ2hWXLDfrkxUHXdFzdGf/z/EPhaBSjuH62eWtc8F8Cwfaz61JVNQg9uU4O3laDxaOZgwTFDL/CbVlTxsE2rygknvPcsy7jNQxSReBWUvCXpjmSZhKNpfSa2kkE2t9/tafIGq+0ix4XvpKLsPGSDmkA+T1KnoH8KJVSPE+sdgHMJaXXttPEIP5obEEV5RSGSqKb18uexGWHsV96tkVKiWk44AVni+9rH+X+nM3cx6hhke406jksUP35z72A5kzz+S/PNyhCN0SZwrHOnN95ULK2at6IuEw6piqcFsRwosHffWMjdEkMWPSmRYPQbKJb0kKY5f9ko/sLbz/zS9/eiwOBMdACnwWUiBpwqv7UB4NjDGcyOT69UKCB4mt7Hf43q1q9E23ZDR99a+Q==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	uWhYqi32gpp/xX8kqwJja0OSoXmUQldco/7zH/pKtSo04/nyI0SqJyhl210bRtVzWlDBQ7uTyNAaCCdJU+0GV+2E/KxZMhmkdYZvos9thfbvz9YBsCxC/95DVtT4345iY/TqMV0e5BdGwv5SA9SaNhjlPzHRu2/JKyCDwpzw6sWlGt5VEReuYL4xuQBJzHGrCuKSTKrIXrv8uCjT3jR5n5NumcqEPN4G+q2dJ/A4LLqsLyM8Jw72Fh9BHz1cwhAn3RFuRsoTvqQruOqp6EhfVp5rzf4kTjJ/8IIKKXCyMTpRG9an9LnQu7wui1ulT77xPZngBZyTd8w8uRhG3X7WG1P8OqyuKQKzXy326tfJ1T1V/IKQI5FoMUW7ZZ93S6GpwdnSck5bHwfbGRgqkF/1wiVkMR3+BYIrUP6zqgNdFIlNJzZPQUW0GK5TktgYR1lB
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 21:51:45.8625
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca45e1bb-d436-4349-e454-08de7eef397b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000A6735.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR10MB997573
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Mar 2026 21:51:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125040

From: Randolph Sapp <rs@ti.com>

The x-session-manager alternative link has been removed. Instead a
distro should choose what the default session is by using the
DEFAULT_SESSION variable of xserver-nodm-init.

If the default session cannot be found the user will be presented with a
menu to pick the session themselves. This relies on the xsession and
wayland-sessions desktop entries, which XFCE already provides.

Signed-off-by: Randolph Sapp <rs@ti.com>
---

Sending this now that emptty has been picked up on oe-core's master-next br=
anch.

 .../recipes-xfce/xfce4-session/xfce4-session_4.20.3.bb      | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.20.3.bb b=
/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.20.3.bb
index af7ab98ae5..3690078daf 100644
--- a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.20.3.bb
+++ b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.20.3.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4=
486a80fdaf4a4263"

 DEPENDS =3D "libwnck3 libsm libxfce4ui libxfce4windowing virtual/libx11"

-inherit xfce update-alternatives features_check
+inherit xfce features_check

 SRC_URI +=3D "file://0001-configure.in-hard-code-path-to-iceauth.patch"
 SRC_URI[sha256sum] =3D "dbf00672c5316a30b7001fe852e6a5ba9f889afeab8a247545=
a160d4302f1fa2"
@@ -19,10 +19,6 @@ PACKAGECONFIG[polkit] =3D "--enable-polkit, --disable-po=
lkit, polkit"
 EXTRA_OECONF =3D "GDBUS_CODEGEN=3D${STAGING_BINDIR_NATIVE}/gdbus-codegen \
                 GLIB_COMPILE_RESOURCES=3D${STAGING_BINDIR_NATIVE}/glib-com=
pile-resources"

-ALTERNATIVE:${PN} =3D "x-session-manager"
-ALTERNATIVE_TARGET[x-session-manager] =3D "${bindir}/xfce4-session"
-ALTERNATIVE_PRIORITY_${PN} =3D "150"
-
 FILES:${PN} +=3D " \
     ${libdir}/xfce4/*/*/*.so \
     ${libdir}/xfce4/session/*-*-* \
--
2.53.0


