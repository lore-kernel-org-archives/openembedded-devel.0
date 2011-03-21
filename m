Received: from mail.eads.net ([80.156.45.113])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wolfgang.Hauser.external@cassidian.com>)
	id 1Q1bAU-00063v-QT for openembedded-devel@lists.openembedded.org;
	Mon, 21 Mar 2011 10:12:54 +0100
Received: from gsx3072-vs5.mxchg.m.corp ([53.147.176.149])
	by mail.eads.net (8.13.8/8.13.8/Debian-2) with ESMTP id p2L9BA9I030580
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Mar 2011 10:11:11 +0100
Received: from gsx300a.mxchg.m.corp ([10.43.212.131]) by
	gsx3072-vs5.mxchg.m.corp with Microsoft SMTPSVC(6.0.3790.4675); 
	Mon, 21 Mar 2011 10:11:07 +0100
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Mon, 21 Mar 2011 10:11:06 +0100
Message-ID: <0C757E680E33864AB113392C7E83F910BE5146@GSX300A.mxchg.m.corp>
In-Reply-To: <1300445777.9054.66.camel@phil-desktop>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] [PATCH 3/3] base-files-3.0.14  configuration files
Thread-Index: AcvlZGYGtYYrd6hKRMeCrcZKUaRUqQCQPCYg
References: <201103171154.23397.pgsellmann@portner-elektronik.at><1300360258.2132.14668.camel@phil-desktop><0C757E680E33864AB113392C7E83F910BE5144@GSX300A.mxchg.m.corp><201103171654.31619.pgsellmann@portner-elektronik.at><0C757E680E33864AB113392C7E83F910BE5145@GSX300A.mxchg.m.corp>
	<1300445777.9054.66.camel@phil-desktop>
From: "Hauser, Wolfgang (external)" <Wolfgang.Hauser.external@cassidian.com>
To: <openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 21 Mar 2011 09:11:07.0051 (UTC)
	FILETIME=[E9568FB0:01CBE7A7]
Subject: Re: [PATCH 3/3] base-files-3.0.14 configuration files
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
X-List-Received-Date: Mon, 21 Mar 2011 09:12:54 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

>What were the circumstances that caused this to happen for you?
>
>p.

The "problem" we have is: we have to create a flushable totally
read-only image for our system.

Therefore we have to overlay, in my opinion, a huge number of recipes to
modify the basic packages for doing offline configurations only.

Most of the modifications are related to a view scripts and
configurations (paths,...) of several packages.

In past I haven't found a solutions to do this in a easy way, w/o
copying the whole recipe and modify it.

To use a copy of a recipe cuts us off from the ongoing development and
bug fixing. This results in a huge amount of maintenance.  =20

So for me it might be an better way to have the files needed for the
configuration of packages at locations beside their original location.
(It might be there have to be a consequent usage of update alternatives
in OE for all packages.)

I had a look on the amend class, but there is not enough documentation
to get it to fly. I haven't managed to resolve my needs using=20
amend.

Regards
Wolfgang


