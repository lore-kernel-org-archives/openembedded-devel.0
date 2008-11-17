Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <openembedded@haerwu.biz>) id 1L272q-0001nE-Bo
	for openembedded-devel@openembedded.org; Mon, 17 Nov 2008 17:33:48 +0100
Received: (qmail 32424 invoked by uid 813007); 17 Nov 2008 16:31:27 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@haerwu.biz@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 17 Nov 2008 16:31:27 -0000
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Nov 2008 17:31:24 +0100
User-Agent: KMail/1.10.1 (Linux/2.6.28-rc4; KDE/4.1.2; x86_64; ; )
References: <49251.80.246.32.33.1226575168.squirrel@intern.netexpress.de>
In-Reply-To: <49251.80.246.32.33.1226575168.squirrel@intern.netexpress.de>
MIME-Version: 1.0
Message-Id: <200811171731.25253.openembedded@haerwu.biz>
Subject: Re: Issues with the system startup when the IMAGE_TYPE is squashfs
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
X-List-Received-Date: Mon, 17 Nov 2008 16:33:48 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Thursday 13 of November 2008 12:19:28 Christian P=C3=B6ssinger napisa=C5=82=
(a):
> I'm currently building a rootfs that will be stored in a squashfs
> container. The file is properly created by OpenEmbedded, but I
> noticed some issues:

> The second issue comes with the kernel modules. Again, the first
> system startup will create the modules.dep file inside the
> /lib/modules/$(uname -a) directory. But as stated before, this is not
> possible on a read-only filesystem.
>
> Is there any way within OpenEmbedded to create those files before the
> actual rootfs image is packed?

Each kernel module has postinstall script (added by kernel.bbclass)=20
which calls 'depmod -a' and update-modules. Opkg intercepts depmod calls=20
to make it just one call in 'opkg configure' during first boot. In=20
effect your rootfs has all module dependencies generated on build time.=20
You can probably remove second part of those postinstalls to not call=20
them on device at all.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://blog.haerwu.biz/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




