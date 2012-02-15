Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Rxe9E-0003lQ-4y
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Feb 2012 13:39:48 +0100
Received: by lahc1 with SMTP id c1so965423lah.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Feb 2012 04:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=4TPzqzo5iZazUsGa5ToPNcsFURcQhPryvse8HZgZK/o=;
	b=Ndml3JvQ9jquDoUt/4ElddF+4a/r9zhxxg6BTGXkzzrKRkU5hTiu7VLiFVXODey1mE
	BpkgBz+zp0F40XXjLoj5wMgYtBvHasenvrmmSXZSFpl3QzNgtIlYbQFmZ2azU4jErC5u
	HYHANa/Ib5oO09u47zB5zPGRlLAVO0O5dHp0Y=
MIME-Version: 1.0
Received: by 10.152.129.69 with SMTP id nu5mr17975706lab.9.1329309096145; Wed,
	15 Feb 2012 04:31:36 -0800 (PST)
Received: by 10.112.108.164 with HTTP; Wed, 15 Feb 2012 04:31:36 -0800 (PST)
In-Reply-To: <CAP9ODKo3A3AMqLR701E39V5MykwUS7f55phQmGSNq6WdXFfYtA@mail.gmail.com>
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
Date: Wed, 15 Feb 2012 13:31:36 +0100
Message-ID: <CALbNGRTDR1zLZCUPfpUnXN_ezEpX0ehqo8ubY3Dafr4rw8_jDg@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Wed, 15 Feb 2012 12:39:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 14, 2012 at 5:22 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> On Tue, Feb 14, 2012 at 14:09, Andreas M=FCller
> <schnitzeltony@googlemail.com>wrote:
>
>> On Tue, Feb 14, 2012 at 1:51 PM, Otavio Salvador
>> <otavio@ossystems.com.br> wrote:
>> > No; The @ is to allow multiple instance. Look at
>> > http://www.freedesktop.org/software/systemd/man/systemd.unit.html
>> How about the old strategy for *@.service:
>> If there is only one *-systemd package with one entry in
>> SYSTEMD_SERVICE it will get *@.service?
>
>
> I think so.
>
> It is not easy to predict all possible usages but we ought to take this
> route and adjust it one the way. Once you do it and we start converting a=
ll
> recipes that use systemd class in meta-oe we'll most probably find many
> possible corner-cases to deal with.
>
Another corner case I would like to understand: What is the role of in
busybox syslog.service linking to dev/null. Within busybox itself it
seems not referenced.

Thanks in advance

Andreas


