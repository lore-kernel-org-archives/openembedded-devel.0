Received: from mail-lpp01m020-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Rv77t-0007t6-TI
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Feb 2012 13:59:58 +0100
Received: by lbol12 with SMTP id l12so227084lbo.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Feb 2012 04:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=wl1/f7IirKmmkTvGtBSZfVXFkkmCOHaDGOqpM/aXjkA=;
	b=MuaeW5BZ78gGO7GqwhlHgMl7afI1eYOkozQu8MCb+6vaeQ7I2dJnZTUNZ0qhxjigkr
	JYaVqE4YSR4bZe86/4tITdPF1LDVsGVJhE/ybhqE4jhsgPqdPaMSz157DvDFZewgmvQM
	zETrzc1NFPEN621ZlrIpbh5nN8zsZURWRkpa8=
MIME-Version: 1.0
Received: by 10.112.84.170 with SMTP id a10mr7897225lbz.22.1328705514468; Wed,
	08 Feb 2012 04:51:54 -0800 (PST)
Received: by 10.112.102.165 with HTTP; Wed, 8 Feb 2012 04:51:54 -0800 (PST)
In-Reply-To: <jgtov9$fhv$1@dough.gmane.org>
References: <1328627573-5217-1-git-send-email-schnitzeltony@googlemail.com>
	<CAP9ODKpi+WWUuf7iP8QgJK2vgmM3KAgS0Fkhbu3eEy80L2eszA@mail.gmail.com>
	<4F31C45B.1010600@linux.intel.com> <jgtb5c$8oh$1@dough.gmane.org>
	<CAP9ODKpDe4Up_mCuRdTqNY6a-Kkxyz2ZR-GR9uQ+VFFW0HGsJQ@mail.gmail.com>
	<jgtl0v$gd6$1@dough.gmane.org>
	<CAP9ODKp7S2+HR3umrnd9RzT5JE0X_T_cjWPzi6S5WUdZ-SAzoQ@mail.gmail.com>
	<jgtov9$fhv$1@dough.gmane.org>
Date: Wed, 8 Feb 2012 13:51:54 +0100
Message-ID: <CALbNGRQOjKkbYCE9ky6ZfNypCO9eNEsgmjPC_LaXduWb-eptnw@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][RFC 00/27] systemd / initmanager rework
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
X-List-Received-Date: Wed, 08 Feb 2012 12:59:58 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Feb 8, 2012 at 1:14 PM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> That is why I want to make an exception for polkit and udisks to keep
> initmanager selection an IMAGE_FEATURE combined with DISTRO_FEATURE. A
> distro maintainer can then choose to support one or more initmanagers and in
> the case for multiple it can be set per image.
>
> regards,
>
> Koen
I haven't the point: why do we need such quirks to keep initmager an
image feature? Could you please help me out here?

FYI one of my tests was to build the image I usually work with configured as

INIT_MANAGER = "sysvinit"

and systemd isn't build at all - so no need to take care at specific
recipes: They will configure for what I (or the distro) want them.

Please see INIT_MANAGER as distro feature. I did not add it to the
collection of DISTRO_FEATURES to avoid setting multiple initmanages.

Andreas


