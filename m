Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Nm8Mj-0003N6-76 for openembedded-devel@lists.openembedded.org;
	Mon, 01 Mar 2010 17:21:10 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Nm8Jz-0006cC-CB for openembedded-devel@lists.openembedded.org;
	Mon, 01 Mar 2010 17:18:15 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Mar 2010 17:18:15 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Mar 2010 17:18:15 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 01 Mar 2010 17:17:59 +0100
Message-ID: <hmgpbo$l0e$1@dough.gmane.org>
References: <20100301144040.GB12022@jama>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.8) Gecko/20100219 Shredder/3.0.3pre
In-Reply-To: <20100301144040.GB12022@jama>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Should be xserver-xorg MACHINE_ARCH?
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
X-List-Received-Date: Mon, 01 Mar 2010 16:21:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 01-03-10 15:40, Martin Jansa wrote:
> Today I was checking why building om-gta01 and om-gta02 in same tmpdir
> fails with this error:
> 
>  * satisfy_dependencies_for: Cannot satisfy the following dependencies for task-shr-minimal-x:
>  *      libdrm (>= 2.4.18+gitr4565+b5aec2bd3df736216e86eae28e278172d3ba3362) *  libdrm (>= 2.4.18+gitr4565+b5aec2bd3df736216e86eae28e278172d3ba3362) *  libdrm (>= 2.4.18+gitr4565+b5aec2bd3df736216e86eae28e278172d3ba3362) *
> 
> first I noticed that task-shr-minimal.bb was missing
> PACKAGE_ARCH = "${MACHINE_ARCH}"
> after I moved some machine specific depends there (from shr-image.inc).
> 
> But even after that setting PACKAGE_ARCH right, I have this error and I think 
> it's because xserver-xorg was built first for om-gta02 with virtual/libgl 
> provider set to mesa-dri (_git.bb version used) and resulting .ipk has armv4t
> arch, even when it was built with machine specific virtual/libgl provider and
> libdrm version also specific for om-gta02 (om-gta01 will use 2.4.18 release instead,
> because it doesn't need glamo specific patches from libdrm_git.bb)
> 
> What is right solution? Set xserver-xorg arch to MACHINE_ARCH (as virtual/libgl is
> usually decided based on target machine). Or force om-gta01 to use mesa-dri (I already
> did) and also libdrm from git repo with glamo patches (because upstream git repo and 
> glamo repo has different SRCREV so switching to libdrm_git.bb won't help).

Part of the solution is to stop making mesa machine specific when no
machine specific are in use (e.g. using swrast).

The next step would be to add some magic to the xserver-xorg recipes to
make it ${MACHINE_ARCH} only when mesa is ${MACHINE_ARCH}.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLi+i3MkyGM64RGpERAgioAJ92mWsOlQQ2wBp9WlMT15RYpRsgzwCaAv7J
Jwg7AvYkE0LPsLpZshPMLlw=
=J9CM
-----END PGP SIGNATURE-----



