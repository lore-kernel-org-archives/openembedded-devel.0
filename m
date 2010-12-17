Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <msmith@cbnco.com>) id 1PTlrd-0008Gf-FJ
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Dec 2010 02:45:38 +0100
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 0E83D913B98
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Dec 2010 10:06:04 -0500 (EST)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 06109-08 for <openembedded-devel@lists.openembedded.org>; 
	Fri, 17 Dec 2010 10:06:03 -0500 (EST)
Received: from [172.20.22.83] (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id E067990B370
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Dec 2010 10:06:03 -0500 (EST)
Message-ID: <4D0B7C5B.2020302@cbnco.com>
Date: Fri, 17 Dec 2010 10:06:03 -0500
From: Michael Smith <msmith@cbnco.com>
User-Agent: Thunderbird 2.0.0.24 (X11/20100228)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1292507333-20222-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1292507333-20222-1-git-send-email-Martin.Jansa@gmail.com>
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: Re: [RFC] xorg: upgrade to X11R7.6 and remove	preferred-xorg-versions*.inc files
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
X-List-Received-Date: Sat, 18 Dec 2010 01:45:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Martin Jansa wrote:
> * X11R7.6-RC1 was already released
>   http://www.x.org/releases/X11R7.6-RC1/doc/xorg-docs/ReleaseNotes.html
>   so it's IMHO time to start migration there

>  .../include/angstrom-2010-preferred-versions.inc   |    1 -
>  .../preferred-xorg-versions-X11R7.5-latest.inc     |  126 ------
>  .../include/preferred-xorg-versions-X11R7.5.inc    |  286 -------------

Hi Martin,

As someone who has to update an embedded X11 build maybe once or twice a 
  year, but still wants to pull in other OE changes once in a while in 
between, I'd prefer to see the X11R7.5 includes stick around. There are 
many packages and it's hard for a non-expert to know which versions are 
meant to be used together.

Mike


