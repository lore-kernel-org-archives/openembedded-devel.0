Received: from asmtpout026.mac.com ([17.148.16.101])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1P5EDe-0005il-CF
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Oct 2010 10:59:33 +0200
MIME-version: 1.0
Received: from [192.168.1.100] ([87.201.169.234])
	by asmtp026.mac.com (Oracle Communications Messaging Exchange Server
	7u4-18.01 64bit (built Jul 15 2010)) with ESMTPSA id
	<0LA400K498RBJZ40@asmtp026.mac.com>
	for openembedded-devel@lists.openembedded.org; Mon,
	11 Oct 2010 00:57:14 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@mac.com>
In-reply-to: <i8ufek$27r$2@dough.gmane.org>
Date: Mon, 11 Oct 2010 11:57:05 +0400
Message-id: <AA9C90F1-F206-461B-8CDB-383678BA363A@mac.com>
References: <F34D057F-F640-4BB6-841B-2B66AFE37A99@mac.com>
	<AANLkTin8xbEBR=mVr3PHN9cjwqtUoM9BxpYkgBE7p_UY@mail.gmail.com>
	<i8ufek$27r$2@dough.gmane.org>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1081)
X-SA-Exim-Connect-IP: 17.148.16.101
X-SA-Exim-Mail-From: elvis.dowson@mac.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Building for multiple machines
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
X-List-Received-Date: Mon, 11 Oct 2010 08:59:49 -0000
Content-transfer-encoding: 7BIT
Content-type: text/plain; CHARSET=US-ASCII


On Oct 11, 2010, at 11:47 AM, Koen Kooi wrote:
>> 
>> I guess trying this would ahve been much faster than waiting for an answer here.
>> 
>> And OE does not have an auto.conf
> 
> OE *does* have an auto.conf, pretty much since the start:

There was a reason why I didn't try it right away. A while back, i had a working overo-oe, and auto.conf was set to MACHINE="overo"

After that, I changed it to MACHINE="beagleboard". 

It created two output folders in tmp/deply for both the targets, but the images didn't work properly, I had some issues. Can't recall exactly what it was. So, I had to delete my tmp folder, and repeat the build process afresh, this time, with only MACHINE='beagleboard".

I was wondering what the recommended process is for building for multiple machine architectures?

Elvis Dowson


