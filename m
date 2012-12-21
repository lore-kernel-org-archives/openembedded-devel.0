Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Morgan.Little@windriver.com>) id 1TmAu4-0005Lm-Ny
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Dec 2012 23:17:32 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qBLM2UY8022229
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Dec 2012 14:02:30 -0800 (PST)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.1.244]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.02.0318.004;
	Fri, 21 Dec 2012 14:02:29 -0800
From: "Little, Morgan" <Morgan.Little@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-networking][PATCH] traceroute: Remove bashisms
Thread-Index: AQHN38Nv3DSXGHS0h0uTe/bRTNmRB5gjzeek
Date: Fri, 21 Dec 2012 22:02:28 +0000
Message-ID: <FCBA1E696337B442ADB5A7C30428F068BD84E8@ALA-MBA.corp.ad.wrs.com>
References: <1356124984-19927-1-git-send-email-morgan.little@windriver.com>,
	<CA+chaQc+bcUof-4h9qc=SPUK5eTe4sRiNLXp774U_m-Vv=ozKg@mail.gmail.com>
In-Reply-To: <CA+chaQc+bcUof-4h9qc=SPUK5eTe4sRiNLXp774U_m-Vv=ozKg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.140.216]
MIME-Version: 1.0
Subject: Re: [meta-networking][PATCH] traceroute: Remove bashisms
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
X-List-Received-Date: Fri, 21 Dec 2012 22:17:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

On 12/21/2012 04:37 PM, Martin Jansa wrote:=0A=
> On Fri, Dec 21, 2012 at 10:23 PM, Morgan Little=0A=
> <morgan.little@windriver.com> wrote:=0A=
>> Signed-off-by: Morgan Little <morgan.little@windriver.com>=0A=
>> ---=0A=
>>  meta-networking/recipes-support/traceroute/traceroute_2.0.18.bb | 6 ++-=
---=0A=
>>  1 file changed, 2 insertions(+), 4 deletions(-)=0A=
>>=0A=
>> diff --git a/meta-networking/recipes-support/traceroute/traceroute_2.0.1=
8.bb b/meta-networking/recipes-support/traceroute/traceroute_2.0.18.bb=0A=
>> index 719d9fb..d855c67 100644=0A=
>> --- a/meta-networking/recipes-support/traceroute/traceroute_2.0.18.bb=0A=
>> +++ b/meta-networking/recipes-support/traceroute/traceroute_2.0.18.bb=0A=
>> @@ -32,10 +32,8 @@ do_install() {=0A=
>>=0A=
>>      install -d ${D}${mandir}=0A=
>>      install -p -m644 ${PN}/${PN}.8 ${D}${mandir}=0A=
>> -    pushd ${D}${mandir}=0A=
>> -    ln -s ${PN}.8 ${PN}6.8=0A=
>> -    ln -s ${PN}.8 tcptraceroute.8=0A=
>> -    popd=0A=
>> +    ln -s ${D}${mandir}${PN}.8 ${D}${mandir}${PN}6.8=0A=
>> +    ln -s ${D}${mandir}${PN}.8 ${D}${mandir}tcptraceroute.8=0A=
>=0A=
> Thanks for quick reply and fix, but I think this should be:=0A=
>> +    ln -s ${PN}.8 ${D}${mandir}/${PN}6.8=0A=
>> +    ln -s ${PN}.8 ${D}${mandir}/tcptraceroute.8=0A=
>=0A=
> ${D} path won't be valid on target and missing slash after mandir=0A=
It looks like it should be. Thank you for noticing that.=0A=
>=0A=
> And is there something referencing those man pages with different=0A=
> name? Or why are those symlinks provided?=0A=
I provided them because I was basing the do_install step off of the .spec f=
ile the Fedora uses in their RPM file. It does a similar symlink step. I be=
lieve that is can be removed.=0A=
=0A=
//Morgan=0A=
>=0A=
> Cheers,=0A=
>=0A=
> _______________________________________________=0A=
> Openembedded-devel mailing list=0A=
> Openembedded-devel@lists.openembedded.org=0A=
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel=0A=


