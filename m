Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f181.google.com (mail-pf0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id D83426E268
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Mar 2016 21:47:41 +0000 (UTC)
Received: by mail-pf0-f181.google.com with SMTP id 124so87594617pfg.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Mar 2016 13:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=YcLhdPfDBlsnYOw+NSjFsOJbaR0Tay0LFNv+MAtNVGc=;
	b=WbyY0ocN6lKR33I3YzvBqoA8YtahctRzA29KbTl2c+sO9donaI0rtvIpbI61+50xec
	QQCWMZIi8TPLhUAcLSLcTF+a6J5tgSCpAlk7cp5uh740HyVKIWmRyXqPLqHrAErgvoFL
	usXBk1ij7mVzouVEXZwFkZaFnFlJc4xZYt3kv/5YkTtgcr9ACvZzMOB6Wi7yW7BRrBRi
	GhBedJqM1Pf+1xtOjQYze92+HBubG0Z7mNm8VgWnIZvF/ycEhzAas3VX9yDcJwgtWmiG
	+68ajkdsHNX/wJG5QUx+Uuq9r1gHZUK0D9V+kakUGJQXfrxfV6GMgA7FzEdnL1B84g1F
	BIwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=YcLhdPfDBlsnYOw+NSjFsOJbaR0Tay0LFNv+MAtNVGc=;
	b=XpSGqsITOpPQF13L6zamkQyjQdKxRraTN3keu9L6JGtTTmCJ1Y4zmJPl/raPE4845+
	T5XXPP1cCrPtCav4e+YeEWh1NGZXEeYqI6+5vDahe6xs2SBOY+h5SRr1XUTolH+l456A
	tQHwLqaWmYtkMve1bP/vxm00tHjylpy2Th4o11j/0BU//+oN1CboUaUhQUl2INwobMII
	AArNw0uxawYfj4/hGTe+v7tu+s5LvAZkNWdRwahISdSu2yByQHWVWJ5136iLf+xGWg1m
	w9zqicf1KIfdlj2B+0AO6VPUSqO5h27mkso4+zIQRNcJOwOq36jikNryzElkieKZYIkp
	idYQ==
X-Gm-Message-State: AD7BkJLXzi0zY8PDJ/wvQDSgYfT6aY2kI+9yOWA+U6W/O1vpELAv2Y56ZxvEbWFbZYPmIA==
X-Received: by 10.98.16.198 with SMTP id 67mr36814072pfq.21.1457387262306;
	Mon, 07 Mar 2016 13:47:42 -0800 (PST)
Received: from [10.43.100.29] ([64.2.3.194])
	by smtp.googlemail.com with ESMTPSA id
	d81sm26135452pfj.77.2016.03.07.13.47.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 Mar 2016 13:47:41 -0800 (PST)
To: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <1457196897-9174-1-git-send-email-akuster808@gmail.com>
	<20160307120754.GC2549@jama>
From: akuster808 <akuster808@gmail.com>
Message-ID: <56DDF6FC.8090200@gmail.com>
Date: Mon, 7 Mar 2016 13:47:40 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <20160307120754.GC2549@jama>
Subject: Re: [meta-python][jethro][fido][PATCH] python-m2crypto: fix SSLv2 symbol issue
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
X-List-Received-Date: Mon, 07 Mar 2016 21:47:43 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 03/07/2016 04:07 AM, Martin Jansa wrote:
> On Sat, Mar 05, 2016 at 08:54:57AM -0800, Armin Kuster wrote:
>> From: Armin Kuster <akuster@mvista.com>
>>
>> ERROR: Failed to import the "M2Crypto" module: .../usr/lib/python2.7/site-packages/M2Crypto/__m2crypto.so: undefined symbol: SSLv2_method
>>
>> disable using SSLv2_method if not supported in openssl. This is now the case
>> with the advent of CVE-2016-0800
> 
> Doen't apply cleanly in fido-next, can you send version for fido
> separately?

sure.

- armin

> 
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
>> index ff6203f..7dfa8d8 100644
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
>> +SWIG_FEATURES += "OPENSSL_NO_SSL2"
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

