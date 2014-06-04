Return-Path: <nick.lewis@usa.g4s.com>
Received: from mail1.bemta14.messagelabs.com (mail1.bemta14.messagelabs.com
	[193.109.254.110])
	by mail.openembedded.org (Postfix) with ESMTP id A7F696B7A6
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Jun 2014 16:47:58 +0000 (UTC)
Received: from [85.158.140.195:4908] by server-6.bemta-14.messagelabs.com id
	63/92-13066-EBD4F835; Wed, 04 Jun 2014 16:47:58 +0000
X-Env-Sender: nick.lewis@usa.g4s.com
X-Msg-Ref: server-6.tower-193.messagelabs.com!1401900477!17069219!1
X-Originating-IP: [89.206.228.155]
X-StarScan-Received: 
X-StarScan-Version: 6.11.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10093 invoked from network); 4 Jun 2014 16:47:58 -0000
Received: from unallocated.star.net.uk (HELO gbtwk10s038.Technology.local)
	(89.206.228.155)
	by server-6.tower-193.messagelabs.com with RC4-SHA encrypted SMTP;
	4 Jun 2014 16:47:58 -0000
Received: from GBTWK10E001.Technology.local ([10.234.1.29]) by
	gbtwk10s038.Technology.local ([10.234.1.40]) with mapi; Wed, 4 Jun 2014
	17:47:57 +0100
From: "Lewis, Nick" <nick.lewis@usa.g4s.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Wed, 4 Jun 2014 17:47:35 +0100
Thread-Topic: [oe] Fix for libxml++_ptest.patch with out-of-source build
Thread-Index: Ac9pK4mbW4sFdOQsQFSIp5+yt9wqjgAI8dsAACW+3fAEgpfNAAEG64AA
Message-ID: <AAE0766F5AF36B46BAB7E0EFB927320633FFF45D82@GBTWK10E001.Technology.local>
References: <AAE0766F5AF36B46BAB7E0EFB92732063397EB4BC0@GBTWK10E001.Technology.local>
	<2c12c9ff705a424c99db08f7cfa57c0a@BL2PR04MB852.namprd04.prod.outlook.com>
	<AAE0766F5AF36B46BAB7E0EFB92732063397EB4BC6@GBTWK10E001.Technology.local>
	<cd2e157cc4a741518317749d2f11a4ed@BL2PR04MB852.namprd04.prod.outlook.com>
In-Reply-To: <cd2e157cc4a741518317749d2f11a4ed@BL2PR04MB852.namprd04.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: Fix for libxml++_ptest.patch with out-of-source build
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
X-List-Received-Date: Wed, 04 Jun 2014 16:48:05 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

>It still does not apply
>
>see http://patchwork.openembedded.org/patch/72639/

Martin

Given the problems submitting a patch from my mail client would it be possi=
ble please to make a manual edit

s|cp --parents $(dist_noinst_DATA) $(DESTDIR)/examples|cd $(srcdir) && cp -=
-parents $(dist_noinst_DATA) $(DESTDIR)/examples

(not as in patch 72639) and

s|cp ../macros/test-driver $(DESTDIR)/macros|cp $(srcdir)/../macros/test-dr=
iver $(DESTDIR)/macros

(as per patch 72639)
--
Nick

The details of this company are as follows:
G4S Technology Limited, Registered Office: Challenge House, International D=
rive, Tewkesbury, Gloucestershire GL20 8UQ, Registered in England No. 23823=
38.

This communication may contain information which is confidential, personal =
and/or privileged.

It is for the exclusive use of the intended recipient(s).
If you are not the intended recipient(s), please note that any distribution=
, forwarding, copying or use of this communication or the information in it=
 is strictly prohibited.

Any personal views expressed in this e-mail are those of the individual sen=
der and the company does not endorse or accept responsibility for them.

Prior to taking any action based upon this e-mail message, you should seek =
appropriate confirmation of its authenticity.

This e-mail has been scanned for all viruses by MessageLabs.

