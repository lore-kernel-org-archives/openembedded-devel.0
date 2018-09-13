Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8C1C376EBF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Sep 2018 07:00:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w8D708Xe026641
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 13 Sep 2018 00:00:08 -0700 (PDT)
Received: from [128.224.162.228] (128.224.162.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Thu, 13 Sep 2018 00:00:05 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <1536817056-344059-1-git-send-email-changqing.li@windriver.com>
	<CAMKF1sp5dPsAkGnJ53yRUTX=ahaVpm0A+F+d7V-inCkouXy4dg@mail.gmail.com>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <784ca7f8-3c8c-4d5f-0b7a-c703221667dd@windriver.com>
Date: Thu, 13 Sep 2018 15:00:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sp5dPsAkGnJ53yRUTX=ahaVpm0A+F+d7V-inCkouXy4dg@mail.gmail.com>
X-Originating-IP: [128.224.162.228]
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-networking] spice: fix compile error on 32bit system
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
X-List-Received-Date: Thu, 13 Sep 2018 07:00:08 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 09/13/2018 01:58 PM, Khem Raj wrote:
> On Wed, Sep 12, 2018 at 10:38 PM <changqing.li@windriver.com> wrote:
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> Fix below compile error on 32bit system,  since input argument
>> is uLong, but use format %d:
>> format '%d' expects argument of type 'int', but argument 6 has type
>> 'long unsigned int' [-Werror=format=]
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
>>   .../0001-spice-fix-compile-fail-problem.patch      | 36 ++++++++++++++++++++++
>>   meta-networking/recipes-support/spice/spice_git.bb |  1 +
>>   2 files changed, 37 insertions(+)
>>   create mode 100644 meta-networking/recipes-support/spice/spice/0001-spice-fix-compile-fail-problem.patch
>>
>> diff --git a/meta-networking/recipes-support/spice/spice/0001-spice-fix-compile-fail-problem.patch b/meta-networking/recipes-support/spice/spice/0001-spice-fix-compile-fail-problem.patch
>> new file mode 100644
>> index 0000000..1f9d5fd
>> --- /dev/null
>> +++ b/meta-networking/recipes-support/spice/spice/0001-spice-fix-compile-fail-problem.patch
>> @@ -0,0 +1,36 @@
>> +From 7023732c65b4dc509c46a54fb7715da275b5597f Mon Sep 17 00:00:00 2001
>> +From: Changqing Li <changqing.li@windriver.com>
>> +Date: Thu, 13 Sep 2018 12:39:44 +0800
>> +Subject: [PATCH] spice: fix compile fail problem
>> +
>> +compile error:
>> +format '%d' expects argument of type 'int', but argument 6 has
>> +type 'long unsigned int' [-Werror=format=]
>> +
>> +spice compile failed on 32bit system, since upstream commit
>> +9541cd2fe(in V0.14.1) change %ld to %PRIdPTR, %PRIdPTR is %d, but argument
>> +strm.total_out is uLong.
>> +
>> +Upstream-Status: Submitted[https://github.com/freedesktop/spice/pull/1]
>> +
>> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> +---
>> + server/red-replay-qxl.c | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/server/red-replay-qxl.c b/server/red-replay-qxl.c
>> +index 1fce76c..bd33b58 100644
>> +--- a/server/red-replay-qxl.c
>> ++++ b/server/red-replay-qxl.c
>> +@@ -266,7 +266,7 @@ static replay_t read_binary(SpiceReplay *replay, const char *prefix, size_t *siz
>> +             exit(1);
>> +         }
>> +         if ((ret = inflate(&strm, Z_NO_FLUSH)) != Z_STREAM_END) {
>> +-            spice_error("inflate error %d (disc: %" PRIdPTR ")", ret, *size - strm.total_out);
>> ++            spice_error("inflate error %d (disc: %ld)", ret, *size - strm.total_out);
> these values seem to be size_t types so please use PRIuPTR instead of PRIdPTR

the format %ld is for "*size - strm.total_out",   and strm.total_out is 
defined in zlib.h, is uLong.
if use PRIuPTR(%u), we will still met compile error:
format '%u' expects argument of type 'unsigned int', but argument 6 has 
type 'long unsigned int' [-Werror=format=]

Besides,  "*size - strm.total_out" ,   size is unsigned int,  and 
strm.total_out is uLong,  but I think here we should use %ld,
  and need to convert unsigned to signed, to get the diff of these two 
value,  maybe unsigned in meaningless to read the reported error.

spice_error("inflate error %d (disc: %ld)", ret,(long int)(*size - strm.total_out));

How do you think?

//Sandy
>
>> +             if (ret == Z_DATA_ERROR) {
>> +                 /* last operation may be wrong. since we do the recording
>> +                  * in red_worker, when there is a shutdown from the vcpu/io thread
>> +--
>> +2.7.4
>> +
>> diff --git a/meta-networking/recipes-support/spice/spice_git.bb b/meta-networking/recipes-support/spice/spice_git.bb
>> index 871bb0f..c7e4b03 100644
>> --- a/meta-networking/recipes-support/spice/spice_git.bb
>> +++ b/meta-networking/recipes-support/spice/spice_git.bb
>> @@ -24,6 +24,7 @@ SRC_URI = " \
>>       git://anongit.freedesktop.org/spice/spice;name=spice \
>>       git://anongit.freedesktop.org/spice/spice-common;destsuffix=git/subprojects/spice-common;name=spice-common \
>>       file://0001-Convert-pthread_t-to-be-numeric.patch \
>> +    file://0001-spice-fix-compile-fail-problem.patch \
>>   "
>>
>>   FOO = "\
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
Wind River Linux


