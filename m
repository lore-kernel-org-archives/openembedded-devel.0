Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DD74C47077
	for <webhook@archiver.kernel.org>; Tue, 16 Jan 2024 14:11:45 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.14998.1705414301202995437
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Jan 2024 06:11:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=CKMEeQzB;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=17452b1923=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40GCHwDK014846
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Jan 2024 14:11:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=vvpzL
	EaI3OwTlIGD1I5Su+1wGmr7zLC+KWhv2bLvnWQ=; b=CKMEeQzBW8Q4LOQIn3Ww9
	r5xCUq7veQI4MATggDb44jZDcm/zy/Dq/ffEGdih1Jyc6wSUn9196YCKOa3xMot0
	wJ4HLIMVJivs2d793z6B4N5tHRREc0+5chThp6Fj+aatAAGybjQz1GTC+ZYz+0no
	RYvoOwGCHGckW5MQ75VtmJ+jQ6FxttWsDtGk5rsaiB/UBqmLIsXaVzeH0QVDPcXC
	DGA7XEJ3iSzmAzLOWDAfr2G7NMvMY1LXBFEoAUEMJd66xFG5jmvuxD9GobYG6mvG
	8o3MXJ4SsPVLnezLU9lQ+I4nN7/fE4Qouhu3x00JFwnMJ9ylA5POY4Y7ir9VMwLZ
	A==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vkfqxb9nk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Jan 2024 14:11:40 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Jan 2024 06:11:50 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-networking][kirkstone][PATCH 1/1] samba: fix CVE-2018-14628
Date: Tue, 16 Jan 2024 14:11:25 +0000
Message-ID: <20240116141125.1918865-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: plKPzl6mSsMR1EGaHGFM5Wc4NtF_ZFD0
X-Proofpoint-ORIG-GUID: plKPzl6mSsMR1EGaHGFM5Wc4NtF_ZFD0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 mlxlogscore=999 clxscore=1011 bulkscore=0 mlxscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401160112
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Jan 2024 14:11:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108302

From: Archana Polampalli <archana.polampalli@windriver.com>

An information leak vulnerability was discovered in Samba's LDAP server.
Due to missing access control checks, an authenticated but unprivileged
attacker could discover the names and preserved attributes of deleted
objects in the LDAP store.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../samba/samba/CVE-2018-14628-0001.patch     | 147 ++++++++++++++++++
 .../samba/samba/CVE-2018-14628-0002.patch     |  72 +++++++++
 .../samba/samba/CVE-2018-14628-0003.patch     | 106 +++++++++++++
 .../samba/samba/CVE-2018-14628-0004.patch     |  64 ++++++++
 .../samba/samba/CVE-2018-14628-0005.patch     |  98 ++++++++++++
 .../samba/samba/CVE-2018-14628-0006.patch     |  51 ++++++
 .../samba/samba_4.14.14.bb                    |   6 +
 7 files changed, 544 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-2018-14628-0001.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-2018-14628-0002.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-2018-14628-0003.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-2018-14628-0004.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-2018-14628-0005.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-2018-14628-0006.patch

diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2018-14628-0001.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2018-14628-0001.patch
new file mode 100644
index 000000000..d938e8cd6
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2018-14628-0001.patch
@@ -0,0 +1,147 @@
+From cbbfc917b9635bc62825ea64a157028297f54fb7 Mon Sep 17 00:00:00 2001
+From: Stefan Metzmacher <metze@samba.org>
+Date: Fri, 29 Jan 2016 23:35:31 +0100
+Subject: [PATCH] CVE-2018-14628: python:descriptor: let samba-tool dbcheck fix
+  the nTSecurityDescriptor on CN=Deleted Objects containers
+
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=13595
+
+Signed-off-by: Stefan Metzmacher <metze@samba.org>
+Reviewed-by: Andrew Bartlett <abartlet@samba.org>
+(cherry picked from commit 97e4aab1a6e2feda7c6c6fdeaa7c3e1818c55566)
+
+Autobuild-User(v4-18-test): Jule Anger <janger@samba.org>
+Autobuild-Date(v4-18-test): Mon Oct 23 09:52:22 UTC 2023 on atb-devel-224
+
+CVE: CVE-2018-14628
+
+Upstream-Status: Backport[https://github.com/samba-team/samba/commit/cbbfc917b9635bc62825ea64a157028297f54fb7]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ python/samba/dbchecker.py           | 10 ++++++++--
+ python/samba/descriptor.py          | 15 ++++++++++++++-
+ testprogs/blackbox/dbcheck-links.sh | 12 ++++++++++++
+ 3 files changed, 34 insertions(+), 3 deletions(-)
+
+diff --git a/python/samba/dbchecker.py b/python/samba/dbchecker.py
+index d10d765..d8c2341 100644
+--- a/python/samba/dbchecker.py
++++ b/python/samba/dbchecker.py
+@@ -2433,7 +2433,7 @@ newSuperior: %s""" % (str(from_dn), str(to_rdn), str(to_base)))
+                     error_count += 1
+                     continue
+
+-                if self.reset_well_known_acls:
++                if dn == deleted_objects_dn or self.reset_well_known_acls:
+                     try:
+                         well_known_sd = self.get_wellknown_sd(dn)
+                     except KeyError:
+@@ -2442,7 +2442,13 @@ newSuperior: %s""" % (str(from_dn), str(to_rdn), str(to_base)))
+                     current_sd = ndr_unpack(security.descriptor,
+                                             obj[attrname][0])
+
+-                    diff = get_diff_sds(well_known_sd, current_sd, security.dom_sid(self.samdb.get_domain_sid()))
++                    ignoreAdditionalACEs = False
++                    if not self.reset_well_known_acls:
++                        ignoreAdditionalACEs = True
++
++                    diff = get_diff_sds(well_known_sd, current_sd,
++                                        security.dom_sid(self.samdb.get_domain_sid()),
++                                        ignoreAdditionalACEs=ignoreAdditionalACEs)
+                     if diff != "":
+                         self.err_wrong_default_sd(dn, well_known_sd, diff)
+                         error_count += 1
+diff --git a/python/samba/descriptor.py b/python/samba/descriptor.py
+index 0998348..08cfab0 100644
+--- a/python/samba/descriptor.py
++++ b/python/samba/descriptor.py
+@@ -407,6 +407,7 @@ def get_wellknown_sds(samdb):
+     # Then subcontainers
+     subcontainers = [
+         (ldb.Dn(samdb, "%s" % str(samdb.domain_dn())), get_domain_descriptor),
++        (ldb.Dn(samdb, "CN=Deleted Objects,%s" % str(samdb.domain_dn())), get_deletedobjects_descriptor),
+         (ldb.Dn(samdb, "CN=LostAndFound,%s" % str(samdb.domain_dn())), get_domain_delete_protected2_descriptor),
+         (ldb.Dn(samdb, "CN=System,%s" % str(samdb.domain_dn())), get_domain_delete_protected1_descriptor),
+         (ldb.Dn(samdb, "CN=Infrastructure,%s" % str(samdb.domain_dn())), get_domain_infrastructure_descriptor),
+@@ -417,6 +418,7 @@ def get_wellknown_sds(samdb):
+         (ldb.Dn(samdb, "CN=MicrosoftDNS,CN=System,%s" % str(samdb.domain_dn())), get_dns_domain_microsoft_dns_descriptor),
+
+         (ldb.Dn(samdb, "%s" % str(samdb.get_config_basedn())), get_config_descriptor),
++        (ldb.Dn(samdb, "CN=Deleted Objects,%s" % str(samdb.get_config_basedn())), get_deletedobjects_descriptor),
+         (ldb.Dn(samdb, "CN=NTDS Quotas,%s" % str(samdb.get_config_basedn())), get_config_ntds_quotas_descriptor),
+         (ldb.Dn(samdb, "CN=LostAndFoundConfig,%s" % str(samdb.get_config_basedn())), get_config_delete_protected1wd_descriptor),
+         (ldb.Dn(samdb, "CN=Services,%s" % str(samdb.get_config_basedn())), get_config_delete_protected1_descriptor),
+@@ -441,6 +443,9 @@ def get_wellknown_sds(samdb):
+         if ldb.Dn(samdb, nc.decode('utf8')) == dnsforestdn:
+             c = (ldb.Dn(samdb, "%s" % str(dnsforestdn)), get_dns_partition_descriptor)
+             subcontainers.append(c)
++            c = (ldb.Dn(samdb, "CN=Deleted Objects,%s" % str(dnsforestdn)),
++                 get_deletedobjects_descriptor)
++            subcontainers.append(c)
+             c = (ldb.Dn(samdb, "CN=Infrastructure,%s" % str(dnsforestdn)),
+                  get_domain_delete_protected1_descriptor)
+             subcontainers.append(c)
+@@ -456,6 +461,9 @@ def get_wellknown_sds(samdb):
+         if ldb.Dn(samdb, nc.decode('utf8')) == dnsdomaindn:
+             c = (ldb.Dn(samdb, "%s" % str(dnsdomaindn)), get_dns_partition_descriptor)
+             subcontainers.append(c)
++            c = (ldb.Dn(samdb, "CN=Deleted Objects,%s" % str(dnsdomaindn)),
++                 get_deletedobjects_descriptor)
++            subcontainers.append(c)
+             c = (ldb.Dn(samdb, "CN=Infrastructure,%s" % str(dnsdomaindn)),
+                  get_domain_delete_protected1_descriptor)
+             subcontainers.append(c)
+@@ -548,7 +556,8 @@ def get_clean_sd(sd):
+     return sd_clean
+
+
+-def get_diff_sds(refsd, cursd, domainsid, checkSacl=True):
++def get_diff_sds(refsd, cursd, domainsid, checkSacl=True,
++                 ignoreAdditionalACEs=False):
+     """Get the difference between 2 sd
+
+     This function split the textual representation of ACL into smaller
+@@ -603,6 +612,10 @@ def get_diff_sds(refsd, cursd, domainsid, checkSacl=True):
+                     h_ref.remove(k)
+
+             if len(h_cur) + len(h_ref) > 0:
++                if txt == "" and len(h_ref) == 0:
++                    if ignoreAdditionalACEs:
++                        return ""
++
+                 txt = "%s\tPart %s is different between reference" \
+                       " and current here is the detail:\n" % (txt, part)
+
+diff --git a/testprogs/blackbox/dbcheck-links.sh b/testprogs/blackbox/dbcheck-links.sh
+index f00fe46..06b24fb 100755
+--- a/testprogs/blackbox/dbcheck-links.sh
++++ b/testprogs/blackbox/dbcheck-links.sh
+@@ -58,6 +58,16 @@ dbcheck() {
+     fi
+ }
+
++dbcheck_acl_reset()
++{
++	$PYTHON $BINDIR/samba-tool dbcheck -H tdb://$PREFIX_ABS/${RELEASE}/private/sam.ldb --cross-ncs --fix --yes --attrs=nTSecurityDescriptor
++}
++
++dbcheck_acl_clean()
++{
++	$PYTHON $BINDIR/samba-tool dbcheck -H tdb://$PREFIX_ABS/${RELEASE}/private/sam.ldb --cross-ncs --attrs=nTSecurityDescriptor
++}
++
+ dbcheck_dangling() {
+     dbcheck "" "1" "--selftest-check-expired-tombstones"
+     return $?
+@@ -893,6 +903,8 @@ EOF
+ remove_directory $PREFIX_ABS/${RELEASE}
+
+ testit $RELEASE undump || failed=`expr $failed + 1`
++testit_expect_failure "dbcheck_acl_reset" dbcheck_acl_reset || failed=$(expr $failed + 1)
++testit "dbcheck_acl_clean" dbcheck_acl_clean || failed=$(expr $failed + 1)
+ testit "add_two_more_users" add_two_more_users || failed=`expr $failed + 1`
+ testit "add_four_more_links" add_four_more_links || failed=`expr $failed + 1`
+ testit "remove_one_link" remove_one_link || failed=`expr $failed + 1`
+--
+2.40.0
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2018-14628-0002.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2018-14628-0002.patch
new file mode 100644
index 000000000..e3d45627a
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2018-14628-0002.patch
@@ -0,0 +1,72 @@
+From f967b91da76f86a9feb4c1469fccfce93be8bc79 Mon Sep 17 00:00:00 2001
+From: Stefan Metzmacher <metze@samba.org>
+Date: Wed, 7 Jun 2023 18:18:58 +0200
+Subject: [PATCH] CVE-2018-14628: dbchecker: use get_deletedobjects_descriptor
+ for missing deleted objects container
+
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=13595
+
+Signed-off-by: Stefan Metzmacher <metze@samba.org>
+Reviewed-by: Andrew Bartlett <abartlet@samba.org>
+(cherry picked from commit 70586061128f90afa33f25e104d4570a1cf778db)
+
+CVE: CVE-2018-14628
+
+Upstream-Status: Backport
+[https://github.com/samba-team/samba/commit/f967b91da76f86a9feb4c1469fccfce93be8bc79]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ python/samba/dbchecker.py | 16 +++++++++++++---
+ 1 file changed, 13 insertions(+), 3 deletions(-)
+
+diff --git a/python/samba/dbchecker.py b/python/samba/dbchecker.py
+index d8c2341..35b6eeb 100644
+--- a/python/samba/dbchecker.py
++++ b/python/samba/dbchecker.py
+@@ -21,7 +21,7 @@ from __future__ import print_function
+ import ldb
+ import samba
+ import time
+-from base64 import b64decode
++from base64 import b64decode, b64encode
+ from samba import dsdb
+ from samba import common
+ from samba.dcerpc import misc
+@@ -30,7 +30,11 @@ from samba.ndr import ndr_unpack, ndr_pack
+ from samba.dcerpc import drsblobs
+ from samba.samdb import dsdb_Dn
+ from samba.dcerpc import security
+-from samba.descriptor import get_wellknown_sds, get_diff_sds
++from samba.descriptor import (
++        get_wellknown_sds,
++        get_deletedobjects_descriptor,
++        get_diff_sds
++)
+ from samba.auth import system_session, admin_session
+ from samba.netcmd import CommandError
+ from samba.netcmd.fsmo import get_fsmo_roleowner
+@@ -340,6 +344,11 @@ class dbcheck(object):
+                 wko_prefix = "B:32:%s" % dsdb.DS_GUID_DELETED_OBJECTS_CONTAINER
+                 listwko.append('%s:%s' % (wko_prefix, dn))
+                 guid_suffix = ""
++
++            domain_sid = security.dom_sid(self.samdb.get_domain_sid())
++            sec_desc = get_deletedobjects_descriptor(domain_sid,
++                                                     name_map=self.name_map)
++            sec_desc_b64 = b64encode(sec_desc).decode('utf8')
+
+             # Insert a brand new Deleted Objects container
+             self.samdb.add_ldif("""dn: %s
+@@ -349,7 +358,8 @@ description: Container for deleted objects
+ isDeleted: TRUE
+ isCriticalSystemObject: TRUE
+ showInAdvancedViewOnly: TRUE
+-systemFlags: -1946157056%s""" % (dn, guid_suffix),
++nTSecurityDescriptor:: %s
++systemFlags: -1946157056%s""" % (dn, sec_desc_b64, guid_suffix),
+                                 controls=["relax:0", "provision:0"])
+
+             delta = ldb.Message()
+--
+2.40.0
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2018-14628-0003.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2018-14628-0003.patch
new file mode 100644
index 000000000..df30e0c10
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2018-14628-0003.patch
@@ -0,0 +1,106 @@
+From edac27f5408191567233983562091484ebbbad0a Mon Sep 17 00:00:00 2001
+From: Stefan Metzmacher <metze@samba.org>
+Date: Mon, 26 Jun 2023 15:14:24 +0200
+Subject: [PATCH] CVE-2018-14628: s4:dsdb: remove unused code in
+ dirsync_filter_entry()
+
+This makes the next change easier to understand.
+
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=13595
+
+Signed-off-by: Stefan Metzmacher <metze@samba.org>
+Reviewed-by: Andrew Bartlett <abartlet@samba.org>
+(cherry picked from commit 498542be0bbf4f26558573c1f87b77b8e3509371)
+
+CVE: CVE-2018-14628
+
+Upstream-Status: Backport [https://github.com/samba-team/samba/commit/edac27f5408191567233983562091484ebbbad0a]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ source4/dsdb/samdb/ldb_modules/dirsync.c | 53 +++---------------------
+ 1 file changed, 5 insertions(+), 48 deletions(-)
+
+diff --git a/source4/dsdb/samdb/ldb_modules/dirsync.c b/source4/dsdb/samdb/ldb_modules/dirsync.c
+index e61ade8..e7fb27f 100644
+--- a/source4/dsdb/samdb/ldb_modules/dirsync.c
++++ b/source4/dsdb/samdb/ldb_modules/dirsync.c
+@@ -152,10 +152,6 @@ static int dirsync_filter_entry(struct ldb_request *req,
+	 * list only the attribute that have been modified since last interogation
+	 *
+	 */
+-	newmsg = ldb_msg_new(dsc->req);
+-	if (newmsg == NULL) {
+-		return ldb_oom(ldb);
+-	}
+	for (i = msg->num_elements - 1; i >= 0; i--) {
+		if (ldb_attr_cmp(msg->elements[i].name, "uSNChanged") == 0) {
+			int error = 0;
+@@ -202,11 +198,6 @@ static int dirsync_filter_entry(struct ldb_request *req,
+			 */
+			return LDB_SUCCESS;
+		}
+-		newmsg->dn = ldb_dn_new(newmsg, ldb, "");
+-		if (newmsg->dn == NULL) {
+-			return ldb_oom(ldb);
+-		}
+-
+		el = ldb_msg_find_element(msg, "objectGUID");
+		if ( el != NULL) {
+			guidfound = true;
+@@ -217,48 +208,14 @@ static int dirsync_filter_entry(struct ldb_request *req,
+		 * well will uncomment the code bellow
+		 */
+		SMB_ASSERT(guidfound == true);
+-		/*
+-		if (guidfound == false) {
+-			struct GUID guid;
+-			struct ldb_val *new_val;
+-			DATA_BLOB guid_blob;
+-
+-			tmp[0] = '\0';
+-			txt = strrchr(txt, ':');
+-			if (txt == NULL) {
+-				return ldb_module_done(dsc->req, NULL, NULL, LDB_ERR_OPERATIONS_ERROR);
+-			}
+-			txt++;
+-
+-			status = GUID_from_string(txt, &guid);
+-			if (!NT_STATUS_IS_OK(status)) {
+-				return ldb_module_done(dsc->req, NULL, NULL, LDB_ERR_OPERATIONS_ERROR);
+-			}
+-
+-			status = GUID_to_ndr_blob(&guid, msg, &guid_blob);
+-			if (!NT_STATUS_IS_OK(status)) {
+-				return ldb_module_done(dsc->req, NULL, NULL, LDB_ERR_OPERATIONS_ERROR);
+-			}
+-
+-			new_val = talloc(msg, struct ldb_val);
+-			if (new_val == NULL) {
+-				return ldb_oom(ldb);
+-			}
+-			new_val->data = talloc_steal(new_val, guid_blob.data);
+-			new_val->length = guid_blob.length;
+-			if (ldb_msg_add_value(msg, "objectGUID", new_val, NULL) != 0) {
+-				return ldb_module_done(dsc->req, NULL, NULL, LDB_ERR_OPERATIONS_ERROR);
+-			}
+-		}
+-		*/
+-		ldb_msg_add(newmsg, el, LDB_FLAG_MOD_ADD);
+-		talloc_steal(newmsg->elements, el->name);
+-		talloc_steal(newmsg->elements, el->values);
+-
+-		talloc_steal(newmsg->elements, msg);
+		return ldb_module_send_entry(dsc->req, msg, controls);
+	}
+
++	newmsg = ldb_msg_new(dsc->req);
++	if (newmsg == NULL) {
++		return ldb_oom(ldb);
++	}
++
+	ndr_err = ndr_pull_struct_blob(replMetaData, dsc, &rmd,
+		(ndr_pull_flags_fn_t)ndr_pull_replPropertyMetaDataBlob);
+	if (!NDR_ERR_CODE_IS_SUCCESS(ndr_err)) {
+--
+2.40.0
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2018-14628-0004.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2018-14628-0004.patch
new file mode 100644
index 000000000..6fa4ef10d
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2018-14628-0004.patch
@@ -0,0 +1,64 @@
+From 74a508b39e6fd5036a2adc99d559bd3852f8ce8d Mon Sep 17 00:00:00 2001
+From: Stefan Metzmacher <metze@samba.org>
+Date: Fri, 29 Jan 2016 23:34:15 +0100
+Subject: [PATCH] CVE-2018-14628: s4:setup: set the correct
+ nTSecurityDescriptor on the CN=Deleted Objects container
+
+This revealed a bug in our dirsync code, so we mark
+test_search_with_dirsync_deleted_objects as knownfail.
+
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=13595
+
+Signed-off-by: Stefan Metzmacher <metze@samba.org>
+Reviewed-by: Andrew Bartlett <abartlet@samba.org>
+(cherry picked from commit 7f8b15faa76d05023c987fac2c4c31f9ac61bb47)
+
+CVE: CVE-2018-14628
+
+Upstream-Status: Backport [https://github.com/samba-team/samba/commit/74a508b39e6fd5036a2adc99d559bd3852f8ce8d]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ source4/setup/provision.ldif               | 1 +
+ source4/setup/provision_configuration.ldif | 1 +
+ source4/setup/provision_dnszones_add.ldif  | 1 +
+ 3 files changed, 3 insertions(+)
+
+diff --git a/source4/setup/provision.ldif b/source4/setup/provision.ldif
+index 5d9eba4..7f966fd 100644
+--- a/source4/setup/provision.ldif
++++ b/source4/setup/provision.ldif
+@@ -34,6 +34,7 @@ isDeleted: TRUE
+ isCriticalSystemObject: TRUE
+ showInAdvancedViewOnly: TRUE
+ systemFlags: -1946157056
++nTSecurityDescriptor:: ${DELETEDOBJECTS_DESCRIPTOR}
+
+ # Computers located in "provision_computers*.ldif"
+ # Users/Groups located in "provision_users*.ldif"
+diff --git a/source4/setup/provision_configuration.ldif b/source4/setup/provision_configuration.ldif
+index 53c9c85..8fcbddb 100644
+--- a/source4/setup/provision_configuration.ldif
++++ b/source4/setup/provision_configuration.ldif
+@@ -14,6 +14,7 @@ description: Container for deleted objects
+ isDeleted: TRUE
+ isCriticalSystemObject: TRUE
+ systemFlags: -1946157056
++nTSecurityDescriptor:: ${DELETEDOBJECTS_DESCRIPTOR}
+
+ # Extended rights
+
+diff --git a/source4/setup/provision_dnszones_add.ldif b/source4/setup/provision_dnszones_add.ldif
+index 860aa4b..a2d6b6b 100644
+--- a/source4/setup/provision_dnszones_add.ldif
++++ b/source4/setup/provision_dnszones_add.ldif
+@@ -8,6 +8,7 @@ description: Deleted objects
+ isDeleted: TRUE
+ isCriticalSystemObject: TRUE
+ systemFlags: -1946157056
++nTSecurityDescriptor:: ${DELETEDOBJECTS_DESCRIPTOR}
+
+ dn: CN=LostAndFound,${ZONE_DN}
+ objectClass: top
+--
+2.40.0
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2018-14628-0005.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2018-14628-0005.patch
new file mode 100644
index 000000000..b0a8ef253
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2018-14628-0005.patch
@@ -0,0 +1,98 @@
+From 46a168c9a89e82ccaf8d27669d1ae5459f7becb9 Mon Sep 17 00:00:00 2001
+From: Stefan Metzmacher <metze@samba.org>
+Date: Fri, 29 Jan 2016 23:33:37 +0100
+Subject: [PATCH] CVE-2018-14628: python:provision: make
+ DELETEDOBJECTS_DESCRIPTOR available in the ldif files
+
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=13595
+
+Signed-off-by: Stefan Metzmacher <metze@samba.org>
+Reviewed-by: Andrew Bartlett <abartlet@samba.org>
+(cherry picked from commit 0c329a0fda37d87ed737e4b579b6d04ec907604c)
+
+CVE: CVE-2018-14628
+
+Upstream-Status: Backport
+[https://github.com/samba-team/samba/commit/46a168c9a89e82ccaf8d27669d1ae5459f7becb9]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ python/samba/provision/__init__.py | 5 +++++
+ python/samba/provision/sambadns.py | 4 ++++
+ 2 files changed, 9 insertions(+)
+
+diff --git a/python/samba/provision/__init__.py b/python/samba/provision/__init__.py
+index e8903ad..0c52cc1 100644
+--- a/python/samba/provision/__init__.py
++++ b/python/samba/provision/__init__.py
+@@ -79,6 +79,7 @@ from samba.provision.backend import (
+     LDBBackend,
+ )
+ from samba.descriptor import (
++    get_deletedobjects_descriptor,
+     get_empty_descriptor,
+     get_config_descriptor,
+     get_config_partitions_descriptor,
+@@ -1441,6 +1442,8 @@ def fill_samdb(samdb, lp, names, logger, policyguid,
+     msg["subRefs"] = ldb.MessageElement(names.configdn, ldb.FLAG_MOD_ADD,
+                                         "subRefs")
+
++    deletedobjects_descr = b64encode(get_deletedobjects_descriptor(names.domainsid)).decode('utf8')
++
+     samdb.invocation_id = invocationid
+
+     # If we are setting up a subdomain, then this has been replicated in, so we don't need to add it
+@@ -1472,6 +1475,7 @@ def fill_samdb(samdb, lp, names, logger, policyguid,
+                 "FOREST_FUNCTIONALITY": str(forestFunctionality),
+                 "DOMAIN_FUNCTIONALITY": str(domainFunctionality),
+                 "NTDSQUOTAS_DESCRIPTOR": ntdsquotas_descr,
++                "DELETEDOBJECTS_DESCRIPTOR": deletedobjects_descr,
+                 "LOSTANDFOUND_DESCRIPTOR": protected1wd_descr,
+                 "SERVICES_DESCRIPTOR": protected1_descr,
+                 "PHYSICALLOCATIONS_DESCRIPTOR": protected1wd_descr,
+@@ -1536,6 +1540,7 @@ def fill_samdb(samdb, lp, names, logger, policyguid,
+         "RIDAVAILABLESTART": str(next_rid + 600),
+         "POLICYGUID_DC": policyguid_dc,
+         "INFRASTRUCTURE_DESCRIPTOR": infrastructure_desc,
++        "DELETEDOBJECTS_DESCRIPTOR": deletedobjects_descr,
+         "LOSTANDFOUND_DESCRIPTOR": lostandfound_desc,
+         "SYSTEM_DESCRIPTOR": system_desc,
+         "BUILTIN_DESCRIPTOR": builtin_desc,
+diff --git a/python/samba/provision/sambadns.py b/python/samba/provision/sambadns.py
+index 8a5d8a9..61beb16 100644
+--- a/python/samba/provision/sambadns.py
++++ b/python/samba/provision/sambadns.py
+@@ -41,6 +41,7 @@ from samba.dsdb import (
+     DS_DOMAIN_FUNCTION_2016
+ )
+ from samba.descriptor import (
++    get_deletedobjects_descriptor,
+     get_domain_descriptor,
+     get_domain_delete_protected1_descriptor,
+     get_domain_delete_protected2_descriptor,
+@@ -245,6 +246,7 @@ def setup_dns_partitions(samdb, domainsid, domaindn, forestdn, configdn,
+     domainzone_dn = "DC=DomainDnsZones,%s" % domaindn
+     forestzone_dn = "DC=ForestDnsZones,%s" % forestdn
+     descriptor = get_dns_partition_descriptor(domainsid)
++    deletedobjects_desc = get_deletedobjects_descriptor(domainsid)
+
+     setup_add_ldif(samdb, setup_path("provision_dnszones_partitions.ldif"), {
+         "ZONE_DN": domainzone_dn,
+@@ -268,6 +270,7 @@ def setup_dns_partitions(samdb, domainsid, domaindn, forestdn, configdn,
+         "ZONE_DNS": domainzone_dns,
+         "CONFIGDN": configdn,
+         "SERVERDN": serverdn,
++        "DELETEDOBJECTS_DESCRIPTOR": b64encode(deletedobjects_desc).decode('utf8'),
+         "LOSTANDFOUND_DESCRIPTOR": b64encode(protected2_desc).decode('utf8'),
+         "INFRASTRUCTURE_DESCRIPTOR": b64encode(protected1_desc).decode('utf8'),
+     })
+@@ -288,6 +291,7 @@ def setup_dns_partitions(samdb, domainsid, domaindn, forestdn, configdn,
+             "ZONE_DNS": forestzone_dns,
+             "CONFIGDN": configdn,
+             "SERVERDN": serverdn,
++            "DELETEDOBJECTS_DESCRIPTOR": b64encode(deletedobjects_desc).decode('utf8')
+             "LOSTANDFOUND_DESCRIPTOR": b64encode(protected2_desc).decode('utf8'),
+             "INFRASTRUCTURE_DESCRIPTOR": b64encode(protected1_desc).decode('utf8'),
+         })
+--
+2.40.0
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2018-14628-0006.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2018-14628-0006.patch
new file mode 100644
index 000000000..d92ad41df
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2018-14628-0006.patch
@@ -0,0 +1,51 @@
+From e884fc791e59bd6ebd41b4a2ab7c9d7dc45415f4 Mon Sep 17 00:00:00 2001
+From: Stefan Metzmacher <metze@samba.org>
+Date: Fri, 29 Jan 2016 23:30:59 +0100
+Subject: [PATCH] CVE-2018-14628: python:descriptor: add
+ get_deletedobjects_descriptor()
+
+samba-tool drs clone-dc-database was quite useful to find
+the true value of nTSecurityDescriptor of the CN=Delete Objects
+containers.
+
+Only the auto inherited SACL is available via a ldap search.
+
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=13595
+
+Signed-off-by: Stefan Metzmacher <metze@samba.org>
+Reviewed-by: Andrew Bartlett <abartlet@samba.org>
+(cherry picked from commit 3be190dcf7153e479383f7f3d29ddca43fe121b8)
+
+CVE: CVE-2018-14628
+
+Upstream-Status: Backport
+[https://github.com/samba-team/samba/commit/e884fc791e59bd6ebd41b4a2ab7c9d7dc45415f4]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ python/samba/descriptor.py | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/python/samba/descriptor.py b/python/samba/descriptor.py
+index 08cfab0..0141f38 100644
+--- a/python/samba/descriptor.py
++++ b/python/samba/descriptor.py
+@@ -52,6 +52,16 @@ def get_empty_descriptor(domain_sid, name_map={}):
+ # "get_schema_descriptor" is located in "schema.py"
+
+
++def get_deletedobjects_descriptor(domain_sid, name_map=None):
++    if name_map is None:
++        name_map = {}
++
++    sddl = "O:SYG:SYD:PAI" \
++        "(A;;RPWPCCDCLCRCWOWDSDSW;;;SY)" \
++        "(A;;RPLC;;;BA)"
++    return sddl2binary(sddl, domain_sid, name_map)
++
++
+ def get_config_descriptor(domain_sid, name_map={}):
+     sddl = "O:EAG:EAD:(OA;;CR;1131f6aa-9c07-11d1-f79f-00c04fc2dcd2;;ED)" \
+            "(OA;;CR;1131f6ab-9c07-11d1-f79f-00c04fc2dcd2;;ED)" \
+--
+2.40.0
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb b/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
index 17d12e439..6838ac12f 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
@@ -52,6 +52,12 @@ SRC_URI = "${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz \
            file://CVE-2023-4091-0001.patch \
            file://CVE-2023-4091-0002.patch \
            file://CVE-2023-42669.patch \
+           file://CVE-2018-14628-0001.patch \
+           file://CVE-2018-14628-0002.patch \
+           file://CVE-2018-14628-0003.patch \
+           file://CVE-2018-14628-0004.patch \
+           file://CVE-2018-14628-0005.patch \
+           file://CVE-2018-14628-0006.patch \
            "
 
 SRC_URI:append:libc-musl = " \
-- 
2.40.0


