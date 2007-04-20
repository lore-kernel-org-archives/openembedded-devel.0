Received: from [213.39.232.198] (helo=moskovskaya.fh-wedel.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <di@mail.fh-wedel.de>) id 1Hes8d-0001Zf-Fy
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Apr 2007 14:22:55 +0200
Received: from di by moskovskaya.fh-wedel.de with local (Exim 4.50)
	id 1Hes8d-0000Yc-6n for openembedded-devel@lists.openembedded.org;
	Fri, 20 Apr 2007 14:22:55 +0200
Date: Fri, 20 Apr 2007 14:22:55 +0200
From: Martin Dietze <di@fh-wedel.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20070420122255.GA1923@fh-wedel.de>
References: <E1HeU56-0006o4-VP@linuxtogo.org>
	<157361400.20070419145713@vanille-media.de>
	<1176998423.5833.99.camel@localhost.localdomain>
	<20070419162539.GA29294@fh-wedel.de>
	<432beae0704190938o5ae0bf04k81fe388e8faa2c09@mail.gmail.com>
	<1177001559.5833.106.camel@localhost.localdomain>
	<20070420095405.GA23328@fh-wedel.de>
Mime-Version: 1.0
In-Reply-To: <20070420095405.GA23328@fh-wedel.de>
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
X-List-Received-Date: Fri, 20 Apr 2007 12:22:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

[I just wrote]

> Having played around with this for another while it seems like
> classes/rootfs_ipk should be patched as follows:
> 
> --- rootfs_ipk.bbclass-orig     2007-04-20 14:13:53.534848585 +0200
> +++ rootfs_ipk.bbclass  2007-04-20 14:10:43.406456119 +0200
> @@ -9,6 +9,7 @@
> 
>  IPKG_ARGS = "-f ${T}/ipkg.conf -o ${IMAGE_ROOTFS}"
> 
> +DEPENDS += "ipkg-native"
>  RDEPENDS += "ipkg ipkg-collateral"
>  PACKAGE_INSTALL += "ipkg ipkg-collateral"
> 
> 
> How about this? I would tend to believe that rootfs_deb
> may need something similar...

At second glance this does not look much better either. From
classes/base.bbclass:

#
# Various backwards compatibility stuff to be removed
# when we switch to bitbake 1.8.2+ as a minimum version
#

[...]

    if bb.data.inherits_class('rootfs_ipk', d):
        depends = "ipkg-native ipkg-utils-native fakeroot-native " + depends

I read from this that these dependencies should have been set
somewhere else already. So where do they come from?

Cheers,

Martin

-- 
-------------- Martin Dietze --------------- / -- 4G Systeme GmbH Hamburg ---
-- martin@the-little-red-haired-girl.org -- / ---- dietze@4g-systems.com ----
------------- / http://herbert.the-little-red-haired-girl.org / -------------
=+= 
Hier ich bin, steine Dich wie ein Wirbelwind.


