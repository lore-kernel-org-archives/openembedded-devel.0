Return-Path: <darknighte@darknighte.com>
Received: from mail-qt0-f182.google.com (mail-qt0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id 8C0E6787C1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Jan 2018 18:16:46 +0000 (UTC)
Received: by mail-qt0-f182.google.com with SMTP id f4so11614273qtj.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Jan 2018 10:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=darknighte.com; s=darknighte;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=B2gzYosHFWNlEGcLtMlZhiVa109obO/2AaogLl7QclQ=;
	b=JJOMYc3e+pKJkZKd6EqhoHqiQ1n9KTzBrupyPNGyhaOKyLdQD3nS0L5m9MKLGOmZLs
	Y8QlrqSeTRo6aeXnA/TomiSmBx5sSoCyB70jZzB6B0rOAyNb4hLChBkDkPmYAtOBKOQ1
	zDMraQbFxfqnt/KAYEskdVHWfsEZCsdyx+9ik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=B2gzYosHFWNlEGcLtMlZhiVa109obO/2AaogLl7QclQ=;
	b=bcwiJeRM26g7axbgO5iShCcKB9XNNVWiFvNLByVdH/rL6HXxczA8dH0vMyzIfQyonx
	MqJ+v2yZfRXYQtg04/8sRBcqZ6hjIARdQMrQ8CETHNTulmuNvZLmNJ4O6e9P4OXllGmA
	JQM++rxGi3e68T2fdDNMDdngWysyKIwaYGbuUSD8SB1SMA62wg1taFZGKNj30//Mltae
	AvNFRZp+MMEi22pGkKCsBdlPazXQ7gcyXor+QV/4bDg9gotJ3/N2yzg/w/ThrB74dC0U
	1mCgWswKBGLKHHfaOpUAnZBIK5wXWq/HaShA+nL5eP3Vom+Lpjc1heyZWmCeOkWCCDQ0
	YhTA==
X-Gm-Message-State: AKwxyte2kK6H3dNR75l4W+0i1zf8jAYt1fMCczANPm8f8xiwW/jYysNM
	HOHSZgjK1kemfaAvXtASEudvOk0+1jgY4odnJVhLnQ==
X-Google-Smtp-Source: ACJfBos66JoJm6cC4PqbPq6OuGHNN4+m9A9vgyON4npp6oFpaodDDUeznbqgfYY2ksJErzU9F5xJodgRW8F4iH0Ex8g=
X-Received: by 10.200.7.133 with SMTP id l5mr8216487qth.91.1516299407307; Thu,
	18 Jan 2018 10:16:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.190.142 with HTTP; Thu, 18 Jan 2018 10:16:46 -0800 (PST)
X-Originating-IP: [47.220.159.208]
In-Reply-To: <CA+YB3rZ2ZthR+bV0RZR-Af4q4X1OhEWo4oy9YhizVbHDnw+=ug@mail.gmail.com>
References: <137d31ae-329e-53ff-f495-259168b787d5@balister.org>
	<CAGAf8Lws8HfvDvMvdpgXyTvKaVpmf5a1UUTbBc2OrTpw=mgPNA@mail.gmail.com>
	<CAHQecY5FEt0jMY97Cfq7tR4KAETqied0t3zfFgXw=J5YBSz53A@mail.gmail.com>
	<f94fc2c7-032a-651a-a0d2-d5860f133b6c@balister.org>
	<CA+YB3rZ2ZthR+bV0RZR-Af4q4X1OhEWo4oy9YhizVbHDnw+=ug@mail.gmail.com>
From: darknighte <darknighte@darknighte.com>
Date: Thu, 18 Jan 2018 12:16:46 -0600
Message-ID: <CAKM2CVKDwg3-kTRaY87+0v5=n0MCaA34bLE4=roKwvfFGUe0Pg@mail.gmail.com>
To: Jeff Osier-Mixon <jefro@jefro.net>
Cc: Zoran Stojsavljevic <zoran.stojsavljevic@gmail.com>,
	Yocto Project <yocto@yoctoproject.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [yocto] OpenEmbedded developer meeting Sunday before ELC in Portland
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 18 Jan 2018 18:16:46 -0000
Content-Type: text/plain; charset="UTF-8"

Jefro, That sounds like a reasonable approach to me.  +1

On Thu, Jan 18, 2018 at 12:04 AM, Jeff Osier-Mixon <jefro@jefro.net> wrote:
>
>> We know. It is painful. YP Dev Day is the Thursday after, and I suspect
>> we would lose people waiting until Friday.
>
>
> SCaLE doesn't usually coincide the week before ELC, so this year was just
> bad timing from the universe.
>
> I propose we start with the board meeting at 9:30 and plan OEDAM to start at
> 10:30 to enable people to get there. We can have lunch late and go until 6
> if needed.
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

