Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id EA73C72167
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Nov 2014 11:01:38 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="43496673"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Nov 2014 18:58:26 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sAHB1O0Q018959
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Nov 2014 19:01:24 +0800
Received: from localhost.localdomain (10.167.226.35) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 17 Nov 2014 19:01:40 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 17 Nov 2014 19:00:07 +0800
Message-ID: <1416222008-9218-5-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1416222008-9218-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <1416222008-9218-1-git-send-email-lixin.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.35]
Subject: [PATCH 4/5] sblim-sfcc : add recipe
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
X-List-Received-Date: Mon, 17 Nov 2014 11:01:41 -0000
Content-Type: text/plain

Small Footprint CIM Client Library Runtime Libraries

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../1000sblim-sfcc-2.1.0-initialization1.patch     | 498 +++++++++++++++++++++
 .../sblim-sfcc/sblim-sfcc_2.2.5.bb                 |  29 ++
 2 files changed, 527 insertions(+)
 create mode 100644 meta-oe/recipes-extended/sblim-sfcc/sblim-sfcc-2.1.0/1000sblim-sfcc-2.1.0-initialization1.patch
 create mode 100644 meta-oe/recipes-extended/sblim-sfcc/sblim-sfcc_2.2.5.bb

diff --git a/meta-oe/recipes-extended/sblim-sfcc/sblim-sfcc-2.1.0/1000sblim-sfcc-2.1.0-initialization1.patch b/meta-oe/recipes-extended/sblim-sfcc/sblim-sfcc-2.1.0/1000sblim-sfcc-2.1.0-initialization1.patch
new file mode 100644
index 0000000..02933b1
--- /dev/null
+++ b/meta-oe/recipes-extended/sblim-sfcc/sblim-sfcc-2.1.0/1000sblim-sfcc-2.1.0-initialization1.patch
@@ -0,0 +1,498 @@
+diff -Naur sblim-sfcc-2.1.0/backend/cimxml/grammar.c sblim-sfcc-2.1.0_fix/backend/cimxml/grammar.c
+--- sblim-sfcc-2.1.0/backend/cimxml/grammar.c	2008-01-21 15:45:41.000000000 +0530
++++ sblim-sfcc-2.1.0_fix/backend/cimxml/grammar.c	2009-03-09 17:15:31.000000000 +0530
+@@ -56,7 +56,7 @@
+ 
+ static void start(ParserControl *parm, parseUnion *stateUnion)
+ {
+-	parseUnion lvalp;
++	parseUnion lvalp = {0};
+ 	ct = localLex(stateUnion, parm);
+ 	if(ct == XTOK_XML) {
+ 		ct = localLex(stateUnion, parm);
+@@ -74,7 +74,7 @@
+ 
+ static void cim(ParserControl *parm, parseUnion *stateUnion)
+ {
+-	parseUnion lvalp;
++	parseUnion lvalp = {0};
+ 	ct = localLex(stateUnion, parm);
+ 	if(ct == XTOK_CIM) {
+ 		message(parm, (parseUnion*)&stateUnion->xtokMessage);
+@@ -92,7 +92,7 @@
+ 
+ static void message(ParserControl *parm, parseUnion *stateUnion)
+ {
+-	parseUnion lvalp;
++	parseUnion lvalp = {0};
+ 	ct = localLex((parseUnion*)&stateUnion->xtokMessage, parm);
+ 	if(ct == XTOK_MESSAGE) {
+ 		messageContent(parm, stateUnion);
+@@ -110,7 +110,7 @@
+ 
+ static void messageContent(ParserControl *parm, parseUnion *stateUnion)
+ {
+-	parseUnion lvalp;
++	parseUnion lvalp = {0};
+ 	ct = localLex(stateUnion, parm);
+ 	if(ct == XTOK_SIMPLERSP) {
+ 		simpleRspContent(parm, (parseUnion*)&stateUnion->xtokSimpleRespContent);
+@@ -137,7 +137,7 @@
+ 
+ static void simpleRspContent(ParserControl *parm, parseUnion *stateUnion)
+ {
+-	parseUnion lvalp;
++	parseUnion lvalp ={0};
+ 	ct = localLex((parseUnion*)&stateUnion->xtokSimpleRespContent, parm);
+ 	if(ct == XTOK_METHODRESP) {
+ 		methodRespContent(parm, (parseUnion*)&stateUnion->xtokSimpleRespContent.resp);
+@@ -165,7 +165,7 @@
+ 
+ static void exportIndication(ParserControl *parm, parseUnion *stateUnion)
+ {
+-	parseUnion lvalp;
++	parseUnion lvalp = {0};
+ 	ct = localLex(stateUnion, parm);
+ 	if(ct == XTOK_EXPORTINDICATION) {
+ 		exParamValue(parm, stateUnion);
+@@ -183,7 +183,7 @@
+ 
+ static void exParamValue(ParserControl *parm, parseUnion *stateUnion)
+ {
+-	parseUnion lvalp;
++	parseUnion lvalp = {0};
+ 	CMPIInstance *inst;
+ 	ct = localLex(stateUnion, parm);
+ 	if(ct == XTOK_EP_INSTANCE) {
+@@ -211,7 +211,7 @@
+ 
+ static void methodRespContent(ParserControl *parm, parseUnion *stateUnion)
+ {
+-	parseUnion lvalp;
++	parseUnion lvalp={0};
+ 	ct = localLex(&lvalp, parm);
+ 	if(ct == XTOK_ERROR) {
+ 		dontLex = 1;
+@@ -246,7 +246,7 @@
+ 
+ static void iMethodRespContent(ParserControl *parm, parseUnion *stateUnion)
+ {
+-	parseUnion lvalp;
++	parseUnion lvalp={0};
+ 	ct = localLex(&lvalp, parm);
+ 	if(ct == XTOK_ERROR) {
+ 		dontLex = 1;
+@@ -263,7 +263,7 @@
+ 
+ static void error(ParserControl *parm, parseUnion *stateUnion)
+ {
+-	parseUnion lvalp;
++	parseUnion lvalp ={0};
+ 	ct = localLex((parseUnion*)&stateUnion->xtokErrorResp, parm);
+ 	if(ct == XTOK_ERROR) {
+ 		setError(parm, &stateUnion->xtokErrorResp);
+@@ -281,7 +281,7 @@
+ 
+ static void returnValue(ParserControl *parm, parseUnion *stateUnion)
+ {
+-	parseUnion lvalp;
++	parseUnion lvalp ={0};
+ 	CMPIType  t;
+ 	CMPIValue val;
+ 	CMPIInstance *inst;
+@@ -321,7 +321,7 @@
+ 
+ static void returnValueData(ParserControl *parm, parseUnion *stateUnion)
+ {
+-	parseUnion lvalp;
++	parseUnion lvalp ={0};
+ 	ct = localLex((parseUnion*)&stateUnion->xtokReturnValueData, parm);
+ 	if(ct == XTOK_VALUE) {
+ 		dontLex = 1;
+@@ -339,7 +339,7 @@
+ 
+ static void paramValue(ParserControl *parm, parseUnion *stateUnion)
+ {
+-	parseUnion lvalp;
++	parseUnion lvalp={0};
+ 	ct = localLex((parseUnion*)&stateUnion->xtokParamValue, parm);
+ 	if(ct == XTOK_PARAMVALUE) {
+ 		ct = localLex(&lvalp, parm);
+@@ -369,7 +369,7 @@
+ 
+ static void paramValueData(ParserControl *parm, parseUnion *stateUnion)
+ {
+-	parseUnion lvalp;
++	parseUnion lvalp={0};
+ 	ct = localLex((parseUnion*)&stateUnion->xtokParamValueData, parm);
+ 	if(ct == XTOK_VALUE) {
+ 		dontLex = 1;
+@@ -400,7 +400,7 @@
+ 
+ static void iReturnValue(ParserControl *parm, parseUnion *stateUnion)
+ {
+-	parseUnion lvalp;
++	parseUnion lvalp={0};
+ 	ct = localLex(stateUnion, parm);
+ 	if(ct == XTOK_IRETVALUE) {
+ 		iReturnValueContent(parm, stateUnion);
+@@ -418,7 +418,7 @@
+ 
+ static void iReturnValueContent(ParserControl *parm, parseUnion *stateUnion)
+ {
+-	parseUnion lvalp;
++	parseUnion lvalp ={0};
+ 	CMPIObjectPath *op;
+ 	CMPIInstance *inst;
+ 	CMPIConstClass *cls;
+@@ -524,7 +524,7 @@
+ 
+ static void getPropertyRetValue(ParserControl *parm, parseUnion *stateUnion)
+ {
+-	parseUnion lvalp;
++	parseUnion lvalp={0};
+ 	CMPIType  t;
+ 	CMPIValue val;
+ 	ct = localLex((parseUnion*)&stateUnion->xtokGetPropRetContent, parm);
+@@ -550,7 +550,7 @@
+ 
+ static void valueObjectWithPath(ParserControl *parm, parseUnion *stateUnion)
+ {
+-	parseUnion lvalp;
++	parseUnion lvalp={0};
+ 	ct = localLex((parseUnion*)&stateUnion->xtokObjectWithPath, parm);
+ 	if(ct == XTOK_VALUEOBJECTWITHPATH) {
+ 		valueObjectWithPathData(parm, (parseUnion*)&stateUnion->xtokObjectWithPath.object);
+@@ -569,7 +569,7 @@
+ 
+ static void valueObjectWithPathData(ParserControl *parm, parseUnion *stateUnion)
+ {
+-	parseUnion lvalp;
++	parseUnion lvalp={0};
+ 	CMPIObjectPath *op;
+ 	CMPIInstance *inst;
+ 	ct = localLex((parseUnion*)&stateUnion->xtokObjectWithPathData, parm);
+@@ -597,7 +597,7 @@
+ 
+ static void classWithPath(ParserControl *parm, parseUnion *stateUnion)
+ {
+-	parseUnion lvalp;
++	parseUnion lvalp={0};
+ 	ct = localLex((parseUnion*)&stateUnion->xtokClassWithPath, parm);
+ 	if(ct == XTOK_CLASSPATH) {
+ 		dontLex = 1;
+@@ -611,7 +611,7 @@
+ 
+ static void instanceWithPath(ParserControl *parm, parseUnion *stateUnion)
+ {
+-	parseUnion lvalp;
++	parseUnion lvalp={0};
+ 	ct = localLex((parseUnion*)&stateUnion->xtokInstanceWithPath, parm);
+ 	if(ct == XTOK_INSTANCEPATH) {
+ 		dontLex = 1;
+@@ -625,7 +625,7 @@
+ 
+ static void class(ParserControl *parm, parseUnion *stateUnion)
+ {
+-	parseUnion lvalp;
++	parseUnion lvalp={0};
+ 	ct = localLex((parseUnion*)&stateUnion->xtokClass, parm);
+ 	if(ct == XTOK_CLASS) {
+ 		ct = localLex(&lvalp, parm);
+@@ -678,7 +678,7 @@
+ 
+ static void method(ParserControl *parm, parseUnion *stateUnion)
+ {
+-	parseUnion lvalp;
++	parseUnion lvalp={0};
+ 	ct = localLex((parseUnion*)&stateUnion->xtokMethod, parm);
+ 	if(ct == XTOK_METHOD) {
+ 		ct = localLex(&lvalp, parm);
+@@ -718,7 +718,7 @@
+ 
+ static void methodData(ParserControl *parm, parseUnion *stateUnion)
+ {
+-	parseUnion lvalp;
++	parseUnion lvalp={0};
+ 	if(ct == XTOK_PARAM) {
+ 		dontLex = 1;
+ 		if(ct == XTOK_PARAM) {
+@@ -754,7 +754,7 @@
+ 
+ static void parameter(ParserControl *parm, parseUnion *stateUnion)
+ {
+-	parseUnion lvalp;
++	parseUnion lvalp={0};
+ 	ct = localLex((parseUnion*)&stateUnion->xtokParam, parm);
+ 	if(ct == XTOK_PARAM) {
+ 		ct = localLex(&lvalp, parm);
+@@ -782,7 +782,7 @@
+ 
+ static void parameterReference(ParserControl *parm, parseUnion *stateUnion)
+ {
+-	parseUnion lvalp;
++	parseUnion lvalp={0};
+ 	ct = localLex((parseUnion*)&stateUnion->xtokParam, parm);
+ 	if(ct == XTOK_PARAMREF) {
+ 		ct = localLex(&lvalp, parm);
+@@ -810,7 +810,7 @@
+ 
+ static void parameterRefArray(ParserControl *parm, parseUnion *stateUnion)
+ {
+-	parseUnion lvalp;
++	parseUnion lvalp={0};
+ 	ct = localLex((parseUnion*)&stateUnion->xtokParam, parm);
+ 	if(ct == XTOK_PARAMREFARRAY) {
+ 		ct = localLex(&lvalp, parm);
+@@ -838,7 +838,7 @@
+ 
+ static void parameterArray(ParserControl *parm, parseUnion *stateUnion)
+ {
+-	parseUnion lvalp;
++	parseUnion lvalp={0};
+ 	ct = localLex((parseUnion*)&stateUnion->xtokParam, parm);
+ 	if(ct == XTOK_PARAMARRAY) {
+ 		ct = localLex(&lvalp, parm);
+@@ -866,7 +866,7 @@
+ 
+ static void objectPath(ParserControl *parm, parseUnion *stateUnion)
+ {
+-	parseUnion lvalp;
++	parseUnion lvalp={0};
+ 	ct = localLex((parseUnion*)&stateUnion->xtokObjectPath, parm);
+ 	if(ct == XTOK_OBJECTPATH) {
+ 		instancePath(parm, (parseUnion*)&stateUnion->xtokObjectPath.path);
+@@ -884,7 +884,7 @@
+ 
+ static void classPath(ParserControl *parm, parseUnion *stateUnion)
+ {
+-	parseUnion lvalp;
++	parseUnion lvalp={0};
+ 	ct = localLex((parseUnion*)&stateUnion->xtokClassPath, parm);
+ 	if(ct == XTOK_CLASSPATH) {
+ 		nameSpacePath(parm, (parseUnion*)&stateUnion->xtokClassPath.name);
+@@ -903,7 +903,7 @@
+ 
+ static void className(ParserControl *parm, parseUnion *stateUnion)
+ {
+-	parseUnion lvalp;
++	parseUnion lvalp={0};
+ 	ct = localLex((parseUnion*)&stateUnion->xtokClassName, parm);
+ 	if(ct == XTOK_CLASSNAME) {
+ 		ct = localLex((parseUnion*)&stateUnion->xtokClassName, parm);
+@@ -920,7 +920,7 @@
+ 
+ static void instancePath(ParserControl *parm, parseUnion *stateUnion)
+ {
+-	parseUnion lvalp;
++	parseUnion lvalp={0};
+ 	ct = localLex((parseUnion*)&stateUnion->xtokInstancePath, parm);
+ 	if(ct == XTOK_INSTANCEPATH) {
+ 		nameSpacePath(parm, (parseUnion*)&stateUnion->xtokInstancePath.path);
+@@ -939,7 +939,7 @@
+ 
+ static void localInstancePath(ParserControl *parm, parseUnion *stateUnion)
+ {
+-	parseUnion lvalp;
++	parseUnion lvalp={0};
+ 	ct = localLex((parseUnion*)&stateUnion->xtokLocalInstancePath, parm);
+ 	if(ct == XTOK_LOCALINSTANCEPATH) {
+ 		localNameSpacePath(parm, (parseUnion*)&stateUnion->xtokLocalInstancePath.path);
+@@ -958,7 +958,7 @@
+ 
+ static void nameSpacePath(ParserControl *parm, parseUnion *stateUnion)
+ {
+-	parseUnion lvalp;
++	parseUnion lvalp={0};
+ 	ct = localLex((parseUnion*)&stateUnion->xtokNameSpacePath, parm);
+ 	if(ct == XTOK_NAMESPACEPATH) {
+ 		host(parm, (parseUnion*)&stateUnion->xtokNameSpacePath.host);
+@@ -977,7 +977,7 @@
+ 
+ static void host(ParserControl *parm, parseUnion *stateUnion)
+ {
+-	parseUnion lvalp;
++	parseUnion lvalp={0};
+ 	ct = localLex((parseUnion*)&stateUnion->xtokHost, parm);
+ 	if(ct == XTOK_HOST) {
+ 		ct = localLex((parseUnion*)&stateUnion->xtokHost, parm);
+@@ -994,7 +994,7 @@
+ 
+ static void localNameSpacePath(ParserControl *parm, parseUnion *stateUnion)
+ {
+-	parseUnion lvalp;
++	parseUnion lvalp={0};
+ 	ct = localLex((parseUnion*)&stateUnion->xtokLocalNameSpacePath, parm);
+ 	if(ct == XTOK_LOCALNAMESPACEPATH) {
+ 		ct = localLex(&lvalp, parm);
+@@ -1031,7 +1031,7 @@
+ 
+ static void nameSpace(ParserControl *parm, parseUnion *stateUnion)
+ {
+-	parseUnion lvalp;
++	parseUnion lvalp={0};
+ 	ct = localLex((parseUnion*)&stateUnion->xtokNameSpace, parm);
+ 	if(ct == XTOK_NAMESPACE) {
+ 		ct = localLex((parseUnion*)&stateUnion->xtokNameSpace, parm);
+@@ -1048,7 +1048,7 @@
+ 
+ static void valueNamedInstance(ParserControl *parm, parseUnion *stateUnion)
+ {
+-	parseUnion lvalp;
++	parseUnion lvalp={0};
+ 	ct = localLex((parseUnion*)&stateUnion->xtokNamedInstance, parm);
+ 	if(ct == XTOK_VALUENAMEDINSTANCE) {
+ 		instanceName(parm, (parseUnion*)&stateUnion->xtokNamedInstance.path);
+@@ -1067,7 +1067,7 @@
+ 
+ static void instance(ParserControl *parm, parseUnion *stateUnion)
+ {
+-	parseUnion lvalp;
++	parseUnion lvalp={0};
+ 	ct = localLex((parseUnion*)&stateUnion->xtokInstance, parm);
+ 	if(ct == XTOK_INSTANCE) {
+ 		ct = localLex(&lvalp, parm);
+@@ -1108,7 +1108,7 @@
+ 
+ static void genProperty(ParserControl *parm, parseUnion *stateUnion)
+ {
+-	parseUnion lvalp;
++	parseUnion lvalp={0};
+ 	ct = localLex((parseUnion*)&stateUnion->xtokProperty, parm);
+ 	if(ct == XTOK_PROPERTY) {
+ 		dontLex = 1;
+@@ -1132,7 +1132,7 @@
+ 
+ static void qualifier(ParserControl *parm, parseUnion *stateUnion)
+ {
+-	parseUnion lvalp;
++	parseUnion lvalp={0};
+ 	ct = localLex((parseUnion*)&stateUnion->xtokQualifier, parm);
+ 	if(ct == XTOK_QUALIFIER) {
+ 		ct = localLex(&lvalp, parm);
+@@ -1159,7 +1159,7 @@
+ 
+ static void qualifierData(ParserControl *parm, parseUnion *stateUnion)
+ {
+-	parseUnion lvalp;
++	parseUnion lvalp={0};
+ 	ct = localLex((parseUnion*)&stateUnion->xtokQualifierData, parm);
+ 	if(ct == XTOK_VALUE) {
+ 		dontLex = 1;
+@@ -1178,7 +1178,7 @@
+ 
+ static void property(ParserControl *parm, parseUnion *stateUnion)
+ {
+-	parseUnion lvalp;
++	parseUnion lvalp={0};
+ 	ct = localLex((parseUnion*)&stateUnion->xtokPropertyData, parm);
+ 	if(ct == XTOK_PROPERTY) {
+ 		ct = localLex(&lvalp, parm);
+@@ -1214,7 +1214,7 @@
+ 
+ static void propertyArray(ParserControl *parm, parseUnion *stateUnion)
+ {
+-	parseUnion lvalp;
++	parseUnion lvalp={0};
+ 	ct = localLex((parseUnion*)&stateUnion->xtokPropertyData, parm);
+ 	if(ct == XTOK_PROPERTYARRAY) {
+ 		ct = localLex(&lvalp, parm);
+@@ -1250,7 +1250,7 @@
+ 
+ static void propertyReference(ParserControl *parm, parseUnion *stateUnion)
+ {
+-	parseUnion lvalp;
++	parseUnion lvalp={0};
+ 	ct = localLex((parseUnion*)&stateUnion->xtokPropertyData, parm);
+ 	if(ct == XTOK_PROPERTYREFERENCE) {
+ 		ct = localLex(&lvalp, parm);
+@@ -1286,7 +1286,7 @@
+ 
+ static void instanceName(ParserControl *parm, parseUnion *stateUnion)
+ {
+-	parseUnion lvalp;
++	parseUnion lvalp={0};
+ 	ct = localLex((parseUnion*)&stateUnion->xtokInstanceName, parm);
+ 	if(ct == XTOK_INSTANCENAME) {
+ 		ct = localLex(&lvalp, parm);
+@@ -1315,7 +1315,7 @@
+ 
+ static void keyBinding(ParserControl *parm, parseUnion *stateUnion)
+ {
+-	parseUnion lvalp;
++	parseUnion lvalp={0};
+ 	ct = localLex((parseUnion*)&stateUnion->xtokKeyBinding, parm);
+ 	if(ct == XTOK_KEYBINDING) {
+ 		keyBindingContent(parm, (parseUnion*)&stateUnion->xtokKeyBinding.val);
+@@ -1334,7 +1334,7 @@
+ 
+ static void keyBindingContent(ParserControl *parm, parseUnion *stateUnion)
+ {
+-	parseUnion lvalp;
++	parseUnion lvalp={0};
+ 	ct = localLex((parseUnion*)&stateUnion->xtokKeyBindingContent, parm);
+ 	if(ct == XTOK_KEYVALUE) {
+ 		dontLex = 1;
+@@ -1353,7 +1353,7 @@
+ 
+ static void keyValue(ParserControl *parm, parseUnion *stateUnion)
+ {
+-	parseUnion lvalp;
++	parseUnion lvalp={0};
+ 	ct = localLex((parseUnion*)&stateUnion->xtokKeyValue, parm);
+ 	if(ct == XTOK_KEYVALUE) {
+ 		ct = localLex((parseUnion*)&stateUnion->xtokKeyValue, parm);
+@@ -1370,7 +1370,7 @@
+ 
+ static void value(ParserControl *parm, parseUnion *stateUnion)
+ {
+-	parseUnion lvalp;
++	parseUnion lvalp={0};
+ 	ct = localLex((parseUnion*)&stateUnion->xtokValue, parm);
+ 	if(ct == XTOK_VALUE) {
+ 		valueData(parm, (parseUnion*)&stateUnion->xtokValue.data);
+@@ -1389,7 +1389,7 @@
+ 
+ static void valueData(ParserControl *parm, parseUnion *stateUnion)
+ {
+-	parseUnion lvalp;
++	parseUnion lvalp={0};
+ 	ct = localLex((parseUnion*)&stateUnion->xtokValueData, parm);
+ 	if(ct == ZTOK_VALUE) {
+ 		stateUnion->xtokValueData.type=typeValue_charP;
+@@ -1413,7 +1413,7 @@
+ 
+ static void valueArray(ParserControl *parm, parseUnion *stateUnion)
+ {
+-	parseUnion lvalp;
++	parseUnion lvalp={0};
+ 	ct = localLex((parseUnion*)&stateUnion->xtokValueArray, parm);
+ 	if(ct == XTOK_VALUEARRAY) {
+ 		ct = localLex(&lvalp, parm);
+@@ -1446,7 +1446,7 @@
+ 
+ static void valueRefArray(ParserControl *parm, parseUnion *stateUnion)
+ {
+-	parseUnion lvalp;
++	parseUnion lvalp={0};
+ 	ct = localLex((parseUnion*)&stateUnion->xtokValueRefArray, parm);
+ 	if(ct == XTOK_VALUEREFARRAY) {
+ 		ct = localLex(&lvalp, parm);
+@@ -1479,7 +1479,7 @@
+ 
+ static void valueReference(ParserControl *parm, parseUnion *stateUnion)
+ {
+-	parseUnion lvalp;
++	parseUnion lvalp={0};
+ 	ct = localLex((parseUnion*)&stateUnion->xtokValueReference, parm);
+ 	if(ct == XTOK_VALUEREFERENCE) {
+ 		valueReferenceData(parm, (parseUnion*)&stateUnion->xtokValueReference.data);
+@@ -1498,7 +1498,7 @@
+ 
+ static void valueReferenceData(ParserControl *parm, parseUnion *stateUnion)
+ {
+-	parseUnion lvalp;
++	parseUnion lvalp={0};
+ 	ct = localLex((parseUnion*)&stateUnion->xtokValueReferenceData, parm);
+ 	if(ct == XTOK_INSTANCEPATH) {
+ 		dontLex = 1;
diff --git a/meta-oe/recipes-extended/sblim-sfcc/sblim-sfcc_2.2.5.bb b/meta-oe/recipes-extended/sblim-sfcc/sblim-sfcc_2.2.5.bb
new file mode 100644
index 0000000..30de914
--- /dev/null
+++ b/meta-oe/recipes-extended/sblim-sfcc/sblim-sfcc_2.2.5.bb
@@ -0,0 +1,29 @@
+SUMMARY = "Small Footprint CIM Client Library"
+DESCRIPTION = "Small Footprint CIM Client Library Runtime Libraries"
+HOMEPAGE = "http://www.sblim.org"
+SECTION = "Applications/System"
+
+SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/${PN}/${PN}-${PV}.tar.bz2/44a2893f0e2dbc37e60b91d8f7d7d83b/${PN}-${PV}.tar.bz2"
+
+SRC_URI[md5sum] = "44a2893f0e2dbc37e60b91d8f7d7d83b"
+SRC_URI[sha256sum] = "b22931c9247f07f9d842e50b0f4377a31752bb9e5aec6b529faea2ba9b8e862d"
+
+LICENSE = "EPL-1.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f300afd598546add034364cd0a533261"
+
+DEPENDS = "curl libpam"
+RDEPENDS_${PN} = "cim-schema"
+INSANE_SKIP_${PN} = "unsafe-references-in-binaries"
+
+inherit autotools
+
+do_configure_prepend() {
+	chmod a-x ${S}/backend/cimxml/*.[ch]
+}
+
+do_install() {
+	oe_runmake DESTDIR=${D} install
+	# remove unused libtool files
+	rm -rf ${D}/${libdir}/*la
+	rm -rf ${D}/usr/share/doc/sfcc-*
+}
-- 
1.8.4.2


