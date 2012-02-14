Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RxLHY-0002yn-HW
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Feb 2012 17:31:08 +0100
Received: by eekd41 with SMTP id d41so51708eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Feb 2012 08:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=FddqaBC0jGeey2AnQSk6cgexYUSohfvDlOT8urYoeDI=;
	b=B8ruHAESvBtySKyQP0FHVDMwOM8gQodoyZJkgIg7/PBHhX36TBJEt+xNS1CmoLnxL/
	Rnq1Rsl9hqgoyVutGSRHGehIlyClXrmYyR82mlo9f3VJXGaEOpljGbi8EyCET8hZB8Yx
	4w8DU45WZ6sLjHjsiutXNOwN/ghhcSOUafN24=
MIME-Version: 1.0
Received: by 10.213.14.147 with SMTP id g19mr576811eba.126.1329236576366; Tue,
	14 Feb 2012 08:22:56 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.14.96.129 with HTTP; Tue, 14 Feb 2012 08:22:56 -0800 (PST)
In-Reply-To: <CALbNGRQvP7A=oz6mtM8hZ6wO6+esQQ6KR4nmV4DXhY=eonAAtA@mail.gmail.com>
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
Date: Tue, 14 Feb 2012 14:22:56 -0200
X-Google-Sender-Auth: 7qf2YtiE0az6V2KNsG97JJ24iQo
Message-ID: <CAP9ODKo3A3AMqLR701E39V5MykwUS7f55phQmGSNq6WdXFfYtA@mail.gmail.com>
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
X-List-Received-Date: Tue, 14 Feb 2012 16:31:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 14, 2012 at 14:09, Andreas M=FCller
<schnitzeltony@googlemail.com>wrote:

> On Tue, Feb 14, 2012 at 1:51 PM, Otavio Salvador
> <otavio@ossystems.com.br> wrote:
> > No; The @ is to allow multiple instance. Look at
> > http://www.freedesktop.org/software/systemd/man/systemd.unit.html
> How about the old strategy for *@.service:
> If there is only one *-systemd package with one entry in
> SYSTEMD_SERVICE it will get *@.service?


I think so.

It is not easy to predict all possible usages but we ought to take this
route and adjust it one the way. Once you do it and we start converting all
recipes that use systemd class in meta-oe we'll most probably find many
possible corner-cases to deal with.

--=20
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

