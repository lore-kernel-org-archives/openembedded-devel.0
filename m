Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83F42E75451
	for <webhook@archiver.kernel.org>; Tue,  3 Oct 2023 11:48:09 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.106350.1696333680094777139
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Oct 2023 04:48:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=P0mTmDWn;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8640eb28df=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 393A39cn005302
	for <openembedded-devel@lists.openembedded.org>; Tue, 3 Oct 2023 11:47:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding; s=PPS06212021; bh=Sufgpy5E55fsCZHThp
	8t5AEoL+2NK5tLZdOG2KrT0KM=; b=P0mTmDWnelN5iVgfAbF4dGCJDa+Z0GdbMf
	JqB7asQmY7999yVaiQ5wXGPZjh/zg9DU3sqTclVa4i7SewH4TjfPjzGaOT1qD1Sj
	kjiPvvOhYtmLwKdnqUDd6blE5o0qFo0tqdPdyHZsn7vBVzxvehsHy7U12KSFlrMK
	HDxpcp0al69+zblqziEVIEDgnxpmGOozByR9Bux5P2YrzdVFTBptixwLZqb4s6SP
	Brc4UYsbayIuT2a2HWZDBPJYkZSHznSrPYc77Fnkm5BzUpRRVqWBwZN/vxeJRj02
	4bahe1QNX6IpD3FndVdzGpL60HsTOWrm8Ik1k0ATBHDx3IRnXvbA==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3tean62qnp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 03 Oct 2023 11:47:58 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 3 Oct 2023 04:47:51 -0700
From: Archana Polampalli <archana.polampalli@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-networking][kirkstone][PATCH  1/1] samba: fix CVE-2023-34968
Date: Tue, 3 Oct 2023 11:47:40 +0000
Message-ID: <20231003114740.2859984-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: t7RR5ayjFUB-0TyNl0FzTPVbIWisBEnB
X-Proofpoint-ORIG-GUID: t7RR5ayjFUB-0TyNl0FzTPVbIWisBEnB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-03_08,2023-10-02_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 suspectscore=0 clxscore=1015 phishscore=0 malwarescore=0
 lowpriorityscore=0 mlxscore=0 adultscore=0 mlxlogscore=999 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2309180000 definitions=main-2310030084
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 393A39cn005302
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Oct 2023 11:48:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105319

A path disclosure vulnerability was found in Samba. As part of the Spotli=
ght protocol,
Samba discloses the server-side absolute path of shares, files, and direc=
tories in the
results for search queries. This flaw allows a malicious client or an att=
acker with a
targeted RPC request to view the information that is part of the disclose=
d path.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../samba/samba/CVE-2023-34968_0001.patch     | 104 ++++
 .../samba/samba/CVE-2023-34968_0002.patch     |  39 ++
 .../samba/samba/CVE-2023-34968_0003.patch     |  65 +++
 .../samba/samba/CVE-2023-34968_0004.patch     |  85 +++
 .../samba/samba/CVE-2023-34968_0005.patch     |  83 +++
 .../samba/samba/CVE-2023-34968_0006.patch     |  57 +++
 .../samba/samba/CVE-2023-34968_0007.patch     |  49 ++
 .../samba/samba/CVE-2023-34968_0008.patch     |  62 +++
 .../samba/samba/CVE-2023-34968_0009.patch     | 465 +++++++++++++++++
 .../samba/samba/CVE-2023-34968_0010.patch     | 484 ++++++++++++++++++
 .../samba/samba/CVE-2023-34968_0011.patch     | 295 +++++++++++
 .../samba/samba_4.14.14.bb                    |  11 +
 12 files changed, 1799 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-=
2023-34968_0001.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-=
2023-34968_0002.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-=
2023-34968_0003.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-=
2023-34968_0004.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-=
2023-34968_0005.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-=
2023-34968_0006.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-=
2023-34968_0007.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-=
2023-34968_0008.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-=
2023-34968_0009.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-=
2023-34968_0010.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-=
2023-34968_0011.patch

diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34=
968_0001.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-202=
3-34968_0001.patch
new file mode 100644
index 000000000..ad8e3e4ce
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_000=
1.patch
@@ -0,0 +1,104 @@
+From 98b2a013bc723cd660978d5a1db40b987816f90e Mon Sep 17 00:00:00 2001
+From: Ralph Boehme <slow@samba.org>
+Date: Tue, 6 Jun 2023 15:17:26 +0200
+Subject: [PATCH] CVE-2023-34968: mdssvc: cache and reuse stat info in st=
ruct
+ sl_inode_path_map
+
+Prepare for the "path" being a fake path and not the real server-side
+path where we won't be able to vfs_stat_fsp() this fake path. Luckily we=
 already
+got stat info for the object in mds_add_result() so we can just pass sta=
t info
+from there.
+
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D15388
+
+Signed-off-by: Ralph Boehme <slow@samba.org>
+Reviewed-by: Stefan Metzmacher <metze@samba.org>
+
+Upstream-Status: Backport [https://github.com/samba-team/samba/commit/98=
b2a013bc723cd660978d5a1db40b987816f90e]
+
+CVE: CVE-2023-34968
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ source3/rpc_server/mdssvc/mdssvc.c | 32 +++++++-----------------------
+ source3/rpc_server/mdssvc/mdssvc.h |  1 +
+ 2 files changed, 8 insertions(+), 25 deletions(-)
+
+diff --git a/source3/rpc_server/mdssvc/mdssvc.c b/source3/rpc_server/mds=
svc/mdssvc.c
+index 26a3ec7..a6cc653 100644
+--- a/source3/rpc_server/mdssvc/mdssvc.c
++++ b/source3/rpc_server/mdssvc/mdssvc.c
+@@ -446,7 +446,10 @@ static int ino_path_map_destr_cb(struct sl_inode_pa=
th_map *entry)
+  * entries by calling talloc_free() on the query slq handles.
+  **/
+
+-static bool inode_map_add(struct sl_query *slq, uint64_t ino, const cha=
r *path)
++static bool inode_map_add(struct sl_query *slq,
++			  uint64_t ino,
++			  const char *path,
++			  struct stat_ex *st)
+ {
+	NTSTATUS status;
+	struct sl_inode_path_map *entry;
+@@ -493,6 +496,7 @@ static bool inode_map_add(struct sl_query *slq, uint=
64_t ino, const char *path)
+
+	entry->ino =3D ino;
+	entry->mds_ctx =3D slq->mds_ctx;
++	entry->st =3D *st;
+	entry->path =3D talloc_strdup(entry, path);
+	if (entry->path =3D=3D NULL) {
+		DEBUG(1, ("talloc failed\n"));
+@@ -629,7 +633,7 @@ bool mds_add_result(struct sl_query *slq, const char=
 *path)
+		return false;
+	}
+
+-	ok =3D inode_map_add(slq, ino64, path);
++	ok =3D inode_map_add(slq, ino64, path, &sb);
+	if (!ok) {
+		DEBUG(1, ("inode_map_add error\n"));
+		slq->state =3D SLQ_STATE_ERROR;
+@@ -1350,29 +1354,7 @@ static bool slrpc_fetch_attributes(struct mds_ctx=
 *mds_ctx,
+		elem =3D talloc_get_type_abort(p, struct sl_inode_path_map);
+		path =3D elem->path;
+
+-		status =3D synthetic_pathref(talloc_tos(),
+-					   mds_ctx->conn->cwd_fsp,
+-					   path,
+-					   NULL,
+-					   NULL,
+-					   0,
+-					   0,
+-					   &smb_fname);
+-		if (!NT_STATUS_IS_OK(status)) {
+-			/* This is not an error, the user may lack permissions */
+-			DBG_DEBUG("synthetic_pathref [%s]: %s\n",
+-				  smb_fname_str_dbg(smb_fname),
+-				  nt_errstr(status));
+-			return true;
+-		}
+-
+-		result =3D SMB_VFS_FSTAT(smb_fname->fsp, &smb_fname->st);
+-		if (result !=3D 0) {
+-			TALLOC_FREE(smb_fname);
+-			return true;
+-		}
+-
+-		sp =3D &smb_fname->st;
++		sp =3D &elem->st;
+	}
+
+	ok =3D add_filemeta(mds_ctx, reqinfo, fm_array, path, sp);
+diff --git a/source3/rpc_server/mdssvc/mdssvc.h b/source3/rpc_server/mds=
svc/mdssvc.h
+index 3924827..a097991 100644
+--- a/source3/rpc_server/mdssvc/mdssvc.h
++++ b/source3/rpc_server/mdssvc/mdssvc.h
+@@ -105,6 +105,7 @@ struct sl_inode_path_map {
+	struct mds_ctx    *mds_ctx;
+	uint64_t           ino;
+	char              *path;
++	struct stat_ex     st;
+ };
+
+ /* Per process state */
+--
+2.40.0
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34=
968_0002.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-202=
3-34968_0002.patch
new file mode 100644
index 000000000..21b98c4d7
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_000=
2.patch
@@ -0,0 +1,39 @@
+From 47a0c1681dd1e7ec407679793966ec8bdc08a24e Mon Sep 17 00:00:00 2001
+From: Ralph Boehme <slow@samba.org>
+Date: Sat, 17 Jun 2023 13:39:55 +0200
+Subject: [PATCH] CVE-2023-34968: mdssvc: add missing "kMDSStoreMetaScope=
s"
+ dict key in slrpc_fetch_properties()
+
+We were adding the value, but not the key.
+
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D15388
+
+Signed-off-by: Ralph Boehme <slow@samba.org>
+Reviewed-by: Stefan Metzmacher <metze@samba.org>
+
+Upstream-Status: Backport [https://github.com/samba-team/samba/commit/47=
a0c1681dd1e7ec407679793966ec8bdc08a24e]
+
+CVE: CVE-2023-34968
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ source3/rpc_server/mdssvc/mdssvc.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/source3/rpc_server/mdssvc/mdssvc.c b/source3/rpc_server/mds=
svc/mdssvc.c
+index a6d09a43b9c..9c23ef95753 100644
+--- a/source3/rpc_server/mdssvc/mdssvc.c
++++ b/source3/rpc_server/mdssvc/mdssvc.c
+@@ -730,6 +730,10 @@ static bool slrpc_fetch_properties(struct mds_ctx *=
mds_ctx,
+	}
+
+	/* kMDSStoreMetaScopes array */
++	result =3D dalloc_stradd(dict, "kMDSStoreMetaScopes");
++	if (result !=3D 0) {
++		return false;
++	}
+	array =3D dalloc_zero(dict, sl_array_t);
+	if (array =3D=3D NULL) {
+		return NULL;
+--
+2.40.0
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34=
968_0003.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-202=
3-34968_0003.patch
new file mode 100644
index 000000000..42106d82b
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_000=
3.patch
@@ -0,0 +1,65 @@
+From 56a21b3bc8fb24416ead9061f9305c8122bc7f86 Mon Sep 17 00:00:00 2001
+From: Ralph Boehme <slow@samba.org>
+Date: Mon, 19 Jun 2023 17:14:38 +0200
+Subject: [PATCH] CVE-2023-34968: mdscli: use correct TALLOC memory conte=
xt
+ when allocating spotlight_blob
+
+d is talloc_free()d at the end of the functions and the buffer was later=
 used
+after beeing freed in the DCERPC layer when sending the packet.
+
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D15388
+
+Signed-off-by: Ralph Boehme <slow@samba.org>
+Reviewed-by: Stefan Metzmacher <metze@samba.org>
+
+Upstream-Status: Backport [https://github.com/samba-team/samba/commit/56=
a21b3bc8fb24416ead9061f9305c8122bc7f86]
+
+CVE: CVE-2023-34968
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ source3/rpc_client/cli_mdssvc_util.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/source3/rpc_client/cli_mdssvc_util.c b/source3/rpc_client/c=
li_mdssvc_util.c
+index fe5092c3790..892a844e71a 100644
+--- a/source3/rpc_client/cli_mdssvc_util.c
++++ b/source3/rpc_client/cli_mdssvc_util.c
+@@ -209,7 +209,7 @@ NTSTATUS mdscli_blob_search(TALLOC_CTX *mem_ctx,
+		return NT_STATUS_NO_MEMORY;
+	}
+
+-	blob->spotlight_blob =3D talloc_array(d,
++	blob->spotlight_blob =3D talloc_array(mem_ctx,
+					    uint8_t,
+					    ctx->max_fragment_size);
+	if (blob->spotlight_blob =3D=3D NULL) {
+@@ -293,7 +293,7 @@ NTSTATUS mdscli_blob_get_results(TALLOC_CTX *mem_ctx=
,
+		return NT_STATUS_NO_MEMORY;
+	}
+
+-	blob->spotlight_blob =3D talloc_array(d,
++	blob->spotlight_blob =3D talloc_array(mem_ctx,
+					    uint8_t,
+					    ctx->max_fragment_size);
+	if (blob->spotlight_blob =3D=3D NULL) {
+@@ -426,7 +426,7 @@ NTSTATUS mdscli_blob_get_path(TALLOC_CTX *mem_ctx,
+		return NT_STATUS_NO_MEMORY;
+	}
+
+-	blob->spotlight_blob =3D talloc_array(d,
++	blob->spotlight_blob =3D talloc_array(mem_ctx,
+					    uint8_t,
+					    ctx->max_fragment_size);
+	if (blob->spotlight_blob =3D=3D NULL) {
+@@ -510,7 +510,7 @@ NTSTATUS mdscli_blob_close_search(TALLOC_CTX *mem_ct=
x,
+		return NT_STATUS_NO_MEMORY;
+	}
+
+-	blob->spotlight_blob =3D talloc_array(d,
++	blob->spotlight_blob =3D talloc_array(mem_ctx,
+					    uint8_t,
+					    ctx->max_fragment_size);
+	if (blob->spotlight_blob =3D=3D NULL) {
+--
+2.40.0
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34=
968_0004.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-202=
3-34968_0004.patch
new file mode 100644
index 000000000..785908b52
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_000=
4.patch
@@ -0,0 +1,85 @@
+From 0ae6084d1a9c4eb12e9f1ab1902e00f96bcbea55 Mon Sep 17 00:00:00 2001
+From: Ralph Boehme <slow@samba.org>
+Date: Mon, 19 Jun 2023 18:28:41 +0200
+Subject: [PATCH] CVE-2023-34968: mdscli: remove response blob allocation
+
+This is handled by the NDR code transparently.
+
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D15388
+
+Signed-off-by: Ralph Boehme <slow@samba.org>
+Reviewed-by: Stefan Metzmacher <metze@samba.org>
+---
+ source3/rpc_client/cli_mdssvc.c | 36 ---------------------------------
+ 1 file changed, 36 deletions(-)
+
+diff --git a/source3/rpc_client/cli_mdssvc.c b/source3/rpc_client/cli_md=
ssvc.c
+index 046d37135cb..474d7c0b150 100644
+--- a/source3/rpc_client/cli_mdssvc.c
++++ b/source3/rpc_client/cli_mdssvc.c
+@@ -276,15 +276,6 @@ struct tevent_req *mdscli_search_send(TALLOC_CTX *m=
em_ctx,
+		return tevent_req_post(req, ev);
+	}
+
+-	state->response_blob.spotlight_blob =3D talloc_array(
+-		state,
+-		uint8_t,
+-		mdscli_ctx->max_fragment_size);
+-	if (tevent_req_nomem(state->response_blob.spotlight_blob, req)) {
+-		return tevent_req_post(req, ev);
+-	}
+-	state->response_blob.size =3D mdscli_ctx->max_fragment_size;
+-
+	subreq =3D dcerpc_mdssvc_cmd_send(state,
+					ev,
+					mdscli_ctx->bh,
+@@ -457,15 +448,6 @@ struct tevent_req *mdscli_get_results_send(
+		return tevent_req_post(req, ev);
+	}
+
+-	state->response_blob.spotlight_blob =3D talloc_array(
+-		state,
+-		uint8_t,
+-		mdscli_ctx->max_fragment_size);
+-	if (tevent_req_nomem(state->response_blob.spotlight_blob, req)) {
+-		return tevent_req_post(req, ev);
+-	}
+-	state->response_blob.size =3D mdscli_ctx->max_fragment_size;
+-
+	subreq =3D dcerpc_mdssvc_cmd_send(state,
+					ev,
+					mdscli_ctx->bh,
+@@ -681,15 +663,6 @@ struct tevent_req *mdscli_get_path_send(TALLOC_CTX =
*mem_ctx,
+		return tevent_req_post(req, ev);
+	}
+
+-	state->response_blob.spotlight_blob =3D talloc_array(
+-		state,
+-		uint8_t,
+-		mdscli_ctx->max_fragment_size);
+-	if (tevent_req_nomem(state->response_blob.spotlight_blob, req)) {
+-		return tevent_req_post(req, ev);
+-	}
+-	state->response_blob.size =3D mdscli_ctx->max_fragment_size;
+-
+	subreq =3D dcerpc_mdssvc_cmd_send(state,
+					ev,
+					mdscli_ctx->bh,
+@@ -852,15 +825,6 @@ struct tevent_req *mdscli_close_search_send(TALLOC_=
CTX *mem_ctx,
+		return tevent_req_post(req, ev);
+	}
+
+-	state->response_blob.spotlight_blob =3D talloc_array(
+-		state,
+-		uint8_t,
+-		mdscli_ctx->max_fragment_size);
+-	if (tevent_req_nomem(state->response_blob.spotlight_blob, req)) {
+-		return tevent_req_post(req, ev);
+-	}
+-	state->response_blob.size =3D mdscli_ctx->max_fragment_size;
+-
+	subreq =3D dcerpc_mdssvc_cmd_send(state,
+					ev,
+					mdscli_ctx->bh,
+--
+2.40.0
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34=
968_0005.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-202=
3-34968_0005.patch
new file mode 100644
index 000000000..308b441e9
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_000=
5.patch
@@ -0,0 +1,83 @@
+From 353a9ccea6ff93ea2cd604dcc2b0372f056f819d Mon Sep 17 00:00:00 2001
+From: Ralph Boehme <slow@samba.org>
+Date: Tue, 20 Jun 2023 11:28:47 +0200
+Subject: [PATCH] CVE-2023-34968: smbtorture: remove response blob alloca=
tion
+ in mdssvc.c
+
+This is alreay done by NDR for us.
+
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D15388
+
+Signed-off-by: Ralph Boehme <slow@samba.org>
+Reviewed-by: Stefan Metzmacher <metze@samba.org>
+
+Upstream-Status: Backport [https://github.com/samba-team/samba/commit/35=
3a9ccea6ff93ea2cd604dcc2b0372f056f819d]
+
+CVE: CVE-2023-34968
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+
+---
+ source4/torture/rpc/mdssvc.c | 26 --------------------------
+ 1 file changed, 26 deletions(-)
+
+diff --git a/source4/torture/rpc/mdssvc.c b/source4/torture/rpc/mdssvc.c
+index 3689692f7de..a16bd5b47e3 100644
+--- a/source4/torture/rpc/mdssvc.c
++++ b/source4/torture/rpc/mdssvc.c
+@@ -536,13 +536,6 @@ static bool test_mdssvc_invalid_ph_cmd(struct tortu=
re_context *tctx,
+	request_blob.length =3D 0;
+	request_blob.size =3D 0;
+
+-	response_blob.spotlight_blob =3D talloc_array(state,
+-						    uint8_t,
+-						    0);
+-	torture_assert_not_null_goto(tctx, response_blob.spotlight_blob,
+-				     ok, done, "dalloc_zero failed\n");
+-	response_blob.size =3D 0;
+-
+	status =3D  dcerpc_mdssvc_cmd(b,
+				    state,
+				    &ph,
+@@ -632,13 +625,6 @@ static bool test_mdssvc_sl_unpack_loop(struct tortu=
re_context *tctx,
+	request_blob.size =3D sizeof(test_sl_unpack_loop_buf);
+	request_blob.length =3D sizeof(test_sl_unpack_loop_buf);
+
+-	response_blob.spotlight_blob =3D talloc_array(state,
+-						    uint8_t,
+-						    0);
+-	torture_assert_not_null_goto(tctx, response_blob.spotlight_blob,
+-				     ok, done, "dalloc_zero failed\n");
+-	response_blob.size =3D 0;
+-
+	status =3D dcerpc_mdssvc_cmd(b,
+				   state,
+				   &state->ph,
+@@ -764,11 +750,6 @@ static bool test_sl_dict_type_safety(struct torture=
_context *tctx,
+	torture_assert_goto(tctx, request_blob.length > 0,
+			    ok, done, "sl_pack failed\n");
+
+-	response_blob.spotlight_blob =3D talloc_array(state, uint8_t, 0);
+-	torture_assert_not_null_goto(tctx, response_blob.spotlight_blob,
+-				     ok, done, "dalloc_zero failed\n");
+-	response_blob.size =3D 0;
+-
+	status =3D dcerpc_mdssvc_cmd(b,
+				   state,
+				   &state->ph,
+@@ -926,13 +907,6 @@ static bool test_mdssvc_fetch_attr_unknown_cnid(str=
uct torture_context *tctx,
+				     ret, done, "dalloc_zero failed\n");
+	request_blob.size =3D max_fragment_size;
+
+-	response_blob.spotlight_blob =3D talloc_array(state,
+-						    uint8_t,
+-						    max_fragment_size);
+-	torture_assert_not_null_goto(tctx, response_blob.spotlight_blob,
+-				     ret, done, "dalloc_zero failed\n");
+-	response_blob.size =3D max_fragment_size;
+-
+	len =3D sl_pack(d, (char *)request_blob.spotlight_blob, request_blob.si=
ze);
+	torture_assert_goto(tctx, len !=3D -1, ret, done, "sl_pack failed\n");
+
+--
+2.40.0
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34=
968_0006.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-202=
3-34968_0006.patch
new file mode 100644
index 000000000..34526a8c8
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_000=
6.patch
@@ -0,0 +1,57 @@
+From 449f1280b718c6da3b8e309fe124be4e9bfd8184 Mon Sep 17 00:00:00 2001
+From: Ralph Boehme <slow@samba.org>
+Date: Tue, 20 Jun 2023 11:35:41 +0200
+Subject: [PATCH] CVE-2023-34968: rpcclient: remove response blob allocat=
ion
+
+This is alreay done by NDR for us.
+
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D15388
+
+Signed-off-by: Ralph Boehme <slow@samba.org>
+Reviewed-by: Stefan Metzmacher <metze@samba.org>
+
+Upstream-Status: Backport [https://github.com/samba-team/samba/commit/44=
9f1280b718c6da3b8e309fe124be4e9bfd8184]
+
+CVE: CVE-2023-34968
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ source3/rpcclient/cmd_spotlight.c | 16 ----------------
+ 1 file changed, 16 deletions(-)
+
+diff --git a/source3/rpcclient/cmd_spotlight.c b/source3/rpcclient/cmd_s=
potlight.c
+index 24db9893df6..64fe321089c 100644
+--- a/source3/rpcclient/cmd_spotlight.c
++++ b/source3/rpcclient/cmd_spotlight.c
+@@ -144,13 +144,6 @@ static NTSTATUS cmd_mdssvc_fetch_properties(
+	}
+	request_blob.size =3D max_fragment_size;
+
+-	response_blob.spotlight_blob =3D talloc_array(mem_ctx, uint8_t, max_fr=
agment_size);
+-	if (response_blob.spotlight_blob =3D=3D NULL) {
+-		status =3D NT_STATUS_INTERNAL_ERROR;
+-		goto done;
+-	}
+-	response_blob.size =3D max_fragment_size;
+-
+	len =3D sl_pack(d, (char *)request_blob.spotlight_blob, request_blob.si=
ze);
+	if (len =3D=3D -1) {
+		status =3D NT_STATUS_INTERNAL_ERROR;
+@@ -368,15 +361,6 @@ static NTSTATUS cmd_mdssvc_fetch_attributes(
+	}
+	request_blob.size =3D max_fragment_size;
+
+-	response_blob.spotlight_blob =3D talloc_array(mem_ctx,
+-						    uint8_t,
+-						    max_fragment_size);
+-	if (response_blob.spotlight_blob =3D=3D NULL) {
+-		status =3D NT_STATUS_INTERNAL_ERROR;
+-		goto done;
+-	}
+-	response_blob.size =3D max_fragment_size;
+-
+	len =3D sl_pack(d, (char *)request_blob.spotlight_blob, request_blob.si=
ze);
+	if (len =3D=3D -1) {
+		status =3D NT_STATUS_INTERNAL_ERROR;
+--
+2.40.0
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34=
968_0007.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-202=
3-34968_0007.patch
new file mode 100644
index 000000000..679e174c0
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_000=
7.patch
@@ -0,0 +1,49 @@
+From cc593a6ac531f02f2fe70fd4f7dfe649a02f9206 Mon Sep 17 00:00:00 2001
+From: Ralph Boehme <slow@samba.org>
+Date: Tue, 20 Jun 2023 11:42:10 +0200
+Subject: [PATCH] CVE-2023-34968: mdssvc: remove response blob allocation
+
+This is alreay done by NDR for us.
+
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D15388
+
+Signed-off-by: Ralph Boehme <slow@samba.org>
+Reviewed-by: Stefan Metzmacher <metze@samba.org>
+
+Upstream-Status: Backport [https://github.com/samba-team/samba/commit/cc=
593a6ac531f02f2fe70fd4f7dfe649a02f9206]
+
+CVE: CVE-2023-34968
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ source3/rpc_server/mdssvc/srv_mdssvc_nt.c | 8 --------
+ 1 file changed, 8 deletions(-)
+
+diff --git a/source3/rpc_server/mdssvc/srv_mdssvc_nt.c b/source3/rpc_ser=
ver/mdssvc/srv_mdssvc_nt.c
+index b8eed8b..714e6c1 100644
+--- a/source3/rpc_server/mdssvc/srv_mdssvc_nt.c
++++ b/source3/rpc_server/mdssvc/srv_mdssvc_nt.c
+@@ -209,7 +209,6 @@ void _mdssvc_unknown1(struct pipes_struct *p, struct=
 mdssvc_unknown1 *r)
+ void _mdssvc_cmd(struct pipes_struct *p, struct mdssvc_cmd *r)
+ {
+	bool ok;
+-	char *rbuf;
+	struct mds_ctx *mds_ctx;
+	NTSTATUS status;
+
+@@ -266,13 +265,6 @@ void _mdssvc_cmd(struct pipes_struct *p, struct mds=
svc_cmd *r)
+		return;
+	}
+
+-	rbuf =3D talloc_zero_array(p->mem_ctx, char, r->in.max_fragment_size1)=
;
+-	if (rbuf =3D=3D NULL) {
+-		p->fault_state =3D DCERPC_FAULT_CANT_PERFORM;
+-		return;
+-	}
+-	r->out.response_blob->spotlight_blob =3D (uint8_t *)rbuf;
+-	r->out.response_blob->size =3D r->in.max_fragment_size1;
+
+	/* We currently don't use fragmentation at the mdssvc RPC layer */
+	*r->out.fragment =3D 0;
+--
+2.40.0
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34=
968_0008.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-202=
3-34968_0008.patch
new file mode 100644
index 000000000..e65379fe8
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_000=
8.patch
@@ -0,0 +1,62 @@
+From 397919e82b493206ae9b60bb9c539d52c3207729 Mon Sep 17 00:00:00 2001
+From: Archana Polampalli <archana.polampalli@windriver.com>
+Date: Fri, 29 Sep 2023 08:59:31 +0000
+Subject: [PATCH] CVE-2023-34968: mdssvc: switch to doing an early return
+
+Just reduce indentation of the code handling the success case. No change=
 in
+behaviour.
+
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D15388
+
+Signed-off-by: Ralph Boehme <slow@samba.org>
+Reviewed-by: Stefan Metzmacher <metze@samba.org>
+
+Upstream-Status: Backport [https://github.com/samba-team/samba/commit/39=
7919e82b493206ae9b60bb9c539d52c3207729]
+
+CVE: CVE-2023-34968
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ source3/rpc_server/mdssvc/mdssvc.c | 26 ++++++++++++++------------
+ 1 file changed, 14 insertions(+), 12 deletions(-)
+
+diff --git a/source3/rpc_server/mdssvc/mdssvc.c b/source3/rpc_server/mds=
svc/mdssvc.c
+index a6cc653..0e6a916 100644
+--- a/source3/rpc_server/mdssvc/mdssvc.c
++++ b/source3/rpc_server/mdssvc/mdssvc.c
+@@ -1798,19 +1798,21 @@ bool mds_dispatch(struct mds_ctx *mds_ctx,
+	}
+
+	ok =3D slcmd->function(mds_ctx, query, reply);
+-	if (ok) {
+-		DBG_DEBUG("%s", dalloc_dump(reply, 0));
+-
+-		len =3D sl_pack(reply,
+-			      (char *)response_blob->spotlight_blob,
+-			      response_blob->size);
+-		if (len =3D=3D -1) {
+-			DBG_ERR("error packing Spotlight RPC reply\n");
+-			ok =3D false;
+-			goto cleanup;
+-		}
+-		response_blob->length =3D len;
++        if (!ok) {
++		goto cleanup;
++	}
++
++	DBG_DEBUG("%s", dalloc_dump(reply, 0));
++
++	len =3D sl_pack(reply,
++		      (char *)response_blob->spotlight_blob,
++		      response_blob->size);
++	if (len =3D=3D -1) {
++		DBG_ERR("error packing Spotlight RPC reply\n");
++		ok =3D false;
++		goto cleanup;
+	}
++	response_blob->length =3D len;
+
+ cleanup:
+	talloc_free(query);
+--
+2.40.0
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34=
968_0009.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-202=
3-34968_0009.patch
new file mode 100644
index 000000000..e21f2ba4b
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_000=
9.patch
@@ -0,0 +1,465 @@
+From cb8313e7bee75454ce29d2b2f657927259298f52 Mon Sep 17 00:00:00 2001
+From: Ralph Boehme <slow@samba.org>
+Date: Mon, 19 Jun 2023 18:16:57 +0200
+Subject: [PATCH] CVE-2023-34968: mdssvc: introduce an allocating wrapper=
 to
+ sl_pack()
+
+sl_pack_alloc() does the buffer allocation that previously all callers o=
f
+sl_pack() did themselves.
+
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D15388
+
+Signed-off-by: Ralph Boehme <slow@samba.org>
+Reviewed-by: Stefan Metzmacher <metze@samba.org>
+
+Upstream-Status: Backport [https://github.com/samba-team/samba/commit/cb=
8313e7bee75454ce29d2b2f657927259298f52]
+
+CVE: CVE-2023-34968
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ source3/rpc_client/cli_mdssvc_util.c      | 80 +++++------------------
+ source3/rpc_server/mdssvc/marshalling.c   | 35 ++++++++--
+ source3/rpc_server/mdssvc/marshalling.h   |  9 ++-
+ source3/rpc_server/mdssvc/mdssvc.c        | 18 ++---
+ source3/rpc_server/mdssvc/mdssvc.h        |  5 +-
+ source3/rpc_server/mdssvc/srv_mdssvc_nt.c |  5 +-
+ source3/rpcclient/cmd_spotlight.c         | 32 ++-------
+ source4/torture/rpc/mdssvc.c              | 24 ++-----
+ 8 files changed, 80 insertions(+), 128 deletions(-)
+
+diff --git a/source3/rpc_client/cli_mdssvc_util.c b/source3/rpc_client/c=
li_mdssvc_util.c
+index 892a844..a39202d 100644
+--- a/source3/rpc_client/cli_mdssvc_util.c
++++ b/source3/rpc_client/cli_mdssvc_util.c
+@@ -42,7 +42,7 @@ NTSTATUS mdscli_blob_search(TALLOC_CTX *mem_ctx,
+	sl_array_t *scope_array =3D NULL;
+	double dval;
+	uint64_t uint64val;
+-	ssize_t len;
++	NTSTATUS status;
+	int ret;
+
+	d =3D dalloc_new(mem_ctx);
+@@ -209,23 +209,11 @@ NTSTATUS mdscli_blob_search(TALLOC_CTX *mem_ctx,
+		return NT_STATUS_NO_MEMORY;
+	}
+
+-	blob->spotlight_blob =3D talloc_array(mem_ctx,
+-					    uint8_t,
+-					    ctx->max_fragment_size);
+-	if (blob->spotlight_blob =3D=3D NULL) {
+-		TALLOC_FREE(d);
+-		return NT_STATUS_NO_MEMORY;
+-	}
+-	blob->size =3D ctx->max_fragment_size;
+-
+-	len =3D sl_pack(d, (char *)blob->spotlight_blob, blob->size);
++	status =3D sl_pack_alloc(mem_ctx, d, blob, ctx->max_fragment_size);
+	TALLOC_FREE(d);
+-	if (len =3D=3D -1) {
+-		return NT_STATUS_NO_MEMORY;
++	if (!NT_STATUS_IS_OK(status)) {
++		return status;
+	}
+-
+-	blob->length =3D len;
+-	blob->size =3D len;
+	return NT_STATUS_OK;
+ }
+
+@@ -238,7 +226,7 @@ NTSTATUS mdscli_blob_get_results(TALLOC_CTX *mem_ctx=
,
+	uint64_t *uint64p =3D NULL;
+	sl_array_t *array =3D NULL;
+	sl_array_t *cmd_array =3D NULL;
+-	ssize_t len;
++	NTSTATUS status;
+	int ret;
+
+	d =3D dalloc_new(mem_ctx);
+@@ -293,23 +281,11 @@ NTSTATUS mdscli_blob_get_results(TALLOC_CTX *mem_c=
tx,
+		return NT_STATUS_NO_MEMORY;
+	}
+
+-	blob->spotlight_blob =3D talloc_array(mem_ctx,
+-					    uint8_t,
+-					    ctx->max_fragment_size);
+-	if (blob->spotlight_blob =3D=3D NULL) {
+-		TALLOC_FREE(d);
+-		return NT_STATUS_NO_MEMORY;
+-	}
+-	blob->size =3D ctx->max_fragment_size;
+-
+-	len =3D sl_pack(d, (char *)blob->spotlight_blob, blob->size);
++	status =3D sl_pack_alloc(mem_ctx, d, blob, ctx->max_fragment_size);
+	TALLOC_FREE(d);
+-	if (len =3D=3D -1) {
+-		return NT_STATUS_NO_MEMORY;
++	if (!NT_STATUS_IS_OK(status)) {
++		return status;
+	}
+-
+-	blob->length =3D len;
+-	blob->size =3D len;
+	return NT_STATUS_OK;
+ }
+
+@@ -325,7 +301,7 @@ NTSTATUS mdscli_blob_get_path(TALLOC_CTX *mem_ctx,
+	sl_array_t *cmd_array =3D NULL;
+	sl_array_t *attr_array =3D NULL;
+	sl_cnids_t *cnids =3D NULL;
+-	ssize_t len;
++	NTSTATUS status;
+	int ret;
+
+	d =3D dalloc_new(mem_ctx);
+@@ -426,23 +402,11 @@ NTSTATUS mdscli_blob_get_path(TALLOC_CTX *mem_ctx,
+		return NT_STATUS_NO_MEMORY;
+	}
+
+-	blob->spotlight_blob =3D talloc_array(mem_ctx,
+-					    uint8_t,
+-					    ctx->max_fragment_size);
+-	if (blob->spotlight_blob =3D=3D NULL) {
+-		TALLOC_FREE(d);
+-		return NT_STATUS_NO_MEMORY;
+-	}
+-	blob->size =3D ctx->max_fragment_size;
+-
+-	len =3D sl_pack(d, (char *)blob->spotlight_blob, blob->size);
++	status =3D sl_pack_alloc(mem_ctx, d, blob, ctx->max_fragment_size);
+	TALLOC_FREE(d);
+-	if (len =3D=3D -1) {
+-		return NT_STATUS_NO_MEMORY;
++	if (!NT_STATUS_IS_OK(status)) {
++		return status;
+	}
+-
+-	blob->length =3D len;
+-	blob->size =3D len;
+	return NT_STATUS_OK;
+ }
+
+@@ -455,7 +419,7 @@ NTSTATUS mdscli_blob_close_search(TALLOC_CTX *mem_ct=
x,
+	uint64_t *uint64p =3D NULL;
+	sl_array_t *array =3D NULL;
+	sl_array_t *cmd_array =3D NULL;
+-	ssize_t len;
++	NTSTATUS status;
+	int ret;
+
+	d =3D dalloc_new(mem_ctx);
+@@ -510,22 +474,10 @@ NTSTATUS mdscli_blob_close_search(TALLOC_CTX *mem_=
ctx,
+		return NT_STATUS_NO_MEMORY;
+	}
+
+-	blob->spotlight_blob =3D talloc_array(mem_ctx,
+-					    uint8_t,
+-					    ctx->max_fragment_size);
+-	if (blob->spotlight_blob =3D=3D NULL) {
+-		TALLOC_FREE(d);
+-		return NT_STATUS_NO_MEMORY;
+-	}
+-	blob->size =3D ctx->max_fragment_size;
+-
+-	len =3D sl_pack(d, (char *)blob->spotlight_blob, blob->size);
++	status =3D sl_pack_alloc(mem_ctx, d, blob, ctx->max_fragment_size);
+	TALLOC_FREE(d);
+-	if (len =3D=3D -1) {
+-		return NT_STATUS_NO_MEMORY;
++	if (!NT_STATUS_IS_OK(status)) {
++		return status;
+	}
+-
+-	blob->length =3D len;
+-	blob->size =3D len;
+	return NT_STATUS_OK;
+ }
+diff --git a/source3/rpc_server/mdssvc/marshalling.c b/source3/rpc_serve=
r/mdssvc/marshalling.c
+index 441d411..34bfda5 100644
+--- a/source3/rpc_server/mdssvc/marshalling.c
++++ b/source3/rpc_server/mdssvc/marshalling.c
+@@ -78,6 +78,7 @@ static ssize_t sl_unpack_loop(DALLOC_CTX *query, const=
 char *buf,
+			      ssize_t offset, size_t bufsize,
+			      int count, ssize_t toc_offset,
+			      int encoding);
++static ssize_t sl_pack(DALLOC_CTX *query, char *buf, size_t bufsize);
+
+ /**********************************************************************=
********
+  * Wrapper functions for the *VAL macros with bound checking
+@@ -1190,11 +1191,7 @@ static ssize_t sl_unpack_loop(DALLOC_CTX *query,
+	return offset;
+ }
+
+-/**********************************************************************=
********
+- * Global functions for packing und unpacking
+- **********************************************************************=
********/
+-
+-ssize_t sl_pack(DALLOC_CTX *query, char *buf, size_t bufsize)
++static ssize_t sl_pack(DALLOC_CTX *query, char *buf, size_t bufsize)
+ {
+	ssize_t result;
+	char *toc_buf;
+@@ -1274,6 +1271,34 @@ ssize_t sl_pack(DALLOC_CTX *query, char *buf, siz=
e_t bufsize)
+	return len;
+ }
+
++/**********************************************************************=
********
++ * Global functions for packing und unpacking
++ **********************************************************************=
********/
++
++NTSTATUS sl_pack_alloc(TALLOC_CTX *mem_ctx,
++		       DALLOC_CTX *d,
++		       struct mdssvc_blob *b,
++		       size_t max_fragment_size)
++{
++	ssize_t len;
++
++	b->spotlight_blob =3D talloc_zero_array(mem_ctx,
++					      uint8_t,
++					      max_fragment_size);
++	if (b->spotlight_blob =3D=3D NULL) {
++		return NT_STATUS_NO_MEMORY;
++	}
++
++	len =3D sl_pack(d, (char *)b->spotlight_blob, max_fragment_size);
++	if (len =3D=3D -1) {
++		return NT_STATUS_DATA_ERROR;
++	}
++
++	b->length =3D len;
++	b->size =3D len;
++	return NT_STATUS_OK;
++}
++
+ bool sl_unpack(DALLOC_CTX *query, const char *buf, size_t bufsize)
+ {
+	ssize_t result;
+diff --git a/source3/rpc_server/mdssvc/marshalling.h b/source3/rpc_serve=
r/mdssvc/marshalling.h
+index 086ca74..2cc1b44 100644
+--- a/source3/rpc_server/mdssvc/marshalling.h
++++ b/source3/rpc_server/mdssvc/marshalling.h
+@@ -22,6 +22,9 @@
+ #define _MDSSVC_MARSHALLING_H
+
+ #include "dalloc.h"
++#include "libcli/util/ntstatus.h"
++#include "lib/util/data_blob.h"
++#include "librpc/gen_ndr/mdssvc.h"
+
+ #define MAX_SL_FRAGMENT_SIZE 0xFFFFF
+
+@@ -49,7 +52,11 @@ typedef struct {
+  * Function declarations
+  **********************************************************************=
********/
+
+-extern ssize_t sl_pack(DALLOC_CTX *query, char *buf, size_t bufsize);
++extern NTSTATUS sl_pack_alloc(TALLOC_CTX *mem_ctx,
++			      DALLOC_CTX *d,
++			      struct mdssvc_blob *b,
++			      size_t max_fragment_size);
++
+ extern bool sl_unpack(DALLOC_CTX *query, const char *buf, size_t bufsiz=
e);
+
+ #endif
+diff --git a/source3/rpc_server/mdssvc/mdssvc.c b/source3/rpc_server/mds=
svc/mdssvc.c
+index 0e6a916..19257e8 100644
+--- a/source3/rpc_server/mdssvc/mdssvc.c
++++ b/source3/rpc_server/mdssvc/mdssvc.c
+@@ -1726,11 +1726,11 @@ error:
+  **/
+ bool mds_dispatch(struct mds_ctx *mds_ctx,
+		  struct mdssvc_blob *request_blob,
+-		  struct mdssvc_blob *response_blob)
++		  struct mdssvc_blob *response_blob,
++		  size_t max_fragment_size)
+ {
+	bool ok;
+	int ret;
+-	ssize_t len;
+	DALLOC_CTX *query =3D NULL;
+	DALLOC_CTX *reply =3D NULL;
+	char *rpccmd;
+@@ -1738,6 +1738,7 @@ bool mds_dispatch(struct mds_ctx *mds_ctx,
+	const struct smb_filename conn_basedir =3D {
+		.base_name =3D mds_ctx->conn->connectpath,
+	};
++	NTSTATUS status;
+
+	if (CHECK_DEBUGLVL(10)) {
+		const struct sl_query *slq;
+@@ -1804,15 +1805,14 @@ bool mds_dispatch(struct mds_ctx *mds_ctx,
+
+	DBG_DEBUG("%s", dalloc_dump(reply, 0));
+
+-	len =3D sl_pack(reply,
+-		      (char *)response_blob->spotlight_blob,
+-		      response_blob->size);
+-	if (len =3D=3D -1) {
+-		DBG_ERR("error packing Spotlight RPC reply\n");
+-		ok =3D false;
++	status =3D sl_pack_alloc(response_blob,
++			       reply,
++			       response_blob,
++			       max_fragment_size);
++	if (!NT_STATUS_IS_OK(status)) {
++		DBG_ERR("sl_pack_alloc() failed\n");
+		goto cleanup;
+	}
+-	response_blob->length =3D len;
+
+ cleanup:
+	talloc_free(query);
+diff --git a/source3/rpc_server/mdssvc/mdssvc.h b/source3/rpc_server/mds=
svc/mdssvc.h
+index a097991..b3bd8b9 100644
+--- a/source3/rpc_server/mdssvc/mdssvc.h
++++ b/source3/rpc_server/mdssvc/mdssvc.h
+@@ -157,9 +157,10 @@ struct mds_ctx *mds_init_ctx(TALLOC_CTX *mem_ctx,
+			     int snum,
+			     const char *sharename,
+			     const char *path);
+-extern bool mds_dispatch(struct mds_ctx *query_ctx,
++extern bool mds_dispatch(struct mds_ctx *mds_ctx,
+			 struct mdssvc_blob *request_blob,
+-			 struct mdssvc_blob *response_blob);
++			 struct mdssvc_blob *response_blob,
++			 size_t max_fragment_size);
+ bool mds_add_result(struct sl_query *slq, const char *path);
+
+ #endif /* _MDSSVC_H */
+diff --git a/source3/rpc_server/mdssvc/srv_mdssvc_nt.c b/source3/rpc_ser=
ver/mdssvc/srv_mdssvc_nt.c
+index 714e6c1..59e2a97 100644
+--- a/source3/rpc_server/mdssvc/srv_mdssvc_nt.c
++++ b/source3/rpc_server/mdssvc/srv_mdssvc_nt.c
+@@ -269,7 +269,10 @@ void _mdssvc_cmd(struct pipes_struct *p, struct mds=
svc_cmd *r)
+	/* We currently don't use fragmentation at the mdssvc RPC layer */
+	*r->out.fragment =3D 0;
+
+-	ok =3D mds_dispatch(mds_ctx, &r->in.request_blob, r->out.response_blob=
);
++	ok =3D mds_dispatch(mds_ctx,
++			  &r->in.request_blob,
++			  r->out.response_blob,
++			  r->in.max_fragment_size1);
+	if (ok) {
+		*r->out.unkn9 =3D 0;
+	} else {
+diff --git a/source3/rpcclient/cmd_spotlight.c b/source3/rpcclient/cmd_s=
potlight.c
+index 64fe321..ba3f61f 100644
+--- a/source3/rpcclient/cmd_spotlight.c
++++ b/source3/rpcclient/cmd_spotlight.c
+@@ -43,7 +43,6 @@ static NTSTATUS cmd_mdssvc_fetch_properties(
+	uint32_t unkn3;	     /* server always returns 0 ? */
+	struct mdssvc_blob request_blob;
+	struct mdssvc_blob response_blob;
+-	ssize_t len;
+	uint32_t max_fragment_size =3D 64 * 1024;
+	DALLOC_CTX *d, *mds_reply;
+	uint64_t *uint64var;
+@@ -137,20 +136,10 @@ static NTSTATUS cmd_mdssvc_fetch_properties(
+		goto done;
+	}
+
+-	request_blob.spotlight_blob =3D talloc_array(mem_ctx, uint8_t, max_fra=
gment_size);
+-	if (request_blob.spotlight_blob =3D=3D NULL) {
+-		status =3D NT_STATUS_INTERNAL_ERROR;
+-		goto done;
+-	}
+-	request_blob.size =3D max_fragment_size;
+-
+-	len =3D sl_pack(d, (char *)request_blob.spotlight_blob, request_blob.s=
ize);
+-	if (len =3D=3D -1) {
+-		status =3D NT_STATUS_INTERNAL_ERROR;
++	status =3D sl_pack_alloc(mem_ctx, d, &request_blob, max_fragment_size)=
;
++	if (!NT_STATUS_IS_OK(status)) {
+		goto done;
+	}
+-	request_blob.length =3D len;
+-	request_blob.size =3D len;
+
+	status =3D  dcerpc_mdssvc_cmd(b, mem_ctx,
+				    &share_handle,
+@@ -204,7 +193,6 @@ static NTSTATUS cmd_mdssvc_fetch_attributes(
+	uint32_t unkn3;	     /* server always returns 0 ? */
+	struct mdssvc_blob request_blob;
+	struct mdssvc_blob response_blob;
+-	ssize_t len;
+	uint32_t max_fragment_size =3D 64 * 1024;
+	DALLOC_CTX *d, *mds_reply;
+	uint64_t *uint64var;
+@@ -352,22 +340,10 @@ static NTSTATUS cmd_mdssvc_fetch_attributes(
+		goto done;
+	}
+
+-	request_blob.spotlight_blob =3D talloc_array(mem_ctx,
+-						   uint8_t,
+-						   max_fragment_size);
+-	if (request_blob.spotlight_blob =3D=3D NULL) {
+-		status =3D NT_STATUS_INTERNAL_ERROR;
+-		goto done;
+-	}
+-	request_blob.size =3D max_fragment_size;
+-
+-	len =3D sl_pack(d, (char *)request_blob.spotlight_blob, request_blob.s=
ize);
+-	if (len =3D=3D -1) {
+-		status =3D NT_STATUS_INTERNAL_ERROR;
++	status =3D sl_pack_alloc(mem_ctx, d, &request_blob, max_fragment_size)=
;
++	if (!NT_STATUS_IS_OK(status)) {
+		goto done;
+	}
+-	request_blob.length =3D len;
+-	request_blob.size =3D len;
+
+	status =3D dcerpc_mdssvc_cmd(b, mem_ctx,
+				   &share_handle,
+diff --git a/source4/torture/rpc/mdssvc.c b/source4/torture/rpc/mdssvc.c
+index e99c82c..1305456 100644
+--- a/source4/torture/rpc/mdssvc.c
++++ b/source4/torture/rpc/mdssvc.c
+@@ -745,11 +745,9 @@ static bool test_sl_dict_type_safety(struct torture=
_context *tctx,
+				     ok, done, "dalloc_new failed\n");
+	request_blob.size =3D 64 * 1024;
+
+-	request_blob.length =3D sl_pack(d,
+-				      (char *)request_blob.spotlight_blob,
+-				      request_blob.size);
+-	torture_assert_goto(tctx, request_blob.length > 0,
+-			    ok, done, "sl_pack failed\n");
++	status =3D sl_pack_alloc(tctx, d, &request_blob, 64 * 1024);
++	torture_assert_ntstatus_ok_goto(tctx, status, ok, done,
++					"sl_pack_alloc() failed\n");
+
+	status =3D dcerpc_mdssvc_cmd(b,
+				   state,
+@@ -836,7 +834,6 @@ static bool test_mdssvc_fetch_attr_unknown_cnid(stru=
ct torture_context *tctx,
+	const char *path_type =3D NULL;
+	uint64_t ino64;
+	NTSTATUS status;
+-	ssize_t len;
+	int ret;
+	bool ok =3D true;
+
+@@ -901,19 +898,10 @@ static bool test_mdssvc_fetch_attr_unknown_cnid(st=
ruct torture_context *tctx,
+	ret =3D dalloc_add(array, cnids, sl_cnids_t);
+	torture_assert_goto(tctx, ret =3D=3D 0, ret, done, "dalloc_add failed\n=
");
+
+-	request_blob.spotlight_blob =3D talloc_array(state,
+-						   uint8_t,
+-						   max_fragment_size);
+-	torture_assert_not_null_goto(tctx, request_blob.spotlight_blob,
+-				     ret, done, "dalloc_zero failed\n");
+-	request_blob.size =3D max_fragment_size;
+-
+-	len =3D sl_pack(d, (char *)request_blob.spotlight_blob, request_blob.s=
ize);
+-	torture_assert_goto(tctx, len !=3D -1, ret, done, "sl_pack failed\n");
+-
+-	request_blob.length =3D len;
+-	request_blob.size =3D len;
+
++	status =3D sl_pack_alloc(tctx, d, &request_blob, max_fragment_size);
++	torture_assert_ntstatus_ok_goto(tctx, status, ok, done,
++					"sl_pack_alloc() failed\n");
+	status =3D  dcerpc_mdssvc_cmd(b,
+				    state,
+				    &state->ph,
+--
+2.40.0
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34=
968_0010.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-202=
3-34968_0010.patch
new file mode 100644
index 000000000..57668f5ee
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_001=
0.patch
@@ -0,0 +1,484 @@
+From a5c570e262911874e43e82de601d809aa5b1b729 Mon Sep 17 00:00:00 2001
+From: Ralph Boehme <slow@samba.org>
+Date: Sat, 17 Jun 2023 13:53:27 +0200
+Subject: [PATCH] CVE-2023-34968: mdscli: return share relative paths The=
 next
+ commit will change the Samba Spotlight server to return absolute paths =
that
+ start with the sharename as "/SHARENAME/..." followed by the share path
+ relative appended.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+So given a share
+
+  [spotlight]
+    path =3D /foo/bar
+    spotlight =3D yes
+
+and a file inside this share with a full path of
+
+  /foo/bar/dir/file
+
+previously a search that matched this file would returns the absolute
+server-side pato of the file, ie
+
+  /foo/bar/dir/file
+
+This will be change to
+
+  /spotlight/dir/file
+
+As currently the mdscli library and hence the mdsearch tool print out th=
ese
+paths returned from the server, we have to change the output to accomoda=
te these
+fake paths. The only way to do this sensibly is by makeing the paths rel=
ative to
+the containing share, so just
+
+  dir/file
+
+in the example above.
+
+The client learns about the share root path prefix =E2=80=93 real server=
-side of fake in
+the future =E2=80=93 in an initial handshake in the "share_path" out arg=
ument of the
+mdssvc_open() RPC call, so the client can use this path to convert the a=
bsolute
+path to relative.
+
+There is however an additional twist: the macOS Spotlight server prefixe=
s this
+absolute path with another prefix, typically "/System/Volumes/Data", so =
in the
+example above the full path for the same search would be
+
+  /System/Volumes/Data/foo/bar/dir/file
+
+So macOS does return the full server-side path too, just prefixed with a=
n
+additional path. This path prefixed can be queried by the client in the
+mdssvc_cmd() RPC call with an Spotlight command of "fetchPropertiesForCo=
ntext:"
+and the path is returned in a dictionary with key "kMDSStorePathScopes".=
 Samba
+just returns "/" for this.
+
+Currently the mdscli library doesn't issue this Spotlight RPC
+request (fetchPropertiesForContext), so this is added in this commit. In=
 the
+end, all search result paths are stripped of the combined prefix
+
+  kMDSStorePathScopes + share_path (from mdssvc_open).
+
+eg
+
+  kMDSStorePathScopes =3D /System/Volumes/Data
+  share_path =3D /foo/bar
+  search result =3D /System/Volumes/Data/foo/bar/dir/file
+  relative path returned by mdscli =3D dir/file
+
+Makes sense? :)
+
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D15388
+
+Signed-off-by: Ralph Boehme <slow@samba.org>
+Reviewed-by: Stefan Metzmacher <metze@samba.org>
+
+Upstream-Status: Backport [https://github.com/samba-team/samba/commit/a5=
c570e262911874e43e82de601d809aa5b1b729]
+
+CVE: CVE-2023-34968
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ python/samba/tests/dcerpc/mdssvc.py     |  26 ++--
+ source3/rpc_client/cli_mdssvc.c         | 155 +++++++++++++++++++++++-
+ source3/rpc_client/cli_mdssvc_private.h |   4 +
+ source3/rpc_client/cli_mdssvc_util.c    |  68 +++++++++++
+ source3/rpc_client/cli_mdssvc_util.h    |   4 +
+ 5 files changed, 243 insertions(+), 14 deletions(-)
+
+diff --git a/python/samba/tests/dcerpc/mdssvc.py b/python/samba/tests/dc=
erpc/mdssvc.py
+index b0df509..5002e5d 100644
+--- a/python/samba/tests/dcerpc/mdssvc.py
++++ b/python/samba/tests/dcerpc/mdssvc.py
+@@ -84,10 +84,11 @@ class MdssvcTests(RpcInterfaceTestCase):
+         self.t =3D threading.Thread(target=3DMdssvcTests.http_server, a=
rgs=3D(self,))
+         self.t.setDaemon(True)
+         self.t.start()
++        self.sharepath =3D os.environ["LOCAL_PATH"]
+         time.sleep(1)
+
+         conn =3D mdscli.conn(self.pipe, 'spotlight', '/foo')
+-        self.sharepath =3D conn.sharepath()
++        self.fakepath =3D conn.sharepath()
+         conn.disconnect(self.pipe)
+
+         for file in testfiles:
+@@ -105,12 +106,11 @@ class MdssvcTests(RpcInterfaceTestCase):
+         self.server.serve_forever()
+
+     def run_test(self, query, expect, json_in, json_out):
+-        expect =3D [s.replace("%BASEPATH%", self.sharepath) for s in ex=
pect]
+         self.server.json_in =3D json_in.replace("%BASEPATH%", self.shar=
epath)
+         self.server.json_out =3D json_out.replace("%BASEPATH%", self.sh=
arepath)
+
+         self.conn =3D mdscli.conn(self.pipe, 'spotlight', '/foo')
+-        search =3D self.conn.search(self.pipe, query, self.sharepath)
++        search =3D self.conn.search(self.pipe, query, self.fakepath)
+
+         # Give it some time, the get_results() below returns immediatel=
y
+         # what's available, so if we ask to soon, we might get back no =
results
+@@ -141,7 +141,7 @@ class MdssvcTests(RpcInterfaceTestCase):
+             ]
+           }
+         }'''
+-        exp_results =3D ["%BASEPATH%/foo", "%BASEPATH%/bar"]
++        exp_results =3D ["foo", "bar"]
+         self.run_test('*=3D=3D"samba*"', exp_results, exp_json_query, f=
ake_json_response)
+
+     def test_mdscli_search_escapes(self):
+@@ -181,14 +181,14 @@ class MdssvcTests(RpcInterfaceTestCase):
+           }
+         }'''
+         exp_results =3D [
+-            r"%BASEPATH%/x+x",
+-            r"%BASEPATH%/x*x",
+-            r"%BASEPATH%/x=3Dx",
+-            r"%BASEPATH%/x'x",
+-            r"%BASEPATH%/x?x",
+-            r"%BASEPATH%/x x",
+-            r"%BASEPATH%/x(x",
+-            "%BASEPATH%/x\"x",
+-            r"%BASEPATH%/x\x",
++            r"x+x",
++            r"x*x",
++            r"x=3Dx",
++            r"x'x",
++            r"x?x",
++            r"x x",
++            r"x(x",
++            "x\"x",
++            r"x\x",
+         ]
+         self.run_test(sl_query, exp_results, exp_json_query, fake_json_=
response)
+diff --git a/source3/rpc_client/cli_mdssvc.c b/source3/rpc_client/cli_md=
ssvc.c
+index 07c19b5..a047b91 100644
+--- a/source3/rpc_client/cli_mdssvc.c
++++ b/source3/rpc_client/cli_mdssvc.c
+@@ -43,10 +43,12 @@ char *mdscli_get_basepath(TALLOC_CTX *mem_ctx,
+ struct mdscli_connect_state {
+	struct tevent_context *ev;
+	struct mdscli_ctx *mdscli_ctx;
++	struct mdssvc_blob response_blob;
+ };
+
+ static void mdscli_connect_open_done(struct tevent_req *subreq);
+ static void mdscli_connect_unknown1_done(struct tevent_req *subreq);
++static void mdscli_connect_fetch_props_done(struct tevent_req *subreq);
+
+ struct tevent_req *mdscli_connect_send(TALLOC_CTX *mem_ctx,
+				       struct tevent_context *ev,
+@@ -111,6 +113,7 @@ static void mdscli_connect_open_done(struct tevent_r=
eq *subreq)
+	struct mdscli_connect_state *state =3D tevent_req_data(
+		req, struct mdscli_connect_state);
+	struct mdscli_ctx *mdscli_ctx =3D state->mdscli_ctx;
++	size_t share_path_len;
+	NTSTATUS status;
+
+	status =3D dcerpc_mdssvc_open_recv(subreq, state);
+@@ -120,6 +123,18 @@ static void mdscli_connect_open_done(struct tevent_=
req *subreq)
+		return;
+	}
+
++	share_path_len =3D strlen(mdscli_ctx->mdscmd_open.share_path);
++	if (share_path_len < 1 || share_path_len > UINT16_MAX) {
++		tevent_req_nterror(req, NT_STATUS_INTERNAL_ERROR);
++		return;
++	}
++	mdscli_ctx->mdscmd_open.share_path_len =3D share_path_len;
++
++	if (mdscli_ctx->mdscmd_open.share_path[share_path_len-1] =3D=3D '/') {
++		mdscli_ctx->mdscmd_open.share_path[share_path_len-1] =3D '\0';
++		mdscli_ctx->mdscmd_open.share_path_len--;
++	}
++
+	subreq =3D dcerpc_mdssvc_unknown1_send(
+			state,
+			state->ev,
+@@ -146,6 +161,8 @@ static void mdscli_connect_unknown1_done(struct teve=
nt_req *subreq)
+		subreq, struct tevent_req);
+	struct mdscli_connect_state *state =3D tevent_req_data(
+		req, struct mdscli_connect_state);
++	struct mdscli_ctx *mdscli_ctx =3D state->mdscli_ctx;
++	struct mdssvc_blob request_blob;
+	NTSTATUS status;
+
+	status =3D dcerpc_mdssvc_unknown1_recv(subreq, state);
+@@ -153,6 +170,108 @@ static void mdscli_connect_unknown1_done(struct te=
vent_req *subreq)
+	if (tevent_req_nterror(req, status)) {
+		return;
+	}
++	status =3D mdscli_blob_fetch_props(state,
++					 state->mdscli_ctx,
++					 &request_blob);
++	if (tevent_req_nterror(req, status)) {
++		return;
++	}
++
++	subreq =3D dcerpc_mdssvc_cmd_send(state,
++					state->ev,
++					mdscli_ctx->bh,
++					&mdscli_ctx->ph,
++					0,
++					mdscli_ctx->dev,
++					mdscli_ctx->mdscmd_open.unkn2,
++					0,
++					mdscli_ctx->flags,
++					request_blob,
++					0,
++					mdscli_ctx->max_fragment_size,
++					1,
++					mdscli_ctx->max_fragment_size,
++					0,
++					0,
++					&mdscli_ctx->mdscmd_cmd.fragment,
++					&state->response_blob,
++					&mdscli_ctx->mdscmd_cmd.unkn9);
++	if (tevent_req_nomem(subreq, req)) {
++		return;
++	}
++	tevent_req_set_callback(subreq, mdscli_connect_fetch_props_done, req);
++	mdscli_ctx->async_pending++;
++	return;
++}
++
++static void mdscli_connect_fetch_props_done(struct tevent_req *subreq)
++{
++	struct tevent_req *req =3D tevent_req_callback_data(
++		subreq, struct tevent_req);
++	struct mdscli_connect_state *state =3D tevent_req_data(
++		req, struct mdscli_connect_state);
++	struct mdscli_ctx *mdscli_ctx =3D state->mdscli_ctx;
++	DALLOC_CTX *d =3D NULL;
++	sl_array_t *path_scope_array =3D NULL;
++	char *path_scope =3D NULL;
++	NTSTATUS status;
++	bool ok;
++
++	status =3D dcerpc_mdssvc_cmd_recv(subreq, state);
++	TALLOC_FREE(subreq);
++	state->mdscli_ctx->async_pending--;
++	if (tevent_req_nterror(req, status)) {
++		return;
++	}
++
++	d =3D dalloc_new(state);
++	if (tevent_req_nomem(d, req)) {
++		return;
++	}
++
++	ok =3D sl_unpack(d,
++		       (char *)state->response_blob.spotlight_blob,
++		       state->response_blob.length);
++	if (!ok) {
++		tevent_req_nterror(req, NT_STATUS_INTERNAL_ERROR);
++		return;
++	}
++
++	path_scope_array =3D dalloc_value_for_key(d,
++						"DALLOC_CTX", 0,
++						"kMDSStorePathScopes",
++						"sl_array_t");
++	if (path_scope_array =3D=3D NULL) {
++		DBG_ERR("Missing kMDSStorePathScopes\n");
++		tevent_req_nterror(req, NT_STATUS_INTERNAL_ERROR);
++		return;
++	}
++
++	path_scope =3D dalloc_get(path_scope_array, "char *", 0);
++	if (path_scope =3D=3D NULL) {
++		DBG_ERR("Missing path in kMDSStorePathScopes\n");
++		tevent_req_nterror(req, NT_STATUS_INTERNAL_ERROR);
++		return;
++	}
++
++	mdscli_ctx->path_scope_len =3D strlen(path_scope);
++	if (mdscli_ctx->path_scope_len < 1 ||
++	    mdscli_ctx->path_scope_len > UINT16_MAX)
++	{
++		DBG_ERR("Bad path_scope: %s\n", path_scope);
++		tevent_req_nterror(req, NT_STATUS_INTERNAL_ERROR);
++		return;
++	}
++	mdscli_ctx->path_scope =3D talloc_strdup(mdscli_ctx, path_scope);
++	if (tevent_req_nomem(mdscli_ctx->path_scope, req)) {
++		return;
++	}
++
++	if (mdscli_ctx->path_scope[mdscli_ctx->path_scope_len-1] =3D=3D '/') {
++		mdscli_ctx->path_scope[mdscli_ctx->path_scope_len-1] =3D '\0';
++		mdscli_ctx->path_scope_len--;
++	}
++
+
+	tevent_req_done(req);
+ }
+@@ -697,7 +816,10 @@ static void mdscli_get_path_done(struct tevent_req =
*subreq)
+	struct mdscli_get_path_state *state =3D tevent_req_data(
+		req, struct mdscli_get_path_state);
+	DALLOC_CTX *d =3D NULL;
++	size_t pathlen;
++	size_t prefixlen;
+	char *path =3D NULL;
++	const char *p =3D NULL;
+	NTSTATUS status;
+	bool ok;
+
+@@ -732,7 +854,38 @@ static void mdscli_get_path_done(struct tevent_req =
*subreq)
+		tevent_req_nterror(req, NT_STATUS_INTERNAL_ERROR);
+		return;
+	}
+-	state->path =3D talloc_move(state, &path);
++
++	/* Path is prefixed by /PATHSCOPE/SHARENAME/, strip it */
++	pathlen =3D strlen(path);
++
++	/*
++	 * path_scope_len and share_path_len are already checked to be smaller
++	 * then UINT16_MAX so this can't overflow
++	 */
++	prefixlen =3D state->mdscli_ctx->path_scope_len
++		+ state->mdscli_ctx->mdscmd_open.share_path_len;
++
++	if (pathlen < prefixlen) {
++		DBG_DEBUG("Bad path: %s\n", path);
++		tevent_req_nterror(req, NT_STATUS_INVALID_PARAMETER);
++		return;
++	}
++
++	p =3D path + prefixlen;
++	while (*p =3D=3D '/') {
++		p++;
++	}
++	if (*p =3D=3D '\0') {
++		DBG_DEBUG("Bad path: %s\n", path);
++		tevent_req_nterror(req, NT_STATUS_INVALID_PARAMETER);
++		return;
++	}
++
++	state->path =3D talloc_strdup(state, p);
++	if (state->path =3D=3D NULL) {
++		tevent_req_nterror(req, NT_STATUS_NO_MEMORY);
++		return;
++	}
+	DBG_DEBUG("path: %s\n", state->path);
+
+	tevent_req_done(req);
+diff --git a/source3/rpc_client/cli_mdssvc_private.h b/source3/rpc_clien=
t/cli_mdssvc_private.h
+index 031af85..b10aca0 100644
+--- a/source3/rpc_client/cli_mdssvc_private.h
++++ b/source3/rpc_client/cli_mdssvc_private.h
+@@ -42,6 +42,7 @@ struct mdscli_ctx {
+	/* cmd specific or unknown fields */
+	struct {
+		char share_path[1025];
++		size_t share_path_len;
+		uint32_t unkn2;
+		uint32_t unkn3;
+	} mdscmd_open;
+@@ -56,6 +57,9 @@ struct mdscli_ctx {
+	struct {
+		uint32_t status;
+	} mdscmd_close;
++
++	char *path_scope;
++	size_t path_scope_len;
+ };
+
+ struct mdscli_search_ctx {
+diff --git a/source3/rpc_client/cli_mdssvc_util.c b/source3/rpc_client/c=
li_mdssvc_util.c
+index a39202d..1eaaca7 100644
+--- a/source3/rpc_client/cli_mdssvc_util.c
++++ b/source3/rpc_client/cli_mdssvc_util.c
+@@ -28,6 +28,74 @@
+ #include "rpc_server/mdssvc/dalloc.h"
+ #include "rpc_server/mdssvc/marshalling.h"
+
++NTSTATUS mdscli_blob_fetch_props(TALLOC_CTX *mem_ctx,
++				 struct mdscli_ctx *ctx,
++				 struct mdssvc_blob *blob)
++{
++	DALLOC_CTX *d =3D NULL;
++	uint64_t *uint64p =3D NULL;
++	sl_array_t *array =3D NULL;
++	sl_array_t *cmd_array =3D NULL;
++	NTSTATUS status;
++	int ret;
++
++	d =3D dalloc_new(mem_ctx);
++	if (d =3D=3D NULL) {
++		return NT_STATUS_NO_MEMORY;
++	}
++
++	array =3D dalloc_zero(d, sl_array_t);
++	if (array =3D=3D NULL) {
++		TALLOC_FREE(d);
++		return NT_STATUS_NO_MEMORY;
++	}
++
++	ret =3D dalloc_add(d, array, sl_array_t);
++	if (ret !=3D 0) {
++		TALLOC_FREE(d);
++		return NT_STATUS_NO_MEMORY;
++	}
++
++	cmd_array =3D dalloc_zero(d, sl_array_t);
++	if (cmd_array =3D=3D NULL) {
++		TALLOC_FREE(d);
++		return NT_STATUS_NO_MEMORY;
++	}
++
++	ret =3D dalloc_add(array, cmd_array, sl_array_t);
++	if (ret !=3D 0) {
++		TALLOC_FREE(d);
++		return NT_STATUS_NO_MEMORY;
++	}
++
++	ret =3D dalloc_stradd(cmd_array, "fetchPropertiesForContext:");
++	if (ret !=3D 0) {
++		TALLOC_FREE(d);
++		return NT_STATUS_NO_MEMORY;
++	}
++
++	uint64p =3D talloc_zero_array(cmd_array, uint64_t, 2);
++	if (uint64p =3D=3D NULL) {
++		TALLOC_FREE(d);
++		return NT_STATUS_NO_MEMORY;
++	}
++
++	talloc_set_name(uint64p, "uint64_t *");
++
++	ret =3D dalloc_add(cmd_array, uint64p, uint64_t *);
++	if (ret !=3D 0) {
++		TALLOC_FREE(d);
++		return NT_STATUS_NO_MEMORY;
++	}
++
++	status =3D sl_pack_alloc(mem_ctx, d, blob, ctx->max_fragment_size);
++	TALLOC_FREE(d);
++	if (!NT_STATUS_IS_OK(status)) {
++		return status;
++	}
++	return NT_STATUS_OK;
++}
++
+ NTSTATUS mdscli_blob_search(TALLOC_CTX *mem_ctx,
+			    struct mdscli_search_ctx *search,
+			    struct mdssvc_blob *blob)
+diff --git a/source3/rpc_client/cli_mdssvc_util.h b/source3/rpc_client/c=
li_mdssvc_util.h
+index 7a98c85..3f32475 100644
+--- a/source3/rpc_client/cli_mdssvc_util.h
++++ b/source3/rpc_client/cli_mdssvc_util.h
+@@ -21,6 +21,10 @@
+ #ifndef _MDSCLI_UTIL_H_
+ #define _MDSCLI_UTIL_H_
+
++NTSTATUS mdscli_blob_fetch_props(TALLOC_CTX *mem_ctx,
++				 struct mdscli_ctx *ctx,
++				 struct mdssvc_blob *blob);
++
+ NTSTATUS mdscli_blob_search(TALLOC_CTX *mem_ctx,
+			    struct mdscli_search_ctx *search,
+			    struct mdssvc_blob *blob);
+--
+2.40.0
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34=
968_0011.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-202=
3-34968_0011.patch
new file mode 100644
index 000000000..d2bef187f
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_001=
1.patch
@@ -0,0 +1,295 @@
+From 091b0265fe42878d676def5d4f5b4f8f3977b0e2 Mon Sep 17 00:00:00 2001
+From: Ralph Boehme <slow@samba.org>
+Date: Mon, 5 Jun 2023 18:02:20 +0200
+Subject: [PATCH] CVE-2023-34968: mdssvc: return a fake share path Instea=
d of
+ returning the real server-side absolute path of shares and search resul=
ts,
+ return a fake absolute path replacing the path of the share with the sh=
are
+ name, iow for a share "test" with a server-side path of "/foo/bar", we
+ previously returned
+
+  /foo/bar and
+  /foo/bar/search/result
+
+and now return
+
+  /test and
+  /test/search/result
+
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D15388
+
+Signed-off-by: Ralph Boehme <slow@samba.org>
+Reviewed-by: Stefan Metzmacher <metze@samba.org>
+
+Upstream-Status: Backport [https://github.com/samba-team/samba/commit/09=
1b0265fe42878d676def5d4f5b4f8f3977b0e2]
+
+CVE: CVE-2023-34968
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ source3/lib/util_path.c                   | 52 ++++++++++++++++++++
+ source3/lib/util_path.h                   |  5 ++
+ source3/rpc_server/mdssvc/mdssvc.c        | 60 +++++++++++++++++++++--
+ source3/rpc_server/mdssvc/mdssvc.h        |  1 +
+ source3/rpc_server/mdssvc/srv_mdssvc_nt.c | 17 +++++--
+ 6 files changed, 128 insertions(+), 7 deletions(-)
+ mode change 100755 =3D> 100644 source3/libads/ldap.c
+
+diff --git a/source3/lib/util_path.c b/source3/lib/util_path.c
+index c34b734..5b5a51c 100644
+--- a/source3/lib/util_path.c
++++ b/source3/lib/util_path.c
+@@ -21,8 +21,10 @@
+  * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+  */
+
++#include "includes.h"
+ #include "replace.h"
+ #include <talloc.h>
++#include "lib/util/debug.h"
+ #include "lib/util/samba_util.h"
+ #include "lib/util_path.h"
+
+@@ -210,3 +212,53 @@ char *canonicalize_absolute_path(TALLOC_CTX *ctx, c=
onst char *pathname_in)
+	*p++ =3D '\0';
+	return pathname;
+ }
++
++/*
++ * Take two absolute paths, figure out if "subdir" is a proper
++ * subdirectory of "parent". Return the component relative to the
++ * "parent" without the potential "/". Take care of "parent"
++ * possibly ending in "/".
++ */
++bool subdir_of(const char *parent,
++	       size_t parent_len,
++	       const char *subdir,
++	       const char **_relative)
++{
++	const char *relative =3D NULL;
++	bool matched;
++
++	SMB_ASSERT(parent[0] =3D=3D '/');
++	SMB_ASSERT(subdir[0] =3D=3D '/');
++
++	if (parent_len =3D=3D 1) {
++		/*
++		 * Everything is below "/"
++		 */
++		*_relative =3D subdir+1;
++		return true;
++	}
++
++	if (parent[parent_len-1] =3D=3D '/') {
++		parent_len -=3D 1;
++	}
++
++	matched =3D (strncmp(subdir, parent, parent_len) =3D=3D 0);
++	if (!matched) {
++		return false;
++	}
++
++	relative =3D &subdir[parent_len];
++
++	if (relative[0] =3D=3D '\0') {
++		*_relative =3D relative; /* nothing left */
++		return true;
++	}
++
++	if (relative[0] =3D=3D '/') {
++		/* End of parent must match a '/' in subdir. */
++		*_relative =3D relative+1;
++		return true;
++	}
++
++	return false;
++}
+diff --git a/source3/lib/util_path.h b/source3/lib/util_path.h
+index 3e7d04d..6d2155a 100644
+--- a/source3/lib/util_path.h
++++ b/source3/lib/util_path.h
+@@ -31,5 +31,10 @@ char *lock_path(TALLOC_CTX *mem_ctx, const char *name=
);
+ char *state_path(TALLOC_CTX *mem_ctx, const char *name);
+ char *cache_path(TALLOC_CTX *mem_ctx, const char *name);
+ char *canonicalize_absolute_path(TALLOC_CTX *ctx, const char *abs_path)=
;
++bool subdir_of(const char *parent,
++               size_t parent_len,
++               const char *subdir,
++               const char **_relative);
++
+
+ #endif
+diff --git a/source3/rpc_server/mdssvc/mdssvc.c b/source3/rpc_server/mds=
svc/mdssvc.c
+index 19257e8..d442d8d 100644
+--- a/source3/rpc_server/mdssvc/mdssvc.c
++++ b/source3/rpc_server/mdssvc/mdssvc.c
+@@ -520,11 +520,14 @@ static bool inode_map_add(struct sl_query *slq,
+ bool mds_add_result(struct sl_query *slq, const char *path)
+ {
+	struct smb_filename *smb_fname =3D NULL;
++	char *fake_path =3D NULL;
++	const char *relative =3D NULL;
+	struct stat_ex sb;
+	uint32_t attr;
+	uint64_t ino64;
+	int result;
+	NTSTATUS status;
++	bool sub;
+	bool ok;
+
+	/*
+@@ -610,6 +613,17 @@ bool mds_add_result(struct sl_query *slq, const cha=
r *path)
+		}
+	}
+
++	sub =3D subdir_of(slq->mds_ctx->spath,
++			slq->mds_ctx->spath_len,
++			path,
++			&relative);
++	if (!sub) {
++		DBG_ERR("[%s] is not inside [%s]\n",
++			path, slq->mds_ctx->spath);
++		slq->state =3D SLQ_STATE_ERROR;
++		return false;
++	}
++
+	/*
+	 * Add inode number and filemeta to result set, this is what
+	 * we return as part of the result set of a query
+@@ -622,18 +636,30 @@ bool mds_add_result(struct sl_query *slq, const ch=
ar *path)
+		slq->state =3D SLQ_STATE_ERROR;
+		return false;
+	}
++
++	fake_path =3D talloc_asprintf(slq,
++				    "/%s/%s",
++				    slq->mds_ctx->sharename,
++				    relative);
++	if (fake_path =3D=3D NULL) {
++		slq->state =3D SLQ_STATE_ERROR;
++		return false;
++	}
++
+	ok =3D add_filemeta(slq->mds_ctx,
+			  slq->reqinfo,
+			  slq->query_results->fm_array,
+-			  path,
++			  fake_path,
+			  &sb);
+	if (!ok) {
+		DBG_ERR("add_filemeta error\n");
++		TALLOC_FREE(fake_path);
+		slq->state =3D SLQ_STATE_ERROR;
+		return false;
+	}
+
+-	ok =3D inode_map_add(slq, ino64, path, &sb);
++	ok =3D inode_map_add(slq, ino64, fake_path, &sb);
++	TALLOC_FREE(fake_path);
+	if (!ok) {
+		DEBUG(1, ("inode_map_add error\n"));
+		slq->state =3D SLQ_STATE_ERROR;
+@@ -840,6 +866,32 @@ static void slq_close_timer(struct tevent_context *=
ev,
+	}
+ }
+
++/**
++ * Translate a fake scope from the client like /sharename/dir
++ * to the real server-side path, replacing the "/sharename" part
++ * with the absolute server-side path of the share.
++ **/
++static bool mdssvc_real_scope(struct sl_query *slq, const char *fake_sc=
ope)
++{
++	size_t sname_len =3D strlen(slq->mds_ctx->sharename);
++	size_t fake_scope_len =3D strlen(fake_scope);
++
++	if (fake_scope_len < sname_len + 1) {
++		DBG_ERR("Short scope [%s] for share [%s]\n",
++			fake_scope, slq->mds_ctx->sharename);
++		return false;
++	}
++
++	slq->path_scope =3D talloc_asprintf(slq,
++					  "%s%s",
++					  slq->mds_ctx->spath,
++					  fake_scope + sname_len + 1);
++	if (slq->path_scope =3D=3D NULL) {
++		return false;
++	}
++	return true;
++}
++
+ /**
+  * Begin a search query
+  **/
+@@ -946,8 +998,8 @@ static bool slrpc_open_query(struct mds_ctx *mds_ctx=
,
+		goto error;
+	}
+
+-	slq->path_scope =3D talloc_strdup(slq, scope);
+-	if (slq->path_scope =3D=3D NULL) {
++	ok =3D mdssvc_real_scope(slq, scope);
++	if (!ok) {
+		goto error;
+	}
+
+diff --git a/source3/rpc_server/mdssvc/mdssvc.h b/source3/rpc_server/mds=
svc/mdssvc.h
+index b3bd8b9..8434812 100644
+--- a/source3/rpc_server/mdssvc/mdssvc.h
++++ b/source3/rpc_server/mdssvc/mdssvc.h
+@@ -127,6 +127,7 @@ struct mds_ctx {
+	int snum;
+	const char *sharename;
+	const char *spath;
++	size_t spath_len;
+	struct connection_struct *conn;
+	struct sl_query *query_list;     /* list of active queries */
+	struct db_context *ino_path_map; /* dbwrap rbt for storing inode->path =
mappings */
+diff --git a/source3/rpc_server/mdssvc/srv_mdssvc_nt.c b/source3/rpc_ser=
ver/mdssvc/srv_mdssvc_nt.c
+index 59e2a97..b20bd2a 100644
+--- a/source3/rpc_server/mdssvc/srv_mdssvc_nt.c
++++ b/source3/rpc_server/mdssvc/srv_mdssvc_nt.c
+@@ -121,6 +121,7 @@ void _mdssvc_open(struct pipes_struct *p, struct mds=
svc_open *r)
+		loadparm_s3_global_substitution();
+	int snum;
+	char *outpath =3D discard_const_p(char, r->out.share_path);
++	char *fake_path =3D NULL;
+	char *path;
+	NTSTATUS status;
+
+@@ -144,21 +145,31 @@ void _mdssvc_open(struct pipes_struct *p, struct m=
dssvc_open *r)
+		return;
+	}
+
++	fake_path =3D talloc_asprintf(p->mem_ctx, "/%s", r->in.share_name);
++	if (fake_path =3D=3D NULL) {
++		DBG_ERR("Couldn't create fake share path for %s\n",
++			r->in.share_name);
++		talloc_free(path);
++		p->fault_state =3D DCERPC_FAULT_CANT_PERFORM;
++		return;
++	}
++
+	status =3D create_mdssvc_policy_handle(p->mem_ctx, p,
+					     snum,
+					     r->in.share_name,
+					     path,
+					     r->out.handle);
+	if (!NT_STATUS_IS_OK(status)) {
+-		DBG_ERR("Couldn't create policy handle for %s\n",
++		DBG_ERR("Couldn't create path for %s\n",
+			r->in.share_name);
+		talloc_free(path);
++		talloc_free(fake_path);
+		p->fault_state =3D DCERPC_FAULT_CANT_PERFORM;
+		return;
+	}
+
+-	strlcpy(outpath, path, 1024);
+-	talloc_free(path);
++	strlcpy(outpath, fake_path, 1024);
++	talloc_free(fake_path);
+	return;
+ }
+
+--
+2.40.0
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb =
b/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
index 73e8a82e8..aa27592cb 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
@@ -38,6 +38,17 @@ SRC_URI =3D "${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz=
 \
            file://CVE-2022-2127.patch \
            file://CVE-2023-34967_0001.patch \
            file://CVE-2023-34967_0002.patch \
+           file://CVE-2023-34968_0001.patch \
+           file://CVE-2023-34968_0002.patch \
+           file://CVE-2023-34968_0003.patch \
+           file://CVE-2023-34968_0004.patch \
+           file://CVE-2023-34968_0005.patch \
+           file://CVE-2023-34968_0006.patch \
+           file://CVE-2023-34968_0007.patch \
+           file://CVE-2023-34968_0008.patch \
+           file://CVE-2023-34968_0009.patch \
+           file://CVE-2023-34968_0010.patch \
+           file://CVE-2023-34968_0011.patch \
            "
=20
 SRC_URI:append:libc-musl =3D " \
--=20
2.40.0


