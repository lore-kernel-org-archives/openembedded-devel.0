Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Rgblu-0005si-3j
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Dec 2011 13:41:18 +0100
Received: by eaal1 with SMTP id l1so12441661eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Dec 2011 04:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=nU55nZ7yZTFydjna92i5IR6G1Po+2Sx40BzctEptAC8=;
	b=KGgNXeXiCKSWZZCOOofF+0ffdGKW1/D88Fwt5vg262CGfniAcg6ktHToGBsgHb2Pkj
	5If7pcrSp+ktipUWBweqHZNENu3pioBVqbO5eyIz6BCA6g7ytKHVnGXNHCKiSa7jcIMV
	+zLQzwtPqiBSN8/3enutHbwQlWiVpa0TRoiFM=
MIME-Version: 1.0
Received: by 10.205.143.18 with SMTP id jk18mr9215520bkc.1.1325248442496; Fri,
	30 Dec 2011 04:34:02 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.78.79 with HTTP; Fri, 30 Dec 2011 04:34:02 -0800 (PST)
In-Reply-To: <jdk9ml$cdj$1@dough.gmane.org>
References: <cover.1325091927.git.otavio@ossystems.com.br>
	<2eaa23a3419bfd9b5aea6c1f059242a38eb03608.1325091927.git.otavio@ossystems.com.br>
	<jdk9ml$cdj$1@dough.gmane.org>
Date: Fri, 30 Dec 2011 10:34:02 -0200
X-Google-Sender-Auth: WVE5KXmjHfeOmjcVhoZqmBpqSVY
Message-ID: <CAP9ODKofagU06q-121M8=RZHSsBP7w1WzwncUJx3pLq19+cV1A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe][PATCH 1/1] xserver-nodm-init: move systemd service to xserver-nodm-init-systemd
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
X-List-Received-Date: Fri, 30 Dec 2011 12:41:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Dec 30, 2011 at 10:09, Koen Kooi <koen@dominion.thruhere.net> wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 28-12-11 18:05, Otavio Salvador schreef:
> > Move systemd service to xserver-nodm-init-systemd to be consistent with
> > other packages.
> >
> > Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>
> I'm not going to merge such patches unless a reasonable effort has been
> made
> to tasks/images using the packages in question.
> The breakage caused by patches like this is too subtle to notice
> immediately
> since doing $packagemanager upgrade will now silently remove the startup
> units. Similar breakage when using tasks, building images, etc.
>

This is fixing a  broken and completely wrong package change done by you
at 4ad7ec43564fd7ab9c5d50dfcccd4a59308dbcb1; this sholdn't have been done
this way and systemd is still not well set in Meta-OE. Images and tasks
using it (I use it) ought to keep an eye on change that might affect them.

I agree this is subtle but this needs to be done so we can get systemd
integration process further. You not merging this won't fix the problem.

The only missing change I noticed is in meta-efl and I will send another
patch for it in next pull request but do a second though about merging it,
please.

And I have the holidays off, so most patches need to wait till the second
> week of january.
>

No problem.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

