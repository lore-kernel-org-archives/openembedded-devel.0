Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1NmrVs-0000Nw-4H
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Mar 2010 17:33:32 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1NmrT5-0003XH-TA from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Mar 2010 08:30:39 -0800
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Wed, 3 Mar 2010 08:30:39 -0800
Received: from 172.30.80.138 ([172.30.80.138]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Wed,  3 Mar 2010 16:30:21 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	03 Mar 2010 09:30:19 -0700
From: Tom Rini <tom_rini@mentor.com>
To: oe-devel <openembedded-devel@lists.openembedded.org>
Organization: Mentor Graphics Corporation
Date: Wed, 03 Mar 2010 09:30:19 -0700
Message-ID: <1267633819.4739.343.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 03 Mar 2010 16:30:39.0309 (UTC)
	FILETIME=[DC3787D0:01CABAEE]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [RFC] Make some big changes right after next stable
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Mar 2010 16:33:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey all,

I'd like to see some comments on the following idea.

As many people know, there's a lot of "odd" internal things that OE
does, that if we had it to do over, we would do differently.  What I
would like to propose is that in time for the next stable branch we:
1: Define a set of DISTROs/MACHINEs/build targets that need to stay
working
2: In a separate branch (per big change), get one of these big, going to
leave some stuff broken changes
3: Define / document what needs to be done before these branches can be
merged back (something like #1 is working still, and if applicable a
guide to the common problems/how to fix people are going to run into).

What I'm getting at is that this would let us do things like rework the
"this is where we place things that we build other recipes with" concept
so that sysroot just works (and otherwise makes more sense again).  Or
"let us have more consistency in build with compared to what could end
up on device".  And so on.

What do people think?  And what would people work on?

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


