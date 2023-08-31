Return-Path: <tymoteusz.burak@3mdeb.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2332CC83F01
	for <webhook@archiver.kernel.org>; Thu, 31 Aug 2023 09:35:55 +0000 (UTC)
Received: from 9.mo561.mail-out.ovh.net (9.mo561.mail-out.ovh.net [87.98.184.141])
 by mx.groups.io with SMTP id smtpd.web11.12738.1693474545261389578
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Aug 2023 02:35:46 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: 3mdeb.com, ip: 87.98.184.141, mailfrom: tymoteusz.burak@3mdeb.com)
Received: from director11.ghost.mail-out.ovh.net (unknown [10.109.156.29])
	by mo561.mail-out.ovh.net (Postfix) with ESMTP id C309B26E86
	for <openembedded-devel@lists.openembedded.org>; Thu, 31 Aug 2023 09:35:42 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-nrn6c (unknown [10.110.171.76])
	by director11.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 500F21FE65
	for <openembedded-devel@lists.openembedded.org>; Thu, 31 Aug 2023 09:35:42 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.108])
	by ghost-submission-6684bf9d7b-nrn6c with ESMTPSA
	id BuBzCO5e8GS6mAAA3vBQDw
	(envelope-from <tymoteusz.burak@3mdeb.com>)
	for <openembedded-devel@lists.openembedded.org>; Thu, 31 Aug 2023 09:35:42 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-108S002840bbd1c-12d8-4a10-9eec-578ed266da5a,
                    24F096618063BA54365C50CE834CFFBB79FCB67F) smtp.auth=tymoteusz.burak@3mdeb.com
X-OVh-ClientIp: 213.192.77.249
Message-ID: <ead6306d-653c-d105-5b74-4e802d22fadd@3mdeb.com>
Date: Thu, 31 Aug 2023 11:35:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [oe] [meta-oe][PATCH v3] libfaketime: add recipe
Content-Language: en-US
To: openembedded-devel@lists.openembedded.org
References: <20230823085310.339821-1-tymoteusz.burak@3mdeb.com>
 <CAMKF1spPM9dRnHdyxuXbDXQn_x=uQ6b0WUGKzTaRTpfDnCP0vQ@mail.gmail.com>
From: Tymoteusz Burak <tymoteusz.burak@3mdeb.com>
In-Reply-To: <CAMKF1spPM9dRnHdyxuXbDXQn_x=uQ6b0WUGKzTaRTpfDnCP0vQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Ovh-Tracer-Id: 6840404884524421269
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedrudegtddgudekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefkffggfgfuvfhfhfgjtgfgsehtkeertddtfeejnecuhfhrohhmpefvhihmohhtvghushiiuceuuhhrrghkuceothihmhhothgvuhhsiidrsghurhgrkhesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhephfefieefkeetleefuefhhedutdeludffueduvdehhfetheegvdfgtdfhudekfedtnecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghdpohhpvghnvghmsggvugguvggurdhorhhgnecukfhppeduvdejrddtrddtrddupddvudefrdduledvrdejjedrvdegledpfeejrdehledrudegvddruddtkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehthihmohhtvghushiirdgsuhhrrghkseefmhguvggsrdgtohhmqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdquggvvhgvlheslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdfovfetjfhoshhtpehmohehiedupdhmohguvgepshhmthhpohhuth
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 31 Aug 2023 09:35:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104682

Hello everyone,

I hope you're doing well. Your feedback is much appreciated, and I'd=20
like to provide some context on a few matters.

I understand that there's a reported Clang build failure with the patch.=20
I'd like to clarify that I don't currently have Clang configured on my=20
workstation, and I'm not entirely familiar with the steps required to=20
address this issue. If someone could provide guidance on how to=20
investigate and resolve this specific problem, I'd be grateful. The=20
libfaketime recipe I submitted is from a few projects ago, and it worked=20
successfully when I tested it in a fresh project environment. I aimed to=20
contribute this recipe to the OpenEmbedded layer to benefit the=20
community. I apologize for any inconvenience the build failure might be=20
causing and appreciate your assistance in ensuring the patch's=20
compatibility.

ll happily review the RFC patch and adress other issues as i have to=20
agree that the package name lib32-liblib32-libfaketime is quite ridiculou=
s

Once again, thank you for your time and feedback. I look forward to your=20
guidance and advice on how to proceed with resolving the issues raised.

Best regards, Tymoteusz Burak

On 8/24/23 09:54, Khem Raj wrote:
> fails to compile with clang
>
> https://errors.yoctoproject.org/Errors/Details/732866/
>
> -Wno-nonnull-compare seems to be not a portable option
>
> On Wed, Aug 23, 2023 at 1:53=E2=80=AFAM Tymoteusz Burak
> <tymoteusz.burak@3mdeb.com> wrote:
>> This commit adds the libfaketime library recipe, which provides time
>> manipulation capabilities for testing and debugging purposes. libfaket=
ime allows
>> developers to modify the system time reported to applications, aiding =
in scenarios
>> where accurate time emulation is required.
>>
>> I deleted the extra flags altogether as they seem to be only necessary
>> for old versions of this project (0.9.6).
>>
>> CC: Khem Raj <raj.khem@gmail.com>
>> Signed-off-by: Tymoteusz Burak <tymoteusz.burak@3mdeb.com>
>> ---
>>   .../libfaketime/libfaketime_0.9.10.bb         | 30 +++++++++++++++++=
++
>>   1 file changed, 30 insertions(+)
>>   create mode 100644 meta-oe/recipes-test/libfaketime/libfaketime_0.9.=
10.bb
>>
>> diff --git a/meta-oe/recipes-test/libfaketime/libfaketime_0.9.10.bb b/=
meta-oe/recipes-test/libfaketime/libfaketime_0.9.10.bb
>> new file mode 100644
>> index 000000000000..7500e57658aa
>> --- /dev/null
>> +++ b/meta-oe/recipes-test/libfaketime/libfaketime_0.9.10.bb
>> @@ -0,0 +1,30 @@
>> +DESCRIPTION =3D "A library for faking the system time in user-space p=
rograms"
>> +SECTION =3D "libs"
>> +LICENSE =3D "GPL-2.0-only"
>> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf=
4a4263"
>> +
>> +SRCREV =3D "d475b925943ad404c6c728ac868dc73949e7281c"
>> +SRC_URI =3D "\
>> +    git://git@github.com/wolfcw/libfaketime.git;branch=3Dmaster;proto=
col=3Dhttps \
>> +    "
>> +
>> +S =3D "${WORKDIR}/git"
>> +
>> +do_configure[noexec] =3D "1"
>> +do_compile () {
>> +    oe_runmake
>> +}
>> +do_install () {
>> +    install -d ${D}${libdir}/faketime
>> +    oe_libinstall -C src libfaketime ${D}${libdir}/faketime
>> +    install -d ${D}${bindir}
>> +    install -m 0755 src/faketime ${D}${bindir}
>> +}
>> +
>> +PACKAGES =3D+ "lib${PN}"
>> +
>> +FILES:${PN} =3D "${bindir}/faketime"
>> +FILES:lib${PN} =3D "${libdir}/faketime/*"
>> +
>> +INSANE_SKIP:${PN} +=3D "dev-so"
>> +INSANE_SKIP:lib${PN} +=3D "dev-so"
>> --
>> 2.41.0
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#104557): https://lists.openembedded.org/g/openembe=
dded-devel/message/104557
>> Mute This Topic: https://lists.openembedded.org/mt/100911255/7790941
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
 [tymoteusz.burak@3mdeb.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

