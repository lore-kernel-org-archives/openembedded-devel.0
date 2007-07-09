Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1I80BW-00035j-NQ
	for openembedded-devel@openembedded.org; Mon, 09 Jul 2007 22:50:19 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l69KigDi015976;
	Mon, 9 Jul 2007 21:44:42 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15772-05; Mon,  9 Jul 2007 21:44:39 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l69KiaXf015968
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Mon, 9 Jul 2007 21:44:36 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: Graeme Gregory <dp@xora.org.uk>
In-Reply-To: <200707092119.03823.dp@xora.org.uk>
References: <513012886.20070708041151@gmail.com>
	<1183996538.5757.55.camel@localhost.localdomain>
	<849361116.20070709220136@vanille-media.de>
	<200707092119.03823.dp@xora.org.uk>
Date: Mon, 09 Jul 2007 21:44:35 +0100
Message-Id: <1184013875.5757.71.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-devel@openembedded.org,
	"Dr. Michael Lauer" <mickey@vanille-media.de>
Subject: Re: [RFC] Adding screen dimensions to machine configs
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
X-List-Received-Date: Mon, 09 Jul 2007 20:50:20 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2007-07-09 at 21:19 +0100, Graeme Gregory wrote:
> On Monday 09 July 2007 21:01:36 Dr. Michael Lauer wrote:
> > To summarize:
> >
> > It looks like we can agree to adding information to the
> > MACHINE_DISPLAY_ namespace.
> >
> > However, we're undecided regarding the semantics. Some of think the
> > physical hardware information need to be there, some of us want the
> > logical (including kernel-level gfx hardware rotation), some of us
> > want a high-level meaning.
> >
> > How do we proceed now? Collect more arguments in favour or against or
> > shall we vote? Who is having a voice?
> >
> I would vote for using the version that gives the most information and 
> therefore the other information can be derived.
> 
> WIDTH=480
> HEIGHT=640
> ROTATION=270
> 
> You can infer that inside your opie/x11/other system you have a 640x480 
> landscape.
> 
> But from
> 
> WIDTH=640
> HEIGHT=480
> 
> You cannot infer the rotation.
> 
> So I think having the physical parameters including rotation is essential.

Well said :). If you give the physical information you can derive the
rest. If you give "logical" information you can't get back to the
physical which is why formfactor gives physical parameters.

Cheers,

Richard



