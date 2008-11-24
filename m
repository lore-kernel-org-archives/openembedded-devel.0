Received: from [124.219.5.209] (helo=aakash.openmoko.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <john_lee@openmoko.com>) id 1L4Ztr-0002vG-Tu
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Nov 2008 12:46:44 +0100
Received: from [172.16.23.192] (helo=buddha.tw.openmoko.com)
	by aakash.openmoko.org with esmtpsa (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <john_lee@openmoko.com>)
	id 1L4Zqv-0002rT-KZ for openembedded-devel@lists.openembedded.org;
	Mon, 24 Nov 2008 19:43:52 +0800
Received: from john by buddha.tw.openmoko.com with local (Exim 4.69)
	(envelope-from <john_lee@openmoko.com>) id 1L4ZoD-0008Qs-7W
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Nov 2008 19:40:53 +0800
Date: Mon, 24 Nov 2008 19:40:53 +0800
From: John Lee <john_lee@openmoko.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20081124114052.GX2475@buddha.tw.openmoko.com>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <20081124090648.GU2475@buddha.tw.openmoko.com>
	<1227522398.31396.4.camel@mill.internal.reciva.com>
MIME-Version: 1.0
In-Reply-To: <1227522398.31396.4.camel@mill.internal.reciva.com>
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 172.16.23.192
X-SA-Exim-Mail-From: john_lee@openmoko.com
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	aakash.openmoko.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=ALL_TRUSTED,BAYES_00 
	autolearn=ham version=3.1.7-deb
X-SA-Exim-Version: 4.2.1 (built Tue, 09 Jan 2007 17:23:22 +0000)
X-SA-Exim-Scanned: Yes (on aakash.openmoko.org)
Subject: Re: What to do with obsolete kernel modules
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
X-List-Received-Date: Mon, 24 Nov 2008 11:46:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 24, 2008 at 10:26:38AM +0000, Phil Blundell wrote:
> On Mon, 2008-11-24 at 17:06 +0800, John Lee wrote:
> > If kernel-module-foobar exists in an old rootfs, but in later version
> > we disabled module foobar in kernel config, how can we remove the
> > obsolete module from the old rootfs after opkg upgrade ?
> 
> Assuming the old module has a correctly versioned dependency on its
> corresponding kernel version, opkg should automatically tear out the
> module package when the kernel is upgraded since its dependencies will
> no longer be met.  If that isn't working, I think it would be an opkg
> bug.
> 
> p.

but that will only happen if you changed from, say, 2.6.24 to 2.6.26.

if just the git rev changed such as
a1e97c611253511ffc2d8c45e3e6d6894fa03fa3 to
6e2a723ef54ee2e739c34786981b2c508db803c1

then opkg wouldn't know about it.

my problem looks like this:


root@om-gta02:~# opkg status kernel-module-xt-physdev
Package: kernel-module-xt-physdev
Version: 2:2.6.24+git75969+a1e97c611253511ffc2d8c45e3e6d6894fa03fa3-r1.01
Depends: update-modules, kernel-2.6.24, kernel-module-x-tables
Status: install ok installed
Architecture: neo1973
Installed-Time: 1226894980

root@om-gta02:~# opkg status kernel-module-xt-tcpudp
Package: kernel-module-xt-tcpudp
Version: 3:2.6.24+gitr1+6e2a723ef54ee2e739c34786981b2c508db803c1-r2
Depends: update-modules, kernel-2.6.24, kernel-module-x-tables
Status: install user installed
Architecture: om-gta02


these 2 packages coexist on the same rootfs after opkg upgrade.


- John


