Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OCVa8-0000g6-VO for openembedded-devel@lists.openembedded.org;
	Thu, 13 May 2010 12:23:57 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OCVWN-0006im-7T for openembedded-devel@lists.openembedded.org;
	Thu, 13 May 2010 12:20:03 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 May 2010 12:20:03 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 May 2010 12:20:03 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
connect(): No such file or directory
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 13 May 2010 12:15:02 +0200
Message-ID: <hsgjf7$645$1@dough.gmane.org>
References: <20100513095725.GH3370@jama>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.9) Gecko/20100428 Shredder/3.0.5pre
In-Reply-To: <20100513095725.GH3370@jama>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: install_linguas using public feed for locale package install?
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
X-List-Received-Date: Thu, 13 May 2010 10:23:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 13-05-10 11:57, Martin Jansa wrote:
> Today I noticed that with every do_rootfs I see few downloads from my
> webserver (where is DISTRO_FEED_URI pointing).
> 
> I guess it's because install_linguas from image.bbclass.
> 
> Is there some special reason why it's not used from deploy/ipk directly?

This code was done in narcissus first, which and then copied to OE. The
difficulty here is that when this runs, the OE generated opkg.conf is
already gone. You can make it use the deploy/ipk feeds if you do the
install_lingua step earlier, or add a -f to point to a different config
file location.

> it's not problem here, but if public feed is not in sync with deploy/ipk
> it can be IMHO pretty bad (locale .ipk cannot be found or different version).

Well, it keeps me honest :) It makes me notice public and private feed
discrepancies a lot faster. But I agree that requiring internet access
during do_rootfs is a bad thing.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFL69EmMkyGM64RGpERAlXNAJ40+6RmlXq4HrVM9rA2MPlHfGxbcwCgmZFL
svGHlGjBBd632Y032WBVruA=
=lBnV
-----END PGP SIGNATURE-----



