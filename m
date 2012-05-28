Received: from mail-gh0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chris@diamand.org>) id 1SZ5w7-0000Zk-H2
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 May 2012 21:49:03 +0200
Received: by ghbz2 with SMTP id z2so1402663ghb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 May 2012 12:38:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type
	:x-gm-message-state;
	bh=Ks5yg59+hnuYcP7qszBWiwDCcJU0vz6JREdW27qbhhw=;
	b=CDPJ6cB4U8//WJZls+1xP2zanMIPCjIuTUB1GBjxDg2XVRXStH/wAmy2PLA0XqYtBH
	SqWbTCV2Npc2gDeQjs9FyUpuT0EDvvbVHrthyvUQxWly5Allk1xpXw1ZWaxfn1ujHFbh
	qDXtyjYBY6EbvXRbEWid1atogN3qukFj2oGL3oUH7DkvN3S401I3OnXh6AZQJLDBgm4j
	A0bc4yBELmwFyyHpEUbbFYaP3PzGR3a3ss8RtV/rsQ2o60NQy7AOjv0uRWAeOupV/N2Z
	u8nmnrA1mqdR+QyG5XfrrjcOFHmn8jbuzpvJTk6Aof/haoBI5/ymA11uEDAKUWgWReyN
	tsPg==
MIME-Version: 1.0
Received: by 10.50.212.70 with SMTP id ni6mr5156992igc.30.1338233926645; Mon,
	28 May 2012 12:38:46 -0700 (PDT)
Received: by 10.64.17.69 with HTTP; Mon, 28 May 2012 12:38:46 -0700 (PDT)
Date: Mon, 28 May 2012 20:38:46 +0100
Message-ID: <CAG2TeNrp6cR1UmrPU0+UKHerR113q2_O_56HHZoBOfnGRrccTw@mail.gmail.com>
From: Chris Diamand <chris@diamand.org>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQmvZPpO3khFResIoaFblwRWmRmLYp/FfgKgkpbwwPCdbRxuudwnbyGP6IZtrw43RC3bgz/F
Subject: Compile error in openssl 1.0.0e
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
X-List-Received-Date: Mon, 28 May 2012 19:49:03 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

OpenSSL 1.0.0e fails to build. The errors are:

arm-oe-linux-gnueabi-gcc -march=armv4 -mtune=strongarm
-mthumb-interwork -mno-thumb
--sysroot=/home/chris/src/oe/build/tmp/sysroots/armv4-oe-linux-gnueabi
-I.. -I../.. -I../asn1 -I../evp -I../../include  -fPIC -DOPENSSL_PIC -
DOPENSSL_THREADS -D_REENTRANT -DDSO_DLFCN -DHAVE_DLFCN_H -DL_ENDIAN
 -DTERMIO -fexpensive-optimizations -fomit-frame-pointer
-frename-registers -Os -g -Wall -DHAVE_CRYPTODEV
-DUSE_CRYPTODEV_DIGESTS   -c -o bss_acpt.o bss_a
cpt.c
arm-oe-linux-gnueabi-gcc -march=armv4 -mtune=strongarm
-mthumb-interwork -mno-thumb
--sysroot=/home/chris/src/oe/build/tmp/sysroots/armv4-oe-linux-gnueabi
-I.. -I../.. -I../asn1 -I../evp -I../../include  -fPIC -DOPENSSL_PIC -
DOPENSSL_THREADS -D_REENTRANT -DDSO_DLFCN -DHAVE_DLFCN_H -DL_ENDIAN
 -DTERMIO -fexpensive-optimizations -fomit-frame-pointer
-frename-registers -Os -g -Wall -DHAVE_CRYPTODEV
-DUSE_CRYPTODEV_DIGESTS   -c -o bf_nbio.o bf_nbi
o.c
arm-oe-linux-gnueabi-gcc -march=armv4 -mtune=strongarm
-mthumb-interwork -mno-thumb
--sysroot=/home/chris/src/oe/build/tmp/sysroots/armv4-oe-linux-gnueabi
-I.. -I../.. -I../asn1 -I../evp -I../../include  -fPIC -DOPENSSL_PIC -
DOPENSSL_THREADS -D_REENTRANT -DDSO_DLFCN -DHAVE_DLFCN_H -DL_ENDIAN
 -DTERMIO -fexpensive-optimizations -fomit-frame-pointer
-frename-registers -Os -g -Wall -DHAVE_CRYPTODEV
-DUSE_CRYPTODEV_DIGESTS   -c -o bss_log.o bss_lo
g.c
arm-oe-linux-gnueabi-gcc -march=armv4 -mtune=strongarm
-mthumb-interwork -mno-thumb
--sysroot=/home/chris/src/oe/build/tmp/sysroots/armv4-oe-linux-gnueabi
-I.. -I../.. -I../asn1 -I../evp -I../../include  -fPIC -DOPENSSL_PIC -
DOPENSSL_THREADS -D_REENTRANT -DDSO_DLFCN -DHAVE_DLFCN_H -DL_ENDIAN
 -DTERMIO -fexpensive-optimizations -fomit-frame-pointer
-frename-registers -Os -g -Wall -DHAVE_CRYPTODEV
-DUSE_CRYPTODEV_DIGESTS   -c -o bss_bio.o bss_bi
o.c
arm-oe-linux-gnueabi-gcc -march=armv4 -mtune=strongarm
-mthumb-interwork -mno-thumb
--sysroot=/home/chris/src/oe/build/tmp/sysroots/armv4-oe-linux-gnueabi
-I.. -I../.. -I../asn1 -I../evp -I../../include  -fPIC -DOPENSSL_PIC -
DOPENSSL_THREADS -D_REENTRANT -DDSO_DLFCN -DHAVE_DLFCN_H -DL_ENDIAN
 -DTERMIO -fexpensive-optimizations -fomit-frame-pointer
-frename-registers -Os -g -Wall -DHAVE_CRYPTODEV
-DUSE_CRYPTODEV_DIGESTS   -c -o bss_dgram.o bss_
dgram.c
bss_dgram.c: In function 'dgram_write':
bss_dgram.c:345:2: error: case label not within a switch statement
bss_dgram.c:346:2: error: case label not within a switch statement
bss_dgram.c:348:3: error: break statement not within loop or switch
bss_dgram.c:349:2: error: case label not within a switch statement
bss_dgram.c:351:20: error: 'ptr' undeclared (first use in this function)
bss_dgram.c:351:20: note: each undeclared identifier is reported only
once for each function it appears in
bss_dgram.c:352:20: error: 'num' undeclared (first use in this function)
bss_dgram.c:354:3: error: break statement not within loop or switch
bss_dgram.c:355:2: error: case label not within a switch statement
bss_dgram.c:358:4: error: 'ip' undeclared (first use in this function)
bss_dgram.c:364:3: error: break statement not within loop or switch
bss_dgram.c:365:2: error: case label not within a switch statement
bss_dgram.c:367:3: error: break statement not within loop or switch
bss_dgram.c:368:2: error: case label not within a switch statement
bss_dgram.c:370:3: error: break statement not within loop or switch
bss_dgram.c:371:2: error: case label not within a switch statement
bss_dgram.c:372:2: error: case label not within a switch statement
bss_dgram.c:374:3: error: break statement not within loop or switch
bss_dgram.c:375:2: error: case label not within a switch statement
bss_dgram.c:376:2: error: case label not within a switch statement
bss_dgram.c:378:3: error: break statement not within loop or switch
bss_dgram.c:379:2: error: case label not within a switch statement
bss_dgram.c:380:3: error: 'to' undeclared (first use in this function)
bss_dgram.c:401:3: error: break statement not within loop or switch
bss_dgram.c:403:2: error: case label not within a switch statement
bss_dgram.c:405:3: error: 'addr_len' undeclared (first use in this function)
bss_dgram.c:405:32: error: 'addr' undeclared (first use in this function)
bss_dgram.c:410:4: error: break statement not within loop or switch
bss_dgram.c:412:3: error: 'sockopt_len' undeclared (first use in this function)
bss_dgram.c:412:24: error: 'sockopt_val' undeclared (first use in this function)
bss_dgram.c:431:2: error: case label not within a switch statement
bss_dgram.c:438:4: error: break statement not within loop or switch
bss_dgram.c:467:3: error: break statement not within loop or switch
bss_dgram.c:468:2: error: case label not within a switch statement
bss_dgram.c:470:3: error: break statement not within loop or switch
bss_dgram.c:471:2: error: case label not within a switch statement
bss_dgram.c:474:3: error: break statement not within loop or switch
bss_dgram.c:475:2: error: case label not within a switch statement
bss_dgram.c:498:3: error: break statement not within loop or switch
bss_dgram.c:499:2: error: case label not within a switch statement
bss_dgram.c:514:3: error: break statement not within loop or switch
bss_dgram.c:515:2: error: case label not within a switch statement
bss_dgram.c:528:3: error: break statement not within loop or switch
bss_dgram.c:529:2: error: case label not within a switch statement
bss_dgram.c:531:3: error: break statement not within loop or switch
bss_dgram.c:533:2: error: case label not within a switch statement
bss_dgram.c:547:3: error: break statement not within loop or switch
bss_dgram.c:548:2: error: case label not within a switch statement
bss_dgram.c:568:3: error: break statement not within loop or switch
bss_dgram.c:571:2: error: case label not within a switch statement
bss_dgram.c:585:3: error: break statement not within loop or switch
bss_dgram.c:586:2: error: case label not within a switch statement
bss_dgram.c:606:3: error: break statement not within loop or switch
bss_dgram.c:608:2: error: case label not within a switch statement
bss_dgram.c:610:2: error: case label not within a switch statement
bss_dgram.c:622:3: error: break statement not within loop or switch
bss_dgram.c:624:2: error: case label not within a switch statement
bss_dgram.c:632:3: error: break statement not within loop or switch
bss_dgram.c:634:2: error: 'default' label not within a switch statement
bss_dgram.c:636:3: error: break statement not within loop or switch
bss_dgram.c: At top level:
bss_dgram.c:67:0: error: unterminated #ifndef
bss_dgram.c:86:13: warning: 'dgram_ctrl' used but never defined
make[2]: *** [bss_dgram.o] Error 1
make[2]: Leaving directory
`/home/chris/src/oe/build/tmp/work/armv4-oe-linux-gnueabi/openssl-1.0.0e-r15.0/openssl-1.0.0e/crypto/bio'
make[1]: *** [subdirs] Error 1
make[1]: Leaving directory
`/home/chris/src/oe/build/tmp/work/armv4-oe-linux-gnueabi/openssl-1.0.0e-r15.0/openssl-1.0.0e/crypto'
make: *** [build_crypto] Error 1
+ die 'oe_runmake failed'
+ oefatal 'oe_runmake failed'
+ echo FATAL: 'oe_runmake failed'
FATAL: oe_runmake failed
+ exit 1


Looking from about line 330 of crypto/bio/bss_dgram.c:


static int dgram_write(BIO *b, const char *in, int inl)
   {
   int ret;
   bio_dgram_data *data = (bio_dgram_data *)b->ptr;
   clear_socket_error();

   if ( data->connected )
       ret=writesocket(b->num,in,inl);
   else
       {
       int peerlen = sizeof(data->peer);

       if (data->peer.sa.sa_family == AF_INET)
           peerlen = sizeof(data->peer.sa_in);
#if OPENSSL_USE_IPV6                               /**** HERE ****/
   case BIO_C_FILE_TELL:
   case BIO_CTRL_INFO:
       ret=0;
       break;
   case BIO_C_SET_FD:
       dgram_clear(b);
       b->num= *((int *)ptr);
       b->shutdown=(int)num;
       b->init=1;
       break;
   case BIO_C_GET_FD:
       if (b->init)
           {
           ip=(int *)ptr;
           if (ip != NULL) *ip=b->num;
           ret=b->num;
           }
       else
           ret= -1;
       break;
   case BIO_CTRL_GET_CLOSE:
       ret=b->shutdown;
       break;
   case BIO_CTRL_SET_CLOSE:
       b->shutdown=(int)num;
       break;
   case BIO_CTRL_PENDING:
...

If OPENSSL_USE_IPV6 is defined it puts a random case label (sans
switch() ) in the middle of the function. This is clearly not going to
work.

This has been fixed in the latest version, 1.0.1c, which compiles
without errors.

Could the openssl recipe be updated to the latest version which actually builds?

Cheers,
Chris.


