Received: from li38-254.members.linode.com ([207.192.74.254]
	helo=masterfoo.zenlinux.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgarman@zenlinux.com>) id 1PTrtb-0003gU-BE
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Dec 2010 09:12:03 +0100
Received: from [192.168.1.103] (c-76-105-143-140.hsd1.or.comcast.net
	[76.105.143.140])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 11C982FE9F
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Dec 2010 02:41:23 -0500 (EST)
Message-ID: <4D0C65A2.6060106@zenlinux.com>
Date: Fri, 17 Dec 2010 23:41:22 -0800
From: Scott Garman <sgarman@zenlinux.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTin7AtzCpMmNq_SSHcbDjZqaFXcdgd6T5fHrfb0r@mail.gmail.com>
In-Reply-To: <AANLkTin7AtzCpMmNq_SSHcbDjZqaFXcdgd6T5fHrfb0r@mail.gmail.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 11C982FE9F.68284
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: sgarman@zenlinux.com
X-Spam-Status: No
Subject: Re: do_rootfs and mkfs.jffs2
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
X-List-Received-Date: Sat, 18 Dec 2010 08:12:03 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/17/2010 02:08 PM, Frans Meulenbroeks wrote:
> I just tried to make a jffs2 image, but got an error that mkfs.jffs2
> was not found.
> Apparently somewhere a dependency to mtd-utils-native should be added,
> but I have no idea where.

In conf/bitbake.conf there is a line:

IMAGE_DEPENDS_jffs2 = "mtd-utils-native"

So one would think that would do the trick. Were you doing anything 
unusual to generate the jffs2 image (e.g, trying to override the default 
image type for your target)?

Scott


