Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cazzeml@gmail.com>) id 1PKXcx-0001gn-M2
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Nov 2010 15:44:20 +0100
Received: by fxm7 with SMTP id 7so53128fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Nov 2010 06:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:subject:from:to:content-type
	:date:message-id:mime-version:x-mailer;
	bh=McTTKlY2loaEiQ4zGlV+LYDGUL4Sa2fLyUxsNsjvTPE=;
	b=Tdm8ltD2BEzKPdfDPvU7fQXWu/+AbIn2oyyhFzrhzwxqnh6RY/GpBC/UK5ZtFKyocG
	hwJYEHKu5MNxx9axfqQLX07PTz6ItQ52ztuQs1ZG69y+II8lkmpYyHrD/L//z1b5R89j
	pq1ijBTFJdJ+LJ0VL9P0XXtBKVYUBopBz7xx0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=subject:from:to:content-type:date:message-id:mime-version:x-mailer;
	b=qtbR1vV5WJ8aLjDiCsGF72YlAv6XH8stNzauSQdfNL9w7jW1F7gINjLKU+ivpzx4n+
	PRs47liUKXbQrNkGpioKMHRfy9hWdDjmugO9ZRsH2fgDIhMQUGYjl221fdeUbIA5vM/6
	YiicbguDMV9Zi6QNZx1woOFVISEIj4AiZkMcs=
Received: by 10.223.70.208 with SMTP id e16mr2254967faj.6.1290436988117;
	Mon, 22 Nov 2010 06:43:08 -0800 (PST)
Received: from [188.189.224.42] ([188.189.224.42])
	by mx.google.com with ESMTPS id g22sm1359939faa.17.2010.11.22.06.43.06
	(version=SSLv3 cipher=RC4-MD5); Mon, 22 Nov 2010 06:43:07 -0800 (PST)
From: Pierre Cassimans <cazzeml@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Nov 2010 15:43:03 +0100
Message-ID: <1290436983.22883.5.camel@guesswho>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: cazzeml@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Problems creating image for h2200
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
X-List-Received-Date: Mon, 22 Nov 2010 14:44:20 -0000
X-Groupsio-MsgNum: 26423
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-BLwqmv1MShIfzMGDwD+J"

--=-BLwqmv1MShIfzMGDwD+J
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I try to bitbake an image for ipaq h2200 but everytime it fails with
following error:=20

Collected errors:
 * check_data_file_clashes: Package udev wants to install
file /home/pc/oe/build/tmp-angstrom_2008_1/rootfs/console-image/etc/udev/ru=
les.d/50-hostap_cs.rules
        But that file is already provided by package  *
udev-hostap-cs-vcc-workaround
 * opkg_install_cmd: Cannot install package task-base.
 * resolve_conffiles: Existing
conffile /home/pc/oe/build/tmp-angstrom_2008_1/rootfs/console-image/etc/dev=
ice_table is different from the conffile in the new package. The new conffi=
le will be placed at /home/pc/oe/build/tmp-angstrom_2008_1/rootfs/console-i=
mage/etc/device_table-opkg.
 * check_data_file_clashes: Package udev wants to install
file /home/pc/oe/build/tmp-angstrom_2008_1/rootfs/console-image/etc/udev/ru=
les.d/50-hostap_cs.rules
        But that file is already provided by package  *
udev-hostap-cs-vcc-workaround
 * opkg_install_cmd: Cannot install package udev.

Only change with the master tree is the patch i previously posted about
the udev-compat141 hack for h2200

Any Idea?

Cazze

--=-BLwqmv1MShIfzMGDwD+J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQIcBAABAgAGBQJM6oFhAAoJEKSemPzh8iOctecQANKj66aDnmXwTiSSyht6FXui
CRqmXvmRegCZDziUIuFAY3TqQ62RZfnFkT5IN6ucHLrHkdIR9l7fGEjZ7MY7/dqf
sBnusDzFghu478IQ53dKj5pfFqMQwEZKr0hONFbVzHw62dVpDkt+o6wpiWDC2plm
LGVB8bkdwXZbxJ4A/MoJKEnx9zABkUquq4htjnjXio/SybY5BKKLXQDMBSRFEflU
Xz9mbLZM3c0McvtwtZNPHzuXORmTjPGENGApY9Du/3HNgS6yf80amtsdFD39FW4X
XlIgl2Bugo07/4UnaSKLjF0jHzKpxAkM0HJQKQCO0MwrrAnK4QBy+NnBlLqqCZWh
bN4EwuF7A6siIRYCnQoxZYIP1in0P5J5501Mno6Z+ld4/+2X2kUi20KZ2Q+qGxYU
nZSZU6NUu/iRWTRYp5EbDP15MQrxB4ZPAZABIadIwW9/1K90e8sQERBAsHGxgpdQ
GNH+5e0zNKqp778ZPrvhl1D4vZi9bZwP29FZ3imD172T5h2GgdeJZrbNP0cq93dW
wRMhPdE1AKr/iytvyiUYVqDCR8lToS4PaddAXjZE46Y4xpJ8f+OEDr2fT6kNONB0
ltG1oWhrrxGjQCNV3rkQgnoR5j5tqDpSg2uely0TJXu7342yQWcoJ5bATcUJ/5o2
cSd61fgzP6SOPytP3i2i
=KayH
-----END PGP SIGNATURE-----

--=-BLwqmv1MShIfzMGDwD+J--
