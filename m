Received: from [80.68.91.202] (helo=xora.org.uk)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <dp@xora.org.uk>) id 1I7zlq-0002X7-2a
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Jul 2007 22:23:46 +0200
Received: from cimmeria.hyboria ([::ffff:85.210.46.98])
	(AUTH: PLAIN dp, TLS: TLSv1/SSLv3,256bits,AES256-SHA)
	by xora.org.uk with esmtp; Mon, 09 Jul 2007 21:18:09 +0100
	id 0003090A.46929801.00005987
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 9 Jul 2007 21:19:03 +0100
User-Agent: KMail/1.9.6
References: <513012886.20070708041151@gmail.com>
	<1183996538.5757.55.camel@localhost.localdomain>
	<849361116.20070709220136@vanille-media.de>
In-Reply-To: <849361116.20070709220136@vanille-media.de>
MIME-Version: 1.0
Message-Id: <200707092119.03823.dp@xora.org.uk>
Cc: "Dr. Michael Lauer" <mickey@vanille-media.de>
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
X-List-Received-Date: Mon, 09 Jul 2007 20:23:46 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Monday 09 July 2007 21:01:36 Dr. Michael Lauer wrote:
> To summarize:
>
> It looks like we can agree to adding information to the
> MACHINE_DISPLAY_ namespace.
>
> However, we're undecided regarding the semantics. Some of think the
> physical hardware information need to be there, some of us want the
> logical (including kernel-level gfx hardware rotation), some of us
> want a high-level meaning.
>
> How do we proceed now? Collect more arguments in favour or against or
> shall we vote? Who is having a voice?
>
I would vote for using the version that gives the most information and 
therefore the other information can be derived.

WIDTH=480
HEIGHT=640
ROTATION=270

You can infer that inside your opie/x11/other system you have a 640x480 
landscape.

But from

WIDTH=640
HEIGHT=480

You cannot infer the rotation.

So I think having the physical parameters including rotation is essential.

Graeme


