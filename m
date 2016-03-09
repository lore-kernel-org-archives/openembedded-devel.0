Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 6155060721
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Mar 2016 19:18:47 +0000 (UTC)
Received: by mail-pa0-f47.google.com with SMTP id tt10so46996185pab.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Mar 2016 11:18:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=L2q6QSGseKS7nlT7F4hFWWlSvNVcPQrURGcPq32m9/k=;
	b=oJNI0g+94oetA1A5DlWwt+M0kiNh7zEPqy2W6HPMII3ra1mKdz7foZkMOQeB/KtO53
	K+rIn/qxJl2BNXjPLtYmlHJnE7XCyJhCoWmgdwvl3h3txoGrEpjvp+5VYsf9SSJPEwTx
	XeaLGUtdC1PhUr4xyhJEBwZZISbn1JPLzY/lB5x3V3APpbuNMoZkYHEEUQaU7oe+1nuR
	hy5/IOWUOM1tzOlgxxcq5rlW36wIuQWV0p5nU+M751n2TOhBqs/e7grtO22qnqmLLP+6
	/djE4x2xnMdNOASMOkl61cB8KrMeIsr4G6a0nFCDBkUBzufOtegZ/nvA4EeWJC2M94hy
	6TTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=L2q6QSGseKS7nlT7F4hFWWlSvNVcPQrURGcPq32m9/k=;
	b=iX5rOJeF6vYCZb3Q4iDBGvkwh0O9sdIC07QXnf78VOiL7Gqpdm/lr+aPBTTyucN4Ww
	yrxd8Kwy4DBdTqBI74WP7uTx729DcgMKCHnSxBd+Z/cQ34FF4WklMzzNx/Vf2mNfWmd2
	jYZD5BlSiEWVNfCeNvyTCqd0oMR/zpQ0afL1oTYZ50F2m3jp77f2W3X+emX5G0QA1aCH
	kTzljDsKJcw/1mBVeAUojYuHAFMI8iMRYH3WXgkTdiAOjW8Kqo/WopiLbvwKGHBLlYJh
	OQDLczWl70kSulr8lQbEPDmEI7QNnOZfbcawPTFPTe+3IlaF6Iww37nOBEFbUMfdy+AL
	Ilag==
X-Gm-Message-State: AD7BkJI0vbqUa4oOsIR3cJm8pk1/StpXeSD2xbf6EFHsWjUL+pP+zsNbGYCmJFurL6/YfA==
X-Received: by 10.66.161.68 with SMTP id xq4mr26858647pab.102.1457551128589;
	Wed, 09 Mar 2016 11:18:48 -0800 (PST)
Received: from [10.43.100.29] ([64.2.3.194])
	by smtp.googlemail.com with ESMTPSA id
	zu10sm20381pab.31.2016.03.09.11.18.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 09 Mar 2016 11:18:47 -0800 (PST)
To: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <1457543217-11211-1-git-send-email-akuster808@gmail.com>
	<20160309191156.GH2542@jama>
From: akuster808 <akuster808@gmail.com>
Message-ID: <56E07715.8060801@gmail.com>
Date: Wed, 9 Mar 2016 11:18:45 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <20160309191156.GH2542@jama>
Subject: Re: [meta-python][jethro][PATCH][V2] python-m2crypto: fix SSLv2 symbol issue
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
X-List-Received-Date: Wed, 09 Mar 2016 19:18:48 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 03/09/2016 11:11 AM, Martin Jansa wrote:
> On Wed, Mar 09, 2016 at 09:06:57AM -0800, Armin Kuster wrote:
>> From: Armin Kuster <akuster@mvista.com>
>>
>> missed using "-D"  for OPENSSL_NO_SSL2 swig_features.
> 
> fido version:
> http://patchwork.openembedded.org/patch/117291/
> needed -D as well, right?

yes.


> 
> I've pushed both to fido-next and jethro-next

thanks
-armin
> 
>>
>> ERROR: Failed to import the "M2Crypto" module: .../usr/lib/python2.7/site-packages/M2Crypto/__m2crypto.so: undefined symbol: SSLv2_method
>>
>> disable using SSLv2_method if not supported in openssl. This is now the case
>> with the advent of CVE-2016-0800
>>
>> Signed-off-by: Armin Kuster <akuster@mvista.com>
>> ---
>>  ...y_build_with_SSLv2_when_it_is_not_available.patch | 20 ++++++++++++++++++++
>>  .../python/python-m2crypto_0.21.1.bb                 |  4 +++-
>>  2 files changed, 23 insertions(+), 1 deletion(-)
>>  create mode 100644 meta-python/recipes-devtools/python/python-m2crypto/dont_try_build_with_SSLv2_when_it_is_not_available.patch
>>
>> diff --git a/meta-python/recipes-devtools/python/python-m2crypto/dont_try_build_with_SSLv2_when_it_is_not_available.patch b/meta-python/recipes-devtools/python/python-m2crypto/dont_try_build_with_SSLv2_when_it_is_not_available.patch
>> new file mode 100644
>> index 0000000..526c23f
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python-m2crypto/dont_try_build_with_SSLv2_when_it_is_not_available.patch
>> @@ -0,0 +1,20 @@
>> +Upstream-Status: Backport
>> +https://gitlab.com/m2crypto/m2crypto/commit/ac01b38302474920288c1a9eb63fd35fa8d1db5b
>> +
>> +Signed-off-by: Armin Kuster <akuster@mvista.com>
>> +
>> +Index: M2Crypto-0.21.1/SWIG/_ssl.i
>> +===================================================================
>> +--- M2Crypto-0.21.1.orig/SWIG/_ssl.i
>> ++++ M2Crypto-0.21.1/SWIG/_ssl.i
>> +@@ -48,8 +48,10 @@ extern const char *SSL_alert_desc_string
>> + %rename(ssl_get_alert_desc_v) SSL_alert_desc_string_long;
>> + extern const char *SSL_alert_desc_string_long(int);
>> + 
>> ++#ifndef OPENSSL_NO_SSL2
>> + %rename(sslv2_method) SSLv2_method;
>> + extern SSL_METHOD *SSLv2_method(void);
>> ++#endif
>> + %rename(sslv3_method) SSLv3_method;
>> + extern SSL_METHOD *SSLv3_method(void);
>> + %rename(sslv23_method) SSLv23_method;
>> diff --git a/meta-python/recipes-devtools/python/python-m2crypto_0.21.1.bb b/meta-python/recipes-devtools/python/python-m2crypto_0.21.1.bb
>> index ff6203f..9daea5e 100644
>> --- a/meta-python/recipes-devtools/python/python-m2crypto_0.21.1.bb
>> +++ b/meta-python/recipes-devtools/python/python-m2crypto_0.21.1.bb
>> @@ -8,7 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=b0e1f0b7d0ce8a62c18b1287b991800e"
>>  
>>  SRC_URI = "http://pypi.python.org/packages/source/M/M2Crypto/M2Crypto-${PV}.tar.gz \
>>             file://0001-setup.py-link-in-sysroot-not-in-host-directories.patch \
>> -           file://0001-M2Crypto-Error-fix.patch"
>> +           file://0001-M2Crypto-Error-fix.patch \
>> +           file://dont_try_build_with_SSLv2_when_it_is_not_available.patch"
>>  
>>  SRC_URI[md5sum] = "f93d8462ff7646397a9f77a2fe602d17"
>>  SRC_URI[sha256sum] = "25b94498505c2d800ee465db0cc1aff097b1615adc3ac042a1c85ceca264fc0a"
>> @@ -19,6 +20,7 @@ inherit setuptools
>>  
>>  SWIG_FEATURES_x86-64 = "-D__x86_64__"
>>  SWIG_FEATURES ?= ""
>> +SWIG_FEATURES += "-DOPENSSL_NO_SSL2"
>>  export SWIG_FEATURES
>>  
>>  # Get around a problem with swig, but only if the
>> -- 
>> 2.3.5
>>
>> -- 
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> 

