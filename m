Return-Path: <amery@hanoverdisplays.com>
Received: from mail.hanoverdisplays.com (mail.hanoverdisplays.com [62.7.92.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2329071985
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jun 2017 11:07:57 +0000 (UTC)
Received: from MAILDB.hanover.local ([fe80::6c2c:e4ad:bf0a:351d]) by
	mail.hanover.local ([fe80::1440:163c:a37d:4312%11]) with mapi id
	14.03.0319.002; Mon, 26 Jun 2017 12:07:57 +0100
From: Alejandro Mery <amery@hanoverdisplays.com>
To: Denys Dmytriyenko <denis@denix.org>
Thread-Topic: [oe] [meta-oe][morty][PATCH 2/6] devmem2: use different
	filename to avoid checksum conflicts
Thread-Index: AQHS7GHcZ/l+1apy30+nd7iNPqaC9w==
Date: Mon, 26 Jun 2017 11:07:57 +0000
Message-ID: <CF323D845261FD4F9B1E997381250334E339D351@maildb.hanover.local>
References: <20170623202324.69194-1-amery@hanoverdisplays.com>
	<20170623202324.69194-3-amery@hanoverdisplays.com>
	<CAMKF1srbObwq=vu3CFniU4QCSJYVbXBX0vRKPVe8Bp+8YZtEdw@mail.gmail.com>
	<20170623205258.GZ28053@denix.org>
	<CAMKF1spD61bKRS1nAKG1PTGfzjENQ8d_Z0tFJj206=veOjDP-A@mail.gmail.com>
	<20170623211459.GA28053@denix.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.0.207]
MIME-Version: 1.0
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, Denys
	Dmytriyenko <denys@ti.com>
Subject: Re: [meta-oe][morty][PATCH 2/6] devmem2: use different filename to avoid checksum conflicts
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 26 Jun 2017 11:07:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

On 23/06/17 22:15, Denys Dmytriyenko wrote:=0A=
> On Fri, Jun 23, 2017 at 02:08:06PM -0700, Khem Raj wrote:=0A=
>> On Fri, Jun 23, 2017 at 1:52 PM, Denys Dmytriyenko <denis@denix.org> wro=
te:=0A=
>>> On Fri, Jun 23, 2017 at 01:46:28PM -0700, Khem Raj wrote:=0A=
>>>> On Fri, Jun 23, 2017 at 1:23 PM, Alejandro Mery=0A=
>>>> <amery@hanoverdisplays.com> wrote:=0A=
>>>>> From: Denys Dmytriyenko <denys@ti.com>=0A=
>>>>>=0A=
>>>>> The newly resurrected devmem2.c file besides having a new location, a=
lso=0A=
>>>>> updates its header, producing different checksums, which would confli=
ct=0A=
>>>>> with any previously cached or mirrored instances. To avoid such confl=
icts,=0A=
>>>>> use a different filename in fetch(). Rename it back to original name =
at=0A=
>>>>> unpack() for devmem2-fixups-2.patch to succeed w/o modifications.=0A=
>>>>>=0A=
>>>>> WARNING: devmem2-1.0-r7 do_fetch: Fetcher failure for URL: 'http://ww=
w.free-electrons.com/pub/mirror/devmem2.c'. Checksum mismatch!=0A=
>>>>> File: '/OE/master/downloads/devmem2.c' has md5 checksum be12c0132a1ae=
118cbf5e79d98427c1d when e23f236e94be4c429aa1ceac0f01544b was expected=0A=
>>>>> File: '/OE/master/downloads/devmem2.c' has sha256 checksum ec382c90af=
3ef2f49695ff14a4d6521e58ac482c4e29d6c9ebca8768f699c191 when 3b15515693bae1e=
bd14d914e46d388edfec2175829ea1576a7a0c8606ebbe639 was expected=0A=
>>>>> If this change is expected (e.g. you have upgraded to a new version w=
ithout updating the checksums) then you can use these lines within the reci=
pe:=0A=
>>>>> SRC_URI[md5sum] =3D "be12c0132a1ae118cbf5e79d98427c1d"=0A=
>>>>> SRC_URI[sha256sum] =3D "ec382c90af3ef2f49695ff14a4d6521e58ac482c4e29d=
6c9ebca8768f699c191"=0A=
>>>>> Otherwise you should retry the download and/or check with upstream to=
 determine if the file has become corrupted or otherwise unexpectedly modif=
ied.=0A=
>>>>>=0A=
>>>>> WARNING: devmem2-1.0-r7 do_fetch: Renaming /OE/sources/devmem2.c to /=
OE/sources/devmem2.c_bad-checksum_be12c0132a1ae118cbf5e79d98427c1d=0A=
>>>>>=0A=
>>>>> Signed-off-by: Denys Dmytriyenko <denys@ti.com>=0A=
>>>>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>=0A=
>>>>> ---=0A=
>>>>>  meta-oe/recipes-support/devmem2/devmem2.bb | 6 +++++-=0A=
>>>>>  1 file changed, 5 insertions(+), 1 deletion(-)=0A=
>>>>>=0A=
>>>>> diff --git a/meta-oe/recipes-support/devmem2/devmem2.bb b/meta-oe/rec=
ipes-support/devmem2/devmem2.bb=0A=
>>>>> index c42eb5e0b..c86eb2e4b 100644=0A=
>>>>> --- a/meta-oe/recipes-support/devmem2/devmem2.bb=0A=
>>>>> +++ b/meta-oe/recipes-support/devmem2/devmem2.bb=0A=
>>>>> @@ -3,12 +3,16 @@ LICENSE =3D "GPLv2+"=0A=
>>>>>  LIC_FILES_CHKSUM =3D "file://devmem2.c;endline=3D38;md5=3Da9eb9f3890=
384519f435aedf986297cf"=0A=
>>>>>  PR =3D "r7"=0A=
>>>>>=0A=
>>>>> -SRC_URI =3D "http://www.free-electrons.com/pub/mirror/devmem2.c \=0A=
>>>>> +SRC_URI =3D "http://www.free-electrons.com/pub/mirror/devmem2.c;down=
loadfilename=3Ddevmem2-new.c \=0A=
>>>>>             file://devmem2-fixups-2.patch;apply=3Dyes;striplevel=3D0"=
=0A=
>>>>>  S =3D "${WORKDIR}"=0A=
>>>>>=0A=
>>>> can we explore use of downloadfilename=3D parameter of http/ftp fetche=
r=0A=
>>> Sure, here are the corresponding sources where it's handled:=0A=
>>> http://cgit.openembedded.org/bitbake/tree/lib/bb/fetch2/wget.py#n65=0A=
>>>=0A=
>> ah this is rightly being used, I somehow thought it was not used but=0A=
>> that actually the change above.=0A=
>>>>>  CFLAGS +=3D "-DFORCE_STRICT_ALIGNMENT"=0A=
>>>>>=0A=
>>>>> +python do_unpack_append() {=0A=
>>>>> +    os.rename("devmem2-new.c", "devmem2.c")=0A=
>>>>> +}=0A=
>>>>> +=0A=
>> perhaps we do not need to rename it we can say do=0A=
>>=0A=
>>  ${CC} -o devmem2 devmem2-new.c ${CFLAGS} ${LDFLAGS}=0A=
> This is the fourth or fifth time this is being suggested. We should merge=
 it =0A=
> already, as I'm getting tired of explaining it... :)=0A=
>=0A=
> http://lists.openembedded.org/pipermail/openembedded-devel/2017-June/1130=
42.html=0A=
=0A=
do you know when morty's maintainer will return?=0A=

