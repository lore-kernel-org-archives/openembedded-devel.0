Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1PaY8v-0004mX-Uz
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Jan 2011 19:31:30 +0100
Received: by wyb40 with SMTP id 40so16011914wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Jan 2011 10:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:cc:content-type;
	bh=sIhRSza35ojGkvGfFFW7O8v1XJLOkrlkiN0inmsVbL8=;
	b=H12r3WLiWWkFdOotmt/HtDhIYsy7Q/fF4tczaGaiOvfCH//iUU3vdfOklD7wnY9aPd
	/vTntQYDhTE3ii77w27ay/gS/l0OwqbtjeGeNA3mPbfZZF3VL5jTfavgfH26RQA/F0CJ
	EQKlC5M9nBaXQZx7J4bsvuoV7JyMs3eahj9NI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	b=U+zG1Kp3d/5GT1guV4fQV1eXZoWGOTobKnn8PJilrSUNJCwhyJLmkMc+5M18V/p49/
	rvbSGLSTkTQjh2TSpWfa6gSZ8dQY1a/nIV3P+fhhGjHUQfk8OG001rGjM0qcrMQ4B9Ci
	3LVS9MshxKWh4Aoqk7E7Y4hR/jpaqnr837+oY=
Received: by 10.216.59.193 with SMTP id s43mr2389067wec.42.1294252265908; Wed,
	05 Jan 2011 10:31:05 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.67.67 with HTTP; Wed, 5 Jan 2011 10:30:45 -0800 (PST)
In-Reply-To: <1294188312.17519.22193.camel@rex>
References: <1293905677.17519.16909.camel@rex>
	<AANLkTinpcYFR8JaDHMtUcKW2YoaH6fG_+4An+Aq3mMoA@mail.gmail.com>
	<1294188312.17519.22193.camel@rex>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 5 Jan 2011 11:30:45 -0700
X-Google-Sender-Auth: BV_OTMZX32sQLfl5oIa5q4ucOMA
Message-ID: <AANLkTinyX_KmQeAqtLELeWve94r25BbhbkaNWezyyhy=@mail.gmail.com>
To: Richard Purdie <rpurdie@rpsys.net>
Cc: bitbake-dev <bitbake-dev@lists.berlios.de>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [Bitbake-dev] Bitbake task logging
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
X-List-Received-Date: Wed, 05 Jan 2011 18:31:30 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jan 4, 2011 at 5:45 PM, Richard Purdie <rpurdie@rpsys.net> wrote:
> On Wed, 2011-01-05 at 00:40 +0300, Yury Bushmelev wrote:
>> 2011/1/1 Richard Purdie <richard.purdie@linuxfoundation.org>:
>> > I've been looking at the changes in bitbake master and those in Poky.
>> > Both are trying to improve the logging situation but I think we need to
>> > discuss/agree what we're trying to achieve.
>>
>> [skip]
>>
>> > Thoughts/Comments/Suggestions?
>>
>> I'm interested in build perfomance monitoring/analyze. It would be
>> great to have some tool (may be like bootchart) to be able to look at
>> CPU time/RAM/Disk bandwidth/network traffic per task.
>
> You should already be able to do this with the addhandler functionality
> in a bbclass file to tap into bitbake's event stream. If you find you
> can't, we should enhance things so you can :).

http://kergoth.pastey.net/142813 shows an example of using this to
show per-task and per-build CPU usage and execution times.  I intended
to implement I/O and network, but it got pushed to the back burner.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


