Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RxHyc-0003IF-K8
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Feb 2012 13:59:22 +0100
Received: by eaal10 with SMTP id l10so1796630eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Feb 2012 04:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=RZXMIbMiMvzX8hyltIhjKDyur/n1vwUlbGOzqO9ayak=;
	b=Qg5eEzEbuIQ0nGv9fsafsyVgquwwdREF7xL2sh6AJAF/YqkuweYBO2y9dI/lepbA+W
	9b+UBY2ivVpjPAf8sJJvk9PYLGQW68azQ+nVzuKyNyPOq61GThmLqsN9t7p2npwXjHHv
	9I8s8YXi+LShvNUtNQSrxJS9MdijBXGueUII0=
MIME-Version: 1.0
Received: by 10.213.14.147 with SMTP id g19mr425224eba.126.1329223871992; Tue,
	14 Feb 2012 04:51:11 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.14.96.129 with HTTP; Tue, 14 Feb 2012 04:51:11 -0800 (PST)
In-Reply-To: <CALbNGRS-g-kXkEYdxkcwbAum2kqbg5a79=QCoV8eYm2TpwWh9w@mail.gmail.com>
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
Date: Tue, 14 Feb 2012 10:51:11 -0200
X-Google-Sender-Auth: icV9CVOZ2-yMQoOVtmHJ-vO30_A
Message-ID: <CAP9ODKqXfNBpQ7J6rEcFkFKXX5LspymGtQ0SNBh_jMX=pGyFHQ@mail.gmail.com>
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
X-List-Received-Date: Tue, 14 Feb 2012 12:59:22 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 14, 2012 at 10:42, Andreas M=FCller
<schnitzeltony@googlemail.com>wrote:

> Currently I am testing the automatic parsing for different recipes.
> Following the 'After=3D' and 'WantedBy=3D' works fine but before sending
> out I would like to get some comments on the following
> assumptions/questions:
>
> * There is no need for recipes to install links for 'WantedBy' entries
> since systemd-systemctl-native takes care. E.G the code in
> lightttpd_1.4.30.bbappend for this can be removed (it works on the
> wrong paths anyway) -> there is no need for systemd.bbclass to follow
> 'WantedBy'. Correct?
>

Links ought to be kept to be handled by systemd-systemctl-native.


> * For dropbear_2011.54.bbappend, the automatic parsing leaves
> dropbear@.service and dropbear.service ( link to /dev/null ) unpacked.
> In dropbear.socket there is 'Conflicts=3Ddropbear.service'. Shall the
> algorithm follow also services linked by Conflicts=3D and pack those
> service files?
>

The /dev/null link is to force disable the init script. This is difficult
to do automatically so for now I'd say to do it byhand.


> * dropbear_2011.54.bbappend: Is dropbear@.service a candidate for a
> second *-systemd packet?
>

No; The @ is to allow multiple instance. Look at
http://www.freedesktop.org/software/systemd/man/systemd.unit.html


> * are there other keys which might need follow-up too?
>

Not that I am aware of at this moment.

--=20
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

