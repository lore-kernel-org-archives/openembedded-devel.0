Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1M9mRq-0007KJ-VF
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 May 2009 22:43:35 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 1918742DD58
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 May 2009 16:35:14 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 02421-02 for <openembedded-devel@lists.openembedded.org>; 
	Thu, 28 May 2009 16:35:14 -0400 (EDT)
Received: from [172.20.22.83] (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id DD8484C3741
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 May 2009 16:35:13 -0400 (EDT)
Message-ID: <4A1EF581.30503@cbnco.com>
Date: Thu, 28 May 2009 16:35:13 -0400
From: Michael Smith <msmith@cbnco.com>
User-Agent: Thunderbird 2.0.0.21 (X11/20090302)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1243535013-10090-1-git-send-email-msmith@cbnco.com>	<20090528193604.GB2625@denix.org>
	<4A1EF22E.2040500@balister.org>
In-Reply-To: <4A1EF22E.2040500@balister.org>
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: Re: [PATCH 1/2] tcpdump: fix mix of tabs and	spaces	in	do_configure()
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
X-List-Received-Date: Thu, 28 May 2009 20:43:36 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Philip Balister wrote:

> It doesn't look like Michael has commit access. I did try applying it, 
> and git-am said there was a mix of tabs and spaces.

Yes, the SRC_URI lines were lined up with spaces. It looked nice enough 
that I didn't fix it; but there was a line in the do_configure() script 
that was actually 4 spaces off from the rest, and the OCD in me couldn't 
take it. :)

Path of least resistance seems to be tabs, if that's the default for 
most editors. The Wiki just says to avoid mixing them in the same file.

Mike


