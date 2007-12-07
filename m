Received: from [194.138.37.40] (helo=gecko.sbs.de)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <Fabrice.Aeschbacher@siemens.com>) id 1J0gim-0006Il-9S
	for openembedded-devel@openembedded.org; Fri, 07 Dec 2007 18:10:42 +0100
Received: from mail2.sbs.de (localhost [127.0.0.1])
	by gecko.sbs.de (8.12.6/8.12.6) with ESMTP id lB7H6nbf013522
	for <openembedded-devel@openembedded.org>;
	Fri, 7 Dec 2007 18:06:49 +0100
Received: from fthw9xpa.ww002.siemens.net (fthw9xpa.ww002.siemens.net
	[157.163.133.222])
	by mail2.sbs.de (8.12.6/8.12.6) with ESMTP id lB7H6njP016297
	for <openembedded-devel@openembedded.org>;
	Fri, 7 Dec 2007 18:06:49 +0100
Received: from stgw002a.ww002.siemens.net ([141.73.158.150]) by
	fthw9xpa.ww002.siemens.net with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 7 Dec 2007 18:06:48 +0100
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Fri, 7 Dec 2007 18:06:33 +0100
Message-ID: <D7810733513F4840B4EBAAFA64D9C6A4019F53BF@stgw002a.ww002.siemens.net>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [PATCH ] xfce-mcs-manager
Thread-Index: Acg484TamWl0/kMfR0G7JN/1nPsW0w==
From: "Aeschbacher, Fabrice" <Fabrice.Aeschbacher@siemens.com>
To: <openembedded-devel@openembedded.org>
X-OriginalArrivalTime: 07 Dec 2007 17:06:49.0195 (UTC)
	FILETIME=[8E141BB0:01C838F3]
Subject: [PATCH ] xfce-mcs-manager
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Dec 2007 17:10:48 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

This patch corrects a bug in packages/xfce/xfce-mcs-manager.inc

Could someone please check it in?

Regards,
Fabrice Aeschbacher

--- packages/xfce/xfce-mcs-manager.inc.orig	2007-12-07
18:04:15.000000000 +0100
+++ packages/xfce/xfce-mcs-manager.inc	2007-12-07 17:53:11.000000000
+0100
@@ -3,7 +3,7 @@
 # Released under the MIT license (see packages/COPYING)
=20
 DESCRIPTION=3D"XFCE4 Settings manager."
-DEPENDS=3D"libxfcegui4 libxfce4mcs"
+DEPENDS=3D"libxfcegui4 libxfce4mcs intltool-native"
 SECTION =3D "x11"
 PR =3D "r1"




