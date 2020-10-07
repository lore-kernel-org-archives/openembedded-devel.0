Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
 by mx.groups.io with SMTP id smtpd.web10.1750.1602079186499315144
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Oct 2020 06:59:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agner.ch header.s=dkim header.b=RqvPc4QF;
 spf=pass (domain: agner.ch, ip: 178.209.48.109, mailfrom: stefan@agner.ch)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 114C95C109A;
	Wed,  7 Oct 2020 15:59:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1602079183;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wQ/kVeIqxVUEf+A0E09g/JbKaKqCTX1sM1V+nLQRMZg=;
	b=RqvPc4QFHZV1auOEM8COrrnXqtZlGHRUx3PJidTFriVewCg2XjwVuqgzlA9jooaoEMoSw9
	86vKUly4G/j1SUZYSgojfTOrSyQv7msP3ntlKs3fDZK7lolIdcTz1yRxKBmgUr1uPLIeKO
	dvTT/tRXR8QA9uqQz8fy870az+NVU/M=
MIME-Version: 1.0
Date: Wed, 07 Oct 2020 15:59:43 +0200
From: "Stefan Agner" <stefan@agner.ch>
To: Mario Schuknecht <mario.schuknecht@dresearch-fe.de>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: wireguard-tools systemd service file installation path
In-Reply-To: <CAAwVp3s_ubYfKsq4UCbAUHyN5OYMr=0b8CMci8a6_QeDaW4MOQ@mail.gmail.com>
References: <CAAwVp3s_ubYfKsq4UCbAUHyN5OYMr=0b8CMci8a6_QeDaW4MOQ@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <2b59619007c9817b93c052a8da357c6d@agner.ch>
X-Sender: stefan@agner.ch
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2020-10-07 14:05, Mario Schuknecht wrote:
> Hi,
> 
> I have a user question.
> 
> Why does the recipe wireguard-tools
> http://git.openembedded.org/meta-openembedded/tree/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20200319.bb?h=dunfell
> install the systemd service file wg-quick@.service to /lib/systemd/
> and not to /lib/systemd/system/ as usual?

Seems like a bug to me. I don't think I tested wg-quick back when I
added the recipe.

--
Stefan

> 
> In my system the file /lib/systemd/wg-quick@.service is not found by
> systemd and the service is not executed.
> 
> Is there a way to change the installation path or should the
> wireguard-tools_1.0.20200319.bb recipe be changed?
> 
> 
> Thanks in advance.
> 
> Mario
