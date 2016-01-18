Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5538060249
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jan 2016 09:47:19 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u0I9lJAi022766
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 18 Jan 2016 01:47:19 -0800 (PST)
Received: from [128.224.162.155] (128.224.162.155) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 18 Jan 2016 01:47:18 -0800
To: <openembedded-devel@lists.openembedded.org>
References: <1451483875-2370-1-git-send-email-koen@dominion.thruhere.net>
	<20160104175200.GA5744@jama>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <569CB4A5.1040602@windriver.com>
Date: Mon, 18 Jan 2016 17:47:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <20160104175200.GA5744@jama>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-oe][PATCH] mariadb: -native also needs gold workaround
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
X-List-Received-Date: Mon, 18 Jan 2016 09:47:20 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 01/05/2016 01:52 AM, Martin Jansa wrote:
> On Wed, Dec 30, 2015 at 02:57:55PM +0100, Koen Kooi wrote:
>> When the host distro uses gold mariadb-native fails to build.
>>
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> ---
>>   meta-oe/recipes-support/mysql/mariadb.inc | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/meta-oe/recipes-support/mysql/mariadb.inc b/meta-oe/recipes-support/mysql/mariadb.inc
>> index a6826c3..6a55476 100644
>> --- a/meta-oe/recipes-support/mysql/mariadb.inc
>> +++ b/meta-oe/recipes-support/mysql/mariadb.inc
>> @@ -60,6 +60,9 @@ PACKAGECONFIG[setupdb] = ", ,,${PN}-setupdb"
>>   # https://mariadb.atlassian.net/browse/MDEV-5982
>>   TARGET_CFLAGS += "-fuse-ld=bfd"
>>
>> +BUILD_CFLAGS += "-fuse-ld=bfd"
>> +BUILD_CXXFLAGS += "-fuse-ld=bfd"
>
> Unfortunately this breaks builds on older hosts with older gcc
>
> |   cc1: error: unrecognized command line option '-fuse-ld=bfd'
> http://errors.yoctoproject.org/Errors/Details/25859/
>
> Should we consider Ubuntu-12.04 insanely old?

This patch has been merged, so we don't support Ubuntu 12.04 any more?

// Robert

>
>> +
>>   EXTRA_OECMAKE = "-DWITH_EMBEDDED_SERVER=ON \
>>                    -DWITH_JEMALLOC=no \
>>                    -DWITHOUT_TOKUDB=TRUE \
>> --
>> 2.0.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>
>

