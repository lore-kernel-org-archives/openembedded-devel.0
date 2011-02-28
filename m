Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Pu6JY-0004Ie-NO
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Feb 2011 17:51:16 +0100
Received: by bwz10 with SMTP id 10so3823644bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Feb 2011 08:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=t2ZxSucRSKhW9I/xWC2Z5rfFMDi7vTZLojdG6JbEmx0=;
	b=Jw2LhK9tffLSaTwxqJrj9/cpwBeHZSljpOKgm4Xi5/cKVh+JmGX6uOQqo3Fc0AL33w
	b92uS5yGP/G7qv3CCNT1mlcsLzJ4mZVDZjmMlLjESKYgDtFaS5/xQxhnhN97xA5BTTOk
	sYsZnx9juQzOWdqEmHzwazym9WdkT2UGjnhAk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=MSSxWeEEKrv+D7Y9VZcsKqIuXdjJWrVYR2DBJQT4aJh6fUvfU9YQEL4Fcyg2yKeUv7
	ZDkkPFZhjeoGojZe+++fUxpVY4VNN+eAxLP5xaQOjaWGkXfLM2sMRsQOcWmTTd1W4QzR
	ZOM0NWwESKhukkq+mSQL8VocE5ro8p+gQ3c2M=
MIME-Version: 1.0
Received: by 10.204.59.76 with SMTP id k12mr5157416bkh.70.1298911786449; Mon,
	28 Feb 2011 08:49:46 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.119.207 with HTTP; Mon, 28 Feb 2011 08:49:46 -0800 (PST)
In-Reply-To: <1298905700.23547.6.camel@phil-desktop>
References: <AANLkTiknqQ6xLj8LFv4=17ymwSbVhD3C9kVe2qkviXhX@mail.gmail.com>
	<1298664057.3818.0.camel@lenovo.internal.reciva.com>
	<AANLkTin2WuKF=f_aOzi=28FmVTaxFVJa0uNb9TjfL2SB@mail.gmail.com>
	<1298666406.3818.4.camel@lenovo.internal.reciva.com>
	<AANLkTinUjtis22ZnLaP7uc0fa9nzxvhWod2uv43ZcJH=@mail.gmail.com>
	<1298669695.3818.5.camel@lenovo.internal.reciva.com>
	<AANLkTi=afktV1HC4Jdq_ammNdA+h4iMAWdJT809s+LMv@mail.gmail.com>
	<1298905700.23547.6.camel@phil-desktop>
Date: Mon, 28 Feb 2011 16:49:46 +0000
X-Google-Sender-Auth: D41UdcNKywaRjKqm6oKVJvfyJe8
Message-ID: <AANLkTimyU4bSm9tM2LO5bMoqiFQqZXxt5Js7fg0B_HhJ@mail.gmail.com>
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
X-List-Received-Date: Mon, 28 Feb 2011 16:51:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 28, 2011 at 15:08, Phil Blundell <philb@gnu.org> wrote:
...
> It looks at first inspection as though this might be a linker bug,
> though I can't immediately see anything very special about freerdp that
> looks like it would be causing things to go wrong. =A0Some further
> debugging needed, though it'd be interesting to know whether it works
> any better with gold for example.

How could I make it to use gold? I am stuck on that issue since it is
block us to advance on the development of a product :-(

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


