Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1P7kB1-0005YV-7j for openembedded-devel@lists.openembedded.org;
	Mon, 18 Oct 2010 09:30:36 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1P7kAW-0006bm-Ec for openembedded-devel@lists.openembedded.org;
	Mon, 18 Oct 2010 09:30:04 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Oct 2010 09:30:04 +0200
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Oct 2010 09:30:04 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 18 Oct 2010 09:21:34 +0200
Message-ID: <i9gshu$8r0$2@dough.gmane.org>
References: <20101017211540.GB3324@jama>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.14) Gecko/20101002 Shredder/3.0.9pre
In-Reply-To: <20101017211540.GB3324@jama>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] do we really need all OVERRIDES in FILESPATH?
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
X-List-Received-Date: Mon, 18 Oct 2010 07:30:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 17-10-10 23:15, Martin Jansa wrote:
> Currently
> bitbake -e -b xserver-xorg-conf_0.1.bb | grep ^FILESPATH= | sed "s/:/\n/g" | wc -l
> shows 65 directories where file:// from SRC_URI can be found.
> 
> base_do_unpack is looking for first directory where requested file
> exists. Most files are IMHO found in FILESPATHPKG PN, files or P
> (without an override used)
> 
> Number of directories tried before
> PN:    38
> files: 51
> P:     25
> 
> I see many recipes really using that MACHINE or DISTRO is in FILESPATH,
> few users of TARGET_ARCH and quick find/grep doesn't show any users of 
> other OVERRIDES in FILESPATH.
> 
> BTW: ie initscripts have initscripts/files/arm/alignment.sh but that's only
> alignment.sh and SRC_URI_append_arm = " file://alignment.sh" would work
> ok even without arm in FILESPATH.
> 
> What about using only ${TARGET_ARCH}:${DISTRO}:${MACHINE} in FILESPATH
> instead all OVERRIDES?

At least I additionally need BASE_PACKAGE_ARCH and SOC_FAMILY in it and
sometimes libc-$LIBC.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMu/V+MkyGM64RGpERAk8TAKCNwmBmVhDmFC0jzhrxWVo3WxI9iwCfRrGd
03R+AyA6hh/3vtl/OBdnbkc=
=iUyw
-----END PGP SIGNATURE-----



