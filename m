Received: from [80.91.229.12] (helo=lo.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MdPoE-0007gf-2H for openembedded-devel@lists.openembedded.org;
	Tue, 18 Aug 2009 16:37:11 +0200
Received: from list by lo.gmane.org with local (Exim 4.50) id 1MdPXf-000370-1Q
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Aug 2009 16:20:03 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2009 16:20:03 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2009 16:20:03 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 18 Aug 2009 16:17:49 +0200
Message-ID: <h6ed6d$r1l$2@ger.gmane.org>
References: <6978a1740908180652y36467f0evcfc467153cf9ac64@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1.3pre) Gecko/20090730 Shredder/3.0b4pre
In-Reply-To: <6978a1740908180652y36467f0evcfc467153cf9ac64@mail.gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: Create dir with 700 permissions from recipe
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
X-List-Received-Date: Tue, 18 Aug 2009 14:37:34 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18-08-09 15:52, s hakkesteegt wrote:
> Hi,
>
> For a recipe I want to use locally to enable public key authentication on my
> images, I'm trying to create the .ssh dir with 700 permissions. But this
> doesn't seem to work. It ends up in the rootfs and in the ipk with 775
> permissions, although in the work dir it has the correct 700 permissions.
> This is the recipe I created:

1) never ever install something into $HOME
2) fakeroot do_install() {}

regards,

Koen





