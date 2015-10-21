Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B41FD766F3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Oct 2015 07:58:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t9L7wdwg001549
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Oct 2015 00:58:40 -0700 (PDT)
Received: from [128.224.162.211] (128.224.162.211) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Wed, 21 Oct 2015 00:58:38 -0700
Message-ID: <562745D4.8060103@windriver.com>
Date: Wed, 21 Oct 2015 15:59:16 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <30E719D66AEA914CBB7DAB303B1C722D17E664@BUDURBPA11.e2k.ad.ge.com>
	<30E719D66AEA914CBB7DAB303B1C722D17E67F@BUDURBPA11.e2k.ad.ge.com>
In-Reply-To: <30E719D66AEA914CBB7DAB303B1C722D17E67F@BUDURBPA11.e2k.ad.ge.com>
X-Originating-IP: [128.224.162.211]
Subject: Re: [meta-oe][PATCH 1/4] rrdtool: fix useless-rpath QA issue
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Oct 2015 07:58:44 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ray,

I just saw this email.
Thanks a lot for your suggestion.
I've sent out V2.

Best Regards,
Chen Qi


On 10/20/2015 07:14 PM, Ray, Ian (GE Healthcare) wrote:
> Hi,
>
>> Signed-off-by: Chen Qi <Qi.Chen at windriver.com>
>> ---
>>   meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb b/meta-
>> oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb
>> index 91a30cf..f2ded65 100644
>> --- a/meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb
>> +++ b/meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb
>> @@ -71,7 +71,6 @@ do_configure() {
>>       PYTHON_INCLUDES="-I=/usr/include/python${PYTHON_BASEVERSION}"'
>> \
>>           ${S}/m4/acinclude.m4
>>       #remove the hardcoded $(libdir) rpath
>> -    sed -i -e 's|--rpath=$(libdir)||g' ${S}/bindings/Makefile.am
> I tested locally a simpler patch:
>
> @@ -71,7 +71,7 @@ do_configure() {
>       PYTHON_INCLUDES="-I=/usr/include/python${PYTHON_BASEVERSION}"' \
>           ${S}/m4/acinclude.m4
>       #remove the hardcoded $(libdir) rpath
> -    sed -i -e 's|--rpath=$(libdir)||g' ${S}/bindings/Makefile.am
> +    sed -i -e 's|LD_RUN_PATH=$(libdir)||g' ${S}/bindings/Makefile.am
>
>
>> @@ -100,6 +99,11 @@ do_configure() {
>>           ${B}/examples/*.pl
>>   }
>>
>> +do_compile_append() {
>> +    # Remove useless rpath
>> +    find ${B}/bindings/python/build -name "rrdtool.so" | xargs chrpath -d
>> +}
> This fails for me since chrpath is not built for multilib.
>
>


