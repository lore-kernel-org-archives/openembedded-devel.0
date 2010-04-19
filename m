Received: from ey-out-1920.google.com ([74.125.78.147])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickael.chazaux@gmail.com>) id 1O3nlR-0006lr-VS
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Apr 2010 11:59:39 +0200
Received: by ey-out-1920.google.com with SMTP id 26so129527eyw.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Apr 2010 02:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:received:message-id
	:subject:from:to:content-type:content-transfer-encoding;
	bh=wKhNqUl8vyMegf8G7JuszSGtgePQksyKHhs0udCkJkQ=;
	b=jb+a/Ge8JOaDTFy4JRwH9FkTw4v3kr53kI76TC8OIzxA8vEZRfmLLR7rSxIsiTovTN
	xfQ+DU8jBzDSUWHkSXuwCHLvhusYUqBlskIlL0ms1u6M2hEgVpzE7rhip2QK4LbS/63s
	48pj5ExBQbTLaBGpvS4LjNbx2XIIfiDZc0QiQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=b6CJWWUPBr4Yn9lfprGV3ildKFgyHWuZae4vKWuO4SO/tqyyjUWsSIqJWxaQfjLcOC
	qmoNqubsYTY6q6XBX/EHd6ifr/+NwagEC09K91jCE2T0XEBbxrSv+w9WC7IBt4uUKJ+g
	Cit+6SrQVvAAoL4obruxLrSXFMDU9TEeyKV1c=
MIME-Version: 1.0
Received: by 10.213.19.136 with HTTP; Mon, 19 Apr 2010 02:56:06 -0700 (PDT)
Date: Mon, 19 Apr 2010 11:56:06 +0200
Received: by 10.213.41.3 with SMTP id m3mr2569823ebe.40.1271670966219; Mon, 19 
	Apr 2010 02:56:06 -0700 (PDT)
Message-ID: <u2jbc36f8ed1004190256h970ad368lb6c816775a0ca0dd@mail.gmail.com>
From: Mickael Chazaux <mickael.chazaux@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.78.147
X-SA-Exim-Mail-From: mickael.chazaux@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Libpixman build failure
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
X-List-Received-Date: Mon, 19 Apr 2010 09:59:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

I had a build failure in the package xorg-libs/libpixman_0.18.0.bb. It
seems that library's build system relies on Perl, which was not yet
bitbaked. I think the problem appeared because of this line in
local.conf :

BB_NUMBER_THREADS =3D "3"

causing libpixman do_configure() called before perl-native was finished.

Bitbaking perl-native manually before relaunching the build solved the prob=
lem.

Relevant log parts :


work/i686-linux/pixman-native-0.18.0-r5.1/temp/log.do_configure.21109 :

------
/home/mchazaux/projet/OE/angstrom-dev/staging/i686-linux/usr/bin/autoconf:
/home/mchazaux/projet/OE/angstrom-dev/staging/i686-linux/usr/bin/autom4te:
/home/mchazaux/projet/OE/angstrom-dev/staging/i686-linux/usr/bin/perl:
bad interpreter: No such file or directory
------

bitbake output :

-------
NOTE: Running task 1126 of 8083 (ID: 7722,
virtual:native:/home/mchazaux/projet/OE/openembedded/recipes/xorg-lib/pixma=
n_0.18.0.bb,
do_configure)
Removing package staging-perl-native-i686-linux from root...
(offline root mode: not running staging-perl-native-i686-linux.prerm)
(offline root mode: not running staging-perl-native-i686-linux.postrm)
ERROR: function do_configure failed
ERROR: see log in
/home/mchazaux/projet/OE/angstrom-dev/work/i686-linux/pixman-native-0.18.0-=
r5.1/temp/log.do_configure.21109
NOTE: Task failed:
/home/mchazaux/projet/OE/angstrom-dev/work/i686-linux/pixman-native-0.18.0-=
r5.1/temp/log.do_configure.21109
ERROR: TaskFailed event exception, aborting
ERROR: Build of
virtual:native:/home/mchazaux/projet/OE/openembedded/recipes/xorg-lib/pixma=
n_0.18.0.bb
do_configure failed
Installing staging-perl-native-i686-linux (5.8.8-r16) to root...
ERROR: Task 7722
(virtual:native:/home/mchazaux/projet/OE/openembedded/recipes/xorg-lib/pixm=
an_0.18.0.bb,
do_configure) failed
NOTE: Waiting for 2 active tasks to finish
NOTE: 1: /home/mchazaux/projet/OE/openembedded/recipes/dbus/dbus_1.2.24.bb,
do_compile (19440)
NOTE: 2: /home/mchazaux/projet/OE/openembedded/recipes/perl/perl-native_5.8=
.8.bb,
do_setscene (20352)
(offline root mode: not running
staging-perl-native-i686-linux.preinst)
Configuring staging-perl-native-i686-linux
(offline root mode: not running
staging-perl-native-i686-linux.postinst)
NOTE: Staging package found but invalid for
/home/mchazaux/projet/OE/openembedded/recipes/perl/perl-native_5.8.8.bb
NOTE: Waiting for 1 active tasks to finish
NOTE: 1: /home/mchazaux/projet/OE/openembedded/recipes/dbus/dbus_1.2.24.bb,
do_compile (19440)
NOTE: Tasks Summary: Attempted 1123 tasks of which 1062 didn't need to
be rerun and 1 failed.
ERROR: 'virtual:native:/home/mchazaux/projet/OE/openembedded/recipes/xorg-l=
ib/pixman_0.18.0.bb'
failed
--------

Regards,

Mickael Chazaux

Adeneo Embedded - Adetel Group
2, chemin du Ruisseau
69134 ECULLY - FRANCE
T=C3=A9l. : +33 (0)4 72 18 08 40 - Fax : +33 (0)4 72 18 08 41


