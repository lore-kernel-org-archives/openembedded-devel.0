Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 079E2600E3
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Feb 2017 17:10:44 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id y143so7282090pfb.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Feb 2017 09:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=lHOXR2FOKGRJidTPuzLyps5YCpWeDvU4uMOI215vDas=;
	b=H1S6Q+kBUlJ0jTj9odk2EJEnEvWnLgcErqFcOSaVNyg2/5DID41hkU0PFbD2hMsv/x
	SlLZYATeX4GGesvUDcaiiT64JF8HcdsByRa978N0p2uLCsYeB8FJ7nj1C1sB/D63CAHj
	SBy3mxxYF4FAB97YYmioQMDm3Sw2WsF+ZbQYbwAWDrAzyXVh5KgRPsSgDBS79ZuMo9eS
	7UATioWsRFW5o56gJq4JCIk6/Z+8EmOklYejqqruFJbM4UaVJ3CdQHJ3nhzJkDd5veRD
	s+xcG8cmWIN6wm45LqZb4hVsiFTxSyIUwjQdwSZ+dmFCTGCaqx39jg8Q9Ci/HDCWV46R
	aNig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=lHOXR2FOKGRJidTPuzLyps5YCpWeDvU4uMOI215vDas=;
	b=Vtvhx0q5aasL5z6hEjosTm3ybeAR0hyEIzQkBgcqe6RxhL4LfaQacMPtcPN+X9FxYm
	TM3CD+tRoi5eDxjzAuH9toSrn8akm3LR3Ayx0ppHcGDbVHvHggPGGX5/yAoM8Zkv7ikP
	BENwbcVBrDyHE7CtcaWGg82WVbXDiwd18DRF5+cwkheRf7TtziCkmbfoDwTn+GuR/ChC
	umPTUIKP9CMoDo0iGJ/yVxf6oRAczLLwyFjJlYgUgedopCFF9PgEeWAjLkEX2tEBc3Er
	26rQC07B6Y8N4PamxQrllXJ8e1mlioTdd+jh3N1jONweCkElabTcD6vHG6nSK3vl0cSY
	GXfA==
X-Gm-Message-State: AIkVDXJStskJKgP2q+PoAAxvhQNpIW1jWni1VEGBDftfkUYkQq4Jj7s19kK1Eo6nMBBtAg==
X-Received: by 10.98.86.203 with SMTP id h72mr14359046pfj.108.1486401044585;
	Mon, 06 Feb 2017 09:10:44 -0800 (PST)
Received: from ?IPv6:2601:202:4001:9ea0:ac48:9a90:c71a:12ad?
	([2601:202:4001:9ea0:ac48:9a90:c71a:12ad])
	by smtp.gmail.com with ESMTPSA id
	j78sm4140220pfk.39.2017.02.06.09.10.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Feb 2017 09:10:43 -0800 (PST)
To: openembedded-devel@lists.openembedded.org, joe_macdonald@mentor.com
References: <1486399174-28949-1-git-send-email-akuster808@gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <caa1a269-b4e4-9909-967f-c637146fc4ba@gmail.com>
Date: Mon, 6 Feb 2017 09:10:42 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <1486399174-28949-1-git-send-email-akuster808@gmail.com>
Subject: Re: [meta-networking][PATCH] crda: fix build issue do to missing python module
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
X-List-Received-Date: Mon, 06 Feb 2017 17:10:48 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

please drop. this is fixed via a change in master-next.

http://cgit.openembedded.org/meta-openembedded/commit/?h=master-next&id=2e83e33c592543045a7761907d8cd62937e1e60d


- armin



On 02/06/2017 08:39 AM, Armin Kuster wrote:
> this now requires python-pycrypto module to fix plus upstream patch
>
> | ERROR: oe_runmake failed
> |   GEN  keys-ssl.c
> |   Trusted pubkeys: pubkeys/linville.key.pub.pem pubkeys/sforshee.key.pub.pem
> | ERROR: Failed to import the "Crypto.PublicKey" module: No module named Crypto.PublicKey
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>   ...crda-support-python-3-in-utils-key2pub.py.patch | 271 +++++++++++++++++++++
>   .../recipes-connectivity/crda/crda_3.18.bb         |   3 +-
>   2 files changed, 273 insertions(+), 1 deletion(-)
>   create mode 100644 meta-networking/recipes-connectivity/crda/crda/0001-crda-support-python-3-in-utils-key2pub.py.patch
>
> diff --git a/meta-networking/recipes-connectivity/crda/crda/0001-crda-support-python-3-in-utils-key2pub.py.patch b/meta-networking/recipes-connectivity/crda/crda/0001-crda-support-python-3-in-utils-key2pub.py.patch
> new file mode 100644
> index 0000000..d2ca92f
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/crda/crda/0001-crda-support-python-3-in-utils-key2pub.py.patch
> @@ -0,0 +1,271 @@
> +From 797f2836c48f9ba2446629ae4b6867ca1a5ea512 Mon Sep 17 00:00:00 2001
> +From: Taahir Ahmed <ahmed.taahir@gmail.com>
> +Date: Wed, 30 Mar 2016 11:23:54 -0300
> +Subject: [PATCH 1/2] crda: support python 3 in utils/key2pub.py
> +
> +utils/key2pub.py can now be run under either python 2.7 or python 3.x.
> +This required some minor syntactical changes as well as switching from
> +M2Crypto to pycrypto, since M2Crypto doesn't support python 3.x.
> +
> +In addition, some errors in the generated source file keys-ssl.h are
> +fixed:
> +
> +  * The correct OpenSSL header for BN_ULONG is included.
> +
> +  * The generated constants are given the 'ull' suffix to prevent
> +    warnings about constants that are too large.
> +
> +[Gustavo: don't call /utils/key2pub.py since that doesn't compute]
> +
> +Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> +
> +Upstream-Status: Backport
> +cdra seems to be a stalled project.
> +
> +Signed-off-by: Armin Kuster <akuster808@gmail.com>
> +
> +---
> +Status: submitted upstream by author but not (yet) accepted
> +URL: http://www.spinics.net/lists/linux-wireless/msg138936.html
> +
> + Makefile         |   2 +-
> + utils/key2pub.py | 146 ++++++++++++++++++++++++++++---------------------------
> + 2 files changed, 75 insertions(+), 73 deletions(-)
> +
> +Index: crda-3.18/Makefile
> +===================================================================
> +--- crda-3.18.orig/Makefile
> ++++ crda-3.18/Makefile
> +@@ -112,7 +112,7 @@ $(REG_BIN):
> + keys-%.c: utils/key2pub.py $(wildcard $(PUBKEY_DIR)/*.pem)
> + 	$(NQ) '  GEN ' $@
> + 	$(NQ) '  Trusted pubkeys:' $(wildcard $(PUBKEY_DIR)/*.pem)
> +-	$(Q)./utils/key2pub.py --$* $(wildcard $(PUBKEY_DIR)/*.pem) $@
> ++	$(Q) python utils/key2pub.py --$* $(wildcard $(PUBKEY_DIR)/*.pem) $@
> +
> + $(LIBREG): reglib.c
> + 	$(NQ) '  CC  ' $@
> +Index: crda-3.18/utils/key2pub.py
> +===================================================================
> +--- crda-3.18.orig/utils/key2pub.py
> ++++ crda-3.18/utils/key2pub.py
> +@@ -1,80 +1,77 @@
> + #!/usr/bin/env python
> +
> ++import io
> + import sys
> + try:
> +-       from M2Crypto import RSA
> +-except ImportError, e:
> +-       sys.stderr.write('ERROR: Failed to import the "M2Crypto" module: %s\n' % e.message)
> +-       sys.stderr.write('Please install the "M2Crypto" Python module.\n')
> +-       sys.stderr.write('On Debian GNU/Linux the package is called "python-m2crypto".\n')
> +-       sys.exit(1)
> ++    from Crypto.PublicKey import RSA
> ++except ImportError as e:
> ++    sys.stderr.write('ERROR: Failed to import the "Crypto.PublicKey" module: %s\n' % e.message)
> ++    sys.stderr.write('Please install the "Crypto.PublicKey" Python module.\n')
> ++    sys.stderr.write('On Debian GNU/Linux the package is called "python-crypto".\n')
> ++    sys.exit(1)
> ++
> ++def bitwise_collect(value, radix_bits):
> ++    words = []
> ++    radix_mask = (1 << radix_bits) - 1
> ++    while value != 0:
> ++        words.append(value & radix_mask)
> ++        value >>= radix_bits
> ++    return words
> +
> + def print_ssl_64(output, name, val):
> +-    while val[0] == '\0':
> +-        val = val[1:]
> +-    while len(val) % 8:
> +-        val = '\0' + val
> +-    vnew = []
> +-    while len(val):
> +-        vnew.append((val[0], val[1], val[2], val[3], val[4], val[5], val[6], val[7]))
> +-        val = val[8:]
> +-    vnew.reverse()
> +-    output.write('static BN_ULONG %s[%d] = {\n' % (name, len(vnew)))
> ++    # OpenSSL expects 64-bit words given least-significant-word first.
> ++    vwords = bitwise_collect(val, 64)
> ++
> ++    output.write(u'static BN_ULONG {}[] = {{\n'.format(name))
> +     idx = 0
> +-    for v1, v2, v3, v4, v5, v6, v7, v8 in vnew:
> ++    for vword in vwords:
> +         if not idx:
> +-            output.write('\t')
> +-        output.write('0x%.2x%.2x%.2x%.2x%.2x%.2x%.2x%.2xULL, ' % (ord(v1), ord(v2), ord(v3), ord(v4), ord(v5), ord(v6), ord(v7), ord(v8)))
> ++            output.write(u'\t')
> ++        output.write(u'0x{:016x}ULL, '.format(vword))
> +         idx += 1
> +         if idx == 2:
> +             idx = 0
> +-            output.write('\n')
> ++            output.write(u'\n')
> +     if idx:
> +-        output.write('\n')
> +-    output.write('};\n\n')
> ++        output.write(u'\n')
> ++    output.write(u'};\n\n')
> +
> + def print_ssl_32(output, name, val):
> +-    while val[0] == '\0':
> +-        val = val[1:]
> +-    while len(val) % 4:
> +-        val = '\0' + val
> +-    vnew = []
> +-    while len(val):
> +-        vnew.append((val[0], val[1], val[2], val[3], ))
> +-        val = val[4:]
> +-    vnew.reverse()
> +-    output.write('static BN_ULONG %s[%d] = {\n' % (name, len(vnew)))
> ++    # OpenSSL expects 32-bit words given least-significant-word first.
> ++    vwords = bitwise_collect(val, 32)
> ++
> ++    output.write(u'static BN_ULONG {}[] = {{\n'.format(name))
> +     idx = 0
> +-    for v1, v2, v3, v4 in vnew:
> ++    for vword in vwords:
> +         if not idx:
> +-            output.write('\t')
> +-        output.write('0x%.2x%.2x%.2x%.2x, ' % (ord(v1), ord(v2), ord(v3), ord(v4)))
> ++            output.write(u'\t')
> ++        output.write(u'0x{:08x}, '.format(vword))
> +         idx += 1
> +         if idx == 4:
> +             idx = 0
> +-            output.write('\n')
> ++            output.write(u'\n')
> +     if idx:
> +-        output.write('\n')
> +-    output.write('};\n\n')
> ++        output.write(u'\n')
> ++    output.write(u'};\n\n')
> +
> + def print_ssl(output, name, val):
> +     import os
> +-    output.write('#include <stdint.h>\n')
> +-    output.write('#include <openssl/bn.h>\n')
> ++    output.write(u'#include <stdint.h>\n')
> ++    output.write(u'#include <openssl/bn.h>\n')
> +     if os.getenv('TARGET_BITS') == '64':
> +         return print_ssl_64(output, name, val)
> +     else:
> +         return print_ssl_32(output, name, val)
> +
> + def print_ssl_keys(output, n):
> +-    output.write(r'''
> ++    output.write(u'''
> + struct pubkey {
> + 	struct bignum_st e, n;
> + };
> +
> +-#define KEY(data) {				\
> +-	.d = data,				\
> +-	.top = sizeof(data)/sizeof(data[0]),	\
> ++#define KEY(data) {                          \\
> ++	.d = data,                           \\
> ++	.top = sizeof(data)/sizeof(data[0]), \\
> + }
> +
> + #define KEYS(e,n)	{ KEY(e), KEY(n), }
> +@@ -82,46 +79,47 @@ struct pubkey {
> + static struct pubkey keys[] __attribute__((unused))= {
> + ''')
> +     for n in xrange(n + 1):
> +-        output.write('	KEYS(e_%d, n_%d),\n' % (n, n))
> +-    output.write('};\n')
> ++        output.write(u'	KEYS(e_{0}, n_{0}),\n'.format(n))
> ++    output.write(u'};\n')
> +     pass
> +
> + def print_gcrypt(output, name, val):
> +-    output.write('#include <stdint.h>\n')
> +-    while val[0] == '\0':
> +-        val = val[1:]
> +-    output.write('static const uint8_t %s[%d] = {\n' % (name, len(val)))
> ++    # gcrypt expects 8-bit words most-significant-word first
> ++    vwords = bitwise_collect(val, 8)
> ++    vwords.reverse()
> ++
> ++    output.write(u'#include <stdint.h>\n')
> ++    output.write(u'static const uint8_t %s[%d] = {\n' % (name, len(vwords)))
> +     idx = 0
> +-    for v in val:
> ++    for vword in vwords:
> +         if not idx:
> +-            output.write('\t')
> +-        output.write('0x%.2x, ' % ord(v))
> ++            output.write(u'\t')
> ++        output.write(u'0x{:02x}, '.format(vword))
> +         idx += 1
> +         if idx == 8:
> +             idx = 0
> +-            output.write('\n')
> ++            output.write(u'\n')
> +     if idx:
> +-        output.write('\n')
> +-    output.write('};\n\n')
> ++        output.write(u'\n')
> ++    output.write(u'};\n\n')
> +
> + def print_gcrypt_keys(output, n):
> +-    output.write(r'''
> ++    output.write(u'''
> + struct key_params {
> + 	const uint8_t *e, *n;
> + 	uint32_t len_e, len_n;
> + };
> +
> +-#define KEYS(_e, _n) {			\
> +-	.e = _e, .len_e = sizeof(_e),	\
> +-	.n = _n, .len_n = sizeof(_n),	\
> ++#define KEYS(_e, _n) {                \\
> ++	.e = _e, .len_e = sizeof(_e), \\
> ++	.n = _n, .len_n = sizeof(_n), \\
> + }
> +
> + static const struct key_params keys[] __attribute__((unused))= {
> + ''')
> +-    for n in xrange(n + 1):
> +-        output.write('	KEYS(e_%d, n_%d),\n' % (n, n))
> +-    output.write('};\n')
> +-
> ++    for n in range(n + 1):
> ++        output.write(u'	KEYS(e_{0}, n_{0}),\n'.format(n))
> ++    output.write(u'};\n')
> +
> + modes = {
> +     '--ssl': (print_ssl, print_ssl_keys),
> +@@ -136,21 +134,21 @@ except IndexError:
> +     mode = None
> +
> + if not mode in modes:
> +-    print 'Usage: %s [%s] input-file... output-file' % (sys.argv[0], '|'.join(modes.keys()))
> ++    print('Usage: {} [{}] input-file... output-file'.format(sys.argv[0], '|'.join(modes.keys())))
> +     sys.exit(2)
> +
> +-output = open(outfile, 'w')
> ++output = io.open(outfile, 'w')
> +
> + # load key
> + idx = 0
> + for f in files:
> +-    try:
> +-        key = RSA.load_pub_key(f)
> +-    except RSA.RSAError:
> +-        key = RSA.load_key(f)
> +
> +-    modes[mode][0](output, 'e_%d' % idx, key.e[4:])
> +-    modes[mode][0](output, 'n_%d' % idx, key.n[4:])
> ++    key_contents = io.open(f, 'rb').read()
> ++    key = RSA.importKey(key_contents)
> ++
> ++    modes[mode][0](output, 'e_{}'.format(idx), key.e)
> ++    modes[mode][0](output, 'n_{}'.format(idx), key.n)
> ++
> +     idx += 1
> +
> + modes[mode][1](output, idx - 1)
> diff --git a/meta-networking/recipes-connectivity/crda/crda_3.18.bb b/meta-networking/recipes-connectivity/crda/crda_3.18.bb
> index dbddd55..ab27614 100644
> --- a/meta-networking/recipes-connectivity/crda/crda_3.18.bb
> +++ b/meta-networking/recipes-connectivity/crda/crda_3.18.bb
> @@ -4,7 +4,7 @@ SECTION = "net"
>   LICENSE = "copyleft-next-0.3.0"
>   LIC_FILES_CHKSUM = "file://copyleft-next-0.3.0;md5=8743a2c359037d4d329a31e79eabeffe"
>   
> -DEPENDS = "python-m2crypto-native python-native libgcrypt libnl openssl"
> +DEPENDS = "python-pycrypto-native python-native libgcrypt libnl openssl"
>   
>   SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz \
>              file://do-not-run-ldconfig-if-destdir-is-set.patch \
> @@ -14,6 +14,7 @@ SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz \
>              file://make.patch \
>              file://use-target-word-size-instead-of-host-s.patch \
>              file://fix-issues-when-USE_OPENSSL-1.patch \
> +           file://0001-crda-support-python-3-in-utils-key2pub.py.patch \
>   "
>   SRC_URI[md5sum] = "0431fef3067bf503dfb464069f06163a"
>   SRC_URI[sha256sum] = "43fcb9679f8b75ed87ad10944a506292def13e4afb194afa7aa921b01e8ecdbf"


