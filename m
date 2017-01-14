Return-Path: <leon@sidebranch.com>
Received: from mail-ot0-f173.google.com (mail-ot0-f173.google.com
	[74.125.82.173])
	by mail.openembedded.org (Postfix) with ESMTP id 74FFF6006E
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Jan 2017 23:41:09 +0000 (UTC)
Received: by mail-ot0-f173.google.com with SMTP id f9so24199022otd.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Jan 2017 15:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sidebranch-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=ifsRwIVzjsn/SQAj41Upk5SwRk7KsmIe/ELb7qQnR4U=;
	b=SZ44dySin3tzpf900tuUU5145J5CdfcMv8uBHNXy3PcZXglDN6mWTDrMjMX9uQAiiK
	0XfEEViKyFjHXHOZRFsw9Ei2B2Wz04m0uEIc5qhi/hbG1NFTs/I7BTN18fi0LEzxtjj3
	fZR7fOhRkSIzptb9Us4frMDknUGZ0dTPCj2HaZ/2H8dvnUQ9WjfZT+yb4NNn8j1+nWgy
	JJ1cpV8DeQRcWI+1p/9JM0bpps2C3gowNgSphaJLpMpgnZl1URvZN5mcIZovwjVULi3o
	3FL3778hQ4dZAzAgMYAasYzHTSslm1JhRRgG8zBYMIYvE1C9Rj5AsG5wkylfNwmiIi7Y
	jr2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=ifsRwIVzjsn/SQAj41Upk5SwRk7KsmIe/ELb7qQnR4U=;
	b=LLFnCIyrQiQY/wNZEiWtl5O2HNY/8kCP/9fpIL2DjBMNFRJOE/ECekc9cUDI2CR8Ho
	E8x5VYdaLJ7Nf1Mk7m9QJy3EYaX4k/68McuKO+vN2TseYmeoW6n+ZSg3X/kAAlMmXVkr
	X/VO5b0nRVkAGF7tZDUdBoUjCGXQuqO1dnvBD1TDb76Gfj/FImdUFxOg6rusASQdj4U8
	o4LAL0OJX++ipFsh0RMbP9S6kBJKSO7NqOaWHOjKla4YPEPeaDzY9SywU2OTyHXjqE5S
	LRyi/b6LRn+hwar9DMlxrhakzTrRBmi6AectfNoc2AJrkB6NxAwJJj2rJFCVFdp1JCwY
	jymw==
X-Gm-Message-State: AIkVDXJgnGV9zfFYArZNPDTkI2aGH7yP+UKLSjM7mOK8pBK7xQYpwN52S1WQr0OZ8fASlgUEYtb4bG8Gje3R6A==
X-Received: by 10.157.8.248 with SMTP id 111mr12104339otf.83.1484437270074;
	Sat, 14 Jan 2017 15:41:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.48.108 with HTTP; Sat, 14 Jan 2017 15:41:09 -0800 (PST)
In-Reply-To: <7c171e1a-7151-6e6a-cfb9-7a06b9dec0df@gmail.com>
References: <CAMjhiJiu5isiTgwjrQtigKrvY7NzgdB5bsrn8bbxXu8q7W=bKw@mail.gmail.com>
	<7c171e1a-7151-6e6a-cfb9-7a06b9dec0df@gmail.com>
From: Leon Woestenberg <leon@sidebranch.com>
Date: Sun, 15 Jan 2017 00:41:09 +0100
Message-ID: <CAMjhiJg64VtLByh0sv2=d+xu7LJ6LHBccP-0A8Y7Q54XGAa91Q@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org, Chen Qi <Qi.Chen@windriver.com>
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
X-List-Received-Date: Sat, 14 Jan 2017 23:41:11 -0000
Content-Type: text/plain; charset=UTF-8

Hello Khem,

I know outside of OE it is more and more common place, such as Project
Atomic.

Re-reading some of the material I have found, I found that Chen Qi of Wind
River had something going.

http://lists.openembedded.org/pipermail/openembedded-core/2014-December/099616.html

>* > Several days ago, I tried to do /usr merge in OE (like what Fedora and
*>* > Arch does). It turned out that we need to patch several packages to make
*>* > things work.
*>* >
*>* > (I haven't sent out the patches because it's just some initial
*>* > investigation and I'm not sure if people want this feature or not.)
*>* >
*>* > If you want this feature in OE, please open a bug/enhancement in
*>* > bugzilla https://bugzilla.yoctoproject.org/
<https://bugzilla.yoctoproject.org/> to see if the community
*>* > wants it or not.
*>* >
*>* > Regards,
*>* > Chen Qi*

and in Yocto an enhancement is going for usrmerge:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=7040

and stateless:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=9527

Regards,

Leon.

On Sat, Jan 14, 2017 at 10:59 PM, Khem Raj <raj.khem@gmail.com> wrote:

>
>
> On 1/14/17 11:45 AM, Leon Woestenberg wrote:
> > Hello all,
> >
> > more and more I am liking the approach taken by SuSE snapper (incremental
> > but atomic updates using light-weight snapshots on BTRFS) and OSTree
> > (incremental atomic updates using a GIT like approach on the source,
> bsdiff
> > for delta updates).
> >
> > These are targeting -- but also require -- systems that use the "/usr
> > merge" approach, which is a bit controversial, but seems to fit many
> > today's use cases; embedded, containers etc.
> >
> > GNOME Continuous uses OpenEmbedded with OStree.
> > Automotive Grade Linux has started to use Yocto with OSTree.
> >
> > Looking back in the mailing lists, I have seen interest and activities in
> > and around OpenEmbedded Core since 2013 to support /usr merge, but I am
> > unaware of any upstream support for this, or distro's that implement it.
> Am
> > I missing something?
>
> I know archlinux based distros are already symlinking /bin and /lib
> /sbin to their counterparts in /usr but I am not sure once you remove
> these symlinks things will keep working as usual as there will be a set
> of packages assuming these paths and so on.
>
> >
> > Are there any developers here who do use OpenEmbedded with a /usr merge
> > approach?
> >
> > Regards,
> >
> > Leon.
> >
> > Some random links I came across:
> > http://lists.openembedded.org/pipermail/openembedded-core/
> 2014-December/099616.html
> > https://patchwork.openembedded.org/patch/89069/
> > http://lists.openembedded.org/pipermail/openembedded-core/
> 2013-August/083595.html
> > https://www.freedesktop.org/wiki/Software/systemd/TheCaseForTheUsrMerge/
> > https://patchwork.openembedded.org/patch/111129/
> >
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

