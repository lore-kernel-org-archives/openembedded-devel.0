Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1224A771C0
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Aug 2016 17:36:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u78HaL5n009761
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 8 Aug 2016 10:36:21 -0700 (PDT)
Received: from [128.224.162.220] (128.224.162.220) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 8 Aug 2016 10:36:20 -0700
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1470640304.git.hongxu.jia@windriver.com>
	<20160808112331.prpy25zdlair3onu@jama>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <aa70d459-9298-99a9-8808-1a3bdb7c3a9f@windriver.com>
Date: Tue, 9 Aug 2016 01:36:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <20160808112331.prpy25zdlair3onu@jama>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 0/4]add ttf-fonts packages
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
X-List-Received-Date: Mon, 08 Aug 2016 17:36:25 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 08/08/2016 07:23 PM, Martin Jansa wrote:
> On Mon, Aug 08, 2016 at 03:13:10AM -0400, Hongxu Jia wrote:
>> The following changes since commit da81d9ef8d052c1884abd8dc0d5354f2e9a23cc4:
>>
>>    proftpd: return stderr to syslog (2016-08-05 09:34:51 -0400)
>>
>> are available in the git repository at:
>>
>>    git://git.openembedded.org/openembedded-core-contrib hongxu/fonts
>>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=hongxu/fonts
> NAK, missing changes in layer.conf.

Yes, I should add them to SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS in layer.conf

> Don't use TABS in meta-oe layers.

Fine, I will use 4 spaces to replace in shell task/function.

V2 incoming

//Hongxu


>
>> Hongxu Jia (4):
>>    ttf-abyssinica: add version 1.500 to support Amharic language
>>    fontforge-native: support python module
>>    ttf-lohit: add version 2 to support Indian languages
>>    ttf-lklug: add version 0.6-14.20090803cvs.fc24 to support sinhala
>>      language
>>
>>   .../fontforge/fontforge_20150824.bb                |  2 +-
>>   .../ttf-fonts/ttf-abyssinica_1.500.bb              | 17 +++++++++++++++
>>   .../ttf-fonts/ttf-lklug_0.6-14.20090803cvs.fc24.bb | 24 ++++++++++++++++++++++
>>   meta-oe/recipes-graphics/ttf-fonts/ttf-lohit_2.bb  | 23 +++++++++++++++++++++
>>   4 files changed, 65 insertions(+), 1 deletion(-)
>>   create mode 100644 meta-oe/recipes-graphics/ttf-fonts/ttf-abyssinica_1.500.bb
>>   create mode 100644 meta-oe/recipes-graphics/ttf-fonts/ttf-lklug_0.6-14.20090803cvs.fc24.bb
>>   create mode 100644 meta-oe/recipes-graphics/ttf-fonts/ttf-lohit_2.bb
>>
>> -- 
>> 2.8.1
>>


