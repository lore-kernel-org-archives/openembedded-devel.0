Return-Path: <sven.ebenfeld@vaillant-group.com>
Received: from mailgw01.hp-net.de (mailgw01.hp-net.de [213.15.0.25])
	by mail.openembedded.org (Postfix) with ESMTP id 36721731D4
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Aug 2016 06:19:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailgw01.hp-net.de (Postfix) with ESMTP id DF9432290F7
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Aug 2016 08:19:09 +0200 (CEST)
X-Virus-Scanned: Virusscanner at mailgw01
Received: from mailgw01.hp-net.de ([127.0.0.1])
	by localhost (mailgw01.hp-net.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8vXWXaQ-dwET
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Aug 2016 08:19:09 +0200 (CEST)
Received: from jv-de-dc-fideas01.vaillant.vhgroup.lan
	(jv-de-dc-fideas01.vaillant.vhgroup.lan [10.107.7.215])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mailgw01.hp-net.de (Postfix) with ESMTPS id C10ED2290EE
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Aug 2016 08:19:09 +0200 (CEST)
Received: from VADERU07.vaillant.vhgroup.lan (unknown [10.107.77.148])
	by jv-de-dc-fideas01.vaillant.vhgroup.lan (Postfix) with ESMTPS
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Aug 2016 08:19:09 +0200 (CEST)
Received: from VADERU05.vaillant.vhgroup.lan ([fe80::4ca3:211f:12fe:63e3]) by
	VADERU07.vaillant.vhgroup.lan ([::1]) with mapi id 14.03.0301.000;
	Mon, 1 Aug 2016 08:19:06 +0200
From: "Ebenfeld, Sven" <sven.ebenfeld@vaillant-group.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-java][PATCH v3] openjdk-8: ignore wrong GCCVERSION-flag
Thread-Index: AQHR5jwribYpp9TT4U2VpvorrY4uuqAzrHYQ
Date: Mon, 1 Aug 2016 06:19:05 +0000
Message-ID: <D56C992E15F8814CADE76D2D1AABFF603E43E242@vaderu05.vaillant.vhgroup.lan>
References: <1469427417-45044-1-git-send-email-sven.ebenfeld@vaillant-group.com>
In-Reply-To: <1469427417-45044-1-git-send-email-sven.ebenfeld@vaillant-group.com>
Accept-Language: de-DE, en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [10.107.185.224]
x-olx-disclaimer: Done
MIME-Version: 1.0
Subject: Re: [meta-java][PATCH v3] openjdk-8: ignore wrong GCCVERSION-flag
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
X-List-Received-Date: Mon, 01 Aug 2016 06:19:12 -0000
X-Groupsio-MsgNum: 62400
Content-Language: de-DE
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=2.16.840.1.101.3.4.2.1;
	boundary="----=_NextPart_000_0005_01D1EBCD.5D8EAEB0"

------=_NextPart_000_0005_01D1EBCD.5D8EAEB0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

What is about this patch?
I see it's archived but not merged. My builds of the fido branch are failing
without this patch.

Best Regards,

Sven Ebenfeld
IRE-S CoC Connectivity & Controls - Technology Advisor Network Technologies
& Security
Vaillant


-----Original Message-----
From: Sven Ebenfeld [mailto:sven.ebenfeld@vaillant-group.com] 
Sent: Monday, July 25, 2016 8:17 AM
To: openembedded-devel@lists.openembedded.org
Cc: Ebenfeld, Sven <sven.ebenfeld@vaillant-group.com>
Subject: [meta-java][PATCH v3] openjdk-8: ignore wrong GCCVERSION-flag

During my recipe parsing, GCCVERSION in the cross case seems to be 'l' this
leads to a ValueError during recipe parsing. Therefore check type before
trying to parse the version flag.

Signed-off-by: Sven Ebenfeld <sven.ebenfeld@vaillant-group.com>
---
 recipes-core/openjdk/openjdk-8-common.inc | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/recipes-core/openjdk/openjdk-8-common.inc
b/recipes-core/openjdk/openjdk-8-common.inc
index 7ad802a..c2f9eb4 100644
--- a/recipes-core/openjdk/openjdk-8-common.inc
+++ b/recipes-core/openjdk/openjdk-8-common.inc
@@ -271,8 +271,10 @@ def version_specific_cflags(d):
         # doesn't work anyway.
         version = d.getVar('GCCVERSION', expand=True)[0]
 
-    extraflags = d.getVar('FLAGS_GCC%d' % int(version), True) or ''
-    return extraflags
+    if version.isdigit():
+        extraflags = d.getVar('FLAGS_GCC%d' % int(version), True) or ''
+        return extraflags
+    return ''
 
 CFLAGS_append = " ${@version_specific_cflags(d)}"
 CXXFLAGS_append = " ${@version_specific_cflags(d)}"
--
1.9.1


------=_NextPart_000_0005_01D1EBCD.5D8EAEB0
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"

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
vH3w6cbRleR6dp6c7deKvOAk9CWDuSZ6bij5dUOXdtsZGMLxC8eNqZOFzvabAhNTM07XRbE5T7kM
CtRSpcfl1fF01+fKM/ri5COn/OD2aT45Z6gKaNgen+N00BnAGceun0/LSWsa8WizqyCpieBRVbZR
51FMlFsfJNEXTRCt2wf3Kx+g5UJ0IjJnqhepEY4A/y5lxmAloREtsjrnIN94ca+/Eiyj6WQjxwID
AQABo4IBvTCCAbkwRgYDVR0RBD8wPYEgc3Zlbi5lYmVuZmVsZEB2YWlsbGFudC1ncm91cC5jb22B
GXN2ZW4uZWJlbmZlbGRAdmFpbGxhbnQuZGUwXgYDVR0gBFcwVTBTBgorBgEEAYLKXAEBMEUwQwYI
KwYBBQUHAgEWN2h0dHA6Ly9wa2kudmFpbGxhbnQtZ3JvdXAuY29tL21haWxwb2xpY3kvc21pbWVf
Y3BzLmh0bWwwTgYDVR0fBEcwRTBDoEGgP4Y9aHR0cDovL3BraS52YWlsbGFudC1ncm91cC5jb20v
Y3JsL1ZhaWxsYW50IEdyb3VwIFNNSU1FIENBLmNybDAOBgNVHQ8BAf8EBAMCBPAwEwYDVR0lBAww
CgYIKwYBBQUHAwQwWgYIKwYBBQUHAQEETjBMMEoGCCsGAQUFBzAChj5odHRwOi8vcGtpLnZhaWxs
YW50LWdyb3VwLmNvbS9jZXJ0L1ZhaWxsYW50IEdyb3VwIFNNSU1FIENBLmNydDAfBgNVHSMEGDAW
gBT7kRP7qFvkKaNenG2slKp0j0rhfjAdBgNVHQ4EFgQUKh68IBVaZBPgy0HRnVsRdhST5F8wDQYJ
KoZIhvcNAQEFBQADggIBAENxwKe4nIhR10wwZUZOHL9bJW02rW0wsNMkhYBTb0fRecVQfnnO5CSv
LI35JpBYzjcGYZAJEe7hPKsCgUroaC5kWW5Et0Jdvzw/yI7Fc3Tkg/kLllK5I9wolFs4L+cOswkX
CAKLExFHw2frk8LXqBdyxVZUg2+yCWASgIwSs5sRt+w64I/qC2oszrZjBXHGicp+vSW0nqe18H/d
UW+DTeBHLPxznrSGY8eCZtIQ9q5jLQxD8qKXJ2u+DEhpj9PXuGHctbja/ZKiOUJ6+lJdje3VacF8
ng3Hl6WjIMgKWimBoc/pv9dZqM2Hcbq1QEIXlCS7BxrkUM/4cs8kD0jPFWF4x7DMIq1vRzV3F/3w
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
AA==

------=_NextPart_000_0005_01D1EBCD.5D8EAEB0--
