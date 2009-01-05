Received: from [124.219.5.209] (helo=aakash.openmoko.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <john_lee@openmoko.org>) id 1LJlga-0004Bu-2D
	for openembedded-devel@lists.openembedded.org;
	Mon, 05 Jan 2009 10:23:48 +0100
Received: from [172.16.23.192] (helo=buddha.tw.openmoko.com ident=Debian-exim)
	by aakash.openmoko.org with esmtpsa (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <john_lee@openmoko.org>)
	id 1LJlaf-0002BC-BW for openembedded-devel@lists.openembedded.org;
	Mon, 05 Jan 2009 17:17:51 +0800
Received: from john by buddha.tw.openmoko.com with local (Exim 4.69)
	(envelope-from <john_lee@openmoko.org>) id 1LJlbo-0006AN-3b
	for openembedded-devel@lists.openembedded.org;
	Mon, 05 Jan 2009 17:18:52 +0800
Date: Mon, 5 Jan 2009 17:18:52 +0800
From: John Lee <john_lee@openmoko.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090105091852.GF29421@buddha.tw.openmoko.com>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <20081222092936.GY2135@buddha.tw.openmoko.com>
	<ginvu0$hg4$1@ger.gmane.org>
	<20081224064114.GB29421@buddha.tw.openmoko.com>
MIME-Version: 1.0
In-Reply-To: <20081224064114.GB29421@buddha.tw.openmoko.com>
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 172.16.23.192
X-SA-Exim-Mail-From: john_lee@openmoko.org
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	aakash.openmoko.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=ALL_TRUSTED,BAYES_00 
	autolearn=ham version=3.1.7-deb
X-SA-Exim-Version: 4.2.1 (built Tue, 09 Jan 2007 17:23:22 +0000)
X-SA-Exim-Scanned: Yes (on aakash.openmoko.org)
Subject: Re: Please review john_lee/openmoko-toolchain
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
X-List-Received-Date: Mon, 05 Jan 2009 09:23:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Just fixed another minor white space vs tab error in libtool-sdk.
Please review these commits.  If it's okay I'll commit them on Friday.
Thanks for Koen for reviewing this.


- John

On Wed, Dec 24, 2008 at 02:41:15PM +0800, John Lee wrote:
> On Mon, Dec 22, 2008 at 01:07:28PM +0100, Koen Kooi wrote:
> > On 22-12-08 10:29, John Lee wrote:
> >> Hi,
> >>
> >
> >>      meta-toolchain-openmoko.bb: add feed to toolchain
> >>
> >>      By modifying the opkg config files in the toolchain, the toolchain can
> >>      expend itself by installing packages from the repository.
> >>
> >>
> >> We need to do some modifications to the contents of toolchain before
> >> the packaging complete, so we use this variable as a hook.  The
> >> modification is to create an opkg config file so the toolchain knows
> >> where to get new packages.  A better way might be to install
> >> distro-feed-configs, but that includes several opkg config files while
> >> alias 'opkg-target' uses just one: opkg.conf.
> >
> > Suggestions for the existing patch:
> >
> > * rename OPENMOKO_URI to TOOLCHAIN_FEED_URI
> > * move the modify_opkg_conf () to meta-toolchain.bb
> > * TOOLCHAIN_FEED_URI ? = "" in meta-toolchain.bb
> > * TOOLCHAIN_FEED_URI =  
> > "http://downloads.openmoko.org/repository/testing" in  
> > meta-toolchain-openmoko.bb or better, conf/distro/openmoko.conf
> >
> > That way more distributions can use it and each distro version can have  
> > it's own SDK by setting TOOLCHAIN_FEED_URI in its distro file.
> 
> I renamed and moved TOOLCHAIN_FEED_URI into meta-toolchain.bb and make
> it default to DISTRO_FEED_URI instead of empty string, so each distro
> can use its own feed setting.
> 
> > As you might have noticed /etc/opkg/arch.conf isn't in any packages (not  
> > unlike the initial devnodes), so you have to generate it for the SDK. I  
> > ran in to the same problem with the online image creator[1] and resorted  
> > to manually installing the conf files: [2]
> 
> modify_opkg_conf will add arch into the opkg conf file as well, so I
> think this is not necessary.
> 
> IMHO meta-toolchain.bb looks fine now.  I'm now more concerned about
> autotools.bbclass since it's global change.


