Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1TZJxw-0006fI-UL
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Nov 2012 12:20:09 +0100
Received: from relay1.zedat.fu-berlin.de ([130.133.4.67])
	by outpost1.zedat.fu-berlin.de (Exim 4.69)
	for openembedded-devel@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1TZJkT-001OLO-44>; Fri, 16 Nov 2012 12:06:13 +0100
Received: from andorra.imp.fu-berlin.de ([160.45.42.84])
	by relay1.zedat.fu-berlin.de (Exim 4.69)
	for openembedded-devel@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1TZJkT-003SnL-2V>; Fri, 16 Nov 2012 12:06:13 +0100
Received: from heinold by andorra.imp.fu-berlin.de with local (internal_ws
	Exim 4.72) id 1TZJkR-0005HK-V3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Nov 2012 12:06:11 +0100
Date: Fri, 16 Nov 2012 12:06:11 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121116110611.GB11599@mail.familie-heinold.de>
References: <50A4F6E6.9040507@nedap.com>
	<20121116092221.GA6265@mi.fu-berlin.de>
	<50A61199.3010309@nedap.com>
MIME-Version: 1.0
In-Reply-To: <50A61199.3010309@nedap.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Sender: Henning Heinold <heinold@mi.fu-berlin.de>
X-Originating-IP: 160.45.42.84
Subject: Re: llvm issue
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
X-List-Received-Date: Fri, 16 Nov 2012 11:20:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 16, 2012 at 11:12:41AM +0100, Jaap de Jong wrote:
> 
> On 11/16/2012 10:22 AM, Henning Heinold wrote:
> >On Thu, Nov 15, 2012 at 03:06:30PM +0100, Jaap de Jong wrote:
> >>Hi All,
> >>
> >>when I checkout openjdk-7 on meta-java and bitbake <anything> I get
> >>these errors:
> >>
> >>ERROR: Unable to parse /data/jenkins/jobs/myTest/workspace/sources/meta-java/recipes-core/llvm/llvm2.9_2.9.bb
> >>| ETA:  00:00:15
> >>ERROR: Command execution failed: Exited with 1
> >>NOTE: Error expanding variable populate_packages
> >>NOTE: Error during finalise of /data/jenkins/jobs/myTest/workspace/sources/meta-java/recipes-core/llvm/llvm2.8_2.8.bb
> >>NOTE: Error expanding variable populate_packages
> >>NOTE: Error during finalise of /data/jenkins/jobs/myTest/workspace/sources/meta-java/recipes-core/llvm/llvm2.9_2.9.bb
> >>
> >>Anyone already know what is wrong here?
> >>
> >>Cheers!
> >>Jaap
> >Hi Jaap,
> >
> >khem posted some patches for the jdk7 branch unfornatly I dont have the much time
> >to integrate them yet. Please look at the oe-dev patchwork or use his github repo.
> So what would be the combination to go?
> 1) openembedded-core --> danny
> 2) meta-java --> khem: openjdk-7
> Or something different?

Hm,

you might need to add a newer version of openjdk7 and remove the libxp dependency, because libxp might be removed in
danny.
> 
> >
> >Maybee in christmas holiday I will find some time to merge jdk7 branch into master.
> Sitting next to your Christmas tree! :-)

Bye Henning


