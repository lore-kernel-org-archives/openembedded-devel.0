Received: from www.xora.org.uk ([80.68.91.202] helo=xora.vm.bytemark.co.uk)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1NlQ5c-0007M3-9S
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Feb 2010 18:04:34 +0100
Received: from localhost (localhost [127.0.0.1])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTP id 2878DA500D
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Feb 2010 16:56:10 +0000 (GMT)
X-Virus-Scanned: Debian amavisd-new at xora.vm.bytemark.co.uk
Received: from xora.vm.bytemark.co.uk ([127.0.0.1])
	by localhost (xora.vm.bytemark.co.uk [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id VLvoXNZN8Zr7
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Feb 2010 16:56:09 +0000 (GMT)
Received: from xora-desktop.xora.org.uk (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTPSA id 49E22A500B
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Feb 2010 16:56:08 +0000 (GMT)
Received: by xora-desktop.xora.org.uk (Postfix, from userid 500)
	id BC76424521; Sat, 27 Feb 2010 16:56:00 +0000 (GMT)
Date: Sat, 27 Feb 2010 16:56:00 +0000
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100227165600.GD30145@xora-desktop.xora.org.uk>
References: <ac9c93b11002270725t46beb56dx5c4dc63c0f6485ca@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <ac9c93b11002270725t46beb56dx5c4dc63c0f6485ca@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-08-17)
X-SA-Exim-Connect-IP: 80.68.91.202
X-SA-Exim-Mail-From: dp@xora.org.uk
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=none autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] recipes/images/${distro}
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
X-List-Received-Date: Sat, 27 Feb 2010 17:04:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Feb 27, 2010 at 04:25:27PM +0100, Frans Meulenbroeks wrote:
> Dear all,
> 
> I  think some restructuring is needed wrt distro's and images
> I did some counting and we currently have 32 distro's (ls
> conf/distro/*.conf | wc
> There are a few semi-dups (micro, minimal and oplinux have regular and
> uclibc versions, angstrom has angstrom-2008.1-legacy.conf  and
> angstrom-2008.1.conf, slugos has slugos, slugos-native and ucslugc)
> 
> also we have 94 images (ls recipes/images/*.bb | wc)
> For some of these it is quite obvious for which distro's they are.
> Mostly because they are prefixed with the distro name (e.g.nylon,
> slugos, openmoko)
> but for several others it is less clear. grep -i -l angstromg
> recipes/images/*.bb | wc gives 30 but not all of them are angstrom
> specific.
> E.g. nas-server-image.bb mentions angstrom in the comment but is
> distro agnostic.
> 
> Also sometimes the names are confusing. We have a minimal distro but
> minimal-image.bb is not an image for the minimal distro, but is an
> angstrom image.
> 
> My proposal is to create distro specific subdirs and move all images
> from a distro to that specific subdir
> That makes it more insightful what belongs to what.
> 
> (alternatively if creating an additional level within images is
> considered to be "not a good thing" we could either create directories
> like images_${distro} or maybe even just ${distro} where a distro can
> keep its stuff).
> (or yet alteratively we could prefix the distro specific images with
> the name of the distro)
> 
> Your opinion is appreciated (and please do express your preference (if
> any) for an option (ofc keep-as-is is also possible) or coin another
> option)
> 

NAK on creating extra levels.

Changing the level where recipes are held is not an option do to the way
you tell bitbake how to find them.

BBFILES = "${OE}/org.openembedded.dev/recipes/*/*.bb"

The other option, angstrom images used to be in recipes/angstrom and we
were asked to move them out so other distros can use them. Id be quite
happy with them to return to angstrom/ as it seems they are not useful
to other distros anyway.

Graeme



