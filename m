Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RxeDd-0003zZ-6T
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Feb 2012 13:44:22 +0100
Received: by vcbfl15 with SMTP id fl15so795564vcb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Feb 2012 04:36:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=bPBAy5KJqJPPvEJZe+D2QFbuoOPABTflWghwCSrMgmA=;
	b=pN4uuDQOZeOnu18B7G+0Qg1HgzmUDLjkoaR6CtQKyfaRZWMoXmsAD9N2fEiX2nivx+
	8IZ2mRX45xwZhNATKSdl/FdmV93bvNY2BFGyOTADrTpaUFJwjT8gzDYedoVG6BXaHO+q
	zD04Yprv8kuVfGBJnVTmBEAlEbYSROypOY3u0=
MIME-Version: 1.0
Received: by 10.52.66.225 with SMTP id i1mr10970861vdt.65.1329309367629; Wed,
	15 Feb 2012 04:36:07 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.220.3.84 with HTTP; Wed, 15 Feb 2012 04:36:07 -0800 (PST)
In-Reply-To: <CALbNGRTDR1zLZCUPfpUnXN_ezEpX0ehqo8ubY3Dafr4rw8_jDg@mail.gmail.com>
References: <1328925603-2967-1-git-send-email-schnitzeltony@googlemail.com>
	<1328925603-2967-6-git-send-email-schnitzeltony@googlemail.com>
	<CAP9ODKqeT+AZKUUiyYkbq4sKmo2espHinOfeBLQ0TfYEJZ3MfA@mail.gmail.com>
	<CALbNGRTiMWuLSuXsKfQV4ntHfVY5ovuBYrD0w41790Qa_u79Jg@mail.gmail.com>
	<CAP9ODKotC11Gh+bcOz9vgqNMacdwykydJ1G=e7rjr_HKVa6U4w@mail.gmail.com>
	<CALbNGRQDy7E4ND7amsgiBuzo12o=umbW1kokYBgqyPoTaXbTCg@mail.gmail.com>
	<CAP9ODKoXeBf_vctM7pcHTZd2-fMacN+kk8z9af18h9rkyDGVWQ@mail.gmail.com>
	<CALbNGRQ1uf__SnyW5nz1mfOh45DgKyVmjQ3oFS-VBLOyiHVZig@mail.gmail.com>
	<CAP9ODKq=i_jLUHcB+L1marL7Ymz261LZGC26Q49Bfvm+E4tm5g@mail.gmail.com>
	<CALbNGRS-g-kXkEYdxkcwbAum2kqbg5a79=QCoV8eYm2TpwWh9w@mail.gmail.com>
	<CAP9ODKqXfNBpQ7J6rEcFkFKXX5LspymGtQ0SNBh_jMX=pGyFHQ@mail.gmail.com>
	<CALbNGRQvP7A=oz6mtM8hZ6wO6+esQQ6KR4nmV4DXhY=eonAAtA@mail.gmail.com>
	<CAP9ODKo3A3AMqLR701E39V5MykwUS7f55phQmGSNq6WdXFfYtA@mail.gmail.com>
	<CALbNGRTDR1zLZCUPfpUnXN_ezEpX0ehqo8ubY3Dafr4rw8_jDg@mail.gmail.com>
Date: Wed, 15 Feb 2012 10:36:07 -0200
X-Google-Sender-Auth: 1dwMP6jXWSauDnwWqrbO2S0gWd0
Message-ID: <CAP9ODKq2MjMnz7wEVA+ho5HWntxFw42e6rVuc-7VLob-9hzFfQ@mail.gmail.com>
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
X-List-Received-Date: Wed, 15 Feb 2012 12:44:22 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 15, 2012 at 10:31, Andreas M=FCller
<schnitzeltony@googlemail.com>wrote:

> Another corner case I would like to understand: What is the role of in
> busybox syslog.service linking to dev/null. Within busybox itself it
> seems not referenced.
>

To make it to use the .service file and not the init scripts compatibility.

--=20
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

