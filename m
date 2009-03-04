Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LeuGi-0000F4-O0
	for openembedded-devel@openembedded.org; Wed, 04 Mar 2009 17:48:28 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LeuCe-0006lJ-8p
	for openembedded-devel@openembedded.org; Wed, 04 Mar 2009 16:44:16 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 04 Mar 2009 16:44:16 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 04 Mar 2009 16:44:16 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 04 Mar 2009 17:44:06 +0100
Message-ID: <gomb4n$qeq$2@ger.gmane.org>
References: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090225 Shredder/3.0b3pre
In-Reply-To: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
Sender: news <news@ger.gmane.org>
Subject: Re: Merging RPM support from Poky
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
X-List-Received-Date: Wed, 04 Mar 2009 16:48:28 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04-03-09 16:52, Marcin Juszkiewicz wrote:
> As some of you know Poky has RPM support written. It consists few parts:
>
> - creating RPM packages
> - creating rootfs from RPM packages
> - using RPM/YUM on device to managing packages (installing from local and
>    remote packages
>
> I had one attempt to get it merged before but it had some bugs so I started
> from scratch. Extracting required patches from pile of 1800 Poky changsets
> took me some time.
>
> With this patchset I managed to build 'minimal-image' for AT91SAM9263-EK
> machine. As distribution I used 'minimal' to get something other then
> Angstrom.
>
> So please review it (patch 67 is already merged in .dev tree).

patch 1 thru 30 look OK to go in. The python recipes aren't up to date 
with the current state of distutils.bbclass, but the effect is harmless.
I'll try to have a look at 31-70 later.

regards,

Koen



