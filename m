Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <msmith@cbnco.com>) id 1PdSUg-0002HH-9M
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Jan 2011 20:05:58 +0100
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 5C69E93E358
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jan 2011 14:05:26 -0500 (EST)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 20993-01 for <openembedded-devel@lists.openembedded.org>; 
	Thu, 13 Jan 2011 14:05:26 -0500 (EST)
Received: from [172.20.22.83] (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 349508EB6C3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jan 2011 14:05:26 -0500 (EST)
Message-ID: <4D2F4CF5.2030404@cbnco.com>
Date: Thu, 13 Jan 2011 14:05:25 -0500
From: Michael Smith <msmith@cbnco.com>
User-Agent: Thunderbird 2.0.0.24 (X11/20100228)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D2E3885.8030207@cbnco.com>
In-Reply-To: <4D2E3885.8030207@cbnco.com>
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: Re: openjdk-6-vm-shark on armv6 (ARM1176)
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
X-List-Received-Date: Thu, 13 Jan 2011 19:05:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Michael Smith wrote:
> Maybe OT for here, but I'm wondering if anyone else has tried to run the 
> OE-built shark VM on armv6. For me it crashes the first time it tries to 
> JIT anything.
> 
> LLVM llc/lli fail to run the hello world app from here:

Shark and lli work (slowly :) on armv6 if llvm is built with 
-DCMAKE_BUILD_TYPE:STRING=Debug. I'm using gcc 4.3.3; maybe it's just an 
optimization bug fixed in a later version.

Mike


