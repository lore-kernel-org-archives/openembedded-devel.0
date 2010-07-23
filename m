Received: from mail.borenet.se ([213.134.106.117] helo=mail-storage.borenet.se)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <xerxes@zafena.se>) id 1OcJO7-0004t8-Ld
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Jul 2010 16:38:14 +0200
Received: from [192.168.1.106] (labb.zafena.se [213.134.106.61])
	by mail-storage.borenet.se (Postfix) with ESMTP id 1316030DC4E;
	Fri, 23 Jul 2010 16:37:44 +0200 (CEST)
Message-ID: <4C49A9AB.5030001@zafena.se>
Date: Fri, 23 Jul 2010 16:39:39 +0200
From: =?ISO-8859-1?Q?Xerxes_R=E5nby?= <xerxes@zafena.se>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.10) Gecko/20100527 Thunderbird/3.0.5
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C494D69.5010807@nedap.com>
In-Reply-To: <4C494D69.5010807@nedap.com>
X-SA-Exim-Connect-IP: 213.134.106.117
X-SA-Exim-Mail-From: xerxes@zafena.se
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: java -cacao issues
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
X-List-Received-Date: Fri, 23 Jul 2010 14:38:15 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 2010-07-23 10:06, Jaap de Jong wrote:
> Hi,
>
> Finally I've been able to build for at91sam9263ek without any errors...
>
>    $ git log | head
>    commit ebc2e1d43afa43877c29bc47c87f38792a791bd8
>    Author: Martin Jansa <Martin.Jansa@gmail.com>
>    Date:   Mon Jul 19 13:14:06 2010 +0200
>
>         linux-openmoko-2.6.32: add missing patch, enable XFS, brtfs, GPT
>
>         Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>
>
> The following results on the target:
>
>    # java -version
>    Warning: no leading - on line 43 of
>    `/usr/lib/jvm/java-6-openjdk/jre/lib/arm/jvm.cfg'
>    Warning: missing VM type on line 43 of
>    `/usr/lib/jvm/java-6-openjdk/jre/lib/arm/jvm.cfg'
>    Warning: no leading - on line 43 of
>    `/usr/lib/jvm/java-6-openjdk/jre/lib/arm/jvm.cfg'
>    Warning: missing VM type on line 43 of
>    `/usr/lib/jvm/java-6-openjdk/jre/lib/arm/jvm.cfg'
>    java version "1.6.0_18"
>    OpenJDK Runtime Environment (IcedTea6 1.8) (6b18-1.8)
>    OpenJDK Shark VM (build 14.0-b16, mixed mode)
>
> After removing the trailing newline from
> /usr/lib/jvm/java-6-openjdk/jre/lib/arm/jvm.cfg the warnings are gone:
>
>
>    # java -version
>    java version "1.6.0_18"
>    OpenJDK Runtime Environment (IcedTea6 1.8) (6b18-1.8)
>    OpenJDK Shark VM (build 14.0-b16, mixed mode)
>
>    # java -version -shark
>    java version "1.6.0_18"
>    OpenJDK Runtime Environment (IcedTea6 1.8) (6b18-1.8)
>    OpenJDK Shark VM (build 14.0-b16, mixed mode)
>
>    # java -version -cacao
>    LOG: [0x4001ec80] md_signal_handler_sigill: Unknown illegal
>    instruction 0xed1c5a06 at 0x441dc790
>    LOG: [0x4001ec80] Aborting...
>    Aborted
>
>
> cacao crashes...
> Any ideas?
Hi

Robert Schuster came up with the great idea that we have missed to
enable softfloat when building cacao + openjdk and it are quite likely
that we are building cacao with enabled VFP intructions that your armv5
hardware do not have.

It would be great if you could try to apply this patch on your oe.dev
tree and see if it fixes your problem.

Thanks,
Xerxes

======= snip

Index: org.openembedded.dev/recipes/openjdk/openjdk-6-common.inc
===================================================================
--- org.openembedded.dev.orig/recipes/openjdk/openjdk-6-common.inc	2010-07-23 15:36:52.000000000 +0200
+++ org.openembedded.dev/recipes/openjdk/openjdk-6-common.inc	2010-07-23 15:38:25.000000000 +0200
@@ -10,7 +10,7 @@
 S = "${WORKDIR}/${ICEDTEA}"
 B = "${S}/build"
 
-INC_PR = "r8"
+INC_PR = "r9"
 
 SRC_URI = "\
   ${ICEDTEA_URI} \
@@ -72,7 +72,9 @@
 export ALT_CUPS_HEADERS_PATH = "${STAGING_INCDIR}"
 export ALT_FREETYPE_HEADERS_PATH = "${STAGING_INCDIR}/freetype2"
 export ALT_FREETYPE_LIB_PATH = "${STAGING_LIBDIR}"
-export CACAO_CONFIGURE_ARGS = "--with-cacaoh=${STAGING_BINDIR_NATIVE}/cacaoh-openjdk-0.99.4"
+export CACAO_CONFIGURE_ARGS = "\
+	${@['','--enable-softfloat'][bb.data.getVar('TARGET_FPU',d,1) == 'soft']} \
+	--with-cacaoh=${STAGING_BINDIR_NATIVE}/cacaoh-openjdk-0.99.4"
 
 JAVA_HOME[unexport] = "1"



=== snap



