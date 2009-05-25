Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1M8gwE-0002Qp-CJ
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 May 2009 22:38:27 +0200
Received: from 88-109-34-80.dynamic.dsl.as9105.com ([88.109.34.80]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1M8goE-0005JN-T8
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 May 2009 21:30:14 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <be7a9f3d0905251322h27b36f0eyc780895bb05b50d7@mail.gmail.com>
References: <1243189985-19060-1-git-send-email-ihar.hrachyshka@gmail.com>
	<fce2a370905250254p4c51b706q399b14d9b0bb20e5@mail.gmail.com>
	<1243247426.4869.23.camel@lenovo.internal.reciva.com>
	<fce2a370905250355h5edd949cq40bcb52882e1e623@mail.gmail.com>
	<be7a9f3d0905250931wbedccdfg9f8b0a0f562b6aab@mail.gmail.com>
	<1243270407.4869.57.camel@lenovo.internal.reciva.com>
	<be7a9f3d0905250959i19d01ebbr1b3b065f2135e294@mail.gmail.com>
	<1243272731.4869.59.camel@lenovo.internal.reciva.com>
	<be7a9f3d0905251157t7178a81ah22ff6ab699e2c5f2@mail.gmail.com>
	<1243281147.4869.64.camel@lenovo.internal.reciva.com>
	<be7a9f3d0905251322h27b36f0eyc780895bb05b50d7@mail.gmail.com>
Date: Mon, 25 May 2009 21:29:55 +0100
Message-Id: <1243283395.4869.67.camel@lenovo.internal.reciva.com>
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
X-List-Received-Date: Mon, 25 May 2009 20:38:27 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2009-05-25 at 17:22 -0300, Otavio Salvador wrote:
> Well, I think it makes sense. What does not make sense to me is to
> install udevtest and udevinfo in a system that doesn't use them.
> 
> FILES_udev-utils = "${usrbindir}/udevinfo ${sbindir}/udevadm
> ${usrbindir}/udevtest"

I don't know what udevtest is for but, notwithstanding its presence in
FILES, no recent version of udev (at least, not 124 or 141) seems to
ship it.  udevinfo is just a symlink to udevadm in -124, and seems to be
missing entirely in -141, so again that doesn't seem like a big deal.

p.




