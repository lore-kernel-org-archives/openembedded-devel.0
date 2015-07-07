Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 04F166AC3D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Jul 2015 01:18:16 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t671IGN0004719
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 6 Jul 2015 18:18:16 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Mon, 6 Jul 2015 18:18:15 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 7 Jul 2015 09:17:30 +0800
Message-ID: <1436231850-13327-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][meta-networking] net-snmp: don't return incompletely parsed varbinds
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Jul 2015 01:18:18 -0000
Content-Type: text/plain

From: Jian Liu <jian.liu@windriver.com>

the snmp_pdu_parse() function could leave incompletely parsed varBind
variables in the list of variables in case the parsing of the SNMP
PDU failed. If later processing tries to operate on the stale and
incompletely processed varBind (e.g. when printing the variables),
this can lead to e.g. crashes or, possibly, execution of arbitrary
code.

The snmp_pdu_parse() function stores varBind variables in a list of
netsnmp_variable_list structures. Each time the function parses a new
varBind, a new netsnmp_variable_list item is allocated on the heap
and linked to the list of variables. The problem is that this item
is not removed from the list, even if snmp_pdu_parse() fails to
complete the parsing.

The "type" member of the stale netsnmp_variable_list is not
properly initialized in case snmp_pdu_parse() returns early from the
parsing. However, the "type" member is used to determine later code
paths, which is why we see crashes in a variety of functions,
although the root cause for all of these is the same.

This patch come from
http://sourceforge.net/p/net-snmp/code/ci/f23bcd3ac6ddee5d0a48f9703007ccc738914791/

Written-by: Robert Story
Signed-off-by: Jian Liu <jian.liu@windriver.com>
---
 ...donnt-return-incompletely-parsed-varbinds.patch | 128 +++++++++++++++++++++
 .../recipes-protocols/net-snmp/net-snmp_5.7.2.1.bb |   1 +
 2 files changed, 129 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/donnt-return-incompletely-parsed-varbinds.patch

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/donnt-return-incompletely-parsed-varbinds.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/donnt-return-incompletely-parsed-varbinds.patch
new file mode 100644
index 0000000..04f2110
--- /dev/null
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/donnt-return-incompletely-parsed-varbinds.patch
@@ -0,0 +1,128 @@
+the snmp_pdu_parse() function could leave
+incompletely parsed varBind variables in the list of variables in
+case the parsing of the SNMP PDU failed. If later processing tries to
+operate on the stale and incompletely processed varBind (e.g. when
+printing the variables), this can lead to e.g. crashes or, possibly,
+execution of arbitrary code
+
+Upstream-Status: Backport [net-snmp]
+
+Written-by: Robert Story
+
+diff -Nur net-snmp-5.7.2.1.orig/snmplib/snmp_api.c net-snmp-5.7.2.1/snmplib/snmp_api.c
+--- net-snmp-5.7.2.1.orig/snmplib/snmp_api.c	2015-05-27 11:25:11.563747471 +0800
++++ net-snmp-5.7.2.1/snmplib/snmp_api.c	2015-05-27 13:27:27.724748201 +0800
+@@ -4345,10 +4345,9 @@
+     u_char          type;
+     u_char          msg_type;
+     u_char         *var_val;
+-    int             badtype = 0;
+     size_t          len;
+     size_t          four;
+-    netsnmp_variable_list *vp = NULL;
++    netsnmp_variable_list *vp = NULL, *vplast = NULL;
+     oid             objid[MAX_OID_LEN];
+ 
+     /*
+@@ -4487,38 +4486,24 @@
+                               (ASN_SEQUENCE | ASN_CONSTRUCTOR),
+                               "varbinds");
+     if (data == NULL)
+-        return -1;
++        goto fail;
+ 
+     /*
+      * get each varBind sequence 
+      */
+     while ((int) *length > 0) {
+-        netsnmp_variable_list *vptemp;
+-        vptemp = (netsnmp_variable_list *) malloc(sizeof(*vptemp));
+-        if (NULL == vptemp) {
+-            return -1;
+-        }
+-        if (NULL == vp) {
+-            pdu->variables = vptemp;
+-        } else {
+-            vp->next_variable = vptemp;
+-        }
+-        vp = vptemp;
++        vp = SNMP_MALLOC_TYPEDEF(netsnmp_variable_list);
++        if (NULL == vp)
++            goto fail;
+ 
+-        vp->next_variable = NULL;
+-        vp->val.string = NULL;
+         vp->name_length = MAX_OID_LEN;
+-        vp->name = NULL;
+-        vp->index = 0;
+-        vp->data = NULL;
+-        vp->dataFreeHook = NULL;
+         DEBUGDUMPSECTION("recv", "VarBind");
+         data = snmp_parse_var_op(data, objid, &vp->name_length, &vp->type,
+                                  &vp->val_len, &var_val, length);
+         if (data == NULL)
+-            return -1;
++            goto fail;
+         if (snmp_set_var_objid(vp, objid, vp->name_length))
+-            return -1;
++            goto fail;
+ 
+         len = MAX_PACKET_LENGTH;
+         DEBUGDUMPHEADER("recv", "Value");
+@@ -4583,7 +4568,7 @@
+                 vp->val.string = (u_char *) malloc(vp->val_len);
+             }
+             if (vp->val.string == NULL) {
+-                return -1;
++                goto fail;
+             }
+             asn_parse_string(var_val, &len, &vp->type, vp->val.string,
+                              &vp->val_len);
+@@ -4594,7 +4579,7 @@
+             vp->val_len *= sizeof(oid);
+             vp->val.objid = (oid *) malloc(vp->val_len);
+             if (vp->val.objid == NULL) {
+-                return -1;
++                goto fail;
+             }
+             memmove(vp->val.objid, objid, vp->val_len);
+             break;
+@@ -4606,19 +4591,35 @@
+         case ASN_BIT_STR:
+             vp->val.bitstring = (u_char *) malloc(vp->val_len);
+             if (vp->val.bitstring == NULL) {
+-                return -1;
++                goto fail;
+             }
+             asn_parse_bitstring(var_val, &len, &vp->type,
+                                 vp->val.bitstring, &vp->val_len);
+             break;
+         default:
+             snmp_log(LOG_ERR, "bad type returned (%x)\n", vp->type);
+-            badtype = -1;
++            goto fail;
+             break;
+         }
+         DEBUGINDENTADD(-4);
++
++        if (NULL == vplast) {
++            pdu->variables = vp;
++        } else {
++            vplast->next_variable = vp;
++        }
++        vplast = vp;
++        vp = NULL;
+     }
+-    return badtype;
++    return 0;
++
++  fail:
++    DEBUGMSGTL(("recv", "error while parsing VarBindList\n"));
++    /** if we were parsing a var, remove it from the pdu and free it */
++    if (vp)
++        snmp_free_var(vp);
++
++    return -1;
+ }
+ 
+ /*
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.1.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.1.bb
index 93d3a94..b1f777e 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.1.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.1.bb
@@ -21,6 +21,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.zip \
         file://net-snmp-testing-add-the-output-format-for-ptest.patch \
         file://run-ptest \
         file://0001-Fix-CVE-2014-2285.patch \
+        file://donnt-return-incompletely-parsed-varbinds.patch \
 "
 
 SRC_URI[md5sum] = "a2c83518648b0f2a5d378625e45c0e18"
-- 
1.9.1


