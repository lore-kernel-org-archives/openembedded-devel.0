Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rpurdie@rpsys.net>) id 1JTw8J-0008Qs-KN
	for openembedded-devel@openembedded.org; Tue, 26 Feb 2008 10:30:04 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m1Q9TMxL015970
	for <openembedded-devel@openembedded.org>; Tue, 26 Feb 2008 09:29:22 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15868-03 for <openembedded-devel@openembedded.org>;
	Tue, 26 Feb 2008 09:29:14 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m1Q9TDUW015957
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Tue, 26 Feb 2008 09:29:13 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <c67f1650802251755t37cda022y48a0c52c9a3c4ad5@mail.gmail.com>
References: <c67f1650802251755t37cda022y48a0c52c9a3c4ad5@mail.gmail.com>
Date: Tue, 26 Feb 2008 09:29:13 +0000
Message-Id: <1204018153.8150.15.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 194.106.48.114
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [Fwd: Android on OMAP wiki page]
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
X-List-Received-Date: Tue, 26 Feb 2008 09:30:04 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


On Mon, 2008-02-25 at 17:55 -0800, QMan wrote:
> > -----Original Message-----
> > From: openembedded-devel-bounces@lists.openembedded.org
> > [mailto:openembedded-devel-bounces@lists.openembedded.org] On
> > Behalf Of Philip Balister
> > Sent: Monday, February 25, 2008 4:57 PM
> > To: openembedded-devel@openembedded.org
> > Subject: [oe] [Fwd: Android on OMAP wiki page]
> >
> > I'm not up on the Android situation, but some of you might be
> > interestes in this web page.
> >
> > Philip
> 
> Anyone know how hard getting Android into the OE build system would be?

The only public source code image wise is the goldfish kernel. I added
that to Poky and was able to run Poky images inside the android
emulator:

http://svn.o-hand.com/view/poky/trunk/meta-extras/conf/machine/android-goldfish.conf?rev=3143&view=auto
http://svn.o-hand.com/view/poky/trunk/meta-extras/packages/linux/linux-android-goldfish_2.6.23-rc20.bb?rev=3144&view=auto

Since Android is a binary release other than this, I'm not sure what
else you want to do with OE?

Regards,

Richard



