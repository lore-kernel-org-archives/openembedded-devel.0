Received: from mail-fx0-f51.google.com ([209.85.161.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders.darander@gmail.com>) id 1QbWnc-00032w-JE
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Jun 2011 13:49:48 +0200
Received: by fxh10 with SMTP id 10so140355fxh.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jun 2011 04:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=WjvnidDIi0rfvqBedeedAVftYPOjjtadFzlIVYceY+0=;
	b=k9B2N7z7rST+bI2w1NEpZLPwOJ3NLqFqhsqD/RK1pLNSLE80dOmxe1H8naDnU48Yza
	V9K4B4ksKeNtXNfiJglocTeguGFR/p4RauZBTzyXaoRh1sgd2xPvYOi7eWyaBlXZLlPr
	U/+cyVWkM/IqJJBgFWy3lkb5P1PwGKMR5G0H4=
MIME-Version: 1.0
Received: by 10.223.51.4 with SMTP id b4mr1355917fag.93.1309261566676; Tue, 28
	Jun 2011 04:46:06 -0700 (PDT)
Received: by 10.223.111.130 with HTTP; Tue, 28 Jun 2011 04:46:06 -0700 (PDT)
In-Reply-To: <4E09A393.2050000@nedap.com>
References: <4E09926B.2000406@nedap.com>
	<BANLkTikvCycdv2g58Z_m3_14yj=nA9-+xg@mail.gmail.com>
	<4E09A393.2050000@nedap.com>
Date: Tue, 28 Jun 2011 13:46:06 +0200
Message-ID: <BANLkTikXtSracNZvm2KMH87UKjBYv4xcsA@mail.gmail.com>
From: Anders Darander <anders.darander@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: how to change system files
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
X-List-Received-Date: Tue, 28 Jun 2011 11:49:48 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jun 28, 2011 at 11:49, Jaap de Jong <jaap.dejong@nedap.com> wrote:
> On 06/28/2011 11:23 AM, Anders Darander wrote:
> Yeah, but what if I decide at a certain point in time to change the
> /etc/network/interfaces file?
> Normally I would increment PR in the bb file and then build it.
> And finally at the target I would do opkg upgrade.

Just as Phil said, you increment PR in your .bbappend-file.

I'm oftend appending to the PR in my .bbappend-files.

Regards,
Anders


