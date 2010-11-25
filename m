Received: from newsmtp5.atmel.com ([204.2.163.5] helo=sjogate2.atmel.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <nicolas.ferre@atmel.com>) id 1PLcIU-0005T3-V2
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Nov 2010 14:55:40 +0100
Received: from meyreuil.atmel.fr (meyreuil [10.159.254.132])
	by sjogate2.atmel.com (8.13.6/8.13.6) with ESMTP id oAPDpdXO017743;
	Thu, 25 Nov 2010 05:51:40 -0800 (PST)
Received: from [127.0.0.1] ([10.159.245.112])
	by meyreuil.atmel.fr (8.11.7p1+Sun/8.11.7) with ESMTP id oAPDs4h09105; 
	Thu, 25 Nov 2010 14:54:04 +0100 (MET)
Message-ID: <4CEE6A7B.4010603@atmel.com>
Date: Thu, 25 Nov 2010 14:54:03 +0100
From: Nicolas Ferre <nicolas.ferre@atmel.com>
Organization: atmel
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; fr;
	rv:1.9.2.12) Gecko/20101027 Lightning/1.0b2 Thunderbird/3.1.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4CEE24A8.2090007@atmel.com> <4CEE2ADA.7050004@eukrea.com>
In-Reply-To: <4CEE2ADA.7050004@eukrea.com>
X-MIME-Autoconverted: from 8bit to quoted-printable by sjogate2.atmel.com id
	oAPDpdXO017743
X-SA-Exim-Connect-IP: 204.2.163.5
X-SA-Exim-Mail-From: nicolas.ferre@atmel.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
Subject: Re: libXext-native fail to compile (x86_64)
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
X-List-Received-Date: Thu, 25 Nov 2010 13:55:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Le 25/11/2010 10:22, Eric B=E9nard :
> Hi Nicolas,
>=20
> On 25/11/2010 09:56, Nicolas Ferre wrote:
>> While trying to build from scratch the latest .dev branch with:
>> - angstrom-2010.x distribution
>>
>> Build Configuration:
>> BB_VERSION        =3D "1.10.0"
>> METADATA_BRANCH   =3D "dev_for2010.12"
>> METADATA_REVISION =3D "a1bba89"
>> TARGET_ARCH       =3D "arm"
>> TARGET_OS         =3D "linux-gnueabi"
>> MACHINE           =3D "at91sam9m10g45ek"
>> DISTRO            =3D "angstrom"
>> DISTRO_VERSION    =3D "next"
>> TARGET_FPU        =3D "soft"
>>
>>
>> I have the following error with libxext:
>> NOTE: package libxext-native-1_1.2.0-r9.0: task do_compile: Failed
>>
> it seems to build fine for others also on x86_64 host :
> http://tinderbox.openembedded.net/packages/1077651/
> http://tinderbox.openembedded.net/packages/1087310/

Indeed, strange...
I tried to clean the recipe and then rebuild without success.
Someone has a hint where it can come from?

Bye,
--=20
Nicolas Ferre



