Received: from [209.85.128.189] (helo=fk-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JNvJG-0001Db-7X
	for openembedded-devel@openembedded.org; Sat, 09 Feb 2008 20:24:22 +0100
Received: by fk-out-0910.google.com with SMTP id 18so4576215fks.12
	for <openembedded-devel@openembedded.org>;
	Sat, 09 Feb 2008 11:24:36 -0800 (PST)
Received: by 10.78.107.8 with SMTP id f8mr25619688huc.40.1202585075746;
	Sat, 09 Feb 2008 11:24:35 -0800 (PST)
Received: from widy.localdomain ( [78.164.233.103])
	by mx.google.com with ESMTPS id d24sm595649nfh.29.2008.02.09.11.24.33
	(version=SSLv3 cipher=OTHER); Sat, 09 Feb 2008 11:24:34 -0800 (PST)
Date: Sat, 9 Feb 2008 21:27:26 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: Richard Purdie <rpurdie@rpsys.net>
Message-ID: <20080209212726.595a8dd7@widy.localdomain>
In-Reply-To: <1202583873.7981.19.camel@dax.rpnet.com>
References: <20080129011635.42467fc9@widy.localdomain>
	<1201562570.4687.79.camel@localhost.localdomain>
	<20080129023105.1a0cf354@widy.localdomain>
	<1201568452.4687.123.camel@localhost.localdomain>
	<20080131144417.58877daf@widy.localdomain>
	<20080209115607.23cb1fbf@widy.localdomain>
	<1202582569.7981.4.camel@dax.rpnet.com>
	<20080209210404.00cab759@widy.localdomain>
	<1202583873.7981.19.camel@dax.rpnet.com>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.5; i686-pc-linux-gnu)
Mime-Version: 1.0
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
X-List-Received-Date: Sat, 09 Feb 2008 19:24:22 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

On Sat, 09 Feb 2008 19:04:33 +0000
Richard Purdie <rpurdie@rpsys.net> wrote:

> 
> On Sat, 2008-02-09 at 21:04 +0200, Paul Sokolovsky wrote:
> > On Sat, 09 Feb 2008 18:42:49 +0000
> > Richard Purdie <rpurdie@rpsys.net> wrote:
> > > On Sat, 2008-02-09 at 11:56 +0200, Paul Sokolovsky wrote:
> > > > ============================================================
> > > > --- classes/image.bbclass
> > > > 4d92381733b09bae07a07da35bd0024744924c3c +++
> > > > classes/image.bbclass
> > > > 6eeae6a01c36465bc36cc737d42ea6b8ab09b152 @@ -90,6 +90,7 @@
> > > > fakeroot do_rootfs () { ${IMAGE_PREPROCESS_COMMAND} 
> > > >  	export TOPDIR=${TOPDIR}
> > > > +	export DISTRO=${USERDISTRO}
> > > >  	export MACHINE=${MACHINE}
> > > 
> > > This could be rather confusing, can we not have:
> > > 
> > > USERDISTRO=${USERDISTRO}
> > > 
> > > then its obvious which variable we mean?
> > 
> > Not sure I understand. USERDISTRO is the variable which holds *real*
> > DISTRO value, and here, we just use that real value to set a
> > top-level parameter DISTRO for a tool which expects such top-level
> > parameter (bbimage in this case).
> 
> Can it not expect USERDISTRO though? Where exactly is this being used?
> 
> I just worry that people are going to get confused if we call this
> DISTRO since its not the value in the "DISTRO" variable...

Well, it *is* value of DISTRO variable. Secondly, how you imagine that
- bitbake accepts some notion as DISTRO variable, yet bbimage as
USERDISTRO variable? And people should not be confused or even
concerned with all this stuff - it's just internal OE workings made to
make external whitebox interface (DISTRO being a part of it) work as
it should.

Well, after all, bitbake is your area. Pragmatically, I of course would 
prefer to avoid waiting for next bitbake release to get this right
though. Ah, and why bbimage needs DISTRO set properly? It just loads
bitbake.conf and that references ${DISTRO}.conf.

> 
> Cheers,
> 
> Richard
> 
> 
> 



-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com


