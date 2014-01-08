Return-Path: <nick.lewis@usa.g4s.com>
Received: from mail1.bemta3.messagelabs.com (mail1.bemta3.messagelabs.com
	[195.245.230.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6B4E76CDF2
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Jan 2014 09:04:02 +0000 (UTC)
Received: from [85.158.137.19:63906] by server-1.bemta-3.messagelabs.com id
	26/F2-29598-0841DC25; Wed, 08 Jan 2014 09:04:00 +0000
X-Env-Sender: nick.lewis@usa.g4s.com
X-Msg-Ref: server-2.tower-39.messagelabs.com!1389171839!15323975!1
X-Originating-IP: [89.206.228.155]
X-StarScan-Received: 
X-StarScan-Version: 6.9.16; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27397 invoked from network); 8 Jan 2014 09:04:00 -0000
Received: from unallocated.star.net.uk (HELO gbtwk10s038.Technology.local)
	(89.206.228.155)
	by server-2.tower-39.messagelabs.com with RC4-SHA encrypted SMTP;
	8 Jan 2014 09:04:00 -0000
Received: from GBTWK10E001.Technology.local ([10.234.1.29]) by
	gbtwk10s038.Technology.local ([10.234.1.40]) with mapi; Wed, 8 Jan 2014
	09:03:59 +0000
From: "Lewis, Nick" <nick.lewis@usa.g4s.com>
To: "'openembedded-devel@lists.openembedded.org'"
	<openembedded-devel@lists.openembedded.org>
Date: Wed, 8 Jan 2014 09:03:58 +0000
Thread-Topic: [oe] Patch to fix libxml++ build failure in meta-oe
Thread-Index: Ac8LpTziiTKmXMa5RaeXmt3kn1/e7wABNILAAClW1vA=
Message-ID: <AAE0766F5AF36B46BAB7E0EFB9273206331489E79E@GBTWK10E001.Technology.local>
References: <AAE0766F5AF36B46BAB7E0EFB9273206331489E795@GBTWK10E001.Technology.local>
	<7aae89dde8c24d33afead65e63bf0225@CH1PRD0410HT005.namprd04.prod.outlook.com>
	<19ea91c55bc945d5b54695d25bcbd2d7@CH1PRD0410HT004.namprd04.prod.outlook.com>
In-Reply-To: <19ea91c55bc945d5b54695d25bcbd2d7@CH1PRD0410HT004.namprd04.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: Patch to fix libxml++ build failure in meta-oe
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
X-List-Received-Date: Wed, 08 Jan 2014 09:04:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

>>> ++      cp Makefile $(DESTDIR)/examples
>>> ++      $(MKDIR_P) $(DESTDIR)/macros
>>> ++      cp ../macros/test-driver $(DESTDIR)/macros
>>> ++      sed -i -e 's|^Makefile:|_Makefile:|' ++$(DESTDIR)/examples/Make=
file
>>
>> These last 4 lines are missing in the patch you have sent as attachement=
, which version is the right one?
>
>The lines "cp ... examples" to "sed ... Makefile" should be present

Sorry - I realise that I misunderstood and misrepresented your question

There appears to have been some line wraps added during the patch generatio=
n that I cannot account for

++      sed -i -e 's|^Makefile:|_Makefile:|'
++$(DESTDIR)/examples/Makefile

should actually be

++      sed -i -e 's|^Makefile:|_Makefile:|' $(DESTDIR)/examples/Makefile

and I guess there may be 3 other instances of this

I will have another go at generating and sending the patch

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

