Received: from blath.larsmichelsen.com ([78.46.117.178] helo=larsmichelsen.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lm@larsmichelsen.com>) id 1Pgbls-0004Xl-E8
	for openembedded-devel@lists.openembedded.org;
	Sat, 22 Jan 2011 12:36:44 +0100
Received: from localhost (localhost.localdomain [127.0.0.1])
	by larsmichelsen.com (Postfix) with ESMTP id B15BC9544005
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Jan 2011 12:36:03 +0100 (CET)
Received: from larsmichelsen.com ([127.0.0.1])
	by localhost (blath.larsmichelsen.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id YfMeQyvvsYwd
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Jan 2011 12:36:03 +0100 (CET)
Received: from [192.168.4.106] (g229015111.adsl.alicedsl.de [92.229.15.111])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested) (Authenticated sender: lm)
	by larsmichelsen.com (Postfix) with ESMTPSA id 324549544014
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Jan 2011 12:36:03 +0100 (CET)
Message-ID: <4D3AC11C.2040602@larsmichelsen.com>
Date: Sat, 22 Jan 2011 12:35:56 +0100
From: Lars Michelsen <lm@larsmichelsen.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2.104i Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1295654503-26379-1-git-send-email-lm@larsmichelsen.com>
	<ihedau$stf$1@dough.gmane.org>
In-Reply-To: <ihedau$stf$1@dough.gmane.org>
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
X-List-Received-Date: Sat, 22 Jan 2011 11:36:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

On 22/01/11 11:59, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 22-01-11 01:01, Lars Michelsen wrote:
>
>> +	# Ensure matching ffmpeg revision in sub repositories of mplayer source
>> +	#
>> +	# It seems that the directories which are fetched from other repositories
>> +	# get always the newest revision. This is not good for this build since
>> +	# mplayer and ffmpeg code needs to fit.
>> +	# So we go to the subdirs and checkout the ffmpeg revision fitting our
>> +	# mplayer rev.
>> +	cd ffmpeg&&  \
>> +	svn up -r 25825&&  \
>> +	cd ..
>> +
>
> NAK, we don't alllow network access from inside the recipe.

OK. As I commented I am also unhappy with this.
Do you have a better idea?

Regards,
Lars


