Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <slightlyunconventional@gmail.com>)
	id 1OmUDq-0004hs-EF for openembedded-devel@lists.openembedded.org;
	Fri, 20 Aug 2010 18:13:41 +0200
Received: by wwe15 with SMTP id 15so805677wwe.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Aug 2010 09:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:sender:received:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=XWdoZP5SLI0+yqFB7v4rGkJxuNG6Ir1SwHC/xxyzERU=;
	b=KMqXkz7DHz7q+8L6nleTm8oHFHJ+ZgzA8YzGwN+yAi11YbSNU5tUJwO7Ds+Jq2aIrx
	777XaeFKqy3h5P5MP+sFf/Ds5rh44Juu+UO0xWAX3iHi692XPFXnGaNzjy/sjBJEc45X
	ZaEEQYM21i0FASRX9nZb2WB5o/SR5GkIF8v9g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	b=ZxX+ijXYXmPY+Ltfdg+eP5Y+AVKnBsqJCQh+4BhScjyutsaIBWMxLVNe/yTVanEQOd
	xf9gqNu1ox6TlLriolHqMoRmP9PN0IVnyhrOVKxsTgT3SxNh4sfiahJ60LdVDpddzXSM
	LpeFabooilXtQYbTfp3tUmSeRMxfCN0SfMaC0=
MIME-Version: 1.0
Received: by 10.227.137.199 with SMTP id x7mr1418918wbt.107.1282320796335;
	Fri, 20 Aug 2010 09:13:16 -0700 (PDT)
Sender: slightlyunconventional@gmail.com
Received: by 10.227.134.211 with HTTP; Fri, 20 Aug 2010 09:13:16 -0700 (PDT)
Date: Fri, 20 Aug 2010 09:13:16 -0700
X-Google-Sender-Auth: hG0h7EwzYXJtPWu9kPwwfA4G1Yo
Message-ID: <AANLkTinOcOEsWCF=oaqta+io5ymwP_bfiMWJJXqm02jw@mail.gmail.com>
From: Hollis Blanchard <hollis@penguinppc.org>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: slightlyunconventional@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00, SPF_PASS, WEIRD_PORT
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: meta-toolchain can't find libstdc++-dev?
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
X-List-Received-Date: Fri, 20 Aug 2010 16:13:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi, I've been having a problem trying to build meta-toolchain. First,
here is my local.conf:
BBFILES =3D "/home/hollisb/work/openembedded/openembedded.git/recipes/*/*.b=
b"
DISTRO =3D "angstrom-2008.1"
MACHINE =3D "ebony"
INHERIT +=3D "rm_work"

I defined my own ebony.conf:
TARGET_ARCH =3D "powerpc"
require conf/machine/include/tune-ppc440.inc

PREFERRED_PROVIDER_virtual/kernel =3D "linux"
KERNEL_IMAGETYPE =3D "treeImage.ebony"

MACHINE_FEATURES =3D "kernel26 usbhost pci"

#don't try to access tty1
USE_VT =3D "0"
SERIAL_CONSOLE =3D "9600 ttyS0"

Below is the error I get when I bitbake meta-toolchain. FWIW,
binutils-cross-sdk, gcc-cross-sdk, gdb-cross-sdk, opkg-sdk, have all
been successfully built individually. Any help?

-Hollis


% bitbake meta-toolchain
NOTE: Out of date cache found, rebuilding...
Parsing .bb files, please wait...NOTE: Angstrom DOES NOT support
bluez-libs because bluez-libs 3.x has been replaced by bluez4
NOTE: Angstrom DOES NOT support bluez-libs because bluez-libs 3.x has
been replaced by bluez4
NOTE: Angstrom DOES NOT support libiconv because the glibc builtin
iconv replacement is used
NOTE: Angstrom DOES NOT support bluez-libs because bluez-libs 3.x has
been replaced by bluez4
NOTE: Angstrom DOES NOT support fso-apm because regular apmd is good enough
NOTE: Angstrom DOES NOT support bluez-utils because bluez-utils 3.x
has been replaced by bluez4
NOTE: Angstrom DOES NOT support libiconv because the glibc builtin
iconv replacement is used
NOTE: Angstrom DOES NOT support libiconv because the glibc builtin
iconv replacement is used
NOTE: Angstrom DOES NOT support bluez-utils because bluez-utils 3.x
has been replaced by bluez4
done.
Parsing of 8399 .bb files complete (0 cached, 8399 parsed). 8593
targets, 343 skipped, 1 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies
NOTE: multiple providers are available for runtime libstdc++-dev (gcc,
external-toolchain-csl, external-toolchain-generic,
external-toolchain)
NOTE: consider defining a PREFERRED_PROVIDER entry to match libstdc++-dev
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 1276 of 1283 (ID: 20,
/home/hollisb/work/openembedded/openembedded.git/recipes/meta/meta-toolchai=
n.bb,
do_package_update_index_ipk)
NOTE: package meta-toolchain-1.0-r0: task do_package_update_index_ipk: Star=
ted
NOTE: package meta-toolchain-1.0-r0: task do_package_update_index_ipk: Succ=
eeded
NOTE: Running task 1280 of 1283 (ID: 11,
/home/hollisb/work/openembedded/openembedded.git/recipes/meta/meta-toolchai=
n.bb,
do_populate_sdk)
NOTE: package meta-toolchain-1.0-r0: task do_populate_sdk: Started
ERROR: Task 11 (/home/hollisb/work/openembedded/openembedded.git/recipes/me=
ta/meta-toolchain.bb,
do_populate_sdk) failed with 256
ERROR: '/home/hollisb/work/openembedded/openembedded.git/recipes/meta/meta-=
toolchain.bb'
failed
NOTE: Task failed: ('function do_populate_sdk failed',
'/home/hollisb/work/openembedded/build/tmp/work/ppc440-angstrom-linux/meta-=
toolchain-1.0-r0/temp/log.do_populate_sdk.28868')
ERROR: Logfile of failure stored in:
/home/hollisb/work/openembedded/build/tmp/work/ppc440-angstrom-linux/meta-t=
oolchain-1.0-r0/temp/log.do_populate_sdk.28868
Log data follows:
| Downloading file:/home/hollisb/work/openembedded/build/tmp/deploy/glibc/i=
pk/Packages.
| Updated list of available packages in
/home/hollisb/work/openembedded/build/tmp/work/ppc440-angstrom-linux/meta-t=
oolchain-1.0-r0/sdk/image//usr/lib/opkg/lists/oe.
| Downloading file:/home/hollisb/work/openembedded/build/tmp/deploy/glibc/i=
pk/i686-ppc440-sdk/Packages.
| Updated list of available packages in
/home/hollisb/work/openembedded/build/tmp/work/ppc440-angstrom-linux/meta-t=
oolchain-1.0-r0/sdk/image//usr/lib/opkg/lists/oe-i686-ppc440-sdk.
| Installing task-sdk-host (1.0-r3.5) to root...
| Downloading file:/home/hollisb/work/openembedded/build/tmp/deploy/glibc/i=
pk/i686-ppc440-sdk/task-sdk-host_1.0-r3.5_i686-ppc440-sdk.ipk.
| Installing pkgconfig-sdk (0.23-r8.1.5) to root...
| Downloading file:/home/hollisb/work/openembedded/build/tmp/deploy/glibc/i=
pk/i686-ppc440-sdk/pkgconfig-sdk_0.23-r8.1.5_i686-ppc440-sdk.ipk.
| Installing libtool-sdk (2.2.6b-r25.0.5) to root...
| Downloading file:/home/hollisb/work/openembedded/build/tmp/deploy/glibc/i=
pk/i686-ppc440-sdk/libtool-sdk_2.2.6b-r25.0.5_i686-ppc440-sdk.ipk.
| Configuring pkgconfig-sdk.
| Configuring libtool-sdk.
| Configuring task-sdk-host.
| Collected errors:
| =A0* satisfy_dependencies_for: Cannot satisfy the following
dependencies for task-sdk-host:
| =A0* =A0 =A0binutils-cross-sdk * =A0 =A0gcc-cross-sdk * =A0 =A0 =A0 =A0 g=
db-cross-sdk
* =A0 =A0 =A0 =A0 opkg-sdk *
| Downloading file:/home/hollisb/work/openembedded/build/tmp/deploy/glibc/i=
pk/Packages.
| Updated list of available packages in
/home/hollisb/work/openembedded/build/tmp/work/ppc440-angstrom-linux/meta-t=
oolchain-1.0-r0/sdk/image//usr/local/angstrom/powerpc/powerpc-angstrom-linu=
x//usr/lib/opkg/lists/oe.
| Downloading file:/home/hollisb/work/openembedded/build/tmp/deploy/glibc/i=
pk/all/Packages.
| Updated list of available packages in
/home/hollisb/work/openembedded/build/tmp/work/ppc440-angstrom-linux/meta-t=
oolchain-1.0-r0/sdk/image//usr/local/angstrom/powerpc/powerpc-angstrom-linu=
x//usr/lib/opkg/lists/oe-all.
| Downloading file:/home/hollisb/work/openembedded/build/tmp/deploy/glibc/i=
pk/ppc440/Packages.
| Updated list of available packages in
/home/hollisb/work/openembedded/build/tmp/work/ppc440-angstrom-linux/meta-t=
oolchain-1.0-r0/sdk/image//usr/local/angstrom/powerpc/powerpc-angstrom-linu=
x//usr/lib/opkg/lists/oe-ppc440.
| Downloading file:/home/hollisb/work/openembedded/build/tmp/deploy/glibc/i=
pk/ebony/Packages.
| Updated list of available packages in
/home/hollisb/work/openembedded/build/tmp/work/ppc440-angstrom-linux/meta-t=
oolchain-1.0-r0/sdk/image//usr/local/angstrom/powerpc/powerpc-angstrom-linu=
x//usr/lib/opkg/lists/oe-ebony.
| Installing task-sdk-bare (1.0-r1.5) to root...
| Downloading file:/home/hollisb/work/openembedded/build/tmp/deploy/glibc/i=
pk/ppc440/task-sdk-bare_1.0-r1.5_ppc440.ipk.
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-ar-kw-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-nds-nl-=
dbg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-fy-de-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-yi-us-d=
bg
| glibc-dbg: unsatisfied recommendation for
glibc-binary-localedata-be-by+latin-dbg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-fa-ir-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-es-do-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-wo-sn-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-so-so-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-fr-ca-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-pl-pl-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-sa-in-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-es-mx-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-de-de-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-fr-ch-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-tg-tj-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-ms-my-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-an-es-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-de-lu-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-ko-kr-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-es-us-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-pa-in-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-ky-kg-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-ur-pk-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-rw-rw-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-en-ph-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-es-uy-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-en-ag-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-oc-fr-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-ar-lb-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-ug-cn-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-fil-ph-=
dbg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-wa-be-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-en-au-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-dz-bt-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-pt-br-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-es-gt-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-aa-dj-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-ga-ie-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-bn-in-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-fr-be-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-crh-ua-=
dbg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-en-hk-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-ar-sy-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-el-gr-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-uk-ua-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-nl-be-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-it-it-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-so-dj-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-ar-ly-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-ar-sa-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-ts-za-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-ar-qa-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-af-za-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-nr-za-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-so-ke-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-ar-iq-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-it-ch-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-pa-pk-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-ar-in-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-de-be-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-zh-cn-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-es-bo-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-sv-fi-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-li-nl-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-br-fr-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-yo-ng-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-fy-nl-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-zu-za-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-fo-fo-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-ar-ae-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-mt-mt-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-zh-tw-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-tn-za-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-es-sv-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-km-kh-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-bg-bg-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-en-gb-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-ne-np-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-es-es-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-fur-it-=
dbg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-sl-si-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-lt-lt-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-ja-jp-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-kn-in-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-st-za-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-hi-in-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-es-ec-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-az-az-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-kk-kz-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-ca-es-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-ar-jo-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-ar-bh-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-zh-sg-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-be-by-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-ar-sd-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-ar-ye-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-nso-za-=
dbg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-en-nz-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-mr-in-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-ig-ng-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-en-ng-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-nds-de-=
dbg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-pt-pt-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-id-id-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-ve-za-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-as-in-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-lo-la-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-de-ch-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-en-dk-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-nb-no-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-tl-ph-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-gu-in-d=
bg
| glibc-dbg: unsatisfied recommendation for
glibc-binary-localedata-uz-uz+cyrillic-dbg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-es-hn-d=
bg
| glibc-dbg: unsatisfied recommendation for
glibc-binary-localedata-sd-in+devanagari-dbg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-se-no-d=
bg
| glibc-dbg: unsatisfied recommendation for
glibc-binary-localedata-ks-in+devanagari-dbg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-ar-om-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-kl-gl-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-iu-ca-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-sq-al-d=
bg
| glibc-dbg: unsatisfied recommendation for
glibc-binary-localedata-tt-ru+iqtelif-dbg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-nn-no-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-sd-in-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-da-dk-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-ru-ua-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-ca-it-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-en-ca-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-ru-ru-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-tk-tm-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-shs-ca-=
dbg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-de-at-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-es-cr-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-es-cl-d=
bg
| glibc-dbg: unsatisfied recommendation for
glibc-binary-localedata-sr-rs+latin-dbg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-es-co-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-lg-ug-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-bo-cn-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-tt-ru-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-iw-il-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-ro-ro-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-el-cy-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-sv-se-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-es-pa-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-lv-lv-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-en-us-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-ha-ng-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-es-pe-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-nl-nl-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-hsb-de-=
dbg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-es-py-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-sr-rs-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-et-ee-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-csb-pl-=
dbg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-fi-fi-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-fr-fr-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-sr-me-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-es-pr-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-ku-tr-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-he-il-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-en-zw-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-hy-am-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-ber-dz-=
dbg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-eu-es-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-si-lk-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-ml-in-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-gl-es-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-en-za-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-mg-mg-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-ar-tn-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-bs-ba-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-ast-es-=
dbg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-ar-ma-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-li-be-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-ca-fr-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-en-in-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-vi-vn-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-mk-mk-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-en-ie-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-sk-sk-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-fr-lu-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-cs-cz-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-gd-gb-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-cy-gb-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-mi-nz-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-pap-an-=
dbg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-or-in-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-hr-hr-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-ar-dz-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-zh-hk-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-is-is-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-ar-eg-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-nl-aw-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-ca-ad-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-ht-ht-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-es-ar-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-hu-hu-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-ka-ge-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-tr-cy-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-es-ve-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-om-ke-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-mai-in-=
dbg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-sc-it-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-ss-za-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-th-th-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-ta-in-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-en-sg-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-ik-ca-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-ber-ma-=
dbg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-xh-za-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-en-bw-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-kw-gb-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-gv-gb-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-bo-in-d=
bg
| glibc-dbg: unsatisfied recommendation for glibc-binary-localedata-es-ni-d=
bg
| glibc-dbg: unsatisfied recommendation for libcidn-dbg
| glibc-dbg: unsatisfied recommendation for libsegfault-dbg
| glibc-dbg: unsatisfied recommendation for glibc-extra-nss-dbg
| glibc-dbg: unsatisfied recommendation for glibc-thread-db-dbg
| glibc-dbg: unsatisfied recommendation for virtual-locale-bg-dbg
| glibc-dbg: unsatisfied recommendation for virtual-locale-en-gb-dbg
| glibc-dbg: unsatisfied recommendation for virtual-locale-fi-dbg
| glibc-dbg: unsatisfied recommendation for virtual-locale-ru-dbg
| glibc-dbg: unsatisfied recommendation for virtual-locale-rw-dbg
| glibc-dbg: unsatisfied recommendation for virtual-locale-nl-dbg
| glibc-dbg: unsatisfied recommendation for virtual-locale-de-dbg
| glibc-dbg: unsatisfied recommendation for virtual-locale-it-dbg
| glibc-dbg: unsatisfied recommendation for virtual-locale-tr-dbg
| glibc-dbg: unsatisfied recommendation for virtual-locale-cs-dbg
| glibc-dbg: unsatisfied recommendation for virtual-locale-locale.alias-dbg
| glibc-dbg: unsatisfied recommendation for virtual-locale-be-dbg
| glibc-dbg: unsatisfied recommendation for virtual-locale-ca-dbg
| glibc-dbg: unsatisfied recommendation for virtual-locale-sv-dbg
| glibc-dbg: unsatisfied recommendation for virtual-locale-pt-br-dbg
| glibc-dbg: unsatisfied recommendation for virtual-locale-lt-dbg
| glibc-dbg: unsatisfied recommendation for virtual-locale-pl-dbg
| glibc-dbg: unsatisfied recommendation for virtual-locale-da-dbg
| glibc-dbg: unsatisfied recommendation for virtual-locale-id-dbg
| glibc-dbg: unsatisfied recommendation for virtual-locale-ja-dbg
| glibc-dbg: unsatisfied recommendation for virtual-locale-fr-dbg
| glibc-dbg: unsatisfied recommendation for virtual-locale-el-dbg
| glibc-dbg: unsatisfied recommendation for virtual-locale-hu-dbg
| glibc-dbg: unsatisfied recommendation for virtual-locale-vi-dbg
| glibc-dbg: unsatisfied recommendation for virtual-locale-sk-dbg
| glibc-dbg: unsatisfied recommendation for virtual-locale-ko-dbg
| glibc-dbg: unsatisfied recommendation for virtual-locale-gl-dbg
| glibc-dbg: unsatisfied recommendation for virtual-locale-zh-cn-dbg
| glibc-dbg: unsatisfied recommendation for virtual-locale-es-dbg
| glibc-dbg: unsatisfied recommendation for virtual-locale-nb-dbg
| glibc-dbg: unsatisfied recommendation for virtual-locale-zh-tw-dbg
| glibc-dbg: unsatisfied recommendation for virtual-locale-hr-dbg
| glibc-dbg: unsatisfied recommendation for glibc-gconv-dbg
| glibc-dbg: unsatisfied recommendation for glibc-gconv-libjis-dbg
| glibc-dbg: unsatisfied recommendation for glibc-gconv-libjisx0213-dbg
| glibc-dbg: unsatisfied recommendation for glibc-gconv-libcns-dbg
| glibc-dbg: unsatisfied recommendation for glibc-gconv-libksc-dbg
| glibc-dbg: unsatisfied recommendation for glibc-gconv-libgb-dbg
| glibc-dbg: unsatisfied recommendation for glibc-gconv-libisoir165-dbg
| glibc-dbg: unsatisfied recommendation for
glibc-localedata-iso14651-t1-common-dbg
| glibc-dbg: unsatisfied recommendation for glibc-localedata-i18n-dbg
| glibc-dbg: unsatisfied recommendation for
glibc-localedata-translit-combining-dbg
| glibc-dbg: unsatisfied recommendation for glibc-localedata-iso14651-t1-db=
g
| glibc-dbg: unsatisfied recommendation for glibc-localedata-hi-in-dbg
| glibc-dbg: unsatisfied recommendation for glibc-localedata-am-et-dbg
| glibc-dbg: unsatisfied recommendation for glibc-localedata-ti-et-dbg
| glibc-dbg: unsatisfied recommendation for glibc-localedata-en-in-dbg
| glibc-dbg: unsatisfied recommendation for glibc-localedata-be-by-dbg
| glibc-dbg: unsatisfied recommendation for glibc-localedata-es-es-dbg
| glibc-dbg: unsatisfied recommendation for glibc-localedata-en-us-dbg
| glibc-dbg: unsatisfied recommendation for glibc-localedata-ti-er-dbg
| glibc-dbg: unsatisfied recommendation for glibc-localedata-aa-et-dbg
| glibc-dbg: unsatisfied recommendation for glibc-localedata-en-dk-dbg
| glibc-dbg: unsatisfied recommendation for glibc-localedata-ar-eg-dbg
| glibc-dbg: unsatisfied recommendation for glibc-localedata-de-de-dbg
| glibc-dbg: unsatisfied recommendation for glibc-localedata-fr-be-dbg
| glibc-dbg: unsatisfied recommendation for glibc-localedata-zh-cn-dbg
| glibc-dbg: unsatisfied recommendation for glibc-localedata-sv-se-dbg
| glibc-dbg: unsatisfied recommendation for glibc-localedata-fi-fi-dbg
| glibc-dbg: unsatisfied recommendation for glibc-localedata-ru-ru-dbg
| glibc-dbg: unsatisfied recommendation for glibc-localedata-ur-pk-dbg
| glibc-dbg: unsatisfied recommendation for glibc-localedata-nb-no-dbg
| glibc-dbg: unsatisfied recommendation for glibc-localedata-en-za-dbg
| glibc-dbg: unsatisfied recommendation for glibc-localedata-om-ke-dbg
| glibc-dbg: unsatisfied recommendation for glibc-localedata-en-ng-dbg
| glibc-dbg: unsatisfied recommendation for glibc-localedata-nl-nl-dbg
| glibc-dbg: unsatisfied recommendation for glibc-localedata-en-gb-dbg
| glibc-dbg: unsatisfied recommendation for glibc-localedata-en-ca-dbg
| glibc-dbg: unsatisfied recommendation for glibc-localedata-wa-be-dbg
| glibc-dbg: unsatisfied recommendation for glibc-localedata-fr-be+euro-dbg
| glibc-dbg: unsatisfied recommendation for glibc-localedata-pl-pl-dbg
| glibc-dbg: unsatisfied recommendation for glibc-localedata-de-lu-dbg
| glibc-dbg: unsatisfied recommendation for glibc-localedata-om-et-dbg
| glibc-dbg: unsatisfied recommendation for glibc-localedata-el-gr-dbg
| glibc-dbg: unsatisfied recommendation for glibc-localedata-tr-tr-dbg
| glibc-dbg: unsatisfied recommendation for glibc-localedata-fr-fr-dbg
| glibc-dbg: unsatisfied recommendation for glibc-localedata-es-us-dbg
| glibc-dbg: unsatisfied recommendation for glibc-localedata-da-dk-dbg
| glibc-dbg: unsatisfied recommendation for glibc-localedata-aa-er-dbg
| glibc-dbg: unsatisfied recommendation for glibc-localedata-bo-cn-dbg
| glibc-dbg: unsatisfied recommendation for glibc-localedata-so-so-dbg
| glibc-dbg: unsatisfied recommendation for glibc-localedata-aa-dj-dbg
| glibc-dbg: unsatisfied recommendation for glibc-localedata-gez-er+abegede=
-dbg
| glibc-dbg: unsatisfied recommendation for glibc-localedata-gez-et-dbg
| glibc-dbg: unsatisfied recommendation for glibc-localedata-it-it-dbg
| glibc-dbg: unsatisfied recommendation for glibc-localedata-ga-ie-dbg
| glibc-dbg: unsatisfied recommendation for
glibc-localedata-translit-neutral-dbg
| glibc-dbg: unsatisfied recommendation for glibc-localedata-bn-bd-dbg
| glibc-dbg: unsatisfied recommendation for
glibc-localedata-translit-cjk-variants-dbg
| glibc-dbg: unsatisfied recommendation for glibc-localedata-de-at-dbg
| glibc-dbg: unsatisfied recommendation for glibc-localedata-sv-fi-dbg
| glibc-dbg: unsatisfied recommendation for glibc-localedata-fi-fi+euro-dbg
| glibc-dbg: unsatisfied recommendation for glibc-localedata-pt-pt-dbg
| glibc-dbg: unsatisfied recommendation for glibc-localedata-fr-lu-dbg
| glibc-dbg: unsatisfied recommendation for glibc-localedata-ca-es-dbg
| glibc-dbg: unsatisfied recommendation for glibc-localedata-cs-cz-dbg
| glibc-dbg: unsatisfied recommendation for glibc-localedata-sr-rs-dbg
| glibc-dbg: unsatisfied recommendation for glibc-localedata-gl-es-dbg
| glibc-dbg: unsatisfied recommendation for glibc-localedata-tl-ph-dbg
| glibc-dbg: unsatisfied recommendation for glibc-localedata-gez-er-dbg
| glibc-dbg: unsatisfied recommendation for glibc-localedata-translit-hangu=
l-dbg
| glibc-dbg: unsatisfied recommendation for glibc-localedata-crh-ua-dbg
| glibc-dbg: unsatisfied recommendation for glibc-localedata-br-fr-dbg
| glibc-dbg: unsatisfied recommendation for glibc-localedata-en-nz-dbg
| glibc-dbg: unsatisfied recommendation for glibc-localedata-nl-be-dbg
| glibc-dbg: unsatisfied recommendation for glibc-localedata-de-be-dbg
| glibc-dbg: unsatisfied recommendation for glibc-localedata-translit-circl=
e-dbg
| glibc-dbg: unsatisfied recommendation for
glibc-localedata-translit-cjk-compat-dbg
| glibc-dbg: unsatisfied recommendation for glibc-localedata-translit-compa=
t-dbg
| glibc-dbg: unsatisfied recommendation for glibc-localedata-translit-font-=
dbg
| glibc-dbg: unsatisfied recommendation for
glibc-localedata-translit-fraction-dbg
| glibc-dbg: unsatisfied recommendation for glibc-localedata-translit-narro=
w-dbg
| glibc-dbg: unsatisfied recommendation for glibc-localedata-translit-small=
-dbg
| glibc-dbg: unsatisfied recommendation for glibc-localedata-translit-wide-=
dbg
| glibc-dbg: unsatisfied recommendation for glibc-localedata-dz-bt-dbg
| glibc-dbg: unsatisfied recommendation for
glibc-localedata-iso14651-t1-pinyin-dbg
| glibc-dbg: unsatisfied recommendation for glibc-localedata-eu-es-dbg
| glibc-dbg: unsatisfied recommendation for glibc-localedata-pa-pk-dbg
| glibc-dbg: unsatisfied recommendation for glibc-localedata-en-ie-dbg
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-ar-kw-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-nds-nl-=
dev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-fy-de-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-yi-us-d=
ev
| libc6-dev: unsatisfied recommendation for
glibc-binary-localedata-be-by+latin-dev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-fa-ir-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-es-do-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-wo-sn-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-so-so-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-fr-ca-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-pl-pl-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-sa-in-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-es-mx-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-de-de-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-fr-ch-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-tg-tj-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-ms-my-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-an-es-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-de-lu-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-ko-kr-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-es-us-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-pa-in-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-ky-kg-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-ur-pk-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-rw-rw-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-en-ph-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-es-uy-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-en-ag-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-oc-fr-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-ar-lb-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-ug-cn-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-fil-ph-=
dev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-wa-be-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-en-au-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-dz-bt-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-pt-br-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-es-gt-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-aa-dj-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-ga-ie-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-bn-in-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-fr-be-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-crh-ua-=
dev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-en-hk-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-ar-sy-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-el-gr-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-uk-ua-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-nl-be-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-it-it-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-so-dj-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-ar-ly-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-ar-sa-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-ts-za-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-ar-qa-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-af-za-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-nr-za-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-so-ke-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-ar-iq-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-it-ch-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-pa-pk-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-ar-in-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-de-be-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-zh-cn-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-es-bo-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-sv-fi-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-li-nl-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-br-fr-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-yo-ng-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-fy-nl-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-zu-za-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-fo-fo-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-ar-ae-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-mt-mt-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-zh-tw-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-tn-za-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-es-sv-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-km-kh-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-bg-bg-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-en-gb-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-ne-np-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-es-es-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-fur-it-=
dev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-sl-si-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-lt-lt-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-ja-jp-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-kn-in-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-st-za-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-hi-in-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-es-ec-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-az-az-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-kk-kz-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-ca-es-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-ar-jo-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-ar-bh-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-zh-sg-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-be-by-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-ar-sd-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-ar-ye-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-nso-za-=
dev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-en-nz-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-mr-in-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-ig-ng-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-en-ng-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-nds-de-=
dev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-pt-pt-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-id-id-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-ve-za-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-as-in-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-lo-la-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-de-ch-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-en-dk-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-nb-no-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-tl-ph-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-gu-in-d=
ev
| libc6-dev: unsatisfied recommendation for
glibc-binary-localedata-uz-uz+cyrillic-dev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-es-hn-d=
ev
| libc6-dev: unsatisfied recommendation for
glibc-binary-localedata-sd-in+devanagari-dev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-se-no-d=
ev
| libc6-dev: unsatisfied recommendation for
glibc-binary-localedata-ks-in+devanagari-dev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-ar-om-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-kl-gl-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-iu-ca-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-sq-al-d=
ev
| libc6-dev: unsatisfied recommendation for
glibc-binary-localedata-tt-ru+iqtelif-dev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-nn-no-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-sd-in-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-da-dk-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-ru-ua-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-ca-it-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-en-ca-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-ru-ru-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-tk-tm-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-shs-ca-=
dev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-de-at-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-es-cr-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-es-cl-d=
ev
| libc6-dev: unsatisfied recommendation for
glibc-binary-localedata-sr-rs+latin-dev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-es-co-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-lg-ug-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-bo-cn-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-tt-ru-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-iw-il-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-ro-ro-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-el-cy-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-sv-se-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-es-pa-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-lv-lv-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-en-us-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-ha-ng-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-es-pe-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-nl-nl-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-hsb-de-=
dev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-es-py-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-sr-rs-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-et-ee-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-csb-pl-=
dev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-fi-fi-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-fr-fr-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-sr-me-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-es-pr-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-ku-tr-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-he-il-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-en-zw-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-hy-am-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-ber-dz-=
dev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-eu-es-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-si-lk-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-ml-in-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-gl-es-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-en-za-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-mg-mg-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-ar-tn-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-bs-ba-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-ast-es-=
dev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-ar-ma-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-li-be-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-ca-fr-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-en-in-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-vi-vn-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-mk-mk-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-en-ie-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-sk-sk-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-fr-lu-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-cs-cz-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-gd-gb-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-cy-gb-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-mi-nz-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-pap-an-=
dev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-or-in-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-hr-hr-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-ar-dz-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-zh-hk-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-is-is-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-ar-eg-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-nl-aw-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-ca-ad-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-ht-ht-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-es-ar-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-hu-hu-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-ka-ge-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-tr-cy-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-es-ve-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-om-ke-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-mai-in-=
dev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-sc-it-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-ss-za-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-th-th-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-ta-in-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-en-sg-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-ik-ca-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-ber-ma-=
dev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-xh-za-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-en-bw-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-kw-gb-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-gv-gb-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-bo-in-d=
ev
| libc6-dev: unsatisfied recommendation for glibc-binary-localedata-es-ni-d=
ev
| libc6-dev: unsatisfied recommendation for libcidn-dev
| libc6-dev: unsatisfied recommendation for libsegfault-dev
| libc6-dev: unsatisfied recommendation for glibc-extra-nss-dev
| libc6-dev: unsatisfied recommendation for glibc-thread-db-dev
| libc6-dev: unsatisfied recommendation for virtual-locale-bg-dev
| libc6-dev: unsatisfied recommendation for virtual-locale-en-gb-dev
| libc6-dev: unsatisfied recommendation for virtual-locale-fi-dev
| libc6-dev: unsatisfied recommendation for virtual-locale-ru-dev
| libc6-dev: unsatisfied recommendation for virtual-locale-rw-dev
| libc6-dev: unsatisfied recommendation for virtual-locale-nl-dev
| libc6-dev: unsatisfied recommendation for virtual-locale-de-dev
| libc6-dev: unsatisfied recommendation for virtual-locale-it-dev
| libc6-dev: unsatisfied recommendation for virtual-locale-tr-dev
| libc6-dev: unsatisfied recommendation for virtual-locale-cs-dev
| libc6-dev: unsatisfied recommendation for virtual-locale-locale.alias-dev
| libc6-dev: unsatisfied recommendation for virtual-locale-be-dev
| libc6-dev: unsatisfied recommendation for virtual-locale-ca-dev
| libc6-dev: unsatisfied recommendation for virtual-locale-sv-dev
| libc6-dev: unsatisfied recommendation for virtual-locale-pt-br-dev
| libc6-dev: unsatisfied recommendation for virtual-locale-lt-dev
| libc6-dev: unsatisfied recommendation for virtual-locale-pl-dev
| libc6-dev: unsatisfied recommendation for virtual-locale-da-dev
| libc6-dev: unsatisfied recommendation for virtual-locale-id-dev
| libc6-dev: unsatisfied recommendation for virtual-locale-ja-dev
| libc6-dev: unsatisfied recommendation for virtual-locale-fr-dev
| libc6-dev: unsatisfied recommendation for virtual-locale-el-dev
| libc6-dev: unsatisfied recommendation for virtual-locale-hu-dev
| libc6-dev: unsatisfied recommendation for virtual-locale-vi-dev
| libc6-dev: unsatisfied recommendation for virtual-locale-sk-dev
| libc6-dev: unsatisfied recommendation for virtual-locale-ko-dev
| libc6-dev: unsatisfied recommendation for virtual-locale-gl-dev
| libc6-dev: unsatisfied recommendation for virtual-locale-zh-cn-dev
| libc6-dev: unsatisfied recommendation for virtual-locale-es-dev
| libc6-dev: unsatisfied recommendation for virtual-locale-nb-dev
| libc6-dev: unsatisfied recommendation for virtual-locale-zh-tw-dev
| libc6-dev: unsatisfied recommendation for virtual-locale-hr-dev
| libc6-dev: unsatisfied recommendation for glibc-gconv-dev
| libc6-dev: unsatisfied recommendation for glibc-gconv-libjis-dev
| libc6-dev: unsatisfied recommendation for glibc-gconv-libjisx0213-dev
| libc6-dev: unsatisfied recommendation for glibc-gconv-libcns-dev
| libc6-dev: unsatisfied recommendation for glibc-gconv-libksc-dev
| libc6-dev: unsatisfied recommendation for glibc-gconv-libgb-dev
| libc6-dev: unsatisfied recommendation for glibc-gconv-libisoir165-dev
| libc6-dev: unsatisfied recommendation for
glibc-localedata-iso14651-t1-common-dev
| libc6-dev: unsatisfied recommendation for glibc-localedata-i18n-dev
| libc6-dev: unsatisfied recommendation for
glibc-localedata-translit-combining-dev
| libc6-dev: unsatisfied recommendation for glibc-localedata-iso14651-t1-de=
v
| libc6-dev: unsatisfied recommendation for glibc-localedata-hi-in-dev
| libc6-dev: unsatisfied recommendation for glibc-localedata-am-et-dev
| libc6-dev: unsatisfied recommendation for glibc-localedata-ti-et-dev
| libc6-dev: unsatisfied recommendation for glibc-localedata-en-in-dev
| libc6-dev: unsatisfied recommendation for glibc-localedata-be-by-dev
| libc6-dev: unsatisfied recommendation for glibc-localedata-es-es-dev
| libc6-dev: unsatisfied recommendation for glibc-localedata-en-us-dev
| libc6-dev: unsatisfied recommendation for glibc-localedata-ti-er-dev
| libc6-dev: unsatisfied recommendation for glibc-localedata-aa-et-dev
| libc6-dev: unsatisfied recommendation for glibc-localedata-en-dk-dev
| libc6-dev: unsatisfied recommendation for glibc-localedata-ar-eg-dev
| libc6-dev: unsatisfied recommendation for glibc-localedata-de-de-dev
| libc6-dev: unsatisfied recommendation for glibc-localedata-fr-be-dev
| libc6-dev: unsatisfied recommendation for glibc-localedata-zh-cn-dev
| libc6-dev: unsatisfied recommendation for glibc-localedata-sv-se-dev
| libc6-dev: unsatisfied recommendation for glibc-localedata-fi-fi-dev
| libc6-dev: unsatisfied recommendation for glibc-localedata-ru-ru-dev
| libc6-dev: unsatisfied recommendation for glibc-localedata-ur-pk-dev
| libc6-dev: unsatisfied recommendation for glibc-localedata-nb-no-dev
| libc6-dev: unsatisfied recommendation for glibc-localedata-en-za-dev
| libc6-dev: unsatisfied recommendation for glibc-localedata-om-ke-dev
| libc6-dev: unsatisfied recommendation for glibc-localedata-en-ng-dev
| libc6-dev: unsatisfied recommendation for glibc-localedata-nl-nl-dev
| libc6-dev: unsatisfied recommendation for glibc-localedata-en-gb-dev
| libc6-dev: unsatisfied recommendation for glibc-localedata-en-ca-dev
| libc6-dev: unsatisfied recommendation for glibc-localedata-wa-be-dev
| libc6-dev: unsatisfied recommendation for glibc-localedata-fr-be+euro-dev
| libc6-dev: unsatisfied recommendation for glibc-localedata-pl-pl-dev
| libc6-dev: unsatisfied recommendation for glibc-localedata-de-lu-dev
| libc6-dev: unsatisfied recommendation for glibc-localedata-om-et-dev
| libc6-dev: unsatisfied recommendation for glibc-localedata-el-gr-dev
| libc6-dev: unsatisfied recommendation for glibc-localedata-tr-tr-dev
| libc6-dev: unsatisfied recommendation for glibc-localedata-fr-fr-dev
| libc6-dev: unsatisfied recommendation for glibc-localedata-es-us-dev
| libc6-dev: unsatisfied recommendation for glibc-localedata-da-dk-dev
| libc6-dev: unsatisfied recommendation for glibc-localedata-aa-er-dev
| libc6-dev: unsatisfied recommendation for glibc-localedata-bo-cn-dev
| libc6-dev: unsatisfied recommendation for glibc-localedata-so-so-dev
| libc6-dev: unsatisfied recommendation for glibc-localedata-aa-dj-dev
| libc6-dev: unsatisfied recommendation for glibc-localedata-gez-er+abegede=
-dev
| libc6-dev: unsatisfied recommendation for glibc-localedata-gez-et-dev
| libc6-dev: unsatisfied recommendation for glibc-localedata-it-it-dev
| libc6-dev: unsatisfied recommendation for glibc-localedata-ga-ie-dev
| libc6-dev: unsatisfied recommendation for
glibc-localedata-translit-neutral-dev
| libc6-dev: unsatisfied recommendation for glibc-localedata-bn-bd-dev
| libc6-dev: unsatisfied recommendation for
glibc-localedata-translit-cjk-variants-dev
| libc6-dev: unsatisfied recommendation for glibc-localedata-de-at-dev
| libc6-dev: unsatisfied recommendation for glibc-localedata-sv-fi-dev
| libc6-dev: unsatisfied recommendation for glibc-localedata-fi-fi+euro-dev
| libc6-dev: unsatisfied recommendation for glibc-localedata-pt-pt-dev
| libc6-dev: unsatisfied recommendation for glibc-localedata-fr-lu-dev
| libc6-dev: unsatisfied recommendation for glibc-localedata-ca-es-dev
| libc6-dev: unsatisfied recommendation for glibc-localedata-cs-cz-dev
| libc6-dev: unsatisfied recommendation for glibc-localedata-sr-rs-dev
| libc6-dev: unsatisfied recommendation for glibc-localedata-gl-es-dev
| libc6-dev: unsatisfied recommendation for glibc-localedata-tl-ph-dev
| libc6-dev: unsatisfied recommendation for glibc-localedata-gez-er-dev
| libc6-dev: unsatisfied recommendation for glibc-localedata-translit-hangu=
l-dev
| libc6-dev: unsatisfied recommendation for glibc-localedata-crh-ua-dev
| libc6-dev: unsatisfied recommendation for glibc-localedata-br-fr-dev
| libc6-dev: unsatisfied recommendation for glibc-localedata-en-nz-dev
| libc6-dev: unsatisfied recommendation for glibc-localedata-nl-be-dev
| libc6-dev: unsatisfied recommendation for glibc-localedata-de-be-dev
| libc6-dev: unsatisfied recommendation for glibc-localedata-translit-circl=
e-dev
| libc6-dev: unsatisfied recommendation for
glibc-localedata-translit-cjk-compat-dev
| libc6-dev: unsatisfied recommendation for glibc-localedata-translit-compa=
t-dev
| libc6-dev: unsatisfied recommendation for glibc-localedata-translit-font-=
dev
| libc6-dev: unsatisfied recommendation for
glibc-localedata-translit-fraction-dev
| libc6-dev: unsatisfied recommendation for glibc-localedata-translit-narro=
w-dev
| libc6-dev: unsatisfied recommendation for glibc-localedata-translit-small=
-dev
| libc6-dev: unsatisfied recommendation for glibc-localedata-translit-wide-=
dev
| libc6-dev: unsatisfied recommendation for glibc-localedata-dz-bt-dev
| libc6-dev: unsatisfied recommendation for
glibc-localedata-iso14651-t1-pinyin-dev
| libc6-dev: unsatisfied recommendation for glibc-localedata-eu-es-dev
| libc6-dev: unsatisfied recommendation for glibc-localedata-pa-pk-dev
| libc6-dev: unsatisfied recommendation for glibc-localedata-en-ie-dev
| Installing angstrom-feed-configs (1.0-r11.5) to root...
| Downloading file:/home/hollisb/work/openembedded/build/tmp/deploy/glibc/i=
pk/ebony/angstrom-feed-configs_1.0-r11.5_ebony.ipk.
| Installing opkg-nogpg-nocurl (0.1.6+svnr538-r21.5) to root...
| Downloading file:/home/hollisb/work/openembedded/build/tmp/deploy/glibc/i=
pk/ppc440/opkg-nogpg-nocurl_0.1.6+svnr538-r21.5_ppc440.ipk.
| Installing libc6 (2.9-r36.3.5) to root...
| Downloading file:/home/hollisb/work/openembedded/build/tmp/deploy/glibc/i=
pk/ppc440/libc6_2.9-r36.3.5_ppc440.ipk.
| Configuring libc6.
| Configuring opkg-nogpg-nocurl.
| Configuring angstrom-feed-configs.
| Collected errors:
| =A0* satisfy_dependencies_for: Cannot satisfy the following
dependencies for task-sdk-bare:
| =A0* =A0 =A0libstdc++-dev *
| =A0* opkg_install_cmd: Cannot install package task-sdk-bare.
| NOTE: Found /home/hollisb/work/openembedded/build/tmp/deploy/glibc/ipk/pp=
c440/libc6_*_ppc440.ipk
| /home/hollisb/work/openembedded/build/tmp/sysroots/i686-linux/usr/bin/ipk=
g.py:39:
DeprecationWarning: the md5 module is deprecated; use hashlib instead
| =A0 import md5
| NOTE: Found /home/hollisb/work/openembedded/build/tmp/deploy/glibc/ipk/eb=
ony/angstrom-feed-configs_*_ebony.ipk
| /home/hollisb/work/openembedded/build/tmp/sysroots/i686-linux/usr/bin/ipk=
g.py:39:
DeprecationWarning: the md5 module is deprecated; use hashlib instead
| =A0 import md5
| NOTE: Found /home/hollisb/work/openembedded/build/tmp/deploy/glibc/ipk/pp=
c440/task-sdk-bare_*_ppc440.ipk
| /home/hollisb/work/openembedded/build/tmp/sysroots/i686-linux/usr/bin/ipk=
g.py:39:
DeprecationWarning: the md5 module is deprecated; use hashlib instead
| =A0 import md5
| NOTE: Found /home/hollisb/work/openembedded/build/tmp/deploy/glibc/ipk/pp=
c440/opkg-nogpg-nocurl_*_ppc440.ipk
| /home/hollisb/work/openembedded/build/tmp/sysroots/i686-linux/usr/bin/ipk=
g.py:39:
DeprecationWarning: the md5 module is deprecated; use hashlib instead
| =A0 import md5
| mv: cannot stat
`/home/hollisb/work/openembedded/build/tmp/work/ppc440-angstrom-linux/meta-=
toolchain-1.0-r0/sdk/image//usr/local/angstrom/powerpc/powerpc-angstrom-lin=
ux/usr/include/c++':
No such file or directory
NOTE: package meta-toolchain-1.0-r0: task do_populate_sdk: Failed
ERROR: TaskFailed event exception, aborting
ERROR: Task 11 (/home/hollisb/work/openembedded/openembedded.git/recipes/me=
ta/meta-toolchain.bb,
do_populate_sdk) failed with 256
ERROR: '/home/hollisb/work/openembedded/openembedded.git/recipes/meta/meta-=
toolchain.bb'
failed
ERROR: '/home/hollisb/work/openembedded/openembedded.git/recipes/meta/meta-=
toolchain.bb'
failed


