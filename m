Return-Path: <MANJUKUM@xilinx.com>
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam01on0088.outbound.protection.outlook.com [104.47.34.88])
	by mail.openembedded.org (Postfix) with ESMTP id 7613977F34
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Nov 2017 04:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=BZmHBfH1fRhoZ3tBC2+lfZ8ZzIWOqR8KIqdNmDJblDw=;
	b=rFVzaAKugnWDROPfL78gX9cCKmt6/c045jCekFpk2Yza+6S9kKpWnhDVRzfnUzsKE1eRyTsiCR3uRu1sLKID7tNWNwT4Zz0Y2zfxaBrchp21PF75EzcuxQQvBaIJmkqf/YcCwp2nP7FIVqhXPDzXVuUjdAYojyFZPnAyZgV0rnI=
Received: from CY4PR02CA0034.namprd02.prod.outlook.com (10.175.57.148) by
	CY4PR02MB3382.namprd02.prod.outlook.com (10.165.89.153) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.178.6; Thu, 2 Nov 2017 04:32:57 +0000
Received: from BL2NAM02FT058.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::202) by CY4PR02CA0034.outlook.office365.com
	(2603:10b6:903:117::20) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.178.6 via
	Frontend Transport; Thu, 2 Nov 2017 04:32:57 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2NAM02FT058.mail.protection.outlook.com (10.152.76.176) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.178.5
	via Frontend Transport; Thu, 2 Nov 2017 04:32:56 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1eA7BY-0001Gd-Ap for openembedded-devel@lists.openembedded.org;
	Wed, 01 Nov 2017 21:32:56 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1eA7BY-0007mf-7t for openembedded-devel@lists.openembedded.org;
	Wed, 01 Nov 2017 21:32:56 -0700
Received: from xsj-pvapsmtp01 (smtp3.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	vA24Wke9003449; Wed, 1 Nov 2017 21:32:46 -0700
Received: from [172.19.2.216] (helo=xsjmanjukum50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1eA7BO-0007mO-5e; Wed, 01 Nov 2017 21:32:46 -0700
From: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 1 Nov 2017 21:27:06 -0700
Message-ID: <1509596826-21204-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-23430.004
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(39860400002)(346002)(376002)(2980300002)(438002)(189002)(199003)(47776003)(63266004)(50986999)(36386004)(316002)(16586007)(77096006)(6306002)(5003940100001)(106466001)(575784001)(8936002)(50466002)(48376002)(8676002)(305945005)(81156014)(2351001)(81166006)(356003)(107886003)(50226002)(2906002)(106002)(4326008)(478600001)(36756003)(6666003)(72206003)(6916009)(33646002)(966005)(9786002)(5660300001)(189998001)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR02MB3382; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; MX:1; A:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT058;
	1:BQ6xJl3Aix7cMHZv9VwoMnDzsJ9X+1eJZIYNO62b872xHxZk4IlKEfUc8qYrHxqiaffoI5XqfAI645IYDVqPwfNT9jOqglXg0ik8qekn4lcwqVJ33PozQ6hIOZQUVwMt
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a7f01365-dd21-40b4-deda-08d521aacaa0
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(8251501002)(4534020)(4602075)(2017052603199);
	SRVR:CY4PR02MB3382; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3382;
	3:w3q9QCFDJO3dmWjKerBldxA4hJ5f+N3rJXF7lWD/P58oOeoZvfT9RSOzE/l8FksXvx/IzE/wLddeAz+NZUdLNnDlgRT0VyeijpS6tNylnzd9lkgyPzndNiyk1Pcl6+lkUOa4wL9uYWaxdbLsZ2TqPxgN39+L7wXDUU0g2U4fSOaEYF9P3bADwJnm77EH6R1rUGvFJm/VLkUb2+oEJjaOVWvcrMiKqMCOZ64iK1w+e6ud3yNaBL5xQu7K/CMsEFYupEg3onH/Z9ChJPotYDTdUhbQWw/xHoLxsN1b5KEJ0r27pA8ETpKC+aT/bHVWmm6IITKVaXydXZgYZOnBBgxvhnhrq/EJUe48VXGDmHP3vKM=;
	25:kovemZ6Kuhf06go9UMR+Wm5J0BwjeVCyysn4/ABSy7C7SUOT3GHWxnSJek+Wu3g28iqPPUhc/C+2NUSS27bRjSr+QH0WAS7A4raZFQ/fnaCSLr42LZ/B3SA2nQ2gVLlZIPTWgXXCkU3NGF39qVzsqPIUpd7IYaKK/dFwm30ZpCu9RKbSOnZqOVTDpOz0r4gx/t4GfTUxRUM0TCPg/pNDJTwF0nPDHLgKCekLfE05lGoeO3hGF0owLbEVNRaTx6datrE0jeCfyqD6csN5PItmnGFKuZ91Y/I1UrsL+osUKWUXKqL489GEcO9LYm5QL2TE0IbGd3DiyOEG9ezyukylZg==
X-MS-TrafficTypeDiagnostic: CY4PR02MB3382:
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3382;
	31:UiGDidDKIcD2jzW6a3JnWPQzAz30h5Q1dfz4916lrlYMctlBbsuzeYgrUMacPoboNmNamt35jp1TsxP4NhBe+1Ki0yiDk96YVrtXb8oBiRohkHtlQM8MwwXeVse/KfAfcHHBUmWZBQT5P+FWQP7u2NpAyZlRjTjoJ+zyra6v1HCS+5sViIKCrKihndPyQkmSu7+W6SkgUsMP03Gx7bBfPsni+oGDctv71hBTd7zQ7Z4=;
	20:TyIZOmceM0KltxJ84uXWrP6k6tbZqdxDSK70g8NBWsR+I9d3NASbo94lDkeD5fzDCaDKr2vKLa3+KzMUt3JEOiCLJ9orCiofE4xdELUcfehG5sTxqY4IJQBNma8ZNeEkbHSCUYAHSTU5a5fVmfyeJVlLZUrMrULuBjNuw368gkBhoGGnZLHcZpAIRdEzdw/dheLN9YytvhzdHMQuN6ZNvQbuVglouWdfEE8j16vjJEEg+nQqCUC4UTYud2dcFjQbxGj6VfATuszqeQVT6MLvbp/rWL56kIiAjfD0ObUiCr5CR8W/iQLKF7ZlvN0uAEMGjktHMWvRLMnnjdziFeSNqZAhGRoupO77M2mKQlv/ARZJnj0QeJmRLo0lHx2xgB6I/X+IT7s/9FcbvOTeZRod7BMs+0/jp3F1BaxqNU5edDV7nCD+6io76EAzOj5McfAq6LqOgQgizf7hgbx23ZEtXT8fKuAHqxJfAhlOO6NKAym22OlLcImUNGzucJlOKSVi
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Microsoft-Antispam-PRVS: <CY4PR02MB33822A2935FE3652104E1C4AB95C0@CY4PR02MB3382.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(100000703101)(100105400095)(3002001)(3231020)(10201501046)(93006095)(93004095)(6055026)(6041248)(20161123558100)(20161123562025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123555025)(20161123560025)(20161123564025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:CY4PR02MB3382; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:CY4PR02MB3382; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3382;
	4:kuwFCMej8WdmHvoex/HB+oUFpapPxgMCn8MjUl8DTKWqAvtui1HsQo0+en74+WZubJVkFfvZrgp+OW5ffH18a0+d7WlwWso8frWpxeQsQ4ZWknPU3PKPz98pxUVD/KUnAvAitXymLehqfJkmYC+3gSr9NbOwMNwJIG1+DIVfjbNq47T6bz+xWhwXoVUxZEbF/42SQmm9i13Zm7G7yhL46e6sMak2VFs7vCPV9ZM9B+zxWtKfYQ85HUWb5gIqTqdWB2qES+wC5k0Bmp8BodPMY6d4UywHt+JX4WGOTjYcb/iNprgh05V9O+oBdm6e5mOI
X-Forefront-PRVS: 047999FF16
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR02MB3382;
	23:KGYPC6BEnTMUw3t+1uvaaIx4lJuryWHoqW4gJTqIl?=
	=?us-ascii?Q?RspofB32xIZrnmhC5AEAhy+Vk/YhmYVUPnXT7J7RbZoYzV5cph6H100Kt/EI?=
	=?us-ascii?Q?vUJ7Yi0COS6iDdQoCHChUfmoFgPRpEjGkhXg/8mGHzzvQcqmmy3QZ4aMdc4I?=
	=?us-ascii?Q?11OVF9laoxCopcJFiuEIkZek/gi0+HVx3YZdVCa1PV7ODBGqyUUnIWPupLvh?=
	=?us-ascii?Q?6REDdqvFmq0oaoXaLCOR4QkYtGJm59SlSPctrZxsgHkOVl26CPpuRoupVpvj?=
	=?us-ascii?Q?dyw/jVPNKeVe0TMlX2o6/PQnhCDK7Iscww/9iRWReig5LLTRGI10eUXNGMDa?=
	=?us-ascii?Q?oeXrRJ1FF8KoOgdolP5674GBI5MTHRMmQoBvO4lXIJdkpWrDN0I2FkdK4HQ8?=
	=?us-ascii?Q?UvXzvRU3FY0wyWJb00xkGYz4/F52gV0Z0HkDo/ThXvz7jj+Pnq/fa4e0pPyA?=
	=?us-ascii?Q?UM9rZb8zm902rGbLcmjdOPUF0rK/CIET9S4Immt9+1GhkuIda6Gnp4ey5S38?=
	=?us-ascii?Q?qSwpagiE3umnmziJxfXZ+imcdx0z8PwfxsGh1V6YdSeKXwEPVCy6XiDDCqOV?=
	=?us-ascii?Q?xm+Aj/R6XVyzukELzmQg822BJFM/g81fj49NFkjkJZ2crdpMisYYbsnDDqi1?=
	=?us-ascii?Q?IdZuysdkNECiCBMQNgqvocHCPaLTrdp4g6xVphCbt6vd9b5MPkNnZ5w90ntH?=
	=?us-ascii?Q?kP+mhZOTn6pBvipO4RSpGdakiMMQe38zA4RfimFkO/aWv1PI8idelyClNBIg?=
	=?us-ascii?Q?wXHgPdsPEMnTzXGLmFO4UuG8b4p0yEaj/xhxrQPZjGo5jefHLWKKSM02TBo9?=
	=?us-ascii?Q?eh9Rq6aZP+PHfC7btemkMe0SOmgFXvao8NKQepyidTPvByBDx3KhMxiJFudW?=
	=?us-ascii?Q?YuUPIef+xAbwSTIAGScQejjN0Zb1qVEv8Z+IfUmKSR2DBB4qk/Z3KWlQ/vMS?=
	=?us-ascii?Q?0NhjVvZ1O5MpCwLMcQ5PPOpagT7sUK5exHRETg0cqbq0kqamhBS4vKQAhX62?=
	=?us-ascii?Q?CHABYI+ijFQPoECEl9TgMcWF7a0URYhRdFod1FqQb5NSw=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3382;
	6:xGP7UkiAjjKlbETOvqTGSB37YgTkf+oR8DjH/N714ssLbWXleKC8+siSNBfauxdJBrgXkITiMZTbB6DBwRvkIyl6Ryuy3dIYGGUKd7x9j+e72fYusMXgysYY7UQZ57KyJmNU/pdNN/C5woq1meDjVKrEev3QycCvHttAAJXy1VW3lXkQ1hhdxaDR9XtgeqSSGNDKdA9NRG8j3LP7kN4yk443xMA6aIiLQEEUmThCtVWOjyIhUeFz1mX/K1juzXsDt3JrJP8jOzUfevUPp/uzW5JhCEj6NQsIn9CPfAuJ/uLAJrhmwZjjA0+L740pZQHGLpgmxZ4dG9tfIwXZfXnmpY2tOrzenPYsYrElovb+A5Q=;
	5:iZiVSdoRnt/+yILJ0mpLEYGGjQCACeX8C/UGlrZzNkLiyOe0aySj2ABEUY+GFvf/HY/IlMHvguF1kpFcui1f9VcXzEcKd0rh/VTvDBcQ71oB+S1V+JFLJSPpR6Xujhtcm86Qeshaif/jJ3aiKWKphvW3/6FBN8WN8C41xZiPl0c=;
	24:y+ycLeKKgiBpKXPwiC85azrb384VTasIOsRJx8JqBUcD/hdHo4D2gc2Qe/XTjARakxvK859c6kGgEBq7/vg6T1caXeLl82QmQPesfnuJI0A=;
	7:VMAdrG48Uzw7CMIA/QtX2u0fD9vT9GU2VTOHs2e/zeYhIyx9YQdzzQpwT5ylkV9QEIzyWmqANgAxmL9Luns2Q2daeS0lK9ezNBh7u4kv3PaFWt2ofDxf00gLL64409MqHDeRopHHLU/gWHZavXjSBycurqYtLww2keOPDmWBeTOJfUQ4JjbPAAIjVKokCe5PkBMydsr75kT9kMWRGrwPqP4P8+gvvqPsIqrEIQ6IGbhST9JOiXuSwDM+64v7/u2k
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2017 04:32:56.8615 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7f01365-dd21-40b4-deda-08d521aacaa0
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB3382
Subject: [meta-oe][PATCH v3] linpack_1.0.bb: Add linpack benchmark
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 02 Nov 2017 04:32:57 -0000
Content-Type: text/plain

The LINPACK Benchmarks are a measure of a system's floating point
computing power. Introduced by Jack Dongarra, they measure how fast a
computer solves a dense n by n system of linear equations Ax = b, which
is a common task in engineering.

https://en.wikipedia.org/wiki/LINPACK_benchmarks

Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
---
 meta-oe/recipes-benchmark/linpack/linpack_1.0.bb | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/linpack/linpack_1.0.bb

diff --git a/meta-oe/recipes-benchmark/linpack/linpack_1.0.bb b/meta-oe/recipes-benchmark/linpack/linpack_1.0.bb
new file mode 100644
index 0000000..aed95cd
--- /dev/null
+++ b/meta-oe/recipes-benchmark/linpack/linpack_1.0.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "LINPACK Benchmarks are a measure of a system's floating point computing power"
+SUMMARY = "LINPACK is a software library for performing numerical linear algebra on digital computers"
+
+LICENSE = "PD"
+LIC_FILES_CHKSUM ="file://${WORKDIR}/linpacknew.c;beginline=1;endline=23;md5=aa025e3bc44190c71e4c5e3b084fed87"
+
+SRC_URI = "http://www.netlib.org/benchmark/linpackc.new;downloadfilename=linpacknew.c"
+SRC_URI[md5sum] = "1c5d0b6a31264685d2e651c920e3cdf4"
+SRC_URI[sha256sum] = "a63f2ec86512959f1fd926bfafb85905b2d7b7402942ffae3af374d48745e97e"
+
+S = "${WORKDIR}"
+
+do_compile () {
+	${CC} ${CFLAGS} ${LDFLAGS} -o linpack linpacknew.c -lm
+}
+
+do_install () {
+	install -Dm 0755 linpack ${D}${bindir}/linpack
+}
+
-- 
2.7.4


