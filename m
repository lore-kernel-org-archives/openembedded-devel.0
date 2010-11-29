Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1PMv88-0006Gj-Q4
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Nov 2010 05:14:23 +0100
Received: by pxi17 with SMTP id 17so665129pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Nov 2010 20:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=xvCFTteIBGCN5NsmkcPz3UDHssJ18g3mqZIYvpPNzvg=;
	b=EkYq3zfFxREQAU9zZkSXuaCrS4myG4NUYnNm4MQQ/tJqn+OBhp7ipBn+48HoJyS5fl
	iXtm3DLoHahfqTuveioqxK+/cF1NCgoFf4F7g/7Dpagbt5qKw2OCuhrXCzpYmJ/z2qvx
	wgE6ZVbU36mmhAzW0BGbzV/FNqrsGX2SV16fs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=qxYGGbRqqjTCOkyvlxZvD+eBC/JR/jBmE1IchZcenoFWHvV2e9dCjQkT2Ox4iAoR7U
	Z0K8cQAwgQurZ6hYoSUQSmmh2a6JFnKDTbGip5Bh05sKIJ3SfAgDNJk5CToBf4iFuOjy
	ZOWp2NmdZCEIj/B6huXZ3jRDy4n5Tpjc2b1pY=
Received: by 10.142.180.15 with SMTP id c15mr4777013wff.178.1291003980623;
	Sun, 28 Nov 2010 20:13:00 -0800 (PST)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id
	y42sm6908740wfd.10.2010.11.28.20.12.58
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 28 Nov 2010 20:12:59 -0800 (PST)
Message-ID: <4CF32846.5040106@gmail.com>
Date: Mon, 29 Nov 2010 14:42:54 +1030
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.15) Gecko/20101113 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] libxml2: Fix build when DISTRO_FEATURES lacks "largefile".
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
X-List-Received-Date: Mon, 29 Nov 2010 04:14:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


mipsel-oe-linux-uclibc-libtool: compile:  mipsel-oe-linux-uclibc-gcc -march=mips32 -DHAVE_CONFIG_H -I. -I./include -I./include -D_REENTRANT -isystem/mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/include -isystem/mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -pedantic -W -Wformat -Wunused -Wimplicit -Wreturn-type -Wswitch -Wcomment -Wtrigraphs -Wformat -Wchar-subscripts -Wuninitialized -Wparentheses -Wshadow -Wpointer-arith -Wcast-align -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-prototypes -Wnested-externs -Winline -Wredundant-decls -MT xmlIO.lo -MD -MP -MF .deps/xmlIO.Tpo -c xmlIO.c  -fPIC -DPIC -o .libs/xmlIO.o
In file included from /mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/include/stdio.h:72:0,
                 from libxml.h:44,
                 from encoding.c:24:
/mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/include/bits/uClibc_stdio.h:61:2: error: #error Sorry... uClibc was built without large file support!

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/libxml/libxml2.inc |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/recipes/libxml/libxml2.inc b/recipes/libxml/libxml2.inc
index c7651a7..c3265c9 100644
--- a/recipes/libxml/libxml2.inc
+++ b/recipes/libxml/libxml2.inc
@@ -7,6 +7,9 @@ DEPENDS_virtclass-native = "python-native"
 SRC_URI = "ftp://xmlsoft.org/libxml2/libxml2-${PV}.tar.gz;name=archive"
 S = "${WORKDIR}/${BPN}-${PV}"
 
+nolargefile = "${@base_contains('DISTRO_FEATURES', 'largefile', '', '-DNO_LARGEFILE_SOURCE', d)}"
+EXTRA_OEMAKE_append_libc-uclibc = "'CFLAGS=${CFLAGS} ${nolargefile}'"
+
 INC_PR = "r9"
 
 BBCLASSEXTEND = "native"
-- 
1.7.1



