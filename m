Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OkvWv-0003Cx-Df for openembedded-devel@lists.openembedded.org;
	Mon, 16 Aug 2010 10:58:59 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OkvWc-0003h1-Cy for openembedded-devel@lists.openembedded.org;
	Mon, 16 Aug 2010 10:58:34 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Aug 2010 10:58:34 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Aug 2010 10:58:34 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 16 Aug 2010 10:58:22 +0200
Message-ID: <i4auje$u5g$1@dough.gmane.org>
References: <AANLkTikW6GsKga3=6dWUcviDJqb8WqVqhSmBw6vACM3e@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.11) Gecko/20100718 Shredder/3.0.7pre
In-Reply-To: <AANLkTikW6GsKga3=6dWUcviDJqb8WqVqhSmBw6vACM3e@mail.gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: cleaning recipes
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
X-List-Received-Date: Mon, 16 Aug 2010 08:59:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

You removed the default openssl version (0.9.8) without bumping PR for
recipes using that, so now my autobuilder is quite red due to do_rootfs
failures (among other build errors related to these removals).

I can really see how the quality of OE has increased due to removing
things. Good job.

On 15-08-10 16:59, Frans Meulenbroeks wrote:
> Dear all,
> 
> As some of you might have noticed I've been cleaning up our
> recipes.during the last week or so.
> As I had some time at hand this weekend, lots of cleaning has been done.
> I did my very best to stay within the guidelines of the TSC (as
> described in http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-May/020047.html),
> but it is quite possible that at some point I made a mistake or so.
> If so, let me know and I'll repair things and/or revert the commit. (I
> feel if you make a mess you should also clean it yourself).
> 
> Rationale for doing so is that it makes the tasks as listed in
> http://wiki.openembedded.org/index.php/OpenEmbeddedJanitors simpler
> (because less recipes need to be looked at).
> 
> As it stands the job is not done. I've mainly peeked at all recipes
> that had more than 10 versions.
> 
> I did not touch core directories like gcc, glibc/uclibc/eglibc,
> binutils, although I feel some pruging of old stuff would be useful
> there. E.g. is there still a use for gcc 4.1.0 ? )
> Then again these are typically well maintained and looked after, so
> there are probably hardly any issues that would require cleanup.
> 
> I also stayed away from core recipes like linux and u-boot (although I
> can imagine some version scould be deprecated. Also the policy on when
> to create a different recipe and when to modify an existing one is
> vague at best.
> Some harmonisation would be nice.
> 
> Then there are the opie dirs: bluelightning told me he would look into
> this and expire the older versions.
> 
> X related stuff was also left untouched JaMa told me he was looking into that.
> 
> And I skipped the ti dir. I would propose the ti people look into it.
> E.g. is there a need for 12 ti-xdctools recipes, 5 of wihch are pinned
> (and yeah, I understand that these probably are closely linked to a
> codec engine version, still 12 seems from a process point of view
> quite a lot)
> 
> Anyway, if there are issues because of this action, or if you feel
> removal of a recipe was not in accordance with the TSC guidelines, let
> me know and I'll repair.
> 
> Have fun!
> Frans

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMaP2uMkyGM64RGpERAjOWAJ9WJm8HhlfSwAgnQW2aBl8l8T0a7wCfebXQ
QBgE1zdw4WyTi9THZfejd2A=
=GUgf
-----END PGP SIGNATURE-----



