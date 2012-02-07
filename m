Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RuoCq-0001Pq-Fd
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Feb 2012 17:47:48 +0100
Received: by eaal10 with SMTP id l10so1978772eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Feb 2012 08:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=kpCOZf9swD9LL/+dV2ij5+TVmZV+cxdl9Brqi4DEo6U=;
	b=HCDJMTLr4EGE+FXWMNB9DI+tHeFWqa4cRN3hD02ETXxH8h73cf5sztWt79t8xpYKdj
	RkMfSYcB2jaLLMAXn/mrfmhWl3zLTiHZEPRS/e+d3ha50lYuYu8mdSpL7ys37T5WaCgg
	GHrvuPMXUl/yMvrz1R9MtmVOl7ZfLwpNcKbWc=
MIME-Version: 1.0
Received: by 10.213.113.143 with SMTP id a15mr2235394ebq.50.1328632786041;
	Tue, 07 Feb 2012 08:39:46 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.14.96.129 with HTTP; Tue, 7 Feb 2012 08:39:45 -0800 (PST)
In-Reply-To: <CALbNGRSLWbSeg2+emALSf+t0T+9vfRhj5Mq1gFa3otQuO-z4-Q@mail.gmail.com>
References: <1328627573-5217-1-git-send-email-schnitzeltony@googlemail.com>
	<CALbNGRSLWbSeg2+emALSf+t0T+9vfRhj5Mq1gFa3otQuO-z4-Q@mail.gmail.com>
Date: Tue, 7 Feb 2012 14:39:45 -0200
X-Google-Sender-Auth: oisxqmnfQR6k56WosJp6dfsoYWI
Message-ID: <CAP9ODKqtHO80e4dV66cNyDjmHx2P6NnpgdgqAmEcjm8Z8WJXrA@mail.gmail.com>
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
X-List-Received-Date: Tue, 07 Feb 2012 16:47:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 7, 2012 at 14:35, Andreas M=FCller
<schnitzeltony@googlemail.com>wrote:

> On Tue, Feb 7, 2012 at 4:12 PM, Andreas M=FCller
> <schnitzeltony@googlemail.com> wrote:
> >  What I have already
> >  detected after a build from scatch is that /var/lib/opkg is missing in
> the
> >  image (although it can be found in libopkg.ipk).
> Hmm Last night I had a build from scratch without these patches and
> have the same - this seems a different issue...


You need to add package-management onto IMAGE_FEATURES or it will be
dropped if all postinst has runned fine in rootfs generation.

--=20
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

