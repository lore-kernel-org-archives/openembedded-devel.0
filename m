Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <msmith@cbnco.com>) id 1PdNZr-00033m-IP
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Jan 2011 14:50:59 +0100
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 5CB7593C832
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jan 2011 08:50:24 -0500 (EST)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 19296-06 for <openembedded-devel@lists.openembedded.org>; 
	Thu, 13 Jan 2011 08:50:24 -0500 (EST)
Received: from [172.20.22.83] (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id E6D2A93BD33
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jan 2011 08:50:23 -0500 (EST)
Message-ID: <4D2F031F.7000208@cbnco.com>
Date: Thu, 13 Jan 2011 08:50:23 -0500
From: Michael Smith <msmith@cbnco.com>
User-Agent: Thunderbird 2.0.0.24 (X11/20100228)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTi=npHcRdA9ehZLYendfUinkE30X_1L6DOLYGBBB@mail.gmail.com>
In-Reply-To: <AANLkTi=npHcRdA9ehZLYendfUinkE30X_1L6DOLYGBBB@mail.gmail.com>
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: Re: Use of 'sem_open' failing
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
X-List-Received-Date: Thu, 13 Jan 2011 13:50:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Otavio Salvador wrote:
> Hello,
> 
> I am having trouble to use an application (freerdp) that calls sem_open method.
> 
> The application has been converted to use sem_open to fix a
> portability issue with MacOS X and it works fine on my Debian but
> fails on the OE built image.

Does strace show anything useful?

For POSIX semaphores you need to have a /dev/shm directory (mode 1777).

Mike


