Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1M8e9m-0004dL-HT
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 May 2009 19:40:14 +0200
Received: from 88-109-34-80.dynamic.dsl.as9105.com ([88.109.34.80]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1M8e20-0007aS-D0
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 May 2009 18:32:13 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <be7a9f3d0905250959i19d01ebbr1b3b065f2135e294@mail.gmail.com>
References: <1243189985-19060-1-git-send-email-ihar.hrachyshka@gmail.com>
	<1243189985-19060-2-git-send-email-ihar.hrachyshka@gmail.com>
	<200905251125.45665.marcin@juszkiewicz.com.pl>
	<fce2a370905250254p4c51b706q399b14d9b0bb20e5@mail.gmail.com>
	<1243247426.4869.23.camel@lenovo.internal.reciva.com>
	<fce2a370905250355h5edd949cq40bcb52882e1e623@mail.gmail.com>
	<be7a9f3d0905250931wbedccdfg9f8b0a0f562b6aab@mail.gmail.com>
	<1243270407.4869.57.camel@lenovo.internal.reciva.com>
	<be7a9f3d0905250959i19d01ebbr1b3b065f2135e294@mail.gmail.com>
Date: Mon, 25 May 2009 18:32:11 +0100
Message-Id: <1243272731.4869.59.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: [PATCH 2/2] udev: moved udevadm to the main udev package
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
X-List-Received-Date: Mon, 25 May 2009 17:40:14 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2009-05-25 at 13:59 -0300, Otavio Salvador wrote:
> Hello,
> 
> On Mon, May 25, 2009 at 1:53 PM, Phil Blundell <philb@gnu.org> wrote:
> > On Mon, 2009-05-25 at 13:31 -0300, Otavio Salvador wrote:
> [...]
> >> I belive that the right way to fix it is add a binary package only for
> >> udevadm
> >
> > That's pretty much what udev-utils is: it doesn't contain any binaries
> > apart from udevadm.
> 
> In this case the binary package is wrong.

Why so?

> >> and make udev depends on it and mdev suggests it.
> >
> > Mdev itself doesn't have any use for udevadm, so having mdev Recommend
> > udev-utils wouldn't be the right thing; this would just be a waste of
> > space for people who are using mdev without HAL (which, I suspect, is
> > actually the majority of mdev users).
> 
> Agreed. But AFAIK suggested packages do not get installed by bitbake by default.

Ah yes, sorry, I misread your first mail.  Having mdev Suggest
udev-utils would indeed be harmless since you're right, ipkg doesn't
install suggestions automatically.  It would still be fairly pointless
though since nothing in mdev makes any use of udev-utils.

p.




