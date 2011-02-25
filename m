Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Pt4l6-0001g3-VJ
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Feb 2011 21:59:29 +0100
Received: by bwz10 with SMTP id 10so2374914bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Feb 2011 12:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=BjmG6l+CHU5zEx4Muf7t8X0Q3WzlFvqUs2sdiKoGVxE=;
	b=swMH8J0d3Cl8Re4V3uL40j39nmxmlmFZtsn1gZ9fiLigjQsyo6pEDcpgBlZnIaJkKI
	QuWIHSV2aC1Ys4LtQ96NIgLfOLTm62hFbPOSiAML0IDB4BOo/IKBYlf1ZPJh2fC0LqVU
	g/0WKmUXB2Jr3hd38/fRZ8p80bSpL+6AcsSxI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=IuhxfoZ5If+FxXhdOOUU4RkcgyyHZZznR3gDhQ+CXIgqTFFxGgH5b0BMZHY97x62RI
	qXTpllNA9CVAHGmwzFwOUhyuN/+3LZzi5HZpvTKF84QuYNSR0VD3VavkhoJgUkXPj/NX
	k0hkE36OWF7g1TaUf2BwQ/ioAglg06CZiDBJA=
MIME-Version: 1.0
Received: by 10.204.179.203 with SMTP id br11mr2468122bkb.178.1298667486901;
	Fri, 25 Feb 2011 12:58:06 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.119.207 with HTTP; Fri, 25 Feb 2011 12:58:06 -0800 (PST)
In-Reply-To: <1298666406.3818.4.camel@lenovo.internal.reciva.com>
References: <AANLkTiknqQ6xLj8LFv4=17ymwSbVhD3C9kVe2qkviXhX@mail.gmail.com>
	<1298664057.3818.0.camel@lenovo.internal.reciva.com>
	<AANLkTin2WuKF=f_aOzi=28FmVTaxFVJa0uNb9TjfL2SB@mail.gmail.com>
	<1298666406.3818.4.camel@lenovo.internal.reciva.com>
Date: Fri, 25 Feb 2011 20:58:06 +0000
X-Google-Sender-Auth: ZOyl8iliOm3Xyv4Bfl4u6d_t5o4
Message-ID: <AANLkTinUjtis22ZnLaP7uc0fa9nzxvhWod2uv43ZcJH=@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Phil Blundell <philb@gnu.org>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Missing GLIBC_<version> tags on binaries
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
X-List-Received-Date: Fri, 25 Feb 2011 20:59:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 25, 2011 at 20:40, Phil Blundell <philb@gnu.org> wrote:
> On Fri, 2011-02-25 at 20:14 +0000, Otavio Salvador wrote:
>> It fails at runtime. The application I am compiling is freerdp and
>> sem_ symbols are not versioned, dunno why.
>
> Do you mean that the symbols aren't versioned at all, or that they are
> versioned but your libc.so.6 doesn't provide the versions that the
> binary is expecting? =A0If the latter, what versions does it have?

The binary lacks version for sem_post, for example. objdump -T show
the undefined symbol without the GLIBC_2.1 version. This happens only
with the sem_ methods.

> Is the libc in your sysroot the same binary (ie same md5sum) that you're
> using at runtime?

Yes the same ... in fact checking objdump of libpthread shows the
symbol with the version so I am lost about why it is not using the
version when linking.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


