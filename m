Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Rv5Nt-0007bD-2t
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Feb 2012 12:08:21 +0100
Received: by eekd41 with SMTP id d41so115722eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Feb 2012 03:00:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=qaGKhOsQlFB/6Lj7cw9kjvobnA8YY2UZEX78FfRohgo=;
	b=khA+KzoZmszWAu8pTMxZjlfKcQwLpXtCD2ae95/g5OvyrJXkYy3LGPNEfMfO80rH33
	9T6zSV4WV/9M1T2iEq+RnB4qeIuU0f0fPdtLyjlpZo3YitGi+DUwX/WI9PQgqNUGazVZ
	fn/XDh5VYokxu1MzAFsr2NJ2tmVHRy2SgFV/o=
MIME-Version: 1.0
Received: by 10.14.48.65 with SMTP id u41mr6226872eeb.39.1328698818017; Wed,
	08 Feb 2012 03:00:18 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.14.96.129 with HTTP; Wed, 8 Feb 2012 03:00:17 -0800 (PST)
In-Reply-To: <jgtb5c$8oh$1@dough.gmane.org>
References: <1328627573-5217-1-git-send-email-schnitzeltony@googlemail.com>
	<CAP9ODKpi+WWUuf7iP8QgJK2vgmM3KAgS0Fkhbu3eEy80L2eszA@mail.gmail.com>
	<4F31C45B.1010600@linux.intel.com> <jgtb5c$8oh$1@dough.gmane.org>
Date: Wed, 8 Feb 2012 09:00:17 -0200
X-Google-Sender-Auth: syIVbFPF46qvLAVcg8ncfyxQRVs
Message-ID: <CAP9ODKpDe4Up_mCuRdTqNY6a-Kkxyz2ZR-GR9uQ+VFFW0HGsJQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe][RFC 00/27] systemd / initmanager rework
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
X-List-Received-Date: Wed, 08 Feb 2012 11:08:21 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Feb 8, 2012 at 06:18, Koen Kooi <koen@dominion.thruhere.net> wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 08-02-12 01:39, Joshua Lock schreef:
> > It looks like systemd provides various interfaces and API's that packages
> > may or may not use and as more packages adopt these we're going to need
> > to be able to enable/disable more than just some unit files/scripts for
> > init support.
>
> Most (if not all) of those APIs are designed to be used with or without
> systemd as initmanager, that is why there are seperate shared libraries. I
> need to double check, but polkit might be the only exception to that in
> that
> it needs to have systemd actuall running. But multi-seat is broken anyway
> currently, so not much difference for the end user either way :)
>

Well, it being broken or not doesn't change that it explicitly depends on
systemd. We also ought to have a design that will work when this works and
it seems, up to now, that distro  feature is the only solution  for now.
I'd love to have it as an image feature but it seems it won't be easily
doable.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

