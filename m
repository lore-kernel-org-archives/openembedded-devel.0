Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MA5eo-0008GH-Ky
	for openembedded-devel@openembedded.org; Fri, 29 May 2009 19:14:14 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MA5Wd-0002yd-Ba
	for openembedded-devel@openembedded.org; Fri, 29 May 2009 17:05:47 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 29 May 2009 17:05:47 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 29 May 2009 17:05:47 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 29 May 2009 19:05:33 +0200
Message-ID: <gvp4ku$27f$1@ger.gmane.org>
References: <1243446012-9317-1-git-send-email-k.kooi@student.utwente.nl>
	<gvp0f7$klr$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1pre) Gecko/20090522 Shredder/3.0b3pre
In-Reply-To: <gvp0f7$klr$1@ger.gmane.org>
Sender: news <news@ger.gmane.org>
Subject: Re: [STABLE][PATCH] omap3sgx-modules: sync with .dev * update to build against newer kernels * switch to MACHINE_KERNEL_PR
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
X-List-Received-Date: Fri, 29 May 2009 17:14:14 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29-05-09 17:54, Rolf Leggewie wrote:
> Koen Kooi wrote:
>> -PR = "r6"
>
> forgive my ignorance, but won't that make the PR go backwards?

No, since module*.bbclass is using MACHINE_KERNEL_PR to keep the modules 
in sync with the kernel. So if you bump PR for the kernel, the modules 
will get rebuilt *and* have an increased PR so the package manager will 
pick it up as upgrade as well.

regards,

Koen



