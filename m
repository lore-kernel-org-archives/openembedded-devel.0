Received: from mail-vc0-f181.google.com ([209.85.220.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1U8EEG-0001dF-UT
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Feb 2013 19:17:17 +0100
Received: by mail-vc0-f181.google.com with SMTP id f13so1983698vcb.26
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Feb 2013 10:01:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:content-type;
	bh=A4WD3wqoMcKPX1ePsI3XnFhUxRmR2fTRQbf70r22Tq4=;
	b=pwCVjRJHkUmHuGeIE4x7omGtn+OR4jtFLlFGweWPGdtU0yHZBkAUarmwI0LLDxCZyB
	2GLJh5LrKDdtWc2+WiylN8pUEo5u9C7Nzk2NRHJpBD/CakN5vafFJWeIUtpk4Ybg+Rbw
	l5pErBnTH9iOSUodoc2qgRE1TnKOeinH7DI529uh4gQyhUfU6kdMoAelZH3pq2YSUNuz
	fcA6yeUAQXeYT37hBJeCwhxDJ0OxvbEoa9coEdeJ7ZkWkzuHzReqEK/Dqs2O4ENwbyzd
	h2ybj6luT5YvcC70aM3Davd0P4d+SQMwo3JY+5diztX69AMWhqI6Lkz2iJyiFVZF0war
	C8qw==
MIME-Version: 1.0
X-Received: by 10.58.23.199 with SMTP id o7mr1777192vef.2.1361383258928; Wed,
	20 Feb 2013 10:00:58 -0800 (PST)
Received: by 10.52.185.168 with HTTP; Wed, 20 Feb 2013 10:00:58 -0800 (PST)
In-Reply-To: <20130219174527.GU3300@jama>
References: <1359152782-23743-1-git-send-email-schnitzeltony@googlemail.com>
	<1359152782-23743-5-git-send-email-schnitzeltony@googlemail.com>
	<20130126115141.GH16904@jama.palm1.palmone.com>
	<CALbNGRQepRvg6+EVXzuSZA4a+JTuknBEHm=PJ0L=0a0hGpoX7w@mail.gmail.com>
	<20130219082744.GT3300@jama>
	<CALbNGRSwt6Sa_hui48k+iMJu4PaespyXcO3kEW4hCgsDL5iP8w@mail.gmail.com>
	<20130219174527.GU3300@jama>
Date: Wed, 20 Feb 2013 19:00:58 +0100
Message-ID: <CALbNGRRcTwiPWsi6KUoxB6RnpJkh=TjAD8FadX+LP+So1u7KPA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe/meta-systemd/V2 4/5] geany: initial add 1.22
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
X-List-Received-Date: Wed, 20 Feb 2013 18:17:17 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 19, 2013 at 6:45 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> > Any news on it?
>> >
>> > --
>> No - I tried to reproduce without success and then decided to come
>> back later. Suggestion: Let me know if it fails again in world - then
>> we can think about removing it again.
>
> Yes it does, here is log from last build
> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.20130219_043012.log/
>
I think I found the culprit. As soon as I can build something which is
close to current master (at the moment I cannot even parse) I'll send
out a patch.

Andreas


