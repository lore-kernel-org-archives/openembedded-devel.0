Received: from NAM02-CY1-obe.outbound.protection.outlook.com (NAM02-CY1-obe.outbound.protection.outlook.com [40.107.76.53])
 by mx.groups.io with SMTP id smtpd.web10.21646.1609649576120540994
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 02 Jan 2021 20:52:56 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=HdmTjCnh;
 spf=pass (domain: windriver.com, ip: 40.107.76.53, mailfrom: yi.zhao@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SxO106Uiqzyp6h9nx81eJvg/5NCttYuCnU9OOVTkXPkftL4Ht+JIY4cHVjrEeU5a3LcbVT51TuAx3wSOxgbRBi9vw5Zti4doHRiYGnU5q84zALUHXAf7ALZqhb9wQXVW7N13XsFLiSvJFCGujpxcF9b08kJVO77q4ati8GeTbmSKQZ4qJ7jnxeOYkpDcoPn81KWEmdtcRnZ77HuQBt/9CyVR7LK0G1Eh0LZJkg2dSYR/gYhlBYI5+gM04TpAVtaKD5gAJwrZUH5r9lWCUTmDrWo2LVm6W4YRdCY5zkfufA+jHsJr76hg8MOS2PFh+LKjFexfDIJomcZkyW8IlJwTZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GaTpZBC5+zPu9T974R08OaJ5yi5K3F1N7qT/AR6Jq3w=;
 b=U6B2Ln04btqAYXSqU1yf6YB28IkqFe8iPsDwSfA6efxkoFbo+pU+7fZCDD7Db75Tp5tF2PTo5n3tkytdabg37R82Mhq3dOFKGIOY1axhrrDENcVhjw7YfZaiQ/ouApx00sVvxYMBWP7nMac9wu+335sWkr1dTOtyWQquzz8qzTmF9/CDCLvSsqZc5td1Sbw1AV6xhlN9JGYNhcc1B6uB60k8QRusFj06tR+ymmcL0N+16ah1seF7WhHu2hJcukwjiBFqlLtm57qFCSg9BvPT1OYPZg6JqtML7pEYY07JLDiIJrXVcbmR2at6t/cgscPxcrqvG+3GVPpK289C3CnsXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GaTpZBC5+zPu9T974R08OaJ5yi5K3F1N7qT/AR6Jq3w=;
 b=HdmTjCnh1P3kO4xBoET9kdP3h8iO22PeecM+krW69fDgMopjQBOXv862zG+uvTZJrx/GKt+ED/72YtZwg/nXlr+f6QW7TM20ltH5G53a97czjeh0BF5RgeOisNRp9sbXtnVpniMj8o9JhNwAj7DsmlfwK8AJ5mcoYB/fyGIGhKQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR11MB1792.namprd11.prod.outlook.com (2603:10b6:300:10b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.22; Sun, 3 Jan
 2021 04:52:54 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::21b9:29b6:fd3:bca5]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::21b9:29b6:fd3:bca5%7]) with mapi id 15.20.3721.024; Sun, 3 Jan 2021
 04:52:54 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org,
	zhe.he@windriver.com,
	raj.khem@gmail.com
Subject: [meta-networking][PATCH v2] ebtables: Add symbol link /sbin/ebtables
Date: Sun,  3 Jan 2021 12:52:42 +0800
Message-ID: <20210103045242.271676-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR02CA0166.apcprd02.prod.outlook.com
 (2603:1096:201:1f::26) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
Return-Path: yi.zhao@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by HK2PR02CA0166.apcprd02.prod.outlook.com (2603:1096:201:1f::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20 via Frontend Transport; Sun, 3 Jan 2021 04:52:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ba436031-76b2-4fa3-eb75-08d8afa36eaa
X-MS-TrafficTypeDiagnostic: MWHPR11MB1792:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB17923AFD8C56B268F4F1BF60F9D30@MWHPR11MB1792.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Iwr2DYZkEFqDpCJSyui3O2BYokudIozzBmH+cwYfIpBK2NAE/xPy9fYrTiHqB8/q83cpESBe4qopPcs/pKwu3zfRV43nM75rVlYbzXGRDdGhPOIYaLjQoXPpYwhT0ELJQ3Y69flX8uEECWTOrzhG8p76k45VTNzSVGLJhxvPHR3jp53xwQcgaftdE1zMgq1zCPVXZXrT6SdKldrYpxcE3F9z4hHYTIzCAdwGtBSnsbDW8zB8ZS0ksyz2H32pTZdmEc2l0bBMfeSPnkYtqNtdlna284prSYljYNFN776id2fDh6dF7WSIblyqHCKD9ayiG4nnp5rz9g01QbBeFAdJkOfUOQAbBgzth5B+X/dHvLx8Gi4pBP5+wl2iZEdjQ4Tu
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(39830400003)(376002)(396003)(346002)(26005)(36756003)(6512007)(66946007)(66476007)(66556008)(1076003)(316002)(6666004)(8676002)(44832011)(2906002)(16526019)(52116002)(186003)(6486002)(2616005)(956004)(478600001)(8936002)(83380400001)(5660300002)(86362001)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?/Mj1/DUpKOGOXjP5eqxOby339/SYYxXwqsBObnQM6tLHn6AonGwe9veILZ+s?=
 =?us-ascii?Q?fiQxOq3srh8wA7lTQqrTkFgthOdBULWPjYp7jvPbuYFwHsMNyZPN43JQ7pWZ?=
 =?us-ascii?Q?q/hwHaEu72fU50PBT2dFBILlhqSm9xCfx3GaQgCidcTDX0ruXvLc8i0l5sIH?=
 =?us-ascii?Q?39Ip7sn4eSnq1lvv4KPjEZPUKYyLRhT7jQ7pLSYIiFLP7VTIISxLBzgeGQ9Z?=
 =?us-ascii?Q?372SNb//yJF8jbZux1jAS27FEqorTIyvqh2EoRQxNXQw8p935vlTiWFo89cz?=
 =?us-ascii?Q?udVX/7m5tJAkjsUvgxKvjPs6qCDoZ9lqj4A0x9SZblu0LSHri5JK8y6Smwsc?=
 =?us-ascii?Q?RfUzNa8NtgwahZz1WFgQ3UXRZUDQa2PPNzZZg6DBcdDuBWh/hHAYVk/6im6I?=
 =?us-ascii?Q?77Y8ecRu8BjlnRRWqtn9Dml/zSAS66GP/yAZr1GvOkYNIPRnnvDNM79pOm/s?=
 =?us-ascii?Q?RF/ASTCdX1XIfAc5cQZf5zsm/U1noehu8c0zE1s9zL9kRipmNlU5OGPvEbSf?=
 =?us-ascii?Q?ciuI6bIrWeYp1XSHj+vKjNkLGyRyyuvoAUWk22jnrEHibMCoPqI3MfqrSvKS?=
 =?us-ascii?Q?U6kG4u594qhNVh+7f4mcpO4tT5q5kHfZ86/I3HB9wyV215u1n0MrPQWAwa8t?=
 =?us-ascii?Q?84yf6hsBuT23aEVV/mqbF3bqrUojT7r8jwx07yDR/KsL9L5d/HpZ+1mrZ0eu?=
 =?us-ascii?Q?ez2tRMiyLKXUcZMp9Ul6i9BF/EcCyQslPy5RNbrxFe3R8LFkeo5o6IupPyBS?=
 =?us-ascii?Q?y7NEEQrSmjiEW1mhPOtQfWxIZz8G3iIn8XwNRElEIliNMYEaA+uS+HecmVv2?=
 =?us-ascii?Q?E8uMQ+/WvMDwZYkZL/uF03U4vdH2/dEP7rLvHz4X/jhG2Ii8K3vdZ2WrXuPC?=
 =?us-ascii?Q?iHzGYVBgPhVNjJzERjDZ0heaU+kLRYnpnijQaSE8Mw+36d6Zw4MsV/95Hlr5?=
 =?us-ascii?Q?1qrZSvobHhbg6S6sxuWz5CYFlFMMe7jzEVPNNr7Mi+A=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2021 04:52:54.2338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: ba436031-76b2-4fa3-eb75-08d8afa36eaa
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BubE1voiw0z8WRueK4lLFVGKR10KfliswhTl7A2WFOoOsX0Se75RirogcEQWKXG0jG0eA3c/e8InlnRYPo4cow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1792
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

The original /sbin/ebtables has been moved to /usr/sbin/ebtables-legacy.
But the old path is still used by some other software libvirt.

libvirtd[809]: direct firewall backend requested,
but /sbin/ebtables is not available: No such file or directory

As stated in the related change in ebtable git repo:
The new -legacy binary has no problem if called via a symlink with the
'ebtables' name, so users can still name this binary with whatever name.

So we add a symbol link from /usr/sbin/ebtables-legacy to /sbin/ebtables.

Signed-off-by: He Zhe <zhe.he@windriver.com>
Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
V2: Create /sbin directory before create the link file

 meta-networking/recipes-filter/ebtables/ebtables_2.0.11.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-filter/ebtables/ebtables_2.0.11.bb b/m=
eta-networking/recipes-filter/ebtables/ebtables_2.0.11.bb
index c13ed7b3b..bc33c18c0 100644
--- a/meta-networking/recipes-filter/ebtables/ebtables_2.0.11.bb
+++ b/meta-networking/recipes-filter/ebtables/ebtables_2.0.11.bb
@@ -38,6 +38,9 @@ do_install_append () {
 		sed -i -e 's#@SBINDIR@#${sbindir}#g' ${D}${systemd_unitdir}/system/ebtab=
les.service
 		install -m 0755 ${WORKDIR}/ebtables.common ${D}${sbindir}/ebtables.commo=
n
 	fi
+
+	install -d ${D}${base_sbindir}
+	ln -sf ${sbindir}/ebtables-legacy ${D}${base_sbindir}/ebtables
 }
=20
 do_configure_prepend () {
--=20
2.25.1

