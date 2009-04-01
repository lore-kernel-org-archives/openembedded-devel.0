Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Lp3rV-0008KP-Uv
	for openembedded-devel@openembedded.org; Wed, 01 Apr 2009 19:04:28 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Lp3pG-00089R-VR
	for openembedded-devel@openembedded.org; Wed, 01 Apr 2009 17:02:07 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 01 Apr 2009 17:02:06 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 01 Apr 2009 17:02:06 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 01 Apr 2009 19:01:55 +0200
Message-ID: <gr06m3$63e$1@ger.gmane.org>
References: <49CD3BFF.2030902@irobot.com>	<b6ebd0a50903271402r632461b0q962666a6b2ccd50c@mail.gmail.com>	<49D395AF.1090706@irobot.com>
	<b6ebd0a50904010952n6ce5b7b2g793f79ada1e6dcc1@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090328 Shredder/3.0b3pre
In-Reply-To: <b6ebd0a50904010952n6ce5b7b2g793f79ada1e6dcc1@mail.gmail.com>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.2
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW, RDNS_NONE, SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] bash: add alternative configuration for bin/sh -> /bin/bash
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
X-List-Received-Date: Wed, 01 Apr 2009 17:04:28 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01-04-09 18:52, Chris Larson wrote:
> On Wed, Apr 1, 2009 at 9:26 AM, Tim Harvey<tharvey@irobot.com>  wrote:
>> Chris Larson wrote:
>>>
>>> Be very careful with this.  Specifically, be sure to thoroughly test
>>> installing bash onto a system that currently has busybox, and the
>>> upgrade paths for both busybox and bash.  You never want to get into a
>>> state, due to pre/post rm/install script execution order, where
>>> /bin/sh doesn't exist.  If that happens, you won't be able to execute
>>> the next script to fix it :)
>>>
>>
>> in my case, I have both bash and busybox installed and I want bash to take
>> priority as the /bin/sh which it otherwise does not.
>>
>> attempting to remove the package that contains your shell is something you
>> need to be careful as anyway.
>>
>> This seems to me to be a prime example of where alternatives should be used?
>
> You missed my point, it seems.  I was talking about
> update-alternatives.  Depending on how update-alternatives is
> implemented, there could be issues similar to what I mentioned in the
> previous email.  Consider: if it uses system(), which calls /bin/sh,
> to remove the old /bin/sh link, and then calls system() again to
> create the new, it will fail.  Speculation, but again, it's something
> you always need to keep in mind if you're messing with /bin/sh in any
> way.

IIRC our default u-a is a shell script, the other version is a perl script.
Correct me if I'm wrong, it has been some years since I looked at it :)


regards,

Koen





