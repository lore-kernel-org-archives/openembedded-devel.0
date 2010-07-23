Received: from smtp3.nedap.com ([87.249.123.12] helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jaap.dejong@nedap.com>) id 1OcDGp-0002bg-7y
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Jul 2010 10:06:21 +0200
Received: from nvs0066.nedap.local ([10.91.8.1]) by smtp.nedap.com with
	Microsoft SMTPSVC(6.0.3790.1830); Fri, 23 Jul 2010 10:06:02 +0200
X-TM-IMSS-Message-ID: <120b489f000066b2@nedap.com>
Received: from [10.2.40.10] ([10.2.40.10]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.0) id 120b489f000066b2 for
	<jaap.dejong@nedap.com>; Fri, 23 Jul 2010 10:05:59 +0100
Message-ID: <4C494D69.5010807@nedap.com>
Date: Fri, 23 Jul 2010 10:06:01 +0200
From: Jaap de Jong <jaap.dejong@nedap.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.10) Gecko/20100527 Lightning/1.0b1 Thunderbird/3.0.5
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-OriginalArrivalTime: 23 Jul 2010 08:06:02.0278 (UTC)
	FILETIME=[E45BBC60:01CB2A3D]
X-SA-Exim-Connect-IP: 87.249.123.12
X-SA-Exim-Mail-From: jaap.dejong@nedap.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,
	HTML_FONT_FACE_BAD,HTML_MESSAGE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: java -cacao issues
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
X-List-Received-Date: Fri, 23 Jul 2010 08:06:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Finally I've been able to build for at91sam9263ek without any errors...

    $ git log | head
    commit ebc2e1d43afa43877c29bc47c87f38792a791bd8
    Author: Martin Jansa <Martin.Jansa@gmail.com>
    Date:   Mon Jul 19 13:14:06 2010 +0200

         linux-openmoko-2.6.32: add missing patch, enable XFS, brtfs, GPT

         Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>


The following results on the target:

    # java -version
    Warning: no leading - on line 43 of
    `/usr/lib/jvm/java-6-openjdk/jre/lib/arm/jvm.cfg'
    Warning: missing VM type on line 43 of
    `/usr/lib/jvm/java-6-openjdk/jre/lib/arm/jvm.cfg'
    Warning: no leading - on line 43 of
    `/usr/lib/jvm/java-6-openjdk/jre/lib/arm/jvm.cfg'
    Warning: missing VM type on line 43 of
    `/usr/lib/jvm/java-6-openjdk/jre/lib/arm/jvm.cfg'
    java version "1.6.0_18"
    OpenJDK Runtime Environment (IcedTea6 1.8) (6b18-1.8)
    OpenJDK Shark VM (build 14.0-b16, mixed mode)

After removing the trailing newline from 
/usr/lib/jvm/java-6-openjdk/jre/lib/arm/jvm.cfg the warnings are gone:


    # java -version
    java version "1.6.0_18"
    OpenJDK Runtime Environment (IcedTea6 1.8) (6b18-1.8)
    OpenJDK Shark VM (build 14.0-b16, mixed mode)

    # java -version -shark
    java version "1.6.0_18"
    OpenJDK Runtime Environment (IcedTea6 1.8) (6b18-1.8)
    OpenJDK Shark VM (build 14.0-b16, mixed mode)

    # java -version -cacao
    LOG: [0x4001ec80] md_signal_handler_sigill: Unknown illegal
    instruction 0xed1c5a06 at 0x441dc790
    LOG: [0x4001ec80] Aborting...
    Aborted


cacao crashes...
Any ideas?

Jaap de Jong



