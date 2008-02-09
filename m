Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rpurdie@rpsys.net>) id 1JNuzz-0004Tj-IE
	for openembedded-devel@openembedded.org; Sat, 09 Feb 2008 20:04:29 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m19J4egL029964;
	Sat, 9 Feb 2008 19:04:40 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 29654-07; Sat,  9 Feb 2008 19:04:34 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m19J4X3r029956
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sat, 9 Feb 2008 19:04:33 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: Paul Sokolovsky <pmiscml@gmail.com>
In-Reply-To: <20080209210404.00cab759@widy.localdomain>
References: <20080129011635.42467fc9@widy.localdomain>
	<1201562570.4687.79.camel@localhost.localdomain>
	<20080129023105.1a0cf354@widy.localdomain>
	<1201568452.4687.123.camel@localhost.localdomain>
	<20080131144417.58877daf@widy.localdomain>
	<20080209115607.23cb1fbf@widy.localdomain>
	<1202582569.7981.4.camel@dax.rpnet.com>
	<20080209210404.00cab759@widy.localdomain>
Date: Sat, 09 Feb 2008 19:04:33 +0000
Message-Id: <1202583873.7981.19.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-devel@openembedded.org
Subject: Re: [RFC] A case of distro config overriding DISTRO var
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
X-List-Received-Date: Sat, 09 Feb 2008 19:04:29 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


On Sat, 2008-02-09 at 21:04 +0200, Paul Sokolovsky wrote:
> On Sat, 09 Feb 2008 18:42:49 +0000
> Richard Purdie <rpurdie@rpsys.net> wrote:
> > On Sat, 2008-02-09 at 11:56 +0200, Paul Sokolovsky wrote:
> > > ============================================================
> > > --- classes/image.bbclass
> > > 4d92381733b09bae07a07da35bd0024744924c3c +++
> > > classes/image.bbclass
> > > 6eeae6a01c36465bc36cc737d42ea6b8ab09b152 @@ -90,6 +90,7 @@ fakeroot
> > > do_rootfs () { ${IMAGE_PREPROCESS_COMMAND} 
> > >  	export TOPDIR=${TOPDIR}
> > > +	export DISTRO=${USERDISTRO}
> > >  	export MACHINE=${MACHINE}
> > 
> > This could be rather confusing, can we not have:
> > 
> > USERDISTRO=${USERDISTRO}
> > 
> > then its obvious which variable we mean?
> 
> Not sure I understand. USERDISTRO is the variable which holds *real*
> DISTRO value, and here, we just use that real value to set a top-level
> parameter DISTRO for a tool which expects such top-level parameter
> (bbimage in this case).

Can it not expect USERDISTRO though? Where exactly is this being used?

I just worry that people are going to get confused if we call this
DISTRO since its not the value in the "DISTRO" variable...

Cheers,

Richard





