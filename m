Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <iwamatsu@nigauri.org>) id 1OzGGc-0004jk-8D
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Sep 2010 23:57:19 +0200
Received: by iwn2 with SMTP id 2so919720iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Sep 2010 14:57:10 -0700 (PDT)
Received: by 10.231.169.10 with SMTP id w10mr4556203iby.106.1285365430181;
	Fri, 24 Sep 2010 14:57:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.15.205 with HTTP; Fri, 24 Sep 2010 14:56:48 -0700 (PDT)
In-Reply-To: <4C9CC62F.5000804@eukrea.com>
References: <1285339946-7340-1-git-send-email-iwamatsu@nigauri.org>
	<4C9CC62F.5000804@eukrea.com>
From: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Date: Sat, 25 Sep 2010 06:56:48 +0900
Message-ID: <AANLkTik=gf72n2S3sYeoOM3o3woEZbaVNO+g9xK3fn5W@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: iwamatsu@nigauri.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] machine/sh7785lcr: Add new machine for Renesas SH7785 reference board
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
X-List-Received-Date: Fri, 24 Sep 2010 21:57:19 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,

Thanks for your patch review.

2010/9/25 Eric B=E9nard <eric@eukrea.com>:
> Hi,
>
> Le 24/09/2010 16:52, Nobuhiro Iwamatsu a =E9crit :
>>
>> * Machine config for Renesas SH7785 reference board.
>> * Add kernel config for 2.6.32, 33, 34 and 35.
>>
>> Signed-off-by: Nobuhiro Iwamatsu<iwamatsu@nigauri.org>
>> ---
>> =A0conf/machine/include/tune-sh4.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
=A02 +
>> =A0conf/machine/sh7785lcr.conf =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 20 +
>> =A0recipes/linux/linux-2.6.32/sh7785lcr/defconfig | 1833
>> ++++++++++++++++++++++
>> =A0recipes/linux/linux-2.6.33/sh7785lcr/defconfig | 1869
>> +++++++++++++++++++++++
>> =A0recipes/linux/linux-2.6.34/sh7785lcr/defconfig | 1877
>> +++++++++++++++++++++++
>> =A0recipes/linux/linux-2.6.35/sh7785lcr/defconfig | 1927
>> ++++++++++++++++++++++++
>> =A0recipes/linux/linux_2.6.35.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 =A01 +
>> =A07 files changed, 7529 insertions(+), 0 deletions(-)
>> =A0create mode 100644 conf/machine/sh7785lcr.conf
>> =A0create mode 100644 recipes/linux/linux-2.6.32/sh7785lcr/defconfig
>> =A0create mode 100644 recipes/linux/linux-2.6.33/sh7785lcr/defconfig
>> =A0create mode 100644 recipes/linux/linux-2.6.34/sh7785lcr/defconfig
>> =A0create mode 100644 recipes/linux/linux-2.6.35/sh7785lcr/defconfig
>>
> you only neet to add the defconfig for the kernel you support (2.6.35) as
> the other files won't be used.
>

OK, I will re-send.

Best regards,
  Nobuhiro



--=20
Nobuhiro Iwamatsu
=A0=A0 iwamatsu at {nigauri.org / debian.org}
=A0=A0 GPG ID: 40AD1FA6


