Received: from blath.larsmichelsen.com ([78.46.117.178] helo=larsmichelsen.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lm@larsmichelsen.com>) id 1PiVuH-0001LU-Ex
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Jan 2011 18:45:17 +0100
Received: from localhost (localhost.localdomain [127.0.0.1])
	by larsmichelsen.com (Postfix) with ESMTP id E2137954456E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jan 2011 18:44:30 +0100 (CET)
Received: from larsmichelsen.com ([127.0.0.1])
	by localhost (blath.larsmichelsen.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id SbBkXhXPveaZ
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jan 2011 18:44:30 +0100 (CET)
Received: from [192.168.4.106] (g230234061.adsl.alicedsl.de [92.230.234.61])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested) (Authenticated sender: lm)
	by larsmichelsen.com (Postfix) with ESMTPSA id 756709544014
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jan 2011 18:44:30 +0100 (CET)
Message-ID: <4D41AF05.3000302@larsmichelsen.com>
Date: Thu, 27 Jan 2011 18:44:37 +0100
From: Lars Michelsen <lm@larsmichelsen.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2.104i Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1295654503-26379-1-git-send-email-lm@larsmichelsen.com>	<ihedau$stf$1@dough.gmane.org>	<4D3AC11C.2040602@larsmichelsen.com>	<4D3AC6F0.4050802@xora.org.uk>	<ihel1v$tnt$1@dough.gmane.org>	<4D3ADC2C.6070506@larsmichelsen.com>	<ihesdm$v7u$1@dough.gmane.org>	<4D3B15FB.5000403@larsmichelsen.com>	<4D3F1253.7060202@larsmichelsen.com>	<ihn57v$84o$1@dough.gmane.org>	<4D3F3E2E.5030308@larsmichelsen.com>
	<ihng97$64q$2@dough.gmane.org>
In-Reply-To: <ihng97$64q$2@dough.gmane.org>
Subject: Re: [PATCH] mplayer_svn: Package can be built again; Bumped to rev. 31329.
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
X-List-Received-Date: Thu, 27 Jan 2011 17:45:17 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello Koen,

On 25/01/11 22:45, Koen Kooi wrote:

>>> Even when you clean up your checked out mplayer sources?
>>> That sounds strange to me...
>
> It then downloads a snapshot from the angstrom source mirror

Okay, I got it now. I added the source mirror to my distro: now it works.

It's now clear to me: The snapshot on the angstrom source mirror has 
been built for mplayer rev. 32735 which includes a snapshot of the 
ffmpeg repository with the revision which was up-to-date during building 
the file on the mirror (through the svn:external subrepo).

When the package on the mirror would be deleted and built again the 
mplayer_svn reciep will be broken (Another way to try it is to disable 
the mirror).

Using the mirror is a workaround in the short term. But this is no 
solution for the long term. As the primary ffmpeg repo is now git it is 
only a matter of time that a switch is needed.

So which way to go now? Make the mplayer_svn package use the ffmpeg git 
as 2nd repo? If the way to go is clear I would try to build a patch.

Thanks & Regards,
Lars


