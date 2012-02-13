Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RwuvM-0004u5-Fc
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Feb 2012 13:22:28 +0100
Received: by eekd41 with SMTP id d41so1527912eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Feb 2012 04:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=2gSTVxR/HBvgJSrpybFKWOVqV7XvZ4eAeK8z4OsZvPw=;
	b=XFEfwcz3IT8mq3Ivkb5UW99WHI5wH72DZxuRALPdb51Zl9MGQkZ/d+3qPqZvSIxlKE
	TngdcPi76k7ppWA7ZJJKqIrFI9yxHIhS0RjmHhgV/3mkk0zrBxN7/lHJZkcwVXt/I6I4
	zDFsQf/Lg3Y9EfflnogSuhUAN3ZTGvDWlTE2s=
MIME-Version: 1.0
Received: by 10.14.52.17 with SMTP id d17mr5106289eec.56.1329135259226; Mon,
	13 Feb 2012 04:14:19 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.14.96.129 with HTTP; Mon, 13 Feb 2012 04:14:19 -0800 (PST)
In-Reply-To: <CALbNGRQDy7E4ND7amsgiBuzo12o=umbW1kokYBgqyPoTaXbTCg@mail.gmail.com>
References: <1328925603-2967-1-git-send-email-schnitzeltony@googlemail.com>
	<1328925603-2967-6-git-send-email-schnitzeltony@googlemail.com>
	<CAP9ODKqeT+AZKUUiyYkbq4sKmo2espHinOfeBLQ0TfYEJZ3MfA@mail.gmail.com>
	<CALbNGRTiMWuLSuXsKfQV4ntHfVY5ovuBYrD0w41790Qa_u79Jg@mail.gmail.com>
	<CAP9ODKotC11Gh+bcOz9vgqNMacdwykydJ1G=e7rjr_HKVa6U4w@mail.gmail.com>
	<CALbNGRQDy7E4ND7amsgiBuzo12o=umbW1kokYBgqyPoTaXbTCg@mail.gmail.com>
Date: Mon, 13 Feb 2012 10:14:19 -0200
X-Google-Sender-Auth: tNNkFuMQRuu_JrQ4LEbEIxNIhbs
Message-ID: <CAP9ODKoXeBf_vctM7pcHTZd2-fMacN+kk8z9af18h9rkyDGVWQ@mail.gmail.com>
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
X-List-Received-Date: Mon, 13 Feb 2012 12:22:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 13, 2012 at 10:05, Andreas M=FCller
<schnitzeltony@googlemail.com>wrote:

> > If for example I put two .socket files, your algorithm will break. That=
's
> > why I said you need to parse it. It is not that difficult as the logic =
is
> > the same as the wrapper used in rootfs generation.
> Sorry - but which which wrapper do you mean?


systemd-systemctl-native

--=20
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

