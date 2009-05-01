Received: from [193.201.35.47] (helo=bq8.dotserv.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mgl@doredevelopment.dk>) id 1LztHm-00008I-SL
	for openembedded-devel@openembedded.org; Fri, 01 May 2009 16:00:18 +0200
Received: from [192.168.18.34] (07723322604.hef.nianet.dk [77.233.226.4] (may
	be forged)) (authenticated bits=0)
	by bq8.dotserv.com (8.13.1/8.13.1) with ESMTP id n41DscS0020759
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Fri, 1 May 2009 15:54:49 +0200
Message-ID: <49FAFF1A.5080406@doredevelopment.dk>
Date: Fri, 01 May 2009 15:54:34 +0200
From: Martin Lund <mgl@doredevelopment.dk>
Organization: =?ISO-8859-1?Q?Dor=E9Development?=
User-Agent: Thunderbird 2.0.0.21 (X11/20090409)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <49FAE94F.2090101@doredevelopment.dk> <49FAEFDE.70605@balister.org>
In-Reply-To: <49FAEFDE.70605@balister.org>
X-MIME-Autoconverted: from 8bit to quoted-printable by bq8.dotserv.com id
	n41DscS0020759
Subject: =?UTF-8?B?UmU6IFB1bGwgcmVxdWVzdCBmcm9tIERvcsOpRGV2ZWxvcG1lbnQgLSBOZXc6IE1pY3JvIGRpc3Ryby9pbWFnZQ==?=
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
X-List-Received-Date: Fri, 01 May 2009 14:00:19 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Philip Balister wrote:
> Martin Lund wrote:
>> Hello OE dev,
>>
>> Please pull the changes from the following repository:
>>
>> git pull git://dev.doredevelopment.dk/oe-micro.git master
>>
>> This oe-micro repository adds the following files to current dev:
>>
>> conf/distro/micro-uclibc.conf |   43 +++++++++++++++++
>> conf/distro/micro.conf        |  100=20
>> +++++++++++++++++++++++++++++++++++++++++
>> recipes/images/micro-image.bb |   34 ++++++++++++++
>> 3 files changed, 177 insertions(+), 0 deletions(-)
>>
>> There should be no conflicts with the current OE dev branch.
>>
>> These files constitute a new distribution named "Micro" and a=20
>> corresponding buildable image target: micro-image
>
> Why can't we make the needed changes to the minimal distro? I'd hate=20
> to see us have minimal and really-minimal distros, when they are=20
> trying to do the same thing.

Yes - the two distro definitions are closely related.

The main goal of micro is to be able to build a _very_ tiny rootfs. A=20
secondary goal is to do this with as little distro/image definition as=20
possible - why make it complex if you can do it simple.

The downside of having one distro to build it all is that the distro=20
configuration becomes fairly complex - and as we know complex includes=20
more maintenance and configuration becomes difficult to read/customize=20
for non OE maintainers.

Of course introducing too many distros is a bad idea but I do think we=20
need a few good _generic_ distro choices to choose from - currently I=20
dont see that.

I would like something small (micro), medium (mini), big (...), huge=20
(angstrom) to choose from in terms of supported generic OE distro=20
definitions. Actually, I would love to help out doing these generic=20
distro choices - provided that they are kept clean and sane. Consider=20
micro the first contribution in this direction.

Today I feel that OE users are kind of left behind if they do not choose=20
Angstrom distro. For developers like me Angstrom is no option because I=20
dont want everything-but-the-kitchen-sink - I want tiny!

> What changes did you make to minimal.conf to to get to micro.conf?=20
> I'll admit to not looking closely at the insides of the distro files,=20
> but I want to learn more.
>
Please make a quick diff and have a look  ;)
> I'm also curious what happens if you build the micro-image against=20
> Angstrom.
>
Sorry, I never tried that and never intended to do so. You will most=20
likely end up with a different image or the build might break.

> Philip
>
>>
>>
>>
>> The "Micro" distribution/image is created because we feel that there=20
>> is a need for a truly tiny and clean distro and image definition in=20
>> OE for those users out there that needs a _very_ tiny Linux rootfs=20
>> with virtually nothing installed except busybox, libc, udev, and a=20
>> few init scripts. On arm the jffs2 image size is only 1 MB (uclibc=20
>> based). No bloat allowed.
>>
>> The micro-image is ideal for users who wants this type of tiny Linux=20
>> rootfs system with only a few custom applications added.
>>
>> It has been tested to build and run on the following machine types:
>>
>>    * at91sam9263ek [glibc, uclibc]
>>    * x86 [glibc]
>>
>> As everything else OE it should build for most other machine types as=20
>> well (no guarantee of course).
>>
>> The micro distribution/image is inspired by the "minimal" distro and=20
>> image configuration - but it takes that one step further as contents=20
>> are heavily stripped down and non needed definitions removed. Thanks=20
>> to those who contributed to minimal distro - good work.
>>
>> More details on micro can be found in the following wiki:
>> http://dev.doredevelopment.dk/wiki/OpenEmbeddedMicro
>>
>> Note: It is still work in progress and there are things to improve on=20
>> the todo list (see wiki).
>>
>> We intend to maintain this distro/image in the future - please pull :)
>>
>> Thanks.
>>
>> Best regards, Dor=E9Development
>>
>
> -----------------------------------------------------------------------=
-
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>  =20


