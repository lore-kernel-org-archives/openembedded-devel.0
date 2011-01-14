Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <msmith@cbnco.com>) id 1PdkCX-00050Y-Hr
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Jan 2011 15:00:25 +0100
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 9DF8D93D78C;
	Fri, 14 Jan 2011 08:59:52 -0500 (EST)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 30256-08; Fri, 14 Jan 2011 08:59:52 -0500 (EST)
Received: from juice.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 5C4D3939386;
	Fri, 14 Jan 2011 08:59:52 -0500 (EST)
Date: Fri, 14 Jan 2011 08:59:52 -0500 (EST)
From: Michael Smith <msmith@cbnco.com>
X-X-Sender: michael@juice.ott.cti.com
To: Ken Gilmer <kgilmer@buglabs.net>
In-Reply-To: <AANLkTi=qTS0YRq1Q9N8GcMz+neaYJD+NzRQ6hDPjpNtW@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.1101140859250.6059@juice.ott.cti.com>
References: <4D2E3885.8030207@cbnco.com>
	<AANLkTinfpFWJSY6JfTU+KaO4b6J1aJowir+Z97OnHNUm@mail.gmail.com>
	<4D2F016F.2060808@cbnco.com>
	<AANLkTi=qTS0YRq1Q9N8GcMz+neaYJD+NzRQ6hDPjpNtW@mail.gmail.com>
MIME-Version: 1.0
X-Virus-Scanned: amavisd-new at cbnco.com
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Fri, 14 Jan 2011 14:00:25 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Fri, 14 Jan 2011, Ken Gilmer wrote:

> root@BUG:~# java -shark -Xbatch \
> >    -XX:+PrintCompilation -XX:CompileThreshold=100 -version
>   1   b   java.lang.String::hashCode (60 bytes)
>   2   b   java.lang.String::equals (88 bytes)
>   3   b   java.lang.System::getSecurityManager (4 bytes)
>   4  !b   sun.nio.cs.US_ASCII$Encoder::encodeArrayLoop (279 bytes)
> java version "1.6.0_18"  5   b   java.lang.String::indexOf (151 bytes)

Nice! What version of gcc are you using?

Mike


