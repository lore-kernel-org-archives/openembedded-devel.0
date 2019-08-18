Return-Path: <tworaz@tworaz.net>
Received: from mail.tworaz.net (tworaz.net [139.162.170.142])
	by mail.openembedded.org (Postfix) with ESMTP id E5A3B71CBD
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Aug 2019 18:06:17 +0000 (UTC)
Received: from [192.168.10.150] (87-206-69-189.dynamic.chello.pl
	[87.206.69.189])
	by mail.tworaz.net (Postfix) with ESMTPSA id D7A2910379C;
	Sun, 18 Aug 2019 18:06:17 +0000 (UTC)
To: Khem Raj <raj.khem@gmail.com>
References: <20190817220032.6778-1-tworaz@tworaz.net>
	<20190817220032.6778-3-tworaz@tworaz.net>
	<CAMKF1sp_4ssTuRNUng2zSMQQ4e-toJ1bH=-h=hyFE5SJHfwAKg@mail.gmail.com>
From: Piotr Tworek <tworaz@tworaz.net>
Message-ID: <821be6e6-1fa0-dcbd-7e25-2b9b39d46b8b@tworaz.net>
Date: Sun, 18 Aug 2019 20:06:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sp_4ssTuRNUng2zSMQQ4e-toJ1bH=-h=hyFE5SJHfwAKg@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-gnome][PATCH 3/3] libgee: Update to version 0.20.2
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
X-List-Received-Date: Sun, 18 Aug 2019 18:06:19 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 18/08/2019 02:21, Khem Raj wrote:

> On Sat, Aug 17, 2019 at 3:01 PM Piotr Tworek <tworaz@tworaz.net> wrote:
>> This is the latest upstream stable version of this package.
>>
>> While doing the update also switch the package to use gnomebase bbclass
>> from oe-core. This bbclass uses much  better SRC_URI pattern that can
>> also use GNOME mirrors.
>>
>> Signed-off-by: Piotr Tworek <tworaz@tworaz.net>
>> ---
>>   .../libgee/{libgee_0.20.1.bb => libgee_0.20.2.bb}        | 9 +++------
>>   1 file changed, 3 insertions(+), 6 deletions(-)
>>   rename meta-oe/recipes-devtools/libgee/{libgee_0.20.1.bb => libgee_0.20.2.bb} (57%)
>>
>> diff --git a/meta-oe/recipes-devtools/libgee/libgee_0.20.1.bb b/meta-oe/recipes-devtools/libgee/libgee_0.20.2.bb
>> similarity index 57%
>> rename from meta-oe/recipes-devtools/libgee/libgee_0.20.1.bb
>> rename to meta-oe/recipes-devtools/libgee/libgee_0.20.2.bb
>> index 190e5dd4e..94ea0a19d 100644
>> --- a/meta-oe/recipes-devtools/libgee/libgee_0.20.1.bb
>> +++ b/meta-oe/recipes-devtools/libgee/libgee_0.20.2.bb
>> @@ -8,9 +8,8 @@ BBCLASSEXTEND = "native"
>>   LICENSE = "LGPLv2.1"
>>   LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
>>
>> -PE = "1"
> I think we can not drop PE here

Ah, yes you're right is PE. not PR. I'll push v2 version of the patch 
fixing this.

>
>> +inherit gnomebase vala gobject-introspection
>>
>> -inherit autotools vala pkgconfig gobject-introspection
>>   do_configure_prepend() {
>>       MACROS="libtool.m4 lt~obsolete.m4 ltoptions.m4 ltsugar.m4 ltversion.m4"
>>       for i in ${MACROS}; do
>> @@ -18,7 +17,5 @@ do_configure_prepend() {
>>       done
>>   }
>>
>> -SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
>> -SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/libgee/${SHRT_VER}/${BP}.tar.xz"
>> -SRC_URI[md5sum] = "d224dca55bb909f6730f40cc267337be"
>> -SRC_URI[sha256sum] = "bb2802d29a518e8c6d2992884691f06ccfcc25792a5686178575c7111fea4630"
>> +SRC_URI[archive.md5sum] = "45db478f2b300ada8e039ebc6c9458de"
>> +SRC_URI[archive.sha256sum] = "9e035c4b755f46bfae70ba81cdcf8328b03f554373cec8c816e8b5680f85353c"
>> --
>> 2.21.0
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

