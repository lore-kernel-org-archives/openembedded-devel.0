Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QzAx3-0004Ci-Gx
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Sep 2011 19:21:17 +0200
Received: by wyf19 with SMTP id 19so1579672wyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Sep 2011 10:16:22 -0700 (PDT)
Received: by 10.227.5.136 with SMTP id 8mr86390wbv.46.1314897381815;
	Thu, 01 Sep 2011 10:16:21 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id eo6sm199443wbb.31.2011.09.01.10.16.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Sep 2011 10:16:18 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <201109011906.43131.schnitzeltony@gmx.de>
Date: Thu, 1 Sep 2011 19:16:14 +0200
Message-Id: <40821C64-BCFD-40FD-9A08-D44B3B8288D2@dominion.thruhere.net>
References: <1314863091-17113-1-git-send-email-koen@dominion.thruhere.net>
	<201109011906.43131.schnitzeltony@gmx.de>
To: =?iso-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@gmx.de>
X-Mailer: Apple Mail (2.1244.3)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-xfce] task-xfce-base: add thunar-volman
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
X-List-Received-Date: Thu, 01 Sep 2011 17:21:17 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 1 sep. 2011, om 19:06 heeft Andreas M=FCller het volgende geschreven:

> On Thursday, September 01, 2011 09:44:51 AM you wrote:
>> This fixes:
>>=20
>> ERROR: There is a comment on line 34 of file
>> =
/OE/tentacle/sources/meta-openembedded/meta-xfce/recipes-xfce/tasks/task-x=

>> fce-base.bb (#    thunar-volman \) which is in the middle of a =
multiline
>> expression. Bitbake used to ignore these but no longer does so, =
please fix
>> your metadata as errors are likely as a result of this change.
>>=20
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> ---
>> meta-xfce/recipes-xfce/tasks/task-xfce-base.bb |    4 ++--
>> 1 files changed, 2 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/meta-xfce/recipes-xfce/tasks/task-xfce-base.bb
>> b/meta-xfce/recipes-xfce/tasks/task-xfce-base.bb index =
8a87203..7589f6d
>> 100644
>> --- a/meta-xfce/recipes-xfce/tasks/task-xfce-base.bb
>> +++ b/meta-xfce/recipes-xfce/tasks/task-xfce-base.bb
>> @@ -2,7 +2,7 @@ DESCRIPTION =3D "All packages required for a base
>> installation of XFCE" SECTION =3D "x11/wm"
>> LICENSE =3D "MIT"
>> LIC_FILES_CHKSUM =3D
>> "file://${COREBASE}/LICENSE;md5=3D3f40d7994397109285ec7b81fdeb3b58" =
-PR =3D
>> "r0"
>> +PR =3D "r1"
>>=20
>> inherit task
>>=20
>> @@ -31,5 +31,5 @@ RDEPENDS_${PN} =3D " \
>>     xfce4-settings \
>>     xfce-terminal \
>>     thunar \
>> -#    thunar-volman \
>> +    thunar-volman \
>> "
> Acked-by: Andreas M=FCller <schnitzeltony@gmx.de>
>=20
> By the way: what is the automated / correct workflow to=20
>=20
> * apply a patch ( wget from patchwork & 'git am'? )=20
> * generate 'acked by' / 'tested by' / .. messages=20

What I do when applying a patch:

$ /OE/org.openembedded.dev/contrib/patchwork/pw-am.sh 10827
$ git show
$ git push

patchwork will have gathered all acked-by/signed-off-by from the =
followup emails.

When replying to a patch I type up the acked-by stuff manually.

Not sure how correct and/or optimal this is, but this is how I do it :)

regards,

Koen



