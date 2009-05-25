Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1M8WYh-0007DE-QJ
	for openembedded-devel@openembedded.org; Mon, 25 May 2009 11:33:31 +0200
Received: (qmail 2585 invoked by uid 813007); 25 May 2009 09:25:18 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 25 May 2009 09:25:18 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 May 2009 11:25:45 +0200
User-Agent: KMail/1.11.2 (Linux/2.6.30-rc6-00082-g7aff192-dirty; KDE/4.2.2;
	x86_64; ; )
References: <1243189985-19060-1-git-send-email-ihar.hrachyshka@gmail.com>
	<1243189985-19060-2-git-send-email-ihar.hrachyshka@gmail.com>
In-Reply-To: <1243189985-19060-2-git-send-email-ihar.hrachyshka@gmail.com>
MIME-Version: 1.0
Message-Id: <200905251125.45665.marcin@juszkiewicz.com.pl>
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
X-List-Received-Date: Mon, 25 May 2009 09:33:39 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia niedziela, 24 maja 2009 o 20:33:05 Ihar Hrachyshka napisa=C5=82(a):
> The reason for the move is that udevadm binary is executed from udev
> init.d script.

NACK, NACK, NACK - udevadm is also udevinfo and is used by HAL. Your=20
patch will make my mdev images not working properly because I would need=20
to install mdev and udev to get HAL working and then find a way to not=20
run udev at boot time (even after package upgrades).

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




