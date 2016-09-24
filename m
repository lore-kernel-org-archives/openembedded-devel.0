Return-Path: <mike.looijmans@topic.nl>
X-Greylist: delayed 556 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 24 Sep 2016 15:10:55 UTC
Received: from smtp02.mail.online.nl (smtp02.mail.online.nl [194.134.25.72])
	by mail.openembedded.org (Postfix) with ESMTP id 26B5860111
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Sep 2016 15:10:55 +0000 (UTC)
Received: from [192.168.1.7] (s55969068.adsl.online.nl [85.150.144.104])
	by smtp02.mail.online.nl (Postfix) with ESMTP id D8F781A00D2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Sep 2016 17:01:38 +0200 (CEST)
To: openembedded-devel@lists.openembedded.org
References: <1474634029-22896-1-git-send-email-mike.looijmans@topic.nl>
	<CAMKF1srhhYfYO69noEU30+66yDX8cLNbEB7tpJhkubKwjPoevw@mail.gmail.com>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: Topic
Message-ID: <57E69552.9040209@topic.nl>
Date: Sat, 24 Sep 2016 17:01:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1srhhYfYO69noEU30+66yDX8cLNbEB7tpJhkubKwjPoevw@mail.gmail.com>
Subject: Re: [meta-networking][PATCH] phytool: Add recipe
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
X-List-Received-Date: Sat, 24 Sep 2016 15:10:56 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 23-09-16 20:33, Khem Raj wrote:
> On Fri, Sep 23, 2016 at 5:33 AM, Mike Looijmans <mike.looijmans@topic.nl> wrote:
>> A nice tool to directly read, write and interpret ethernet PHY data.
>> Very useful when debugging PHY or MDIO problems, which ethtool does
>> not do.
>>
>> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
>> ---
>>   meta-networking/recipes-support/phytool/phytool.bb | 14 ++++++++++++++
>>   1 file changed, 14 insertions(+)
>>   create mode 100644 meta-networking/recipes-support/phytool/phytool.bb
>>
>> diff --git a/meta-networking/recipes-support/phytool/phytool.bb b/meta-networking/recipes-support/phytool/phytool.bb
>> new file mode 100644
>> index 0000000..9d541b7
>> --- /dev/null
>> +++ b/meta-networking/recipes-support/phytool/phytool.bb
>> @@ -0,0 +1,14 @@
>> +SUMMARY = "PHY interface tool for Linux"
>> +LICENSE = "GPLv2"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
>> +
>> +PV = "1.0.1"
>> +SRCREV = "1a3ea62a218206e9faf3b27fb5d01c85692024c8"
>> +SRC_URI = "git://github.com/wkz/phytool.git"
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +do_install() {
>> +       install -d ${D}${prefix}/bin
>
> perhaps use base_bindir here

The makefile installs to $PREFIX/bin so I deliberately put the same 
folder in the recipe (the makefile doesn't create the directory). If 
anyone changes $bindir the install will fail.

>
>> +       oe_runmake 'DESTDIR=${D}' 'PREFIX=${prefix}' install
>> +}
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


-- 
Mike Looijmans

