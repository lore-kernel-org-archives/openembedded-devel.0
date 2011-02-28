Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Pu7Nz-0006OY-NN
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Feb 2011 18:59:55 +0100
Received: by bwz10 with SMTP id 10so3887070bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Feb 2011 09:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=DRrbMoT2AlSLE50qif6AOP93JVwUtDFliHvnjIbmxVY=;
	b=QdUGKs65JtaKxUXHoNNs2Cd94F5VesFHApKo8HmCW8MagdK2kkMY9EGTkTQSmx/kz5
	BHYdYZquId0jqT3E/a07ep45eTYRgd2gRdXlGKHDWfM1ZXjpkcleQMQgMhdMqbCZwY+G
	g7il4dQmJzny68eHL2AYyNnB+seB65VFGLdXw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=R2LlwKmRPIF1pGBOo8jQgeJhOOlTdBTgve27TvA4+JLpIWIt3gGwa2obzg9LQEIrwZ
	HoG8kozg4gLiyyfDhKzmK1zvFCPIe05T8C5JzxQPoxqE/fB9JP+V0rNmLaMiNiYqHkZ7
	4pD5zi0vnZ9Vh/BwKWXX6JIVar2d3MJFiSkoE=
MIME-Version: 1.0
Received: by 10.204.59.76 with SMTP id k12mr5233326bkh.70.1298915910376; Mon,
	28 Feb 2011 09:58:30 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.119.207 with HTTP; Mon, 28 Feb 2011 09:58:30 -0800 (PST)
In-Reply-To: <1298915872.23547.30.camel@phil-desktop>
References: <AANLkTim3uRSJMCskYcUzpg2aGCwzmoxLBxJeMTztzLzb@mail.gmail.com>
	<1298914102-27047-1-git-send-email-otavio@ossystems.com.br>
	<1298915872.23547.30.camel@phil-desktop>
Date: Mon, 28 Feb 2011 17:58:30 +0000
X-Google-Sender-Auth: Y2Qc9l6aQBz4wqNAyfj0LWQLdgE
Message-ID: <AANLkTi=T_-Lhbk=7ktu+0VNy1pFUH0XaQWK7xKG6LN00@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Phil Blundell <philb@gnu.org>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/3] freerdp: rdepends on xprop
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
X-List-Received-Date: Mon, 28 Feb 2011 17:59:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 28, 2011 at 17:57, Phil Blundell <philb@gnu.org> wrote:
> On Mon, 2011-02-28 at 17:28 +0000, Otavio Salvador wrote:
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>> ---
>> =A0recipes/freerdp/freerdp.inc | =A0 =A03 ++-
>> =A01 files changed, 2 insertions(+), 1 deletions(-)
>
> Thanks, that's better. =A0It seems pretty lame that freerdp does this
> popen("xprop...") thing at all, and even lamer that it apparently
> doesn't cope with xprop not being there, but that isn't really your
> problem. =A0So I think you can go ahead and check this in.
>
> Acked-by: Phil Blundell <philb@gnu.org>

Yep; this needs improvement but I don't want to waste time looking at
it, at this moment.

If you can, please push it for me.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


