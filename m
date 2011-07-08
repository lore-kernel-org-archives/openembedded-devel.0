Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1Qf1QP-0007Et-Tw
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Jul 2011 05:09:31 +0200
Received: by iwn4 with SMTP id 4so1483143iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Jul 2011 20:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=P+qHl1v7BWWuCwEA2oXOA9j1LGIJiIDQfp/GtqtdG/k=;
	b=xLu34zvYb6FhqJJhDfK+CX83+2ErB/CqwltWVWvr+HaoNF5x/hP+2blVEBm52E2Dzl
	FjLuG9McTRV/oIWOoh1ptjlkbjnUQ2xUbCwQiyNo/jV0ZQSziYyNdgcAjEqQU9UCpkPZ
	OG8Fe/nlHrR4G6M8IWFYKnkLoRnC3s2eZPNTQ=
MIME-Version: 1.0
Received: by 10.231.203.136 with SMTP id fi8mr1332224ibb.181.1310093751718;
	Thu, 07 Jul 2011 19:55:51 -0700 (PDT)
Received: by 10.231.174.73 with HTTP; Thu, 7 Jul 2011 19:55:51 -0700 (PDT)
In-Reply-To: <CAD=GYpaAHX=RiS98pXAqE3bRbBs6gsbXQoSCdcs8+9u=2F267w@mail.gmail.com>
References: <1310017138-8936-1-git-send-email-agnel.joel@gmail.com>
	<1310022018.4532.21.camel@mattotaupa>
	<CAD=GYpaAHX=RiS98pXAqE3bRbBs6gsbXQoSCdcs8+9u=2F267w@mail.gmail.com>
Date: Thu, 7 Jul 2011 21:55:51 -0500
Message-ID: <CAD=GYpZX9Y5JbQH9YQ7Ozu6Kp6uf72ooFiys-2Ga_aR_q29R6A@mail.gmail.com>
From: Joel A Fernandes <agnel.joel@gmail.com>
To: Paul Menzel <paulepanter@users.sourceforge.net>
Cc: jdk@ti.com, joelagnel@ti.com, openembedded-devel@lists.openembedded.org,
	k-kooi@ti.com
Subject: Re: [PATCH v2] pulseaudio: Run as system-wide instance instead of per-user
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
X-List-Received-Date: Fri, 08 Jul 2011 03:09:31 -0000
Content-Type: text/plain; charset=ISO-8859-1

>> As far as I understood system mode can sometimes be the right thing to
>> do but most of the time it is just a configuration error. Running PA and
>> printing out the debug messages should give you a clue.
>
> Pulseaudio isn't printing any debug messages to syslog or stdout ( -vv
> -log-level pulseaudio options )
>
> Here was the thread on BeagleBoard mailing list that discusses this issue:
> http://groups.google.com/group/beagleboard/browse_thread/thread/4dc82483a8d000fb/ccbd0e21fa5e89a0
>
> I will post the details of the problem on the pulseaudio mailing list
> and try to get some other alternatives.
>
> For now, can we temporarily merge this patch while I followup with them?

Here is a discussion I started on the pulseaudio list:
http://lists.freedesktop.org/archives/pulseaudio-discuss/2011-July/010565.html

thanks,
Joel


