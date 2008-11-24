Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1L4Uyk-0000fl-UM
	for openembedded-devel@openembedded.org; Mon, 24 Nov 2008 07:31:26 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1L4Uw0-0002cU-PJ
	for openembedded-devel@openembedded.org; Mon, 24 Nov 2008 06:28:36 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 24 Nov 2008 06:28:36 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 24 Nov 2008 06:28:36 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 24 Nov 2008 07:28:25 +0100
Message-ID: <ggdhia$cv4$1@ger.gmane.org>
References: <ggd81q$re5$1@ger.gmane.org> <492A3368.4070302@dls.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b2pre) Gecko/20081116 Shredder/3.0b1pre
In-Reply-To: <492A3368.4070302@dls.net>
Sender: news <news@ger.gmane.org>
Subject: Re: Bitbake r1090 (env hiding) makes my build fail.
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
X-List-Received-Date: Mon, 24 Nov 2008 06:31:27 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24-11-08 05:54, Mike (mwester) wrote:
> Rob Kramer wrote:
>> Hia,
>>
>> I'm tracking the stable branch and recently updated bitbake to HEAD. When
>> trying a build-from-scratch, I noticed BB quickly failed in shasum-native.
>> Some manual svn disecting pointed to r1090 as the one that caused the fail.
>> I tried adding a BB_PRESERVE_ENV, but no difference.
>>
>> Output is at http://pastebin.com/m65e66603. There is no log.do_compile
>> generated for some reason, and a build with -D shows nothing much. The gcc
>> invoke actually works OK and produces the oe_shasum256 executable.
>>
>> Any ideas what could be wrong with my setup?
>
> You've gotten further than I have in tracking this down!  Good find in
> pointing the finger of suspicion on the env hiding stuff.
>
> There have been a number of folks who have encountered this problem --
> including me, at one point.  I struggled with it, determined it was
> ccache that was messing up, and at that point I took the easy way out
> and just renamed the /usr/bin/ccache binary to get my builds running again.

Why not put

CCACHE=""

in local.conf?

regards,

Koen

PS: Is that on a RH (derived) buildhost?



