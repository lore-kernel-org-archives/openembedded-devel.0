Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1MDFRs-0000fp-5u
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Jun 2009 12:17:56 +0200
Received: from 212-139-89-247.dynamic.dsl.as9105.com ([212.139.89.247]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1MDFIo-0007Jz-Iz
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Jun 2009 11:08:34 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <618E409A-94E7-486B-B6CF-6D2F01FF08B6@mac.com>
References: <4E17E8CF-AA3B-4929-BC22-B9B28A757035@mac.com>
	<1244367963.4151.5.camel@lenovo.internal.reciva.com>
	<618E409A-94E7-486B-B6CF-6D2F01FF08B6@mac.com>
Date: Sun, 07 Jun 2009 11:08:33 +0100
Message-Id: <1244369313.4151.9.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: linux-omap3_git.bb doesn't work when	copied	to	user.collection
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
X-List-Received-Date: Sun, 07 Jun 2009 10:17:56 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Assuming you haven't overridden it in local.conf, the definitions from
bitbake.conf will be what you're getting:

CO_DIR = "${DL_DIR}"
GITDIR = "${CO_DIR}/git"

Judging from your previous mail it seems that you have ${DL_DIR} set
to /usr/share/sources, so the bits in question are most likely
in /usr/share/sources/git.

p.

On Sun, 2009-06-07 at 13:57 +0400, Elvis Dowson wrote:
> Hi Phil,
> 		 Where is ${GITDIR} located ? I tried echo $GIRDIR but didn't get  
> anything.
> 
> Elvis
> 
> On Jun 7, 2009, at 1:46 PM, Phil Blundell wrote:
> 
> >>
> >
> > It seems that bitbake is trying to run "git fetch" without having
> > previously cloned.  That must mean that either bitbake is under the
> > erroneous impression that clone has already been run, or that it has
> > indeed been run but that it failed without bitbake noticing.
> >
> > Have you tried cleaning out your ${GITDIR}?
> >
> > p.
> >
> >
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



