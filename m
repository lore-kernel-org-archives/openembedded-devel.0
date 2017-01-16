Return-Path: <leon@sidebranch.com>
Received: from mail-oi0-f49.google.com (mail-oi0-f49.google.com
	[209.85.218.49])
	by mail.openembedded.org (Postfix) with ESMTP id EB89671A84
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jan 2017 13:45:49 +0000 (UTC)
Received: by mail-oi0-f49.google.com with SMTP id w204so100929285oiw.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jan 2017 05:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sidebranch-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=/6ty9GEBT8HyGbtqHhv1bcyer+BbUJo77dxXdxauHUc=;
	b=OzhV3D9LJxhibVaXgABFvU/HoUdzbKgP38VSDxROqMk1jc8XxUBnK65yphk7kCH5Lp
	mBZ+qeHwf01edi7P3bCrrVKm5gMJs8FoQBvBMJ63yLWhtRmQUd88it9cX4A/o5Jjx4cR
	fcJmdjgEm009ux8EZrcMcK0u/+b4sIrpEfX025zvDpOZNjRv4DYlhbtzcpzhUfzfElWe
	q18LoyjpwPYQYEB7ViD4SkO833Irme4ephwk2yCYhKBilRSxxk0o2PAhVLQOG3YGajgs
	YwORGXgxON0xe0/1gtWbHUL+TzLdnfX8bNS+6fUTk7+I6dg4BeaHDKJMRHSHxn/sQ6hd
	Vnew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=/6ty9GEBT8HyGbtqHhv1bcyer+BbUJo77dxXdxauHUc=;
	b=mFPZUq+/d/OYbE6koAJkzeXFzAzPLBO/klQlCfMt/J0i0vZSrMiQ3OtTvx3m9vYvNN
	a7YuCVyFrJghtnh5ILMhsnC0y40kPxOIRPibakoKfbe+F/mRW24yMmhrduBmRIc6G4aQ
	rOgJ4RQPipJ7Cb3Yp9eLr9dN6qjkz17GXi9j/q4+ssHeo/34bU6bFvoHzSC7DgbuxKaQ
	VYZd99eZcTzGuzj/bfYaKyGVOx2nAlXI3ovUevz2i/EUjXhxkK1VptG4G9qFiyZcOTwa
	tRdZSX7Pg7jdyKBY6I0aKlKk+8qxelZGr09CY1PpsGm7o68rY55L/sPZHnMTZjjnAe7r
	vExA==
X-Gm-Message-State: AIkVDXIgEn0dIPXp7OFIWaqVtt34/HurFp6xeoWfUYa0ERBQWddAdBNyxQmS1gmCMbwko724smjw3cCjPkKWIg==
X-Received: by 10.202.205.74 with SMTP id d71mr14740411oig.120.1484574349864; 
	Mon, 16 Jan 2017 05:45:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.48.108 with HTTP; Mon, 16 Jan 2017 05:45:49 -0800 (PST)
In-Reply-To: <CAHiDW_F9_OwNakT-Jt=oAP6Pbc0XbZebqRVsEonSEck-Zd9orw@mail.gmail.com>
References: <CAMjhiJiu5isiTgwjrQtigKrvY7NzgdB5bsrn8bbxXu8q7W=bKw@mail.gmail.com>
	<7c171e1a-7151-6e6a-cfb9-7a06b9dec0df@gmail.com>
	<CAMjhiJg64VtLByh0sv2=d+xu7LJ6LHBccP-0A8Y7Q54XGAa91Q@mail.gmail.com>
	<CAHiDW_F9_OwNakT-Jt=oAP6Pbc0XbZebqRVsEonSEck-Zd9orw@mail.gmail.com>
From: Leon Woestenberg <leon@sidebranch.com>
Date: Mon, 16 Jan 2017 14:45:49 +0100
Message-ID: <CAMjhiJjUgr=_TYo79rx-Ua_+tOM9k9s5UJ4yAaJ9V2DoiD_5JA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: /usr merge, stateless systems and atomic updates w/ OpenEmbedded?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Jan 2017 13:45:50 -0000
Content-Type: text/plain; charset=UTF-8

Hi Jussi,

thanks. The folks at Automotive Grade Linux (AGL) seem to use 2) in a
working proof-of-concept order to support OSTree-based (bare-mode) rootfs
updates in Yocto / OpenEmbedded Core but I am not aware of any package
fix-ups.
The links are created in their image generation step. (*)

I was test driving with 2) as well, but I think 1) is the cleaner approach
in the longer run. I would be glad to help out fixing/testing, as I am
interested in getting OSTree/usrmerge/stateless combo going on OE.

Stateless is indeed another beast, as is OSTree support (*).

Regards,

Leon.

(*) https://github.com/advancedtelematic/meta-updater



On Mon, Jan 16, 2017 at 1:52 PM, Jussi Kukkonen <jussi.kukkonen@intel.com>
wrote:

> On 15 January 2017 at 01:41, Leon Woestenberg <leon@sidebranch.com> wrote:
>
> > Hello Khem,
> >
> > I know outside of OE it is more and more common place, such as Project
> > Atomic.
> >
> > Re-reading some of the material I have found, I found that Chen Qi of
> Wind
> > River had something going.
> >
> > http://lists.openembedded.org/pipermail/openembedded-core/
> > 2014-December/099616.html
> >
> > >* > Several days ago, I tried to do /usr merge in OE (like what Fedora
> and
> > *>* > Arch does). It turned out that we need to patch several packages to
> > make
> > *>* > things work.
> > *>* >
> > *>* > (I haven't sent out the patches because it's just some initial
> > *>* > investigation and I'm not sure if people want this feature or not.)
> > *>* >
> > *>* > If you want this feature in OE, please open a bug/enhancement in
> > *>* > bugzilla https://bugzilla.yoctoproject.org/
> > <https://bugzilla.yoctoproject.org/> to see if the community
> > *>* > wants it or not.
> > *>* >
> > *>* > Regards,
> > *>* > Chen Qi*
> >
> > and in Yocto an enhancement is going for usrmerge:
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=7040
>
>
> Hi Leon,
>
> Me and Amarnath Valluri have been testing "merged /usr" this month: I
> expect there will be a oe-core patchset for review later this week -- I'll
> CC you when that happens.
>
> The possible approaches seem to be:
>  1) Modify $base_bindir (et al) so that all recipes actually install under
> /usr/, fix recipes that misbehave
>  2) Don't modify $base_bindir (et al), just make sure the symlinks (like
> /bin -> /usr/bin) are there when packages are installed on the rootfs
>
> Both approaches have some package management related issues but can be made
> to work (we're leaning towards #1 at the moment).
>
> I'm not promising anything about Stateless yet.
>
> Jussi
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

