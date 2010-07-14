Received: from mail.borenet.se ([213.134.106.117] helo=mail-storage.borenet.se)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <xerxes@zafena.se>) id 1OZ5zb-00008N-PD
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Jul 2010 19:43:39 +0200
Received: from [192.168.1.106] (labb.zafena.se [213.134.106.61])
	by mail-storage.borenet.se (Postfix) with ESMTP id 0A15A30E348;
	Wed, 14 Jul 2010 19:35:50 +0200 (CEST)
Message-ID: <4C3DF5BF.9040103@zafena.se>
Date: Wed, 14 Jul 2010 19:37:03 +0200
From: =?ISO-8859-1?Q?Xerxes_R=E5nby?= <xerxes@zafena.se>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.10) Gecko/20100527 Thunderbird/3.0.5
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org, jalimo-info@lists.evolvis.org
X-SA-Exim-Connect-IP: 213.134.106.117
X-SA-Exim-Mail-From: xerxes@zafena.se
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: OpenJDK-6 ARM Shark LLVM JIT testing
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
X-List-Received-Date: Wed, 14 Jul 2010 17:43:39 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi all!

I have committed some ARM Shark CPU features auto-detection code into
oe.dev.
http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=1ea15a2cd73178c3fbab36b544a6601b1d1c32bf
This patch will make OpenJDK use the best ARM CPU features available
when generating code using the Shark JIT.

To test shark build the openjdk-6 package and run your favorite java
application with the -shark switch.
java -shark foo

The Shark JIT uses LLVM for its in memory code generation and the
stability of Shark depends on
how much the LLVM JIT have been tested on various ARM CPUs.

I need your help in order to find and catch the LLVM JIT bugs by testing
running Shark and report if
LLVM asserts during code generation.

If LLVM asserts then you can help generate LLVM testcases by running
shark with this switch:
java -shark
-XX:SharkPrintBitcodeOf=insert::problematic:method::name::here foo
And attach the output in the report.

I have written a small guide on how to get Shark LLVM JIT CodeGen crash
bugs fixed:
http://labb.zafena.se/?p=362

Cheers and have a great day!
Xerxes






