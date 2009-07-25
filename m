Received: from [93.97.175.187] (helo=dan.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1MUiE7-0005CI-Sg
	for openembedded-devel@openembedded.org; Sat, 25 Jul 2009 16:27:58 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	n6PECMlo008880 for <openembedded-devel@openembedded.org>;
	Sat, 25 Jul 2009 15:12:22 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id dgQ7pt0EX06R for <openembedded-devel@openembedded.org>;
	Sat, 25 Jul 2009 15:12:21 +0100 (BST)
Received: from [192.168.1.3] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	n6PECJLW008864
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@openembedded.org>;
	Sat, 25 Jul 2009 15:12:21 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <4A6B0BCD.9010108@xora.org.uk>
References: <alpine.LFD.2.00.0907250800110.9021@localhost>
	<200907251452.41374.holger+oe@freyther.de>
	<alpine.LFD.2.00.0907250858080.9674@localhost>
	<4A6B0BCD.9010108@xora.org.uk>
Date: Sat, 25 Jul 2009 15:11:35 +0100
Message-Id: <1248531096.20755.49.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: getting bitbake-1.8.12 for the org.openembedded.dev	branch?
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
X-List-Received-Date: Sat, 25 Jul 2009 14:28:03 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, 2009-07-25 at 14:42 +0100, Graeme Gregory wrote:
> Robert P. J. Day wrote:
> >   in a sense, i agree with that.  the problem is that the precedent
> > has already been set by having bitbake in the stable/2009 branch and,
> > based on the principle of least surprise, you shouldn't suddenly yank
> > something out of a branch if developers are used to seeing it there.
> >
>
> Your standing on your head. Bitbake wasnt yanked out of anything. It was 
> added to the stable branch in good engineering fashion as thats the 
> version stable/2009 will always build with. Development moves with 
> bitbake so it makes no sense to put it in.

Think of this as being like an autotools project. When you make a
"release" you include the generated autoconf output but you don't
include that in the master repository.

Our stable branch/release includes bitbake, the main OE.dev repository
does not. Bitbake is a project in its own right, the reasons for keeping
it separate have been discussed and made clear in the past, not least
that we have multiple branches of bitbake and people use a variety of
them with OE.dev.

Also note that bitbake DOES NOT NEED TO BE INSTALLED. Just check it out
somewhere and use it. I wish more people would realise that :/.

Cheers,

Richard



