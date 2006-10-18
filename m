Received: from [137.79.94.127] (helo=s383.jpl.nasa.gov)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <ehovland@s383.jpl.nasa.gov>) id 1GaJK9-0006Mp-1U
	for openembedded-devel@openembedded.org; Wed, 18 Oct 2006 23:51:41 +0200
Received: from mage.jpl.nasa.gov (mage [137.78.15.62])
	by s383.jpl.nasa.gov (8.12.10/8.12.10) with ESMTP id k9ILifhS002419
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Oct 2006 14:44:41 -0700 (PDT)
Received: by mage.jpl.nasa.gov (Postfix, from userid 4960)
	id 10D4C300016E; Wed, 18 Oct 2006 14:44:41 -0700 (PDT)
Date: Wed, 18 Oct 2006 14:44:41 -0700
From: Erik Hovland <erik@hovland.org>
To: openembedded-devel@openembedded.org
Message-ID: <20061018214440.GB29528@mage.jpl.nasa.gov>
References: <427d64720610172317t1e89518bx16ffbdae70fdbfb4@mail.gmail.com>
	<200610180827.46349.openembedded@hrw.one.pl>
	<427d64720610180022p431603abpd3c035f0c79b8f5c@mail.gmail.com>
	<20061018203453.GA29721@twibble.org>
Mime-Version: 1.0
In-Reply-To: <20061018203453.GA29721@twibble.org>
User-Agent: Mutt/1.5.9i
Subject: Re: Fail to start dropbear
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Oct 2006 21:51:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 19, 2006 at 06:34:53AM +1000, Jamie Lenehan wrote:
> On Wed, Oct 18, 2006 at 03:22:41PM +0800, "axel lin" wrote:
> [...]
> > Thanks, Marcin.
> > I fixed it by manually create the device file.
> > How to config OE to add a device file, then I don't have to manually add it.
> 
> If you are using udev then udev should be creating /dev/random and
> /dev/urandom (along with lots of other stuff). I don't think anything
> special is required to get udev to created this.
> 
> If you really do want to add device nodes manually (which is probably wrong)
> then see the "Device (/dev) nodes" section of the "image_ipkg class"
> in the user manual:
> 
>   http://www.openembedded.org/user-manual&dpage=ch07s05

I seem to recall that /dev/zero and /dev/console have to be made
manually just to boot an initrd enabled image. Just to give you an idea
of an exception to the rule. Otherwise, I definitely agree.

E

-- 
Erik Hovland
mail: erik AT hovland DOT org
web: http://hovland.org/
PGP/GPG public key available on request


