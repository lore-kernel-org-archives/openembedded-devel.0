Received: from [213.39.232.198] (helo=moskovskaya.fh-wedel.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <di@mail.fh-wedel.de>) id 1HeZRz-0000bJ-SA
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Apr 2007 18:25:39 +0200
Received: from di by moskovskaya.fh-wedel.de with local (Exim 4.50)
	id 1HeZRz-0007gy-8C for openembedded-devel@lists.openembedded.org;
	Thu, 19 Apr 2007 18:25:39 +0200
Date: Thu, 19 Apr 2007 18:25:39 +0200
From: Martin Dietze <di@fh-wedel.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20070419162539.GA29294@fh-wedel.de>
References: <E1HeU56-0006o4-VP@linuxtogo.org>
	<157361400.20070419145713@vanille-media.de>
	<1176998423.5833.99.camel@localhost.localdomain>
Mime-Version: 1.0
In-Reply-To: <1176998423.5833.99.camel@localhost.localdomain>
X-PGP-Fingerprint: C98D 598A DA73 DF9F 610D  632E 4468 B911 BF9B 8D95
X-PGP-Key-ID: 0xBF9B8D95
User-Agent: Mutt/1.5.9i
Sender: Martin Dietze <di@mail.fh-wedel.de>
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: di@mail.fh-wedel.de
Subject: Re: [oe-commits] org.oe.dev mtx-3a.conf, nylon-image-base.bb:	removed remaints from old OE code (PACKAGE_INSTALL instead of IPKG_INSTALL)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Apr 2007 16:25:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, April 19, 2007, Richard Purdie wrote:

> > > -inherit image_ipk
> > > -inherit nylon_image
> > > -LICENSE = MIT
> > > +inherit image
> > > +inherit nylon-image
> > > +LICENSE = "MIT"
> > 
> > Are you sure about that? image_ipk looks about right for me.
> 
> image_ipk is incorrect and I'd mentioned this being a problem on the
> mailing list - it was causing parsing errors. We have multiple image
> generation types now and selecting them like that in .bb files doesn't
> make sense so images just inherit image.

I just noticed that not inheriting image_ipk actually gives me
problems because ipkg-native is no longer automatically
DEPENDed. Is this a bug or a featuer? In the latter case -
where are maintainers supposed to put the necessary
configuration?

Cheers,

Martin

-- 
-------------- Martin Dietze --------------- / -- 4G Systeme GmbH Hamburg ---
-- martin@the-little-red-haired-girl.org -- / ---- dietze@4g-systems.com ----
------------- / http://herbert.the-little-red-haired-girl.org / -------------
=+= 
Kommt ein Bratscher aufgeregt in das Musikgeschäft: "Also, die
Bratsche, die sie mir gestern verkauft haben, die können Sie gleich
wiederhaben. Da ist ja bei jeder Saite ein anderer Ton drauf!"


