Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 92E797C4BF
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Mar 2019 09:58:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44LyYh5YZvz5m;
	Sat, 16 Mar 2019 10:58:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1552730281;
	bh=jZX/y7RAf8R2lKvYD53ArsbzCioD7QsX7sas3SKReKY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=meRnIt6BjQ/tFTo7wYJPyczzKTyoy1bkHT61RnE00Avx0FmHfbvZTF6kvXvhzBlAZ
	j4ct3mXvUeJt+/Tq3bahjVS9f8dzdXfATJIHIDiahabBqQYZ5nxoqi8RNsphnKEJFp
	TOxo0lvxAhsdBIHaMGkvZvRKpmX/B+El36CK7Vk+25ZwLvHRgr0wnoPbrnM45TyW2X
	wlOOL0TLOmdhpL3P0agWDJfGbcShwMKefJBkoS4TRLmw799b9AnzRWRRKff7tBgUoM
	4a4ps/Um2vzLwei3NoTTD2WoczgmNEucFVdhxb/Q5Bs7ejwT40AYyvtUJah30UqtW8
	4YVMhwgeOeXwG6cpz5kM0LqkbBVeOHjBYYN6307lZgCThU6494v2m9U1YLdge9YUua
	zFt4vivi0mFC0tA/idwhYuIx84r1+Uh4Jdyp8RYO0dDx1YiF7CTvoNzpZmw/xZTGub
	UFEFWGdYGWJ8WFx+j2trXkeHPtzPXw+NdAUVHXDsdWtevRcB+OHYXiEcbE33UNtPNf
	nvkksNT/5y0QYCKhY3H7sdpphXWyKOabxvwPujLqn3YLZ5zdDY57wNNSACKAc/oe4Z
	cmdBnGW+O9JwIS3TBGaEy/d/VP2E9PKs9pxg0UDF1PRcA08urGSvOOMNWExgBrRsvm
	xxnOo5CLjkFB7THVPw24dszw=
Date: Sat, 16 Mar 2019 11:57:58 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Andreas =?utf-8?Q?M=C3=BCller?= <schnitzeltony@gmail.com>
Message-ID: <20190316095758.GB19622@localhost>
References: <20190316080428.36688-1-raj.khem@gmail.com>
	<CALbNGRQwWcwBjXPmtusLirywo=Tw2gV40PFDxCF6Kn8ZkS5F1A@mail.gmail.com>
	<CALbNGRRz4k-xRCBSOOF1PsoJ1p_porgc7kKcOoW4ctXCD9HFvg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRRz4k-xRCBSOOF1PsoJ1p_porgc7kKcOoW4ctXCD9HFvg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-xfce][PATCH] xfce4-mixer: Remove recipe
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
X-List-Received-Date: Sat, 16 Mar 2019 09:58:01 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Sat, Mar 16, 2019 at 10:31:56AM +0100, Andreas Müller wrote:
> On Sat, Mar 16, 2019 at 10:09 AM Andreas Müller <schnitzeltony@gmail.com> wrote:
> >
> > On Sat, Mar 16, 2019 at 9:04 AM Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > xfce4-mixer can be replaced with xfce4-pulseaudio-plugin
> > >
> > NAK - it works perfectly fine and xfce4-pulseaudio-plugin is not a
> > replacement because it is sitting on top of pulseaudio. Pulseaudio is
> > poison if you want to produce music (alll the jack based  stuff)
> >
> I am tired of useless discussions - seems the priorities of this
> project do not match mine anymore: I'll create a layer for gstreamer /
> xfce-mixer and all the music stuff I collected in meta-qt5-extra.
>...

Looking at the other recent commits in master-next the main motivation
for this patch seems to be
    gstreamer-0.10: Remove recipes
    It has been over 5+ years for migration to gstreamer 1.x

The actual problem seems to be unrelated to audio output, but this was 
the last recipe in meta-openembedded that required GStreamer 0.10.

> Andreas

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


