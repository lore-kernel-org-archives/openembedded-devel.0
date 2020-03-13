Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id D0E4560C1E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Mar 2020 06:56:29 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,547,1574092800"; d="scan'208";a="86263297"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 13 Mar 2020 14:56:25 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id AFF69406AB15
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Mar 2020 14:46:20 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Fri, 13 Mar 2020 14:56:21 +0800
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 13 Mar 2020 14:56:21 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 13 Mar 2020 14:58:41 +0800
Message-ID: <20200313065841.17365-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: AFF69406AB15.AB28A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [zeus] [meta-networking] [PATCH] wireshark: CVE-2019-19553
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
X-List-Received-Date: Fri, 13 Mar 2020 06:56:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Security Advisory
References:
https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-19553

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ..._identifier_id-after-dissecting-Cont.patch | 204 ++++++++++++++++++
 .../wireshark/wireshark_3.0.6.bb              |   3 +-
 2 files changed, 206 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/wireshark/wireshark/0001-CMS-reset-object_identifier_id-after-dissecting-Cont.patch

diff --git a/meta-networking/recipes-support/wireshark/wireshark/0001-CMS-reset-object_identifier_id-after-dissecting-Cont.patch b/meta-networking/recipes-support/wireshark/wireshark/0001-CMS-reset-object_identifier_id-after-dissecting-Cont.patch
new file mode 100644
index 000000000..08060db04
--- /dev/null
+++ b/meta-networking/recipes-support/wireshark/wireshark/0001-CMS-reset-object_identifier_id-after-dissecting-Cont.patch
@@ -0,0 +1,204 @@
+From e1731e2bc1d2a78b67e18fa66e7440acb9bea563 Mon Sep 17 00:00:00 2001
+From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
+Date: Fri, 13 Mar 2020 13:54:50 +0800
+Subject: [PATCH] CMS: reset object_identifier_id after dissecting ContentInfo
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+MIME-Version: 1.0
+Content-Type: text/plain; charset=utf8
+Content-Transfer-Encoding: 8bit
+
+Bug: 15961
+Change-Id: I3d6b3e96103b69f88fcb512da81fa20ff6a1c40e
+Reviewed-on: https://code.wireshark.org/review/34960
+Petri-Dish: Pascal Quantin <pascal@wireshark.org>
+Tested-by: Petri Dish Buildbot
+Reviewed-by: Stig BjÃ¸rlykke <stig@bjorlykke.org>
+Reviewed-by: Roland Knall <rknall@gmail.com>
+(cherry picked from commit 23850a3342d64b9c9808f14c20bfea6d22b7dc08)
+Conflicts:
+	epan/dissectors/packet-cms.c
+Reviewed-on: https://code.wireshark.org/review/34975
+Reviewed-by: Pascal Quantin <pascal@wireshark.org>
+---
+ epan/dissectors/asn1/cms/cms.cnf              |  1 +
+ .../dissectors/asn1/cms/packet-cms-template.c |  2 +-
+ epan/dissectors/packet-cms.c                  | 31 ++++++++++---------
+ 3 files changed, 18 insertions(+), 16 deletions(-)
+
+diff --git a/epan/dissectors/asn1/cms/cms.cnf b/epan/dissectors/asn1/cms/cms.cnf
+index ab94f8c..8feef01 100644
+--- a/epan/dissectors/asn1/cms/cms.cnf
++++ b/epan/dissectors/asn1/cms/cms.cnf
+@@ -122,6 +122,7 @@ FirmwarePackageLoadError/version		fwErrorVersion
+   top_tree = tree;
+   %(DEFAULT_BODY)s
+   content_tvb = NULL;
++  object_identifier_id = NULL;
+   top_tree = NULL;
+ 
+ #.FN_PARS ContentType
+diff --git a/epan/dissectors/asn1/cms/packet-cms-template.c b/epan/dissectors/asn1/cms/packet-cms-template.c
+index 2e803ec..931fd4f 100644
+--- a/epan/dissectors/asn1/cms/packet-cms-template.c
++++ b/epan/dissectors/asn1/cms/packet-cms-template.c
+@@ -43,7 +43,7 @@ static int hf_cms_ci_contentType = -1;
+ static int dissect_cms_OCTET_STRING(gboolean implicit_tag _U_, tvbuff_t *tvb, int offset, asn1_ctx_t *actx, proto_tree *tree, int hf_index _U_) ; /* XXX kill a compiler warning until asn2wrs stops generating these silly wrappers */
+ 
+ 
+-static const char *object_identifier_id;
++static const char *object_identifier_id = NULL;
+ static tvbuff_t *content_tvb = NULL;
+ 
+ static proto_tree *top_tree=NULL;
+diff --git a/epan/dissectors/packet-cms.c b/epan/dissectors/packet-cms.c
+index 690513d..2a6942f 100644
+--- a/epan/dissectors/packet-cms.c
++++ b/epan/dissectors/packet-cms.c
+@@ -311,7 +311,7 @@ static gint ett_cms_FirmwarePackageMessageDigest = -1;
+ static int dissect_cms_OCTET_STRING(gboolean implicit_tag _U_, tvbuff_t *tvb, int offset, asn1_ctx_t *actx, proto_tree *tree, int hf_index _U_) ; /* XXX kill a compiler warning until asn2wrs stops generating these silly wrappers */
+ 
+ 
+-static const char *object_identifier_id;
++static const char *object_identifier_id = NULL;
+ static tvbuff_t *content_tvb = NULL;
+ 
+ static proto_tree *top_tree=NULL;
+@@ -373,7 +373,7 @@ cms_verify_msg_digest(proto_item *pi, tvbuff_t *content, const char *alg, tvbuff
+ 
+ int
+ dissect_cms_ContentType(gboolean implicit_tag _U_, tvbuff_t *tvb _U_, int offset _U_, asn1_ctx_t *actx _U_, proto_tree *tree _U_, int hf_index _U_) {
+-#line 131 "./asn1/cms/cms.cnf"
++#line 132 "./asn1/cms/cms.cnf"
+   	const char *name = NULL;
+ 
+ 	  offset = dissect_ber_object_identifier_str(implicit_tag, actx, tree, tvb, offset, hf_index, &object_identifier_id);
+@@ -393,7 +393,7 @@ dissect_cms_ContentType(gboolean implicit_tag _U_, tvbuff_t *tvb _U_, int offset
+ 
+ static int
+ dissect_cms_T_content(gboolean implicit_tag _U_, tvbuff_t *tvb _U_, int offset _U_, asn1_ctx_t *actx _U_, proto_tree *tree _U_, int hf_index _U_) {
+-#line 141 "./asn1/cms/cms.cnf"
++#line 142 "./asn1/cms/cms.cnf"
+   offset=call_ber_oid_callback(object_identifier_id, tvb, offset, actx->pinfo, tree, NULL);
+ 
+ 
+@@ -417,6 +417,7 @@ dissect_cms_ContentInfo(gboolean implicit_tag _U_, tvbuff_t *tvb _U_, int offset
+                                    ContentInfo_sequence, hf_index, ett_cms_ContentInfo);
+ 
+   content_tvb = NULL;
++  object_identifier_id = NULL;
+   top_tree = NULL;
+ 
+ 
+@@ -470,7 +471,7 @@ dissect_cms_DigestAlgorithmIdentifiers(gboolean implicit_tag _U_, tvbuff_t *tvb
+ 
+ static int
+ dissect_cms_T_eContent(gboolean implicit_tag _U_, tvbuff_t *tvb _U_, int offset _U_, asn1_ctx_t *actx _U_, proto_tree *tree _U_, int hf_index _U_) {
+-#line 145 "./asn1/cms/cms.cnf"
++#line 146 "./asn1/cms/cms.cnf"
+ 
+   offset = dissect_ber_octet_string(FALSE, actx, tree, tvb, offset, hf_index, &content_tvb);
+ 
+@@ -504,7 +505,7 @@ dissect_cms_EncapsulatedContentInfo(gboolean implicit_tag _U_, tvbuff_t *tvb _U_
+ 
+ static int
+ dissect_cms_T_attrType(gboolean implicit_tag _U_, tvbuff_t *tvb _U_, int offset _U_, asn1_ctx_t *actx _U_, proto_tree *tree _U_, int hf_index _U_) {
+-#line 175 "./asn1/cms/cms.cnf"
++#line 176 "./asn1/cms/cms.cnf"
+   const char *name = NULL;
+ 
+     offset = dissect_ber_object_identifier_str(implicit_tag, actx, tree, tvb, offset, hf_cms_attrType, &object_identifier_id);
+@@ -524,7 +525,7 @@ dissect_cms_T_attrType(gboolean implicit_tag _U_, tvbuff_t *tvb _U_, int offset
+ 
+ static int
+ dissect_cms_AttributeValue(gboolean implicit_tag _U_, tvbuff_t *tvb _U_, int offset _U_, asn1_ctx_t *actx _U_, proto_tree *tree _U_, int hf_index _U_) {
+-#line 185 "./asn1/cms/cms.cnf"
++#line 186 "./asn1/cms/cms.cnf"
+ 
+   offset=call_ber_oid_callback(object_identifier_id, tvb, offset, actx->pinfo, tree, NULL);
+ 
+@@ -786,7 +787,7 @@ dissect_cms_T_otherRevInfoFormat(gboolean implicit_tag _U_, tvbuff_t *tvb _U_, i
+ 
+ static int
+ dissect_cms_T_otherRevInfo(gboolean implicit_tag _U_, tvbuff_t *tvb _U_, int offset _U_, asn1_ctx_t *actx _U_, proto_tree *tree _U_, int hf_index _U_) {
+-#line 169 "./asn1/cms/cms.cnf"
++#line 170 "./asn1/cms/cms.cnf"
+   offset=call_ber_oid_callback(object_identifier_id, tvb, offset, actx->pinfo, tree, NULL);
+ 
+ 
+@@ -1123,7 +1124,7 @@ dissect_cms_T_keyAttrId(gboolean implicit_tag _U_, tvbuff_t *tvb _U_, int offset
+ 
+ static int
+ dissect_cms_T_keyAttr(gboolean implicit_tag _U_, tvbuff_t *tvb _U_, int offset _U_, asn1_ctx_t *actx _U_, proto_tree *tree _U_, int hf_index _U_) {
+-#line 164 "./asn1/cms/cms.cnf"
++#line 165 "./asn1/cms/cms.cnf"
+   offset=call_ber_oid_callback(object_identifier_id, tvb, offset, actx->pinfo, tree, NULL);
+ 
+ 
+@@ -1311,7 +1312,7 @@ dissect_cms_T_oriType(gboolean implicit_tag _U_, tvbuff_t *tvb _U_, int offset _
+ 
+ static int
+ dissect_cms_T_oriValue(gboolean implicit_tag _U_, tvbuff_t *tvb _U_, int offset _U_, asn1_ctx_t *actx _U_, proto_tree *tree _U_, int hf_index _U_) {
+-#line 158 "./asn1/cms/cms.cnf"
++#line 159 "./asn1/cms/cms.cnf"
+   offset=call_ber_oid_callback(object_identifier_id, tvb, offset, actx->pinfo, tree, NULL);
+ 
+ 
+@@ -1388,14 +1389,14 @@ dissect_cms_ContentEncryptionAlgorithmIdentifier(gboolean implicit_tag _U_, tvbu
+ 
+ static int
+ dissect_cms_EncryptedContent(gboolean implicit_tag _U_, tvbuff_t *tvb _U_, int offset _U_, asn1_ctx_t *actx _U_, proto_tree *tree _U_, int hf_index _U_) {
+-#line 235 "./asn1/cms/cms.cnf"
++#line 236 "./asn1/cms/cms.cnf"
+ 	tvbuff_t *encrypted_tvb;
+ 	proto_item *item;
+ 
+   offset = dissect_ber_octet_string(implicit_tag, actx, tree, tvb, offset, hf_index,
+                                        &encrypted_tvb);
+ 
+-#line 240 "./asn1/cms/cms.cnf"
++#line 241 "./asn1/cms/cms.cnf"
+ 
+ 	item = actx->created_item;
+ 
+@@ -1553,7 +1554,7 @@ dissect_cms_AuthenticatedData(gboolean implicit_tag _U_, tvbuff_t *tvb _U_, int
+ 
+ static int
+ dissect_cms_MessageDigest(gboolean implicit_tag _U_, tvbuff_t *tvb _U_, int offset _U_, asn1_ctx_t *actx _U_, proto_tree *tree _U_, int hf_index _U_) {
+-#line 189 "./asn1/cms/cms.cnf"
++#line 190 "./asn1/cms/cms.cnf"
+   proto_item *pi;
+   int old_offset = offset;
+ 
+@@ -1637,7 +1638,7 @@ dissect_cms_KeyWrapAlgorithm(gboolean implicit_tag _U_, tvbuff_t *tvb _U_, int o
+ 
+ static int
+ dissect_cms_RC2ParameterVersion(gboolean implicit_tag _U_, tvbuff_t *tvb _U_, int offset _U_, asn1_ctx_t *actx _U_, proto_tree *tree _U_, int hf_index _U_) {
+-#line 225 "./asn1/cms/cms.cnf"
++#line 226 "./asn1/cms/cms.cnf"
+   guint32 length = 0;
+ 
+     offset = dissect_ber_integer(implicit_tag, actx, tree, tvb, offset, hf_index,
+@@ -1715,7 +1716,7 @@ dissect_cms_DigestInfo(gboolean implicit_tag _U_, tvbuff_t *tvb _U_, int offset
+ 
+ static int
+ dissect_cms_T_capability(gboolean implicit_tag _U_, tvbuff_t *tvb _U_, int offset _U_, asn1_ctx_t *actx _U_, proto_tree *tree _U_, int hf_index _U_) {
+-#line 207 "./asn1/cms/cms.cnf"
++#line 208 "./asn1/cms/cms.cnf"
+   const char *name = NULL;
+ 
+     offset = dissect_ber_object_identifier_str(implicit_tag, actx, tree, tvb, offset, hf_cms_attrType, &object_identifier_id);
+@@ -1736,7 +1737,7 @@ dissect_cms_T_capability(gboolean implicit_tag _U_, tvbuff_t *tvb _U_, int offse
+ 
+ static int
+ dissect_cms_T_parameters(gboolean implicit_tag _U_, tvbuff_t *tvb _U_, int offset _U_, asn1_ctx_t *actx _U_, proto_tree *tree _U_, int hf_index _U_) {
+-#line 218 "./asn1/cms/cms.cnf"
++#line 219 "./asn1/cms/cms.cnf"
+ 
+   offset=call_ber_oid_callback(object_identifier_id, tvb, offset, actx->pinfo, tree, NULL);
+ 
+-- 
+2.20.1
+
diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.0.6.bb b/meta-networking/recipes-support/wireshark/wireshark_3.0.6.bb
index ccaa0c94a..9bac5bde4 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.0.6.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.0.6.bb
@@ -8,7 +8,8 @@ DEPENDS = "pcre expat glib-2.0 glib-2.0-native libgcrypt libgpg-error libxml2 bi
 
 DEPENDS_append_class-target = " wireshark-native chrpath-replacement-native "
 
-SRC_URI = "https://1.eu.dl.wireshark.org/src/all-versions/wireshark-${PV}.tar.xz"
+SRC_URI = "https://1.eu.dl.wireshark.org/src/all-versions/wireshark-${PV}.tar.xz \
+	file://0001-CMS-reset-object_identifier_id-after-dissecting-Cont.patch"
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
 
-- 
2.20.1




