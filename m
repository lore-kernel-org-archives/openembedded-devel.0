Received: from mail-bw0-f217.google.com ([209.85.218.217])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NCHmF-0002Qb-An
	for openembedded-devel@lists.openembedded.org;
	Sun, 22 Nov 2009 20:07:18 +0100
Received: by bwz9 with SMTP id 9so4361716bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Nov 2009 11:05:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=YrUKCBQVrcrCtUlT8h+Fu+V0Mhy3f2U/zF1tNalKDU4=;
	b=Q0MCC32LreWtU9xWB5IxzWh0bmmbyqmiyRL1GKV75n6JtMpS/aZFLMysyV4WrDLa8Y
	yloTzBcIPu4eNY+ctovTfDrWBKe+30l6U63SktQa9GVbodEo6e+XWNKs7cY+PH1uuPPg
	zUY+uCq8ikBYWvHb/YdUO9gxroVpr3gp+TzpE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=ob5zo/TPrbWpWLENwt9I/ixcgSrdbk0UVxkKQHZzpuYcTmEIPdh/q8BHUMiQMk69r5
	u+xCIc+Q1/F+vig7kQgKemJfrD1/zOeWhvo+EJ4/BMrwiFpTbGQSMYudGMLYzR/kKET9
	OXrtH4oO6t45pUFCA+SHForl7jmmh3bvtGALw=
Received: by 10.204.19.146 with SMTP id a18mr3813645bkb.135.1258916747987;
	Sun, 22 Nov 2009 11:05:47 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 14sm1141851fxm.15.2009.11.22.11.05.46
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 22 Nov 2009 11:05:47 -0800 (PST)
Date: Sun, 22 Nov 2009 20:05:47 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091122190547.GC3349@jama>
References: <20091115163618.GA3317@jama> <hdr31n$8b0$1@ger.gmane.org>
	<1258364356.5799.94.camel@dax.rpnet.com>
MIME-Version: 1.0
In-Reply-To: <1258364356.5799.94.camel@dax.rpnet.com>
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
X-List-Received-Date: Sun, 22 Nov 2009 19:07:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

After longer IRC discussion with mwester I was persuaded to write some
summary of what SRCPV do and what's bad on SRCPV+BB_GIT_CLONE_FOR_SRCREV
combination.

SRCPV usage in svn recipes is safe, because subversion has sortable
revisions, so there is no problem with that and I won't write about it.

====

Why do we need AUTOREV for git recipes?

Every git recipe in OE tree should have some sane hash stored in
conf/distro/include/sane-srcrevs.inc
at least to make sure, that patches applied from that recipe will apply
to this known hash.

If some distribution is following upstream very close (ie freesmartphone
stack is developing pretty fast and to have latest features with same
stability you want to bump srcrev pretty often). This would create lots
of commits just changing SRCREV in sane-srcrev or some distro config in
OE tree and too much noise. That's why there is AUTOREV feature to
update to newest revision everytime you have that git recipe in dependency
tree.

AUTOREV can be dangerous as you cannot ensure that the recipe can be
even built (due to some upstream bug just commited or that patches in bb file
doesn't apply anymore).

That is why AUTOREV should be used only in for well justified recipes
end never enabled by default for any recipe.

Distributions or local builders can choose which packages will be using
AUTOREV in their distro config or local.conf. Insane builders can
include conf/distro/include/insane-srcrevs.inc where is lots of recipes
using AUTOREV.

====

Why do we need SRCPV for git recipes?

1)

Without AUTOREV the PV string looks like this
1.0+gitrDEADBEEFHASH
where PV in bb recipe looks like
1.0+gitr${SRCREV}
and in sane-srcrevs.inc is
SRCREV_pn-foo ?= "DEADBEEFHASH"

Even without AUTOREV we bump SRCREV from time to time to get new stuff
and when we change DEADBEEFHASH to BEEFDEADHASH in sane-srcrevs.inc or
somewhere else we want PV witch is higher than it was with DEADBEEFHASH,
which is not the case in this example.

That's why you can sometimes see PR used in PV string like this
PV="1.0+${PR}+gitr${SRCREV}"
and then every SRCREV bump goes with PR bump to ensure PV.old < PV.new.

2) 

With AUTOREV the PV string looks like this
1.0+gitrNNNN+DEADBEEFHASH
where NNNN is some localy incremented number which is incremented every
time you're building that recipe with different hash then last time.
Thats because we need sortable PVs for upgradable paths and from git
hash opkg/bitbake cannot see if DEADBEEFHASH > BEEFDEADHASH or
vice-versa.

3)

If we change PV in every git recipe in tree, we will always get PV
string in format
1.0+gitrNNNN+DEADBEEFHASH
and those NNNN will always ensure that PV.old < PV.new witch is great
and we don't need those ${PR} in PV right?

BUT!! as Koen promptly pointed pretty soon, before SRCREV->SRCPV migration 
could break OE tree. Really thanks for that! I really appreciate that, 
even thought it created more work for me and I need to write this rather 
long e-mail now :).

====

Problem with SRCPV

If your devices are using multiple feeds, built on multiple buildhost
across world (as angstrom does). Then locally increased number cannot
ensure non-decreasing PV between buildhosts. One builder can build some
recipe with changed revision every day and other will build that recipe
once a month. Then PV from first builder will be ie 1.0+gitr30+olderHash
and from second builder which just built newest Hash in sane-srcrevs
will get only 1.0+gitr2+newestHash.

The problem is not only in PV for that recipe and opk filename, but also
DEPENDS in .ipk file in recipes which depends on ie
1.0+gitr29+evenOlderHash which cannot be satisfied in feed from 2nd
builder even when there is package with newer hash!

In this case AUTOREV has same problem as SRCPV and is not used there.

How to ensure consistent PV across multiple builders?

1)

Never use AUTOREV + Never allow SRCPV merge :)

(I don't like this solution :))

2)

Never use AUTOREV + Use new LOCALCOUNT feature, which is now in bitbake
master and will be in bitbake before SRCPV merge.

http://cgit.openembedded.net/cgit.cgi/bitbake/commit/?id=2f32735463159e9e42e03819d6b505dba49c7f17

Instead of using ${PR} in PV you can now let SRCPV to hangle upgradable
paths for you. All you need to do is anable LOCALCOUNT feature for your
distro or whatever with
BB_LOCALCOUNT_OVERRIDE = "1"
and set default value for LOCALCOUNT
LOCALCOUNT = "0"

After this you will get almost the same PVs as before
1.0+r1+gitr0+DEADBEEFHASH
instead of
1.0+r1+gitrDEADBEEFHASH
and that 0 will be constant for you

To eliminate need for PR bump with every SRCREV change you need to put
LOCALCOUNT override for that package (I think it could be in
sane-srcrevs.inc with SRCREVS)

And with every SRCREV change, you'll bump LOCALCOUNT, ${PR} could/should 
be removed from PV, if you're providing LOCALCOUNT bumps.

Distributions which don't need to share feeds from multiple builders in
the same image, don't need to do a thing with LOCALCOUNT and upgradable
patch will be always provided for them.

But be carefull with persistent cache file
something like this:
tmpdir-dev-shr/cache/om-gta02/bb_persist_data.sqlite3

If you remove this file (ie for build from scratch), your counters will start
from 0 and you won't get upgradeable paths from images built before to
new feeds. You just need to backup this file and restore it before
building from scratch.

3)

You can get globally consistent revision number if you do
git clone git://repository
git rev-list $revision_you're_interested_in | wc -l

thats what bitbake do if you enable it with BB_GIT_CLONE_FOR_SRCREV

Problem with this is that it downloads whole git repository (huge load
on git repository servers) just to count how many revisions are in some
branch before your revision.

That's what it do now (without SRCPV merge) for every recipe you set to
AUTOREV. And this is done during recipe parsing phase (because we need
to know PV string for every recipe).

We all agreed that upstream server maintainers won't like us this way.

Also there is problem what revision number should be in PV if you're 
parsing OE tree when upstream git repository is not accessible or someone 
rebased branch there or just SRCREV doesn't exist anymore or is invalid.

This problem (accessing upstream servers during parsing) is elevated by
SRCPV, because SRCPV needs to know "revision number" everytime not only
for recipes set to AUTOREV.

Because of this I propose to BAN BB_GIT_CLONE_FOR_SRCREV unless someone
creates support in git for revision counting remotely without git clone
as git ls-remote does for checking if there is newer revision=hash available.

With patches I sent to this thread and RP prepared in bitbake/master
http://cgit.openembedded.net/cgit.cgi/bitbake/commit/?id=08e8144be8b564f2dea35c1680a4653f043ec2e2
bitbake will cache build numbers even with BB_GIT_CLONE_FOR_SRCREV
enabled and will count revisions only ONCE per SRCREV hash change.


====

What needs to be done?

SRCREV->SRCPV for subversion recipes was just formal and is merged
already.

SRCREV->SRCPV for git recipes needs those patches in new bitbake 
release forced by sanity check and SRCPV cannot be used before that.

All git recipes were converted to SRCPV in my short lived :) wip branch
martin_jansa/srcpv.

We need to bump PE with this change because
1.0+gitr01234DEADBEEFHASH > 1.0+gitr0+01234DEADBEEFHASH

I did it with SRCPV change for all recipes witch weren't in oe.dev when
I created that branch, new recipes added later to oe.dev from shr are
without PE bump, becase in that time I was sure that nobody built them
without SRCPV, now I cannot be sure, because they are already merged to
oe.dev with SRCREV now.

Also be carefull when bumping PE in git recipe that all versions of the
same recipe needs PE bump too. Without it git recipes have highest
versions and can be preferred instead of "newer" release versions". In
this cases I moved PE to .inc file if there was one and bumped it there
globally.

Kernel recipes are even more tricky, I bumped PE with SRCPV there too, 
but Koen warned me later (thanks again) that there needs to be consistent PE
even between different recipes, because multiple machines can share same
kernel recipe and machine can pick between multiple recipes with highest
PV? Hmm now I don't understand what you mean with kernel recipes in this:

<snip>
If something needs a PE bump, make sure you do it properly and bump PE
on the non scm fetched entries as well. For the kernel I wouldn't bump
PE, since too many machines can use different kernel recipes.
</snip>

====

Do we need something more?

Someone should summarize this too long mail to something shorter
more understandable :).

After bitbake with patches in sanity check we need ACK from all builder
which wants BB_LOCALCOUNT_OVERRIDE that they put it in their config with
default value for LOCALCOUNT, maybe warning with sanity check for
bitbake upgrade if its possible.

Something else I forgot to mention or even didn't think about?

Regards
-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


