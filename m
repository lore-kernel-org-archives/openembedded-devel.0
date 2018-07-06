Return-Path: <xiao.zhang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4D65C7894E
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Jul 2018 00:14:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w660EPsa029988
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 5 Jul 2018 17:14:25 -0700 (PDT)
Received: from [128.224.162.144] (128.224.162.144) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.399.0;
	Thu, 5 Jul 2018 17:14:22 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <20180705092836.120148-1-xiao.zhang@windriver.com>
	<CAMKF1sqFq4WgmqM12otHrqNiTTfjgEjgG5AtrMk3z9pNRHiDCQ@mail.gmail.com>
From: ZhangXiao <xiao.zhang@windriver.com>
Message-ID: <5B3EB46C.8090408@windriver.com>
Date: Fri, 6 Jul 2018 08:14:36 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqFq4WgmqM12otHrqNiTTfjgEjgG5AtrMk3z9pNRHiDCQ@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe-core][recipes-extended][PATCH] diffutils-ptest: add runtime dependency on make
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
X-List-Received-Date: Fri, 06 Jul 2018 00:14:25 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

I am sorry that I don't know where the "[oe]" comes from. I used to send
this mail to myself with the same command, no such "[oe]" at the very
beginning. :-(

I will make it.

Xiao

在 2018年07月06日 00:04, Khem Raj 写道:
> wrong ml. This should go to oe-core ml.
> On Thu, Jul 5, 2018 at 2:29 AM Zhang Xiao <xiao.zhang@windriver.com> wrote:
>>
>> Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
>> ---
>>  meta/recipes-extended/diffutils/diffutils_3.6.bb | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/meta/recipes-extended/diffutils/diffutils_3.6.bb b/meta/recipes-extended/diffutils/diffutils_3.6.bb
>> index deadd62c65..8ba897d18f 100644
>> --- a/meta/recipes-extended/diffutils/diffutils_3.6.bb
>> +++ b/meta/recipes-extended/diffutils/diffutils_3.6.bb
>> @@ -19,6 +19,8 @@ acpaths = "-I ./m4"
>>
>>  inherit ptest
>>
>> +RDEPENDS_${PN}-ptest += "make"
>> +
>>  do_install_ptest() {
>>         t=${D}${PTEST_PATH}
>>         install -D ${S}/build-aux/test-driver $t/build-aux/test-driver
>> --
>> 2.17.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> 

