Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KBEyb-00062I-M9
	for openembedded-devel@openembedded.org; Tue, 24 Jun 2008 22:18:53 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KBEwg-0000aj-TU
	for openembedded-devel@openembedded.org; Tue, 24 Jun 2008 20:16:54 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 24 Jun 2008 20:16:54 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 24 Jun 2008 20:16:54 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 24 Jun 2008 22:16:45 +0200
Message-ID: <g3rkne$jbo$1@ger.gmane.org>
References: <4861533F.7020906@balister.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 3.0a2pre (Macintosh/2008061003)
In-Reply-To: <4861533F.7020906@balister.org>
Sender: news <news@ger.gmane.org>
Subject: Re: Building a rootfs, without building a kernel
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Tue, 24 Jun 2008 20:18:53 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Philip Balister wrote:
> I am trying to build a powerpc root file system for a xilinx ml403
> board. Since we do not have a working kernel build for this machine, I
> tried commenting out the PREFERRED_PROVIDER for virtual/linux. The build
> then tries to build linux-rt. I tried ASSUME_PROVIDED for the kernel
> when the preferred provider is not commented out and it still tries to
> build the kernel.
>
> Looking at the dependency graphs seems to suggest the requirement comes
> from the do_rootfs task.
>
> Does anyone know how to build an image, without building a kernel for a
> machine?

bitbake -b foo-image.bb is what I use, since I'm lazy ;)



