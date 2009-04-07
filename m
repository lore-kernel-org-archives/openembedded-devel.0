Received: from [128.2.201.16] (helo=jackfruit.srv.cs.cmu.edu)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dhuggins@cs.cmu.edu>) id 1LrCTG-0007nm-TF
	for openembedded-devel@openembedded.org; Tue, 07 Apr 2009 16:40:21 +0200
Received: from [128.2.222.132] (LIMA-2.SPEECH.CS.CMU.EDU [128.2.222.132])
	by jackfruit.srv.cs.cmu.edu (8.13.6/8.13.6) with ESMTP id
	n37EbHBW011685 for <openembedded-devel@openembedded.org>;
	Tue, 7 Apr 2009 10:37:17 -0400 (EDT)
Message-ID: <49DB651F.7060408@cs.cmu.edu>
Date: Tue, 07 Apr 2009 10:37:19 -0400
From: David Huggins-Daines <dhuggins@cs.cmu.edu>
User-Agent: Thunderbird 2.0.0.21 (X11/20090318)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <mailman.55349.1238837263.4692.openembedded-devel@lists.openembedded.org>
In-Reply-To: <mailman.55349.1238837263.4692.openembedded-devel@lists.openembedded.org>
X-Scanned-By: mimedefang-cmuscs on 128.2.201.16
X-SA-Exim-Connect-IP: 128.2.201.16
X-SA-Exim-Mail-From: dhuggins@cs.cmu.edu
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	RDNS_NONE autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: /linuxrc link to /bin/busybox causes booting to fail, (sysvinit should be used instead)
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
X-List-Received-Date: Tue, 07 Apr 2009 14:40:22 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

>
> On 03-04-09 22:44, David Huggins-Daines wrote:
>> > Hi,
>> >
>> > When booting base-image or minimal-image from a ramdisk, I get errors
>> > like the following:
>>     
>
> Do you have 
> http://cgit.openembedded.net/cgit.cgi?url=openembedded/commit/&id=5261978d6f9600640c1ea4f1393e18772d4f9657 
> in your OE tree?
>   
I do, I think, but actually I discovered the reason for this.  It's a 
subtlety of the Linux boot process which I didn't previously 
understand.  Basically the kernel will use /linuxrc as init if and only 
if the root filesystem on the command line is different from the root 
partition.  So if you are using a ramdisk root (and not an initrd), you 
need to put root=/dev/ram0 on the kernel command line.



