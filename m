Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RwtUu-00034m-K5
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Feb 2012 11:51:04 +0100
Received: by eaal10 with SMTP id l10so1441083eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Feb 2012 02:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=acq1Pr0lfh403AZEKkU6boewx7OKaFUZQvDkW3180a0=;
	b=PfFtY9k0zNv9N5aH1rpMdi7cdOcpaCdiGb2jrSdIrc0PyzRgm2wf9I4xjaxXhnMsgK
	hteFA5LLOa/GtK4V8Xk61ENy97lcfNI52HfkSuV4ns25vOmHqUSniU1cfP5aRZ5TO2lw
	5Q4m745EKv0y+yWqGhYXZihjBERZlkZMF5Q6M=
MIME-Version: 1.0
Received: by 10.14.52.17 with SMTP id d17mr4995955eec.56.1329129775277; Mon,
	13 Feb 2012 02:42:55 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.14.96.129 with HTTP; Mon, 13 Feb 2012 02:42:55 -0800 (PST)
In-Reply-To: <CALbNGRTiMWuLSuXsKfQV4ntHfVY5ovuBYrD0w41790Qa_u79Jg@mail.gmail.com>
References: <1328925603-2967-1-git-send-email-schnitzeltony@googlemail.com>
	<1328925603-2967-6-git-send-email-schnitzeltony@googlemail.com>
	<CAP9ODKqeT+AZKUUiyYkbq4sKmo2espHinOfeBLQ0TfYEJZ3MfA@mail.gmail.com>
	<CALbNGRTiMWuLSuXsKfQV4ntHfVY5ovuBYrD0w41790Qa_u79Jg@mail.gmail.com>
Date: Mon, 13 Feb 2012 08:42:55 -0200
X-Google-Sender-Auth: 3hhSZTmiP8m-G0fFsgIl6Nvt7_Y
Message-ID: <CAP9ODKotC11Gh+bcOz9vgqNMacdwykydJ1G=e7rjr_HKVa6U4w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe 6/7] systemd.bbclass: automatically extend FILES_* for systemd packages
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
X-List-Received-Date: Mon, 13 Feb 2012 10:51:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 12, 2012 at 20:15, Andreas M=FCller
<schnitzeltony@googlemail.com>wrote:

> If there is one *-systemd package with one entry in SYSTEMD_SERVICE,
> the whole directory is installed - otherwise only the files found in
> SYSTEMD_SERVICE. If a recipe installs too much or something is
> missing, it can be corrected in recipe.
>

If for example I put two .socket files, your algorithm will break. That's
why I said you need to parse it. It is not that difficult as the logic is
the same as the wrapper used in rootfs generation.

--=20
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

