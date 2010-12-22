Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PVMjB-0002LU-5e for openembedded-devel@lists.openembedded.org;
	Wed, 22 Dec 2010 12:19:29 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PVMj4-0002iE-Hc for openembedded-devel@lists.openembedded.org;
	Wed, 22 Dec 2010 12:19:22 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Dec 2010 12:19:22 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Dec 2010 12:19:22 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 22 Dec 2010 12:19:09 +0100
Message-ID: <iesmrd$2is$1@dough.gmane.org>
References: <ienu66$5gf$1@dough.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.15) Gecko/20101031 Shredder/3.0.11pre
In-Reply-To: <ienu66$5gf$1@dough.gmane.org>
X-Enigmail-Version: 1.0.1
Subject: Re: [RFC] meta-openembedded layer for yocto hosted on oe.org
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
X-List-Received-Date: Wed, 22 Dec 2010 11:19:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 20-12-10 16:53, Koen Kooi wrote:
> Hi,
> 
> I've locally split
> http://gitorious.org/angstrom/angstrom-layers/commits/master into 3
> seperate git repos with git-filter-branch. I would like to move the
> meta-openembedded layer to the OE git server to make it easier for
> others to help in cleaning it up and getting more use to layers. The
> beagle and angstrom layers could move there as well, but those will need
> a more restricted set of committers.
> 
> In essence I would like this to be the "official" OE layer for yocto
> while the board is dealing with the yocto negotiations.

Now that the repo is out there and writable for every OE committer (if I
didn't mess up gitolite), the easiest way to get started is to use this
script:

http://gitorious.org/angstrom/angstrom-setup-scripts/commits/yoctoproject

That will pull all the needed git repositories and assemble a bblayers.conf.

As being discussed on the oe-members list, we desperately need a
workable solution to deal with multiple git repos for layers. Personally
I like Michaels approach of using a flat config file with a git uri for
each layer, but I'm open to other solutions.

I'm now going to read up on license checksumming, RP is going to enable
the killswitch in yocto soon.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNEd6sMkyGM64RGpERAoQSAKCJKYLKnbG+yKGISQgtEhmW5h8ulwCfaC5F
d0zqL9aaDRM6nnGLKFLsYOU=
=7ovB
-----END PGP SIGNATURE-----



