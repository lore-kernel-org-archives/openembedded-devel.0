Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 3EDDD7F24A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Jul 2019 16:15:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45xSb322cGz2C;
	Sun, 28 Jul 2019 18:15:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1564330511;
	bh=mkqnvrMU2wiLy/d7Ul14HiKXEdxT6xkMByf2rEUK/bc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tygi5E71bzaRMEyYJiOaavo0mjx7/FoH0954+aYs3hmYps/TG/hJi/gZYsm8c1hwD
	t9WAz6MWPKkUWFTdqlT+5EuoMqiTX42nsEpGT7GIschmJvQMuPVi+yUIWgEGRo0GbD
	7GT0wYaO8lKGYzUDPMgaOlLPGhmKjiqOgxFaV+TalmpqxNuEw9bak3wz4/jf9l2z5E
	vksV0Oy9mLYI2Knguo/WacxAYX03k5r2y29sg3lxSJ+wC92TLU0CDYeu1WwmO0dAfR
	lNy9MkaORyMQKVHVGYpkpCZI7iVRUNB96JAIAe0/XuHYBDqK5l86S0f3lw8f7+hGDY
	qX6PeS9rPI8duK+KyxE1jGzoGPVyF7K7AlrC5RsD5LbFQ/fgp2OgKOGSYaBdx7S22X
	To3Z/fwPfNXixUd2eiNpBn6pZwmC0e5h4dfZ+TINk2wGYT6Jtj7yEjHM7z5s+NeHnO
	9ap4LKXbGuMBT94FRNFZwHKeTXbnUBEzcQBSk9A1d75zFl/dFqlW2bucumz90Z5yaR
	XEvjFn8/hOAgsV+upFOI0MVynhIM8IN6sQSDI3vhZxdToRLWREKBV/kzE5WaV5v/OR
	hgJQdxNMZq5kjnXcUW9L8ch8dd0sfat0mApZfpbUO2mpxL2nJs7BT1dRM/URsWdvE/
	wjv7cRDXKkx8jiI5O+uTLEY0=
Date: Sun, 28 Jul 2019 19:15:09 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190728161509.GA12635@localhost>
References: <20190727200614.5661-1-raj.khem@gmail.com>
	<20190728093741.GB15666@localhost>
	<70043baa-9e74-53c0-c22c-0fd6fad7383b@gmail.com>
MIME-Version: 1.0
In-Reply-To: <70043baa-9e74-53c0-c22c-0fd6fad7383b@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 1/2] collectd: Fix build with glibc 2.30
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
X-List-Received-Date: Sun, 28 Jul 2019 16:15:12 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sun, Jul 28, 2019 at 08:26:18AM -0700, Khem Raj wrote:
> 
> On 7/28/19 2:37 AM, Adrian Bunk wrote:
> > On Sat, Jul 27, 2019 at 01:06:13PM -0700, Khem Raj wrote:
> > > ...
> > > +Glibc 2.30 has added deprecation notice and collectd detects it as
> > > +warning
> > > +
> > > +Fixes
> > > +sys/sysctl.h:21:2: error: "The <sys/sysctl.h> header is deprecated and will be removed." [-Werror,-W#warnings]
> > > ...
> > This package accumulates patches in OE that could be avoided by
> > configuring with --disable-werror instead.
> 
> thats true but it would mask these issues by disabling werror and we wont be
> doing submissions like https://github.com/collectd/collectd/pull/3234,

With what range of glibc versions has this submission been verified?

Putting !defined(__GLIBC__) into source files is usually wrong,
and in this case it is unclear what happens with ancient glibc versions.

Note that --disable-werror would do the right thing will all glibc 
versions past, present and future since the file will no longer be
included without any patch needed once the header is actually gone.

> I would like us to fix things upstream instead of masking them.

Status quo is that people look at harmless issues like this one in the 
tiny subset of packages where -Werror is used, but noone seems to care 
about serious runtime problems like implicit function declarations in 
other packages.

And looking at the huge number of questionable patches in OE I don't 
agree that it would in general be a good idea to apply fixes for random 
issues in OE before they have been applied upstream - there are plenty 
examples in the open source world where downstreams "fixing" issues in 
upstream software caused problems, including major security issues
(I remember Debian/Ubuntu releases shipping a patched openssl generating 
predictable private keys due to a bogus Debian "fix" for a Valgrind warning).

Reality is often more complicated, but in general downstream 
distributions should try to avoid touching the upstream code
and aim at shipping unpatched upstream sources whenever possible.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


