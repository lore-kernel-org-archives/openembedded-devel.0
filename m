Received: from blath.larsmichelsen.com ([78.46.117.178] helo=larsmichelsen.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lm@larsmichelsen.com>) id 1PgdZQ-0006yK-Bb
	for openembedded-devel@lists.openembedded.org;
	Sat, 22 Jan 2011 14:32:00 +0100
Received: from localhost (localhost.localdomain [127.0.0.1])
	by larsmichelsen.com (Postfix) with ESMTP id A45009544014
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Jan 2011 14:31:19 +0100 (CET)
Received: from larsmichelsen.com ([127.0.0.1])
	by localhost (blath.larsmichelsen.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id rzi49VKTSml9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Jan 2011 14:31:19 +0100 (CET)
Received: from [192.168.4.106] (g229015111.adsl.alicedsl.de [92.229.15.111])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested) (Authenticated sender: lm)
	by larsmichelsen.com (Postfix) with ESMTPSA id 06ABB9544005
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Jan 2011 14:31:18 +0100 (CET)
Message-ID: <4D3ADC2C.6070506@larsmichelsen.com>
Date: Sat, 22 Jan 2011 14:31:24 +0100
From: Lars Michelsen <lm@larsmichelsen.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2.104i Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1295654503-26379-1-git-send-email-lm@larsmichelsen.com>	<ihedau$stf$1@dough.gmane.org>	<4D3AC11C.2040602@larsmichelsen.com>	<4D3AC6F0.4050802@xora.org.uk>
	<ihel1v$tnt$1@dough.gmane.org>
In-Reply-To: <ihel1v$tnt$1@dough.gmane.org>
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
X-List-Received-Date: Sat, 22 Jan 2011 13:32:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

>> A recipe can have multiple svn sources, so you can fetch ffmpeg into a
>> seperate directory then move it into the mplayer one overwriting
>> whatever mplayer checked out.
>
> Ffmpeg isn't using svn anymore, so if mplayer is using svn remote, it
> won't get updated since last week.

wow, things are changing fast. I checked out the current mplayer repo 
and it still fetches the svn repositories. But we are using old 
revisions - so this would be OK for the moment.

In a long term the mplayer_svn package could be replaced by mplayer_git 
package. mplayer_git could make use of ffmpeg git repo then, right?

So what does this mean for the mplayer_svn patch? Should I invest time 
to make it use several subversion repositories instead of the sub 
repositories?

Regards,
Lars


