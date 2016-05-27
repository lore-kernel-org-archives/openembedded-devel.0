Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1C14B76E5E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 May 2016 20:42:18 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id yl2so13615109pac.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 May 2016 13:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=gnIxmRjN8GE33hn6MQ6Xm/QS8EJAzSiCQEMbd1D2rE8=;
	b=JPZNBP0+d7poUjWzVddJsZeN/l0uDeCrzq4y+lM7mBwAhu4DqdFfadl0/V5FBwLTER
	fzxOO4Vfn5IzHmbcJfjqF0grFToNnIX5RRYDh55Cs5vfrxD4Pzc8fTupYfmi7rpay4d2
	W02DcLZxRUUeZ6GLUbnz0RVA4uWzJ6iQCPyNu7Q8OPf4BX300anAroVDkrz3JRFXfcUj
	cEPw8wvhXmZPVbBuIr18oknEs+YTgwgfp7ZR3Xo1a5DkjGJO0/d+dO4AuENe8YnqHOSH
	+7clBxTOFKXznJd9yo7kaQ2fehULEwm1xx2i5jCLpVt3sAi9RC3r2iGIOV/gjHB30CaV
	Gn2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=gnIxmRjN8GE33hn6MQ6Xm/QS8EJAzSiCQEMbd1D2rE8=;
	b=Q3Og/rxtqa4XlVWhan7+CiUol9G5oBeci+jvUgsQFIulse9MXLA2BiWrQS+OJ6A44G
	SktMYAhN1EVoVq2L4rkfRDa/F+XW6EbXjRU9+n8ova9+2Dwf8HRH/pXhYWQPhuiXwuuV
	mbkBFbnO5/PjCXwnDHVfZlw43LGo6Fhos7jv6S5SbCp80oxKk0/u+mnfxL5qDcyxL+IB
	Zh3y8mnoLDdmHStcFGZKZCsIIZN0ke/oegwbwrh0+frsrX7awQB8wC3JohyrS6LyiFkl
	uYiubjECLXd4Jxq6H1arAeEQFMwG0rkFXKnQtd7a2eOIn4AemPzJqHXrydK/TlUKONPP
	bydg==
X-Gm-Message-State: ALyK8tKCHqxYiXFDkfh6PbBQBH3x5c9TvfMt8/6eLE58iBi0YqO7DGUQk9TsB9RaGglIhw==
X-Received: by 10.66.140.17 with SMTP id rc17mr25307522pab.79.1464381739061;
	Fri, 27 May 2016 13:42:19 -0700 (PDT)
Received: from [192.168.18.4] (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.googlemail.com with ESMTPSA id
	g195sm15777585pfb.7.2016.05.27.13.42.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 27 May 2016 13:42:18 -0700 (PDT)
To: openembedded-devel@lists.openembedded.org
References: <1463344766-1554-1-git-send-email-akuster808@gmail.com>
	<20160527135436.GF2570@jama>
From: akuster808 <akuster808@gmail.com>
Message-ID: <5748B128.6080504@gmail.com>
Date: Fri, 27 May 2016 13:42:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <20160527135436.GF2570@jama>
Cc: Armin Kuster <akuster@mvista.com>
Subject: Re: [meta-python][master][krogoth][PATCH] python-cryptography: fix compile issue with openssl 1.0.2h
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
X-List-Received-Date: Fri, 27 May 2016 20:42:20 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 05/27/2016 06:54 AM, Martin Jansa wrote:
> On Sun, May 15, 2016 at 01:39:26PM -0700, Armin Kuster wrote:
>> From: Armin Kuster <akuster@mvista.com>
>>
>> this fixes:
>>
>> error: 'SSLv2_method' redeclared as different kind of symbol
>> |  SSL_METHOD* (*SSLv2_method)(void) = NULL;
> 
> Can you please create similar change for jethro?
> It also has 1.0.2h now and jethro is using older
> python-cryptography_0.8.1.bb so it's not just cherry-pick of this.

on my list for this weekend.

- armin
> 
> Thanks,
> 
>> Signed-off-by: Armin Kuster <akuster@mvista.com>
>> ---
>>  .../Comment_lingering_SSLv2_symbol.patch           | 24 +++++++
>>  .../Remove_SSLv2_bindings.patch                    | 75 ++++++++++++++++++++++
>>  .../python/python-cryptography_1.1.bb              |  4 +-
>>  3 files changed, 102 insertions(+), 1 deletion(-)
>>  create mode 100644 meta-python/recipes-devtools/python/python-cryptography/Comment_lingering_SSLv2_symbol.patch
>>  create mode 100644 meta-python/recipes-devtools/python/python-cryptography/Remove_SSLv2_bindings.patch
>>
>> diff --git a/meta-python/recipes-devtools/python/python-cryptography/Comment_lingering_SSLv2_symbol.patch b/meta-python/recipes-devtools/python/python-cryptography/Comment_lingering_SSLv2_symbol.patch
>> new file mode 100644
>> index 0000000..b28e7ef
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python-cryptography/Comment_lingering_SSLv2_symbol.patch
>> @@ -0,0 +1,24 @@
>> +From f326e4a97cce6b9479560ce0c65ad18d54393f96 Mon Sep 17 00:00:00 2001
>> +From: Cory Benfield <lukasaoz@gmail.com>
>> +Date: Mon, 14 Dec 2015 15:37:46 +0000
>> +Subject: [PATCH] Comment lingering SSLv2 symbol.
>> +
>> +---
>> + src/_cffi_src/openssl/ssl.py | 4 ++++
>> + 1 file changed, 4 insertions(+)
>> +
>> +Index: cryptography-1.1/src/_cffi_src/openssl/ssl.py
>> +===================================================================
>> +--- cryptography-1.1.orig/src/_cffi_src/openssl/ssl.py
>> ++++ cryptography-1.1/src/_cffi_src/openssl/ssl.py
>> +@@ -421,6 +421,10 @@ const long SSL_OP_LEGACY_SERVER_CONNECT
>> + static const long Cryptography_HAS_SECURE_RENEGOTIATION = 1;
>> + #endif
>> + 
>> ++/* Cryptography now compiles out all SSLv2 bindings. This exists to allow
>> ++ * clients that use it to check for SSLv2 support to keep functioning as
>> ++ * expected.
>> ++ */
>> + static const long Cryptography_HAS_SSL2 = 0;
>> + 
>> + #ifdef OPENSSL_NO_SSL3_METHOD
>> diff --git a/meta-python/recipes-devtools/python/python-cryptography/Remove_SSLv2_bindings.patch b/meta-python/recipes-devtools/python/python-cryptography/Remove_SSLv2_bindings.patch
>> new file mode 100644
>> index 0000000..8522325
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python-cryptography/Remove_SSLv2_bindings.patch
>> @@ -0,0 +1,75 @@
>> +From 90c6a53a885dd5c66992309e0af98ac554f1bb97 Mon Sep 17 00:00:00 2001
>> +From: Cory Benfield <lukasaoz@gmail.com>
>> +Date: Mon, 14 Dec 2015 08:35:20 +0000
>> +Subject: [PATCH] Remove SSLv2 bindings.
>> +
>> +This commit removes bindings that allow users to set SSLv2 handshake
>> +methods. These are regarded as unnecessary and out-of-date: see #2527.
>> +This commit does leave in a few options that refer to SSLv2 in order to
>> +avoid breaking deployments that rely on them, and in order to allow
>> +users to continue to request that SSLv2 not be enabled at all in their
>> +OpenSSL.
>> +
>> +Upstream-Status: Backport
>> +
>> +This fixes the compile issue after updating to openssl 1.0.2h
>> +Signed-off-by: Armin Kuster <akuster@mvista.com>
>> +
>> +---
>> + src/_cffi_src/openssl/ssl.py                            | 17 +----------------
>> + .../hazmat/bindings/openssl/_conditional.py             |  6 ------
>> + 2 files changed, 1 insertion(+), 22 deletions(-)
>> +
>> +Index: cryptography-1.1/src/_cffi_src/openssl/ssl.py
>> +===================================================================
>> +--- cryptography-1.1.orig/src/_cffi_src/openssl/ssl.py
>> ++++ cryptography-1.1/src/_cffi_src/openssl/ssl.py
>> +@@ -292,15 +292,6 @@ unsigned long SSL_CTX_add_extra_chain_ce
>> + 
>> + /*  methods */
>> + 
>> +-/* SSLv2 support is compiled out of some versions of OpenSSL.  These will
>> +- * get special support when we generate the bindings so that if they are
>> +- * available they will be wrapped, but if they are not they won't cause
>> +- * problems (like link errors).
>> +- */
>> +-const SSL_METHOD *SSLv2_method(void);
>> +-const SSL_METHOD *SSLv2_server_method(void);
>> +-const SSL_METHOD *SSLv2_client_method(void);
>> +-
>> + /*
>> +  * TLSv1_1 and TLSv1_2 are recent additions.  Only sufficiently new versions of
>> +  * OpenSSL support them.
>> +@@ -429,14 +420,8 @@ const long SSL_OP_LEGACY_SERVER_CONNECT
>> + #else
>> + static const long Cryptography_HAS_SECURE_RENEGOTIATION = 1;
>> + #endif
>> +-#ifdef OPENSSL_NO_SSL2
>> ++
>> + static const long Cryptography_HAS_SSL2 = 0;
>> +-SSL_METHOD* (*SSLv2_method)(void) = NULL;
>> +-SSL_METHOD* (*SSLv2_client_method)(void) = NULL;
>> +-SSL_METHOD* (*SSLv2_server_method)(void) = NULL;
>> +-#else
>> +-static const long Cryptography_HAS_SSL2 = 1;
>> +-#endif
>> + 
>> + #ifdef OPENSSL_NO_SSL3_METHOD
>> + static const long Cryptography_HAS_SSL3_METHOD = 0;
>> +Index: cryptography-1.1/src/cryptography/hazmat/bindings/openssl/_conditional.py
>> +===================================================================
>> +--- cryptography-1.1.orig/src/cryptography/hazmat/bindings/openssl/_conditional.py
>> ++++ cryptography-1.1/src/cryptography/hazmat/bindings/openssl/_conditional.py
>> +@@ -274,12 +274,6 @@ CONDITIONAL_NAMES = {
>> +         "TLSv1_2_client_method",
>> +     ],
>> + 
>> +-    "Cryptography_HAS_SSL2": [
>> +-        "SSLv2_method",
>> +-        "SSLv2_client_method",
>> +-        "SSLv2_server_method",
>> +-    ],
>> +-
>> +     "Cryptography_HAS_SSL3_METHOD": [
>> +         "SSLv3_method",
>> +         "SSLv3_client_method",
>> diff --git a/meta-python/recipes-devtools/python/python-cryptography_1.1.bb b/meta-python/recipes-devtools/python/python-cryptography_1.1.bb
>> index c501787..665a4cb 100644
>> --- a/meta-python/recipes-devtools/python/python-cryptography_1.1.bb
>> +++ b/meta-python/recipes-devtools/python/python-cryptography_1.1.bb
>> @@ -5,7 +5,9 @@ DEPENDS += " python-cffi-native python-cffi python-enum34 python-six python-pyas
>>  SRCNAME = "cryptography"
>>  
>>  SRC_URI = "file://run-ptest \
>> -           file://build_fix_openssl_1.0.1g.patch"
>> +           file://build_fix_openssl_1.0.1g.patch \
>> +           file://Remove_SSLv2_bindings.patch \
>> +           file://Comment_lingering_SSLv2_symbol.patch"
>>  
>>  SRC_URI[md5sum] = "dd06da41535184f48f2c8e8b74dd570f"
>>  SRC_URI[sha256sum] = "059bc6428b1d0e2317f505698602642f1d8dda5b120ec573a59a430d8cb7a32d"
>> -- 
>> 2.3.5
>>
>> -- 
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> 
> 
> 

