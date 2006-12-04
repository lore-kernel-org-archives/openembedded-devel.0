Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1GrDoA-0004wI-W5
	for openembedded-devel@openembedded.org; Mon, 04 Dec 2006 14:24:35 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id kB4DNmwq010959
	for <openembedded-devel@openembedded.org>; Mon, 4 Dec 2006 13:23:48 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10112-08 for <openembedded-devel@openembedded.org>;
	Mon,  4 Dec 2006 13:23:45 +0000 (GMT)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id kB4DNjDX010947
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>; Mon, 4 Dec 2006 13:23:45 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <c384c5ea0612031500o3ee66a23x89d72a948f418532@mail.gmail.com>
References: <c384c5ea0612031500o3ee66a23x89d72a948f418532@mail.gmail.com>
Date: Mon, 04 Dec 2006 13:23:45 +0000
Message-Id: <1165238625.15272.3.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Recent OBJDUMP changes
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
X-List-Received-Date: Mon, 04 Dec 2006 13:24:35 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2006-12-04 at 00:00 +0100, Leon Woestenberg wrote: 
> Hello,
> 
> I seem to hit upon a recent change involving finding shlib
> dependencies using the objdump | grep NEEDED approach by Graeme
> Gregory/XorA:
> 
> http://www.openembedded.org/viewmtn/revision.psp?id=1fb8812d36f505cfabe9ee2335441ada60e32f83
> 
> Shouldn't (BUILD_)OBJDUMP be defined instead with a BUILD_PREFIX?

BUILD_OBJDUMP would use BUILD_PREFIX
HOST_OBJDUMP (or OBJDUMP) should use HOST_PREFIX

> OBJDUMP uses HOST_PREFIX, which seems undefined during packaging
> (using package_ipk).

HOST_PREFIX should never be undefined. How are you working out its
undefined?

When running an arm build, HOST_PREFIX might be "arm-linux-" so the
objdump used would be arm-linux-objdump. Note that if arm-linux-objdump
isn't in PATH, that would be a problem.

For comparison BUILD_PREFIX would be "i686-linux-" on my system and
using "i686-linux-objdump" which wouldn't make sense on arm binaries
when packaging.

Cheers,

Richard










