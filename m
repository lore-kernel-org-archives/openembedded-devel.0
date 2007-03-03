Received: from [209.242.20.70] (helo=green.dls.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <mwester@dls.net>) id 1HNM5z-0006b4-UJ
	for openembedded-devel@lists.openembedded.org;
	Sat, 03 Mar 2007 05:43:48 +0100
Received: from twilight (gw.mwester.net [209.242.5.110])
	by green.dls.net (Postfix) with ESMTP id 91420411DED
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Mar 2007 22:43:51 -0600 (CST)
Message-ID: <08fa01c75d4e$71e4a2b0$6e01a8c0@twilight>
From: "Mike \(mwester\)" <mwester@dls.net>
To: <openembedded-devel@lists.openembedded.org>
References: <f34f85580702070514u42b2b887qf416466c5b7bf83d@mail.gmail.com>
Date: Fri, 2 Mar 2007 22:43:09 -0600
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
X-List-Received-Date: Sat, 03 Mar 2007 04:43:48 -0000
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

tzdata (and tzcode-native) are committed.

The tzdata recipe is Todd's original, I incorporated the feedback from the
list (and added any bugs).  The tzcode-native recipe provides the native
timezone utilities, including zic.

Regards,
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




