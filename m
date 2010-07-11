Received: from mailrelay04.sunrise.ch ([194.158.229.47]
	helo=smtp-be-02.be08.sunrise.ch)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dv@vollmann.ch>) id 1OY6Tf-0000G1-Tg
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Jul 2010 02:02:32 +0200
Received: from [192.168.26.14] (212-98-43-140.static.adslpremium.ch
	[212.98.43.140])
	by smtp-be-02.be08.sunrise.ch (8.13.1/8.12.10) with ESMTP id
	o6BNvVUZ028100; Mon, 12 Jul 2010 01:57:31 +0200
Message-ID: <4C3A5AA4.7090500@vollmann.ch>
Date: Mon, 12 Jul 2010 01:58:28 +0200
From: Detlef Vollmann <dv@vollmann.ch>
User-Agent: Thunderbird 2.0.0.24 (X11/20100317)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 194.158.229.47
X-SA-Exim-Mail-From: dv@vollmann.ch
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: kernel_do_compile uses wrong kernel version
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
X-List-Received-Date: Mon, 12 Jul 2010 00:02:32 -0000
Content-Type: multipart/mixed; boundary="------------060102050104010909040808"

--------------060102050104010909040808
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

kernel_do_compile in kernel.bbclass uses KERNEL_MAJOR_VERSION,
which is computed based on files that don't exist at that
point in time.
It's not a real problem, as a 'make dep' is still defined
and just gives a warning, but I attached a patch nevertheless.

BTW, I'm not sure how useful get_kernelversion() really is,
as for the DEPENDS the "2.6" or "2.4" needs to be computed
based on PV anyway.

   Detlef

--------------060102050104010909040808
Content-Type: text/x-diff;
 name="kernel.bbclass.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="kernel.bbclass.patch"

--- a/classes/kernel.bbclass	2010-06-14 00:02:08.000000000 +0200
+++ b/classes/kernel.bbclass	2010-07-12 01:49:03.000000000 +0200
@@ -85,7 +85,7 @@
 kernel_do_compile() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
 	oe_runmake include/linux/version.h CC="${KERNEL_CC}" LD="${KERNEL_LD}"
-	if [ "${KERNEL_MAJOR_VERSION}" != "2.6" ]; then
+	if [ "${@get_kernelmajorversion('${PV}')}" != "2.6" ]; then
 		oe_runmake dep CC="${KERNEL_CC}" LD="${KERNEL_LD}"
 	fi
 	oe_runmake ${KERNEL_IMAGETYPE} CC="${KERNEL_CC}" LD="${KERNEL_LD}"

--------------060102050104010909040808--
