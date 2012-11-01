Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Morgan.Little@windriver.com>) id 1TTyUV-00037r-Bu
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Nov 2012 18:23:39 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qA1H9xpv002670
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 1 Nov 2012 10:09:59 -0700 (PDT)
Received: from ALA-MBB.corp.ad.wrs.com ([169.254.2.225]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.02.0318.004;
	Thu, 1 Nov 2012 10:09:59 -0700
From: "Little, Morgan" <Morgan.Little@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][meta-networking][PATCH V2 3/3] ntp: Clean up
	recipes
Thread-Index: AQHNuD2+HQhk1puA+Eq1r3S8YldFEpfVNrOy
Date: Thu, 1 Nov 2012 17:09:59 +0000
Message-ID: <FCBA1E696337B442ADB5A7C30428F0689A9978@ALA-MBB.corp.ad.wrs.com>
References: <1351009220-30119-1-git-send-email-morgan.little@windriver.com>
	<1351009220-30119-4-git-send-email-morgan.little@windriver.com>
	<3989989.S5U52SNN0R@helios>
	<50920DAB.7070206@gmail.com>,<20121101143114.GF4673@windriver.com>
In-Reply-To: <20121101143114.GF4673@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.140.216]
MIME-Version: 1.0
Subject: Re: [meta-oe][meta-networking][PATCH V2 3/3] ntp: Clean up recipes
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
X-List-Received-Date: Thu, 01 Nov 2012 17:23:39 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On 11/01/2012 10:31 AM, Joe MacDonald wrote:=0A=
> [Re: [oe] [meta-oe][meta-networking][PATCH V2 3/3] ntp: Clean up recipes]=
 On 12.11.01 (Thu 06:50) Martin Erts=E5s wrote:=0A=
>=0A=
>> On 11/01/12 02:08, Paul Eggleton wrote:=0A=
>>> On Tuesday 23 October 2012 12:20:20 Morgan Little wrote:=0A=
>>>> -PACKAGES +=3D "ntpdate ${PN}-bin ${PN}-tickadj ${PN}-utils"=0A=
>>> ...=0A=
>>>> +PACKAGES +=3D "${PN}-date ${PN}-bin ${PN}-tickadj ${PN}-utils"=0A=
>>> I'm not particularly happy with this change. Apart from the fact that i=
t=0A=
>>> wasn't mentioned in the commit message, it breaks any recipe that depen=
ds upon=0A=
>>> the previous ntpdate package. Could we go back to the old ntpdate name =
for the=0A=
>>> package or at the very least provide an RPROVIDES for the old name? I'm=
 happy=0A=
>>> to submit a patch to do this once there is agreement either way.=0A=
>>>=0A=
>>> Cheers,=0A=
>>> Paul=0A=
>>>=0A=
>> I agree with you. Also find it kind of strange to change from=0A=
>> ntpdate to ntp-date, as the universally known name of that module is=0A=
>> ntpdate. Don't really see the rational of changing that to ntp-date=0A=
>> in the recipe.=0A=
>=0A=
> Agreed.  Though if there's a good reason to rename in ntp-date, that's=0A=
> fine with me, so long as we go with Paul's suggestion of having an=0A=
> RPROVIDES for ntpdate.  It's probably best to leave it as ntpdate,=0A=
> though.=0A=
>=0A=
My rational behind splitting like that is if it is just ntpdate and you try=
 to add ntp-ssl and ntpdate it will use ntp to provide ntpdate. It could be=
 change add RPROVIDES so ntp will provide ntpdate and ntp-ssl provides a un=
iquely named version.=0A=
=0A=
//Morgan=0A=
=0A=
> _______________________________________________=0A=
> Openembedded-devel mailing list=0A=
> Openembedded-devel@lists.openembedded.org=0A=
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel=0A=


