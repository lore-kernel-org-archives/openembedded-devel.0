Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id B13E4600EA
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Feb 2017 21:54:46 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id 204so13138674pge.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Feb 2017 13:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=+ZBKMKrkcyRNnyjhpMdFoNOH/PuOATM5ddJtK0BptwY=;
	b=qAIaSVP8D5ucD1Gkenl110cboilgfR6mrYEVGx6hoi6hjXiwFJyLbZInDV68ASJjK6
	HGQlt5P1g879oVcu+e/nxtsgqcZ7hD6sZ6iMkPi/yYx5a8820DMiL2QahhOURG/x+8mN
	Rf6pkGYt79R1+0zM7ijsOiysPtUXgq5kA6gfj/wvBAemF3Hc6r8Z4CZpEiu3fin/5m9T
	34ifYs/SiHRUsYuVZetIdBOS1xJGClJfxru6DRfALTOLu+N1/YNqT6dklytYUmqlEv2W
	rtUCZ+NWdbrdP547VXd5XOSh9o1II1+KxsW+F3vG1AVLPEh6W+5tWjmMstWVDqMvmgXF
	SVZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=+ZBKMKrkcyRNnyjhpMdFoNOH/PuOATM5ddJtK0BptwY=;
	b=VWqSfcQi5Pdl2jpPr6XKHLYiIEOfGOVeYgN7K3fPbw67aw+CnlE0FYO4ecFQ2o3je9
	Keg3nBfHRnIxeCp3T1Pvc+H+/iB0X5ntxZ+WWXNct58M9/NE32EiLHw/dIe8GSlzRtV8
	uV84QbGNqH3W/Jhc82SxwaQBpLihRW/Gej6agdkdj71HCP0Hu/3S/5VEx+nqqKh8+AUu
	Wr4rveF/Kad7/rJQcAFJ6nY3Nb/gufZ1oXE2Ak258pfTgXbr8xdR/tMGJ9hh0NuwS+vb
	bjyn0oZAhKiUPHR2HRwsC57qTlmbg8dd8yE62mxRFVZe6Px2lOr0z5joQxPKL9wKPHvZ
	/+MQ==
X-Gm-Message-State: AIkVDXLIivV18H63qSuPjg0g6irka/OzUYWSGjkiMFeA3NJ6yKDkrg2f6zVH1NkbXxdblg==
X-Received: by 10.84.218.5 with SMTP id q5mr28924663pli.80.1486504486930;
	Tue, 07 Feb 2017 13:54:46 -0800 (PST)
Received: from [10.43.100.166] (50-233-148-156-static.hfc.comcastbusiness.net.
	[50.233.148.156]) by smtp.gmail.com with ESMTPSA id
	75sm13850878pfp.80.2017.02.07.13.54.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 Feb 2017 13:54:46 -0800 (PST)
To: openembedded-devel@lists.openembedded.org, joe_macdonald@mentor.com
References: <1486399174-28949-1-git-send-email-akuster808@gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <37d5e1cc-5c17-dd28-b539-b35dadd3d90e@gmail.com>
Date: Tue, 7 Feb 2017 13:54:45 -0800
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
X-List-Received-Date: Tue, 07 Feb 2017 21:54:46 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



[Patchwork-Status: Superseded]

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


