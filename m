Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Pu6Xj-0005EG-8M
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Feb 2011 18:05:55 +0100
Received: by bwz10 with SMTP id 10so3837200bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Feb 2011 09:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=rZIIi5ZQLyu8LL1Q+unQAhPeCPgZQNZm78lThyttlzQ=;
	b=nhEDuh2ns4TVgWY5UNwAAZmzJg128Aw7JaQmj1lWt6rExJxKD2Gluy2a+solme3LDZ
	u4zSSblr7BiqjLcvy72kyer6B1XvGu01sQTsdfWm9rX89Od2Ow8/lg9w1XyopUDzbBrW
	g+CyZQrkNzBbW3J9gEJ9DsskVxAXFPjU6DIqU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=aqfcIwYyPfT2xkAJZNeCYT5GZM4HVvQ3mwgw2fZm+nxlwB4Ui+N57Qquc6Rbs+y8Xw
	5tZGeuT+qKTnZZYgd6ac708HkcFQOAjn+a1EHw4yt66S1FoHxGoZLujv4PHK4DWUeeUn
	6cEaOeWOgHNBoxsVRGgt7fEhCnMZTx0gGzQvg=
MIME-Version: 1.0
Received: by 10.204.64.139 with SMTP id e11mr5033288bki.97.1298912669631; Mon,
	28 Feb 2011 09:04:29 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.119.207 with HTTP; Mon, 28 Feb 2011 09:04:29 -0800 (PST)
In-Reply-To: <1298912239.23547.10.camel@phil-desktop>
References: <1298899606-9139-1-git-send-email-otavio@ossystems.com.br>
	<1298899606-9139-2-git-send-email-otavio@ossystems.com.br>
	<1298912239.23547.10.camel@phil-desktop>
Date: Mon, 28 Feb 2011 17:04:29 +0000
X-Google-Sender-Auth: gqOQvJ-RoFuU5kYrsT9mPEw_FEw
Message-ID: <AANLkTi=fohQFaxQnTP-VxoNh+P8np9uXCsvChtdT2ORT@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Phil Blundell <philb@gnu.org>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 2/2] conf/bitbake.conf: add DISTRO_ARCH and MACHINE_DISTRO_ARCH
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
X-List-Received-Date: Mon, 28 Feb 2011 17:05:56 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 28, 2011 at 16:57, Phil Blundell <philb@gnu.org> wrote:
> On Mon, 2011-02-28 at 13:26 +0000, Otavio Salvador wrote:
>> -PACKAGE_ARCHS =3D "all any noarch ${TARGET_ARCH} ${PACKAGE_EXTRA_ARCHS}=
 ${MACHINE}"
>> +DISTRO_ARCH =3D "${TARGET_ARCH}-${DISTRO}"
>> +MACHINE_DISTRO_ARCH =3D "${MACHINE_ARCH}-${DISTRO}"
>> +PACKAGE_ARCHS =3D "all any noarch ${TARGET_ARCH} ${PACKAGE_EXTRA_ARCHS}=
 ${DISTRO_ARCH} ${MACHINE_DISTRO_ARCH} ${MACHINE}"
>
> This seems a bit weird. =A0Any given package feed (or TMPDIR) is, more or
> less by definition, going to correspond to a single DISTRO so I can't
> see any situation in which these extra archs would be useful. =A0What's
> the use-case for this?

We have a set of products that reuse a common distro definition but
has different needs on a small set of packages. To avoid having them
all rebuild we set those to DISTRO_ARCH and the ones that depends on
machine and distro to MACHINE_DISTRO_ARCH avoiding a lot of rebuilding
and CPU time.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


