Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4E32960557
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Nov 2014 02:06:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sA5263if017975
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 4 Nov 2014 18:06:03 -0800 (PST)
Received: from [128.224.162.204] (128.224.162.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Tue, 4 Nov 2014 18:06:02 -0800
Message-ID: <54598605.8020407@windriver.com>
Date: Wed, 5 Nov 2014 10:05:57 +0800
From: Chong Lu <Chong.Lu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Joe MacDonald <Joe_MacDonald@mentor.com>
References: <1414653948-23213-1-git-send-email-Chong.Lu@windriver.com>
	<20141104213131.GC11534@mentor.com>
In-Reply-To: <20141104213131.GC11534@mentor.com>
X-Originating-IP: [128.224.162.204]
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] polarssl: set LIB_INSTALL_DIR to baselib
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
X-List-Received-Date: Wed, 05 Nov 2014 02:06:11 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


On 11/05/2014 05:31 AM, Joe MacDonald wrote:
> Also merged.  I didn't dig into why, but I got a patch failure when I
> added it, so I re-created it and preserved your header.  You should have
> a quick look-see, just to be sure, though.

Got it. Thanks.

Best Regards
Chong

>
> Thanks,
> -J.
>
> [[oe] [meta-networking][PATCH] polarssl: set LIB_INSTALL_DIR to baselib] On 14.10.30 (Thu 15:25) Chong Lu wrote:
>
>> This solves the following warning:
>>
>> polarssl-1.3.8: polarssl: Files/directories were installed but not shipped
>>    /usr/lib
>>    /usr/lib/libpolarssl.so.1.3.8
>>    /usr/lib/libpolarssl.so.7
>>    /usr/lib/libpolarssl.so
>>    /usr/lib/libpolarssl.a
>>    /usr/lib/.debug
>>    /usr/lib/.debug/libpolarssl.so.1.3.8 [installed-vs-shipped]
>> polarssl-1.3.8: polarssl requires libpolarssl.so.7()(64bit), but no providers
>> in its RDEPENDS [file-rdeps]
>>
>> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
>> ---
>>   recipes-connectivity/polarssl/polarssl_1.3.8.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-networking/recipes-connectivity/polarssl/polarssl_1.3.8.bb b/meta-networking/recipes-connectivity/polarssl/polarssl_1.3.8.bb
>> index 3f9ba18..fa89631 100644
>> --- a/meta-networking/recipes-connectivity/polarssl/polarssl_1.3.8.bb
>> +++ b/meta-networking/recipes-connectivity/polarssl/polarssl_1.3.8.bb
>> @@ -18,6 +18,6 @@ SRC_URI[sha256sum] = "318171db41335cacbb5b0047c94f1faf91442ab70a223b5223436703c9
>>   
>>   DEPENDS = "openssl"
>>   RDEPENDS_${PN} += "libcrypto"
>> -EXTRA_OECMAKE = "-DUSE_SHARED_POLARSSL_LIBRARY=on"
>> +EXTRA_OECMAKE = "-DUSE_SHARED_POLARSSL_LIBRARY=on -DLIB_INSTALL_DIR=${baselib}"
>>   
>>   inherit cmake
>> -- 
>> 1.9.1
>>


