Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with SMTP id B07656067C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jul 2016 17:58:41 +0000 (UTC)
Received: (qmail 631 invoked by uid 1003); 13 Jul 2016 17:58:41 -0000
Received: from unknown (HELO ?192.168.11.142?)
	(philip@opensdr.com@71.171.10.138)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	13 Jul 2016 17:58:41 -0000
To: openembedded-devel@lists.openembedded.org
References: <1468416494-17044-1-git-send-email-philip@balister.org>
	<CAMKF1sqK0p0Cmoa+bTVLq-TEDD+=zQQ8O0RzLgqr1sdzp2Q1+A@mail.gmail.com>
From: Philip Balister <philip@balister.org>
Message-ID: <505ecebd-9b23-9771-b41e-f9a970ee5264@balister.org>
Date: Wed, 13 Jul 2016 13:58:40 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqK0p0Cmoa+bTVLq-TEDD+=zQQ8O0RzLgqr1sdzp2Q1+A@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] libsodium: Update to 1.0.10.
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
X-List-Received-Date: Wed, 13 Jul 2016 17:58:42 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 07/13/2016 01:53 PM, Khem Raj wrote:
> On Wed, Jul 13, 2016 at 6:28 AM, Philip Balister <philip@balister.org> wrote:
>> Signed-off-by: Philip Balister <philip@balister.org>
>> ---
>>  meta-oe/recipes-support/libsodium/libsodium_1.0.10.bb | 10 ++++++++++
>>  meta-oe/recipes-support/libsodium/libsodium_1.0.8.bb  | 11 -----------
>>  2 files changed, 10 insertions(+), 11 deletions(-)
>>  create mode 100644 meta-oe/recipes-support/libsodium/libsodium_1.0.10.bb
>>  delete mode 100644 meta-oe/recipes-support/libsodium/libsodium_1.0.8.bb
>>
> 
> you should use -M when generating these patches or 

I thought I did, copy/paste from the README.


> 
> [diff]
>         renames = copies
> 
> in your ~/.gitconfig file.
> 
> It shows that md5 for LICENSE file has changed and it would be better
> to document what changed in the commit message.
> 

Oh bother. This is the problem sitting on something for a few weeks, let
me go back and verify this is a copyright year change and resend.

>> diff --git a/meta-oe/recipes-support/libsodium/libsodium_1.0.10.bb b/meta-oe/recipes-support/libsodium/libsodium_1.0.10.bb
>> new file mode 100644
>> index 0000000..370f553
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/libsodium/libsodium_1.0.10.bb
>> @@ -0,0 +1,10 @@
>> +SUMMARY = "The Sodium crypto library"
>> +HOMEPAGE = "http://libsodium.org/"
>> +LICENSE = "ISC"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=2278eb2755b451372dde7ffeae8cde98"
>> +
>> +SRC_URI = "https://download.libsodium.org/libsodium/releases/${BPN}-${PV}.tar.gz"
>> +SRC_URI[md5sum] = "ea89dcbbda0b2b6ff6a1c476231870dd"
>> +SRC_URI[sha256sum] = "71b786a96dd03693672b0ca3eb77f4fb08430df307051c0d45df5353d22bc4be"
>> +
>> +inherit autotools
>> diff --git a/meta-oe/recipes-support/libsodium/libsodium_1.0.8.bb b/meta-oe/recipes-support/libsodium/libsodium_1.0.8.bb
>> deleted file mode 100644
>> index a2eef4b..0000000
>> --- a/meta-oe/recipes-support/libsodium/libsodium_1.0.8.bb
>> +++ /dev/null
>> @@ -1,11 +0,0 @@
>> -SUMMARY = "The Sodium crypto library"
>> -HOMEPAGE = "http://libsodium.org/"
>> -LICENSE = "ISC"
>> -LIC_FILES_CHKSUM = "file://LICENSE;md5=092a09b78c3be486fac807435bf17b7a"
>> -
>> -SRC_URI = "https://download.libsodium.org/libsodium/releases/${BPN}-${PV}.tar.gz"
>> -
>> -SRC_URI[md5sum] = "0a66b86fd3aab3fe4c858edcd2772760"
>> -SRC_URI[sha256sum] = "c0f191d2527852641e0a996b7b106d2e04cbc76ea50731b2d0babd3409301926"
>> -
>> -inherit autotools
>> --
>> 2.5.5
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

