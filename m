Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1PNGrl-0006Ey-2s
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Nov 2010 04:26:53 +0100
Received: by pvd12 with SMTP id 12so846321pvd.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Nov 2010 19:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=gmfyPj9kEKnhQ0E8oakPyuHaHJ/HEZMiuZDEve9OIw8=;
	b=YFWBgVUT0Ar5PXuBTr0zks8RqLu13qdDqKrk5g8viVyjcpHQxB8BbKA9RLKFBj9unB
	8Co1o/Z4KO8WdH4o3K43px7N01GQIm6XLbhjKv+8yI9BRM8DJrrUG+SMLyaLUHVh9HUy
	ifeh2xcWMefPspBTN5KXIIYY7PXfCNjMt9ZJw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=iZq+GMWxYasHXcBelyy8FaESVqU0OUttvtY1ZIMizV6PmgvgwybhCCSPSS32pS7jNs
	GSvev5wrNVS3Mz2Cqm4LA6Gqu7fZMLtAXQ65iOwrSyJJdOigJ3T/oI2fVExmLpWv9DGR
	72nVOAUS/g2i0H1xUn4DzV1wuOG21H61wSw6g=
Received: by 10.142.213.16 with SMTP id l16mr6411039wfg.333.1291087531251;
	Mon, 29 Nov 2010 19:25:31 -0800 (PST)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id
	b11sm8342871wff.21.2010.11.29.19.25.26
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 29 Nov 2010 19:25:30 -0800 (PST)
Message-ID: <4CF46E9C.8090005@gmail.com>
Date: Tue, 30 Nov 2010 13:55:16 +1030
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.15) Gecko/20101113 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] openssl.inc: Fix build when DISTRO_FEATURES lacks largefile and/or ipv6.
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
X-List-Received-Date: Tue, 30 Nov 2010 03:26:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

mipsel-oe-linux-uclibc-gcc -march=mips32 -I.. -I../.. -I../../include -fPIC -DOPENSSL_PIC -DOPENSSL_THREADS -D_REENTRANT -DDSO_DLFCN -DHAVE_DLFCN_H -DL_ENDIAN 	-DTERMIO -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -Wall -isystem/mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/include  -c -o bss_file.o bss_file.c
In file included from /mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/include/stdio.h:28:0,
                 from bss_file.c:86:
/mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/include/features.h:216:5: error: #error It appears you have defined _FILE_OFFSET_BITS=64. Unfortunately, uClibc was built without large file support enabled.
In file included from /mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/include/stdio.h:72:0,
                 from bss_file.c:86:
/mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/include/bits/uClibc_stdio.h:61:2: error: #error Sorry... uClibc was built without large file support!
In file included from bss_file.c:86:0:
/mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/include/stdio.h:83:26: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'fpos_t'
In file included from bss_file.c:86:0:
/mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/include/stdio.h:719:12: error: expected declaration specifiers or '...' before 'fpos_t'
/mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/include/stdio.h:721:12: error: expected ';', ',' or ')' before '*' token
make[2]: *** [bss_file.o] Error 1


mipsel-oe-linux-uclibc-gcc -march=mips32 -I.. -I../.. -I../../include -fPIC -DOPENSSL_PIC -DOPENSSL_THREADS -D_REENTRANT -DDSO_DLFCN -DHAVE_DLFCN_H -DL_ENDIAN 	-DTERMIO -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -Wall -isystem/mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/include  -c -o bss_dgram.o bss_dgram.c
bss_dgram.c: In function 'dgram_ctrl':
bss_dgram.c:433:18: error: 'IPV6_PMTUDISC_DO' undeclared (first use in this function)
bss_dgram.c:433:18: note: each undeclared identifier is reported only once for each function it appears in
bss_dgram.c:434:48: error: 'IPV6_MTU_DISCOVER' undeclared (first use in this function)
bss_dgram.c:474:48: error: 'IPV6_MTU' undeclared (first use in this function)
make[2]: *** [bss_dgram.o] Error 1


Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/openssl/openssl.inc |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/recipes/openssl/openssl.inc b/recipes/openssl/openssl.inc
index 885d933..3091b4e 100644
--- a/recipes/openssl/openssl.inc
+++ b/recipes/openssl/openssl.inc
@@ -98,6 +98,9 @@ do_configure () {
                 useprefix=/
         fi        
 	perl ./Configure shared --prefix=$useprefix --openssldir=${libdir}/ssl $target
+
+	eval "${@base_contains('DISTRO_FEATURES', 'largefile', '', 'sed -i -e "/_FILE_OFFSET_BITS/,/#endif/d" ${S}/crypto/bio/bss_file.c', d)}"
+	eval "${@base_contains('DISTRO_FEATURES', 'ipv6', '', 'sed -i -e "/AF_INET6/,/break/d" ${S}/crypto/bio/bss_dgram.c', d)}"
 }
 
 do_compile () {
-- 
1.7.1



