Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xin.Ouyang@windriver.com>) id 1TVedy-0006nB-6O
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Nov 2012 09:36:22 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qA68MaOL010858
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 6 Nov 2012 00:22:36 -0800 (PST)
Received: from [128.224.162.239] (128.224.162.239) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Tue, 6 Nov 2012 00:22:36 -0800
Message-ID: <5098C8CA.2000103@windriver.com>
Date: Tue, 6 Nov 2012 16:22:34 +0800
From: Pascal Ouyang <xin.ouyang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:16.0) Gecko/20121028 Thunderbird/16.0.2
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1351734166-8711-1-git-send-email-Xin.Ouyang@windriver.com>
	<1351734166-8711-2-git-send-email-Xin.Ouyang@windriver.com>
	<96557201.USfTQflqlK@helios>
In-Reply-To: <96557201.USfTQflqlK@helios>
X-TagToolbar-Keys: D20121106162234887
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	qA68MaOL010858
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH][meta-networking 2/2] netperf: uprev to 2.6.0
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
X-List-Received-Date: Tue, 06 Nov 2012 08:36:22 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=E4=BA=8E 2012=E5=B9=B411=E6=9C=8801=E6=97=A5 18:04, Paul Eggleton =E5=86=
=99=E9=81=93:
> On Thursday 01 November 2012 09:42:46 Xin Ouyang wrote:
>> Also fix license, summary and patches.
>>
>> Signed-off-by: Xin Ouyang <Xin.Ouyang@windriver.com>
>
> These two patches should really be squashed into one - this is the conv=
ention
> we've established for importing recipes from OE-Classic (as long as "Im=
port
> from OE-Classic" or similar is mentioned somewhere in the commit messag=
e).
>
>> --- a/meta-networking/recipes-support/netperf/netperf_2.4.4.bb
>> +++ b/meta-networking/recipes-support/netperf/netperf_2.6.0.bb
>> @@ -1,14 +1,19 @@
>> -DESCRIPTION=3D"Network performance benchmark including tests for TCP,=
 UDP,
>> sockets, ATM and more."
>> +SUMMARY =3D "A networking benchmarking tool"
>> +DESCRIPTION =3D "Network performance benchmark including tests for TC=
P, UDP,
>> sockets, ATM and more."
>> SECTION =3D "console/network"
>>   HOMEPAGE =3D "http://www.netperf.org/"
>> -LICENSE =3D "netperf"
>> -PR =3D "r3"
>> +LICENSE =3D "HP"
>
> There's no standard license known as "HP" so "netperf" for LICENSE is c=
orrect
> - it means it's a license specific to the netperf software package.
>
>> +LICENSE_FLAGS =3D "commercial"
>
> Good point - I think many would miss the non-commercial use only clause=
 in the
> license otherwise.
>
>> +SRC_URI[md5sum] =3D "9654ffdfd4c4f2c93ce3733cd9ed9236"
>> +SRC_URI[sha256sum] =3D
>> "cd8dac710d4273d29f70e8dbd09353a6362ac58a11926e0822233c0cb230323a"
>
> I think we prefer to put these next to SRC_URI these days (or at least =
I do).

OK, a V2 will be sent with these fixes.

Thanks.

- Pascal

>
> Cheers,
> Paul
>


--=20
- Pascal


