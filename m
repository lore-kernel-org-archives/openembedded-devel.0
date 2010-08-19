Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sean@chumby.com>) id 1Oly4y-0005KD-5N
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Aug 2010 07:54:21 +0200
Received: by pxi11 with SMTP id 11so563027pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Aug 2010 22:53:59 -0700 (PDT)
Received: by 10.114.79.11 with SMTP id c11mr10756115wab.166.1282197239362;
	Wed, 18 Aug 2010 22:53:59 -0700 (PDT)
Received: from [192.168.10.101] ([75.85.181.233])
	by mx.google.com with ESMTPS id k23sm1942172waf.17.2010.08.18.22.53.57
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 18 Aug 2010 22:53:58 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1081)
From: Sean Cross <sean@chumby.com>
In-Reply-To: <AANLkTimMOkX_oRmKZxEq2JxWfvTEoPEL4jcxHh0jTNsE@mail.gmail.com>
Date: Wed, 18 Aug 2010 22:53:52 -0700
Message-Id: <F67005C9-BC6E-4338-B05B-3DD4C7C8536B@chumby.com>
References: <811234B8-DFDF-42A4-9064-757210CE3CE5@chumby.com>
	<AANLkTimMOkX_oRmKZxEq2JxWfvTEoPEL4jcxHh0jTNsE@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1081)
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: sean@chumby.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
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
X-List-Received-Date: Thu, 19 Aug 2010 05:54:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

On Aug 18, 2010, at 10:47 PM, Khem Raj wrote:

> On Wed, Aug 18, 2010 at 4:03 PM, Sean Cross <sean@chumby.com> wrote:
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
>> s the chumby One
>> +
>> +TARGET_ARCH =3D "arm"
>> +
>> +MACHINE_GUI_CLASS =3D "smallscreen"
>> +MACHINE_DISPLAY_WIDTH_PIXELS =3D "320"
>> +MACHINE_DISPLAY_HEIGHT_PIXELS =3D "240"
>> +
>> +PREFERRED_PROVIDER_virtual/kernel =3D "linux-chumby-falconwing"
>> +PREFERRED_PROVIDER_virtual/bootloader =3D =
"bootstream-chumby-falconwing"
>> +
>> +require conf/machine/include/tune-arm926ejs.inc
>> +
>> +# used by sysvinit_2
>> +SERIAL_CONSOLE =3D "115200 ttyAM0"
>=20
> should this be ttyAMA0 ?

No, the debug serial port on this device is /dev/ttyAM0.=


