Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 44ED87CC65
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Feb 2019 02:44:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x1Q2hZVl031618
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 25 Feb 2019 18:43:45 -0800
Received: from [128.224.162.228] (128.224.162.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.435.0;
	Mon, 25 Feb 2019 18:43:25 -0800
To: Khem Raj <raj.khem@gmail.com>
References: <1550652980-292761-1-git-send-email-changqing.li@windriver.com>
	<1550652980-292761-4-git-send-email-changqing.li@windriver.com>
	<CAMKF1soyUbWgfoDTJFCQVWhMpM10aWHnqd6Qz2E=L+MUujArRQ@mail.gmail.com>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <7b91482a-f086-5668-973d-47cbb787e639@windriver.com>
Date: Tue, 26 Feb 2019 10:43:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1soyUbWgfoDTJFCQVWhMpM10aWHnqd6Qz2E=L+MUujArRQ@mail.gmail.com>
X-Originating-IP: [128.224.162.228]
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 3/5] rrdtool: upgrade 1.7.0 -> 1.7.1
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
X-List-Received-Date: Tue, 26 Feb 2019 02:44:11 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 2/23/19 2:07 AM, Khem Raj wrote:
> On Wed, Feb 20, 2019 at 12:57 AM <changqing.li@windriver.com> wrote:
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
>>   .../recipes-extended/rrdtool/{rrdtool_1.7.0.bb => rrdtool_1.7.1.bb}   | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>   rename meta-oe/recipes-extended/rrdtool/{rrdtool_1.7.0.bb => rrdtool_1.7.1.bb} (98%)
>>
>> diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool_1.7.0.bb b/meta-oe/recipes-extended/rrdtool/rrdtool_1.7.1.bb
>> similarity index 98%
>> rename from meta-oe/recipes-extended/rrdtool/rrdtool_1.7.0.bb
>> rename to meta-oe/recipes-extended/rrdtool/rrdtool_1.7.1.bb
>> index ff99574..1a1ca54 100644
>> --- a/meta-oe/recipes-extended/rrdtool/rrdtool_1.7.0.bb
>> +++ b/meta-oe/recipes-extended/rrdtool/rrdtool_1.7.1.bb
>> @@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=3349111ed0533471494beec99715bc9d"
>>
>>   DEPENDS = "libpng zlib cairo pango glib-2.0 libxml2 groff-native python-setuptools-native"
>>
>> -SRCREV = "bfc82d5242855628b826018479df00e0ec4e8360"
>> -PV = "1.7.0"
>> +SRCREV = "34e6ff6218bb0372eb545f886dec96dd3d20be47"
>> +PV = "1.7.1"
>>
> seeing some packaging failures on qemux86/musl e.g.
>
> ERROR: SYSTEMD_SERVICE_rrdcached value rrdcached.socket does not exist
>
> see
>
> https://errors.yoctoproject.org/Errors/Details/229882/
>
>
> Can you take care of this as a separate fix ?
OK,  I will  check this.
>
>>   SRC_URI = "\
>>       git://github.com/oetiker/rrdtool-1.x.git;branch=master;protocol=http; \
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

-- 
BRs

Sandy(Li Changqing)


