Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1O6HzJ-000379-M9 for openembedded-devel@lists.openembedded.org;
	Mon, 26 Apr 2010 08:40:14 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1O6Hvo-0000WF-Rk for openembedded-devel@lists.openembedded.org;
	Mon, 26 Apr 2010 08:36:36 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Apr 2010 08:36:36 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Apr 2010 08:36:36 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
connect(): No such file or directory
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 26 Apr 2010 08:36:28 +0200
Message-ID: <hr3c9d$rg6$1@dough.gmane.org>
References: <hr25nh$nft$1@dough.gmane.org>
	<1272234950.19634.30.camel@andromeda>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.9) Gecko/20100412 Shredder/3.0.5pre
In-Reply-To: <1272234950.19634.30.camel@andromeda>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: a38e7ff2810e55455c7ff7b01d4882344b420e18 breaks build and packaged-staging, among other things
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
X-List-Received-Date: Mon, 26 Apr 2010 06:40:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 26-04-10 00:35, Michael 'Mickey' Lauer wrote:
> Am Sonntag, den 25.04.2010, 21:38 +0200 schrieb Koen Kooi:
>> bitbake something-depending-on-vala-stuf
>>
>> is now broken because bitbake will run
>> something-depending-on-vala-stuf.do_configure and compile after
>> vala-stuff.do_populate_staging and the vapi files will NOT be there.
> 
> Can you give a concrete example that breaks? I'm using quite a
> substantial amount of Vala e.g. in task-fso2-compliance and it builds
> from scratch without any problems.
> 
>> The other problem is that the packaged-staging packages won't contain
>> the vapi files, so rebuilding staging it broken as well.
> 
> Ok, since the patch was made to get rid of all the 'legacy staging'
> warnings, would do_install_append() instead of do_stage_vapi() fix that?

No, since you can't poke outside ${D} in do_install. I think the best
solution is to have the vala compiler look in the arch dir it's
compiling *for* instead of the host one (STAGING_DIR instead of
STAGING_DIR_NATIVE).
Think of vapi files as m4 macros and you'll see why the current and
previous situation are completely wrong.

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFL1TRsMkyGM64RGpERAu55AJ4x6nIQFKdpxG3eTlDj/TPkJXGQ3gCfXA4p
Cte/6tg05/eQ+k7cBVyOCyg=
=J875
-----END PGP SIGNATURE-----



