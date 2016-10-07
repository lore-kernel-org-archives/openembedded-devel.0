Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 35EC9719B7
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Oct 2016 16:08:21 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 07 Oct 2016 09:08:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,456,1473145200"; 
	d="scan'208,217";a="1050809012"
Received: from lsandov1-mobl2.zpn.intel.com (HELO [10.219.5.48])
	([10.219.5.48])
	by fmsmga001.fm.intel.com with ESMTP; 07 Oct 2016 09:08:22 -0700
To: openembedded-devel@lists.openembedded.org
References: <1473280623-4410-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
	<20160912160945.GA2653@jama>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Message-ID: <0f87375a-b4f4-3c03-c18f-56112538f121@linux.intel.com>
Date: Fri, 7 Oct 2016 11:12:17 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <20160912160945.GA2653@jama>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-python][PATCH] python-unidiff: python module for parsing diff data
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
X-List-Received-Date: Fri, 07 Oct 2016 16:08:23 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 09/12/2016 11:09 AM, Martin Jansa wrote:
> On Wed, Sep 07, 2016 at 03:37:03PM -0500, leonardo.sandoval.gonzalez@linux.intel.com wrote:
>> From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
>>
>> The module takes diff data, from commands like diff or git-format-patch,
>> parses it and creates python objects in the form of patch sets. More
>> info is given on the recipe metadata.
> This conflicts with python-flask-pymongo
>
> ERROR: python-flask-pymongo-0.4.1-r0 do_populate_sysroot_setscene: The recipe python-flask-pymongo is trying to install files into a shared area when those files already exist. Those files and their manifest location are:
> qemux86/usr/lib/python2.7/site-packages/tests/__init__.pyc
>   Matched in b'manifest-qemux86-python-unidiff.populate_sysroot'
> qemux86/usr/lib/python2.7/site-packages/tests/__init__.py
>   Matched in b'manifest-qemux86-python-unidiff.populate_sysroot'
> Please verify which recipe should provide the above files.
Sorry for the delay. I will send a v2 to fix this.
>> Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
>> ---
>>   meta-python/recipes-devtools/python/python-unidiff_0.5.2.bb | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>   create mode 100644 meta-python/recipes-devtools/python/python-unidiff_0.5.2.bb
>>
>> diff --git a/meta-python/recipes-devtools/python/python-unidiff_0.5.2.bb b/meta-python/recipes-devtools/python/python-unidiff_0.5.2.bb
>> new file mode 100644
>> index 0000000..3ee5bc2
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python-unidiff_0.5.2.bb
>> @@ -0,0 +1,9 @@
>> +SUMMARY = "Unified diff parsing/metadata extraction library"
>> +HOMEPAGE = "http://github.com/matiasb/python-unidiff"
>> +LICENSE = "MIT"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=4c434b08ef42fea235bb019b5e5a97b3"
>> +
>> +SRC_URI[md5sum] = "20dd70ba5a35bc95bf869322d6852227"
>> +SRC_URI[sha256sum] = "344330ec3637e96b44dca77e086b205645b55648cf4d2b80fc673200f8a6a7e9"
>> +
>> +inherit pypi setuptools
>> -- 
>> 2.1.4
>>
>> -- 
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>


