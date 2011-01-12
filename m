Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <msmith@cbnco.com>) id 1PdA5F-0000IZ-2l
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Jan 2011 00:26:29 +0100
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 679449338A6;
	Wed, 12 Jan 2011 18:25:58 -0500 (EST)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 19208-06; Wed, 12 Jan 2011 18:25:58 -0500 (EST)
Received: from [172.20.22.83] (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id D386992EC2D;
	Wed, 12 Jan 2011 18:25:57 -0500 (EST)
Message-ID: <4D2E3885.8030207@cbnco.com>
Date: Wed, 12 Jan 2011 18:25:57 -0500
From: Michael Smith <msmith@cbnco.com>
User-Agent: Thunderbird 2.0.0.24 (X11/20100228)
MIME-Version: 1.0
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: openjdk-6-vm-shark on armv6 (ARM1176)
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
X-List-Received-Date: Wed, 12 Jan 2011 23:26:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hey,

Maybe OT for here, but I'm wondering if anyone else has tried to run the 
OE-built shark VM on armv6. For me it crashes the first time it tries to 
JIT anything.

LLVM llc/lli fail to run the hello world app from here:

http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg08264.html 


/tmp # llvm-as hello.ll
/tmp # lli hello.bc
Stack dump:
0.      Program arguments: lli hello.bc
1.      Running pass 'ARM Instruction Selection' on function '@main'
Segmentation fault

/tmp # llc hello.bc
Stack dump:
0.      Program arguments: llc hello.bc
1.      Running pass 'ARM Instruction Selection' on function '@main'
Segmentation fault

I'll look further; just wondering if this is known not to work.

Thanks,
Mike


