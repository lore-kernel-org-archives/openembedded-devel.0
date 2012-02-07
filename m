Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Ruu2j-00064Q-0g
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Feb 2012 00:01:45 +0100
Received: by pbbb4 with SMTP id b4so30732pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Feb 2012 14:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=V6M5SbbK5cdMscwUPfZ29zAQsRCxickFeSeFmCX9K58=;
	b=F3/nDVLyLChieVb0QP7wZicpd8CH1MvCXDpuhmSzJWBcD/Bs3bT2f56r8voSJr1vhT
	8EOkWqE2+3Hz4n15DgPKcycpmg1nDDJhW64F8Eno8zjSWRwxrc1NOh2mhaLeKorIVNkF
	CwutcqUGd9/NlwRI6j1ZDWbNph9A0J15WQ82E=
Received: by 10.68.134.35 with SMTP id ph3mr61832142pbb.29.1328655221652;
	Tue, 07 Feb 2012 14:53:41 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-142-235.lightspeed.sntcca.sbcglobal.net. [99.57.142.235])
	by mx.google.com with ESMTPS id p2sm174988pbb.14.2012.02.07.14.53.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Feb 2012 14:53:40 -0800 (PST)
Date: Tue, 7 Feb 2012 14:53:27 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120207225327.GD13125@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <1328627573-5217-1-git-send-email-schnitzeltony@googlemail.com>
	<1328627573-5217-3-git-send-email-schnitzeltony@googlemail.com>
	<2290568.0amlKfqkN1@helios>
	<CAP9ODKq7OCzMmUgN3hMuZKOghrr=noBShWd+4XxEz_zPuusLfQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKq7OCzMmUgN3hMuZKOghrr=noBShWd+4XxEz_zPuusLfQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [meta-oe][RFC 02/27] initmanager.bbclass: inital add
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
X-List-Received-Date: Tue, 07 Feb 2012 23:01:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (07/02/12 13:57), Otavio Salvador wrote:
> On Tue, Feb 7, 2012 at 13:39, Paul Eggleton
> <paul.eggleton@linux.intel.com>wrote:
> 
> > Would it be possible to turn this on its head and merge
> > systemd.bbclass/update-rc.d.bbclass into one so that it does the
> > appropriate
> > thing for whatever INIT_MANAGER is set to for every recipe that uses it?
> >
> 
> I'd say initmanager.bbclass ought to inherit both and handle the packaging
> for both. As Koen said, I'd prefer to have it as an image decision not an
> distro decision. We might not build one, if distro drops the feature but by
> default both ought to be build IMO.

some of packages depend on availability of one or another e.g. systemd
if present some recipes compile one way otherwise not
so a distro using same tmpdir to spit out two images with two different
init managers can be a challage


