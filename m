Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1MdTUX-00049G-13
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Aug 2009 20:33:07 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 27FEC53D23C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2009 14:15:59 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 00662-05 for <openembedded-devel@lists.openembedded.org>; 
	Tue, 18 Aug 2009 14:15:59 -0400 (EDT)
Received: from [172.20.22.83] (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id EFA344773D3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2009 14:15:58 -0400 (EDT)
Message-ID: <4A8AEFDE.6020601@cbnco.com>
Date: Tue, 18 Aug 2009 14:15:58 -0400
From: Michael Smith <msmith@cbnco.com>
User-Agent: Thunderbird 2.0.0.22 (X11/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1250515743-10823-1-git-send-email-msmith@cbnco.com>	<200908172229.32840.khimov@altell.ru>
	<4A89A554.2030201@cbnco.com> <200908181304.08654.khimov@altell.ru>
In-Reply-To: <200908181304.08654.khimov@altell.ru>
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: Re: x86_64 multilib
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
X-List-Received-Date: Tue, 18 Aug 2009 18:33:10 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Roman I Khimov wrote:
> Well, for x86_64 we build GRUB like this:
> 
> ========
> LDFLAGS += "-static"
> CFLAGS += "${CFLAGS_MULTILIB}"
> ========
> 
> where
> 
> ==========
> CFLAGS_MULTILIB = "-march=i686 -m32"
> ==========

Hi Roman,

I had to build my gcc-cross with --disable-multilib because my glibc is 
not multilib. In April you posted a patch series to add multilib support 
for x86_64, but I'm not sure how much of it made it into the tree:

http://thread.gmane.org/gmane.comp.handhelds.openembedded/22737

Are you still using that patchset to get working gcc -m32?

Thanks,
Mike


