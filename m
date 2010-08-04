Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Oghga-0003qv-A6 for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 19:23:41 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OghgM-0003ct-Kq for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 19:23:10 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Aug 2010 19:23:10 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Aug 2010 19:23:10 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 04 Aug 2010 19:22:55 +0200
Message-ID: <i3c7lf$mpg$1@dough.gmane.org>
References: <1280780382-11697-1-git-send-email-fransmeulenbroeks@gmail.com>	<i38mr6$ng8$1@dough.gmane.org>
	<20100803235811.GC17391@denix.org>	<20100804001040.GE17391@denix.org>	<AANLkTi=QDw_sf4H8Kdt7L7nfNZ24bjVBJ4hdW6HPUupB@mail.gmail.com>
	<20100804165030.GG28187@mx.loc>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.11) Gecko/20100718 Shredder/3.0.7pre
In-Reply-To: <20100804165030.GG28187@mx.loc>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] 500+ recipes: remove do_stage
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
X-List-Received-Date: Wed, 04 Aug 2010 17:23:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 04-08-10 18:50, Bernhard Reutner-Fischer wrote:
> 
> Hi,
> 
> i'm seeing this:
> ERROR: This recipe recipes/libidl/libidl_0.8.3.bb) has a
> do_stage_prepend or do_stage_append and do_stage now doesn't exist.
> Please rename this to do_stage()
> 
> given that only preferred-om-2008-versions.inc pins this to a specific
> version (0.8.10) i'd remove the "broken" version and .2 too, while at
> it:
> $ git rm recipes/libidl/libidl*0.8.{2,3}.bb && git commit -s -m 'libidl:
> Remove old versions' recipes/libidl/

You mean like I did yesterday:
http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=99f6333dd24a2a6eeeec0925a296906ee8145f92
?

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMWaHvMkyGM64RGpERAhpgAJ0UYyEIb2kDK6efkMqqWgXue19ydACghtIf
PDD0AeCmbUqFuh9oK5zYBLw=
=vt+b
-----END PGP SIGNATURE-----



