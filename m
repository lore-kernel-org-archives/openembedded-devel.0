Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QKWLe-000411-2J
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 May 2011 15:54:41 +0200
Received: by bwz5 with SMTP id 5so1441545bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 May 2011 06:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=g+RQQNIbq0RXBZQzQofo08rwD0O3z7+qgTZg/DOGGKo=;
	b=izY/mLn6NPrckDyoCTQKP+HStJmJw1rYCJkT5CmKVQBYUMHHcdESYms2j4NUMzg0HG
	RMNK9gPVk+dQzwpB9J8b5BOUWFlUspBxww3+YlJMmxkiFa2z6CpUVsudO6ptvVDwYiym
	tZL3YnCPxikU+kALuhE59FeJ7n+N7RKWQpu9M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=fjFGz1Iup8DSbHXCHeR+y4B95TrI0d9whJpeP2iMBR+G2XcBk5u/6rE2bAR0ysOINN
	fBuTVWDQM9wZ7B8oT+opLmqj7G0Dshm87FYXkB3X3kho/y8AmXeCRG2NJJ3VTla4y4gM
	bRa8kyTo32x/bNXWrUVEiZgVhKFCc3BNgkT8Q=
MIME-Version: 1.0
Received: by 10.204.134.207 with SMTP id k15mr232279bkt.135.1305208309994;
	Thu, 12 May 2011 06:51:49 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.79.70 with HTTP; Thu, 12 May 2011 06:51:49 -0700 (PDT)
In-Reply-To: <BANLkTikdBou4+n10aSsdH30w98AA0wuUKg@mail.gmail.com>
References: <1304968617-4949-1-git-send-email-otavio@ossystems.com.br>
	<1304968617-4949-7-git-send-email-otavio@ossystems.com.br>
	<BANLkTikdBou4+n10aSsdH30w98AA0wuUKg@mail.gmail.com>
Date: Thu, 12 May 2011 10:51:49 -0300
X-Google-Sender-Auth: 7cxBQZuIF9Y0f36suXkEGPCFBEA
Message-ID: <BANLkTiktzFwFPE4fjx_WOxD9NbgDMd3BRw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v4 07/12] libiconv: drop hack since gettext was being inherited
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
X-List-Received-Date: Thu, 12 May 2011 13:54:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, May 11, 2011 at 01:29, Khem Raj <raj.khem@gmail.com> wrote:
...
>> =A0EXTRA_OECONF +=3D =A0"${@['--disable-nls','--enable-nls'][bb.data.get=
Var('USE_NLS', d, 1) =3D=3D 'yes']}"
>>
>
> even this setting of EXTRA_OECONF can be dropped since --enable-nls
> and --disable-nls are also taken care by gettext bbclass

It has already been merged but I queued up a patch for this, on my new
pull request ... but will wait to have more changes to send it.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


