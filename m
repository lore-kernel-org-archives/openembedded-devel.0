Return-Path: <s.mueller-klieser@phytec.de>
Received: from root.phytec.de (mail.phycard.co.uk [217.6.246.34])
	by mail.openembedded.org (Postfix) with ESMTP id 868F978698
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Dec 2017 15:13:35 +0000 (UTC)
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by root.phytec.de (Postfix) with ESMTP id 226D0A004A0;
	Fri,  1 Dec 2017 16:15:42 +0100 (CET)
Received: from [172.16.26.141] ([172.16.26.141])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
	with ESMTP id 2017120116133580-34800 ;
	Fri, 1 Dec 2017 16:13:35 +0100 
To: Khem Raj <raj.khem@gmail.com>
References: <1512125321-16818-1-git-send-email-s.mueller-klieser@phytec.de>
	<CAMKF1sq_bpdNvfeSB_kGEJEZcvTsLdPvdj907MeUdyf0mQHz=A@mail.gmail.com>
From: =?UTF-8?Q?Stefan_M=c3=bcller-Klieser?= <s.mueller-klieser@phytec.de>
Organization: PHYTEC Messtechnik GmbH
Message-ID: <21cfce60-9b13-c382-20d7-d50fb98c2c46@phytec.de>
Date: Fri, 1 Dec 2017 16:13:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1sq_bpdNvfeSB_kGEJEZcvTsLdPvdj907MeUdyf0mQHz=A@mail.gmail.com>
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
	17, 2016) at 01.12.2017 16:13:35,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17,
	2016) at 01.12.2017 16:13:35
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
X-List-Received-Date: Fri, 01 Dec 2017 15:13:35 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 01.12.2017 15:46, Khem Raj wrote:
> On Fri, Dec 1, 2017 at 2:48 AM, Stefan M=C3=BCller-Klieser
> <s.mueller-klieser@phytec.de> wrote:
>> We need to install to the sstate input dir and not the output dir, so
>> sstate handling will work correctly.
>>
>=20
> how can we validate this fix ? do you have steps

I guess the easiest test would be to run a -c clean. If all files are
removed, sstate is working, if not, you moved some files out of sstate
control.

>=20
>> Signed-off-by: Stefan M=C3=BCller-Klieser <s.mueller-klieser@phytec.de>
>> ---
>>  meta-oe/recipes-support/dfu-util/dfu-util-native=5F0.9.bb | 7 +++----
>>  1 file changed, 3 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta-oe/recipes-support/dfu-util/dfu-util-native=5F0.9.bb b=
/meta-oe/recipes-support/dfu-util/dfu-util-native=5F0.9.bb
>> index 7a7a662..aeca23b 100644
>> --- a/meta-oe/recipes-support/dfu-util/dfu-util-native=5F0.9.bb
>> +++ b/meta-oe/recipes-support/dfu-util/dfu-util-native=5F0.9.bb
>> @@ -8,9 +8,8 @@ SRC=5FURI +=3D "file://0001-Revert-Makefile.am-Drop-stat=
ic-dfu-util.patch"
>>
>>  do=5Fdeploy[sstate-outputdirs] =3D "${DEPLOY=5FDIR=5FTOOLS}"
>>  do=5Fdeploy() {
>> -    install -d ${DEPLOY=5FDIR=5FTOOLS}
>> -    install -m 0755 src/dfu-util=5Fstatic ${DEPLOY=5FDIR=5FTOOLS}/dfu-u=
til-${PV}
>> -    rm -f ${DEPLOY=5FDIR=5FTOOLS}/dfu-util
>> -    ln -sf ./dfu-util-${PV} ${DEPLOY=5FDIR=5FTOOLS}/dfu-util
>> +    install -m 0755 src/dfu-util=5Fstatic ${DEPLOYDIR}/dfu-util-${PV}
>> +    rm -f ${DEPLOYDIR}/dfu-util
>> +    ln -sf ./dfu-util-${PV} ${DEPLOYDIR}/dfu-util
>>  }
>>  addtask deploy before do=5Fpackage after do=5Finstall
>> --
>> 2.7.4
>>
>> --
>> =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

