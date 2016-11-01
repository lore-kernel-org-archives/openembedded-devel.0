Return-Path: <prvs=011349adbb=mike.looijmans@topicproducts.com>
X-Greylist: delayed 997 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 01 Nov 2016 15:18:47 UTC
Received: from mx6-09.smtp.antispamcloud.com (mx6-09.smtp.antispamcloud.com
	[95.211.2.200])
	by mail.openembedded.org (Postfix) with ESMTP id C5EFF7199B
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Nov 2016 15:18:47 +0000 (UTC)
Received: from [37.74.225.130] (helo=TOP-EX01.TOPIC.LOCAL)
	by mx6.antispamcloud.com with esmtps (TLSv1:ECDHE-RSA-AES128-SHA:128)
	(Exim 4.86) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1c1aZk-0008Gr-Is for openembedded-devel@lists.openembedded.org;
	Tue, 01 Nov 2016 16:02:10 +0100
Received: from [192.168.80.121] (192.168.80.121) by webmail.topic.nl
	(192.168.10.102) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 1 Nov 2016 16:02:07 +0100
To: <openembedded-devel@lists.openembedded.org>
References: <1477898963-3759-1-git-send-email-mike.looijmans@topic.nl>
	<CAEHkU3U4wbOuPLCy-Ndj+ScuH2QnyBHd76FhOiTyQJzG1Kxqqg@mail.gmail.com>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <8af647f4-b068-fba9-a508-ea1fd82ecdac@topic.nl>
Date: Tue, 1 Nov 2016 16:02:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <CAEHkU3U4wbOuPLCy-Ndj+ScuH2QnyBHd76FhOiTyQJzG1Kxqqg@mail.gmail.com>
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Filter-ID: s0sct1PQhAABKnZB5plbIbbvfIHzQjPVmPLZeVYSu3xU9luQrU+8/8qthi+0Jd/W6KAUC/fjyuDn
	NXFr4uarw8GIk4znw5EcwHHi+ra9lypEmJCbamfqLB4wH/k+k+Tftor9O5jjWZI633McN2M/OUXR
	4XktS92Fqq3Qa0exZrH30SrPk8tfaSF+RZrpk8YKU12d2pmLLkAmzasehlwblzQNJDVhEyaFWQvF
	FjzR8UY+DKA2NNvQHVv9U39IvZ21x85OM4GWP9JQ/hHPc9c4dspy46MY4AXC06EFbOC1uAoX2ECf
	0tidf4f9xbnt4dr3ucE6FVHy9oQcVLiVeDoadp8jI9oH6dGc6edzLFJtSM1o5rQC2VE4ySdZe0mi
	K6wgOmG6/54gza7q5Za0AFsz6J51OyFNIoaxpS1mXZNdroDdpaan89csPuxNcrcm3g0VrZ+7KIxe
	L9a8yWCRhadOUlss+n2ffnQxt6aJ7klZab+9g1L5kxBIYGB7BJyUdlmpOtqAyNDaGu3M3V4NLSLw
	IF/664n8xZZ193ZhZHjQXRtCpUr1xNcB+rfrNrf6Qnz4UMZvCBNmhVTX9MJal8urfK0jiD6XqsJZ
	tjQxlyCdsewbeW/xy+29RqqLzNfvFvbW5s5zZdNnuvTDMRp6u431cGNIBxN+8iLMjiqr6CILtV73
	kf3bHfLz5oIsvwONwYzu
X-Report-Abuse-To: spam@mx99.antispamcloud.com
X-Originating-IP: 37.74.225.130
X-SpamExperts-Domain: topic.nl
X-SpamExperts-Username: 37.74.225.128/28
Authentication-Results: antispamcloud.com;
	auth=pass smtp.auth=37.74.225.128/28@topic.nl
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.02)
X-Recommended-Action: accept
Subject: Re: [meta-qt4][PATCH] qt4-embedded: Default to build tslib when touchscreen is defined
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
X-List-Received-Date: Tue, 01 Nov 2016 15:18:48 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFHaving some more experience with it, my suggestion would be to REV=
ERT=20
c4671873af5ab6c7d15ca397538f154c11c3486e "qt4-embedded.inc: provide=20
PACKAGECONFIG for tslib".

The problem with using MACHINE_FEATURES for building the qt4 libs is that t=
he=20
qt4 package becomes machine-specific, and if you're buiding for multiple=20
machines (with and without touchscreen), there'll be lots of "setstate"=20
activity to take care of that.

Building tslib hardly hurts, it's a small dependency, while building qt4 ta=
kes=20
something like 5 minutes on our big ass i7 build server. And deciding not t=
o=20
install the plugin is quite efficient.

At the very least, "tslib" should be in the default config.

I don't know the rationale behind commit c4671873af5, if reducing compile t=
ime=20
was the incentive, it's not really paying off. Time would be better spent=20
avoiding building "perl" or "bash"...


On 31-10-16 15:12, Max Krummenacher wrote:
> Hi
>
> I sent a similar patch:
> https://lists.yoctoproject.org/pipermail/yocto/2016-October/032661.html
>
> Both fix the build error with the HEAD of meta-qt4.
>
> Question is if "touchscreen" in MACHINE_FEATURES should build for
> tslib by default.
> If yes, your patch is needed.
>
> However the error will pop up again if someone chooses to set
> PACKAGECONFIG to not include tslib.
> That would be handled by the patch above, so applying both patches
> would fix the problem and default to having tslib support.
>
> Max
>
> P.S.What is the 'correct' mailinglist for meta-qt4?
>
> 2016-10-31 8:29 GMT+01:00 Mike Looijmans <mike.looijmans@topic.nl>:
>> When "touchscreen" is in the MACHINE_FEATURES, packagegroup-core-qt4e
>> will RDEPEND on qt4-embedded-plugin-mousedriver-tslib, but that
>> library is not being built by default, resulting in an error like:
>> opkg_prepare_url_for_install: Couldn't find anything to satisfy 'qt4-emb=
edded-plugin-mousedriver-tslib'.
>>
>> To prevent that from happening, add "tslib" to the default
>> PACKAGECONFIG when touchscreen is defined.
>>
>> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
>> ---
>> Applies to both morty and master branches.
>>
>>  recipes-qt4/qt4/qt4-embedded.inc | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/recipes-qt4/qt4/qt4-embedded.inc b/recipes-qt4/qt4/qt4-embe=
dded.inc
>> index 1122080..9c2d9da 100644
>> --- a/recipes-qt4/qt4/qt4-embedded.inc
>> +++ b/recipes-qt4/qt4/qt4-embedded.inc
>> @@ -3,7 +3,7 @@ DESCRIPTION =3D "Qt is a versatile cross-platform applic=
ation framework -- this is
>>  SECTION =3D "libs"
>>  HOMEPAGE =3D "http://qt-project.org/"
>>
>> -PACKAGECONFIG ??=3D ""
>> +PACKAGECONFIG ??=3D '${@bb.utils.contains("MACHINE_FEATURES", "touchscr=
een", "tslib", "",d)}'
>>  PACKAGECONFIG[tslib] =3D " -plugin-mouse-tslib, ,tslib"
>>
>>  QT4EDEPENDS =3D ""
>> --
>> 1.9.1
>>
>> --
>>=20

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





_______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


