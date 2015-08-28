Return-Path: <jbriance@cisco.com>
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
	by mail.openembedded.org (Postfix) with ESMTP id B8CE271633
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Aug 2015 12:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=27450; q=dns/txt;
	s=iport; t=1440765942; x=1441975542;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=ZOVR5XhXNmLcZhxcVsNrVfWARr2iO2tabH/CNymdD30=;
	b=LSg/7GN/fxUZAbb2KcN4FEplMHOvKG+Y1u5+8w7CyUyv3HvXS3AFN+li
	iDGGFgFJhcN0CufejclXvVZ8Rjmnm+rTFf7tUmFnm+6JimvSZj9OcE/SJ
	N+g5HcfS7S6zghCEqNCqTyoGtEgSkZbTSok2TIFepmTSdC8vJYPf1bV96 s=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: A0A1DgCoV+BV/4QNJK1egxtUaQaqTZUlgkuDOAJHczsRAQEBAQEBAX8LhCQBAQQaID8OAgIBKhQQFhwlAgQKBAUIiCbEJwEBAQEBAQEBAQEBAQEBAQEBAQEBARcEhmmJJygxB4MYgRQFhycDhm6HJQGFBYJtgk+DexWQUIg0JoIPARuBVHGBBQQ/gQUBAQE
X-IronPort-AV: E=Sophos;i="5.17,424,1437436800"; d="scan'208";a="182864913"
Received: from alln-core-10.cisco.com ([173.36.13.132])
	by alln-iport-6.cisco.com with ESMTP; 28 Aug 2015 12:45:37 +0000
Received: from XCH-RCD-009.cisco.com (xch-rcd-009.cisco.com [173.37.102.19])
	by alln-core-10.cisco.com (8.14.5/8.14.5) with ESMTP id t7SCjbwo007640
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Aug 2015 12:45:37 GMT
Received: from xch-rcd-009.cisco.com (173.37.102.19) by XCH-RCD-009.cisco.com
	(173.37.102.19) with Microsoft SMTP Server (TLS) id 15.0.1104.5;
	Fri, 28 Aug 2015 07:45:36 -0500
Received: from xhc-rcd-x05.cisco.com (173.37.183.79) by xch-rcd-009.cisco.com
	(173.37.102.19) with Microsoft SMTP Server (TLS) id 15.0.1104.5 via
	Frontend Transport; Fri, 28 Aug 2015 07:45:36 -0500
Received: from xmb-aln-x12.cisco.com ([169.254.7.226]) by
	xhc-rcd-x05.cisco.com ([173.37.183.79]) with mapi id 14.03.0248.002;
	Fri, 28 Aug 2015 07:45:36 -0500
From: "Julien Brianceau (jbriance)" <jbriance@cisco.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-qt5][PATCH] qt3d: Remove GFDL-1.3 & DIGIA-TPLA-2.4 from
	LICENSE list
Thread-Index: AQHQ4Y72wVGZi8/ObkCUv5zQkmZiT54hW3bA
Date: Fri, 28 Aug 2015 12:45:35 +0000
Message-ID: <5940D1D9F240BA44AEF939055CF1358D05A51EEE@xmb-aln-x12.cisco.com>
References: <1440765725-2377-1-git-send-email-jbriance@cisco.com>
In-Reply-To: <1440765725-2377-1-git-send-email-jbriance@cisco.com>
Accept-Language: fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.60.62.125]
MIME-Version: 1.0
Subject: [meta-qt5][PATCH] qt3d: Remove GFDL-1.3 & DIGIA-TPLA-2.4 from LICENSE list
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
X-List-Received-Date: Fri, 28 Aug 2015 12:45:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

* qt3d is not a technical preview anymore since 5.5
* Take the opportunity to update TPLA license, using
  LICENSE.PREVIEW.COMMERCIAL file from qtbase

Signed-off-by: Julien Brianceau <jbriance@cisco.com>
---
 .../{DIGIA-TPLA-2.4 =3D> The-Qt-Company-TPLA-2.4}    | 226 +++++++++++----=
------
 recipes-qt/qt5/qt3d_git.bb                         |   2 +-
 2 files changed, 115 insertions(+), 113 deletions(-)
 rename licenses/{DIGIA-TPLA-2.4 =3D> The-Qt-Company-TPLA-2.4} (75%)

diff --git a/licenses/DIGIA-TPLA-2.4 b/licenses/The-Qt-Company-TPLA-2.4
similarity index 75%
rename from licenses/DIGIA-TPLA-2.4
rename to licenses/The-Qt-Company-TPLA-2.4
index c71a330..0f96e73 100644
--- a/licenses/DIGIA-TPLA-2.4
+++ b/licenses/The-Qt-Company-TPLA-2.4
@@ -14,9 +14,9 @@ TECHNOLOGY PREVIEW LICENSE AGREEMENT: The Americas
 Agreement version 2.4
=20
 This Technology Preview License Agreement ("Agreement")is a legal agreemen=
t
-between Digia USA, Inc. ("Digia"), with its registered office at 32 W.
-Loockerman Street, Suite 201, City of Dover, County of Kent, Delaware 1990=
4,
-U.S.A. and you (either an individual or a legal entity) ("Licensee")
+between The Qt Company USA, Inc. ("The Qt Company"), with its registered
+office at 2350 Mission College Blvd., Suite 1020, Santa Clara, California
+95054, U.S.A. and you (either an individual or a legal entity) ("Licensee"=
)
 for the Licensed Software (as defined below).
=20
 1. DEFINITIONS
@@ -35,16 +35,16 @@ Licensed Software which may include portions of the Lic=
ensed Software.
=20
 "Term" shall mean the period of time six (6) months from the later of
 (a) the Effective Date; or (b) the date the Licensed Software was
-initially delivered to Licensee by Digia. If no specific Effective Date
-is set forth in the Agreement, the Effective Date shall be deemed to be
+initially delivered to Licensee by The Qt Company. If no specific Effectiv=
e
+Date is set forth in the Agreement, the Effective Date shall be deemed to =
be
 the date the Licensed Software was initially delivered to Licensee.
=20
 "Licensed Software" shall mean the computer software, "online" or
 electronic documentation, associated media and printed materials,
 including the source code, example programs and the documentation
-delivered by Digia to Licensee in conjunction with this Agreement.
+delivered by The Qt Company to Licensee in conjunction with this Agreement=
.
=20
-"Party" or "Parties" shall mean Licensee and/or Digia.
+"Party" or "Parties" shall mean Licensee and/or The Qt Company.
=20
=20
 2. OWNERSHIP
@@ -54,18 +54,18 @@ copyright treaties, as well as other intellectual prope=
rty laws and
 treaties. The Licensed Software is licensed, not sold.
=20
 If Licensee provides any findings, proposals, suggestions or other
-feedback ("Feedback") to Digia regarding the Licensed Software, Digia
-shall own all right, title and interest including the intellectual
-property rights in and to such Feedback, excluding however any existing
-patent rights of Licensee. To the extent Licensee owns or controls any
-patents for such Feedback Licensee hereby grants to Digia and its
+feedback ("Feedback") to The Qt Company regarding the Licensed Software,
+The Qt Company shall own all right, title and interest including the
+intellectual property rights in and to such Feedback, excluding however an=
y
+existing patent rights of Licensee. To the extent Licensee owns or control=
s
+any patents for such Feedback Licensee hereby grants to The Qt Company and=
 its
 Affiliates, a worldwide, perpetual, non-transferable, sublicensable,
 royalty-free license to (i) use, copy and modify Feedback and to create
 derivative works thereof, (ii) to make (and have made), use, import,
 sell, offer for sale, lease, dispose, offer for disposal or otherwise
-exploit any products or services of Digia containing Feedback, and
+exploit any products or services of The Qt Company containing Feedback, an=
d
 (iii) sublicense all the foregoing rights to third party licensees and
-customers of Digia and/or its Affiliates.
+customers of The Qt Company and/or its Affiliates.
=20
=20
 3. VALIDITY OF THE AGREEMENT
@@ -74,17 +74,17 @@ By installing, copying, or otherwise using the Licensed=
 Software,
 Licensee agrees to be bound by the terms of this Agreement. If Licensee
 does not agree to the terms of this Agreement, Licensee may not install,
 copy, or otherwise use the Licensed Software. Upon Licensee's acceptance
-of the terms and conditions of this Agreement, Digia grants Licensee the
-right to use the Licensed Software in the manner provided below.
+of the terms and conditions of this Agreement, The Qt Company grants Licen=
see
+the right to use the Licensed Software in the manner provided below.
=20
=20
 4. LICENSES
=20
 4.1. Using and Copying
=20
-Digia grants to Licensee a non-exclusive, non-transferable, time-limited
-license to use and copy the Licensed Software for sole purpose of
-designing, developing and testing Applications, and evaluating and the
+The Qt Company grants to Licensee a non-exclusive, non-transferable,
+time-limited license to use and copy the Licensed Software for sole purpos=
e
+of designing, developing and testing Applications, and evaluating and the
 Licensed Software during the Term.
=20
 Licensee may install copies of the Licensed Software on an unlimited
@@ -100,12 +100,12 @@ copy of it or use the Licensed Software for any purpo=
se that is not
 expressly granted in this Section 4. Licensee may not alter or remove
 any details of ownership, copyright, trademark or other property right
 connected with the Licensed Software. Licensee may not distribute any
-software statically or dynamically linked with the Licensed Software.
+software statically or dynamically linked with the Licensed Software.=20
=20
 4.3 No Technical Support
=20
-Digia has no obligation to furnish Licensee with any technical support
-whatsoever. Any such support is subject to separate agreement between
+The Qt Company has no obligation to furnish Licensee with any technical
+support whatsoever. Any such support is subject to separate agreement betw=
een
 the Parties.
=20
=20
@@ -114,7 +114,7 @@ The Licensed Software contains pre-release code that is=
 not at the level
 of performance and compatibility of a final, generally available,
 product offering. The Licensed Software may not operate correctly and
 may be substantially modified prior to the first commercial product
-release, if any. Digia is not obligated to make this or any later
+release, if any. The Qt Company is not obligated to make this or any later
 version of the Licensed Software commercially available. The License
 Software is "Not for Commercial Use" and may only be used for the
 purposes described in Section 4. The Licensed Software may not be used
@@ -143,8 +143,8 @@ appropriate licensing from such third parties.
 7. LIMITED WARRANTY AND WARRANTY DISCLAIMER
=20
 The Licensed Software is licensed to Licensee "as is". To the maximum
-extent permitted by applicable law, Digia on behalf of itself and its
-suppliers, disclaims all warranties and conditions, either express or
+extent permitted by applicable law, The Qt Company on behalf of itself and
+its suppliers, disclaims all warranties and conditions, either express or
 implied, including, but not limited to, implied warranties of
 merchantability, fitness for a particular purpose, title and
 non-infringement with regard to the Licensed Software.
@@ -152,21 +152,21 @@ non-infringement with regard to the Licensed Software=
.
=20
 8. LIMITATION OF LIABILITY
=20
-If, Digia's warranty disclaimer notwithstanding, Digia is held liable to
-Licensee, whether in contract, tort or any other legal theory, based on
-the Licensed Software, Digia's entire liability to Licensee and
-Licensee's exclusive remedy shall be, at Digia's option, either (A)
-return of the price Licensee paid for the Licensed Software, or (B)
+If, The Qt Company's warranty disclaimer notwithstanding, The Qt Company i=
s
+held liable to Licensee, whether in contract, tort or any other legal theo=
ry,
+based on the Licensed Software, The Qt Company's entire liability to Licen=
see
+and Licensee's exclusive remedy shall be, at The Qt Company's option, eith=
er
+(A) return of the price Licensee paid for the Licensed Software, or (B)
 repair or replacement of the Licensed Software, provided Licensee
-returns to Digia all copies of the Licensed Software as originally
-delivered to Licensee. Digia shall not under any circumstances be liable
-to Licensee based on failure of the Licensed Software if the failure
-resulted from accident, abuse or misapplication, nor shall Digia under
-any circumstances be liable for special damages, punitive or exemplary
+returns to The Qt Company all copies of the Licensed Software as originall=
y
+delivered to Licensee. The Qt Company shall not under any circumstances be
+liable to Licensee based on failure of the Licensed Software if the failur=
e
+resulted from accident, abuse or misapplication, nor shall The Qt Company
+under any circumstances be liable for special damages, punitive or exempla=
ry
 damages, damages for loss of profits or interruption of business or for
-loss or corruption of data. Any award of damages from Digia to Licensee
-shall not exceed the total amount Licensee has paid to Digia in
-connection with this Agreement.
+loss or corruption of data. Any award of damages from The Qt Company to
+Licensee shall not exceed the total amount Licensee has paid to The Qt
+Company in connection with this Agreement.
=20
=20
 9.  CONFIDENTIALITY
@@ -212,7 +212,7 @@ by all legally available means.
 The obligations of the Receiving Party under this Section shall continue
 during the Initial Term and for a period of five (5) years after
 expiration or termination of this Agreement. To the extent that the
-terms of the Non-Disclosure Agreement between Digia and Licensee
+terms of the Non-Disclosure Agreement between The Qt Company and Licensee
 conflict with the terms of this Section 9, this Section 9 shall be
 controlling over the terms of the Non-Disclosure Agreement.
=20
@@ -223,18 +223,19 @@ controlling over the terms of the Non-Disclosure Agre=
ement.
=20
 Licensee shall not be entitled to assign or transfer all or any of its
 rights, benefits and obligations under this Agreement without the prior
-written consent of Digia, which shall not be unreasonably withheld.
+written consent of The Qt Company, which shall not be unreasonably withhel=
d.
=20
 10.2    Termination
=20
-Digia may terminate the Agreement at any time immediately upon written
-notice by Digia to Licensee if Licensee breaches this Agreement.
+The Qt Company may terminate the Agreement at any time immediately upon
+written notice by The Qt Company to Licensee if Licensee breaches this
+Agreement.
=20
-Upon termination of this Agreement, Licensee shall return to Digia all
-copies of Licensed Software that were supplied by Digia. All other
-copies of Licensed Software in the possession or control of Licensee
+Upon termination of this Agreement, Licensee shall return to The Qt Compan=
y
+all copies of Licensed Software that were supplied by The Qt Company. All
+other copies of Licensed Software in the possession or control of Licensee
 must be erased or destroyed. An officer of Licensee must promptly
-deliver to Digia a written confirmation that this has occurred.
+deliver to The Qt Company a written confirmation that this has occurred.
=20
 10.3    Surviving Sections
=20
@@ -255,12 +256,12 @@ Agreement ("Non-Disclosure Agreement"), if any, shall=
 be subject to
 Section 9. No modification of this Agreement shall be effective unless
 contained in a writing executed by an authorized representative of each
 party. No term or condition contained in Licensee's purchase order shall
-apply unless expressly accepted by Digia in writing. If any provision of
-the Agreement is found void or unenforceable, the remainder shall remain
-valid and enforceable according to its terms. If any remedy provided is
-determined to have failed for its essential purpose, all limitations of
-liability and exclusions of damages set forth in this Agreement shall
-remain in effect.
+apply unless expressly accepted by The Qt Company in writing. If any
+provision of the Agreement is found void or unenforceable, the remainder
+shall remain valid and enforceable according to its terms. If any remedy
+provided is determined to have failed for its essential purpose, all
+limitations of liability and exclusions of damages set forth in this
+Agreement shall remain in effect.
=20
 10.5    Export Control
=20
@@ -301,9 +302,9 @@ infringement, whether or not such action relates to thi=
s Agreement.
=20
 There are no implied licenses or other implied rights granted under this
 Agreement, and all rights, save for those expressly granted hereunder,
-shall remain with Digia and its licensors. In addition, no licenses or
-immunities are granted to the combination of the Licensed Software with
-any other software or hardware not delivered by Digia under this
+shall remain with The Qt Company and its licensors. In addition, no licens=
es
+or immunities are granted to the combination of the Licensed Software with
+any other software or hardware not delivered by The Qt Company under this
 Agreement.
=20
 10.8    Government End Users
@@ -329,9 +330,9 @@ TECHNOLOGY PREVIEW LICENSE AGREEMENT: Rest of the World
 Agreement version 2.4
=20
 This Technology Preview License Agreement ("Agreement") is a legal
-agreement between Digia Finland Ltd ("Digia"), with its registered office =
at
-Valimotie 21,FI-00380 Helsinki, Finland and you (either an individual or a
-legal entity) ("Licensee") for the Licensed Software.
+agreement between The Qt Company Ltd ("The Qt Company"), with its register=
ed
+office at Valimotie 21,FI-00380 Helsinki, Finland and you (either an
+individual or a legal entity) ("Licensee") for the Licensed Software.
=20
 1. DEFINITIONS
=20
@@ -349,16 +350,16 @@ Licensed Software which may include portions of the L=
icensed Software.
=20
 "Term" shall mean the period of time six (6) months from the later of
 (a) the Effective Date; or (b) the date the Licensed Software was
-initially delivered to Licensee by Digia. If no specific Effective Date
-is set forth in the Agreement, the Effective Date shall be deemed to be
+initially delivered to Licensee by The Qt Company. If no specific Effectiv=
e
+Date is set forth in the Agreement, the Effective Date shall be deemed to =
be
 the date the Licensed Software was initially delivered to Licensee.
=20
 "Licensed Software" shall mean the computer software, "online" or
 electronic documentation, associated media and printed materials,
 including the source code, example programs and the documentation
-delivered by Digia to Licensee in conjunction with this Agreement.
+delivered by The Qt Company to Licensee in conjunction with this Agreement=
.
=20
-"Party" or "Parties" shall mean Licensee and/or Digia.
+"Party" or "Parties" shall mean Licensee and/or The Qt Company.
=20
=20
 2. OWNERSHIP
@@ -368,18 +369,18 @@ copyright treaties, as well as other intellectual pro=
perty laws and
 treaties. The Licensed Software is licensed, not sold.
=20
 If Licensee provides any findings, proposals, suggestions or other
-feedback ("Feedback") to Digia regarding the Licensed Software, Digia
-shall own all right, title and interest including the intellectual
-property rights in and to such Feedback, excluding however any existing
-patent rights of Licensee. To the extent Licensee owns or controls any
-patents for such Feedback Licensee hereby grants to Digia and its
-Affiliates, a worldwide, perpetual, non-transferable, sublicensable,
+feedback ("Feedback") to The Qt Company regarding the Licensed Software,
+The Qt Companyshall own all right, title and interest including the
+intellectual property rights in and to such Feedback, excluding however an=
y
+existing patent rights of Licensee. To the extent Licensee owns or control=
s
+any patents for such Feedback Licensee hereby grants to The Qt Company and
+its Affiliates, a worldwide, perpetual, non-transferable, sublicensable,
 royalty-free license to (i) use, copy and modify Feedback and to create
 derivative works thereof, (ii) to make (and have made), use, import,
 sell, offer for sale, lease, dispose, offer for disposal or otherwise
-exploit any products or services of Digia containing Feedback, and
+exploit any products or services of The Qt Company containing Feedback, an=
d
 (iii) sublicense all the foregoing rights to third party licensees and
-customers of Digia and/or its Affiliates.
+customers of The Qt Company and/or its Affiliates.
=20
 3. VALIDITY OF THE AGREEMENT
=20
@@ -387,17 +388,17 @@ By installing, copying, or otherwise using the Licens=
ed Software,
 Licensee agrees to be bound by the terms of this Agreement. If Licensee
 does not agree to the terms of this Agreement, Licensee may not install,
 copy, or otherwise use the Licensed Software. Upon Licensee's acceptance
-of the terms and conditions of this Agreement, Digia grants Licensee the
-right to use the Licensed Software in the manner provided below.
+of the terms and conditions of this Agreement, The Qt Company grants Licen=
see
+the right to use the Licensed Software in the manner provided below.
=20
=20
 4. LICENSES
=20
 4.1. Using and Copying
=20
-Digia grants to Licensee a non-exclusive, non-transferable, time-limited
-license to use and copy the Licensed Software for sole purpose of
-designing, developing and testing Applications, and evaluating and the
+The Qt Company grants to Licensee a non-exclusive, non-transferable,
+time-limited license to use and copy the Licensed Software for sole purpos=
e
+of designing, developing and testing Applications, and evaluating and the
 Licensed Software during the Term.
=20
 Licensee may install copies of the Licensed Software on an unlimited
@@ -405,7 +406,7 @@ number of computers provided that (a) if an individual,=
 only such
 individual; or (b) if a legal entity only its employees; use the
 Licensed Software for the authorized purposes.
=20
-4.2 No Distribution or Modifications
+4.2	No Distribution or Modifications
=20
 Licensee may not disclose, modify, sell, market, commercialise,
 distribute, loan, rent, lease, or license the Licensed Software or any
@@ -417,9 +418,9 @@ software statically or dynamically linked with the Lice=
nsed Software.
=20
 4.3 No Technical Support
=20
-Digia has no obligation to furnish Licensee with any technical support
-whatsoever. Any such support is subject to separate agreement between
-the Parties.
+The Qt Company has no obligation to furnish Licensee with any technical
+support whatsoever. Any such support is subject to separate agreement
+between the Parties.
=20
=20
 5. PRE-RELEASE CODE
@@ -428,7 +429,7 @@ The Licensed Software contains pre-release code that is=
 not at the level
 of performance and compatibility of a final, generally available,
 product offering. The Licensed Software may not operate correctly and
 may be substantially modified prior to the first commercial product
-release, if any. Digia is not obligated to make this or any later
+release, if any. The Qt Company is not obligated to make this or any later
 version of the Licensed Software commercially available. The License
 Software is "Not for Commercial Use" and may only be used for the
 purposes described in Section 4. The Licensed Software may not be used
@@ -457,8 +458,8 @@ appropriate licensing from such third parties.
 7. LIMITED WARRANTY AND WARRANTY DISCLAIMER
=20
 The Licensed Software is licensed to Licensee "as is". To the maximum
-extent permitted by applicable law, Digia on behalf of itself and its
-suppliers, disclaims all warranties and conditions, either express or
+extent permitted by applicable law, The Qt Company on behalf of itself and
+its suppliers, disclaims all warranties and conditions, either express or
 implied, including, but not limited to, implied warranties of
 merchantability, fitness for a particular purpose, title and
 non-infringement with regard to the Licensed Software.
@@ -466,24 +467,24 @@ non-infringement with regard to the Licensed Software=
.
=20
 8. LIMITATION OF LIABILITY
=20
-If, Digia's warranty disclaimer notwithstanding, Digia is held liable to
-Licensee, whether in contract, tort or any other legal theory, based on
-the Licensed Software, Digia's entire liability to Licensee and
-Licensee's exclusive remedy shall be, at Digia's option, either (A)
-return of the price Licensee paid for the Licensed Software, or (B)
+If, The Qt Company's warranty disclaimer notwithstanding, The Qt Company i=
s
+held liable to Licensee, whether in contract, tort or any other legal theo=
ry,
+based on the Licensed Software, The Qt Company's entire liability to Licen=
see
+and Licensee's exclusive remedy shall be, at The Qt Company's option, eith=
er
+(A) return of the price Licensee paid for the Licensed Software, or (B)
 repair or replacement of the Licensed Software, provided Licensee
-returns to Digia all copies of the Licensed Software as originally
-delivered to Licensee. Digia shall not under any circumstances be liable
-to Licensee based on failure of the Licensed Software if the failure
-resulted from accident, abuse or misapplication, nor shall Digia under
-any circumstances be liable for special damages, punitive or exemplary
+returns to The Qt Company all copies of the Licensed Software as originall=
y
+delivered to Licensee. The Qt Company shall not under any circumstances be
+liable to Licensee based on failure of the Licensed Software if the failur=
e
+resulted from accident, abuse or misapplication, nor shall The Qt Company
+under any circumstances be liable for special damages, punitive or exempla=
ry
 damages, damages for loss of profits or interruption of business or for
-loss or corruption of data. Any award of damages from Digia to Licensee
-shall not exceed the total amount Licensee has paid to Digia in
-connection with this Agreement.
+loss or corruption of data. Any award of damages from The Qt Company to
+Licensee shall not exceed the total amount Licensee has paid to
+The Qt Company in connection with this Agreement.
=20
=20
-9.  CONFIDENTIALITY
+9.	CONFIDENTIALITY
=20
 Each party acknowledges that during the Term of this Agreement it shall
 have access to information about the other party's business, business
@@ -526,29 +527,30 @@ by all legally available means.
 The obligations of the Receiving Party under this Section shall continue
 during the Initial Term and for a period of five (5) years after
 expiration or termination of this Agreement. To the extent that the
-terms of the Non-Disclosure Agreement between Digia and Licensee
+terms of the Non-Disclosure Agreement between The Qt Company and Licensee
 conflict with the terms of this Section 9, this Section 9 shall be
 controlling over the terms of the Non-Disclosure Agreement.
=20
=20
 10. GENERAL PROVISIONS
=20
-10.1    No Assignment
+10.1	No Assignment
=20
 Licensee shall not be entitled to assign or transfer all or any of its
 rights, benefits and obligations under this Agreement without the prior
-written consent of Digia, which shall not be unreasonably withheld.
+written consent of The Qt Company, which shall not be unreasonably withhel=
d.
=20
-10.2    Termination
+10.2 	Termination
=20
-Digia may terminate the Agreement at any time immediately upon written
-notice by Digia to Licensee if Licensee breaches this Agreement.
+The Qt Company may terminate the Agreement at any time immediately upon
+written notice by The Qt Company to Licensee if Licensee breaches this
+Agreement.
=20
-Upon termination of this Agreement, Licensee shall return to Digia all
-copies of Licensed Software that were supplied by Digia. All other
-copies of Licensed Software in the possession or control of Licensee
+Upon termination of this Agreement, Licensee shall return to The Qt Compan=
y
+all copies of Licensed Software that were supplied by The Qt Company. All
+other copies of Licensed Software in the possession or control of Licensee
 must be erased or destroyed. An officer of Licensee must promptly
-deliver to Digia a written confirmation that this has occurred.
+deliver to The Qt Company a written confirmation that this has occurred.
=20
 10.3    Surviving Sections
=20
@@ -556,7 +558,7 @@ Any terms and conditions that by their nature or otherw=
ise reasonably
 should survive a cancellation or termination of this Agreement shall
 also be deemed to survive. Such terms and conditions include, but are
 not limited to the following Sections: 2, 5, 6, 7, 8, 9, 10.2, 10.3, 10.4,
-10.5, 10.6, 10.7, and 10.8 of this Agreement.
+10.5, 10.6, 10.7, and 10.8 of this Agreement.=20
=20
 10.4    Entire Agreement
=20
@@ -569,8 +571,8 @@ Agreement ("Non-Disclosure Agreement"), if any, shall b=
e subject to
 Section 9. No modification of this Agreement shall be effective unless
 contained in a writing executed by an authorized representative of each
 party. No term or condition contained in Licensee's purchase order shall
-apply unless expressly accepted by Digia in writing. If any provision of
-the Agreement is found void or unenforceable, the remainder shall remain
+apply unless expressly accepted by The Qt Company in writing. If any provi=
sion
+of the Agreement is found void or unenforceable, the remainder shall remai=
n
 valid and enforceable according to its terms. If any remedy provided is
 determined to have failed for its essential purpose, all limitations of
 liability and exclusions of damages set forth in this Agreement shall
@@ -603,9 +605,9 @@ process shall be conducted in the English language.
=20
 There are no implied licenses or other implied rights granted under this
 Agreement, and all rights, save for those expressly granted hereunder,
-shall remain with Digia and its licensors. In addition, no licenses or
-immunities are granted to the combination of the Licensed Software with
-any other software or hardware not delivered by Digia under this
+shall remain with The Qt Company and its licensors. In addition, no licens=
es
+or immunities are granted to the combination of the Licensed Software with
+any other software or hardware not delivered by The Qt Company under this
 Agreement.
=20
 10.8    Government End Users
diff --git a/recipes-qt/qt5/qt3d_git.bb b/recipes-qt/qt5/qt3d_git.bb
index 7f61271..70c053e 100644
--- a/recipes-qt/qt5/qt3d_git.bb
+++ b/recipes-qt/qt5/qt3d_git.bb
@@ -1,7 +1,7 @@
 require qt5.inc
 require qt5-git.inc
=20
-LICENSE =3D "GFDL-1.3 & LGPL-3.0 & DIGIA-TPLA-2.4 | GPL-2.0"
+LICENSE =3D "LGPL-3.0 | GPL-2.0"
 LIC_FILES_CHKSUM =3D " \
     file://LICENSE.LGPLv3;md5=3De6a600fd5e1d9cbde2d983680233ad02 \
     file://LICENSE.GPL;md5=3D05832301944453ec79e40ba3c3cfceec\
--=20
1.9.5


