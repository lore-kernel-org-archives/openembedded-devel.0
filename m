Received: from [85.10.209.111] (helo=mail.road.de)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <u.luckas@road.de>) id 1IrVre-0005a4-V4
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Nov 2007 10:45:54 +0100
Received: from slimfast.dyndns.org (unknown [192.168.254.1])
	by mail.road.de (Postfix) with ESMTP id 585C18F0049;
	Mon, 12 Nov 2007 10:44:34 +0100 (CET)
Received: from localhost.localdomain (ulitu.handy-pc.constin.de
	[192.168.116.44])
	by slimfast.dyndns.org (Postfix) with ESMTP id 41A06AD402B;
	Mon, 12 Nov 2007 10:44:34 +0100 (CET)
Received: from ip6-localhost (unknown [IPv6:::1])
	by localhost.localdomain (Postfix) with ESMTP id 10D56D98C04;
	Mon, 12 Nov 2007 10:44:33 +0100 (CET)
From: Uli Luckas <u.luckas@road.de>
Organization: Road GmbH
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 Nov 2007 10:44:30 +0100
User-Agent: KMail/1.9.7
MIME-Version: 1.0
Message-Id: <200711121044.32094.u.luckas@road.de>
Subject: [PATHC] ATAG export for the linux kernel
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 12 Nov 2007 09:45:55 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

This is a path against the 2.6.21 kernel to export ATAG related information to 
procfs. It was inspired by the work and discussions with Mike Westerhof on 
the arm linux kernel mailing list.
The patch will we needed by the kexec user space binary to propperly set up 
ATAGs for the 'to be kexeced' kernel. 
A port to 2.6.23/2.6.24 should be mostly mechanical after removal of git 
commit 033b8ffe3f1ea8174d51d125838ac6deea60f63f (for someone who has a 
running 2.6.23 device :-). 

The export interface is via two procfs files:
/proc/atags/addr
/proc/atags/tags
"addr" holds the hex representation of the physical address where the running 
kernel expects it's ATAG list.
"tags" holds the binary ATAGs that where passed to the running kernel.

regards,
Uli Luckas

-- 

------- ROAD ...the handyPC Company - - -  ) ) )

Uli Luckas
Software Development

ROAD GmbH
Bennigsenstr. 14 | 12159 Berlin | Germany
fon: +49 (30) 230069 - 64 | fax: +49 (30) 230069 - 69
url: www.road.de

Amtsgericht Charlottenburg: HRB 96688 B
Managing directors: Hans-Peter Constien, Hubertus von Streit


