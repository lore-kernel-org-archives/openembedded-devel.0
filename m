Received: from www.xora.org.uk ([80.68.91.202] helo=xora.vm.bytemark.co.uk)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dp@xora.org.uk>) id 1Pgc9A-0005C7-Gs
	for openembedded-devel@lists.openembedded.org;
	Sat, 22 Jan 2011 13:00:48 +0100
Received: from localhost (localhost [127.0.0.1])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTP id A0378A4CED
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Jan 2011 12:00:06 +0000 (GMT)
X-Virus-Scanned: Debian amavisd-new at xora.vm.bytemark.co.uk
Received: from xora.vm.bytemark.co.uk ([127.0.0.1])
	by localhost (xora.vm.bytemark.co.uk [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id JogNankx67dn
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Jan 2011 12:00:05 +0000 (GMT)
Received: from [192.168.1.10] (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTPSA id C35C8A4CB6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Jan 2011 12:00:05 +0000 (GMT)
Message-ID: <4D3AC6F0.4050802@xora.org.uk>
Date: Sat, 22 Jan 2011 12:00:48 +0000
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-GB;
	rv:1.9.2.13) Gecko/20101207 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1295654503-26379-1-git-send-email-lm@larsmichelsen.com>	<ihedau$stf$1@dough.gmane.org>
	<4D3AC11C.2040602@larsmichelsen.com>
In-Reply-To: <4D3AC11C.2040602@larsmichelsen.com>
X-Enigmail-Version: 1.1.1
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
X-List-Received-Date: Sat, 22 Jan 2011 12:00:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 22/01/2011 11:35, Lars Michelsen wrote:
> Hello,
>
> On 22/01/11 11:59, Koen Kooi wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 22-01-11 01:01, Lars Michelsen wrote:
>>
>>> +    # Ensure matching ffmpeg revision in sub repositories of
>>> mplayer source
>>> +    #
>>> +    # It seems that the directories which are fetched from other
>>> repositories
>>> +    # get always the newest revision. This is not good for this
>>> build since
>>> +    # mplayer and ffmpeg code needs to fit.
>>> +    # So we go to the subdirs and checkout the ffmpeg revision
>>> fitting our
>>> +    # mplayer rev.
>>> +    cd ffmpeg&&  \
>>> +    svn up -r 25825&&  \
>>> +    cd ..
>>> +
>>
>> NAK, we don't alllow network access from inside the recipe.
>
> OK. As I commented I am also unhappy with this.
> Do you have a better idea?
>
A recipe can have multiple svn sources, so you can fetch ffmpeg into a
seperate directory then move it into the mplayer one overwriting
whatever mplayer checked out.

G



