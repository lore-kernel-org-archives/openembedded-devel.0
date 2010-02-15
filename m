Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1NgxXm-0002z8-70
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Feb 2010 10:47:09 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o1F9iSMu008377
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Feb 2010 09:44:28 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07967-08 for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Feb 2010 09:44:24 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o1F9iMaT008371
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Feb 2010 09:44:23 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1266182728.5437.31.camel@lenovo.internal.reciva.com>
References: <20100214203851.3C855185B3BD2@dd20204.kasserver.com>
	<1266182728.5437.31.camel@lenovo.internal.reciva.com>
Date: Mon, 15 Feb 2010 09:44:21 +0000
Message-ID: <1266227061.6436.3.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 93.97.173.237
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: = ? UTF-8 ? B ? Ww== ? =oe= ? UTF-8 ? B ? XQ== ? = How to sane replace a path in a pkgconfig file ?
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
X-List-Received-Date: Mon, 15 Feb 2010 09:47:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2010-02-14 at 21:25 +0000, Phil Blundell wrote:
> On Sun, 2010-02-14 at 21:38 +0100, bernhard.guillon@opensimpad.org
> wrote:
> >  for i in `find ${S}/ -name "*.pc" -type f` ; do 
> > -            sed -i -e 's:-L${STAGING_LIBDIR}::g' -e 's:-I${STAGING_INCDIR}::g' $i
> > +            sed -i -e 's:-L${STAGING_LIBDIR}::g' -e 's:-I${STAGING_INCDIR}::g' -e 's:-rpath-link,${STAGING_LIBDIR}::g' $i
> >          done
> 
> That probably is a reasonable thing to do, but you might want to filter
> out the preceding "-Wl," as well.

Note its pkgconfig we're talking about here which should never be
putting this stuff in its .pc files in the first place as it has some
understanding of sysroots. Usually if these things are creeping in, its
due to dependencies being added as via its expanded cflags/libs lines
rather than as a true dependency.

I'm not sure how it copes with --rpath-link though. If that is breaking,
we should consider fixing pkgconfig itself.

Cheers,

Richard



