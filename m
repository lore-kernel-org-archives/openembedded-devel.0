Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1MYL8o-0001Uf-Q0
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Aug 2009 16:37:28 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 903581FB496
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Aug 2009 10:21:53 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 05497-07 for <openembedded-devel@lists.openembedded.org>; 
	Tue,  4 Aug 2009 10:21:52 -0400 (EDT)
Received: from [172.20.22.83] (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 814A852CAF9
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Aug 2009 10:21:52 -0400 (EDT)
Message-ID: <4A784400.7010200@cbnco.com>
Date: Tue, 04 Aug 2009 10:21:52 -0400
From: Michael Smith <msmith@cbnco.com>
User-Agent: Thunderbird 2.0.0.22 (X11/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: Kernel staging on x86
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
X-List-Received-Date: Tue, 04 Aug 2009 14:37:32 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

There have been a couple of patches to fix asm-x86 header staging:

http://patchwork.openembedded.org/patch/455/

http://patchwork.openembedded.org/patch/746/

Could someone please apply one of them?

I've been using the first patch to fix builds of nvidia-display and 
madwifi. I haven't tested the second patch; I think it does exactly the 
same thing on x86, although I'm not sure what it will do on a non-x86 
platform (e.g. on arm would it copy x86 files into 
${STAGING_KERNEL_DIR}/include/asm-arm?).

Thanks,
Mike


