Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vwyodapink@gmail.com>) id 1Oqyjs-0007QU-20
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Sep 2010 03:37:28 +0200
Received: by wwb31 with SMTP id 31so501079wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Sep 2010 18:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=LEVqsOY5NIWFbcplYQnpBzKU15ce6fF8b99PhMUvl10=;
	b=PKDXlq1UHFmgdPkVgAIuVvAzNDk0pnqUXOFdY0OZ3r6ndVnQpcS+DEp9Qro17Y5amS
	sUK0/zJdlcsnuI3oP/WTgO7aNpKNzIfPzYjK2VSVy1aitYso8YUBhezWff5T+UxKF4NG
	W6WJAzI9vcl11Rk2s8qu5ougEGx2ZUZrzGtO0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=hHWCYseXjPovodph+2BYO4itljUKc9m6rzfk7a+rM/8KtWf81NtPXk+esh+Uc1+I7G
	MvvIaei/MBbJQEQNptk6PFNeDuCQ7N8XmlHkLYAn8n/5yMUliXUNxTJwTcR459fsnHf3
	r38ugz0y5pXVqcPZhdiviMURtAOe1BuYknzaI=
MIME-Version: 1.0
Received: by 10.216.54.16 with SMTP id h16mr8710400wec.6.1283391393374; Wed,
	01 Sep 2010 18:36:33 -0700 (PDT)
Received: by 10.216.179.76 with HTTP; Wed, 1 Sep 2010 18:36:33 -0700 (PDT)
Date: Wed, 1 Sep 2010 18:36:33 -0700
Message-ID: <AANLkTikZkqdSe5_ZgKe8KftcgRD134etHQMTQswJKUSY@mail.gmail.com>
From: "J. L. " <vwyodapink@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: vwyodapink@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS,
	URI_NOVOWEL autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: python-m2crypto_0.18.2 fails to build
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 02 Sep 2010 01:37:29 -0000
Content-Type: text/plain; charset=ISO-8859-1

I am unable to get this to build, end of the error is below was to
long to post all of it

| SWIG/_m2crypto_wrap.c: In function '_wrap_ssl_get_ciphers':
| SWIG/_m2crypto_wrap.c:16078: error: 'STACK' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:16078: error: 'result' undeclared (first use
in this function)
| SWIG/_m2crypto_wrap.c:16091: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c: In function '_wrap_sk_ssl_cipher_num':
| SWIG/_m2crypto_wrap.c:16101: error: 'STACK' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:16101: error: 'arg1' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:16101: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c:16112: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c:16118: warning: implicit declaration of
function 'sk_ssl_cipher_num'
| SWIG/_m2crypto_wrap.c: In function '_wrap_sk_ssl_cipher_value':
| SWIG/_m2crypto_wrap.c:16131: error: 'STACK' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:16131: error: 'arg1' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:16131: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c:16146: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c:16157: warning: implicit declaration of
function 'sk_ssl_cipher_value'
| SWIG/_m2crypto_wrap.c: In function '_wrap_ssl_get_peer_cert_chain':
| SWIG/_m2crypto_wrap.c:16171: error: 'STACK' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:16171: error: 'result' undeclared (first use
in this function)
| SWIG/_m2crypto_wrap.c:16184: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c: In function '_wrap_sk_x509_num':
| SWIG/_m2crypto_wrap.c:16194: error: 'STACK' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:16194: error: 'arg1' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:16194: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c:16205: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c:16211: warning: implicit declaration of
function 'sk_x509_num'
| SWIG/_m2crypto_wrap.c: In function '_wrap_sk_x509_value':
| SWIG/_m2crypto_wrap.c:16224: error: 'STACK' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:16224: error: 'arg1' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:16224: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c:16239: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c:16250: warning: implicit declaration of
function 'sk_x509_value'
| SWIG/_m2crypto_wrap.c: In function '_wrap_x509_name_entry_set_data':
| SWIG/_m2crypto_wrap.c:18262: warning: pointer targets in assignment
differ in signedness
| SWIG/_m2crypto_wrap.c: In function '_wrap_x509_store_ctx_get1_chain':
| SWIG/_m2crypto_wrap.c:18850: error: 'STACK' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:18850: error: 'result' undeclared (first use
in this function)
| SWIG/_m2crypto_wrap.c:18858: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c: In function '_wrap_sk_x509_new_null':
| SWIG/_m2crypto_wrap.c:19663: error: 'STACK' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:19663: error: 'result' undeclared (first use
in this function)
| SWIG/_m2crypto_wrap.c:19666: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c: In function '_wrap_sk_x509_free':
| SWIG/_m2crypto_wrap.c:19676: error: 'STACK' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:19676: error: 'arg1' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:19676: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c:19686: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c:19692: warning: implicit declaration of
function 'sk_x509_free'
| SWIG/_m2crypto_wrap.c: In function '_wrap_sk_x509_push':
| SWIG/_m2crypto_wrap.c:19702: error: 'STACK' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:19702: error: 'arg1' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:19702: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c:19717: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c:19733: warning: implicit declaration of
function 'sk_x509_push'
| SWIG/_m2crypto_wrap.c: In function '_wrap_sk_x509_pop':
| SWIG/_m2crypto_wrap.c:19746: error: 'STACK' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:19746: error: 'arg1' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:19746: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c:19757: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c:19763: warning: implicit declaration of
function 'sk_x509_pop'
| SWIG/_m2crypto_wrap.c: In function '_wrap_x509_req_add_extensions':
| SWIG/_m2crypto_wrap.c:19964: error: 'STACK' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:19964: error: 'arg2' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:19964: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c:19983: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c:19994: error: too many arguments to function
'x509_req_add_extensions'
| SWIG/_m2crypto_wrap.c: In function '_wrap_x509v3_lhash':
| SWIG/_m2crypto_wrap.c:20068: error: 'LHASH' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:20068: error: 'result' undeclared (first use
in this function)
| SWIG/_m2crypto_wrap.c:20071: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c: In function '_wrap_x509v3_set_conf_lhash':
| SWIG/_m2crypto_wrap.c:20081: error: 'LHASH' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:20081: error: 'arg1' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:20081: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c:20092: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c:20093: warning: implicit declaration of
function 'x509v3_set_conf_lhash'
| SWIG/_m2crypto_wrap.c: In function '_wrap_x509v3_ext_conf':
| SWIG/_m2crypto_wrap.c:20103: error: 'LHASH' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:20103: error: 'arg1' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:20103: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c:20128: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c:20144: warning: implicit declaration of
function 'x509v3_ext_conf'
| SWIG/_m2crypto_wrap.c: In function '_wrap_sk_x509_extension_new_null':
| SWIG/_m2crypto_wrap.c:20203: error: 'STACK' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:20203: error: 'result' undeclared (first use
in this function)
| SWIG/_m2crypto_wrap.c:20206: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c: In function '_wrap_sk_x509_extension_free':
| SWIG/_m2crypto_wrap.c:20216: error: 'STACK' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:20216: error: 'arg1' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:20216: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c:20226: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c:20232: warning: implicit declaration of
function 'sk_x509_extension_free'
| SWIG/_m2crypto_wrap.c: In function '_wrap_sk_x509_extension_push':
| SWIG/_m2crypto_wrap.c:20242: error: 'STACK' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:20242: error: 'arg1' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:20242: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c:20257: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c:20268: warning: implicit declaration of
function 'sk_x509_extension_push'
| SWIG/_m2crypto_wrap.c: In function '_wrap_sk_x509_extension_pop':
| SWIG/_m2crypto_wrap.c:20281: error: 'STACK' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:20281: error: 'arg1' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:20281: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c:20292: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c:20298: warning: implicit declaration of
function 'sk_x509_extension_pop'
| SWIG/_m2crypto_wrap.c: In function '_wrap_sk_x509_extension_num':
| SWIG/_m2crypto_wrap.c:20308: error: 'STACK' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:20308: error: 'arg1' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:20308: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c:20319: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c:20325: warning: implicit declaration of
function 'sk_x509_extension_num'
| SWIG/_m2crypto_wrap.c: In function '_wrap_sk_x509_extension_value':
| SWIG/_m2crypto_wrap.c:20338: error: 'STACK' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:20338: error: 'arg1' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:20338: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c:20353: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c:20364: warning: implicit declaration of
function 'sk_x509_extension_value'
| SWIG/_m2crypto_wrap.c: In function '_wrap_make_stack_from_der_sequence':
| SWIG/_m2crypto_wrap.c:20398: error: 'STACK' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:20398: error: 'result' undeclared (first use
in this function)
| SWIG/_m2crypto_wrap.c:20404: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c: In function '_wrap_get_der_encoding_stack':
| SWIG/_m2crypto_wrap.c:20414: error: 'STACK' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:20414: error: 'arg1' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:20414: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c:20425: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c:20431: warning: implicit declaration of
function 'get_der_encoding_stack'
| SWIG/_m2crypto_wrap.c: In function '_wrap_pkcs7_encrypt':
| SWIG/_m2crypto_wrap.c:21383: error: 'STACK' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:21383: error: 'arg1' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:21383: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c:21406: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c:21437: warning: implicit declaration of
function 'pkcs7_encrypt'
| SWIG/_m2crypto_wrap.c: In function '_wrap_pkcs7_sign1':
| SWIG/_m2crypto_wrap.c:21579: error: 'STACK' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:21579: error: 'arg3' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:21579: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c:21614: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c:21645: warning: passing argument 4 of
'pkcs7_sign1' makes integer from pointer without a cast
| SWIG/_m2crypto_wrap.c:21645: error: too many arguments to function
'pkcs7_sign1'
| SWIG/_m2crypto_wrap.c: In function '_wrap_pkcs7_verify1':
| SWIG/_m2crypto_wrap.c:21656: error: 'STACK' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:21656: error: 'arg2' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:21656: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c:21687: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c:21718: warning: passing argument 3 of
'pkcs7_verify1' from incompatible pointer type
| SWIG/_m2crypto_wrap.c:21718: warning: passing argument 4 of
'pkcs7_verify1' makes integer from pointer without a cast
| SWIG/_m2crypto_wrap.c:21718: error: too many arguments to function
'pkcs7_verify1'
| SWIG/_m2crypto_wrap.c: In function '_wrap_pkcs7_verify0':
| SWIG/_m2crypto_wrap.c:21731: error: 'STACK' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:21731: error: 'arg2' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:21731: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c:21758: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c:21779: warning: passing argument 3 of
'pkcs7_verify0' makes integer from pointer without a cast
| SWIG/_m2crypto_wrap.c:21779: error: too many arguments to function
'pkcs7_verify0'
| SWIG/_m2crypto_wrap.c: In function '_wrap_pkcs7_get0_signers':
| SWIG/_m2crypto_wrap.c:22184: error: 'STACK' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:22184: error: 'arg2' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:22184: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c:22195: error: 'result' undeclared (first use
in this function)
| SWIG/_m2crypto_wrap.c:22207: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c:22223: error: expected expression before ')' token
| error: command 'arm-angstrom-linux-gnueabi-gcc' failed with exit status 1
| FATAL: python setup.py build_ext execution failed.
NOTE: Task failed:
/home/vdubhack/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/python-m2crypto-0.18.2-ml1/temp/log.do_compile.6706
NOTE: oestats: task failed, see
http://tinderbox.openembedded.net/public/logs/task/7539413.txt
ERROR: TaskFailed event exception, aborting
ERROR: Build of
/home/vdubhack/overo-oe/org.openembedded.dev/recipes/python/python-m2crypto_0.18.2.bb
do_compile failed
ERROR: Task 2635
(/home/vdubhack/overo-oe/org.openembedded.dev/recipes/python/python-m2crypto_0.18.2.bb,
do_compile) failed
NOTE: Tasks Summary: Attempted 10393 tasks of which 10153 didn't need
to be rerun and 1 failed.
ERROR: '/home/vdubhack/overo-oe/org.openembedded.dev/recipes/python/python-m2crypto_0.18.2.bb'
failed
NOTE: oestats: build failed, see http://tinderbox.openembedded.net/builds/85564/
vdubhack@UAV:~/overo-oe$ bitbake -c clean python-m2crypto
NOTE: Handling BitBake files: | (7445/7448) [99 %]
NOTE: Parsing finished. 6460 cached, 471 parsed, 517 skipped, 2 masked.
NOTE: oestats: build 85573
NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 1 of 1 (ID: 0,
/home/vdubhack/overo-oe/org.openembedded.dev/recipes/python/python-m2crypto_0.18.2.bb,
do_clean)
NOTE: removing tmp/work/armv7a-angstrom-linux-gnueabi/python-m2crypto-0.18.2-ml1
NOTE: removing tmp/stamps/armv7a-angstrom-linux-gnueabi/python-m2crypto-0.18.2-ml1.*
NOTE: Tasks Summary: Attempted 1 tasks of which 0 didn't need to be
rerun and 0 failed.
vdubhack@UAV:~/overo-oe$ bitbake -c rebuild python-m2crypto
NOTE: Handling BitBake files: | (7445/7448) [99 %]
NOTE: Parsing finished. 6460 cached, 471 parsed, 517 skipped, 2 masked.
NOTE: oestats: build 85574
NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 1625 of 1644 (ID: 8,
/home/vdubhack/overo-oe/org.openembedded.dev/recipes/python/python-m2crypto_0.18.2.bb,
do_setscene)
NOTE: Running task 1626 of 1644 (ID: 6,
/home/vdubhack/overo-oe/org.openembedded.dev/recipes/python/python-m2crypto_0.18.2.bb,
do_fetch)
NOTE: Running task 1627 of 1644 (ID: 0,
/home/vdubhack/overo-oe/org.openembedded.dev/recipes/python/python-m2crypto_0.18.2.bb,
do_unpack)
NOTE: Unpacking sources/m2crypto-0.18.2.tar.gz to
tmp/work/armv7a-angstrom-linux-gnueabi/python-m2crypto-0.18.2-ml1/
NOTE: Running task 1628 of 1644 (ID: 1,
/home/vdubhack/overo-oe/org.openembedded.dev/recipes/python/python-m2crypto_0.18.2.bb,
do_patch)
NOTE: Applying patch 'install.patch'
(org.openembedded.dev/recipes/python/python-m2crypto/install.patch)
NOTE: Running task 1629 of 1644 (ID: 9,
/home/vdubhack/overo-oe/org.openembedded.dev/recipes/python/python-m2crypto_0.18.2.bb,
do_configure)
NOTE: Running task 1630 of 1644 (ID: 10,
/home/vdubhack/overo-oe/org.openembedded.dev/recipes/python/python-m2crypto_0.18.2.bb,
do_qa_configure)
NOTE: Running task 1631 of 1644 (ID: 11,
/home/vdubhack/overo-oe/org.openembedded.dev/recipes/python/python-m2crypto_0.18.2.bb,
do_compile)
ERROR: function do_compile failed
ERROR: log data follows
(/home/vdubhack/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/python-m2crypto-0.18.2-ml1/temp/log.do_compile.6814)
| running build
| running build_py
| creating build
| creating build/lib.linux-i686-2.6
| creating build/lib.linux-i686-2.6/M2Crypto
| copying M2Crypto/httpslib.py -> build/lib.linux-i686-2.6/M2Crypto
| copying M2Crypto/RSA.py -> build/lib.linux-i686-2.6/M2Crypto
| copying M2Crypto/RC4.py -> build/lib.linux-i686-2.6/M2Crypto
| copying M2Crypto/m2.py -> build/lib.linux-i686-2.6/M2Crypto
| copying M2Crypto/SMIME.py -> build/lib.linux-i686-2.6/M2Crypto
| copying M2Crypto/Err.py -> build/lib.linux-i686-2.6/M2Crypto
| copying M2Crypto/ftpslib.py -> build/lib.linux-i686-2.6/M2Crypto
| copying M2Crypto/X509.py -> build/lib.linux-i686-2.6/M2Crypto
| copying M2Crypto/callback.py -> build/lib.linux-i686-2.6/M2Crypto
| copying M2Crypto/threading.py -> build/lib.linux-i686-2.6/M2Crypto
| copying M2Crypto/DSA.py -> build/lib.linux-i686-2.6/M2Crypto
| copying M2Crypto/m2urllib.py -> build/lib.linux-i686-2.6/M2Crypto
| copying M2Crypto/DH.py -> build/lib.linux-i686-2.6/M2Crypto
| copying M2Crypto/EVP.py -> build/lib.linux-i686-2.6/M2Crypto
| copying M2Crypto/BN.py -> build/lib.linux-i686-2.6/M2Crypto
| copying M2Crypto/util.py -> build/lib.linux-i686-2.6/M2Crypto
| copying M2Crypto/Rand.py -> build/lib.linux-i686-2.6/M2Crypto
| copying M2Crypto/__init__.py -> build/lib.linux-i686-2.6/M2Crypto
| copying M2Crypto/AuthCookie.py -> build/lib.linux-i686-2.6/M2Crypto
| copying M2Crypto/EC.py -> build/lib.linux-i686-2.6/M2Crypto
| copying M2Crypto/ASN1.py -> build/lib.linux-i686-2.6/M2Crypto
| copying M2Crypto/BIO.py -> build/lib.linux-i686-2.6/M2Crypto
| copying M2Crypto/m2xmlrpclib.py -> build/lib.linux-i686-2.6/M2Crypto
| copying M2Crypto/m2urllib2.py -> build/lib.linux-i686-2.6/M2Crypto
| creating build/lib.linux-i686-2.6/M2Crypto/SSL
| copying M2Crypto/SSL/Context.py -> build/lib.linux-i686-2.6/M2Crypto/SSL
| copying M2Crypto/SSL/cb.py -> build/lib.linux-i686-2.6/M2Crypto/SSL
| copying M2Crypto/SSL/TwistedProtocolWrapper.py ->
build/lib.linux-i686-2.6/M2Crypto/SSL
| copying M2Crypto/SSL/SSLServer.py -> build/lib.linux-i686-2.6/M2Crypto/SSL
| copying M2Crypto/SSL/Session.py -> build/lib.linux-i686-2.6/M2Crypto/SSL
| copying M2Crypto/SSL/timeout.py -> build/lib.linux-i686-2.6/M2Crypto/SSL
| copying M2Crypto/SSL/Cipher.py -> build/lib.linux-i686-2.6/M2Crypto/SSL
| copying M2Crypto/SSL/Checker.py -> build/lib.linux-i686-2.6/M2Crypto/SSL
| copying M2Crypto/SSL/ssl_dispatcher.py ->
build/lib.linux-i686-2.6/M2Crypto/SSL
| copying M2Crypto/SSL/__init__.py -> build/lib.linux-i686-2.6/M2Crypto/SSL
| copying M2Crypto/SSL/Connection.py -> build/lib.linux-i686-2.6/M2Crypto/SSL
| creating build/lib.linux-i686-2.6/M2Crypto/PGP
| copying M2Crypto/PGP/PublicKey.py -> build/lib.linux-i686-2.6/M2Crypto/PGP
| copying M2Crypto/PGP/RSA.py -> build/lib.linux-i686-2.6/M2Crypto/PGP
| copying M2Crypto/PGP/constants.py -> build/lib.linux-i686-2.6/M2Crypto/PGP
| copying M2Crypto/PGP/packet.py -> build/lib.linux-i686-2.6/M2Crypto/PGP
| copying M2Crypto/PGP/__init__.py -> build/lib.linux-i686-2.6/M2Crypto/PGP
| copying M2Crypto/PGP/PublicKeyRing.py -> build/lib.linux-i686-2.6/M2Crypto/PGP
| running build_ext
| building 'M2Crypto.__m2crypto' extension
| swigging SWIG/_m2crypto.i to SWIG/_m2crypto_wrap.c
| swig -python -I/home/vdubhack/overo-oe/tmp/sysroots/arm-angstrom-linux-gnueabi/usr/include/python2.6
-I/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/python2.6
-I/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include
-includeall -o SWIG/_m2crypto_wrap.c SWIG/_m2crypto.i
| SWIG/_bio.i:62: Warning 454: Setting a pointer/reference variable
may leak memory.
| SWIG/_rand.i:19: Warning 454: Setting a pointer/reference variable
may leak memory.
| SWIG/_evp.i:148: Warning 454: Setting a pointer/reference variable
may leak memory.
| SWIG/_dh.i:35: Warning 454: Setting a pointer/reference variable may
leak memory.
| SWIG/_rsa.i:43: Warning 454: Setting a pointer/reference variable
may leak memory.
| SWIG/_dsa.i:31: Warning 454: Setting a pointer/reference variable
may leak memory.
| SWIG/_ssl.i:201: Warning 454: Setting a pointer/reference variable
may leak memory.
| SWIG/_x509.i:302: Warning 454: Setting a pointer/reference variable
may leak memory.
| SWIG/_pkcs7.i:40: Warning 454: Setting a pointer/reference variable
may leak memory.
| SWIG/_pkcs7.i:40: Warning 454: Setting a pointer/reference variable
may leak memory.
| SWIG/_util.i:9: Warning 454: Setting a pointer/reference variable
may leak memory.
| SWIG/_ec.i:110: Warning 454: Setting a pointer/reference variable
may leak memory.
| creating build/temp.linux-i686-2.6
| creating build/temp.linux-i686-2.6/SWIG
| arm-angstrom-linux-gnueabi-gcc -march=armv7-a -mtune=cortex-a8
-mfpu=neon -mfloat-abi=softfp -mthumb-interwork -mno-thumb -DNDEBUG -g
-O3 -Wall -Wstrict-prototypes
-isystem/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include
-fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2
-ggdb3 -isystem/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include
-fPIC -I/home/vdubhack/overo-oe/tmp/sysroots/arm-angstrom-linux-gnueabi/usr/include/python2.6
-I/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/python2.6
-I/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include
-I/home/vdubhack/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/python-m2crypto-0.18.2-ml1/m2crypto-0.18.2/SWIG
-c SWIG/_m2crypto_wrap.c -o
build/temp.linux-i686-2.6/SWIG/_m2crypto_wrap.o -DTHREADING
| SWIG/_m2crypto_wrap.c: In function 'rand_pseudo_bytes':
| SWIG/_m2crypto_wrap.c:3891: warning: pointer targets in passing
argument 1 of 'PyString_FromStringAndSize' differ in signedness
| SWIG/_m2crypto_wrap.c: In function 'pkcs5_pbkdf2_hmac_sha1':
| SWIG/_m2crypto_wrap.c:3965: warning: pointer targets in passing
argument 1 of 'PyString_FromStringAndSize' differ in signedness
| SWIG/_m2crypto_wrap.c: In function 'bytes_to_key':
| SWIG/_m2crypto_wrap.c:4124: warning: pointer targets in passing
argument 1 of 'PyString_FromStringAndSize' differ in signedness
| SWIG/_m2crypto_wrap.c: In function 'sign_final':
| SWIG/_m2crypto_wrap.c:4220: warning: pointer targets in passing
argument 1 of 'PyString_FromStringAndSize' differ in signedness
| SWIG/_m2crypto_wrap.c: In function 'pkey_as_der':
| SWIG/_m2crypto_wrap.c:4289: warning: pointer targets in passing
argument 1 of 'PyString_FromStringAndSize' differ in signedness
| SWIG/_m2crypto_wrap.c: In function 'AES_crypt':
| SWIG/_m2crypto_wrap.c:4433: warning: pointer targets in passing
argument 1 of 'PyString_FromStringAndSize' differ in signedness
| SWIG/_m2crypto_wrap.c: At top level:
| SWIG/_m2crypto_wrap.c:5730: error: expected '=', ',', ';', 'asm' or
'__attribute__' before '*' token
| SWIG/_m2crypto_wrap.c:5734: error: expected ')' before '*' token
| SWIG/_m2crypto_wrap.c:5738: error: expected ')' before '*' token
| SWIG/_m2crypto_wrap.c:5742: error: expected '=', ',', ';', 'asm' or
'__attribute__' before '*' token
| SWIG/_m2crypto_wrap.c:5746: error: expected ')' before '*' token
| SWIG/_m2crypto_wrap.c:5750: error: expected ')' before '*' token
| SWIG/_m2crypto_wrap.c: In function 'i2d_x509':
| SWIG/_m2crypto_wrap.c:5820: warning: pointer targets in passing
argument 1 of 'PyString_FromStringAndSize' differ in signedness
| SWIG/_m2crypto_wrap.c: In function 'x509_name_set_by_nid':
| SWIG/_m2crypto_wrap.c:5898: warning: pointer targets in passing
argument 4 of 'X509_NAME_add_entry_by_NID' differ in signedness
| SWIG/_m2crypto_wrap.c: In function 'x509_name_add_entry_by_txt':
| SWIG/_m2crypto_wrap.c:5903: warning: pointer targets in passing
argument 4 of 'X509_NAME_add_entry_by_txt' differ in signedness
| SWIG/_m2crypto_wrap.c: At top level:
| SWIG/_m2crypto_wrap.c:5913: error: expected '=', ',', ';', 'asm' or
'__attribute__' before '*' token
| SWIG/_m2crypto_wrap.c:5918: error: expected ')' before '*' token
| SWIG/_m2crypto_wrap.c:5923: error: expected ')' before '*' token
| SWIG/_m2crypto_wrap.c:5928: error: expected ')' before '*' token
| SWIG/_m2crypto_wrap.c:5956: error: expected declaration specifiers
or '...' before 'STACK'
| SWIG/_m2crypto_wrap.c: In function 'x509_req_add_extensions':
| SWIG/_m2crypto_wrap.c:5957: error: 'exts' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:5957: error: (Each undeclared identifier is
reported only once
| SWIG/_m2crypto_wrap.c:5957: error: for each function it appears in.)
| SWIG/_m2crypto_wrap.c: At top level:
| SWIG/_m2crypto_wrap.c:5964: error: expected '=', ',', ';', 'asm' or
'__attribute__' before '*' token
| SWIG/_m2crypto_wrap.c:5970: error: expected ')' before '*' token
| SWIG/_m2crypto_wrap.c:5980: error: expected ')' before '*' token
| SWIG/_m2crypto_wrap.c:6006: error: expected '=', ',', ';', 'asm' or
'__attribute__' before '*' token
| SWIG/_m2crypto_wrap.c:6011: error: expected ')' before '*' token
| SWIG/_m2crypto_wrap.c:6016: error: expected ')' before '*' token
| SWIG/_m2crypto_wrap.c:6021: error: expected ')' before '*' token
| SWIG/_m2crypto_wrap.c:6026: error: expected ')' before '*' token
| SWIG/_m2crypto_wrap.c:6031: error: expected ')' before '*' token
| SWIG/_m2crypto_wrap.c:6053: error: expected '=', ',', ';', 'asm' or
'__attribute__' before '*' token
| SWIG/_m2crypto_wrap.c:6079: error: expected ')' before '*' token
| SWIG/_m2crypto_wrap.c:6130: error: expected ')' before '*' token
| SWIG/_m2crypto_wrap.c:6166: error: expected declaration specifiers
or '...' before 'STACK'
| SWIG/_m2crypto_wrap.c: In function 'pkcs7_sign1':
| SWIG/_m2crypto_wrap.c:6167: error: 'stack' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c: At top level:
| SWIG/_m2crypto_wrap.c:6170: error: expected declaration specifiers
or '...' before 'STACK'
| SWIG/_m2crypto_wrap.c: In function 'pkcs7_verify1':
| SWIG/_m2crypto_wrap.c:6180: error: 'stack' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c: At top level:
| SWIG/_m2crypto_wrap.c:6199: error: expected declaration specifiers
or '...' before 'STACK'
| SWIG/_m2crypto_wrap.c: In function 'pkcs7_verify0':
| SWIG/_m2crypto_wrap.c:6200: error: 'stack' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:6200: warning: passing argument 3 of
'pkcs7_verify1' from incompatible pointer type
| SWIG/_m2crypto_wrap.c:6200: warning: passing argument 4 of
'pkcs7_verify1' makes integer from pointer without a cast
| SWIG/_m2crypto_wrap.c:6200: error: too many arguments to function
'pkcs7_verify1'
| SWIG/_m2crypto_wrap.c: At top level:
| SWIG/_m2crypto_wrap.c:6273: error: expected '=', ',', ';', 'asm' or
'__attribute__' before '*' token
| SWIG/_m2crypto_wrap.c: In function 'util_string_to_hex':
| SWIG/_m2crypto_wrap.c:6324: warning: pointer targets in passing
argument 1 of 'PyString_FromStringAndSize' differ in signedness
| SWIG/_m2crypto_wrap.c: In function '_wrap_ssl_get_ciphers':
| SWIG/_m2crypto_wrap.c:16078: error: 'STACK' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:16078: error: 'result' undeclared (first use
in this function)
| SWIG/_m2crypto_wrap.c:16091: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c: In function '_wrap_sk_ssl_cipher_num':
| SWIG/_m2crypto_wrap.c:16101: error: 'STACK' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:16101: error: 'arg1' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:16101: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c:16112: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c:16118: warning: implicit declaration of
function 'sk_ssl_cipher_num'
| SWIG/_m2crypto_wrap.c: In function '_wrap_sk_ssl_cipher_value':
| SWIG/_m2crypto_wrap.c:16131: error: 'STACK' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:16131: error: 'arg1' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:16131: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c:16146: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c:16157: warning: implicit declaration of
function 'sk_ssl_cipher_value'
| SWIG/_m2crypto_wrap.c: In function '_wrap_ssl_get_peer_cert_chain':
| SWIG/_m2crypto_wrap.c:16171: error: 'STACK' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:16171: error: 'result' undeclared (first use
in this function)
| SWIG/_m2crypto_wrap.c:16184: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c: In function '_wrap_sk_x509_num':
| SWIG/_m2crypto_wrap.c:16194: error: 'STACK' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:16194: error: 'arg1' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:16194: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c:16205: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c:16211: warning: implicit declaration of
function 'sk_x509_num'
| SWIG/_m2crypto_wrap.c: In function '_wrap_sk_x509_value':
| SWIG/_m2crypto_wrap.c:16224: error: 'STACK' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:16224: error: 'arg1' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:16224: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c:16239: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c:16250: warning: implicit declaration of
function 'sk_x509_value'
| SWIG/_m2crypto_wrap.c: In function '_wrap_x509_name_entry_set_data':
| SWIG/_m2crypto_wrap.c:18262: warning: pointer targets in assignment
differ in signedness
| SWIG/_m2crypto_wrap.c: In function '_wrap_x509_store_ctx_get1_chain':
| SWIG/_m2crypto_wrap.c:18850: error: 'STACK' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:18850: error: 'result' undeclared (first use
in this function)
| SWIG/_m2crypto_wrap.c:18858: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c: In function '_wrap_sk_x509_new_null':
| SWIG/_m2crypto_wrap.c:19663: error: 'STACK' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:19663: error: 'result' undeclared (first use
in this function)
| SWIG/_m2crypto_wrap.c:19666: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c: In function '_wrap_sk_x509_free':
| SWIG/_m2crypto_wrap.c:19676: error: 'STACK' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:19676: error: 'arg1' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:19676: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c:19686: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c:19692: warning: implicit declaration of
function 'sk_x509_free'
| SWIG/_m2crypto_wrap.c: In function '_wrap_sk_x509_push':
| SWIG/_m2crypto_wrap.c:19702: error: 'STACK' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:19702: error: 'arg1' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:19702: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c:19717: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c:19733: warning: implicit declaration of
function 'sk_x509_push'
| SWIG/_m2crypto_wrap.c: In function '_wrap_sk_x509_pop':
| SWIG/_m2crypto_wrap.c:19746: error: 'STACK' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:19746: error: 'arg1' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:19746: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c:19757: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c:19763: warning: implicit declaration of
function 'sk_x509_pop'
| SWIG/_m2crypto_wrap.c: In function '_wrap_x509_req_add_extensions':
| SWIG/_m2crypto_wrap.c:19964: error: 'STACK' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:19964: error: 'arg2' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:19964: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c:19983: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c:19994: error: too many arguments to function
'x509_req_add_extensions'
| SWIG/_m2crypto_wrap.c: In function '_wrap_x509v3_lhash':
| SWIG/_m2crypto_wrap.c:20068: error: 'LHASH' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:20068: error: 'result' undeclared (first use
in this function)
| SWIG/_m2crypto_wrap.c:20071: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c: In function '_wrap_x509v3_set_conf_lhash':
| SWIG/_m2crypto_wrap.c:20081: error: 'LHASH' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:20081: error: 'arg1' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:20081: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c:20092: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c:20093: warning: implicit declaration of
function 'x509v3_set_conf_lhash'
| SWIG/_m2crypto_wrap.c: In function '_wrap_x509v3_ext_conf':
| SWIG/_m2crypto_wrap.c:20103: error: 'LHASH' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:20103: error: 'arg1' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:20103: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c:20128: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c:20144: warning: implicit declaration of
function 'x509v3_ext_conf'
| SWIG/_m2crypto_wrap.c: In function '_wrap_sk_x509_extension_new_null':
| SWIG/_m2crypto_wrap.c:20203: error: 'STACK' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:20203: error: 'result' undeclared (first use
in this function)
| SWIG/_m2crypto_wrap.c:20206: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c: In function '_wrap_sk_x509_extension_free':
| SWIG/_m2crypto_wrap.c:20216: error: 'STACK' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:20216: error: 'arg1' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:20216: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c:20226: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c:20232: warning: implicit declaration of
function 'sk_x509_extension_free'
| SWIG/_m2crypto_wrap.c: In function '_wrap_sk_x509_extension_push':
| SWIG/_m2crypto_wrap.c:20242: error: 'STACK' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:20242: error: 'arg1' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:20242: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c:20257: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c:20268: warning: implicit declaration of
function 'sk_x509_extension_push'
| SWIG/_m2crypto_wrap.c: In function '_wrap_sk_x509_extension_pop':
| SWIG/_m2crypto_wrap.c:20281: error: 'STACK' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:20281: error: 'arg1' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:20281: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c:20292: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c:20298: warning: implicit declaration of
function 'sk_x509_extension_pop'
| SWIG/_m2crypto_wrap.c: In function '_wrap_sk_x509_extension_num':
| SWIG/_m2crypto_wrap.c:20308: error: 'STACK' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:20308: error: 'arg1' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:20308: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c:20319: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c:20325: warning: implicit declaration of
function 'sk_x509_extension_num'
| SWIG/_m2crypto_wrap.c: In function '_wrap_sk_x509_extension_value':
| SWIG/_m2crypto_wrap.c:20338: error: 'STACK' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:20338: error: 'arg1' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:20338: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c:20353: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c:20364: warning: implicit declaration of
function 'sk_x509_extension_value'
| SWIG/_m2crypto_wrap.c: In function '_wrap_make_stack_from_der_sequence':
| SWIG/_m2crypto_wrap.c:20398: error: 'STACK' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:20398: error: 'result' undeclared (first use
in this function)
| SWIG/_m2crypto_wrap.c:20404: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c: In function '_wrap_get_der_encoding_stack':
| SWIG/_m2crypto_wrap.c:20414: error: 'STACK' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:20414: error: 'arg1' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:20414: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c:20425: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c:20431: warning: implicit declaration of
function 'get_der_encoding_stack'
| SWIG/_m2crypto_wrap.c: In function '_wrap_pkcs7_encrypt':
| SWIG/_m2crypto_wrap.c:21383: error: 'STACK' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:21383: error: 'arg1' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:21383: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c:21406: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c:21437: warning: implicit declaration of
function 'pkcs7_encrypt'
| SWIG/_m2crypto_wrap.c: In function '_wrap_pkcs7_sign1':
| SWIG/_m2crypto_wrap.c:21579: error: 'STACK' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:21579: error: 'arg3' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:21579: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c:21614: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c:21645: warning: passing argument 4 of
'pkcs7_sign1' makes integer from pointer without a cast
| SWIG/_m2crypto_wrap.c:21645: error: too many arguments to function
'pkcs7_sign1'
| SWIG/_m2crypto_wrap.c: In function '_wrap_pkcs7_verify1':
| SWIG/_m2crypto_wrap.c:21656: error: 'STACK' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:21656: error: 'arg2' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:21656: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c:21687: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c:21718: warning: passing argument 3 of
'pkcs7_verify1' from incompatible pointer type
| SWIG/_m2crypto_wrap.c:21718: warning: passing argument 4 of
'pkcs7_verify1' makes integer from pointer without a cast
| SWIG/_m2crypto_wrap.c:21718: error: too many arguments to function
'pkcs7_verify1'
| SWIG/_m2crypto_wrap.c: In function '_wrap_pkcs7_verify0':
| SWIG/_m2crypto_wrap.c:21731: error: 'STACK' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:21731: error: 'arg2' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:21731: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c:21758: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c:21779: warning: passing argument 3 of
'pkcs7_verify0' makes integer from pointer without a cast
| SWIG/_m2crypto_wrap.c:21779: error: too many arguments to function
'pkcs7_verify0'
| SWIG/_m2crypto_wrap.c: In function '_wrap_pkcs7_get0_signers':
| SWIG/_m2crypto_wrap.c:22184: error: 'STACK' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:22184: error: 'arg2' undeclared (first use in
this function)
| SWIG/_m2crypto_wrap.c:22184: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c:22195: error: 'result' undeclared (first use
in this function)
| SWIG/_m2crypto_wrap.c:22207: error: expected expression before ')' token
| SWIG/_m2crypto_wrap.c:22223: error: expected expression before ')' token
| error: command 'arm-angstrom-linux-gnueabi-gcc' failed with exit status 1
| FATAL: python setup.py build_ext execution failed.
NOTE: Task failed:
/home/vdubhack/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/python-m2crypto-0.18.2-ml1/temp/log.do_compile.6814
NOTE: oestats: task failed, see
http://tinderbox.openembedded.net/public/logs/task/7539690.txt
ERROR: TaskFailed event exception, aborting
ERROR: Build of
/home/vdubhack/overo-oe/org.openembedded.dev/recipes/python/python-m2crypto_0.18.2.bb
do_compile failed
ERROR: Task 11 (/home/vdubhack/overo-oe/org.openembedded.dev/recipes/python/python-m2crypto_0.18.2.bb,
do_compile) failed
NOTE: Tasks Summary: Attempted 1630 tasks of which 1624 didn't need to
be rerun and 1 failed.
ERROR: '/home/vdubhack/overo-oe/org.openembedded.dev/recipes/python/python-m2crypto_0.18.2.bb'
failed
NOTE: oestats: build failed, see http://tinderbox.openembedded.net/builds/85574/


