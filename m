Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1MaYPP-00052J-LD
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Aug 2009 19:11:43 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 0CD8C5325FC
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Aug 2009 12:55:31 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 12413-08 for <openembedded-devel@lists.openembedded.org>; 
	Mon, 10 Aug 2009 12:55:30 -0400 (EDT)
Received: from [172.20.22.83] (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id D849341D9B4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Aug 2009 12:55:30 -0400 (EDT)
Message-ID: <4A805102.6060505@cbnco.com>
Date: Mon, 10 Aug 2009 12:55:30 -0400
From: Michael Smith <msmith@cbnco.com>
User-Agent: Thunderbird 2.0.0.22 (X11/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: pciutils and pci.ids.gz
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
X-List-Received-Date: Mon, 10 Aug 2009 17:11:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

commit 257821eeea20420af8369a3db6fb398926fdfe84
Author: Khem Raj <raj.khem@gmail.com>
Date:   Sun Aug 9 01:58:23 2009 -0700

     pciutils_3.1.2.bb: Dont install gzipped versio of pci.ids its not 
there.

     Signed-off-by: Khem Raj <raj.khem@gmail.com>


Ahh, I have a feeling the pciutils lib/configure script is looking in 
the wrong place to autodetect ZLIB (it wants /usr/include/zlib.h). I'll 
send a patch to fix.

If you revert someone's change, could you please post about it to the 
mailing list? I only caught this by accident when looking through a week 
or two of logs.

Mike


