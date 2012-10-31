Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TTXdq-0000bM-Sf
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Oct 2012 13:43:31 +0100
Received: by mail-pa0-f47.google.com with SMTP id fa11so856110pad.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Oct 2012 05:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=bKj//5sc4wMM220cdZ72u8cXmDg5gE5hmafLOsvo+qQ=;
	b=dnGEleDqnFuEcq7ZzgkTMKm9b4YHyCU7DEVM7LANlXWUALeNmYDircDBE+sfFroysp
	hYWFGOLk82MfA0yWOthytGX8rPHy1aqpnjKAQ+y2ClEH4rCzZWV98SCsMQxEf7KtWr3a
	r8R0kwAibgRPuw/WcFVOJHOqp0g/9ahkHOGR6/bvgRM5oXT+lzOdnfQXl9o3pxlYBqxI
	Ugs7B4myFmlzuOjqZaVQPysAD4lJLEnlMU781enRMvPX451H1P4ueu0kCjl+7ea9GN1J
	N0SKE1go8RU0CR4BXnnzc5CVde7fenKNavHVV2nwihz0CuwsoszVFaEPIP00kYY0rkxM
	Ru1A==
MIME-Version: 1.0
Received: by 10.68.213.33 with SMTP id np1mr111678194pbc.64.1351686593580;
	Wed, 31 Oct 2012 05:29:53 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.40.201 with HTTP; Wed, 31 Oct 2012 05:29:53 -0700 (PDT)
In-Reply-To: <1351685961.13864.101.camel@phil-desktop>
References: <1351681706-12778-1-git-send-email-otavio@ossystems.com.br>
	<50910EFB.7010804@gmail.com>
	<1351685486.13864.97.camel@phil-desktop>
	<50911500.6010207@gmail.com>
	<1351685961.13864.101.camel@phil-desktop>
Date: Wed, 31 Oct 2012 10:29:53 -0200
X-Google-Sender-Auth: kOl01quNFgIRLQwYBnN3dqLf_VA
Message-ID: <CAP9ODKq=8EwPNT3wqGAnVuweEj4wwYNGKLhhzHUaP0H-gRSnQg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v2 1/3] meta-systemd: Move ntp recipes to 'meta-networking' sublayer
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
X-List-Received-Date: Wed, 31 Oct 2012 12:43:31 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 31, 2012 at 10:19 AM, Phil Blundell <philb@gnu.org> wrote:
> On Wed, 2012-10-31 at 13:09 +0100, Martin Erts=E5s wrote:
>> Should we just leave the .service files broken then, until someone
>> registers a pool? Or are we allowed to use someone else's pool?
>
> I don't think just using someone else's pool without asking them would
> be a terribly polite way to proceed.
>
> It seems like your options are:
>
> a) Make it be a DISTRO setting, punt this problem to the distribution,
> and let them figure out what to do about it.
>
> b) Make the service files take the NTP server from DHCP rather than
> having it be hard-coded.
>
> c) Approach ntp.org to get a vendor zone for OE and have it be the
> default.
>
> d) Use your own NTP server, or one provided by a Yocto-affiliated
> organisation.
>
> e) Leave the files alone.

Well, I cannot ask for a pool zone for OE or Yocto; it'd be good but
it is not yet done and I prefer to have it merged and changed once it
happens.

--=20
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


