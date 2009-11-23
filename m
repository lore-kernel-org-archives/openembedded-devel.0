Received: from mail-bw0-f217.google.com ([209.85.218.217])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NCUgk-00042K-OF
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Nov 2009 09:54:29 +0100
Received: by bwz9 with SMTP id 9so4606094bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Nov 2009 00:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=kOw73Y/e5H2QimLazf0AbludKeLrXl9yUBucezQvSNI=;
	b=jjSxuwKY6pgc6dV9r8m/cgSPp8A6UnlUIboOhoJHb6LeJFixKSRyIkFLIpJ0YJBR20
	wFwP+nVHPOB9J6V8TK0NxGz+y+lT7oT+wWnQmdp4ULtOyXdbVQ9TGtfv/mssKLuOQjOP
	QOBlQwjll2GFlhn3tQqVzTFnRIwUinWykXi5I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=s704CrGze9GPCEo6KqJdFtHR40iuiZSA1b3zOIZD504jAa8sQWUdoAGfrbCVGLoVJ0
	F9f2nHs8G5QNG2Z4pwJ3zA9pUPI4wh6MYZoz5E0kXyxQYtTNL7qh4KF1/Jv7RX0RN+Kt
	XytvLIMCgP4BC1ww4bLgdC1sGJ3oz+s42qNuQ=
Received: by 10.204.35.11 with SMTP id n11mr2413162bkd.40.1258966378884;
	Mon, 23 Nov 2009 00:52:58 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 16sm1289328fxm.0.2009.11.23.00.52.57
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 23 Nov 2009 00:52:58 -0800 (PST)
Date: Mon, 23 Nov 2009 09:52:59 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091123085259.GD3349@jama>
References: <20091115163618.GA3317@jama> <hdr31n$8b0$1@ger.gmane.org>
	<1258364356.5799.94.camel@dax.rpnet.com>
	<20091122190547.GC3349@jama> <hedfru$gol$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <hedfru$gol$1@ger.gmane.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: SRCPV migration - How SRCPV works!
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
X-List-Received-Date: Mon, 23 Nov 2009 08:54:29 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 23, 2009 at 09:07:26AM +0100, Koen Kooi wrote:
> On 22-11-09 20:05, Martin Jansa wrote:
> 
> >Every git recipe in OE tree should have some sane hash stored in
> >conf/distro/include/sane-srcrevs.inc
> 
> The cabal decided that checksums are "part of the metadata" and
> belongs in the recipes. I don't understand why SRCREVs are so
> different. For SRCREVs my life would be a lot easier if all SRCREV
> where put in their respective recipes. Distros can always do
> 
> SRCREV_pn-foo = "bar"
> PV_pn-foo = "1.2.3+gitr$SRCPV"
> 
> in their distro.conf if needed. Due to scoping we do need some
> include for EFL_SRCREV, since those recipes are tightly tied
> together.

Sorry, I didn't intend to make all srcrevs in sane-srcrevs.inc.

I should write it a bit longer:
"should have some hash stored somewhere ie in sane-srcrevs.inc (which is
included probably in all sane distros) or in recipe itself.
If the SRCREV is defined ONLY in file like shr-autorev.inc (as we had some),
then all other distributions won't get defined SRCREV for that recipe
and fail to parse it."

> > Kernel recipes are even more tricky, I bumped PE with SRCPV there too,
> > but Koen warned me later (thanks again) that there needs to be
> consistent PE
> > even between different recipes, because multiple machines can share same
> > kernel recipe and machine can pick between multiple recipes with highest
> > PV? Hmm now I don't understand what you mean with kernel recipes in this:
> >
> > <snip>
> > If something needs a PE bump, make sure you do it properly and bump PE
> > on the non scm fetched entries as well. For the kernel I wouldn't bump
> > PE, since too many machines can use different kernel recipes.
> > </snip>
> 
> Basically: if you bump PE for one kernel recipe, you need to bump PE
> for all of them, so I guess it should be done in e.g. kernel.bbclass
> or linux.inc.
> 
> Imagine I use a git kernel for 2.6.32rc6 and then add a recipe for
> 2.6.32, I'm fairly sure I'm going to forget to add PE in 2.6.32 the
> first time.

Ah ok, now I see, thanks.

> > But be carefull with persistent cache file
> > something like this:
> > tmpdir-dev-shr/cache/om-gta02/bb_persist_data.sqlite
> 
> So if I build pixman_git.bb for om-gta02 weekly, but monthly for
> beagleboard or om-gta01 I'll also get different numbers, right?
> I think the count should only be in a machine specific database if
> the SRC_URI/SRCREV is machine specific.

If you want have consistent buildnumbers across machines, ie to see that
0.1+gitr12+hashA on om-gta01 is really newer than 0.1+gitr4+hashB on
beaglebord, I think you can point PERSISTENT_DIR variable to directory shared 
by all your builds.

But I'm not sure if there is some problem with it.
Only data I have there now is
BB_URI_HEADREVS    - latest revisions for autorev packages
BB_URI_LOCALCOUNT  - last built revision + last buildnumber

But there is also just url like this
git:gnuradio.org.git.balister.git-gnuradio_rev|bf7ad4d17514aba9fc5209bc916ce37482f77eaa
git:gnuradio.org.git.balister.git-gnuradio_count|0

I guess we should put at least also branch to key column (not sure how 
to easily migrate those revs already stored without parsing recipes which 
stored original value, but we can still store new revisions with branch
and look for last ones first with branch and if not found with old key)

Hmm sorry now I see that shared PERSISTENT_DIR can be much worse,
because if you have
SRCREV-pn_BLAH_om-gta01 = "hashA"
SRCREV-pn_BLAH_om-gta02 = "hashB"
then every rebuild will increment _count every time you build still the
same revisions hashA and hashB but once on gta01 and once on gta02. But
I think this is not addressed by bumping ${PR} too, because I will have
BLAH-0.1-r1-hashA on gta01 and BLAH-0.1-r1-hashB on gta02 right?

It can be still solved by schema
url, rev, count to get _count for every particular _rev ever built for
you

and
last used rev in another table with url_branch_machine key (I guess easy
to implement) or in machine specific another PERSISTENT_DIR (messy to
have 2 PERSISTENT_DIRs, harder to implement)

Do we need this now, or can be LOCALCOUNT override used for this too?

> regards,

Regards,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


