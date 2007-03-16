Received: from [209.85.132.250] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <pmiscml@gmail.com>) id 1HSFme-0003Ej-7M
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Mar 2007 18:00:06 +0100
Received: by an-out-0708.google.com with SMTP id c5so584236anc
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Mar 2007 10:00:03 -0700 (PDT)
Received: by 10.100.177.16 with SMTP id z16mr1723136ane.1174064403008;
	Fri, 16 Mar 2007 10:00:03 -0700 (PDT)
Received: from cube ( [82.193.98.7])
	by mx.google.com with ESMTP id 22sm3049119nzn.2007.03.16.09.59.59;
	Fri, 16 Mar 2007 10:00:02 -0700 (PDT)
Date: Fri, 16 Mar 2007 19:00:01 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <862875582.20070316190001@gmail.com>
To: Rolf Leggewie <no2spam@nospam.arcornews.de>
In-Reply-To: <etecci$200$1@sea.gmane.org>
References: <etecci$200$1@sea.gmane.org>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: RFC after the fact - bug 1987
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
X-List-Received-Date: Fri, 16 Mar 2007 17:00:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Rolf,

Friday, March 16, 2007, 6:16:34 PM, you wrote:

> Hi,

> it seems I have still a few things to learn as far as updating OE 
> metadata goes.  Furthermore it seems I might have created the first 
> major fuck-up.  I apologize for the inconvenience this has caused to the
> OE community.

> Now, to sort things out; I committed 
> a96c9acac99b5599d2b0fb0a518603646414d166 yesterday to fix bug 1987. It
> seemed like an obvious case (move debug files into -dbg package) which
> is why I dared to commit.  psokolovsky made me aware that an RFC had 
> been necessary to make this commit to a core part of OE and that it 
> might have broken compilation for some OE users.

> Now here I am trying to do The Right Thing[TM].  I want to discuss "mtn
> diff -r e9d53f524190d295cb769c7594711fd76eb197b7 -r 
> a96c9acac99b5599d2b0fb0a518603646414d166".  Please let me know if there
> is anything wrong with this change.  If it should be reverted, feel free
> to do so or let me know via mail or IRC and I will fix it pronto.

  I doubt that it's due to that easy change. I suspect your earlier
commits, 2c516898480b1bc053c9cbf6da853a016059c4c6 &
286930242424d10b2503eb290dbc31c7975bab74 are to blame.

  Either way, I get here:

$bitbake angstrom-x11-image
OE Build Configuration:
BB_VERSION     = "1.6.7"
OE_REVISION    = "25edfc91e04a9233cb67583981d1d8aa3e82f0c0"
TARGET_ARCH    = "arm"
TARGET_OS      = "linux-gnueabi"
MACHINE        = "h4000"
DISTRO         = "angstrom"
DISTRO_VERSION = "test-20070316"
TARGET_FPU     = "soft"

NOTE: preferred version 2.5 of glibc not available
NOTE: preferred version 2.6.19-hh8 of linux-handhelds-2.6 not available
NOTE: preferred version 2.6.19-hh8 of linux-handhelds-2.6 not available
NOTE: preferred version 2.5 of glibc-initial not available
NOTE: preferred version 2.5 of glibc not available
NOTE: preferred version 2.5 of glibc-intermediate not available
NOTE: multiple preferred providers are available (glibc, glibc, glibc);
NOTE: consider defining only one PREFERRED_PROVIDER to match runtime glibc-gconv-iso8859-1
NOTE: package glibc-2.3.5+cvs20050627: started


      Whereas:

bitbake glibc -v

NOTE: Selecting already-staged glibc (2.5-r5) to satisfy glibc

(-c rebuild rebuilds 2.5)


    The same was report by at least 3 other people, including using
other distro than Angstrom.

> Regards

> Rolf



-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



