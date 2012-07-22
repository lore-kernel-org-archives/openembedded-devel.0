Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1St0Qt-0004Ly-1F
	for openembedded-devel@lists.openembedded.org;
	Sun, 22 Jul 2012 19:59:07 +0200
Received: by weyr6 with SMTP id r6so3572997wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Jul 2012 10:47:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=mpET81Y4lLVjKupzxaUv0UaxJT2++5Q1ykwZUzqEbSE=;
	b=jQEbn4LPXx0Q80fB9tm1yT+jV5X4yPxlzqGSKCxKEvEJ8WTaqcUYD3lgb9bEvEFFvG
	4kPiNQ3ORVDnkxgRKzzUc8FXUr9C7Gzsu4oG0sTxF9WpMhb34zFgbk6WzbDAkN3EbzDl
	h/LWd4+ySsVpvk+rEZ0iAAS96PDl99N6MOvP5y0hAAkmaW7rLWFw9Gsj+yCromuhPp7x
	9mKfNH4fpKBgDC2qoxd0dE6b6hStUvBbriASbsXaXiZ9miG4NsqmI/bQzTtbOw79ivI4
	F5LgheXuhzpvzOwi0+q2t9IxKXmSixYUVH//9n++rQNx1CwKEVSaSriQqFI/tghqCpLl
	FUKA==
Received: by 10.180.84.164 with SMTP id a4mr29859454wiz.12.1342979261074;
	Sun, 22 Jul 2012 10:47:41 -0700 (PDT)
Received: from [10.46.148.181] ([92.69.213.29])
	by mx.google.com with ESMTPS id o2sm18051371wiz.11.2012.07.22.10.47.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 22 Jul 2012 10:47:40 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1395791.kLPUUXTScb@helios>
Date: Sun, 22 Jul 2012 19:47:33 +0200
Message-Id: <0F6C3E71-2229-48DF-9417-E4F798C19D64@dominion.thruhere.net>
References: <1342899684-4450-1-git-send-email-raj.khem@gmail.com>
	<jug959$3gr$1@dough.gmane.org> <1395791.kLPUUXTScb@helios>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQnQyF32diL4QRj8Q+uP/kSb8+drFeYeV7+ADofNZhUwQAZkkfHvNQiZBAdHkLVJI/rXWFQ1
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-systemd][PATCH] systemd_git.bb: Dont inherit vala and gitpkgv
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
X-List-Received-Date: Sun, 22 Jul 2012 17:59:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 22 jul. 2012, om 18:38 heeft Paul Eggleton het volgende geschreven:

> On Sunday 22 July 2012 09:12:41 Koen Kooi wrote:
>> Op 21-07-12 21:41, Khem Raj schreef:
>>> In an effort to use meta-systemd without meta-oe layer (purely on
>>> OE-Core) I ran into these classes not being there in OE-Core
>>=20
>> The vala one isn't needed anymore, the GUI bits are a seperate =
project now,
>> but the gitpkgv needs to stay.=20
>=20
> Why? I can't see how gitpkgv has anything to do with systemd...

Because it's used to set PV automatically:

inherit gitpkgv
PKGV =3D "v${GITPKGVTAG}"=


