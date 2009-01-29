Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LSTh9-0004GY-7r
	for openembedded-devel@openembedded.org; Thu, 29 Jan 2009 11:00:23 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LSTZj-0000Ey-MP
	for openembedded-devel@openembedded.org; Thu, 29 Jan 2009 09:52:43 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 29 Jan 2009 09:52:43 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 29 Jan 2009 09:52:43 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 29 Jan 2009 10:52:33 +0100
Message-ID: <glru92$m7k$1@ger.gmane.org>
References: <49816E98.7080508@gmx.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090123 Shredder/3.0b2pre
In-Reply-To: <49816E98.7080508@gmx.net>
Sender: news <news@ger.gmane.org>
Subject: Re: building OE for an amd64 machine
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
X-List-Received-Date: Thu, 29 Jan 2009 10:00:23 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29-01-09 09:53, Robert Schuster wrote:
> Hi,
> I want to build packages with OE that can run on my AMD64 system. As
> such I started a machine configuration and a CPU tune file.
>
> At first everything looks good but when glibc-initial is about to
> compiled it wants to include some header file from the kernel headers
> (asm-x64-64/socket.h) and cannot find it.
>
> The strange thing is that linux-libc-headers is not installed into any
> of the staging directories.
>
> Well, it is basically my first shot at a new machine configuration. :)
>
> I created a user branch for the amd64 support and committed those two
> patches to it:
>
> http://cgit.openembedded.net/cgit.cgi?url=openembedded/commit/&h=robertschuster/amd64-target&id=20a70182e0ab8b6fad5381ea797123c6d6478dc4
> http://cgit.openembedded.net/cgit.cgi?url=openembedded/commit/&h=robertschuster/amd64-target&id=6441c620a7e13d6a6f1be4fe54bf1fb7fc3e6dc5
> http://cgit.openembedded.net/cgit.cgi?url=openembedded/commit/&h=robertschuster/amd64-target&id=0aeb635f90e332cfb65725147dd1f78a30b9f079
>
> I am grateful about any help to get this to work.

+PACKAGE_EXTRA_ARCH += "amd64"

That's missing an 'S' at the end

+IMAGE_FSTYPES ?= "ext2.gz"

That should the '+='

regards,

Koen



