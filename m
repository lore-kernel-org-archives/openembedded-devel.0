Received: from [209.242.20.70] (helo=green.dls.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <mwester@dls.net>) id 1HFwZI-0005gQ-3X
	for openembedded-devel@lists.openembedded.org;
	Sat, 10 Feb 2007 19:03:24 +0100
Received: from twilight (gw.mwester.net [209.242.5.110])
	by green.dls.net (Postfix) with ESMTP id 779EE411AF9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 Feb 2007 12:03:23 -0600 (CST)
Message-ID: <09ad01c74d3d$a91fb600$6e01a8c0@twilight>
From: "Mike \(mwester\)" <mwester@dls.net>
To: <openembedded-devel@lists.openembedded.org>
References: <f34f85580702070514u42b2b887qf416466c5b7bf83d@mail.gmail.com>
Date: Sat, 10 Feb 2007 12:02:42 -0600
MIME-Version: 1.0
X-Priority: 3
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook Express 6.00.2800.1807
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2800.1896
Subject: Re: tzdata.bb
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 10 Feb 2007 18:03:24 -0000
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

You might consider adding

RCONFLICTS= "timezone-africa timezone-america timezone-antarctica \
             timezone-arctic timezone-asia timezone-atlantic \
             timezone-australia timezone-europe timezone-indian \
             timezone-iso3166.tab timezone-pacific timezone-zone.tab"

Mike (mwester)

----- Original Message ----- 
From: "Todd Blumer" <sdgvulpes@gmail.com>
To: <openembedded-devel@lists.openembedded.org>
Cc: "Rene Wagner" <rw@handhelds.org>
Sent: Wednesday, February 07, 2007 7:14 AM
Subject: [oe] tzdata.bb


> Because of the impending changes to daylight savings time (DST) here
> in the US, I was motivated to work on creating a new timezone package.
> In the base package I tried to put a city in every timezone around the
> world. This package replaces the 'timezone' package used by Opie, so
> some other packages will need to be changed to depend on tzdata
> instead of timezone. (I used 'tzdata' since that is the Debian name
> and in case some developers were not ready to switch over to tzdata.)
>
> Someone with write access to oe (something I should probably get
> eventually :-) can commit this to dev if you feel it is appropriate to
> do so. I have tested the US Eastern time.
>
> I'm sure more work could be done here. Feedback is welcome.
> --
> Todd Blumer
> SDG Systems
>


----------------------------------------------------------------------------
----


> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>




