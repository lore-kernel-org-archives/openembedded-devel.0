Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <iwamatsu@nigauri.org>) id 1Ozy3n-0001Uv-Vl
	for openembedded-devel@lists.openembedded.org;
	Sun, 26 Sep 2010 22:43:02 +0200
Received: by pxi11 with SMTP id 11so1233179pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 26 Sep 2010 13:42:47 -0700 (PDT)
Received: by 10.142.110.6 with SMTP id i6mr5465042wfc.276.1285533767609; Sun,
	26 Sep 2010 13:42:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.142.188.10 with HTTP; Sun, 26 Sep 2010 13:42:26 -0700 (PDT)
In-Reply-To: <AANLkTi=hAYRVMX9xNsPXXiuDC3536An1jX_tFmP1PLf3@mail.gmail.com>
References: <1285365372-13498-1-git-send-email-iwamatsu@nigauri.org>
	<AANLkTi=hAYRVMX9xNsPXXiuDC3536An1jX_tFmP1PLf3@mail.gmail.com>
From: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Date: Mon, 27 Sep 2010 05:42:26 +0900
Message-ID: <AANLkTik=25UpZruyMGJ4LMm6Dd=d6p5yvt4sLcD=EO1k@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: iwamatsu@nigauri.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v2] machine/sh7785lcr: Add new machine for Renesas SH7785 reference board
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
X-List-Received-Date: Sun, 26 Sep 2010 20:43:02 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,

2010/9/25 Khem Raj <raj.khem@gmail.com>:
> On Fri, Sep 24, 2010 at 2:56 PM, Nobuhiro Iwamatsu <iwamatsu@nigauri.org>=
 wrote:
>> * Machine config for Renesas SH7785 reference board.
>> * Add kernel config for 2.6.32 and 35.
>>
>> Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
>> ---
>> =A0conf/machine/include/tune-sh4.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
=A02 +
>> =A0conf/machine/sh7785lcr.conf =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 20 +
>> =A0recipes/linux/linux-2.6.32/sh7785lcr/defconfig | 1833 +++++++++++++++=
+++++++
>> =A0recipes/linux/linux-2.6.35/sh7785lcr/defconfig | 1927 +++++++++++++++=
+++++++++
>> =A0recipes/linux/linux_2.6.32.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 =A01 +
>> =A0recipes/linux/linux_2.6.35.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 =A01 +
>> =A06 files changed, 3784 insertions(+), 0 deletions(-)
>> =A0create mode 100644 conf/machine/sh7785lcr.conf
>> =A0create mode 100644 recipes/linux/linux-2.6.32/sh7785lcr/defconfig
>> =A0create mode 100644 recipes/linux/linux-2.6.35/sh7785lcr/defconfig
>>
>> diff --git a/conf/machine/include/tune-sh4.inc b/conf/machine/include/tu=
ne-sh4.inc
>> index 5d43e41..56c75a8 100644
>> --- a/conf/machine/include/tune-sh4.inc
>> +++ b/conf/machine/include/tune-sh4.inc
>> @@ -1,3 +1,5 @@
>> +# If you want to optimize to sh4a, you need to change
>> +# from -m4 to m4a.
>> =A0TARGET_CC_ARCH =3D "-ml -m4"
>> =A0FEED_ARCH =3D "sh4"
>> =A0BASE_PACKAGE_ARCH =3D "sh4"
>
> you could add another tune file for sh4a called
> tune-sh4a.inc and include that for appropriate
> machines. rest of patch looks good to me.

I want to make optimization of m4 a default.
The reason is because there is not compatibility in m4 and m4a.
It is a memo for the person whom it wants to optimize in m4a that I
wrote in tune-sh4.inc.

I thought that I have had better take off a memo if confusion happened
by this memo.
How do you think?

Best regards,
  Nobuhiro

--=20
Nobuhiro Iwamatsu
=A0=A0 iwamatsu at {nigauri.org / debian.org}
=A0=A0 GPG ID: 40AD1FA6


