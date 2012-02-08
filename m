Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RvAbc-0002hk-6y
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Feb 2012 17:42:52 +0100
Received: by eaal10 with SMTP id l10so197243eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Feb 2012 08:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=9UrqZsbpAWVbN4/7LhcuoAjijAG0ZMc2yKQQeWCg3HM=;
	b=kJ9JziCSHnWk5z3mQFa0Dil5KuaQsj7rT5IzBfL0xCB3bbFEEuUUR+GM/Kj0X7IvRP
	eVTxS8ADt7wpVSoGJm1gFhghU0D/BzNVEHSlJ09YsyeDK2fl2gotd7fQMc+PMYz/EHIm
	7jBdUTIikppL6c0MNUWzrqRyvUx0u9asNPi9E=
MIME-Version: 1.0
Received: by 10.14.48.65 with SMTP id u41mr6632670eeb.39.1328718888153; Wed,
	08 Feb 2012 08:34:48 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.14.96.129 with HTTP; Wed, 8 Feb 2012 08:34:48 -0800 (PST)
In-Reply-To: <E9FE936C-E077-4187-ACE4-5BCA6806A89C@dominion.thruhere.net>
References: <1328705404-24406-1-git-send-email-koen@dominion.thruhere.net>
	<CAP9ODKrAap_fWH_YRTn26ujwt-DwfO7enzprODPJk7iH=Z+AfA@mail.gmail.com>
	<E9FE936C-E077-4187-ACE4-5BCA6806A89C@dominion.thruhere.net>
Date: Wed, 8 Feb 2012 14:34:48 -0200
X-Google-Sender-Auth: 2AYDh5wTsClyqgZk7s7-PrD2hNA
Message-ID: <CAP9ODKqKXWKNWASct1gc-ehswVeczt-LswTKC_gaBikSSjyZ_A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Koen Kooi <koen@dominion.thruhere.net>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe] systemd: split out libraries from ${PN}
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
X-List-Received-Date: Wed, 08 Feb 2012 16:42:52 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Feb 8, 2012 at 14:31, Koen Kooi <koen@dominion.thruhere.net> wrote:

> ...
>
> +                ${libdir}/binfmt.d \
> > +                ${libdir}/modules-load.d \
> > +                ${libdir}/sysctl.d \
>
> It's not unrelated, FILES_${PN} changed from += to =, so we need to mop up
> the stray files.
>

Those are new files being added, not ones handled by standard FILES_${PN}
matching so += to = doesn't justify this.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

