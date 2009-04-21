Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LwNIS-0006ka-V1
	for openembedded-devel@openembedded.org; Tue, 21 Apr 2009 23:14:29 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1LwNEA-0002Z2-Lw
	for openembedded-devel@openembedded.org; Tue, 21 Apr 2009 21:10:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 21 Apr 2009 21:10:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 21 Apr 2009 21:10:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 21 Apr 2009 23:05:55 +0200
Message-ID: <gslcfj$t2k$1@ger.gmane.org>
References: <1238399997-6016-1-git-send-email-khimov@altell.ru>
	<20090421204132.GL17629@smtp.west.cox.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090415 Shredder/3.0b3pre
In-Reply-To: <20090421204132.GL17629@smtp.west.cox.net>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH] image.bbclass: reorder do_rootfs
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
X-List-Received-Date: Tue, 21 Apr 2009 21:14:29 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21-04-09 22:41, Tom Rini wrote:
> On Mon, Mar 30, 2009 at 11:59:57AM +0400, Roman I Khimov wrote:
>
>> Places do_rootfs function before do_install in image creation process.
>>
>> This change allows multiimage builds, when one image depends on another (before
>> that second image creation raced with do_rootfs for the first one) and uses
>> it for some purpose.
>>
>> Multiimage builds are useful in situations like creating an installer image
>> with initramfs (built in OE) and an image of the target FS (also built in OE)
>> or for building virtualized system images to be placed on target FS.
>
> So, the problem we have happen is that opkg (or dpkg or ...) gets into a
> race because>1 image are trying to muck around in ${TMPDIR}/rootfs,

No, there's a lockfile for that, otherwise 'bitbake foo-image bar-image' 
wouldn't work (it didn't for a long time).

regards,

Koen



