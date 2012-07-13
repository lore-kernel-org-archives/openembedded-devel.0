Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Sphy9-0002RX-Ad
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jul 2012 17:39:49 +0200
Received: by vbbfr13 with SMTP id fr13so2374867vbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2012 08:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=HdnxIfxAz7iLuUctvnwHCIjtv8Pe7zLK+9aaZ/0B/yA=;
	b=RWYHG0V2/B9Qn0ln5Q04gftHgL6R5bYb4EUhwHNb0nCDg6nAZCYy4TVMYCvLftxnCo
	Ymybc4dGZyIZjxLt7kWmH0WZWh5MRPHvAnn2/xzpulU4kBKn7PE66sZga4JhkB7tXJ3e
	XvXcCFDLZ0fkSZcanyBTw9JKEeKQHuE7bWRD56Tkon+gGla1cjSVcWWdwknXQGXG0RK+
	ZCsbIxxsZM2m3WVvtG6S/Tr1YX02vnaimFnpqQblZT1chfln+0MZ7Pa38S5gR3fpcNud
	Do0fz0QV6uEtgR8k4npKz758RGT3ZHpJ7n4UA7Fg3LQRxYyF+4OXpun2/v1fgr0VHIgS
	3MPw==
MIME-Version: 1.0
Received: by 10.52.89.35 with SMTP id bl3mr680711vdb.106.1342193314362; Fri,
	13 Jul 2012 08:28:34 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.220.220.196 with HTTP; Fri, 13 Jul 2012 08:28:34 -0700 (PDT)
In-Reply-To: <1342177846-26594-2-git-send-email-schnitzeltony@googlemail.com>
References: <1342177846-26594-1-git-send-email-schnitzeltony@googlemail.com>
	<1342177846-26594-2-git-send-email-schnitzeltony@googlemail.com>
Date: Fri, 13 Jul 2012 12:28:34 -0300
X-Google-Sender-Auth: lrQNv-7jls1_SOJ9StDWZd1E8Ng
Message-ID: <CAP9ODKrbdC-G-+tfV6akZUh_Six-O4qAy1nmVazo5Zr0OnbN1w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-system 1/2] systemd.bbclass: introduce SYSTEMD_AUTO_ENABLE variable
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
X-List-Received-Date: Fri, 13 Jul 2012 15:39:49 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 13, 2012 at 8:10 AM, Andreas M=FCller
<schnitzeltony@googlemail.com> wrote:
> Currently all services introduced are enabled and started at installation=
. By
> setting SYSTEMD_AUTO_ENABLE =3D "disable" the default behaviour can be
> overridden.

I like the idea but this might be nicer to have it by image; we could
check, in postinst, for:

$SYSTEMD_ENABLE at runtime, so we can set it in image file.

--=20
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


