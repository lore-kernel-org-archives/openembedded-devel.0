Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Np35t-0008Dn-PF for openembedded-devel@lists.openembedded.org;
	Tue, 09 Mar 2010 18:19:50 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Np31M-0006VT-Hy for openembedded-devel@lists.openembedded.org;
	Tue, 09 Mar 2010 18:15:04 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Mar 2010 18:15:04 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Mar 2010 18:15:04 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 09 Mar 2010 15:00:24 +0100
Message-ID: <hn5k9o$3vc$2@dough.gmane.org>
References: <20100309075331.GL31945@jama>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.8) Gecko/20100223 Shredder/3.0.3pre
In-Reply-To: <20100309075331.GL31945@jama>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL,BAYES_00,
	DATE_IN_PAST_03_06,SPF_HELO_PASS,SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] Make some big but only formal change before next stable - SRCPV
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
X-List-Received-Date: Tue, 09 Mar 2010 17:19:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 09-03-10 08:53, Martin Jansa wrote:
> Hi,
> 
> what it missing in bitbake master to call it 1.9.0 and switch all to
> this version with sanity check? I'm using master on my builder and SHR
> builder and it works good. (Only issue I still have is oestats-client -
> reported yesterday to bitbake-dev list).
> 
> In this version is support for LOCALCOUNT override, which makes SRCPV
> usable with multiple builders with shared feeds. Which was only big
> complaint against using SRCPV for git recipes.
> http://git.openembedded.org/cgit.cgi/bitbake/commit/?id=2f32735463159e9e42e03819d6b505dba49c7f17

What I had plan to RFC, but forgot to, is to move the count vars out of
TMPDIR. My PV suddenly went backwards for a git recipe I'm using,
because I removed TMPDIR.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLllR4MkyGM64RGpERAlgWAJ4l4Ntky6O7MT62bvsOCHWWy+0+iQCfUrpI
X9Yw40O4OnhSuZfi6K40oTY=
=BSSV
-----END PGP SIGNATURE-----



