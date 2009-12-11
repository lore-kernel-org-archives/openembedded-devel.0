Received: from bay0-omc1-s23.bay0.hotmail.com ([65.54.190.34])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <salehusman@hotmail.com>) id 1NJ6an-0002F4-B1
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Dec 2009 15:35:40 +0100
Received: from BAY127-W6 ([65.54.190.61]) by bay0-omc1-s23.bay0.hotmail.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 11 Dec 2009 06:32:48 -0800
Message-ID: <BAY127-W6237F900F669541AE5747D88C0@phx.gbl>
X-Originating-IP: [203.82.49.5]
From: saleh usman <salehusman@hotmail.com>
To: Openembedded Charis Larson <clarson@kergoth.com>, Openembedded Discussion
	<openembedded-devel@lists.openembedded.org>
Date: Fri, 11 Dec 2009 19:32:48 +0500
Importance: Normal
In-Reply-To: <b6ebd0a50912100702s63a6db1lc3ce936f15ce0ad1@mail.gmail.com>
References: <BAY127-W12CD092294401BAF297F8DD88F0@phx.gbl>
	<4B1E7699.7000004@mlbassoc.com>,
	<b6ebd0a50912080821r295faf03rd8b4159561a497c6@mail.gmail.com>,
	<BAY127-W19F38E3292656B84EAB3A3D88D0@phx.gbl>,
	<b6ebd0a50912100702s63a6db1lc3ce936f15ce0ad1@mail.gmail.com>
MIME-Version: 1.0
X-OriginalArrivalTime: 11 Dec 2009 14:32:48.0656 (UTC)
	FILETIME=[CFE80100:01CA7A6E]
X-SA-Exim-Connect-IP: 65.54.190.34
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
X-List-Received-Date: Fri, 11 Dec 2009 14:35:40 -0000
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable


Oh sorry=2CI've missed to set oe.Thanks a lot for guidance.
Now it is showing a different kind of error in terminal window as below.Whe=
re to find these missing dependencies?

[saleh@localhost build]$ bitbake helloworld-image
NOTE: Handling BitBake files: | (0001/0001) [100 %]
NOTE: Parsing finished. 0 cached=2C 1 parsed=2C 0 skipped=2C 0 masked.
NOTE: Resolving any missing task queue dependencies
ERROR: Required build target 'helloworld-image' has no buildable providers.
Missing or unbuildable dependency chain was: ['helloworld-image'=2C 'shasum=
-native']


I am building this image for an embedded platform which has an ARM 9 proces=
sor and linux has been ported and running on it.But our board doesn't suppo=
rt gcc.What else I need to run this om my board.

From: clarson@kergoth.com
Date: Thu=2C 10 Dec 2009 08:02:27 -0700
Subject: Re: [oe] Problem using "bitbake"
To: salehusman@hotmail.com
CC: openembedded-devel@lists.openembedded.org

If that's a copy/pasted line=2C you're referencing an 'oe' variable=2C like=
ly set in your environment?  Is it exported?  Did you add it to the bitbake=
 environment whitelist?  Run bitbake -e | grep \^BBFILES=2C and see what it=
 *really* ends up set to.



On Thu=2C Dec 10=2C 2009 at 8:00 AM=2C saleh usman <salehusman@hotmail.com>=
 wrote:







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


Keep your friends updated=97 even when you=92re not signed in.




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
Windows Live Hotmail: Your friends can get your Facebook updates=2C right f=
rom Hotmail=AE.
http://www.microsoft.com/middleeast/windows/windowslive/see-it-in-action/so=
cial-network-basics.aspx?ocid=3DPID23461::T:WLMTAGL:ON:WL:en-xm:SI_SB_4:092=
009=

