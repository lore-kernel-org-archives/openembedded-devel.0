Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web12.2422.1610709062288791630
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Jan 2021 03:11:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=lsv0676H;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: anbelski@linux.microsoft.com)
Received: from [192.168.178.23] (unknown [87.123.127.52])
	by linux.microsoft.com (Postfix) with ESMTPSA id F25F120B7192;
	Fri, 15 Jan 2021 03:11:00 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com F25F120B7192
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1610709061;
	bh=X2HRDqz+w7oTImRHoKStt3OhkRmSRH3g2TlDgzeOoBU=;
	h=Subject:To:References:From:Date:In-Reply-To:From;
	b=lsv0676H04zMOpLoylnvwjRFOfK3Pibx0tkgi6fJyzST2PzpFquun3RINHuomRfmv
	 Z5ta/wRIzZBgtwhg+stvI+gAA+eQk6pOxYjHk6wJf7cfzI2J+iWSMVkuP5nXuqWh7S
	 CxzUooJQh4oeyloiEMnISkpAGqcpirHqzpw3Kkv0=
Subject: Re: [oe] [meta-oe][PATCH v2] xmlsec1: Fix configure QA error caused by host lookup path
To: akuster808 <akuster808@gmail.com>,
 openembedded-devel@lists.openembedded.org
References: <20210114173623.26233-1-anbelski@linux.microsoft.com>
 <3c1127ea-1125-3a66-8e66-63be6d87a5ee@gmail.com>
From: "Anatol Belski" <anbelski@linux.microsoft.com>
Message-ID: <65de5bb9-6d64-b069-1942-9fc2315df036@linux.microsoft.com>
Date: Fri, 15 Jan 2021 12:10:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <3c1127ea-1125-3a66-8e66-63be6d87a5ee@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi,

On 1/15/2021 3:56 AM, akuster808 wrote:
>
> On 1/14/21 9:36 AM, Anatol Belski wrote:
>> The configure script contains hardcoded lookup paths to /usr and other
>> paths that might interfere with the host. These are overwritten with the
>> staging dir locations for Poky compatibility.
> The QA message has "xmlsec1-1.2.30" so this appears it needs to be
> backported to Gatesgarth and Dunfell.
>
> Please confirm.

Correct, the initial issue is in Dunfell. It should be either backported 
or I was intended to file a patch against Dunfell, whatever is 
preferred. Please let me know. The v2 is the version to be taken.

Thanks

Anatol

>
> -armin
>> Signed-off-by: Anatol Belski <anbelski@linux.microsoft.com>
>> ---
>>   .../xmlsec1/ensure-search-path-non-host.patch | 22 +++++++++++++++++++
>>   .../recipes-support/xmlsec1/xmlsec1_1.2.31.bb |  1 +
>>   2 files changed, 23 insertions(+)
>>   create mode 100644 meta-oe/recipes-support/xmlsec1/xmlsec1/ensure-search-path-non-host.patch
>>
>> diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1/ensure-search-path-non-host.patch b/meta-oe/recipes-support/xmlsec1/xmlsec1/ensure-search-path-non-host.patch
>> new file mode 100644
>> index 0000000000..a5a298af0d
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/xmlsec1/xmlsec1/ensure-search-path-non-host.patch
>> @@ -0,0 +1,22 @@
>> +xmlsec1: Fix configure QA error caused by host lookup path
>> +
>> +ERROR: mc:my-sdk:xmlsec1-1.2.30-r0 do_configure: QA Issue: This autoconf log indicates errors, it looked at host include and/or library paths while determining system capabilities.
>> +
>> +It will eventually arise after the configure QA as the configure script should only look at the staging sysroot dir, not at the host.
>> +
>> +Upstream-Status: Inappropriate [embedded specific]
>> +Signed-off-by: Anatol Belski <anbelski@linux.microsoft.com>
>> +
>> +--- a/configure.ac.orig   2021-01-13 14:37:42.254991177 +0000
>> ++++ b/configure.ac        2021-01-13 14:40:56.546269330 +0000
>> +@@ -250,8 +250,8 @@
>> + dnl ==========================================================================
>> + dnl Common installation locations
>> + dnl ==========================================================================
>> +-COMMON_INCLUDE_DIR="/usr/include /usr/local/include"
>> +-COMMON_LIB_DIR="/usr/lib /usr/lib64 /usr/local/lib"
>> ++COMMON_INCLUDE_DIR="${STAGING_INCDIR}"
>> ++COMMON_LIB_DIR="${STAGING_LIBDIR}"
>> + case $host in
>> +     i*86-*-linux-gnu)   COMMON_LIB_DIR="$COMMON_LIB_DIR /usr/lib/i386-linux-gnu" ;;
>> +     x86_64-*-linux-gnu) COMMON_LIB_DIR="$COMMON_LIB_DIR /usr/lib/x86_64-linux-gnu" ;;
>> diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.31.bb b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.31.bb
>> index 803016c96e..3464f2f43c 100644
>> --- a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.31.bb
>> +++ b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.31.bb
>> @@ -19,6 +19,7 @@ SRC_URI = "http://www.aleksey.com/xmlsec/download/${BP}.tar.gz \
>>       file://xmlsec1-examples-allow-build-in-separate-dir.patch \
>>       file://0001-nss-nspr-fix-for-multilib.patch \
>>       file://run-ptest \
>> +    file://ensure-search-path-non-host.patch \
>>       "
>>   
>>   SRC_URI[md5sum] = "182f5cbdfb8ddbac535c04470c170dc3"
>>
>> 
>>
