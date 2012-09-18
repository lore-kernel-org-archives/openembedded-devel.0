Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1TE09y-0004hD-Qj
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Sep 2012 17:56:27 +0200
Received: by obblz20 with SMTP id lz20so10817354obb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2012 08:43:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=bJf2iGwvjgaSbXBVR7CvcuT8kqf2vgwaFbxw6X2AoJY=;
	b=fbtURLxplIjUBy1ufqP5BAgN5gvJQ2sCullMVeNHNJC0WryDK3s4qo1sgp7wQm/b7B
	utzHhKBPbZ7FvEQleMB2mi8qKdJu2zwgiYDhxJJJpUQZSBIFQlytyZfiumqi4B795NJt
	2AtUzlG1wcXzXTK8gDFYSVRdNJ0MESXGopoZ/s18lM/BCinee2nbQvj8g1JIH8Imes1z
	W8T4qgerRIgePhGDUJbAg9/hQu6jZXz4SrSUbcJEfbGY7gYpvrd5pBXDmVT9a8AuTwKb
	0VNzthfhC0i3e0rDvqI4bjPLVPr43ILZXR2Ig9U6ux/V+jTNZNWZfU/ZNHGtNxnORFjS
	wEeA==
Received: by 10.60.170.241 with SMTP id ap17mr483005oec.4.1347983026202; Tue,
	18 Sep 2012 08:43:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.76.93.35 with HTTP; Tue, 18 Sep 2012 08:43:26 -0700 (PDT)
X-Originating-IP: [89.121.200.106]
In-Reply-To: <E5E9389A-9AA7-4BE9-85A7-BD6D5DDC9A88@dominion.thruhere.net>
References: <CAK18fxHzC+3nrhVbsntm+3DbF=pzwtZoF8R0EcZ33z3G4uv9Mg@mail.gmail.com>
	<E5E9389A-9AA7-4BE9-85A7-BD6D5DDC9A88@dominion.thruhere.net>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Tue, 18 Sep 2012 18:43:26 +0300
Message-ID: <CAK18fxFZjKMhLU_UZZe4zOHjbdYpgmKydvdWAzr5c20Z=f9hUg@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQlvMswnFhgbT0MbcF7RWhxs5ntSEG+3ksQb00z2kP9OwsVX5NBtwOGcTC4C8U6lD8Ed8akv
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: openembedded <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe] zram service in meta-systemd
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
X-List-Received-Date: Tue, 18 Sep 2012 15:56:27 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Sep 18, 2012 at 6:35 PM, Koen Kooi <koen@dominion.thruhere.net>wrote:

>
> Op 18 sep. 2012, om 16:58 heeft Andrei Gherzan <andrei@gherzan.ro> het
> volgende geschreven:
>
> > Hello,
> >
> > I would like to move the zram service from meta-raspberrypi to
> meta-systemd. This is not specific to raspberrypi and can be used by others
> as well.
> > Koen, what do you think about this move? And if so, what recipes
> directory should i use? recipes-extended?
>
> What other machines use zram as well?


Don't know. What i'm sure of is that raspberry uses this and is included in
meta-rasberrypi even if this is not rpi specific.

ag

