Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sean@chumby.com>) id 1Olsc1-0006yQ-1X
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Aug 2010 02:04:06 +0200
Received: by pwj1 with SMTP id 1so546885pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Aug 2010 17:03:44 -0700 (PDT)
Received: by 10.142.165.7 with SMTP id n7mr7668560wfe.158.1282176224597;
	Wed, 18 Aug 2010 17:03:44 -0700 (PDT)
Received: from [172.22.3.240] (ip65-44-204-2.z204-44-65.customer.algx.net
	[65.44.204.2])
	by mx.google.com with ESMTPS id w31sm942655wfd.20.2010.08.18.17.03.42
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 18 Aug 2010 17:03:43 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1081)
From: Sean Cross <sean@chumby.com>
In-Reply-To: <AANLkTinni2gtb_fb=Z_xp8ju3OhPtYf_dtAuzbXpOpxM@mail.gmail.com>
Date: Wed, 18 Aug 2010 17:03:39 -0700
Message-Id: <D0882A66-CB99-4D7F-8DDC-3E1600C90DCF@chumby.com>
References: <811234B8-DFDF-42A4-9064-757210CE3CE5@chumby.com>
	<AANLkTinni2gtb_fb=Z_xp8ju3OhPtYf_dtAuzbXpOpxM@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1081)
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: sean@chumby.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/3] Add falconwing machine config
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
X-List-Received-Date: Thu, 19 Aug 2010 00:04:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Aug 18, 2010, at 4:15 PM, Graham Gower wrote:

> On 19 August 2010 08:33, Sean Cross <sean@chumby.com> wrote:
>>=20
>> Signed-off-by: Sean Cross <sean@chumby.com>
>> ---
>>  conf/machine/chumby-falconwing.conf |   24 ++++++++++++++++++++++++
>>  1 files changed, 24 insertions(+), 0 deletions(-)
>>  create mode 100644 conf/machine/chumby-falconwing.conf
>> diff --git a/conf/machine/chumby-falconwing.conf =
b/conf/machine/chumby-falconwin
>> g.conf
>> new file mode 100644
>> index 0000000..ed48cdb
>> --- /dev/null
>> +++ b/conf/machine/chumby-falconwing.conf
>> @@ -0,0 +1,24 @@
>> +#@TYPE: Machine
>> +#@Name: chumby Falconwing machine config.+#@DESCRIPTION: Machine =
configuration for chumby Falconwing-based boards, such a
>=20
> You seem to have a missing newline in this part of the patch...

You're correct.  Terminal.app sometimes eats newlines when doing =
copy+paste, and I missed that.  Here's the machine config again.

The description is longer than 80 characters.  I see several machines =
that also have descriptions longer than 80 characters.  Is that =
acceptable?  If not, what is the preferred mechanism of breaking up data =
such as that?


Signed-off-by: Sean Cross <sean@chumby.com>
---
 conf/machine/chumby-falconwing.conf |   24 ++++++++++++++++++++++++
 1 files changed, 24 insertions(+), 0 deletions(-)
 create mode 100644 conf/machine/chumby-falconwing.conf

diff --git a/conf/machine/chumby-falconwing.conf =
b/conf/machine/chumby-falconwing.conf
new file mode 100644
index 0000000..ed48cdb
--- /dev/null
+++ b/conf/machine/chumby-falconwing.conf
@@ -0,0 +1,24 @@
+#@TYPE: Machine
+#@Name: chumby Falconwing machine config.
+#@DESCRIPTION: Machine configuration for chumby Falconwing-based =
boards, such as the chumby One
+
+TARGET_ARCH =3D "arm"
+
+MACHINE_GUI_CLASS =3D "smallscreen"
+MACHINE_DISPLAY_WIDTH_PIXELS =3D "320"
+MACHINE_DISPLAY_HEIGHT_PIXELS =3D "240"
+
+PREFERRED_PROVIDER_virtual/kernel =3D "linux-chumby-falconwing"
+PREFERRED_PROVIDER_virtual/bootloader =3D =
"bootstream-chumby-falconwing"
+
+require conf/machine/include/tune-arm926ejs.inc
+
+# used by sysvinit_2
+SERIAL_CONSOLE =3D "115200 ttyAM0"
+
+ROOT_FLASH_SIZE =3D "128"
+
+MACHINE_FEATURES =3D "kernel26 usbhost touchscreen ext2 ext3 vfat =
keyboard alsa"
+IMAGE_FSTYPES =3D "ext3.gz tar.gz"
+
+#MACHINE_ESSENTIAL_EXTRA_RDEPENDS =3D "virtual/bootloader"
--=20
1.7.0.4




