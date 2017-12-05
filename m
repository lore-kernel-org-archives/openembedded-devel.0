Return-Path: <s.mueller-klieser@phytec.de>
Received: from root.phytec.de (mail.phycard.de [217.6.246.34])
	by mail.openembedded.org (Postfix) with ESMTP id E1EFF71B2A
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Dec 2017 11:33:41 +0000 (UTC)
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by root.phytec.de (Postfix) with ESMTP id 9CF66A00273;
	Tue,  5 Dec 2017 12:35:49 +0100 (CET)
Received: from [172.16.26.141] ([172.16.26.141])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
	with ESMTP id 2017120512334181-46667 ;
	Tue, 5 Dec 2017 12:33:41 +0100 
From: =?UTF-8?Q?Stefan_M=c3=bcller-Klieser?= <s.mueller-klieser@phytec.de>
To: Khem Raj <raj.khem@gmail.com>
References: <1512125321-16818-1-git-send-email-s.mueller-klieser@phytec.de>
	<CAMKF1sq_bpdNvfeSB_kGEJEZcvTsLdPvdj907MeUdyf0mQHz=A@mail.gmail.com>
	<21cfce60-9b13-c382-20d7-d50fb98c2c46@phytec.de>
Organization: PHYTEC Messtechnik GmbH
Message-ID: <e5844c4d-c2ac-01f6-5612-96a7783cc1bc@phytec.de>
Date: Tue, 5 Dec 2017 12:34:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <21cfce60-9b13-c382-20d7-d50fb98c2c46@phytec.de>
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
	17, 2016) at 05.12.2017 12:33:41,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17,
	2016) at 05.12.2017 12:33:41
X-TNEFEvaluated: 1
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] dfu-utils-native: fix do_deploy sstate handling
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
X-List-Received-Date: Tue, 05 Dec 2017 11:33:42 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Khem,

On 01.12.2017 16:13, Stefan M=C3=BCller-Klieser wrote:
> On 01.12.2017 15:46, Khem Raj wrote:
>> On Fri, Dec 1, 2017 at 2:48 AM, Stefan M=C3=BCller-Klieser
>> <s.mueller-klieser@phytec.de> wrote:
>>> We need to install to the sstate input dir and not the output dir, so
>>> sstate handling will work correctly.
>>>
>>
>> how can we validate this fix ? do you have steps
>=20
> I guess the easiest test would be to run a -c clean. If all files are
> removed, sstate is working, if not, you moved some files out of sstate
> control.

Ok. I already found a bug in this patch. When two machines want to build
the dfu recipe, sstate clashes with the providers conflicting. So apparently
the original code was a workaround for the fact that you cannot handle those
conflicts at the recipe level.
This patch cannot go in until some handling in deploy.bbclass is implemente=
d.
Any tips may help. I will try to find a solution.

Regards, Stefan

>=20
>>
>>> Signed-off-by: Stefan M=C3=BCller-Klieser <s.mueller-klieser@phytec.de>
>>> ---
>>>  meta-oe/recipes-support/dfu-util/dfu-util-native=5F0.9.bb | 7 +++----
>>>  1 file changed, 3 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/meta-oe/recipes-support/dfu-util/dfu-util-native=5F0.9.bb =
b/meta-oe/recipes-support/dfu-util/dfu-util-native=5F0.9.bb
>>> index 7a7a662..aeca23b 100644
>>> --- a/meta-oe/recipes-support/dfu-util/dfu-util-native=5F0.9.bb
>>> +++ b/meta-oe/recipes-support/dfu-util/dfu-util-native=5F0.9.bb
>>> @@ -8,9 +8,8 @@ SRC=5FURI +=3D "file://0001-Revert-Makefile.am-Drop-sta=
tic-dfu-util.patch"
>>>
>>>  do=5Fdeploy[sstate-outputdirs] =3D "${DEPLOY=5FDIR=5FTOOLS}"
>>>  do=5Fdeploy() {
>>> -    install -d ${DEPLOY=5FDIR=5FTOOLS}
>>> -    install -m 0755 src/dfu-util=5Fstatic ${DEPLOY=5FDIR=5FTOOLS}/dfu-=
util-${PV}
>>> -    rm -f ${DEPLOY=5FDIR=5FTOOLS}/dfu-util
>>> -    ln -sf ./dfu-util-${PV} ${DEPLOY=5FDIR=5FTOOLS}/dfu-util
>>> +    install -m 0755 src/dfu-util=5Fstatic ${DEPLOYDIR}/dfu-util-${PV}
>>> +    rm -f ${DEPLOYDIR}/dfu-util
>>> +    ln -sf ./dfu-util-${PV} ${DEPLOYDIR}/dfu-util
>>>  }
>>>  addtask deploy before do=5Fpackage after do=5Finstall
>>> --
>>> 2.7.4
>>>
>>> --
>>> =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

