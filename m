Received: from smtp3.nedap.com ([87.249.123.12] helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jaap.dejong@nedap.com>) id 1SWSiF-0001rj-5i
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 May 2012 15:31:51 +0200
Received: from nvs0066.nedap.local (10.91.8.1) by relaysmtp1.nedap.local
	(10.1.8.139) with Microsoft SMTP Server id 8.3.83.0; Mon, 21 May 2012
	15:21:43 +0200
X-TM-IMSS-Message-ID: <72808ddc00219b4f@nedap.com>
Received: from [10.2.40.10] ([10.2.40.10]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.1) id 72808ddc00219b4f ;
	Mon, 21 May 2012 15:21:47 +0200
Message-ID: <4FBA4165.3050504@nedap.com>
Date: Mon, 21 May 2012 15:21:41 +0200
From: Jaap de Jong <jaap.dejong@nedap.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: openssl (2011.03) on ubuntu 12.04
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
X-List-Received-Date: Mon, 21 May 2012 13:31:51 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hi All!
anybody ran into this error?
Looks like a path missing or so.
(I'm building 2011.03 from ground op on a fresh ubuntu 12.04)
If needed I can sent the complete log
Thanks!
Jaap

////
gcc -DMONOLITH -I.. -I../include  -fPIC -DOPENSSL_PIC -DOPENSSL_THREADS 
-D_REENTRANT -DDSO_DLFCN -DHAVE_DLFCN_H -DL_ENDIAN     -DTERMIO   -Wall  
-Wa,--noexecstack -DOPENSSL_BN_ASM_PART_WORDS -DOPENSSL_IA32_SSE2 
-DOPENSSL_BN_ASM_MONT -DSHA1_ASM -DSHA256_ASM -DSHA512_ASM -DMD5_ASM 
-DRMD160_ASM -DAES_ASM -DWHIRLPOOL_ASM 
-isystem/media/OpenEmbedded/oe/develop/build/tmp_angstrom_2008_1/sysroots/i686-linux/usr/include  
-c -o openssl.o openssl.c
rm -f openssl
shlib_target=; if [ -n "libcrypto.so.1.0.0 libssl.so.1.0.0" ]; then \
         shlib_target="linux-shared"; \
     fi; \
     LIBRARIES="-L.. -lssl  -L.. -lcrypto" ; \
     make -f ../Makefile.shared -e \
         APPNAME=openssl OBJECTS="openssl.o verify.o asn1pars.o req.o 
dgst.o dh.o dhparam.o enc.o passwd.o gendh.o errstr.o ca.o pkcs7.o 
crl2p7.o crl.o rsa.o rsautl.o dsa.o dsaparam.o ec.o ecparam.o x509.o 
genrsa.o gendsa.o genpkey.o s_server.o s_client.o speed.o s_time.o 
apps.o s_cb.o s_socket.o app_rand.o version.o sess_id.o ciphers.o nseq.o 
pkcs12.o pkcs8.o pkey.o pkeyparam.o pkeyutl.o spkac.o smime.o cms.o 
rand.o engine.o ocsp.o prime.o ts.o" \
         LIBDEPS=" $LIBRARIES -lgcc -ldl" \
         link_app.${shlib_target}
make[2]: Entering directory 
`/media/OpenEmbedded/oe/develop/build/tmp_angstrom_2008_1/work/i686-linux/openssl-native-1.0.0b-r13.1/openssl-1.0.0b/apps'
openssl.o: In function `main':
openssl.c:(.text+0x199): undefined reference to `BIO_s_file'
openssl.c:(.text+0x1a1): undefined reference to `BIO_new'
openssl.c:(.text+0x1e1): undefined reference to `BIO_ctrl'
openssl.c:(.text+0x231): undefined reference to `CRYPTO_dbg_get_options'
openssl.c:(.text+0x23b): undefined reference to `CRYPTO_dbg_set_options'
openssl.c:(.text+0x245): undefined reference to `CRYPTO_dbg_free'
openssl.c:(.text+0x24f): undefined reference to `CRYPTO_dbg_realloc'
openssl.c:(.text+0x259): undefined reference to `CRYPTO_dbg_malloc'
openssl.c:(.text+0x261): undefined reference to 
`CRYPTO_set_mem_debug_functions'
openssl.c:(.text+0x26d): undefined reference to 
`CRYPTO_set_mem_debug_options'
openssl.c:(.text+0x29b): undefined reference to 
`CRYPTO_set_mem_debug_functions'
openssl.c:(.text+0x2a7): undefined reference to `CRYPTO_mem_ctrl'
openssl.c:(.text+0x2b5): undefined reference to 
`CRYPTO_set_locking_callback'
openssl.c:(.text+0x2eb): undefined reference to `CRYPTO_set_mem_functions'
openssl.c:(.text+0x2f0): undefined reference to `ERR_load_crypto_strings'
openssl.c:(.text+0x2f5): undefined reference to 
`OPENSSL_add_all_algorithms_noconf'
openssl.c:(.text+0x2fa): undefined reference to 
`ENGINE_load_builtin_engines'
////


