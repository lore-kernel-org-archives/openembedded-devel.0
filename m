Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1RxlQz-0004rs-Kr
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Feb 2012 21:26:37 +0100
Received: by lahc1 with SMTP id c1so1531721lah.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Feb 2012 12:18:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=T6iJ8L5MopuS0WbZxBbnmjuf75tp4kHJ668GDz6Us4E=;
	b=UrzIRfieV0TlxuYQ8WMYbJmk9uf7ov4JG/sTgC7YrhvzRFKZA5TYx0YDxMN+pIezRR
	8v8jcgzvswgx5deqkiLZTJquOm5aqOBTQ9kuTgCQORnW5dTEpi0FJsNTwOZIbYbBBW34
	OGWEkkqf6abkpRRIhVlA0CG1Ssj0gudiVHuec=
MIME-Version: 1.0
Received: by 10.152.145.137 with SMTP id su9mr18736476lab.23.1329337105487;
	Wed, 15 Feb 2012 12:18:25 -0800 (PST)
Received: by 10.112.108.164 with HTTP; Wed, 15 Feb 2012 12:18:25 -0800 (PST)
In-Reply-To: <CALbNGRRP_veCduOS0wi_5XZZsZ3GbavD3+MExJ_D+RubKwBQaw@mail.gmail.com>
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
	<CAP9ODKq2MjMnz7wEVA+ho5HWntxFw42e6rVuc-7VLob-9hzFfQ@mail.gmail.com>
	<CALbNGRQp1xFLUECjtg78gy1-8vYpUwB-G4xjCKn_80paA2Ymnw@mail.gmail.com>
	<CAP9ODKr9O8Ff2PPDBfTmgOYwJT8sExKcGs00-PfvzS=3O31dGw@mail.gmail.com>
	<CALbNGRRP_veCduOS0wi_5XZZsZ3GbavD3+MExJ_D+RubKwBQaw@mail.gmail.com>
Date: Wed, 15 Feb 2012 21:18:25 +0100
Message-ID: <CALbNGRS3vrD00yLaGpkRrU8SXTwdKNQiqEVnV_aB9p7F0rHa-g@mail.gmail.com>
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
X-List-Received-Date: Wed, 15 Feb 2012 20:26:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 15, 2012 at 9:07 PM, Andreas M=FCller
<schnitzeltony@googlemail.com> wrote:
> On Wed, Feb 15, 2012 at 8:55 PM, Otavio Salvador
> <otavio@ossystems.com.br> wrote:
>> On Wed, Feb 15, 2012 at 17:53, Andreas M=FCller
>> <schnitzeltony@googlemail.com>wrote:
>>
>>> For test I did with a bunch of recipes
>>>
>>> 1. build from scratch with unmodified sources
>>> 2. Applied sytemd-patches and the 'cleanup'-patches (removing obsolete
>>> systemd code in recipes)
>>> 3. build recipes again
>>> 4. compared the results with buildhistory
>>>
>>> Results are as expected except one issue I don't understand:
>>>
>>> The sizes of the *-dbg packages are reduced. Some reduce to less than
>>> half. Has anybody a good explanation for this?
>>
>>
>> No good guess about possible reasoning.
>>
> I did further checks: seems many many source code files are missing
> (example - see attachment). Strange is that the value for FILES has
> not changed! =A0What have done to cause that - or is this unrelated to
> my modifications?
>
*All* source files are missing. Which part of oe is responsible, packing th=
ese?

Andreas


