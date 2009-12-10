Received: from mc2-f17.bay6.hotmail.com ([65.54.190.24]
	helo=bay0-omc1-s13.bay0.hotmail.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <salehusman@hotmail.com>) id 1NIkXX-0004gG-BH
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Dec 2009 16:02:50 +0100
Received: from BAY127-W19 ([65.54.190.61]) by bay0-omc1-s13.bay0.hotmail.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 10 Dec 2009 07:00:00 -0800
Message-ID: <BAY127-W19F38E3292656B84EAB3A3D88D0@phx.gbl>
X-Originating-IP: [203.82.49.5]
From: saleh usman <salehusman@hotmail.com>
To: <clarson@kergoth.com>, Openembedded Discussion
	<openembedded-devel@lists.openembedded.org>
Date: Thu, 10 Dec 2009 20:00:00 +0500
Importance: Normal
In-Reply-To: <b6ebd0a50912080821r295faf03rd8b4159561a497c6@mail.gmail.com>
References: <BAY127-W12CD092294401BAF297F8DD88F0@phx.gbl>
	<4B1E7699.7000004@mlbassoc.com>,
	<b6ebd0a50912080821r295faf03rd8b4159561a497c6@mail.gmail.com>
MIME-Version: 1.0
X-OriginalArrivalTime: 10 Dec 2009 15:00:00.0406 (UTC)
	FILETIME=[72178B60:01CA79A9]
X-SA-Exim-Connect-IP: 65.54.190.24
X-SA-Exim-Mail-From: salehusman@hotmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Problem using "bitbake"
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
X-List-Received-Date: Thu, 10 Dec 2009 15:02:50 -0000
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable


I've set BBFILES in the local.conf file as  =20
 BBFILES =3D "${oe}/openembedded/recipes/images/helloworld-image.bb"
where oe is directory in which openembedded is placed. I've also tried hell=
oworld-image.But it returned same messages.

I am just following the isntructions of Getting Started page and using hell=
oworld-image given in the openembedded/recipes/images directory.


Terminal window was like this

[saleh@localhost build]$ bitbake helloworld-image

NOTE: Parsing finished. 0 cached=2C 0 parsed=2C 0 skipped=2C 0 masked.
NOTE: Cache is clean=2C not saving.
ERROR: Nothing PROVIDES 'helloworld-image'


From: clarson@kergoth.com
Date: Tue=2C 8 Dec 2009 09:21:04 -0700
Subject: Re: [oe] Problem using "bitbake"
To: openembedded-devel@lists.openembedded.org
CC: salehusman@hotmail.com



On Tue=2C Dec 8=2C 2009 at 8:54 AM=2C Gary Thomas <gary@mlbassoc.com> wrote=
:


On 12/08/2009 08:49 AM=2C saleh usman wrote:




Hello



I am trying to build   "helloworld_image"  given in openembedded recipes/im=
ages directory but the following error is occuring. Please help me in diagn=
osing the pr0blem and moving forward.





[saleh@localhost build]$ bitbake helloworld_image



NOTE: Parsing finished. 0 cached=2C 0 parsed=2C 0 skipped=2C 0 masked.

NOTE: Cache is clean=2C not saving.

ERROR: Nothing PROVIDES 'helloword_image'




Try 'bitbake helloworld-image' (dash=2C not underscore)


The 0 cached=2C 0 parsed=2C 0 skipped=2C 0 masked from the parse implies th=
at BBFILES was not set correctly=2C or at all.

--=20
Chris Larson
clarson at kergoth dot com
clarson at mvista dot com
Founder - BitBake=2C OpenEmbedded=2C OpenZaurus
Maintainer - Tslib
Software Engineer
MontaVista Software=2C Inc.
 		 	   		 =20
_________________________________________________________________
Keep your friends updated=97even when you=92re not signed in.
http://www.microsoft.com/middleeast/windows/windowslive/see-it-in-action/so=
cial-network-basics.aspx?ocid=3DPID23461::T:WLMTAGL:ON:WL:en-xm:SI_SB_5:092=
010=

