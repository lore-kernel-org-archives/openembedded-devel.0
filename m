Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jay@jay-tech.ru>) id 1Q0AQD-0008I2-9J
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Mar 2011 11:27:13 +0100
Received: by vws2 with SMTP id 2so2621776vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Mar 2011 03:25:28 -0700 (PDT)
Received: by 10.52.96.70 with SMTP id dq6mr51378vdb.65.1300357528221; Thu, 17
	Mar 2011 03:25:28 -0700 (PDT)
MIME-Version: 1.0
Sender: jay@jay-tech.ru
Received: by 10.220.180.141 with HTTP; Thu, 17 Mar 2011 03:25:07 -0700 (PDT)
X-Originating-IP: [78.106.51.57]
From: Yury Bushmelev <jay4mail@gmail.com>
Date: Thu, 17 Mar 2011 13:25:07 +0300
X-Google-Sender-Auth: 0T6eyW9iIa8sCzfPlDjAMd5mb5Q
Message-ID: <AANLkTikxzmQENi33q6wpGfc+uOL7H-z7uxJEdPsNXvq4@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: qemu-native-0.14.0 do_configure fail on alsa libs check
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
X-List-Received-Date: Thu, 17 Mar 2011 10:27:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello!

qemu-native-0.14.0 do_configure fail on alsa libs check

Build Configuration:
BB_VERSION        =3D "1.13.0"
METADATA_BRANCH   =3D "master"
METADATA_REVISION =3D "103126a"
TARGET_ARCH       =3D "i686"
TARGET_OS         =3D "linux"
MACHINE           =3D "qemux86"
DISTRO            =3D "angstrom"
DISTRO_VERSION    =3D "v20110317"

| ERROR: Function 'do_configure' failed (see
/var/tmp/tb-clean-build/work/x86_64-linux/qemu-native-0.14.0-r2/temp/log.do=
_configure.22637
for further information)
| + cd /var/tmp/tb-clean-build/work/x86_64-linux/qemu-native-0.14.0-r2/qemu=
-0.14.0
| + do_configure
| + /var/tmp/tb-clean-build/work/x86_64-linux/qemu-native-0.14.0-r2/qemu-0.=
14.0/configure
--prefix=3D/var/tmp/tb-clean-build/sysroots/x86_64-linux/usr
--target-list=3Darm-linux-user,arm-softmmu,i386-linux-user,i386-softmmu,x86=
_64-linux-user,x86_64-softmmu,mips-linux-user,mips-softmmu,ppc-linux-user,p=
pc-softmmu,mipsel-linux-user,mips64el-softmmu,mips64-softmmu,sh4-linux-user=
,sh4-softmmu,sh4eb-linux-user,sh4eb-softmmu
--disable-werror --disable-vnc-tls --enable-kvm
--audio-drv-list=3Doss,alsa --audio-card-list=3Dac97,es1370 --disable-curl
--disable-sdl --disable-strip
--extra-cflags=3D-I/var/tmp/tb-clean-build/sysroots/x86_64-linux/usr/includ=
e
|
| Error: alsa check failed
| Make sure to have the alsa libs and headers installed.
|
NOTE: package qemu-native-0.14.0-r2: task do_configure: Failed

Full log is available here:
http://jay-home.ath.cx/testbuilder/logs/B.master.angstrom-2010.x.qemux86.c.=
log

--
Yury Bushmelev


