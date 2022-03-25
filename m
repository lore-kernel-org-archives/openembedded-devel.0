Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B58B0C433F5
	for <webhook@archiver.kernel.org>; Fri, 25 Mar 2022 19:01:11 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.890.1648234870270013520
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Mar 2022 12:01:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=V5JFv5ek;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=00833d520a=saul.wold@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 22PIHj6c021585
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Mar 2022 19:01:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=z/oZ9oFCWqjdyxE7l+sS5jegAfcIqKiFl793YiHwCyQ=;
 b=V5JFv5ekeIMCsmOhU/4LRncPuh0DwTF8zfFkzBb2BygIf+06Ol6I7civrR2+XHad57h2
 t32mu2hsHnWZcrLh9ABomtYmNqSus4CZEQljwTbLxFrji7Nb49H1ZqHsBvumq5WLcmiK
 qQYS9g60E4SwWPXlMG+iwhjEiMJURcv1QGzkHE1823GC7VqQ0O9mJqHq16Yj8pH/O9F7
 BFGflrg03yZXGf5G2s2q192DxfUWQF6Z8ZKPLahsaEZzghACu0YyygQJOdQuvntP83QJ
 afv+AnsKmRC0GbgyLqwuK5k5C6WGUhsG7raGOV5jmLDgOLvU85e4BLO7CIAHkAUuwUsb pQ==
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2103.outbound.protection.outlook.com [104.47.58.103])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ew657dqr8-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Mar 2022 19:01:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YA1jIQmiFxpSKI5/sk8VRkO6SFRQDDuRo1M0qO2++dSSGXkf/v89dAPR+MS5Jm98TBQNXUDPVKxt/ohrVVCvnPom3M/1MqcbWP8DFI6TSqy0Hw+RgLNLzKa1IucmK+Ja+elADElhUg428XHGf3A95pwbt1SFEBnXquedjQLkogLavJyEA0YHBnWg4D+81WPWW72NcRNRNAjXSMo2r+O82RXAPWqFiMZRR4j2K+5UAqkVmEop6VZVtNvb0TIWFckXHnNDiySmDQWST0e4lx3+EL4w9Wnh4W3AuI3k8yNNIl19oyMLffsQA4cnNxAOjijD3FbWNCjl7+wqAU3tVwNhEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z/oZ9oFCWqjdyxE7l+sS5jegAfcIqKiFl793YiHwCyQ=;
 b=R3OPHGjEZezjjbIO/duOZnN8xRkLAsaBaY6NWDiL+6uKOxwza9v2Ihh/RnRLrpPnRXR961g26v8f7Ekf3JTCap7T2vH/XtEJfPibSDf5K9xYk/yLSxPJxsbIttfRbA3SKbRsy8Mt9mBAzaY+Q4PRy/Ktp53Dasn4VdOWFkp0LxBbQSOCzG4ObCfeDlflspXUBu6/3kimTmEUd69gA4KO/lCNjx/nGBywauDo+3f2SWZlfV73HTch1UDXZ4epD4Ca0j0DQbmcThNY8HokOjAjEG+dyUsn5llJy5WLP5KGVg8q17+BiBqtZ/S7de3yCrLjkTIlDwOJ2nrGY3eU6Ari5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by BN9PR11MB5321.namprd11.prod.outlook.com (2603:10b6:408:136::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.19; Fri, 25 Mar
 2022 19:01:04 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::e581:b741:b80d:c8a2]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::e581:b741:b80d:c8a2%4]) with mapi id 15.20.5102.019; Fri, 25 Mar 2022
 19:01:04 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: Saul Wold <saul.wold@windriver.com>
Subject: [PATCH 1/2] kmod: Add an exclude directive to depmod
Date: Fri, 25 Mar 2022 12:00:47 -0700
Message-Id: <20220325190048.192697-1-saul.wold@windriver.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0113.namprd05.prod.outlook.com
 (2603:10b6:a03:334::28) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cde7e771-b850-486f-8129-08da0e91cfad
X-MS-TrafficTypeDiagnostic: BN9PR11MB5321:EE_
X-Microsoft-Antispam-PRVS: 
	<BN9PR11MB53216205CC8B3A84A6C64154EE1A9@BN9PR11MB5321.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ICngyXxU+crJf6HVitdgUy7TlIelUcA8exTktzCjPji+YYB3coNyhjL3rc3021SIk3osKIhYML69Yg99Zf5q0vQ3lXiOFjO3FPO8frVuVesRvThBRaYbRiT4GeJqW3IgId09rPsBxXo0V8fi3oX/yMks1DYCBoBxoelv1p86rQI2AFbhs08rh+ImFsO6nFoWqH9b2k8AJa2SHkob1DqNlunWwAHWt3Jtakeh9wbq/xaroCqcv2CXUDfV1ZYfPsZZrkWX+NNYBaANd82HTD2uNwsrgvnDnnwCXxNcjkAJ9Q5WqaVGcETSSP20AvhZVJBZwZaMMEoVNuLj0DwEQgLGF3/KavFldm6tGb/OHi3MzkhYZswcGQZQIAOf6wp5w+LsJ+YN13XglHIs6+oiGi9/6j7Xs6vUbfW09/+GZ7Afpx6PIvrfXRhTCTQQwD5kg9nbDq6rPNKggw/FFMV/aotSfbLlHRdzm0eWfSDDNOzI6srSKiocdJTGCfp7YixrrEErnRV4tcSLDYXwHDRBCubuUd2VOsr41MNNaF1wTY8urBzBmgD00o47Vms5A8+gthsUimxcCnI0YWaiBNfHEWZEDFzpgsWC9EYtugpPhYosC17FjmX4gD/M0lw7QceuigvlxwWi+zSjN7HMVyLctPFa8cBJ70dV4H52OS4VUPev4bVAwgnSx0KqTxTBU7gAxnGUG1YxmO2qKc/PyOs/dlGGKA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(36756003)(2906002)(4326008)(44832011)(66556008)(6666004)(5660300002)(66476007)(66946007)(186003)(26005)(6512007)(8936002)(107886003)(1076003)(6916009)(316002)(8676002)(86362001)(6486002)(52116002)(38350700002)(508600001)(6506007)(38100700002)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?noXxNDfJkW/jGHfNEuCCGO48hAaycvRk6s5UuQKyThw4DNHSq+V/oDIeve/Q?=
 =?us-ascii?Q?/yRGtSzh+tzfCjsRHgT/+XJTC00KWpb/3FgpZZHsb8kXwqhRQOA7WrtLE87C?=
 =?us-ascii?Q?e1w366r3GwRlPQPP18Mt4Jggze3CpGl0GPXvFaAgbO78KH9uVcH0YFRzXadK?=
 =?us-ascii?Q?uu3MvN6XYngIph047WkIO3zOPTHNLsGD29GWcCEDyjMlHYaoWvWB1/gbxvdc?=
 =?us-ascii?Q?Sot6bH4Ysdh1PN3/HGcn9SqLvOwyL4N0OkdVxb/b8avkAilWcYTqjHQGBTou?=
 =?us-ascii?Q?SFOX8KREbmh0D5WOLSH4zCpGH2+CbGhCDQapFJdEtzgm2f9sVWhwFtBEMoas?=
 =?us-ascii?Q?Gq3J/vG4sXV67/yFuWcE/XGiT7ek4wE2AZy+DXH4ydayGY8bMiusle8SnIbE?=
 =?us-ascii?Q?AVuJogFH7U5Ua403l7rg4b1nAoLHrbOqXPKXadIS34AakSnpneO3iG+f1q5S?=
 =?us-ascii?Q?ic7ZIys6HUZ95NcYqGOZQpA2LvlvMsdsoKwPtpUrNykQwIotbaPAPhk7f23I?=
 =?us-ascii?Q?y3UeL+6wf8TFSH9MUmVvXluMWASKvWCY7ZoyRt+6eaG6hbpIreqK7r66Y5ta?=
 =?us-ascii?Q?Qu2xQvnwdq3KomlURX7+0hWrBnEbBitZBByAA33zb/fbRtXsgCneiViowJnb?=
 =?us-ascii?Q?QiGBHbmd0n3QG+Z7YRA3yt3OAIl8PXb+SGLqY7q54rlAEeDT6/Q/oEs84Ghh?=
 =?us-ascii?Q?27xEYuOI+gnRh9xR0i+gvW+Ntvk7Ij+EQwTYQ6UY/6yLwl836dxRFCBz0epr?=
 =?us-ascii?Q?ZInnS1M5P5CBRkQZLBolmLyQoO6uMCRE8TfDP2MLO+PQllEkDIMIEtlJ7bmi?=
 =?us-ascii?Q?GOi4dfNZ0OXtuCjTzIrfo+8rSiR4uMvpvmLzVnI/v0UNMm/Yz5N+K59KvY4D?=
 =?us-ascii?Q?eBAv4zJcYdE4np1RtPZGf6avdZ+KcnXjJ76EHMr5zjA9FKGcQaSI3wzCWdns?=
 =?us-ascii?Q?m0qcXlzS2Xzn4ih8y0i/zhnYp8la1scURXG7l8Xur997/GOyudNURuU/Jg5f?=
 =?us-ascii?Q?37GTQ8LGmRMnTF7w8xNn+Ep32pUeA3Dpsu63TB2QRaqhwG2e0xIJE1N83fel?=
 =?us-ascii?Q?m5Rmn1bnnQxApVVWAONmAl2x2lZO4tFg8nogszVzVRhaLxzKwAytPQieGcf8?=
 =?us-ascii?Q?vDRsOak9KE9JAJ2Wb0z89xaulf0m3BJqMUJ+gt6NSEgSv6NObWGG4D1tj+KU?=
 =?us-ascii?Q?GsR6+eEeC8H1JaEX2W4J9HDsudQgfamSddKtVpqU0gJu+J9EQU9DjCgqQrfU?=
 =?us-ascii?Q?+gMlujqZkmytfe6BnuRgoM2yRXQ03P6tDlPHVBNbcpYNYDbVQSBT96wQM6il?=
 =?us-ascii?Q?fIrEk7h6Yrzv0uRn/QHU2n7HQxvbx6NQR+Fn6mQBYOKRrrxFvIWIkfYp2NYy?=
 =?us-ascii?Q?vIgtabHjtlpzuE325Q0edWAr+7DaQY6qIbjXuSaisr4V9n1ZKFmQZ9i1K4Mq?=
 =?us-ascii?Q?30ZolLNpAZuLnmj73GsypBVW1kreStJxcHbzlZr6bA3HUy4tUZa5D6JgV9W9?=
 =?us-ascii?Q?G8as/fVjcre9cgTGw6hx4ynVKvRTbUoU2KGkW/jdwFjW8SaMCd5npNlWeGg1?=
 =?us-ascii?Q?oD9sJYtCOwHo/ZIqdt/D1TwcwR/gT0HmMdOX0y6k8wBKaqiwpAwyN+XdpRSH?=
 =?us-ascii?Q?0Wlo/DJUt0/xG95u9xvtIf9MOPMfqtsDeCs6SM4/5FXoPTprcaO98ibw9Sci?=
 =?us-ascii?Q?Qf0ttkskHoJbysiKl6eqiSdO5FDIHeIj7N/o536+DaXGQTBf/qoQousUm5bt?=
 =?us-ascii?Q?kaSxpqthHwjkSIQLYdmK0+j14DXA8XA=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 cde7e771-b850-486f-8129-08da0e91cfad
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2022 19:01:04.4898
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 BKEcP4BoT4OLX6OW6hAj4rDxC9mkwUE3le1naX3LvF1abXnEZu/sdP8lefQvhRyr31x1A7FRRGCAjZENBI4h5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5321
X-Proofpoint-GUID: kYGNqN_DDB8R6Bkb-hUlBp9tcZGB3aeT
X-Proofpoint-ORIG-GUID: kYGNqN_DDB8R6Bkb-hUlBp9tcZGB3aeT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-25_06,2022-03-24_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 mlxscore=0 suspectscore=0 spamscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203250105
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Mar 2022 19:01:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96210

This adds a new configuration directive to depmod that causes
depmod to exclude a give path entry like .debug.

kernel-dbg provides the modules .debug/<module>.ko files and
when installed either directly or when dbg-pkgs are selected
this can cause depmod to fail.

This patch will be submitted to upstream kmod.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 .../kmod/depmodwrapper-cross_1.0.bb           |   3 +
 ...dd-support-for-excluding-a-directory.patch | 158 ++++++++++++++++++
 meta/recipes-kernel/kmod/kmod_29.bb           |   4 +
 3 files changed, 165 insertions(+)
 create mode 100644 meta/recipes-kernel/kmod/kmod/0001-depmod-Add-support-for-excluding-a-directory.patch

diff --git a/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb b/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
index 04fc14a6d21..aa23ba41276 100644
--- a/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
+++ b/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
@@ -16,6 +16,9 @@ do_populate_sysroot[depends] = ""
 
 do_install() {
 	install -d ${D}${bindir_crossscripts}/
+	install -d ${D}${sysconfdir}/depmod.d/
+
+	echo "exclude .debug" > ${D}${sysconfdir}/depmod.d/exclude.conf
 
 	cat > ${D}${bindir_crossscripts}/depmodwrapper << EOF
 #!/bin/sh
diff --git a/meta/recipes-kernel/kmod/kmod/0001-depmod-Add-support-for-excluding-a-directory.patch b/meta/recipes-kernel/kmod/kmod/0001-depmod-Add-support-for-excluding-a-directory.patch
new file mode 100644
index 00000000000..3f16cdf0574
--- /dev/null
+++ b/meta/recipes-kernel/kmod/kmod/0001-depmod-Add-support-for-excluding-a-directory.patch
@@ -0,0 +1,158 @@
+From 8bc07c3ba3a412bd6bb94ad8bad0d76801ec2c9f Mon Sep 17 00:00:00 2001
+From: Saul Wold <saul.wold@windriver.com>
+Date: Tue, 22 Mar 2022 12:11:45 -0700
+Subject: [PATCH] depmod: Add support for excluding a directory
+
+This adds support to depmod to enable a new exclude directive in
+the depmod.d/exclude.conf configuration file. Currently depmod
+already excludes directories named source or build. This change
+will allow additional directories like .debug to be excluded also
+via a new exclude directive.
+
+depmod.d/exclude.conf example:
+exclude	.debug
+
+Upstream-Status: Submitted
+
+Signed-off-by: Saul Wold <saul.wold@windriver.com>
+
+%% original patch: 0001-depmod-Add-support-for-excluding-a-directory.patch
+---
+ man/depmod.d.xml | 14 +++++++++++++
+ tools/depmod.c   | 54 ++++++++++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 68 insertions(+)
+
+diff --git a/man/depmod.d.xml b/man/depmod.d.xml
+index b315e93..9ab790a 100644
+--- a/man/depmod.d.xml
++++ b/man/depmod.d.xml
+@@ -131,6 +131,20 @@
+           </para>
+         </listitem>
+       </varlistentry>
++      <varlistentry>
++        <term>external <replaceable>excludedir</replaceable>
++        </term>
++        <listitem>
++          <para>
++            This specifies the trailing directories that will be excluded
++            during the search for kernel modules.
++          </para>
++          <para>
++	    The <replaceable>excludedir</replaceable> the trailing directory
++	    to exclude
++          </para>
++        </listitem>
++      </varlistentry>
+     </variablelist>
+   </refsect1>
+ 
+diff --git a/tools/depmod.c b/tools/depmod.c
+index eb810b8..8b19ab6 100644
+--- a/tools/depmod.c
++++ b/tools/depmod.c
+@@ -458,6 +458,12 @@ struct cfg_external {
+ 	char path[];
+ };
+ 
++struct cfg_exclude {
++	struct cfg_exclude *next;
++	size_t len;
++	char exclude_dir[];
++};
++
+ struct cfg {
+ 	const char *kversion;
+ 	char dirname[PATH_MAX];
+@@ -469,6 +475,7 @@ struct cfg {
+ 	struct cfg_override *overrides;
+ 	struct cfg_search *searches;
+ 	struct cfg_external *externals;
++	struct cfg_exclude *excludes;
+ };
+ 
+ static enum search_type cfg_define_search_type(const char *path)
+@@ -580,6 +587,31 @@ static void cfg_external_free(struct cfg_external *ext)
+ 	free(ext);
+ }
+ 
++static int cfg_exclude_add(struct cfg *cfg, const char *path)
++{
++	struct cfg_exclude *exc;
++	size_t len = strlen(path);
++
++	exc = malloc(sizeof(struct cfg_exclude) + len);
++	if (exc == NULL) {
++		ERR("exclude add: out of memory\n");
++		return -ENOMEM;
++	}
++	exc->len = len;
++	memcpy(exc->exclude_dir, path, len);
++
++	DBG("exclude add: %s\n", path);
++
++	exc->next = cfg->excludes;
++	cfg->excludes = exc;
++	return 0;
++}
++
++static void cfg_exclude_free(struct cfg_exclude *exc)
++{
++	free(exc);
++}
++
+ static int cfg_kernel_matches(const struct cfg *cfg, const char *pattern)
+ {
+ 	regex_t re;
+@@ -657,6 +689,11 @@ static int cfg_file_parse(struct cfg *cfg, const char *filename)
+ 			}
+ 
+ 			cfg_external_add(cfg, dir);
++		} else if (streq(cmd, "exclude")) {
++			const char *sp;
++			while ((sp = strtok_r(NULL, "\t ", &saveptr)) != NULL) {
++				cfg_exclude_add(cfg, sp);
++			}
+ 		} else if (streq(cmd, "include")
+ 				|| streq(cmd, "make_map_files")) {
+ 			INF("%s:%u: command %s not implemented yet\n",
+@@ -857,6 +894,12 @@ static void cfg_free(struct cfg *cfg)
+ 		cfg->externals = cfg->externals->next;
+ 		cfg_external_free(tmp);
+ 	}
++
++	while (cfg->excludes) {
++		struct cfg_exclude *tmp = cfg->excludes;
++		cfg->excludes = cfg->excludes->next;
++		cfg_exclude_free(tmp);
++	}
+ }
+ 
+ 
+@@ -1239,12 +1282,23 @@ static int depmod_modules_search_dir(struct depmod *depmod, DIR *d, size_t basel
+ 		const char *name = de->d_name;
+ 		size_t namelen;
+ 		uint8_t is_dir;
++	        struct cfg_exclude *exc;
++		int exclude = 0;
+ 
+ 		if (name[0] == '.' && (name[1] == '\0' ||
+ 				       (name[1] == '.' && name[2] == '\0')))
+ 			continue;
+ 		if (streq(name, "build") || streq(name, "source"))
+ 			continue;
++
++	        for (exc = depmod->cfg->excludes; exc != NULL; exc = exc->next) {
++			if (streq(name, exc->exclude_dir)) {
++				exclude = 1;
++			}
++		}
++		if (exclude)
++			continue;
++
+ 		namelen = strlen(name);
+ 		if (scratchbuf_alloc(s_path, baselen + namelen + 2) < 0) {
+ 			err = -ENOMEM;
+-- 
+2.31.1
+
diff --git a/meta/recipes-kernel/kmod/kmod_29.bb b/meta/recipes-kernel/kmod/kmod_29.bb
index 91951edde16..9b663490666 100644
--- a/meta/recipes-kernel/kmod/kmod_29.bb
+++ b/meta/recipes-kernel/kmod/kmod_29.bb
@@ -20,6 +20,7 @@ SRCREV = "b6ecfc916a17eab8f93be5b09f4e4f845aabd3d1"
 SRC_URI = "git://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git;branch=master \
            file://depmod-search.conf \
            file://avoid_parallel_tests.patch \
+           file://0001-depmod-Add-support-for-excluding-a-directory.patch \
            "
 
 S = "${WORKDIR}/git"
@@ -64,6 +65,9 @@ do_install:append () {
 
         # install depmod.d file for search/ dir
         install -Dm644 "${WORKDIR}/depmod-search.conf" "${D}${nonarch_base_libdir}/depmod.d/search.conf"
+
+        # Add .debug to the exclude path for depmod
+        echo "exclude .debug" > ${D}${nonarch_base_libdir}/depmod.d/exclude.conf
 }
 
 ALTERNATIVE_PRIORITY = "70"
-- 
2.31.1


