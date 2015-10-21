Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9C5C376E04
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Oct 2015 05:26:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t9L5QJw2011179
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 20 Oct 2015 22:26:19 -0700 (PDT)
Received: from [128.224.162.211] (128.224.162.211) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Tue, 20 Oct 2015 22:26:18 -0700
Message-ID: <56272220.5060201@windriver.com>
Date: Wed, 21 Oct 2015 13:26:56 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <1444704238-7057-1-git-send-email-Qi.Chen@windriver.com>
	<20151020155749.GB2557@jama>
In-Reply-To: <20151020155749.GB2557@jama>
X-Originating-IP: [128.224.162.211]
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Wed, 21 Oct 2015 05:26:22 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/20/2015 11:57 PM, Martin Jansa wrote:
> On Tue, Oct 13, 2015 at 10:43:55AM +0800, Chen Qi wrote:
>> When building rrdtool, we would meet the following error.
> Now it fails for qemuarm and qemux86, not sure which change is causing
> that:
>
> http://errors.yoctoproject.org/Errors/Details/20597/
> http://errors.yoctoproject.org/Errors/Details/20601/
>

I'm looking into this problem today, although I currently have some 
problem reproducing it.
I'll look at the logs and try to find out something.

Regards,
Chen Qi

>>    ERROR: QA Issue: rrdtool-python: work/core2-64-poky-linux/rrdtool
>>    /1.5.4-r0/packages-split/rrdtool-python/usr/lib/python2.7/site-packages
>>    /rrdtool.so contains probably-redundant RPATH /usr/lib [useless-rpaths]
>>
>> Fix this issue by removing the redundante RPATH section from rrdtool.so.
>>
>> As we use '--disable-rpath' in EXTRA_OECONF, we don't need to the `sed'
>> line in do_configure.
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb b/meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb
>> index 91a30cf..f2ded65 100644
>> --- a/meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb
>> +++ b/meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb
>> @@ -71,7 +71,6 @@ do_configure() {
>>       PYTHON_INCLUDES="-I=/usr/include/python${PYTHON_BASEVERSION}"' \
>>           ${S}/m4/acinclude.m4
>>       #remove the hardcoded $(libdir) rpath
>> -    sed -i -e 's|--rpath=$(libdir)||g' ${S}/bindings/Makefile.am
>>   
>>       autotools_do_configure
>>   
>> @@ -100,6 +99,11 @@ do_configure() {
>>           ${B}/examples/*.pl
>>   }
>>   
>> +do_compile_append() {
>> +    # Remove useless rpath
>> +    find ${B}/bindings/python/build -name "rrdtool.so" | xargs chrpath -d
>> +}
>> +
>>   PACKAGES =+ "${PN}-perl ${PN}-python"
>>   
>>   FILES_${PN}-doc += "${datadir}/examples"
>> -- 
>> 1.9.1
>>


