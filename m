Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1M8zDu-0007Ya-3r
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 May 2009 18:09:54 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1M8z63-0006lK-85
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 May 2009 17:01:47 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>) id 1M8z63-0005kQ-1f
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 May 2009 17:01:47 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <Pine.LNX.4.64.0905252339270.6446@juice.ott.cti.com>
References: <1243308909-9724-1-git-send-email-msmith@cbnco.com>
	<Pine.LNX.4.64.0905252339270.6446@juice.ott.cti.com>
Date: Tue, 26 May 2009 17:01:46 +0100
Message-Id: <1243353706.9080.367.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: [PATCH] busybox: allow building when prefix is "", not	"/usr".
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
X-List-Received-Date: Tue, 26 May 2009 16:09:54 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2009-05-25 at 23:40 -0400, Michael Smith wrote:
> On Mon, 25 May 2009, Michael Smith wrote:
> 
> > +	for i in ${D}${base_bindir} ${D}${base_sbindir} ${prefix:+${D}${prefix}}
> > +	do
> >  		if [ -d $i ]; then
> > -			cp -dPr $i ${D}/busybox/
> > +			cp -pPR $i ${D}/busybox/
> >  		fi
> >  	done
> 
> I missed this in the commit message: I changed cp -dPr -> -pPR to match 
> the options given a few lines above. -d implies -P, and -r/-R are 
> equivalent, so I suspected a typo. I'll resend with a new description.

Good spotting.  There seems to be more wrong with this code than that,
though: the comment above says "Move everything to /busybox...", but the
code (both before and after your change) seems to copy rather than
moving which would appear to defeat the point of this whole block of
code.  We had a discussion about this on IRC a few weeks ago but I don't
think there was any real conclusion to that.

It looks from the git history as though this stuff has been broken for a
while (since busybox_1.9.1 at least) but I didn't have the patience to
chase it back any further than that. 

Anyway, if you felt like having a go at fixing this too, that'd be
awesome. 

p.




