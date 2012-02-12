Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1RwhpE-00039U-Hp
	for openembedded-devel@lists.openembedded.org;
	Sun, 12 Feb 2012 23:23:16 +0100
Received: by lahc1 with SMTP id c1so3692096lah.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Feb 2012 14:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=6YcnKKn68QDM7ZlBfrN7JLbuRWzT5ubqGiUsU0v4J3c=;
	b=nnln3ia8Kw3edWH3z7nAPmSTjFwPkd0EEegXxXgfYnIYmUUEktANuV9yGmrVwacmZE
	OsWis1yIiTxPyDfsk/NxDbXsRZ8jgH156IxLXMs/eeGifMGBT+H53f71n4BMGcLxrRxO
	BGQzucuHWxVDqk0yZPSITM1zXMYQQk0JI0oVc=
MIME-Version: 1.0
Received: by 10.152.127.136 with SMTP id ng8mr9719463lab.16.1329084907838;
	Sun, 12 Feb 2012 14:15:07 -0800 (PST)
Received: by 10.112.108.164 with HTTP; Sun, 12 Feb 2012 14:15:07 -0800 (PST)
In-Reply-To: <CAP9ODKqeT+AZKUUiyYkbq4sKmo2espHinOfeBLQ0TfYEJZ3MfA@mail.gmail.com>
References: <1328925603-2967-1-git-send-email-schnitzeltony@googlemail.com>
	<1328925603-2967-6-git-send-email-schnitzeltony@googlemail.com>
	<CAP9ODKqeT+AZKUUiyYkbq4sKmo2espHinOfeBLQ0TfYEJZ3MfA@mail.gmail.com>
Date: Sun, 12 Feb 2012 23:15:07 +0100
Message-ID: <CALbNGRTiMWuLSuXsKfQV4ntHfVY5ovuBYrD0w41790Qa_u79Jg@mail.gmail.com>
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
X-List-Received-Date: Sun, 12 Feb 2012 22:23:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 11, 2012 at 2:12 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> On Sat, Feb 11, 2012 at 00:00, Andreas M=FCller
> <schnitzeltony@googlemail.com>wrote:
>
>> In case SYSTEMD_SERVICE contains only one *.service file, the whole fold=
er
>> ${base_libdir}/systemd/system/ is added to FILES_* otherwise only the
>> *.service
>> files found in SYSTEMD_SERVICE.
>>
Off topic: My intention was to install the whole directory for recipes
with one service per package AND one *-systemd package (this case is
not catched by my code - so there will be a V2)
>
> It seems you'll need to parse the service file and check if it installs
> others. For example .socket files usually do that. And then you'll never
> add the whole dir automatically but dependently of the services it needs =
to
> install.
>
I am afraid this goes a bit to far and causes confusion what is
packed. I would prefer the simple rule:

If there is one *-systemd package with one entry in SYSTEMD_SERVICE,
the whole directory is installed - otherwise only the files found in
SYSTEMD_SERVICE. If a recipe installs too much or something is
missing, it can be corrected in recipe.

What is common opinion here?

Andreas


