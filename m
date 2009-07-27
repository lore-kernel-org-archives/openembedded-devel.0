Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MVOi8-0007Og-0J
	for openembedded-devel@openembedded.org; Mon, 27 Jul 2009 13:49:44 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1MVOTu-00060w-Oh
	for openembedded-devel@openembedded.org; Mon, 27 Jul 2009 11:35:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 27 Jul 2009 11:35:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 27 Jul 2009 11:35:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 27 Jul 2009 13:34:44 +0200
Message-ID: <h4k3ck$1o1$2@ger.gmane.org>
References: <4A6D5C5A.2010003@gmail.com>
	<aa8983610907270146n6c3f6fe8ucc2f63b3ff32aa@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1.1pre) Gecko/20090712 Shredder/3.0b3pre
In-Reply-To: <aa8983610907270146n6c3f6fe8ucc2f63b3ff32aa@mail.gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: linux recipe selected despite ASSUME_PROVIDED += "virtual/kernel"
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
X-List-Received-Date: Mon, 27 Jul 2009 11:49:44 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27-07-09 10:46, Patrick Bellasi wrote:
> On Mon, Jul 27, 2009 at 09:50, Graham Gower<graham.gower@gmail.com>  wrote:
>> Hi,
>> I wish to build an Angstrom based console-image for mipsel from the
>> org.openembedded.dev branch. I maintain a kernel for the device but am
>> not yet ready to integrate this into an OE recipe. The default
>> linux_2.6.30.bb
>> fails to build for me, thus I wish to not build the kernel at this point
>> in time.
>>
>> My local.conf contains the following lines,
>> STAGING_KERNEL_DIR = "/home/grg/jz/linux"
>> ASSUME_PROVIDED += "virtual/kernel"
>
> I guess that a kernel is required to build an image: in instance to
> compile libc which relay on some kernel headers.

Bzzzt! Wrong! OE builds the libc headers from a different recipe called 
linux-libc-headers.

regards,

Koen



