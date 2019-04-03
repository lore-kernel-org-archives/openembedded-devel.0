Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 6B97C7D2D4
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Apr 2019 11:15:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44Z3QX5KbKz54;
	Wed,  3 Apr 2019 13:15:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1554290117;
	bh=mbjeuWlD/BOTdLmlA5Nr9yAn/YhBScelANAF56+9EDE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oVIhNHWxsyeieo3+gh6eyTREOD21xU0zSGfkf9DjoHhz8cI5MwQPZNQ/aLH3wYIAZ
	b4vqRG0w1oivFsMdLjb+zrf5GXxs+WGtyYp7bM9GGj9Exl2ToDS0r/7fEERKIRD2Tk
	cVC2btwGhulwK3lhaHnUzXbugWwfM4W0rDXUvNzIWfVpzc2HCRg84wKcJJPs5FvaKi
	NXF1V2lW+CmVWNcUIjjNq/FDHifI4djdYS4r6EkpKNzoXsTvPVHB84Co+IPCAAtZMk
	7yOddbpzePc+SHvitHABUumADmIK30dq/pnjAgjFeJOltHFO0Y5ozeBNUqG31H3+Uj
	lNJcuS2x3mpR1ohTa35kphVJ4On0qxlEFa2+tv2Jn/jtEz53Hgw0cRmnRkLr01Aq/2
	W5M7CrLKFaU0mH6kjyNmGRT1mPDWe3t+bxHt5iEs8DcCnHtqIoRqVKykhJhxRtfpwj
	ghBOLwsnJynfcUn4D2vXHOiw/Gb4cEusCO7coiISfy8WIpMMe2/NUgIv1rZjNQSFaD
	+vN5AJW5AslQBrGJjWDd7CElCfOxi7NsNgKu+zCNwqKc9bc8mRjGTB3f6amY0zhnYg
	oJnM/zPFIkO+1X436g5ps2Lloq86eSeNhdWiqz/2WqHytvw4qJG9ywmQiwpwr6JWeV
	UVwieglyNNDbv466B8Tf7xrM=
Date: Wed, 3 Apr 2019 14:15:14 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Vincent Prince <vincent.prince.fr@gmail.com>
Message-ID: <20190403111514.GA20836@localhost>
References: <1554280123-19112-1-git-send-email-vincent.prince.fr@gmail.com>
	<1554280123-19112-2-git-send-email-vincent.prince.fr@gmail.com>
	<20190403085651.GA6467@localhost>
	<CAB2nKc9hnDrOTtKjNfk1cupK0yv8xXksEuvURJtS6ve_baOpJQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAB2nKc9hnDrOTtKjNfk1cupK0yv8xXksEuvURJtS6ve_baOpJQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 2/3] cppzmq: bump version 4.2.3 => 4.3.1
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
X-List-Received-Date: Wed, 03 Apr 2019 11:15:17 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Apr 03, 2019 at 12:42:13PM +0200, Vincent Prince wrote:
> Then, it would need to rename cppzmq_git.bb into cppzmq_4.3.1.git or can we
> just remove +git${SRCPV} part of PV?
> 
> In following threads it seems first option should be chosen?
> https://www.mail-archive.com/openembedded-core@lists.openembedded.org/msg120575.html
>...

That is about putting PV in the recipe filename instead of "git",
in this case the discussion would be cppzmq_git.bb versus cppzmq_4.3.1.bb

I am not aware of anyone arguing against PV having a proper
version (without +git) for a release.

> Le mer. 3 avr. 2019 à 10:56, Adrian Bunk <bunk@stusta.de> a écrit :
> > On Wed, Apr 03, 2019 at 10:28:42AM +0200, Vincent Prince wrote:
>...
> > > diff --git a/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
> > b/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
> > > index 9aff59c..2f99417 100644
> > > --- a/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
> > > +++ b/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
> > > @@ -4,8 +4,8 @@ LICENSE = "MIT"
> > >  LIC_FILES_CHKSUM = "file://LICENSE;md5=db174eaf7b55a34a7c89551197f66e94"
> > >  DEPENDS = "zeromq"
> > >
> > > -SRCREV = "6aa3ab686e916cb0e62df7fa7d12e0b13ae9fae6"
> > > -PV = "4.2.3+git${SRCPV}"
> > > +SRCREV = "213da0b04ae3b4d846c9abc46bab87f86bfb9cf4"
> > > +PV = "4.3.1+git${SRCPV}"
> > >...
> >
> > These are the actual releases, PV should not say +git${SRCPV}
> > for them.
> >
> > Not a bug you introduced, but can be fixed now.
> >
> > cu
> > Adrian

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


