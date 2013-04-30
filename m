Received: from mail-we0-f170.google.com ([74.125.82.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UX6sq-0005nl-6Z
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Apr 2013 11:30:08 +0200
Received: by mail-we0-f170.google.com with SMTP id z53so236560wey.29
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Apr 2013 02:12:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=Ulz5L84xzlGne2CIXlXSGzCfz5ftVgum13QRV6P3ynY=;
	b=iM7U3Xkt8Lo+3xn8cTzwSNNX2X4rz/3VtTLYejtNxvtxDgKaOuxHXkedvy0yeHSWGK
	WCYJHcIwUpIZsxp88qgqDYHpFgTKu/TIkMHUp3NAcGkahMPajmNdFXUcPe80PMK3wNNi
	2lMH1yMosVWCZ2aHg27LLLnxavp7BlGw80y3E1WCUdH3m5f0CsnvtZQF/8Cpe9A2v74P
	lx4pTS3UvFOd3GTlzVKBjnj2xTxacdvWmo1cpTiLnBhh+A9qRb+HSIMuVQ+wMWy50Pvj
	dNGDWEMQKZRONV0cieLWqV5Fx8AGlUm5vUs9awjKwt1qhE2yUlJgtiFgJEJ8G9joRNJT
	VbKw==
X-Received: by 10.180.88.33 with SMTP id bd1mr22913065wib.18.1367313122015;
	Tue, 30 Apr 2013 02:12:02 -0700 (PDT)
Received: from [172.20.0.3] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id bu18sm1079220wib.1.2013.04.30.02.11.59
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 30 Apr 2013 02:12:00 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CALbNGRRndfF8dvQhtnSgzcE-72KGOP4tb5BQx_Z-205Dr2prGw@mail.gmail.com>
Date: Tue, 30 Apr 2013 11:11:59 +0200
Message-Id: <ABE1F3FA-9C6C-4B22-88CB-860E6311BD13@dominion.thruhere.net>
References: <CALbNGRRndfF8dvQhtnSgzcE-72KGOP4tb5BQx_Z-205Dr2prGw@mail.gmail.com>
To: =?iso-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQkeHE7ivnfdVL6oHSxoEeK7Ss5mVk/S2aE53kVLWOJ0XOwqAgPJXoxeQ7lMl2JiGV+FiLWY
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] udev-extraconf conflicts
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
X-List-Received-Date: Tue, 30 Apr 2013 09:30:30 -0000
X-List-Received-Date: Tue, 30 Apr 2013 09:30:30 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 29 apr. 2013, om 23:03 heeft Andreas M=FCller =
<schnitzeltony@googlemail.com> het volgende geschreven:

> Hi,
>=20
> is it really necessary to add udev-extraconf to systemd RRECOMMENDs?

Most certainly not!

> For me automount.rules turn gvfs/gio (auto)mount to unusable state.
> I bet there are others (see autonet.rules) failing for hidden =
'helpers'

Indeed, it's fun to see the flurry of patches trying to fix things up =
for 'xuser'. I'm fond of the saying "If you find yourself in a hole, =
stop digging".=20

So: http://patches.openembedded.org/patch/48139/=


