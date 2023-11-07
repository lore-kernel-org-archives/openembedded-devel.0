Return-Path: <Joakim.Tjernlund@infinera.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F21EBC4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 20:25:00 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.54])
 by mx.groups.io with SMTP id smtpd.web10.5323.1699388699042445099
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Nov 2023 12:24:59 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@infinera.com header.s=selector1 header.b=j24/a3CG;
 spf=pass (domain: infinera.com, ip: 40.107.93.54, mailfrom: joakim.tjernlund@infinera.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IqAu0UweOWyXfWK6Q1IyGy/3g0xQdj1M/z+NXJ+Y/SuO3bVCEvZdrWvloZLtcS4Jsdscwgh5qjr+4C1mKG8EkbEKbCLC6WzutPfDErzo2d63/jFoWR95w1Hjaw4xa8jAW3b66i8ajm/AwhmY+WnEMwAMbbdqf7/fbMXUXaon5Jg6l+1PuZ7yFwppH5bwd65D+uei61I86qI6dBOkqOjtWS+p2KHnH7nC8B5uRnfp1VpZ1W1ij5/IraomiJ54FM3EL8SKnW1knQuQztLJ4Sxz3xlCCGCWOtj+pOhBI+sKzq1tcXT4nwyZ7z1eUsL8W13cMXS8LGhsm2DDwuC+4PGhqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=llcnqHZGaryn8eBCn4VYuB57uy9SnZssi3sPkIEApYY=;
 b=Q2AJ1GUHIXN6u6b54HFeQaO6/PcE53rblWyeoyyiPo0FE2V3pX4rSiXHL02Leb5REi94vJBd5KzojZnj89OmF3ex+iKTR8g1UTvKKw77GX0ptp7ysDsRq/8twTW73MmejFlOsfmhoJACRMy53iS1tTfXz4RuyyKwQvZQQHpP0wkPbVbWQTp8vjczw7Gw7A/O2J/yjnsEO1AElKWoN0k0lqqJLb1svBn6cyAh+m025RqFx2xDNF29iGL439VaYTHgnf5rPktok6px92QSB3t8lUpOsMk/vH+pDq2lIaXZfpRud0OS/of2cgNjF21/1bXvnbZR3fYiGUfwoWFxxZClzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.4.225.30) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=infinera.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=infinera.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=llcnqHZGaryn8eBCn4VYuB57uy9SnZssi3sPkIEApYY=;
 b=j24/a3CGR78BAU4ZXolufZj+it6qZqzfl76L4XQIyLKOq/qbgB5DfL09Far+Ca6lXdeIv4tO1jf8YxTFc7BqshXDl3JMJqaejBbgcjjaOtj1L7kvuylfE3+9qtYBk3ULuh+K/cWAI2CDtWbdf7BcQEXUCxbTOY3aMJvKz/KdnYys4HXqu+vbZCFRbmKdrgiJb+WUvK/sde3+CBf6afA8gw+k44tLQfnGWxeuO3kIR3lAlGPbXCP0ZFCHv1nrIwawwXTbhWgASaALk/EMCd5R9wXjFll/Sk6WbEUmzX6wQSCHgbN3xCcd5zND0QrcYJL45F5wfWrw0jFCFJ9n5g3JiQ==
Received: from BLAPR03CA0103.namprd03.prod.outlook.com (2603:10b6:208:32a::18)
 by SN4PR10MB5560.namprd10.prod.outlook.com (2603:10b6:806:203::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.25; Tue, 7 Nov
 2023 20:24:57 +0000
Received: from MN1PEPF0000ECD9.namprd02.prod.outlook.com
 (2603:10b6:208:32a:cafe::93) by BLAPR03CA0103.outlook.office365.com
 (2603:10b6:208:32a::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.18 via Frontend
 Transport; Tue, 7 Nov 2023 20:24:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.4.225.30)
 smtp.mailfrom=infinera.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=infinera.com;
Received-SPF: Pass (protection.outlook.com: domain of infinera.com designates
 8.4.225.30 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.4.225.30; helo=owa.infinera.com; pr=C
Received: from owa.infinera.com (8.4.225.30) by
 MN1PEPF0000ECD9.mail.protection.outlook.com (10.167.242.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6977.16 via Frontend Transport; Tue, 7 Nov 2023 20:24:56 +0000
Received: from sv-ex16-prd.infinera.com (10.100.96.229) by
 sv-ex16-prd.infinera.com (10.100.96.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 7 Nov 2023 12:24:43 -0800
Received: from sv-smtp-prod3.infinera.com (10.100.98.58) by
 sv-ex16-prd.infinera.com (10.100.96.229) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 7 Nov 2023 12:24:42 -0800
Received: from se-metroit-prd1.infinera.com ([10.210.32.58]) by sv-smtp-prod3.infinera.com with Microsoft SMTPSVC(8.5.9600.16384);
	 Tue, 7 Nov 2023 12:24:42 -0800
Received: from gentoo-jocke.infinera.com (gentoo-jocke.infinera.com [10.210.71.73])
	by se-metroit-prd1.infinera.com (Postfix) with ESMTP id 0B2212C06D81
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Nov 2023 21:24:42 +0100 (CET)
Received: by gentoo-jocke.infinera.com (Postfix, from userid 1001)
	id 03A8D401154E; Tue,  7 Nov 2023 21:24:42 +0100 (CET)
From: Joakim Tjernlund <joakim.tjernlund@infinera.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Joakim Tjernlund <joakim.tjernlund@infinera.com>
Subject: [PATCH] [meta classes] sed -i destroys symlinks
Date: Tue, 7 Nov 2023 21:24:12 +0100
Message-ID: <20231107202439.2647261-1-joakim.tjernlund@infinera.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 07 Nov 2023 20:24:42.0988 (UTC) FILETIME=[7117A2C0:01DA11B8]
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD9:EE_|SN4PR10MB5560:EE_
X-MS-Office365-Filtering-Correlation-Id: e7454ba1-2161-4025-33a0-08dbdfcf9b7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	RyG4KSeShIida1nkGSUHbb82m7+HRmqRKer25GbPSMXe7bF1rpxRC8heMqn34RBZUjjT+Sx/jkIR02cT+IXw1JWRtJUdRt+U/nfbSZrJCasdlPWLn1h6dEWTvKN9D05X81HCa+uOStu+V4YJ6ivtf8jkGkjRbBm0gFjaLB/b4JsZ7ieboORiGTV0xt2MDLg9P+CYQ9O5L5Oi4KIQjck9X3wtWVYZJ3fMPMRG5mh9NNupINWzVeN5qHEn9aFCv/T7SdVo94D704kxjGTbMqD8QJnSyThAWCkozCcchQOLg4yqUH+ZsZop0BJWSN8gSn+O7FbMDFA4Vb04NyUbxtJYuVV+yYuKAFDQMlP3PC2zRy7AqW+UBs97m7qzp8ZFtbKUhfAlPjBd1ZrLdJnlODgEnMkCtSCFmrGMbpkHhXxv9ztGElTnCOFKphUxfElGIucDFfgyqofeclFh2UGYpBCAtW+oHAzdKaBRKoGJrl3W1PsqUDZCuYqipAzFNFMOctCsCl2evC+C52MViq9oUz26m990+j3TgQqcNumGEPomKilJRsNQgTVBdZyKf1dIA1dqKuefZw1eQDefaNruo5GczAMFHkV1PtSU5DgLaSMCFPMoVAu+9chmhWUHf1cogxtWOtvQ6wxEHHrK8Me6SklwHcWT1xGEfvAGw5u32G+aifrijm/nCQ95lQarrgSKJbivfChZ+HQvIHPc5nlPVuUVgnSp6Z5I+IV1sfI/KW33a6F5NobybJdWpfWqfxfSChC9
X-Forefront-Antispam-Report: 
	CIP:8.4.225.30;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:owa.infinera.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(396003)(136003)(376002)(230922051799003)(82310400011)(186009)(1800799009)(64100799003)(451199024)(36840700001)(46966006)(5660300002)(336012)(6266002)(2616005)(44832011)(86362001)(426003)(2906002)(4326008)(8676002)(478600001)(83380400001)(40480700001)(8936002)(36860700001)(6666004)(47076005)(41300700001)(81166007)(107886003)(70206006)(36756003)(42186006)(82740400003)(316002)(356005)(1076003)(26005)(70586007)(6916009)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2023 20:24:56.1327
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7454ba1-2161-4025-33a0-08dbdfcf9b7c
X-MS-Exchange-CrossTenant-Id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=285643de-5f5b-4b03-a153-0ae2dc8aaf77;Ip=[8.4.225.30];Helo=[owa.infinera.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MN1PEPF0000ECD9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5560
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Nov 2023 20:25:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106461

In /etc/passwd is a symlink, sed -i on same file will replace the
symlink with a new file. Prevent that by expanding the file with realpath
before giving it to sed.
---
 meta/classes/rootfs-postcommands.bbclass | 4 ++--
 meta/classes/useradd_base.bbclass        | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs=
-postcommands.bbclass
index 5c0b3ec37c..55cc863dbf 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -148,10 +148,10 @@ read_only_rootfs_hook () {
 #
 zap_empty_root_password () {
 	if [ -e ${IMAGE_ROOTFS}/etc/shadow ]; then
-		sed -i 's%^root::%root:*:%' ${IMAGE_ROOTFS}/etc/shadow
+		sed -i 's%^root::%root:*:%' $(realpath ${IMAGE_ROOTFS}/etc/shadow)
         fi
 	if [ -e ${IMAGE_ROOTFS}/etc/passwd ]; then
-		sed -i 's%^root::%root:*:%' ${IMAGE_ROOTFS}/etc/passwd
+		sed -i 's%^root::%root:*:%' $(realpath ${IMAGE_ROOTFS}/etc/passwd)
 	fi
 }
=20
diff --git a/meta/classes/useradd_base.bbclass b/meta/classes/useradd_base.=
bbclass
index 7f5b9b7219..72732a4d57 100644
--- a/meta/classes/useradd_base.bbclass
+++ b/meta/classes/useradd_base.bbclass
@@ -154,7 +154,7 @@ perform_passwd_expire () {
 	local username=3D`echo "$opts" | awk '{ print $NF }'`
 	local user_exists=3D"`grep "^$username:" $rootdir/etc/passwd || true`"
 	if test "x$user_exists" !=3D "x"; then
-		eval flock -x $rootdir${sysconfdir} -c \"$PSEUDO sed -i \''s/^\('$userna=
me':[^:]*\):[^:]*:/\1:0:/'\' $rootdir/etc/shadow \" || true
+		eval flock -x $rootdir${sysconfdir} -c \"$PSEUDO sed -i \''s/^\('$userna=
me':[^:]*\):[^:]*:/\1:0:/'\' $(realpath $rootdir/etc/shadow) \" || true
 		local passwd_lastchanged=3D"`grep "^$username:" $rootdir/etc/shadow | cu=
t -d: -f3`"
 		if test "x$passwd_lastchanged" !=3D "x0"; then
 			bbfatal "${PN}: passwd --expire operation did not succeed."
--=20
2.41.0


