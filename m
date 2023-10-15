Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21EBFCDB48B
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 15:06:28 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.60])
 by mx.groups.io with SMTP id smtpd.web11.90066.1697369032343148425
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Oct 2023 04:23:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@welotec.com header.s=selector1 header.b=duETM+ox;
 spf=pass (domain: welotec.com, ip: 40.107.249.60, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ft5RHj+gWC4z6Qv34l8HJBXgiB+PBbpapAEUpVj+8ATRdHI/66QociDrvZIeDuDkBzw152OtD+oAGdFpmEmkMfzd8XD8UQmw88p0ZdZjKV+u6U5K2Bp7jdTrw5PJ6BBmU9l35teedfmoEdfns5VgmRsvZ6VwQzXZZslxIQKNdNaTPZIHgS9RTx8lMUyCeOBadZMBdFn3TCVpHKzvKT+S0Je7s2kavuOtiA2Vz9Hyr1dlbNvkkLVBfGyrRo7mEZu8UpduGmYv5KkSmDk3qtyCH3TiFwkWb9FeXF73dbjdvsFK2bPaCF8b+9eJkrEpSr8yB0CmFVaHgFlMQmBD2/FCdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eED+SE16zxfd5KCIEFI+rPVPpfJS2w3L2Q1srcPDrmM=;
 b=O37CmQbu8fn382crIK3gLrkAiVccnh9KYeD2t2bsieo1i/CkT4XcjwfdQb6NFTba/h2DWDU/YQWAiJ5lvIq435BNjcuUlCWsrfwH0vkxLOJ5h4h+EedGINg4vO+5Ihr0hD/Vjt34kRoWQ3OSLGRrcGIs6pd2tTdQszI6E4rXXtV/yOToYNL3UtI4qsl8FcAmdqSINtvuyt+tv/b9tbIdhC7C7QXs9q8ovKSG7ob1KuCEHqde9YRUWmQH0VR2bzBgcnkF1hgoqK/hNfOWvrYKR6CQeNca+D9xTqyIQH4/Qg8F+wkc6ycasZ+adYBYfOt/zfy+50EefQEZbJ2YZGSQ3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eED+SE16zxfd5KCIEFI+rPVPpfJS2w3L2Q1srcPDrmM=;
 b=duETM+oxsneY3cXkKORE6u1/voV5DKmsXLvw3q7zhdK3bcNwc6111Lg5P40GTCuduFvR0+8wrNSSBqEWP7Nco/aLXaJ/zgUpivIHAuMoZS9ikBuGGke/mYTFY5+nZmV5KbdlpsIJecbo7UkeyzWv/gooeasCW8FzhFHkPDzuoWaentgBArGMCP747gTJY6Zv5DiumxZmDnPSdfnoiuR9E4T0T9PnVq4R1U122LHJT96Pck+lkTU55isyarHCvQEbB4A/k7KZzZYg7aDwhYJs2VbZ6ksiu4E+NU5vkkK18VERv58+B1KPJX6uV4N+SPBkO+lvKqmpIPyvUj1lqXOwvg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by AM9PR04MB8113.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.47; Sun, 15 Oct
 2023 11:23:48 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3%6]) with mapi id 15.20.6886.034; Sun, 15 Oct 2023
 11:23:48 +0000
From: =?UTF-8?B?UGlvdHIgxYFvYmFjeg==?= <p.lobacz@welotec.com>
To: openembedded-devel@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v14 01/11] package.bbclass: override tar with tar-native
Date: Sun, 15 Oct 2023 13:23:26 +0200
Message-ID: <20231015112336.55722-1-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.42.0
X-ClientProxiedBy: FR3P281CA0100.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::18) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|AM9PR04MB8113:EE_
X-MS-Office365-Filtering-Correlation-Id: a3a5e7db-bdec-47fb-0cc3-08dbcd713346
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BLpTz7904iZu44grn8UpIohnW+P6hRXcPMg+EdDqD+iPOAPsSh24fW4Vbk4ahB+tPY+5drJJltXJjLNxqoBxPJX+nZZjFHeyLSbk9NCW5LRtDtbt39eqAt+LlJ/TUaxq+hk9E8Kbwco72AoY9ssp32oKE51gzJ6T7VuCUy1K0gnzO1RSwRIyt8ptJaSaIErw92r6UK1uZE3mbVdi83jtnTjBo0oKcBCVl9OIwipW/kMs9I9jJXBGiI2KfzxQEYnAaKB8/UhAysIByp48D3Eo1Dwz2TzFXrOQ2y32XKmdtY5iXxTsGU3M7eruIJBNnwm2+grX8iuxsYb4c61hVjzK7Q3C/VI8CPksStvOKUxPoVD4X4fVDPqwTgQxZ5u5QUyijLsL3xv+PEUhT89yXTWm08nbxceReTk07015M1tAV1QVBQKCvuM3Fxb/Qp2iZIz1hadXmUJIL1DOb/OG5mNvDgx/dO8Km/IfjFMLS5te9vjO+Wt9mk+g5eBUqxlxmpxWKE2pSfh4eXNFgUWPNM+PfJUqPhg4VgWv5hNoQECUpy5sfkh3dsFhF+AzZJfy4T4HKXwWqhhUfxjUpu9wS8JFgFoc8BPRCySlxG7StYbVgyA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(376002)(346002)(396003)(39830400003)(186009)(1800799009)(451199024)(64100799003)(478600001)(966005)(6486002)(66946007)(6916009)(66476007)(66556008)(6666004)(83380400001)(86362001)(38100700002)(316002)(6512007)(66574015)(26005)(1076003)(107886003)(52116002)(6506007)(2616005)(5660300002)(41300700001)(36756003)(8936002)(8676002)(4326008)(38350700005)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ClGlfWKDlXV9RA0LkPMbE19slb/Q0w7YxcN5ccZczGfxabFhtzVdnES+pFhh?=
 =?us-ascii?Q?f+93W5AVNERyFYTy2zXnhlwZCcnZXT8Ou+Iead4X7KDtIp+GW4Hbxvbc5dPz?=
 =?us-ascii?Q?q/P8C7cC4V/GHasSh/tSH2M39d+fdaScecrehc9b4q3y7Jbr+prJa3WF/AQc?=
 =?us-ascii?Q?v8Bl3uoEAeS2QB7bZMkydTak9QLCANvnciRWlSuxteyJUJ4p4eKUAsshYsTE?=
 =?us-ascii?Q?ZKp1dRvArZEPZNAh4+t5YzTV66FHjypGiuM0ElM+f/mWJAmo+UB90yu08LMw?=
 =?us-ascii?Q?Zc8hAD2z0TtI5T44aFk6VRtDCM7sEts4uCLX1R1DhEVjbJNZRgPK0f0j5seX?=
 =?us-ascii?Q?pAv7QkyWBuSH8NSA/z10jlnSefHSAumMNVfbV4fGVTSjHhz1JzbMkXJURA8x?=
 =?us-ascii?Q?GMZMEtayW/GX+cOmy6Xnf80aWp9lYbNRMkgi0NBwy7funApjzh/8whE1xipS?=
 =?us-ascii?Q?EyMhe7qSVWdJfcY645O0Dkpuo/6xBTt0lk5G46lFhe6iffu9PmiEf6u5XhqS?=
 =?us-ascii?Q?5fMf6LmLdnt3zBGpViYccXC4mQuEFTB/qr5Jlf5pSH4+38YzTW60X8KU0Y20?=
 =?us-ascii?Q?/U/UGwPCGBNE9FAhGikskBNvg9BkOXEV4MQXx9vUUeSrvwGsUY8zrrV8d/Tp?=
 =?us-ascii?Q?1+2xWbsbcRZv0lyuJ9yqORlwtO8212UG5zMhUI8Us+BK9Aj19iKFkIT46BTv?=
 =?us-ascii?Q?RQzSb1qWNCuHuUE9W66w8vhG2SeEQtnjFClpFit32PzTz8dA/aFUv8I1I7/a?=
 =?us-ascii?Q?Jr8NslMT7Pqlrfi8upAyqQWvkhukHCCSs0pDBXbPEh7DdmYkxm4d4NJqrV17?=
 =?us-ascii?Q?soGk3Eok1LbDcUm+YIaLpYuGduzP8XQbzndNen2nUjkQH86h2+ynVuZ7EqJ2?=
 =?us-ascii?Q?dgcaX7KnjaY4y3ovfjfhbSLsbMO9TN7alVmklmuq+G4IKVBe/WsBgFE6CnsQ?=
 =?us-ascii?Q?oGiFJmcEPIn/ODB9nT1sxrN5en6fxF81Tq0Uyk9Cj4lCix/BUZm4HQORfYEv?=
 =?us-ascii?Q?CQAJoon202JeCIL+HtlMMHqt7OxOCjvLaJBjKPbvvPnbTpcFVvOQGNRQ2vlQ?=
 =?us-ascii?Q?Mz20moyRG9S+zdhzKfjnQNrsH9jd39W63bBYczS/NXo/gi1KYFyKKbrvHzJ7?=
 =?us-ascii?Q?IVpQ88koS0h4rG4hAuCCj1OoAoveUElZ+V+N+24KXQZsf0pJOiPo+salftMN?=
 =?us-ascii?Q?t6IWIVYKH2mn65Dunv0eJyAQk0AUIp/4FcpQMWoQTJLgz7wKKYc9uFhrK9LF?=
 =?us-ascii?Q?weBtDhzagGH1ppwNWN+q7GWoU8jTQATxYUPuPNKavueJ7cHCESZGTojFsSz8?=
 =?us-ascii?Q?OlkA8kJGiBwhNDtb4N2xMgd53kOxOPNeqZgdOkk8yhI5rXhB70tmjmqLV/ML?=
 =?us-ascii?Q?il2lQnY3+JRf37strMK7vrr19AboqEWEPbxVM5gMYqyR3uDKAJ81kdTOR3yd?=
 =?us-ascii?Q?hQKVgqtMj4GAg1NW+2q/YZw4GMJlcdc7B180FICf9gbsJSIrPQqZQzzpoXYi?=
 =?us-ascii?Q?8AP3YqEm9ldAX6Wbt19ZS2Nc4mOuBH+Fhgh7Gi0ajzC4K5ot5gA/hZQIkpJg?=
 =?us-ascii?Q?dkU9laX1fNG1wa0RzYo4EzLiE1XxF15QXNvLbuuS?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3a5e7db-bdec-47fb-0cc3-08dbcd713346
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2023 11:23:48.0241
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eMgdSLJ8+qDc+I7Pgg5gLcGDjVjqEHhuGzlGryNoSZVFbVEWA9fmFwFZPLo0M/EB7cUDgZD4WpfsDwnx+Cea6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8113
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Oct 2023 15:06:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105530

Due to the bugs https://savannah.gnu.org/bugs/?61934 and
https://savannah.gnu.org/bugs/?59184, which are fixed in
tar version 1.35, we need to force yocto to use it instead
of the one provided by the host machine.

perform_packagecopy function and opkg-build script, will use
the tar provided by tar recipe, which is already in proper
version.

Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
---
 meta/classes-global/package.bbclass | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/pack=
age.bbclass
index 7787042e21..580884cd83 100644
--- a/meta/classes-global/package.bbclass
+++ b/meta/classes-global/package.bbclass
@@ -58,8 +58,11 @@ ALL_MULTILIB_PACKAGE_ARCHS =3D "${@all_multilib_tune_val=
ues(d, 'PACKAGE_ARCHS')}"
=20
 # rpm is used for the per-file dependency identification
 # dwarfsrcfiles is used to determine the list of debug source files
-PACKAGE_DEPENDS +=3D "rpm-native dwarfsrcfiles-native"
-
+# minimal tar version 1.35 is needed as it has fixed bugs for storing ACL =
entries in textual representation
+# and extracting files with xattrs that are read-only; this needs to work =
only if acl or xattr are turned on
+PACKAGE_DEPENDS +=3D "rpm-native dwarfsrcfiles-native ${@bb.utils.contains=
_any('DISTRO_FEATURES', 'acl xattr', 'tar-replacement-native', '', d)}"
+# perform_packagecopy and opkg-build require tar to be in the PATH
+EXTRANATIVEPATH +=3D "${@bb.utils.contains_any('DISTRO_FEATURES', 'acl xat=
tr', 'tar-native', '', d)}"
=20
 # If your postinstall can execute at rootfs creation time rather than on
 # target but depends on a native/cross tool in order to execute, you need =
to
--=20
2.42.0


