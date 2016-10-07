Return-Path: <prvs=0088fe4a55=mike.looijmans@topicproducts.com>
Received: from mx18-09.smtp.antispamcloud.com (mx18-09.smtp.antispamcloud.com
	[207.244.64.178])
	by mail.openembedded.org (Postfix) with ESMTP id A164271981
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Oct 2016 06:23:53 +0000 (UTC)
Received: from [37.74.225.130] (helo=TOP-EX01.TOPIC.LOCAL)
	by mx18.antispamcloud.com with esmtps (TLSv1:ECDHE-RSA-AES128-SHA:128)
	(Exim 4.86) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1bsOZU-0000vG-0Z for openembedded-devel@lists.openembedded.org;
	Fri, 07 Oct 2016 08:23:54 +0200
Received: from [192.168.80.121] (192.168.80.121) by webmail.topic.nl
	(192.168.10.102) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 7 Oct 2016 08:23:49 +0200
To: <openembedded-devel@lists.openembedded.org>
References: <1475733541-3401-1-git-send-email-mike.looijmans@topic.nl>
	<nt7e9d$9p0$2@blaine.gmane.org>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <f0c245ef-59ef-8cfb-2839-d27d287eb5c5@topic.nl>
Date: Fri, 7 Oct 2016 08:23:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <nt7e9d$9p0$2@blaine.gmane.org>
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Filter-ID: s0sct1PQhAABKnZB5plbIbbvfIHzQjPVmPLZeVYSu3xU9luQrU+8/8qthi+0Jd/W6KAUC/fjyuDn
	NXFr4uarw8GIk4znw5EcwHHi+ra9lypEmJCbamfqLB4wH/k+k+Tftor9O5jjWZI633McN2M/OUXR
	4XktS92Fqq3Qa0exZrH30SrPk8tfaSF+RZrpk8YKU12d2pmLLkAmzasehlwbl++nc+VD8Qd7aeX/
	L1nm5II+DKA2NNvQHVv9U39IvZ21x85OM4GWP9JQ/hHPc9c4dspy46MY4AXC06EFbOC1uAoX2ECf
	0tidf4f9xbnt4dr3ucE6FVHy9oQcVLiVeDoadp8jI9oH6dGc6edzLFJtSM1o5rQC2VE4ySdZe0mi
	K6wgOmG6/54gza7q5Za0AFsz6J51OyFNIoaxpS1mXZNdroDdpaan89csPuxNcrcm3g0VrZ+7KIxe
	L9a8yWCRhadOUlss+n2ffnQxt6aJ7klZab+9g1L5kxBIYGB7BJyUdlmpOtqAyNDaGu3M3V4NLSLw
	IF/664n8xZZ193ZhZHjQXRt4h/Pe0HoJfXSEQK0FPGvjWxwNFavLErUb39TUKcCiO2iH1Wgh6RAe
	nBR+licROGaX3Boon9SxUKxCjuDQ3yDiJRQzYkGgwKDF1jNhg8Xt+mNIBxN+8iLMjiqr6CILtV73
	kf3bHfLz5oIsvwONwYzu
X-Report-Abuse-To: spam@mx99.antispamcloud.com
X-Originating-IP: 37.74.225.130
X-SpamExperts-Domain: topic.nl
X-SpamExperts-Username: 37.74.225.128/28
Authentication-Results: antispamcloud.com;
	auth=pass smtp.auth=37.74.225.128/28@topic.nl
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: SB/global_tokens (0.001377723596)
X-Recommended-Action: accept
Subject: Re: [meta-networking][PATCH v3] phytool: Add recipe
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
X-List-Received-Date: Fri, 07 Oct 2016 06:23:54 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 07-10-16 08:10, Koen Kooi wrote:
> Op 06-10-16 om 07:59 schreef Mike Looijmans:
>> A nice tool to directly read, write and interpret ethernet PHY data.
>> Very useful when debugging PHY or MDIO problems, which ethtool does
>> not do.
>>
>> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
>> ---
>> v3: Add SRCPV to PV
>>     Indent using spaces instead of tab
>> v2: Fix LICENSE filename and checksum
>>     Honor LDFLAGS value (patch accepted upstream)
>>  meta-networking/recipes-support/phytool/phytool.bb | 14 ++++++++++++++
>>  1 file changed, 14 insertions(+)
>>  create mode 100644 meta-networking/recipes-support/phytool/phytool.bb
>>
>> diff --git a/meta-networking/recipes-support/phytool/phytool.bb b/meta-n=
etworking/recipes-support/phytool/phytool.bb
>> new file mode 100644
>> index 0000000..e4391df
>> --- /dev/null
>> +++ b/meta-networking/recipes-support/phytool/phytool.bb
>> @@ -0,0 +1,14 @@
>> +SUMMARY =3D "PHY interface tool for Linux"
>> +LICENSE =3D "GPLv2"
>> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D39bba7d2cf0ba1036f2a6e2be52f=
e3f0"
>> +
>> +PV =3D "1.0.1+git${SRCPV}"
>> +SRCREV =3D "3149bfdb4f513e2f0da0a7d0bc5d0873578696f2"
>> +SRC_URI =3D "git://github.com/wkz/phytool.git"
>> +
>> +S =3D "${WORKDIR}/git"
>> +
>> +do_install() {
>> +    install -d ${D}${prefix}/bin
>
> ${D}${bindir}

The makefile installs to $PREFIX/bin so I deliberately put the same folder =
in=20
the recipe (the makefile doesn't create the directory). If anyone changes=20
$bindir the install will fail.

I see I need to add a comment to explain that.

>> +    oe_runmake 'DESTDIR=3D${D}' 'PREFIX=3D${prefix}' install
>> +}
>>
>
>



Kind regards,

Mike Looijmans
System Expert

TOPIC Products
Materiaalweg 4, NL-5681 RJ Best
Postbus 440, NL-5680 AK Best
Telefoon: +31 (0) 499 33 69 79
E-mail: mike.looijmans@topicproducts.com
Website: www.topicproducts.com

Please consider the environment before printing this e-mail






