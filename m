Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <msmith@cbnco.com>) id 1PdNSq-0002k0-4a
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Jan 2011 14:43:44 +0100
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id E8897930AE5;
	Thu, 13 Jan 2011 08:43:11 -0500 (EST)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 18146-06; Thu, 13 Jan 2011 08:43:11 -0500 (EST)
Received: from [172.20.22.83] (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id A4606378319;
	Thu, 13 Jan 2011 08:43:11 -0500 (EST)
Message-ID: <4D2F016F.2060808@cbnco.com>
Date: Thu, 13 Jan 2011 08:43:11 -0500
From: Michael Smith <msmith@cbnco.com>
User-Agent: Thunderbird 2.0.0.24 (X11/20100228)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D2E3885.8030207@cbnco.com>
	<AANLkTinfpFWJSY6JfTU+KaO4b6J1aJowir+Z97OnHNUm@mail.gmail.com>
In-Reply-To: <AANLkTinfpFWJSY6JfTU+KaO4b6J1aJowir+Z97OnHNUm@mail.gmail.com>
X-Virus-Scanned: amavisd-new at cbnco.com
Cc: Ken Gilmer <kgilmer@buglabs.net>
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
X-List-Received-Date: Thu, 13 Jan 2011 13:43:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Ken Gilmer wrote:
>   I have built OpenJDK with shark for armv6 (iMX.31) and have not had 
> any problems.  I haven't done a whole lot of testing, but enough to say 
> it should work.  More details here:
> 
> http://community.buglabs.net/kgilmer/posts/213-OpenJDK-on-BUG-1-3-Devices-Update-now-with-shark-

Cool, thanks. I'm also using iMX.31. Do you have time to try something?

java -shark -Xbatch \
     -XX:+PrintCompilation -XX:CompileThreshold=100 -version

That will force it to compile code after fewer iterations, and for me it 
fails the first time it tries to compile anything:

   1   b   java.lang.String::hashCode (60 bytes)
Stack dump:
0.      Running pass 'ARM Instruction Selection' on function 
'@"java.lang.String::hashCode"'

Mike


