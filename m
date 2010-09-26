Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <iwamatsu@nigauri.org>) id 1P008I-0002Oj-6W
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Sep 2010 00:55:47 +0200
Received: by pvg6 with SMTP id 6so1105324pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 26 Sep 2010 15:55:32 -0700 (PDT)
Received: by 10.142.192.9 with SMTP id p9mr5586665wff.165.1285541732598; Sun,
	26 Sep 2010 15:55:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.142.188.10 with HTTP; Sun, 26 Sep 2010 15:55:12 -0700 (PDT)
In-Reply-To: <4C9FB705.8040003@eukrea.com>
References: <1285365372-13498-1-git-send-email-iwamatsu@nigauri.org>
	<AANLkTi=hAYRVMX9xNsPXXiuDC3536An1jX_tFmP1PLf3@mail.gmail.com>
	<AANLkTik=25UpZruyMGJ4LMm6Dd=d6p5yvt4sLcD=EO1k@mail.gmail.com>
	<4C9FB705.8040003@eukrea.com>
From: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Date: Mon, 27 Sep 2010 07:55:12 +0900
Message-ID: <AANLkTinMvDz3KNovQVhUEfMOO+KR_ixDbcWtQbGWPOL=@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.175
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
X-List-Received-Date: Sun, 26 Sep 2010 22:55:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,

2010/9/27 Eric B=E9nard <eric@eukrea.com>:
> Hi,
>
> Le 26/09/2010 22:42, Nobuhiro Iwamatsu a =E9crit :
>>
>> 2010/9/25 Khem Raj<raj.khem@gmail.com>:
>>>
>>> On Fri, Sep 24, 2010 at 2:56 PM, Nobuhiro Iwamatsu<iwamatsu@nigauri.org=
>
>>> =A0wrote:
>>>>
>>>> --- a/conf/machine/include/tune-sh4.inc
>>>> +++ b/conf/machine/include/tune-sh4.inc
>>>> @@ -1,3 +1,5 @@
>>>> +# If you want to optimize to sh4a, you need to change
>>>> +# from -m4 to m4a.
>>>> =A0TARGET_CC_ARCH =3D "-ml -m4"
>>>> =A0FEED_ARCH =3D "sh4"
>>>> =A0BASE_PACKAGE_ARCH =3D "sh4"
>>>
>>> you could add another tune file for sh4a called
>>> tune-sh4a.inc and include that for appropriate
>>> machines. rest of patch looks good to me.
>>
>> I want to make optimization of m4 a default.
>> The reason is because there is not compatibility in m4 and m4a.
>> It is a memo for the person whom it wants to optimize in m4a that I
>> wrote in tune-sh4.inc.
>>
>> I thought that I have had better take off a memo if confusion happened
>> by this memo.
>> How do you think?
>>
> As Khem said, it's better to have tune-sh4a.inc & tune-sh4.inc in the
> include directory which let the user the possibility to include the one h=
e
> wants in his machine configuration file (without the need to modifiy the
> include file).

Oh, sorry. I misread. I will send new patch.

Best regards,
  Nobuhiro


--=20
Nobuhiro Iwamatsu


