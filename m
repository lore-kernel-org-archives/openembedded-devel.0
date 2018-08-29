Return-Path: <Dengke.Du@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2BCFE71A70
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Aug 2018 02:13:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w7T2Dtdg027695
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 28 Aug 2018 19:13:55 -0700 (PDT)
Received: from [128.224.162.149] (128.224.162.149) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Tue, 28 Aug 2018 19:13:54 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <1535441994-32199-1-git-send-email-dengke.du@windriver.com>
	<CAMKF1soJ5kaqW+XKAgCPtNwZE08yuzz5TCOKt7eVX=TitSYBDA@mail.gmail.com>
From: Dengke Du <dengke.du@windriver.com>
Message-ID: <8d7e8465-54a8-eae2-ecb1-0d8fb11f49c6@windriver.com>
Date: Wed, 29 Aug 2018 10:10:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1soJ5kaqW+XKAgCPtNwZE08yuzz5TCOKt7eVX=TitSYBDA@mail.gmail.com>
X-Originating-IP: [128.224.162.149]
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] snappy: add -fPIC flags
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
X-List-Received-Date: Wed, 29 Aug 2018 02:13:55 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 2018年08月29日 00:45, Khem Raj wrote:
> On Tue, Aug 28, 2018 at 12:29 AM Dengke Du <dengke.du@windriver.com> wrote:
>> Let the libsnappy.a be position independent code, so other packages can use it
>> to make shared PIC library, such as ceph.
>>
>> Signed-off-by: Dengke Du <dengke.du@windriver.com>
>> ---
>>   meta-oe/recipes-extended/snappy/snappy_1.1.7.bb | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta-oe/recipes-extended/snappy/snappy_1.1.7.bb b/meta-oe/recipes-extended/snappy/snappy_1.1.7.bb
>> index 6f1978a..70223be 100644
>> --- a/meta-oe/recipes-extended/snappy/snappy_1.1.7.bb
>> +++ b/meta-oe/recipes-extended/snappy/snappy_1.1.7.bb
>> @@ -19,3 +19,4 @@ inherit cmake pkgconfig
>>
>>   PACKAGECONFIG ??= ""
>>   PACKAGECONFIG[lzo] = "-DHAVE_LIBLZO2=1,-DHAVE_LIBLZO2=0,lzo,"
>> +TARGET_CFLAGS += "-fPIC"
> perhaps adding the -fPIC flag to CPPFLAGS is better since adding to
> it would mean it applies to  C and C++ compilers equally

Thanks!

>
>
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


