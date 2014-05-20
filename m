Return-Path: <nick.lewis@usa.g4s.com>
X-Greylist: delayed 390 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 20 May 2014 10:16:54 UTC
Received: from mail1.bemta3.messagelabs.com (unknown [195.245.230.176])
	by mail.openembedded.org (Postfix) with ESMTP id 2DCC665F1E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 May 2014 10:16:54 +0000 (UTC)
Received: from [85.158.137.3:38863] by server-16.bemta-3.messagelabs.com id
	99/09-13481-01A2B735; Tue, 20 May 2014 10:10:24 +0000
X-Env-Sender: nick.lewis@usa.g4s.com
X-Msg-Ref: server-11.tower-38.messagelabs.com!1400580541!4042703!1
X-Originating-IP: [89.206.228.155]
X-StarScan-Received: 
X-StarScan-Version: 6.11.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4371 invoked from network); 20 May 2014 10:09:01 -0000
Received: from unallocated.star.net.uk (HELO gbtwk10s038.Technology.local)
	(89.206.228.155)
	by server-11.tower-38.messagelabs.com with RC4-SHA encrypted SMTP;
	20 May 2014 10:09:01 -0000
Received: from GBTWK10E001.Technology.local ([10.234.1.29]) by
	gbtwk10s038.Technology.local ([10.234.1.40]) with mapi; Tue, 20 May 2014
	11:09:00 +0100
From: "Lewis, Nick" <nick.lewis@usa.g4s.com>
To: OpenEmbedded Developer Mailing List
	<openembedded-devel@lists.openembedded.org>
Date: Tue, 20 May 2014 11:09:00 +0100
Thread-Topic: [oe] [poky]: libusb1_1.0.18.bb: configure: error: "udev
	support	requested but libudev not installed"
Thread-Index: AQHPcZ3Z7EEv54LSrEavlmWAQEXIa5tJQfzQ
Message-ID: <AAE0766F5AF36B46BAB7E0EFB927320633FFF45D6A@GBTWK10E001.Technology.local>
References: <5d1edcab304d4fbb8e6349d49bb62e98@BL2PR04MB852.namprd04.prod.outlook.com>
In-Reply-To: <5d1edcab304d4fbb8e6349d49bb62e98@BL2PR04MB852.namprd04.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [poky]: libusb1_1.0.18.bb: configure: error: "udev support	requested but libudev not installed"
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
X-List-Received-Date: Tue, 20 May 2014 10:17:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

>configure: error: "udev support requested but libudev not installed"

We are seeing the same problem.
This may be because the patch "libusb1: disable floating dependency on udev=
" has not been committed.
May I please request this is done soon as our autobuilder has been broken f=
or 4 nights now

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

