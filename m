Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1RxL4b-0002gM-0Z
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Feb 2012 17:17:45 +0100
Received: by lahc1 with SMTP id c1so124442lah.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Feb 2012 08:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=wwxdqssW+d/9P6B8V80xd3kyGcexFCI/awHOo3Vhd08=;
	b=bNr4w8HuN0Qz0ItJ4YA8IfZ9rA/MgtOOQxfaSPOBHawAkU5yfqGB+r9/hydT2P9Ahj
	u7nwbJCiQDZSOBVVJE+cOzgZhIw5HWDncZUs34cINe0qtWaLdxyXsq31nQkeCYWF+gcR
	/pgeQhgj4GdnFMs02559pY0be0Gxbw/08uO+E=
MIME-Version: 1.0
Received: by 10.152.127.136 with SMTP id ng8mr14938276lab.16.1329235774130;
	Tue, 14 Feb 2012 08:09:34 -0800 (PST)
Received: by 10.112.108.164 with HTTP; Tue, 14 Feb 2012 08:09:34 -0800 (PST)
In-Reply-To: <CAP9ODKqXfNBpQ7J6rEcFkFKXX5LspymGtQ0SNBh_jMX=pGyFHQ@mail.gmail.com>
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
Date: Tue, 14 Feb 2012 17:09:34 +0100
Message-ID: <CALbNGRQvP7A=oz6mtM8hZ6wO6+esQQ6KR4nmV4DXhY=eonAAtA@mail.gmail.com>
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
X-List-Received-Date: Tue, 14 Feb 2012 16:17:45 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Feb 14, 2012 at 1:51 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> No; The @ is to allow multiple instance. Look at
> http://www.freedesktop.org/software/systemd/man/systemd.unit.html
How about the old strategy for *@.service:
If there is only one *-systemd package with one entry in
SYSTEMD_SERVICE it will get *@.service?

Andreas


