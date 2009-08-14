Received: from [85.10.209.111] (helo=mail.road.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <u.luckas@road.de>) id 1Mbygd-0007yL-9d
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Aug 2009 17:27:23 +0200
Received: from slimfast.dyndns.org (unknown [192.168.254.1])
	by mail.road.de (Postfix) with ESMTP id 9BFBB8F0004
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Aug 2009 17:10:45 +0200 (CEST)
Received: from ulitu.localnet (ulitu.handy-pc.constin.de [192.168.116.44])
	by slimfast.dyndns.org (Postfix) with ESMTP id 4B723454068
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Aug 2009 17:10:45 +0200 (CEST)
From: Uli Luckas <u.luckas@road.de>
Organization: Road GmbH
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Aug 2009 17:10:43 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.30-1-686-bigmem; KDE/4.3.0; i686; ; )
MIME-Version: 1.0
Message-Id: <200908141710.43549.u.luckas@road.de>
Subject: coreutils-native race
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
X-List-Received-Date: Fri, 14 Aug 2009 15:27:23 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

hi all,
I just tracked down a problem in bitbake, oe-stable and parallel builds.
My oe-stable is a few days old but I suppose this problem might not be version 
dependent so let's see if this is known and fixed already.

What happens (once in a while) is that some build process uses commands from 
coreutils-native while coreutils-native is being staged.
Let's say the command is 'rm' - so coreutils-native stages 'rm' while another 
build process trys to delete some file. This leads to "rm: text file busy" 
because rm is still open for writing.

Has anyone seen this? And is there a known fix or workaround?

Thanks
Uli


-- 

------- ROAD ...the handyPC Company - - -  ) ) )

Uli Luckas
Head of Software Development

ROAD GmbH
Bennigsenstr. 14 | 12159 Berlin | Germany
fon: +49 (30) 230069 - 62 | fax: +49 (30) 230069 - 69
url: www.road.de

Amtsgericht Charlottenburg: HRB 96688 B
Managing director: Hans-Peter Constien


