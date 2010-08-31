Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OqTVg-0004qg-1D for openembedded-devel@lists.openembedded.org;
	Tue, 31 Aug 2010 18:16:35 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OqTV9-0004fg-23 for openembedded-devel@lists.openembedded.org;
	Tue, 31 Aug 2010 18:15:59 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Aug 2010 18:15:59 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Aug 2010 18:15:59 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 31 Aug 2010 18:15:46 +0200
Message-ID: <i5j9ri$ie9$1@dough.gmane.org>
References: <201008271556.24288.schnitzeltony@gmx.de>	<201008301816.41691.schnitzeltony@gmx.de>	<i5ieth$qi2$2@dough.gmane.org>
	<201008311641.00363.schnitzeltony@gmx.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.11) Gecko/20100729 Shredder/3.0.7pre
In-Reply-To: <201008311641.00363.schnitzeltony@gmx.de>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH][v2] clutter: Bump revisions to latest stable & cleanup
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
X-List-Received-Date: Tue, 31 Aug 2010 16:16:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 31-08-10 16:41, Andreas Mueller wrote:
> On Tuesday 31 August 2010 10:36:01 am Koen Kooi wrote:
>> It is used to seperate the clutter api/abi change. 0.8 is parallel
>> installable with 1.0 (0.9 is 1.0rc), so the naming is there to support
>> both kinds of clutter.
>> What I wanted to do, but didn't find time for:
>>
>> 1) name the clutter 0.8 series clutter-*-0.8
>> 2) name the post 0.8 series clutter-*
>>
>> That should be safe to do since clutter 1.2 is supposed to be compatible
>> with 1.0.
> I would like to take care for this. Before I dive into it how about this schedule:
> 
> 1. remove very old recipes: clutter*svn*.  As far as I saw are the o-hand svn-sources for clutter no more available. Replace DEPENDS on clutter-cairo to clutter & cairo.
> 
> 2a. all recipes with v >=0.9 rename to clutter*_v
> 2b. all recipes with v < 0.9 rename to clutter-*-0.8
> 2c. recipes depending on clutter*: Those depending on v >= 0.9 will get DEPENDS on clutter* / those depending on v < 0.9 ( think it will only be recipes/gnome/libchamplain-gtk_0.2.8.bb ) get 
> DEPENDS on clutter*-0.8 ( maybe this can be changed later to clutter* )
> 
> 3. Add the recipes I made for latest stable versions
> 
> What do you think?

Sound like a good plan! FWIW, I think we should only keep 0.8.x, 1.0.x
and 1.2.x (1.0 and 1.2 should be compatible) to have a complete set to
compare things, the GLES engines tend to break from release to release,
so keeping a handfull of versions around is good practice.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMfSqyMkyGM64RGpERAgvqAJ9Swj/3YLsRb/DHmQfX9BpqT/OQYQCfVFfh
TxNfP9aLw209Lm/5KsMYeIw=
=lqGG
-----END PGP SIGNATURE-----



