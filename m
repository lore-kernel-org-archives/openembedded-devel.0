Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web12.25987.1601252760172751662
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2020 17:26:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: kai.kang@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 08S0Putt017288
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Sun, 27 Sep 2020 17:25:56 -0700 (PDT)
Received: from [128.224.162.131] (128.224.162.131) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Sun, 27 Sep 2020
 17:25:55 -0700
Subject: Re: [oe] [meta-networking][PATCH] crda: rdepends on wireless-regdb-static
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>
CC: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20200924093539.23693-1-kai.kang@windriver.com>
 <CALbNGRS_hYCpvLcnsdXL9Pj-gFx0vGEGHgxyBVJonKTfPE8VOA@mail.gmail.com>
 <92d5d20b-4c01-80ce-0ea5-56428cd08a28@windriver.com>
 <CALbNGRRy6mSg+Hu4fv0kC+-oYxCOuct30apOYpP0rjgrM-E-eA@mail.gmail.com>
From: "kai" <kai.kang@windriver.com>
Message-ID: <f6b5549c-affc-2f7a-10d7-0fd08ffc234f@windriver.com>
Date: Mon, 28 Sep 2020 08:25:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CALbNGRRy6mSg+Hu4fv0kC+-oYxCOuct30apOYpP0rjgrM-E-eA@mail.gmail.com>
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id 08S0Putt017288
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 9/27/20 11:15 PM, Andreas M=C3=BCller wrote:
> On Fri, Sep 25, 2020 at 2:52 AM Kang Kai <Kai.Kang@windriver.com> wrote=
:
>> On 9/25/20 5:36 AM, Andreas M=C3=BCller wrote:
>>
>> On Thu, Sep 24, 2020 at 11:36 AM kai <kai.kang@windriver.com> wrote:
>>
>> From: Robert Yang <liezhi.yang@windriver.com>
>>
>> The wireless-regdb has been moved to oe-core. According the commit
>> message:
>>
>> wireless-regdb-static should be used with kernel >=3D 4.15.
>> wireless-regdb can be used with older kernels and is mostly
>> irrelevant here, but keeping it in meta-networking would
>> create needless recipe duplication.
>>
>> it should replace runtime dependency wireless-regdb with
>> wireless-regdb-static.
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   meta-networking/recipes-connectivity/crda/crda_3.18.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-networking/recipes-connectivity/crda/crda_3.18.bb b/=
meta-networking/recipes-connectivity/crda/crda_3.18.bb
>> index b380eaf94..e59d2f437 100644
>> --- a/meta-networking/recipes-connectivity/crda/crda_3.18.bb
>> +++ b/meta-networking/recipes-connectivity/crda/crda_3.18.bb
>> @@ -35,4 +35,4 @@ do_install() {
>>       oe_runmake SBINDIR=3D${sbindir}/ install
>>   }
>>
>> -RDEPENDS_${PN} =3D "udev wireless-regdb"
>> +RDEPENDS_${PN} =3D "udev wireless-regdb-static"
>>
>> It was wrong/at least dangerous before this - but the operator '+=3D'
>> should be used
>>
>> Hi Andreas,
>>
>> Thanks for your comment.
>>
>> I do not get your point why it is dangerous. From output of 'bitbake -=
e crda', RDEPENDS_crda is evaluated by:
>>
>> # $RDEPENDS_crda [2 operations]
>> #   set /buildarea6/kkang/Yocto/meta-openembedded/meta-networking/reci=
pes-connectivity/crda/crda_3.18.bb:38
>> #     "udev wireless-regdb-static"
>> #   rename from RDEPENDS_${PN} data.py:104 [expandKeys]
>> #     "udev wireless-regdb-static"
>> # pre-expansion value:
>> #   "udev wireless-regdb-static"
>> RDEPENDS_crda=3D"udev wireless-regdb-static"
>>
>> It does not show differences compares to other recipes that "RDEPENDS_=
${PN} =3D" widely used.
>>
> I could swear there were times that just using '=3D' overided the
> RDEPNEDS done by ldd-like-magic. Checked in pkgdata: the results are
> the same. So: Sorry for the noise

It is ok. Thanks all the same.

Regards,
Kai

>
> Andreas


--=20
Kai Kang
Wind River Linux

