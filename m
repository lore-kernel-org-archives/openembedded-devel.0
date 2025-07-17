Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEBF8C83F34
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 19:57:16 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.4778.1752782235424945220
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Jul 2025 12:57:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=UXJdPLBU;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: a-christidis@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56HJvD9g082638;
	Thu, 17 Jul 2025 14:57:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752782233;
	bh=T8G49zc/4/FZZ3c/PvARm9O/6xVsAuvph7ktQd8sI00=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=UXJdPLBUCzobhtg5y0PYNJjMKA9n7Fiq1LdLodvBwmuTV+6fwyXMrbBoSEycG1r60
	 P0xv+XWkNrya+XILgx660jhm7w2f/ObojQdDaUGpQwq9kpfpgm1BsWPB9UwLvCUPY2
	 7g3Iqxbw4ZNwgj6aYdYq/1QNbFltEEKIgclU+CB8=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56HJvDA03002274
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 17 Jul 2025 14:57:13 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 17
 Jul 2025 14:57:12 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 17 Jul 2025 14:57:12 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56HJvCCP2387890;
	Thu, 17 Jul 2025 14:57:12 -0500
From: <a-christidis@ti.com>
To: <raj.khem@gmail.com>, <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][master][PATCH 2/2] licenses: add licenses for ktx-software
Date: Thu, 17 Jul 2025 14:57:12 -0500
Message-ID: <20250717195712.2538506-3-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250717195712.2538506-1-a-christidis@ti.com>
References: <20250717195712.2538506-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllvem-ot03.ext.ti.com id 56HJvD9g082638
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Jul 2025 19:57:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118618

From: Antonios Christidis <a-christidis@ti.com>

Add new necessary licenses for ktx-software.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
 meta-oe/licenses/Cesium-Trademark-Terms |  39 +++++++++
 meta-oe/licenses/ETCSLA                 | 109 ++++++++++++++++++++++++
 meta-oe/licenses/HI-Trademark           |   5 ++
 meta-oe/licenses/Kodak                  |   7 ++
 meta-oe/licenses/PNGSuite               |  14 +++
 meta-oe/licenses/fmt                    |  27 ++++++
 6 files changed, 201 insertions(+)
 create mode 100644 meta-oe/licenses/Cesium-Trademark-Terms
 create mode 100644 meta-oe/licenses/ETCSLA
 create mode 100644 meta-oe/licenses/HI-Trademark
 create mode 100644 meta-oe/licenses/Kodak
 create mode 100644 meta-oe/licenses/PNGSuite
 create mode 100644 meta-oe/licenses/fmt

diff --git a/meta-oe/licenses/Cesium-Trademark-Terms b/meta-oe/licenses/C=
esium-Trademark-Terms
new file mode 100644
index 0000000000..06d1b8542e
--- /dev/null
+++ b/meta-oe/licenses/Cesium-Trademark-Terms
@@ -0,0 +1,39 @@
+The following text is copied and pasted from https://github.com/Analytic=
alGraphicsInc/cesium/wiki/CesiumTrademark.pdf, which are the "Trademark T=
erms and Conditions" under which an image in this repository was contribu=
ted by AGI. Please refer to the original link as the authoritative text; =
this file exists only for REUSE license-checker compliance.
+
+Trademark Terms and Conditions
+
+Analytical Graphics=C2=AE, Cesium=C2=AE, and Cesium Pro=E2=84=A2 are tra=
demarks owned by AGI. AGI uses these
+trademarks/logos to identify AGI as a company and also AGI=E2=80=99s pro=
ducts, services and activities. AGI maintains
+control over the usage of its trademarks, and this document sets forth w=
ho may use these trademarks, and under what
+terms and conditions these trademarks may be used.
+Fair Use
+AGI=E2=80=99s trademarks/logos may be used in instances when the use of =
such falls under a category of fair use. Examples
+of fair use include research, teaching, and educational purposes. If you=
 use AGI=E2=80=99s trademarks/logos for this purpose,
+you must give AGI proper credit and identify AGI as the owner of the tra=
demarks/logos.
+Do not use AGI=E2=80=99s trademarks/logos in any of your products or ser=
vices that compete with any of AGI=E2=80=99s products or
+services. Use of AGI=E2=80=99s trademark/logos in your competing product=
 or service is trademark infringement, and AGI
+will take legal action against you for violating this provision.
+Laymen=E2=80=99s Terms: You are not allowed to use the Cesium trademark =
to compete with AGI. If you do, AGI will take
+you to court. You can use the trademark without our permission for socia=
lly productive purposes, such as presenting
+Cesium in a conference. If you do so, make sure you identify AGI as the =
owner of the trademark.
+Usage Guidelines
+Avoid mistakes when reproducing AGI=E2=80=99s trademarks/logos. Do not s=
eparate the elements of the logo or alter the
+logo in any way. Do not rotate or animate it, and do not use any part of=
 the logo as a graphic element, background,
+or pattern in any way that competes with AGI.
+Do not translate or localize the logos, and do not add anything to the l=
ogos. Do not attempt to set the logotype,
+change the font, or alter the size, proportions, or space between letter=
s. You must use AGI=E2=80=99s trademarks/logos
+exactly as they are provided by AGI.
+Laymen=E2=80=99s Terms: When using our trademark(s), do not modify or ch=
ange them in any way.
+Other Uses
+For any uses other than those identified in this document, you must cont=
act AGI for express written permission. AGI
+reserves the right to reject your request to use AGI=E2=80=99s trademark=
s/logos for any reason. AGI=E2=80=99s contact information is
+below.
+Laymen=E2=80=99s Terms: You need our permission to use our trademarks fo=
r any reasons not stated above. If you send us a
+request to use our trademarks, we can say no for any reason.
+
+Corporate Contact Info:
+Analytical Graphics, Inc.
+220 Valley Creek Blvd.
+Exton, Pennsylvania 19341
+1.610.981-8000
+contracts@agi.com
diff --git a/meta-oe/licenses/ETCSLA b/meta-oe/licenses/ETCSLA
new file mode 100644
index 0000000000..d47217afdb
--- /dev/null
+++ b/meta-oe/licenses/ETCSLA
@@ -0,0 +1,109 @@
+(C) Ericsson AB 2013. All Rights Reserved.
+
+Software License Agreement
+
+PLEASE REVIEW THE FOLLOWING TERMS AND CONDITIONS PRIOR TO USING THE
+ERICSSON TEXTURE COMPRESSION CODEC SOFTWARE (THE "SOFTWARE"). THE USE
+OF THE SOFTWARE IS SUBJECT TO THE TERMS AND CONDITIONS OF THE
+FOLLOWING SOFTWARE LICENSE AGREEMENT (THE "SLA"). IF YOU DO NOT ACCEPT
+SUCH TERMS AND CONDITIONS YOU MAY NOT USE THE SOFTWARE.
+
+Subject to the terms and conditions of the SLA, the licensee of the
+Software (the "Licensee") hereby, receives a non-exclusive,
+non-transferable, limited, free-of-charge, perpetual and worldwide
+license, to copy, use, distribute and modify the Software, but only
+for the purpose of developing, manufacturing, selling, using and
+distributing products including the Software in binary form, which
+products are used for compression and/or decompression according to
+the Khronos standard specifications OpenGL, OpenGL ES and
+WebGL. Notwithstanding anything of the above, Licensee may distribute
+[etcdec.cxx] in source code form provided (i) it is in unmodified
+form; and (ii) it is included in software owned by Licensee.
+
+If Licensee institutes, or threatens to institute, patent litigation
+against Ericsson or Ericsson's affiliates for using the Software for
+developing, having developed, manufacturing, having manufactured,
+selling, offer for sale, importing, using, leasing, operating,
+repairing and/or distributing products (i) within the scope of the
+Khronos framework; or (ii) using software or other intellectual
+property rights owned by Ericsson or its affiliates and provided under
+the Khronos framework, Ericsson shall have the right to terminate this
+SLA with immediate effect. Moreover, if Licensee institutes, or
+threatens to institute, patent litigation against any other licensee
+of the Software for using the Software in products within the scope of
+the Khronos framework, Ericsson shall have the right to terminate this
+SLA with immediate effect. However, should Licensee institute, or
+threaten to institute, patent litigation against any other licensee of
+the Software based on such other licensee's use of any other software
+together with the Software, then Ericsson shall have no right to
+terminate this SLA.
+
+This SLA does not transfer to Licensee any ownership to any Ericsson
+or third party intellectual property rights. All rights not expressly
+granted by Ericsson under this SLA are hereby expressly
+reserved. Furthermore, nothing in this SLA shall be construed as a
+right to use or sell products in a manner which conveys or purports to
+convey whether explicitly, by principles of implied license, or
+otherwise, any rights to any third party, under any patent of Ericsson
+or of Ericsson's affiliates covering or relating to any combination of
+the Software with any other software or product (not licensed
+hereunder) where the right applies specifically to the combination and
+not to the software or product itself.
+
+THE SOFTWARE IS PROVIDED "AS IS". ERICSSON MAKES NO REPRESENTATIONS OF
+ANY KIND, EXTENDS NO WARRANTIES OR CONDITIONS OF ANY KIND, EITHER
+EXPRESS, IMPLIED OR STATUTORY; INCLUDING, BUT NOT LIMITED TO, EXPRESS,
+IMPLIED OR STATUTORY WARRANTIES OR CONDITIONS OF TITLE,
+MERCHANTABILITY, SATISFACTORY QUALITY, SUITABILITY, AND FITNESS FOR A
+PARTICULAR PURPOSE. THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE
+OF THE SOFTWARE IS WITH THE LICENSEE. SHOULD THE SOFTWARE PROVE
+DEFECTIVE, THE LICENSEE ASSUMES THE COST OF ALL NECESSARY SERVICING,
+REPAIR OR CORRECTION. ERICSSON MAKES NO WARRANTY THAT THE MANUFACTURE,
+SALE, OFFERING FOR SALE, DISTRIBUTION, LEASE, USE OR IMPORTATION UNDER
+THE SLA WILL BE FREE FROM INFRINGEMENT OF PATENTS, COPYRIGHTS OR OTHER
+INTELLECTUAL PROPERTY RIGHTS OF OTHERS, AND THE VALIDITY OF THE
+LICENSE AND THE SLA ARE SUBJECT TO LICENSEE'S SOLE RESPONSIBILITY TO
+MAKE SUCH DETERMINATION AND ACQUIRE SUCH LICENSES AS MAY BE NECESSARY
+WITH RESPECT TO PATENTS, COPYRIGHT AND OTHER INTELLECTUAL PROPERTY OF
+THIRD PARTIES.
+
+THE LICENSEE ACKNOWLEDGES AND ACCEPTS THAT THE SOFTWARE (I) IS NOT
+LICENSED FOR; (II) IS NOT DESIGNED FOR OR INTENDED FOR; AND (III) MAY
+NOT BE USED FOR; ANY MISSION CRITICAL APPLICATIONS SUCH AS, BUT NOT
+LIMITED TO OPERATION OF NUCLEAR OR HEALTHCARE COMPUTER SYSTEMS AND/OR
+NETWORKS, AIRCRAFT OR TRAIN CONTROL AND/OR COMMUNICATION SYSTEMS OR
+ANY OTHER COMPUTER SYSTEMS AND/OR NETWORKS OR CONTROL AND/OR
+COMMUNICATION SYSTEMS ALL IN WHICH CASE THE FAILURE OF THE SOFTWARE
+COULD LEAD TO DEATH, PERSONAL INJURY, OR SEVERE PHYSICAL, MATERIAL OR
+ENVIRONMENTAL DAMAGE. LICENSEE'S RIGHTS UNDER THIS LICENSE WILL
+TERMINATE AUTOMATICALLY AND IMMEDIATELY WITHOUT NOTICE IF LICENSEE
+FAILS TO COMPLY WITH THIS PARAGRAPH.
+
+IN NO EVENT SHALL ERICSSON BE LIABLE FOR ANY DAMAGES WHATSOEVER,
+INCLUDING BUT NOT LIMITED TO PERSONAL INJURY, ANY GENERAL, SPECIAL,
+INDIRECT, INCIDENTAL OR CONSEQUENTIAL DAMAGES, ARISING OUT OF OR IN
+CONNECTION WITH THE USE OR INABILITY TO USE THE SOFTWARE (INCLUDING
+BUT NOT LIMITED TO LOSS OF PROFITS, BUSINESS INTERUPTIONS, OR ANY
+OTHER COMMERCIAL DAMAGES OR LOSSES, LOSS OF DATA OR DATA BEING
+RENDERED INACCURATE OR LOSSES SUSTAINED BY THE LICENSEE OR THIRD
+PARTIES OR A FAILURE OF THE SOFTWARE TO OPERATE WITH ANY OTHER
+SOFTWARE) REGARDLESS OF THE THEORY OF LIABILITY (CONTRACT, TORT, OR
+OTHERWISE), EVEN IF THE LICENSEE OR ANY OTHER PARTY HAS BEEN ADVISED
+OF THE POSSIBILITY OF SUCH DAMAGES.
+
+Licensee acknowledges that "ERICSSON ///" is the corporate trademark
+of Telefonaktiebolaget LM Ericsson and that both "Ericsson" and the
+figure "///" are important features of the trade names of
+Telefonaktiebolaget LM Ericsson. Nothing contained in these terms and
+conditions shall be deemed to grant Licensee any right, title or
+interest in the word "Ericsson" or the figure "///". No delay or
+omission by Ericsson to exercise any right or power shall impair any
+such right or power to be construed to be a waiver thereof. Consent by
+Ericsson to, or waiver of, a breach by the Licensee shall not
+constitute consent to, waiver of, or excuse for any other different or
+subsequent breach.
+
+This SLA shall be governed by the substantive law of Sweden. Any
+dispute, controversy or claim arising out of or in connection with
+this SLA, or the breach, termination or invalidity thereof, shall be
+submitted to the exclusive jurisdiction of the Swedish Courts.
diff --git a/meta-oe/licenses/HI-Trademark b/meta-oe/licenses/HI-Trademar=
k
new file mode 100644
index 0000000000..0ccddc993f
--- /dev/null
+++ b/meta-oe/licenses/HI-Trademark
@@ -0,0 +1,5 @@
+The HI logo textures are copyright by & trademarks of HI Corporation and=
 are
+provided for use only in testing the KTX loader. Any other use requires
+specific prior written permission from HI. Furthermore the name HI may
+not be used to endorse or promote products derived from this software
+without specific prior written permission.
diff --git a/meta-oe/licenses/Kodak b/meta-oe/licenses/Kodak
new file mode 100644
index 0000000000..9a7f26b46a
--- /dev/null
+++ b/meta-oe/licenses/Kodak
@@ -0,0 +1,7 @@
+This LICENSES file applies to images from the Kodak Lossless True Color
+Image Suite, and exists only for REUSE compliance. According to
+http://r0k.us/graphics/kodak/ , for such images:
+
+"It is my understanding they have been released by the Eastman Kodak Com=
pany
+for unrestricted usage. Many sites use them as a standard test suite for
+compression testing, etc."
diff --git a/meta-oe/licenses/PNGSuite b/meta-oe/licenses/PNGSuite
new file mode 100644
index 0000000000..1bb39a97e5
--- /dev/null
+++ b/meta-oe/licenses/PNGSuite
@@ -0,0 +1,14 @@
+The following text is copied and pasted from
+http://www.schaik.com/pngsuite/PngSuite.LICENSE , which is the license u=
nder
+which an image from the PngSuite project is used. Please refer to the
+original link as the authoritative text; this file exists only for REUSE
+license-checker compliance.
+
+PngSuite
+--------
+
+Permission to use, copy, modify and distribute these images for any
+purpose and without fee is hereby granted.
+
+
+(c) Willem van Schaik, 1996, 2011
diff --git a/meta-oe/licenses/fmt b/meta-oe/licenses/fmt
new file mode 100644
index 0000000000..1cd1ef9269
--- /dev/null
+++ b/meta-oe/licenses/fmt
@@ -0,0 +1,27 @@
+Copyright (c) 2012 - present, Victor Zverovich and {fmt} contributors
+
+Permission is hereby granted, free of charge, to any person obtaining
+a copy of this software and associated documentation files (the
+"Software"), to deal in the Software without restriction, including
+without limitation the rights to use, copy, modify, merge, publish,
+distribute, sublicense, and/or sell copies of the Software, and to
+permit persons to whom the Software is furnished to do so, subject to
+the following conditions:
+
+The above copyright notice and this permission notice shall be
+included in all copies or substantial portions of the Software.
+
+THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
+MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
+LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
+OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
+WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
+
+--- Optional exception to the license ---
+
+As an exception, if, as a result of your compiling your source code, por=
tions
+of this Software are embedded into a machine-executable object form of s=
uch
+source code, you may redistribute such embedded portions in such object =
form
+without including the above copyright and permission notices.
--=20
2.34.1


