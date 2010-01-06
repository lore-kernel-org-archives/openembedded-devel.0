Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1NSN5n-00055c-HA
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Jan 2010 05:01:59 +0100
Received: from tamarin.localnet (123-192-180-176.dynamic.kbronet.com.tw
	[123.192.180.176])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 061CA1B10C04
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Jan 2010 03:57:15 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 6 Jan 2010 04:59:45 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <op.u5zi1ghgmn1qzu@guohr-laptop-ubuntu>
	<4B42044B.8050801@nospam.arcornews.de>
	<op.u51etl01mn1qzu@guohr-laptop-ubuntu>
In-Reply-To: <op.u51etl01mn1qzu@guohr-laptop-ubuntu>
MIME-Version: 1.0
Message-Id: <201001060459.45399.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: why we don't setup a buildbot for openembedded QA?
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
X-List-Received-Date: Wed, 06 Jan 2010 04:01:59 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit

On Tuesday 05 January 2010 03:06:47 Guo Hongruan wrote:
> No, I am not talking about tinderbox but buildbot. I want to setup a
> public buildbot and validate every possible combinations of openembedded.
> In another words, I want to do some QA jobs of openembedded.

This is a nice goal, but it is probably not the biggest concern as well. E.g. 
there is little benefit of making every version of binutils work with glibc and 
gcc. It is certainly cool to be able to pick any GCC, BINUTILS, GLIBC and 
guarnatee that it will work on any host distro. But besides being totally cool 
it is also totally wasting your time (unless your goal is to learn how GCC, 
BINUTILS and GLIBC interact). And the next step would be to have make world 
build on top of that...


I have been at your point a couple of years back (seppuku, a tinderbox setup, 
autobuild scripts are the result). The QA that is working best is to have 
people sign up for "maintaining" certain areas.

E.g.: I'm feeling responsible for:

	- QtE, meta-toolchain-qte, qmake and such
	- I'm also testing mipsel from time to time

Other people like pb_ feel responsible for:
	- DISTRO micro (I think i got it wrong)

Or Khem is doing kick ass work on the toolchain bits..


> Of course, I need help and support from all of you. I want a public server
> which runs python and twist and I also want any volunteer can provide
> their machine as build slaver when it is available.

Technology is not the problem here. What use is this system if no one is fixing 
build problems because of a too new or too old version of GCC? What use is it 
to the user to have thousands of tested configurations when he can not navigate 
through the list of packages?


let me write another mail about QA topics.

	z.


