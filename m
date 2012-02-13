Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1RwunA-0004iz-4F
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Feb 2012 13:14:00 +0100
Received: by lahc1 with SMTP id c1so4034964lah.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Feb 2012 04:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=4+SA7+IhQiYacAKnXCmrSAwvS40wMiGchZahxQDFiQ0=;
	b=o6HE6J5dDpEe9TwJhq4F0k+lzSRbZ2fTyV+AZC1fZOO7q8CI/B718HZpnvIHyAbkvN
	3oXwLOyMuRbJeIyLmEJKO7Z2Ld1NjJgYC0hZ4FGOtHnTOhdpJfrUeFuVpHSdikBYaG3L
	2/SN8Ec+yrhIM3r+jEiykmKL35j4zVNC44Wuo=
MIME-Version: 1.0
Received: by 10.152.127.136 with SMTP id ng8mr11116784lab.16.1329134750664;
	Mon, 13 Feb 2012 04:05:50 -0800 (PST)
Received: by 10.112.108.164 with HTTP; Mon, 13 Feb 2012 04:05:50 -0800 (PST)
In-Reply-To: <CAP9ODKotC11Gh+bcOz9vgqNMacdwykydJ1G=e7rjr_HKVa6U4w@mail.gmail.com>
References: <1328925603-2967-1-git-send-email-schnitzeltony@googlemail.com>
	<1328925603-2967-6-git-send-email-schnitzeltony@googlemail.com>
	<CAP9ODKqeT+AZKUUiyYkbq4sKmo2espHinOfeBLQ0TfYEJZ3MfA@mail.gmail.com>
	<CALbNGRTiMWuLSuXsKfQV4ntHfVY5ovuBYrD0w41790Qa_u79Jg@mail.gmail.com>
	<CAP9ODKotC11Gh+bcOz9vgqNMacdwykydJ1G=e7rjr_HKVa6U4w@mail.gmail.com>
Date: Mon, 13 Feb 2012 13:05:50 +0100
Message-ID: <CALbNGRQDy7E4ND7amsgiBuzo12o=umbW1kokYBgqyPoTaXbTCg@mail.gmail.com>
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
X-List-Received-Date: Mon, 13 Feb 2012 12:14:00 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 13, 2012 at 11:42 AM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> On Sun, Feb 12, 2012 at 20:15, Andreas M=FCller
> <schnitzeltony@googlemail.com>wrote:
>
>> If there is one *-systemd package with one entry in SYSTEMD_SERVICE,
>> the whole directory is installed - otherwise only the files found in
>> SYSTEMD_SERVICE. If a recipe installs too much or something is
>> missing, it can be corrected in recipe.
>>
>
> If for example I put two .socket files, your algorithm will break. That's
> why I said you need to parse it. It is not that difficult as the logic is
> the same as the wrapper used in rootfs generation.
Sorry - but which which wrapper do you mean?

Andreas


