Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 93FAB65D85
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Apr 2014 09:37:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s3A9bwWG027621
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 10 Apr 2014 02:37:58 -0700 (PDT)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.169.1;
	Thu, 10 Apr 2014 02:37:57 -0700
Message-ID: <53466672.5060206@windriver.com>
Date: Thu, 10 Apr 2014 17:37:54 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1397028897-4991-1-git-send-email-kai.kang@windriver.com>
	<20140410083953.GP2132@jama>
In-Reply-To: <20140410083953.GP2132@jama>
X-Originating-IP: [128.224.162.231]
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] swig: add native wrapper for SWIGLIB
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
X-List-Received-Date: Thu, 10 Apr 2014 09:38:03 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 2014?04?10? 16:39, Martin Jansa wrote:
> On Wed, Apr 09, 2014 at 03:34:57PM +0800, Kai Kang wrote:
>> Native swig will read data from hard-coded SWIGLIB or the same
>> environment variable.
>>
>> While using sstate, the hard-coded SWIGLIB will point to the project
>> that create original sstates. This would cause build issues, so add
>> a wrapper to set the environment variable SWIGLIB to a relative path
>> on current sysroot.
>>
>> Signed-off-by: Xin Ouyang <Xin.Ouyang@windriver.com>
>> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   meta-oe/recipes-devtools/swig/swig.inc | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/meta-oe/recipes-devtools/swig/swig.inc b/meta-oe/recipes-devtools/swig/swig.inc
>> index 8e83526..96cd02a 100644
>> --- a/meta-oe/recipes-devtools/swig/swig.inc
>> +++ b/meta-oe/recipes-devtools/swig/swig.inc
>> @@ -50,3 +50,10 @@ do_configure() {
>>       oe_runconf
>>   }
>>   
>> +def swiglib_relpath(d):
>> +    swiglib = d.getVar('datadir', True) + "/" + d.getVar('BPN', True) + "/" + d.getVar('PV', True)
>> +    return os.path.relpath(swiglib, d.getVar('bindir', True))
>> +
>> +do_install_append_class-native() {
>> +       create_wrapper ${D}${bindir}/swig SWIG_LIB='`dirname $''realpath`'/${@swiglib_relpath(d)}
> This should use 4 spaces for indentation, but I'll fix it while
> cherry-picking => no need to resend.

Thanks.

--Kai

>
>> +}
>> -- 
>> 1.8.4
>>
>> -- 
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>


-- 
Regards,
Neil | Kai Kang


