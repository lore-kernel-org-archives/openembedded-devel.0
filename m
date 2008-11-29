Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1L6X3D-0000mC-Jl
	for openembedded-devel@openembedded.org; Sat, 29 Nov 2008 22:08:27 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1L6X01-0007o3-0S
	for openembedded-devel@openembedded.org; Sat, 29 Nov 2008 21:05:09 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sat, 29 Nov 2008 21:05:09 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sat, 29 Nov 2008 21:05:09 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 29 Nov 2008 22:05:00 +0100
Message-ID: <ggsaps$uch$1@ger.gmane.org>
References: <c384c5ea0811291149s5c02d3c8haad5995ce1ad1522@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b2pre) Gecko/20081120 Shredder/3.0b1pre
In-Reply-To: <c384c5ea0811291149s5c02d3c8haad5995ce1ad1522@mail.gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: Building u-boot images in both kernel.bbclass:do_deploy() and linux.inc:do_compile_append()
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
X-List-Received-Date: Sat, 29 Nov 2008 21:08:27 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29-11-08 20:49, Leon Woestenberg wrote:
> Building u-boot images using mkimage is present in both
> kernel.bbclass:do_deploy() as well as in
> linux.inc:do_compile_append().
>
> Which one has preference in the long run, and why?

The one in do_deploy has more fancy features IIRC, but that should be 
moved to do_compile, since we want to package the fancy one :)

The uImage that the kernel makefile generated should _not_ be used, 
since in OE we generally know better which start & load address to use 
and which compression method works best for us. Incidentally RMK agrees 
with me on that for a change :)

regards,

Koen



