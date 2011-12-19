Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgarman@zenlinux.com>) id 1Rcggb-0006GX-OG
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Dec 2011 18:07:37 +0100
Received: from [192.168.1.12] (c-76-115-40-64.hsd1.or.comcast.net
	[76.115.40.64])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 012922FF36
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Dec 2011 11:27:56 -0500 (EST)
Message-ID: <4EEF6617.3070004@zenlinux.com>
Date: Mon, 19 Dec 2011 08:28:07 -0800
From: Scott Garman <sgarman@zenlinux.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111124 Thunderbird/8.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20111219093447.C6DBE10331@opal>
	<201112191054.57179.schnitzeltony@gmx.de>
In-Reply-To: <201112191054.57179.schnitzeltony@gmx.de>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 012922FF36.87B68
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: sgarman@zenlinux.com
X-Spam-Status: No
Subject: Re: [oe-commits] Scott Garman : Add missing SUMMARY fields to various recipes
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
X-List-Received-Date: Mon, 19 Dec 2011 17:07:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

On 12/19/2011 01:54 AM, Andreas M=FCller wrote:
> On Monday, December 19, 2011 10:34:47 AM git@git.openembedded.org wrote=
:
>> Module: openembedded-core.git
>> Branch: master
>> Commit: e8c194a627e091ef9da3b7fa83ea3897bd283d9e
>> URL:
>> http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit;h=3D=
e8c194a627
>> e091ef9da3b7fa83ea3897bd283d9e
>>
>> Author: Scott Garman<scott.a.garman@intel.com>
>> Date:   Sun Dec 18 15:06:57 2011 -0800
>>
>> Add missing SUMMARY fields to various recipes
>>
>> This adds the SUMMARY field to the following recipes which were
>> missing it:
>>
>> * dosfstools
>> * grep
>> * icu
>> * libevent
>> * libnfsidmap
>> * qemu-helper-nativesdk
>>
>> Signed-off-by: Scott Garman<scott.a.garman@intel.com>
>> Signed-off-by: Richard Purdie<richard.purdie@linuxfoundation.org>
>>
>> ---
>>
>>   .../nfs-utils/libnfsidmap_0.24.bb                  |    3 ++-
>>   .../recipes-devtools/dosfstools/dosfstools_2.11.bb |    2 +-
>>   .../qemu/qemu-helper-nativesdk_1.0.bb              |    3 ++-
>>   meta/recipes-extended/grep/grep_2.9.bb             |    1 +
>>   meta/recipes-support/icu/icu-3.6.inc               |    1 +
>>   meta/recipes-support/libevent/libevent_1.4.14b.bb  |    3 ++-
>>   6 files changed, 9 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta/recipes-connectivity/nfs-utils/libnfsidmap_0.24.bb
>> b/meta/recipes-connectivity/nfs-utils/libnfsidmap_0.24.bb index
>> 101ecab..eff75ec 100644
>> --- a/meta/recipes-connectivity/nfs-utils/libnfsidmap_0.24.bb
>> +++ b/meta/recipes-connectivity/nfs-utils/libnfsidmap_0.24.bb
>> @@ -1,4 +1,5 @@
>> -DESCRIPTION =3D "nfs idmapping library"
>> +SUMMARY =3D "NFS id mapping library"
>> +DESCRIPTION =3D "NFS id mapping library"
>>   HOMEPAGE =3D "http://www.citi.umich.edu/projects/nfsv4/linux/"
>>   SECTION =3D "libs"
>>
>> diff --git a/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb
>> b/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb index
>> ec75ac9..eca54f1 100644
>> --- a/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb
>> +++ b/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb
>> @@ -1,7 +1,7 @@
>>   # dosfstools OE build file
>>   # Copyright (C) 2004-2006, Advanced Micro Devices, Inc.  All Rights
>> Reserved # Released under the MIT license (see packages/COPYING)
>> -
>> +SUMMARY =3D "DOS FAT Filesystem Utilities"
>>   DESCRIPTION =3D "DOS FAT Filesystem Utilities"
>>
>>   SECTION =3D "base"
>> diff --git a/meta/recipes-devtools/qemu/qemu-helper-nativesdk_1.0.bb
>> b/meta/recipes-devtools/qemu/qemu-helper-nativesdk_1.0.bb index
>> a3dca3d..df0cae0 100644
>> --- a/meta/recipes-devtools/qemu/qemu-helper-nativesdk_1.0.bb
>> +++ b/meta/recipes-devtools/qemu/qemu-helper-nativesdk_1.0.bb
>> @@ -1,4 +1,5 @@
>> -DESCRIPTION =3D "Qemu helper scripts from Poky"
>> +SUMMARY =3D "Qemu helper scripts"
>> +DESCRIPTION =3D "Qemu helper scripts"
>>   LICENSE =3D "GPLv2"
>>   RDEPENDS_${PN} =3D "qemu-nativesdk"
>>   PR =3D "r9"
>> diff --git a/meta/recipes-extended/grep/grep_2.9.bb
>> b/meta/recipes-extended/grep/grep_2.9.bb index 08ac527..9099bed 100644
>> --- a/meta/recipes-extended/grep/grep_2.9.bb
>> +++ b/meta/recipes-extended/grep/grep_2.9.bb
>> @@ -1,3 +1,4 @@
>> +SUMMARY =3D "GNU grep utility"
>>   DESCRIPTION =3D "GNU grep utility"
>>   HOMEPAGE =3D "http://savannah.gnu.org/projects/grep/"
>>   BUGTRACKER =3D "http://savannah.gnu.org/bugs/?group=3Dgrep"
>> diff --git a/meta/recipes-support/icu/icu-3.6.inc
>> b/meta/recipes-support/icu/icu-3.6.inc index 8fadc92..e3f9dd2 100644
>> --- a/meta/recipes-support/icu/icu-3.6.inc
>> +++ b/meta/recipes-support/icu/icu-3.6.inc
>> @@ -1,3 +1,4 @@
>> +SUMMARY =3D "International Component for Unicode libraries"
>>   DESCRIPTION =3D "The International Component for Unicode (ICU) is a =
mature,
>> portable set of C/C++ and Java libraries for Unicode support, software
>> internationalization (I18N) and globalization (G11N), giving applicati=
ons
>> the same results on all platforms." HOMEPAGE =3D
>> "http://www-01.ibm.com/software/globalization/icu/index.jsp"
>>
>> diff --git a/meta/recipes-support/libevent/libevent_1.4.14b.bb
>> b/meta/recipes-support/libevent/libevent_1.4.14b.bb index 1a369b5..364=
68dc
>> 100644
>> --- a/meta/recipes-support/libevent/libevent_1.4.14b.bb
>> +++ b/meta/recipes-support/libevent/libevent_1.4.14b.bb
>> @@ -1,4 +1,5 @@
>> -DESCRIPTION =3D "an asynchronous event notification library"
>> +SUMMARY =3D "An asynchronous event notification library"
>> +DESCRIPTION =3D "An asynchronous event notification library"
>>   HOMEPAGE =3D "http://www.monkey.org/~provos/libevent/"
>>   SECTION =3D "libs"
>>
> What is the value in creating redundancies by copying DESRCIPTION to SU=
MMARY?

Hi Andreas,

I did this because SUMMARY is a required field by the HOB UI. This was=20
requested by Shane Wang on the oe-core ML:

http://lists.linuxtogo.org/pipermail/openembedded-core/2011-December/0146=
00.html

For recipes which have short descriptions, there was little sense in=20
summarizing them further, so I duplicated the DESCRIPTION field. Above=20
you can also see an example (in the icu recipe) were I did summarize a=20
long DESCRIPTION field.

Mark Hatle replied to this thread explaining why we previously allowed=20
SUMMARY to be an optional field and how it automatically inherited from=20
DESCRIPTION.

Let me know if you have further questions.

Regards,

Scott



