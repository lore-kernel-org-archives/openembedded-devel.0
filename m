Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63B72C64E67
	for <webhook@archiver.kernel.org>; Mon,  4 Apr 2022 18:46:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.9059.1648880332136831935
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Apr 2022 23:18:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=XPjjh1vj;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=10916e8d2c=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 2326EJ3G013425
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 1 Apr 2022 23:18:51 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=9lRi1F1F9TItzCH0uuCjYp31Eie2HajfiVsDCfwU2K0=;
 b=XPjjh1vjer2qe9i5QlJddLJDDT8SDNpsttggfEbuFWcNUSlfHSMARARFWfxL6uh9j8qQ
 gAYMZfNiUgFu2ryFrOLMc/l+IUL2kkskzSGXLhU2Y2aFV+SIFibkZ1D3kbYrtyk3J7kR
 xLlldWBYrEqIQEUov5yaQYwvJHmbv5fCTrbAKhwQo+izpFtdOTOdtJy09w0wPa9Rbgme
 T11Wp18j2BM6cTjB3D+Z9FlgNvAtyeFqjuqBt3PhIw1I2qYIhmAK9VevYZ6JgdKOVTtd
 ar1HWzqNKoebCAT8IiqDioXj7dUc0b7GCSIxpIikEZ6hw2gWFQtbmWRFqjSCoeErln3/ TA==
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2174.outbound.protection.outlook.com [104.47.58.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3f5y3kgt9n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Apr 2022 23:18:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UoJYO5E2o4uEsq3oVlMGlfejrpoX+M7sQs/ZtepOIwW5iIlDRNFXFSRqGJ7erqnnKKsFlFSoa+FeV2/GOckvwVfkJO3vUUA7ayq3uoWj175h7rCoht2XFmpb4wuE9jD+zWKizADoYQzoJcNHMK1G1+N91twONzHg3IyQ98YB2JCoHO/cMH4KM6W2/Jd+TTRMEaId4lQto479Q1l9j/iRAIoffHTBziE9qZcyITdyF9OXf5BbrU8h+7XlgIFUvl1k4zGp8iWOoM+F/1fYoQt78PEkALkjeoIYDEVz5uH7GU/cFYdtQ5ne9mK9keVyBbLzoTyeMRPSfN8qBnTCu3dt6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9lRi1F1F9TItzCH0uuCjYp31Eie2HajfiVsDCfwU2K0=;
 b=Brf8alQu9+DSFbjR132dQvUXG7zWM/lIuCqZl226Yr1eTSNd3fOUKKQgIDjx1cvWaHxJKJJC0RK5WqFZqcudceoXF2Xw4+5yFAw3YbhGu4mjAuG+0lWXZs5o1+Lu8z9ep2LCdty2IpwJfKJRzFJvhVz5E2NIvxvSZM9prkdGvRYB3gUPCQ1gVtFX87uo4sSvWmNclnRrYvA4FL7AIcpfHmzbuTDY8KT00GRmnSfPIdVrwO6a6hh/trdtZm2zz5mLROa8jsZlXCXIpSwadZfb/OkuxeDlSRjhHM3agrcEEDYjGlUZNHPxI9m/BEu/aTy9ap/neYacRgOEj69RvI1UTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by BN7PR11MB2849.namprd11.prod.outlook.com (2603:10b6:406:b5::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.26; Sat, 2 Apr
 2022 06:18:47 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::f0d0:2344:b876:db97]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::f0d0:2344:b876:db97%7]) with mapi id 15.20.5123.028; Sat, 2 Apr 2022
 06:18:46 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-networking][PATCH] blueman: fix python site-packages
 installation issue
Date: Fri,  1 Apr 2022 23:18:35 -0700
Message-Id: <20220402061835.26483-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0099.namprd05.prod.outlook.com
 (2603:10b6:a03:334::14) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c428b786-a1ba-4ecf-7511-08da1470a4db
X-MS-TrafficTypeDiagnostic: BN7PR11MB2849:EE_
X-Microsoft-Antispam-PRVS: 
	<BN7PR11MB2849230EE6E307FE05E51FB7EDE39@BN7PR11MB2849.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OLvwbnRkgQpOEbxOZfaIpJNneak1URL/xB4gVgpLBph/zG91Na6EgNQ0D9IXugEKlP0NMS2VeTTrvjRpcvgWsBku49/2YEyTEIKRjFhboxnCR6iaClMsLZHxhVfhGcD3ZYpCze/LDmeVEHvT+XMQPFHR7Ak2uFz4slyLX0NTfqxm3a7geiizdax9qFDjqaJFFCpNUOeICrgLQ0YfhHwzc5kXeAkIVuvvvzoX4vTsXMJSLGKGAvmAGUGDqhZaJyhTu39K+lSfAaQk364W9wh83y+Phzj6/lt4W7tUEobC2cpjlIQavSE8EwXhrZTBuL9RiLJmJk0LK+OdtkalZ2J0g23lBAe6CmP20qIRWetMGf1+tYkF/ojReF21llgCt2xEPP5NQfeqehfsYvZTsBUhbsLJWBqhwANtaVc4GpWWA9LACkRU4rR5IdYMTTlJWwo22MzaBeEZuRn2wZWppRQEz1y42XVpmQKuwyBrXIU7h2Duyxx4lV0OBS3n7ovIgkqvy3Qw/ddCQVDEEH43WvZtguiLIsv98dzmHPuG1CRTT9J3n4gTInQHdL8LXHbuojCiomhJbRfWdQdafVoiPJdmzY4pP/AcavHKN6uTvGRJSP9HhSKUiPQZZi/bsHIT0lwuL/5E6X/xAchhq8bEzdyCLxC0N7LBhRzNM0ONOiJVVe8m3AehZ7mIvhrGJvkBz2lYdf8FftuuOG07tfgTn4BgyrOFJ00M9scwLZ1FYGsqxtIvKrWbnCgFmQ3xN5AuBaNtXQp09CFaRR5M2b4OjiFX9/WbaU38vDW9RPmhk88Yz0AmMjDuhNnAx/MwKvCM6aSD8dG/Ad1P2DZM03CW4KRDCQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(5660300002)(66556008)(6666004)(6506007)(38350700002)(38100700002)(186003)(1076003)(52116002)(6916009)(86362001)(26005)(2906002)(316002)(8936002)(83380400001)(2616005)(66946007)(8676002)(66476007)(6486002)(966005)(36756003)(6512007)(508600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?YgRW0h45jvWcGpU3/pkIGyAUbaCVXdkKsEPjZDL56/+w5GGg488ZnN3eMV4e?=
 =?us-ascii?Q?Ox1FJLZFshj4i9W+q8AG/vSsG4Xy7IhDKaEc4TkX0bcJK63vDEa++kNJIIh0?=
 =?us-ascii?Q?YElSM6yPPKt7uSGJk2YMiLGdpKnKYZfbOZ5lQ6rDaQP1WPUMfMuu/rL5QwVR?=
 =?us-ascii?Q?Zn64PWSlfO/lJRhZxsgEsnI9p2hyJoE0E+Ewab6MI2m8rlrza1qHqKEvmWML?=
 =?us-ascii?Q?AAljwe6sOnLX68MEyA7xkzsQWQxMXW9Lf8vVPBToTGqKGws6bDDCSpBWe+Ot?=
 =?us-ascii?Q?EaKg4x4A5J19kL3uw2PN/NY0hZQBVe/OxSmCvFPxa+vBPczFaQaxq41XCpqS?=
 =?us-ascii?Q?u+HoB9euan0ww6AS1oWK40AaR2w2iHa7FqLmjMZKTcD+EEsDbDVGHxrSj8iO?=
 =?us-ascii?Q?5Gu8y3P1eBTN4hDizjpnrgyucbQRYFQU3wCIiLk6r5Ffsc0vyj2glksKqo4Y?=
 =?us-ascii?Q?w+9gq19Wbvfy3b7fA3GePDsoVj9XCLfW2CqhCymGfjAuc7R2WVazb8VO9RoL?=
 =?us-ascii?Q?1hLFKV+b0YEBlgaQ0eBke6Wq4FVfJwO1u8p6tAxz3baF8wzDPIVRCd7ggny+?=
 =?us-ascii?Q?C5oRYAVfIXrc359U0UYbhLNGn6hrZxOYrZVl5Bp5hf1ZOvzwCpALqcrjXXQC?=
 =?us-ascii?Q?Bves+08Bcy7wbIztaGI1swgm2wFRfDC74v3Gu61MUg2r7009pI+/gf4H8GHO?=
 =?us-ascii?Q?nJsuGXFFH9+AaeZDv3wsKnfcmlGIPX62DxZ/ttRQON6xFnBpaXb0OOQrlBsX?=
 =?us-ascii?Q?qTomiVUBjBE/IjH1A0NP6yjm/nPpJUN9TNSREInBXHFQTc8lJruFPSiuih4g?=
 =?us-ascii?Q?ocVgJdAwi3dI+Fmd2LUp7T+AeGrhYveo4cbvYXr1fP50aVTNhk97gyLSCtrw?=
 =?us-ascii?Q?csnrbAP02cJ/3K+PLnXEElHlaCjkDbIpgxcEk5RUHP3KBgW4qszVXNch6Sed?=
 =?us-ascii?Q?pn5FohvrxqPnKOg6B96tACrYThYBCJfzalBMIcv+puUDjHUO/48n+16zlC4q?=
 =?us-ascii?Q?nFbpU/5DK58EC5Oh9ZNLtdu06cDqE06S8XmEg3FROYvy7E2X6r2C/SUn4zS0?=
 =?us-ascii?Q?Jalnsy2KZ7o5meh7pJ1Jhez8M3yJLrJqlyYONE4O8q7mgNQh5BvUMjgwTczs?=
 =?us-ascii?Q?0OO6Eikxn6V9VeHFgHO2IaX3vwKLroQWpyMAHJogend4rT91Xuz+xpc4GVqZ?=
 =?us-ascii?Q?vVD8B+0/gpg/oDNnhzBhkuh+tPY6+AkPYYg0/jy0Bkpn+SdHW/S2gMMEP8Fz?=
 =?us-ascii?Q?AHZcg7I7Pl+qHL6/Kjp+riKrtblAIFopCAozHxusbpABoAErHZCPe7CISHdL?=
 =?us-ascii?Q?nWAIbLWEbIa7MEeFegwoIfES0/A0oKRnP8vDuIot3x0jQWhJ9AU/mBmxVTf3?=
 =?us-ascii?Q?5bwrtiy3BBePqrN3HEkM1czcjVWVEvZByAgS+Y6AKKnYfUYoMaNde+cXfjyH?=
 =?us-ascii?Q?dU/N1JsmCfko3JPFUGhWwFgecU1tWBTpGtAssjgjy/HXab5fWnlu8lC/dJzM?=
 =?us-ascii?Q?rU8UqjhSZGZtUQ4hMlTUP/z7lk5PHrdw1Spi9Od4egLC9q1oVjrPfk13ALy5?=
 =?us-ascii?Q?kxR/tUnhLTdUJ3CifwDdYAHvYzk8S36XMv59RYFmTaKsfsGiavUmwVSJBCUw?=
 =?us-ascii?Q?VzMVGFkGg3FJUw73XuCfShihCR5reOo9F6V0Ieyc7KlrgaatUkvJLXKmiyCO?=
 =?us-ascii?Q?sLxXN0lUOD6Dzhzdv5cOWX8f9ZH9H4YIMdolCBYCjXHyUyiNMD8L4Y7YWrFJ?=
 =?us-ascii?Q?CrCp9o5Uy5ZACgr09W4bXLhMpL+ieCk=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c428b786-a1ba-4ecf-7511-08da1470a4db
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2022 06:18:46.3115
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 OhUmvo6J4fUP1aYaj1HYdqFwwtSESq2O63ifSmSvq/Ra0i7FcDW29uliTwxYv0dhbQShSj0jDiVi2qKIuUoXHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2849
X-Proofpoint-GUID: p2s-mKTe2aXPOzGGr3MUBmCWFf9h5yM_
X-Proofpoint-ORIG-GUID: p2s-mKTe2aXPOzGGr3MUBmCWFf9h5yM_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-02_02,2022-03-31_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 clxscore=1011 mlxlogscore=999 suspectscore=0
 lowpriorityscore=0 phishscore=0 mlxscore=0 priorityscore=1501 spamscore=0
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204020038
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Apr 2022 18:46:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96343

The blueman is relying on host python to determine the target
python site-packages directory which is not correct. Add a new
option to fix this issue.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...01-meson-add-pythoninstalldir-option.patch | 49 +++++++++++++++++++
 .../blueman/blueman_2.2.4.bb                  |  3 +-
 2 files changed, 51 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-connectivity/blueman/blueman/0001-meson-add-pythoninstalldir-option.patch

diff --git a/meta-networking/recipes-connectivity/blueman/blueman/0001-meson-add-pythoninstalldir-option.patch b/meta-networking/recipes-connectivity/blueman/blueman/0001-meson-add-pythoninstalldir-option.patch
new file mode 100644
index 000000000..a52821915
--- /dev/null
+++ b/meta-networking/recipes-connectivity/blueman/blueman/0001-meson-add-pythoninstalldir-option.patch
@@ -0,0 +1,49 @@
+From 37f24a9bd62f0a8f3e37eaddd33f2f0c9d3aaa0a Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Fri, 1 Apr 2022 23:12:17 -0700
+Subject: [PATCH] meson: add pythoninstalldir option
+
+In case of cross build, using host python to determine the python
+site-packages directory for target is not feasible, add a new option
+pythoninstalldir to fix the issue.
+
+Upstream-Status: Submitted [https://github.com/blueman-project/blueman/pull/1699]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ meson.build       | 7 ++++++-
+ meson_options.txt | 1 +
+ 2 files changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index bc990cd..a37aacd 100644
+--- a/meson.build
++++ b/meson.build
+@@ -26,7 +26,12 @@ pkgdatadir = join_paths([prefix, get_option('datadir'), package_name])
+ bindir = join_paths([prefix, get_option('bindir')])
+ libexecdir = join_paths([prefix, get_option('libexecdir')])
+ schemadir = join_paths([datadir, 'glib-2.0', 'schemas'])
+-pythondir = join_paths([prefix, python.sysconfig_path('purelib')])
++pythoninstalldir = get_option('pythoninstalldir')
++if pythoninstalldir != ''
++    pythondir = join_paths([prefix, pythoninstalldir])
++else
++    pythondir = join_paths([prefix, python.sysconfig_path('purelib')])
++endif
+ 
+ if get_option('policykit')
+     have_polkit = 'True'
+diff --git a/meson_options.txt b/meson_options.txt
+index b3e939f..96acbbc 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -5,5 +5,6 @@ option('pulseaudio', type: 'boolean', value: true, description: 'Enable PulseAud
+ option('appindicator', type: 'boolean', value: true, description: 'Enable Libappindicator support')
+ option('systemdsystemunitdir', type: 'string', description: 'Path to systemd system unit dir relative to ${prefix}')
+ option('systemduserunitdir', type: 'string', description: 'Path to systemd user unit dir relative to ${prefix}')
++option('pythoninstalldir', type: 'string', description: 'Path to python site-packages dir relative to ${prefix}')
+ option('sendto-plugins', type: 'array', choices: ['Caja', 'Nemo', 'Nautilus'], value: ['Caja', 'Nemo', 'Nautilus'], description: 'Install sendto plugins for various filemanagers')
+ option('thunar-sendto', type: 'boolean', value: true, description: 'Install Thunar sendto plugin')
+-- 
+2.33.0
+
diff --git a/meta-networking/recipes-connectivity/blueman/blueman_2.2.4.bb b/meta-networking/recipes-connectivity/blueman/blueman_2.2.4.bb
index ea06ee67f..d5aeceeb4 100644
--- a/meta-networking/recipes-connectivity/blueman/blueman_2.2.4.bb
+++ b/meta-networking/recipes-connectivity/blueman/blueman_2.2.4.bb
@@ -10,10 +10,11 @@ SRC_URI = " \
     https://github.com/blueman-project/blueman/releases/download/${PV}/blueman-${PV}.tar.xz \
     file://0001-Search-for-cython3.patch \
     file://0002-fix-fail-to-enable-bluetooth.patch \
+    file://0001-meson-add-pythoninstalldir-option.patch \
 "
 SRC_URI[sha256sum] = "55d639feeda0b43b18a659e65985213a54b47dcb1348f3b4effb5238db242602"
 
-EXTRA_OEMESON = "-Druntime_deps_check=false -Dappindicator=false"
+EXTRA_OEMESON = "-Druntime_deps_check=false -Dappindicator=false -Dpythoninstalldir=${@noprefix('PYTHON_SITEPACKAGES_DIR', d)}"
 
 SYSTEMD_SERVICE:${PN} = "${BPN}-mechanism.service"
 SYSTEMD_AUTO_ENABLE:${PN} = "disable"
-- 
2.33.0


