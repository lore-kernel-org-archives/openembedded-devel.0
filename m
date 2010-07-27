Received: from smtp3.nedap.com ([87.249.123.12] helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jaap.dejong@nedap.com>) id 1OdeUw-0002Go-JH
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Jul 2010 09:22:47 +0200
Received: from nvs0066.nedap.local ([10.91.8.1]) by smtp.nedap.com with
	Microsoft SMTPSVC(6.0.3790.1830); Tue, 27 Jul 2010 09:22:19 +0200
X-TM-IMSS-Message-ID: <267cc13c0000c077@nedap.com>
Received: from [10.2.40.10] ([10.2.40.10]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.0) id 267cc13c0000c077 for
	<jaap.dejong@nedap.com>; Tue, 27 Jul 2010 09:22:21 +0100
Message-ID: <4C4E892A.2000104@nedap.com>
Date: Tue, 27 Jul 2010 09:22:18 +0200
From: Jaap de Jong <jaap.dejong@nedap.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.11) Gecko/20100713 Lightning/1.0b1 Thunderbird/3.0.6
MIME-Version: 1.0
To: =?ISO-8859-1?Q?Xerxes_R=E5nby?= <xerxes@zafena.se>
References: <4C494D69.5010807@nedap.com> <4C49A9AB.5030001@zafena.se>
In-Reply-To: <4C49A9AB.5030001@zafena.se>
X-OriginalArrivalTime: 27 Jul 2010 07:22:19.0667 (UTC)
	FILETIME=[72D00E30:01CB2D5C]
X-SA-Exim-Connect-IP: 87.249.123.12
X-SA-Exim-Mail-From: jaap.dejong@nedap.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Tue, 27 Jul 2010 07:22:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Thanks!
Now it works!!
Jaap de Jong

    # java -version
    java version "1.6.0_18"
    OpenJDK Runtime Environment (IcedTea6 1.8) (6b18-1.8)
    OpenJDK Shark VM (build 14.0-b16, mixed mode)

    # java -version -zero
    java version "1.6.0_18"
    OpenJDK Runtime Environment (IcedTea6 1.8) (6b18-1.8)
    OpenJDK Zero VM (build 14.0-b16, mixed mode)

    # java -version -shark
    java version "1.6.0_18"
    OpenJDK Runtime Environment (IcedTea6 1.8) (6b18-1.8)
    OpenJDK Shark VM (build 14.0-b16, mixed mode)

    # java -version -cacao
    java version "1.6.0_18"
    IcedTea Runtime Environment (IcedTea6 1.8) (6b18-1.8)
    CACAO (build 0.99.4, compiled mode)



On 07/23/2010 04:39 PM, Xerxes Rånby wrote:
>
> On 2010-07-23 10:06, Jaap de Jong wrote:
>    
>> Hi,
>>
>> Finally I've been able to build for at91sam9263ek without any errors...
>>
>>     $ git log | head
>>     commit ebc2e1d43afa43877c29bc47c87f38792a791bd8
>>     Author: Martin Jansa<Martin.Jansa@gmail.com>
>>     Date:   Mon Jul 19 13:14:06 2010 +0200
>>
>>          linux-openmoko-2.6.32: add missing patch, enable XFS, brtfs, GPT
>>
>>          Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
>>
>>
>> The following results on the target:
>>
>>     # java -version
>>     Warning: no leading - on line 43 of
>>     `/usr/lib/jvm/java-6-openjdk/jre/lib/arm/jvm.cfg'
>>     Warning: missing VM type on line 43 of
>>     `/usr/lib/jvm/java-6-openjdk/jre/lib/arm/jvm.cfg'
>>     Warning: no leading - on line 43 of
>>     `/usr/lib/jvm/java-6-openjdk/jre/lib/arm/jvm.cfg'
>>     Warning: missing VM type on line 43 of
>>     `/usr/lib/jvm/java-6-openjdk/jre/lib/arm/jvm.cfg'
>>     java version "1.6.0_18"
>>     OpenJDK Runtime Environment (IcedTea6 1.8) (6b18-1.8)
>>     OpenJDK Shark VM (build 14.0-b16, mixed mode)
>>
>> After removing the trailing newline from
>> /usr/lib/jvm/java-6-openjdk/jre/lib/arm/jvm.cfg the warnings are gone:
>>
>>
>>     # java -version
>>     java version "1.6.0_18"
>>     OpenJDK Runtime Environment (IcedTea6 1.8) (6b18-1.8)
>>     OpenJDK Shark VM (build 14.0-b16, mixed mode)
>>
>>     # java -version -shark
>>     java version "1.6.0_18"
>>     OpenJDK Runtime Environment (IcedTea6 1.8) (6b18-1.8)
>>     OpenJDK Shark VM (build 14.0-b16, mixed mode)
>>
>>     # java -version -cacao
>>     LOG: [0x4001ec80] md_signal_handler_sigill: Unknown illegal
>>     instruction 0xed1c5a06 at 0x441dc790
>>     LOG: [0x4001ec80] Aborting...
>>     Aborted
>>
>>
>> cacao crashes...
>> Any ideas?
>>      
> Hi
>
> Robert Schuster came up with the great idea that we have missed to
> enable softfloat when building cacao + openjdk and it are quite likely
> that we are building cacao with enabled VFP intructions that your armv5
> hardware do not have.
>
> It would be great if you could try to apply this patch on your oe.dev
> tree and see if it fixes your problem.
>
> Thanks,
> Xerxes
>
> ======= snip
>
> Index: org.openembedded.dev/recipes/openjdk/openjdk-6-common.inc
> ===================================================================
> --- org.openembedded.dev.orig/recipes/openjdk/openjdk-6-common.inc	2010-07-23 15:36:52.000000000 +0200
> +++ org.openembedded.dev/recipes/openjdk/openjdk-6-common.inc	2010-07-23 15:38:25.000000000 +0200
> @@ -10,7 +10,7 @@
>   S = "${WORKDIR}/${ICEDTEA}"
>   B = "${S}/build"
>
> -INC_PR = "r8"
> +INC_PR = "r9"
>
>   SRC_URI = "\
>     ${ICEDTEA_URI} \
> @@ -72,7 +72,9 @@
>   export ALT_CUPS_HEADERS_PATH = "${STAGING_INCDIR}"
>   export ALT_FREETYPE_HEADERS_PATH = "${STAGING_INCDIR}/freetype2"
>   export ALT_FREETYPE_LIB_PATH = "${STAGING_LIBDIR}"
> -export CACAO_CONFIGURE_ARGS = "--with-cacaoh=${STAGING_BINDIR_NATIVE}/cacaoh-openjdk-0.99.4"
> +export CACAO_CONFIGURE_ARGS = "\
> +	${@['','--enable-softfloat'][bb.data.getVar('TARGET_FPU',d,1) == 'soft']} \
> +	--with-cacaoh=${STAGING_BINDIR_NATIVE}/cacaoh-openjdk-0.99.4"
>
>   JAVA_HOME[unexport] = "1"
>
>
>
> === snap
>
>    

