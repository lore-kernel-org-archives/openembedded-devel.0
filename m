Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <edpgc@nyro.co.uk>) id 1O9I4p-0006Pi-V1
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 May 2010 15:22:22 +0200
Received: by fxm11 with SMTP id 11so3064352fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 May 2010 06:18:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.239.167.71 with SMTP id f7mr703410hbe.117.1272979112769; Tue, 
	04 May 2010 06:18:32 -0700 (PDT)
Received: by 10.239.135.9 with HTTP; Tue, 4 May 2010 06:18:32 -0700 (PDT)
Date: Tue, 4 May 2010 14:18:32 +0100
Message-ID: <AANLkTimo0LARF-gAcmjEA9a3tUeJVEMY0Kq136TfBn88@mail.gmail.com>
From: Edward Cooper <edpgc@nyro.co.uk>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: edpgc@nyro.co.uk
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Mono on ARMV5TE - AT91SAM9260
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
X-List-Received-Date: Tue, 04 May 2010 13:22:23 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi all

First post... I have succesfully run through and built Angstrom for my
AT91SAM9260-EK target.  Really pleased with how it works and that I can
build .ipk and install them using opkg from a local build.  However I am
stumped with Mono, I went through the bitbake process "bitbake mono" and got
the appropriate .ipk's, these appear to install fine on the target.  However
running even an hello world example (mono hello.exe) results in an immediate
"Segmentation Fault" error message and no other output.

From my reasearch I believe this might by due to OABI vs EABI and how the
kernel was compiled does that make sense or am I looking in the wrong place!

Also how do I make bitbake build a different version of something (the
recipe's are there)?

Thanks for any help, new to embedded linux so sorry for any stupid
questions.

Regards
Ed Cooper

