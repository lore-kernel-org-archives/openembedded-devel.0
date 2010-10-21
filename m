Received: from smtp3.nedap.com ([87.249.123.12] helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jaap.dejong@nedap.com>) id 1P8vh7-0006wb-26
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Oct 2010 16:00:37 +0200
Received: from nvs0066.nedap.local ([10.91.8.1]) by smtp.nedap.com with
	Microsoft SMTPSVC(6.0.3790.1830); Thu, 21 Oct 2010 15:59:51 +0200
X-TM-IMSS-Message-ID: <16d7993a00007992@nedap.com>
Received: from [10.2.40.10] ([10.2.40.10]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.0) id 16d7993a00007992 for
	<jaap.dejong@nedap.com>; Thu, 21 Oct 2010 15:59:52 +0100
Message-ID: <4CC04756.2020004@nedap.com>
Date: Thu, 21 Oct 2010 15:59:50 +0200
From: Jaap de Jong <jaap.dejong@nedap.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.11) Gecko/20101006 Lightning/1.0b2 Thunderbird/3.1.5
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-OriginalArrivalTime: 21 Oct 2010 13:59:51.0577 (UTC)
	FILETIME=[3B2F3090:01CB7128]
X-SA-Exim-Connect-IP: 87.249.123.12
X-SA-Exim-Mail-From: jaap.dejong@nedap.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: failure building cacaoh-native
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
X-List-Received-Date: Thu, 21 Oct 2010 14:00:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Thought this was fixed some time ago, but it fails nevertheless...

    NOTE: Running task 1854 of 2596 (ID: 2,
    /media/OpenEmbedded/unstable/org.openembedded.dev/recipes/cacao/cacaoh-native_0.99.3.bb,
    do_install)
    Packaged contents of libusb-compat into
    /media/OpenEmbedded/unstable/tmp/deploy/eglibc/ipk/armv5te/libusb-0.1-4_0.1.3-r0.9_armv5te.ipk
    NOTE: Not creating empty archive for libusb-compat-doc-0.1.3-r0.9
    ERROR: function do_install failed
    ERROR: log data follows
    (/media/OpenEmbedded/unstable/tmp/work/i686-linux/cacaoh-native-0.99.3-r2.1/temp/log.do_install.19694)
    | install: cannot stat `src/cacaoh/.libs/cacaoh': No such file or
    directory
    NOTE: Task failed:
    /media/OpenEmbedded/unstable/tmp/work/i686-linux/cacaoh-native-0.99.3-r2.1/temp/log.do_install.19694
    ERROR: TaskFailed event exception, aborting
    ERROR: Build of
    /media/OpenEmbedded/unstable/org.openembedded.dev/recipes/cacao/cacaoh-native_0.99.3.bb
    do_install failed

Fixed with:

    diff -urN a/cacaoh-native.inc b/cacaoh-native.inc
    --- a/cacaoh-native.inc    2010-10-21 15:55:49.604353109 +0200
    +++ b/cacaoh-native.inc    2010-10-21 15:55:26.295644251 +0200
    @@ -24,7 +24,7 @@

      do_install() {
        install -d ${D}${bindir}/cacaoh-${PV}
    -  install -m 0755 src/cacaoh/.libs/cacaoh ${D}${bindir}/cacaoh-${PV}
    +  install -m 0755 src/cacaoh/cacaoh ${D}${bindir}/cacaoh-${PV}
      }

      NATIVE_INSTALL_WORKS = "1"


Not sure if this is the final fix...

