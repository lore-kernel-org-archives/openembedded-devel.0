Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1RxHqa-00034L-0v
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Feb 2012 13:51:04 +0100
Received: by lahc1 with SMTP id c1so5038168lah.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Feb 2012 04:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=MKTStRiFbGcX1vzVghA7fJ1UGisBkTqz1yl5js1jwgE=;
	b=CzL0pYiHqLa++dRzBm9dgb92kQykw2oRHcsQ6W0cp5PL37vog/9XwuwluXOgK/h3LZ
	xmArnTJvrAJFxRJkJnACUz7mb89SsuyLGP+ar3SL1WJAnCszARRWA42akEpgF7Vx+geo
	jtXfyPVdIV498P+WHVZqFRiIqv9DGGDKyDPF8=
MIME-Version: 1.0
Received: by 10.152.145.137 with SMTP id su9mr14244262lab.23.1329223373265;
	Tue, 14 Feb 2012 04:42:53 -0800 (PST)
Received: by 10.112.108.164 with HTTP; Tue, 14 Feb 2012 04:42:53 -0800 (PST)
In-Reply-To: <CAP9ODKq=i_jLUHcB+L1marL7Ymz261LZGC26Q49Bfvm+E4tm5g@mail.gmail.com>
References: <1328925603-2967-1-git-send-email-schnitzeltony@googlemail.com>
	<1328925603-2967-6-git-send-email-schnitzeltony@googlemail.com>
	<CAP9ODKqeT+AZKUUiyYkbq4sKmo2espHinOfeBLQ0TfYEJZ3MfA@mail.gmail.com>
	<CALbNGRTiMWuLSuXsKfQV4ntHfVY5ovuBYrD0w41790Qa_u79Jg@mail.gmail.com>
	<CAP9ODKotC11Gh+bcOz9vgqNMacdwykydJ1G=e7rjr_HKVa6U4w@mail.gmail.com>
	<CALbNGRQDy7E4ND7amsgiBuzo12o=umbW1kokYBgqyPoTaXbTCg@mail.gmail.com>
	<CAP9ODKoXeBf_vctM7pcHTZd2-fMacN+kk8z9af18h9rkyDGVWQ@mail.gmail.com>
	<CALbNGRQ1uf__SnyW5nz1mfOh45DgKyVmjQ3oFS-VBLOyiHVZig@mail.gmail.com>
	<CAP9ODKq=i_jLUHcB+L1marL7Ymz261LZGC26Q49Bfvm+E4tm5g@mail.gmail.com>
Date: Tue, 14 Feb 2012 13:42:53 +0100
Message-ID: <CALbNGRS-g-kXkEYdxkcwbAum2kqbg5a79=QCoV8eYm2TpwWh9w@mail.gmail.com>
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
X-List-Received-Date: Tue, 14 Feb 2012 12:51:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 13, 2012 at 6:09 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> On Mon, Feb 13, 2012 at 14:38, Andreas M=FCller
> <schnitzeltony@googlemail.com>wrote:
>
>> > systemd-systemctl-native
>> Off list @Otavio: not boring but challenging...
>>
>> To reuse as much as possible: Is there a piece of code showing me how
>> to mix up shell/python code?
>
>
> Not that I am aware of but you can look at combo-layer script how to read
> and parse ini files; this ought to be very simple to do.
>
Currently I am testing the automatic parsing for different recipes.
Following the 'After=3D' and 'WantedBy=3D' works fine but before sending
out I would like to get some comments on the following
assumptions/questions:

* There is no need for recipes to install links for 'WantedBy' entries
since systemd-systemctl-native takes care. E.G the code in
lightttpd_1.4.30.bbappend for this can be removed (it works on the
wrong paths anyway) -> there is no need for systemd.bbclass to follow
'WantedBy'. Correct?

* For dropbear_2011.54.bbappend, the automatic parsing leaves
dropbear@.service and dropbear.service ( link to /dev/null ) unpacked.
In dropbear.socket there is 'Conflicts=3Ddropbear.service'. Shall the
algorithm follow also services linked by Conflicts=3D and pack those
service files?

* dropbear_2011.54.bbappend: Is dropbear@.service a candidate for a
second *-systemd packet?

* are there other keys which might need follow-up too?

Thanks in advance

Andreas


