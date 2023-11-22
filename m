Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DF4FC072A2
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 04:55:45 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.12892.1700628941893658006
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Nov 2023 20:55:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=MYMQ73WU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9690644334=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3AM4swqI002507
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Nov 2023 04:55:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=Aqe29
	6WW8ufOM6OrjhyitM0S9bNfsBao5kuI1US/PcI=; b=MYMQ73WUNvPVW/aXOwDwx
	BiwWVDbZFs0oaTYBMkS5K5CSW8VRaCYUVwj0mvHjirn8/h6kQaQHTQNft6HQU/PW
	9OKBD1TzJUIH9FhUB5uoTqZP3vpMDfheH/o7mPYVvD4507hJe1zd5n/o+ogp1Ba5
	9g2Q9Lh4Q37P6p7Q5ufX09KEOFSRFwJZLA32JrRvF0JZe0A+TUjV+pPhjBwCFC96
	ETapcd5qHeQ6JxLDA8lVbH3/eau0G9s96lzszy9zkCl0Wx9aB2MZzfOsL/ejuufR
	gDcitZvBlbODJTugmPU4aABwvgGh02rtF9xQqlbTZ7KnRVLGwf1DPVFEQK1X+wD6
	A==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uejfwu5qe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Nov 2023 04:55:40 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 21 Nov 2023 20:55:44 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-networking][kirkstone][PATCH 1/2] samba: fix CVE-2023-4091
Date: Wed, 22 Nov 2023 04:55:23 +0000
Message-ID: <20231122045524.53871-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: ah25wB37mO89i8lEEoKd6auk7EfUlWAL
X-Proofpoint-ORIG-GUID: ah25wB37mO89i8lEEoKd6auk7EfUlWAL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=999
 bulkscore=0 lowpriorityscore=0 clxscore=1011 mlxscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311060001
 definitions=main-2311220034
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Nov 2023 04:55:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106987

From: Archana Polampalli <archana.polampalli@windriver.com>

A vulnerability was discovered in Samba, where the flaw allows SMB clients to
truncate files, even with read-only permissions when the Samba VFS module
"acl_xattr" is configured with "acl_xattr:ignore system acls = yes". The SMB
protocol allows opening files when the client requests read-only access but
then implicitly truncates the opened file to 0 bytes if the client specifies
a separate OVERWRITE create disposition request. The issue arises in configurations
that bypass kernel file system permissions checks, relying solely on Samba's permissions.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-4091

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../samba/samba/CVE-2023-4091-0001.patch      |  40 ++++
 .../samba/samba/CVE-2023-4091-0002.patch      | 193 ++++++++++++++++++
 .../samba/samba_4.14.14.bb                    |   2 +
 3 files changed, 235 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-2023-4091-0001.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-2023-4091-0002.patch

diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2023-4091-0001.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-4091-0001.patch
new file mode 100644
index 000000000..ff80e9377
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-4091-0001.patch
@@ -0,0 +1,40 @@
+From 8b26f634372f11edcbea33dfd68a3d57889dfcc5 Mon Sep 17 00:00:00 2001
+From: Ralph Boehme <slow@samba.org>
+Date: Tue, 1 Aug 2023 13:04:36 +0200
+Subject: [PATCH] CVE-2023-4091: smbd: use open_access_mask for access check in
+  open_file()
+
+If the client requested FILE_OVERWRITE[_IF], we're implicitly adding
+FILE_WRITE_DATA to the open_access_mask in open_file_ntcreate(), but for the
+access check we're using access_mask which doesn't contain the additional
+right, which means we can end up truncating a file for which the user has
+only read-only access via an SD.
+
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=15439
+
+Signed-off-by: Ralph Boehme <slow@samba.org>
+
+CVE: CVE-2023-4091
+
+Upstream-Status: Backport [https://github.com/samba-team/samba/commit/8b26f634372f11edcbea33dfd68a3d57889dfcc5]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ source3/smbd/open.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/source3/smbd/open.c b/source3/smbd/open.c
+index 2c3bf9e..2b19aae 100644
+--- a/source3/smbd/open.c
++++ b/source3/smbd/open.c
+@@ -1402,7 +1402,7 @@ static NTSTATUS open_file(files_struct *fsp,
+						conn->cwd_fsp,
+						smb_fname,
+						false,
+-						access_mask);
++						open_access_mask);
+
+				if (!NT_STATUS_IS_OK(status)) {
+					DEBUG(10, ("open_file: "
+--
+2.40.0
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2023-4091-0002.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-4091-0002.patch
new file mode 100644
index 000000000..908ab85ba
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-4091-0002.patch
@@ -0,0 +1,193 @@
+From b08a60160e6ab8d982d31844bcbf7ab67ff3a8de Mon Sep 17 00:00:00 2001
+From: Ralph Boehme <slow@samba.org>
+Date: Tue, 1 Aug 2023 12:30:00 +0200
+Subject: [PATCH 2/2] CVE-2023-4091: smbtorture: test overwrite dispositions on
+ read-only file
+
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=15439
+
+Signed-off-by: Ralph Boehme <slow@samba.org>
+
+CVE: CVE-2023-4091
+
+Upstream-Status: Backport [https://github.com/samba-team/samba/commit/b08a60160e6ab8d982d31844bcbf7ab67ff3a8de]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ selftest/knownfail.d/samba3.smb2.acls |   1 +
+ source4/torture/smb2/acls.c           | 145 ++++++++++++++++++++++++++
+ 2 files changed, 146 insertions(+)
+ create mode 100644 selftest/knownfail.d/samba3.smb2.acls
+
+diff --git a/selftest/knownfail.d/samba3.smb2.acls b/selftest/knownfail.d/samba3.smb2.acls
+new file mode 100644
+index 0000000..18df260
+--- /dev/null
++++ b/selftest/knownfail.d/samba3.smb2.acls
+@@ -0,0 +1 @@
++^samba3.smb2.acls.OVERWRITE_READ_ONLY_FILE
+diff --git a/source4/torture/smb2/acls.c b/source4/torture/smb2/acls.c
+index 4f4538b..d26caeb 100644
+--- a/source4/torture/smb2/acls.c
++++ b/source4/torture/smb2/acls.c
+@@ -3023,6 +3023,149 @@ done:
+	return ret;
+ }
+
++static bool test_overwrite_read_only_file(struct torture_context *tctx,
++					  struct smb2_tree *tree)
++{
++	NTSTATUS status;
++	struct smb2_create c;
++	const char *fname = BASEDIR "\\test_overwrite_read_only_file.txt";
++	struct smb2_handle handle = {{0}};
++	union smb_fileinfo q;
++	union smb_setfileinfo set;
++	struct security_descriptor *sd = NULL, *sd_orig = NULL;
++	const char *owner_sid = NULL;
++	int i;
++	bool ret = true;
++
++	struct tcase {
++		int disposition;
++		const char *disposition_string;
++		NTSTATUS expected_status;
++	} tcases[] = {
++#define TCASE(d, s) {				\
++		.disposition = d,		\
++		.disposition_string = #d,	\
++		.expected_status = s,		\
++	}
++		TCASE(NTCREATEX_DISP_OPEN, NT_STATUS_OK),
++		TCASE(NTCREATEX_DISP_SUPERSEDE, NT_STATUS_ACCESS_DENIED),
++		TCASE(NTCREATEX_DISP_OVERWRITE, NT_STATUS_ACCESS_DENIED),
++		TCASE(NTCREATEX_DISP_OVERWRITE_IF, NT_STATUS_ACCESS_DENIED),
++	};
++#undef TCASE
++
++	ret = smb2_util_setup_dir(tctx, tree, BASEDIR);
++	torture_assert_goto(tctx, ret, ret, done, "smb2_util_setup_dir not ok");
++
++	c = (struct smb2_create) {
++		.in.desired_access = SEC_STD_READ_CONTROL |
++			SEC_STD_WRITE_DAC |
++			SEC_STD_WRITE_OWNER,
++		.in.file_attributes = FILE_ATTRIBUTE_NORMAL,
++		.in.share_access = NTCREATEX_SHARE_ACCESS_READ |
++			NTCREATEX_SHARE_ACCESS_WRITE,
++		.in.create_disposition = NTCREATEX_DISP_OPEN_IF,
++		.in.impersonation_level = NTCREATEX_IMPERSONATION_ANONYMOUS,
++		.in.fname = fname,
++	};
++
++	status = smb2_create(tree, tctx, &c);
++	torture_assert_ntstatus_ok_goto(tctx, status, ret, done,
++					"smb2_create failed\n");
++	handle = c.out.file.handle;
++
++	torture_comment(tctx, "get the original sd\n");
++
++	ZERO_STRUCT(q);
++	q.query_secdesc.level = RAW_FILEINFO_SEC_DESC;
++	q.query_secdesc.in.file.handle = handle;
++	q.query_secdesc.in.secinfo_flags = SECINFO_DACL | SECINFO_OWNER;
++
++	status = smb2_getinfo_file(tree, tctx, &q);
++	torture_assert_ntstatus_ok_goto(tctx, status, ret, done,
++					"smb2_getinfo_file failed\n");
++	sd_orig = q.query_secdesc.out.sd;
++
++	owner_sid = dom_sid_string(tctx, sd_orig->owner_sid);
++
++	sd = security_descriptor_dacl_create(tctx,
++					0, NULL, NULL,
++					owner_sid,
++					SEC_ACE_TYPE_ACCESS_ALLOWED,
++					SEC_FILE_READ_DATA,
++					0,
++					NULL);
++
++	ZERO_STRUCT(set);
++	set.set_secdesc.level = RAW_SFILEINFO_SEC_DESC;
++	set.set_secdesc.in.file.handle = handle;
++	set.set_secdesc.in.secinfo_flags = SECINFO_DACL;
++	set.set_secdesc.in.sd = sd;
++
++	status = smb2_setinfo_file(tree, &set);
++	torture_assert_ntstatus_ok_goto(tctx, status, ret, done,
++					"smb2_setinfo_file failed\n");
++
++	smb2_util_close(tree, handle);
++	ZERO_STRUCT(handle);
++
++	for (i = 0; i < ARRAY_SIZE(tcases); i++) {
++		torture_comment(tctx, "Verify open with %s dispostion\n",
++				tcases[i].disposition_string);
++
++		c = (struct smb2_create) {
++			.in.create_disposition = tcases[i].disposition,
++			.in.desired_access = SEC_FILE_READ_DATA,
++			.in.file_attributes = FILE_ATTRIBUTE_NORMAL,
++			.in.share_access = NTCREATEX_SHARE_ACCESS_MASK,
++			.in.impersonation_level = NTCREATEX_IMPERSONATION_ANONYMOUS,
++			.in.fname = fname,
++		};
++
++		status = smb2_create(tree, tctx, &c);
++		smb2_util_close(tree, c.out.file.handle);
++		torture_assert_ntstatus_equal_goto(
++			tctx, status, tcases[i].expected_status, ret, done,
++			"smb2_create failed\n");
++	};
++
++	torture_comment(tctx, "put back original sd\n");
++
++	c = (struct smb2_create) {
++		.in.desired_access = SEC_STD_WRITE_DAC,
++		.in.file_attributes = FILE_ATTRIBUTE_NORMAL,
++		.in.share_access = NTCREATEX_SHARE_ACCESS_MASK,
++		.in.create_disposition = NTCREATEX_DISP_OPEN_IF,
++		.in.impersonation_level = NTCREATEX_IMPERSONATION_ANONYMOUS,
++		.in.fname = fname,
++	};
++
++	status = smb2_create(tree, tctx, &c);
++	torture_assert_ntstatus_ok_goto(tctx, status, ret, done,
++					"smb2_create failed\n");
++	handle = c.out.file.handle;
++
++	ZERO_STRUCT(set);
++	set.set_secdesc.level = RAW_SFILEINFO_SEC_DESC;
++	set.set_secdesc.in.file.handle = handle;
++	set.set_secdesc.in.secinfo_flags = SECINFO_DACL;
++	set.set_secdesc.in.sd = sd_orig;
++
++	status = smb2_setinfo_file(tree, &set);
++	torture_assert_ntstatus_ok_goto(tctx, status, ret, done,
++					"smb2_setinfo_file failed\n");
++
++	smb2_util_close(tree, handle);
++	ZERO_STRUCT(handle);
++
++done:
++	smb2_util_close(tree, handle);
++	smb2_util_unlink(tree, fname);
++	smb2_deltree(tree, BASEDIR);
++	return ret;
++}
++
++
+ /*
+    basic testing of SMB2 ACLs
+ */
+@@ -3051,6 +3194,8 @@ struct torture_suite *torture_smb2_acls_init(TALLOC_CTX *ctx)
+			test_deny1);
+	torture_suite_add_1smb2_test(suite, "MXAC-NOT-GRANTED",
+			test_mxac_not_granted);
++	torture_suite_add_1smb2_test(suite, "OVERWRITE_READ_ONLY_FILE",
++			test_overwrite_read_only_file);
+
+	suite->description = talloc_strdup(suite, "SMB2-ACLS tests");
+
+--
+2.40.0
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb b/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
index aa27592cb..dcb4d8137 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
@@ -49,6 +49,8 @@ SRC_URI = "${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz \
            file://CVE-2023-34968_0009.patch \
            file://CVE-2023-34968_0010.patch \
            file://CVE-2023-34968_0011.patch \
+           file://CVE-2023-4091-0001.patch \
+           file://CVE-2023-4091-0002.patch \
            "
 
 SRC_URI:append:libc-musl = " \
-- 
2.40.0


