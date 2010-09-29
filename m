Received: from ppsw-41.csi.cam.ac.uk ([131.111.8.141])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jic23@cam.ac.uk>) id 1P0zIc-0002RO-Jt
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Sep 2010 18:14:31 +0200
X-Cam-AntiVirus: no malware found
X-Cam-SpamDetails: not scanned
X-Cam-ScannerInfo: http://www.cam.ac.uk/cs/email/scanner/
Received: from arcturus.eng.cam.ac.uk ([129.169.154.73]:56607)
	by ppsw-41.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.156]:25)
	with esmtpsa (PLAIN:jic23) (TLSv1:DHE-RSA-CAMELLIA256-SHA:256)
	id 1P0z00-0002wL-Qi (Exim 4.72)
	(return-path <jic23@cam.ac.uk>); Wed, 29 Sep 2010 16:55:16 +0100
Message-ID: <4CA36166.1000003@cam.ac.uk>
Date: Wed, 29 Sep 2010 16:55:18 +0100
From: Jonathan Cameron <jic23@cam.ac.uk>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.9) Gecko/20100909 Lightning/1.0b3pre Thunderbird/3.1.3
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4CA34E00.8080106@cam.ac.uk> <4CA35464.5030007@freyther.de>
In-Reply-To: <4CA35464.5030007@freyther.de>
X-Enigmail-Version: 1.1.2
X-SA-Exim-Connect-IP: 131.111.8.141
X-SA-Exim-Mail-From: jic23@cam.ac.uk
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: missing dependency on expat-native in	gdb-cross-sdk-7.1-r7.0
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
X-List-Received-Date: Wed, 29 Sep 2010 16:14:31 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 09/29/10 15:59, Holger Freyther wrote:
> On 09/29/2010 10:32 PM, Jonathan Cameron wrote:
>> Hi all,
> 
>>
>> I'd suggest adding expat-native to gdb-cross-sdk.inc DEPENDS (which seems to fix the problem) No idea if it is needed
>> for all versions though.
> 
> At least GDB 7.x needs expat to parse the register definitions for the CPU.
> E.g. this is important when using the gdb remote protocol.
> 
> You should also pass --with-expat to it, right now I have a build issue with
> the target gdb and this argument.
> 
Ah, thanks for the heads up. I'll try that and see how I get on.

As an aside there is also an issue with both binutils-cross-sdk and gdb-cross-sdk
wanting to install libiberty.a



