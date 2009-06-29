Received: from [209.85.200.171] (helo=wf-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1MLIB2-0005ip-7y
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Jun 2009 16:49:48 +0200
Received: by wf-out-1314.google.com with SMTP id 25so944121wfa.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Jun 2009 07:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=kjSU+9Oh5aI8OUCP+JOJxYJtN/IkvtQDCUL6NZeDkRM=;
	b=RHGc8HbirrDaNO8PFvjoEjuNhtFx4ZcsS6WMm358Y3RXO/wVZ7w6RkaBBTYQjGHmF+
	IFjV9RaErNM+Aq4faZeSuvHYatppqSkxVwciZbiVC0EXCUCrKH3VAVA7nLMRTujsg3Wo
	U4D6S93IYBPXZeA8X/l6wRxjT1fEj1m+Ayqug=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=HwYvEvI51HisH8PoGvD7HYa7SVF6CycfMhf3kLDMlQUt3xCjTGl/oGgWasUixkff+u
	sXJAJmNqt08ZyTkquLKG6oEBg+XfW9Lxvn9jq/Waru9q6b8rc8Vp7I1ggHe/BgonmJMe
	MD2G8xn+xcyKt+Q0rMiSCcMDq5dUB1MAuWPjQ=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.142.97.20 with SMTP id u20mr1687703wfb.8.1246286285326; Mon, 
	29 Jun 2009 07:38:05 -0700 (PDT)
In-Reply-To: <200906291204.20912.marcin@juszkiewicz.com.pl>
References: <1246138179-23626-1-git-send-email-msmith@cbnco.com>
	<200906291204.20912.marcin@juszkiewicz.com.pl>
Date: Mon, 29 Jun 2009 07:38:05 -0700
X-Google-Sender-Auth: 3d76c8d3a4792d4d
Message-ID: <b6ebd0a50906290738r50b2389el3445c04541ad2a3c@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/2] source-checker: usability tweaks
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
X-List-Received-Date: Mon, 29 Jun 2009 14:49:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 29, 2009 at 3:04 AM, Marcin
Juszkiewicz<marcin@juszkiewicz.com.pl> wrote:
> Dnia sobota, 27 czerwca 2009 o 23:29:38 Michael Smith napisa=C5=82(a):
>
>> checksum sorter, source checker:
>
>> exit(1) on failure;
>
> OK with it
>
>> send usage to stderr;
>
> NACK - most of tools which I use use stdout for --help/usage stuff.
>
>> make executable
>
> OK
>
>> checksum sorter:
>
>> read from stdin if no arg;
>
> OK
>
>> accept --inplace option to read and write from the same file.
>
> Idea nice but:
>
> 12:00 hrw@home:openembedded$ contrib/source-checker/oe-checksums-
> sorter.py -i conf/checksums.ini
> Traceback (most recent call last):
> =C2=A0File "contrib/source-checker/oe-checksums-sorter.py", line 104, in
> <module>
> =C2=A0 =C2=A0os.rename(outfn, args[0])
> OSError: [Errno 18] Invalid cross-device link
>
> /tmp/ is tmpfs, /home/ is ext3 and Python documentation says "The
> operation may fail on some Unix flavors if src and dst are on different
> filesystems".

This should be using shutil.move(), which knows to use rename when
possible and copy/unlink when not.
--=20
Chris Larson
clarson at kergoth dot com
clarson at mvista dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Software Engineer
MontaVista Software, Inc.


