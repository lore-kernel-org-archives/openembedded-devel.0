Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Rq3X2-0002hi-D3
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Jan 2012 15:09:00 +0100
Received: by vcbfk26 with SMTP id fk26so3582209vcb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jan 2012 06:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=VsPCSZJbq81z3R0ZpnyyXizpydYyxEWk/3dxHvceGSk=;
	b=RxtVd74a5Va/w8XqebAZIT0/XNEJCrlbGwKrcq4K959UpJHp/6p9AneFYawP21ayHk
	ic31C1nPY6jd28Km6qm5TyH23ZmLDkllvWpOgqRF1U7mAEJEcqfBVDtuIhyeHvOp3KW7
	7eF6CM038v483+PjdeFtlUE+BdSaSkQ/5glRI=
MIME-Version: 1.0
Received: by 10.52.26.199 with SMTP id n7mr9924687vdg.17.1327500073195; Wed,
	25 Jan 2012 06:01:13 -0800 (PST)
Received: by 10.52.67.171 with HTTP; Wed, 25 Jan 2012 06:01:13 -0800 (PST)
In-Reply-To: <1592899.mTy93uB97i@helios>
References: <1592899.mTy93uB97i@helios>
Date: Wed, 25 Jan 2012 15:01:13 +0100
Message-ID: <CACW_hTar2UAPp0JZ9o-7LOH+VKy-6AweXrmTEKiiy8feaEE0dQ@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Splitting meta-oe
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
X-List-Received-Date: Wed, 25 Jan 2012 14:09:00 -0000
Content-Type: text/plain; charset=ISO-8859-1

2012/1/25 Paul Eggleton <paul.eggleton@linux.intel.com>

> Hi all,
>
> The meta-oe layer [1] is becoming the home for additional recipes that we
> miss
> from OE-Classic that don't have another obvious layer to go into, and this
> is
> a good thing. However I think that meta-oe is already in a state where
> quite a
> few people feel the new structure is not working for them.
>
> As I see it, meta-oe is trying provide the following:
>
>  1) Additional recipes that are not in OE-Core
>
>  2) Additional functionality for OE-Core recipes that we can't enable in
> OE-
> Core itself (e.g. enabling postgres support in Qt) - mostly just a
> side-effect
> of #1
>
>  3) A place to preserve old versions of recipes that have been removed from
> OE-Core in favour of newer versions
>
>  4) Newer less-well tested versions of recipes
>
> I think what most people want when they enable meta-oe in their layer
> configuration is #1, and it's probably OK to get #2 along with it. They do
> not
> however expect versions of toolchains, eglibc or other fairly fundamental
> bits
> and pieces that might cause their build to fail when everything worked fine
> just building with OE-Core (#4). Equally I expect there will be some people
> who want just #3 and nothing else.
>
> I understand there is significant value in providing all of these things, I
> just think we shouldn't be trying to do them all in one largely indivisible
> layer. In our new layer structure we should be able to find a way to split
> the
> metadata so that people who want any combination can still have what we
> have
> in meta-oe today, and yet those who just want one of them don't get
> unexpected
> build failures or older/newer versions being built.
>
> Thoughts?
>
> Cheers,
> Paul
>
> [1] http://cgit.openembedded.org/meta-openembedded/tree/meta-oe
>
> --
>
> Paul, all,

I feel this is a good proposal.
We might also attempt to define some criteria on what should go in and what
not.

Some more finegrained comments:

#3 should probably not be needed (it might be as a temporary transient).
I would hope/expect that meta-oe builds with oe-core and what is in there.
If a distro needs an older version of something (for whatever reason) it
better should be in the distro overlay.
Ditto if a board needs an older version.
(btw and if it is for historical reasons: the old versions can always be
retrieved from git).
(Note that I see no problem if there is a drastic change that needs some
work in meta-oe where an old version is kept as a transient to keep things
working while working to move to the new version)

Wrt #4: that is indeed something that people do not always expect. I feel a
better place for these newer/less-stable recipes would be a oe-core-next
branch or tree (assuming we are talking about oe-core recipes)

Best regards, Frans

