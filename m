Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RxyBC-0004cm-Qe
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Feb 2012 11:03:11 +0100
Received: by vbbff1 with SMTP id ff1so1541908vbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2012 01:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=jiQA2ZvTP4RcRy9Np9dEVEoHC8esdSDwfvqn7V2lyOM=;
	b=E4kdfShzvWx1uLE2hnWpe/gfJh/cZqba9npoMNvG0OCeIdBVQszaVpy525Vx5VLNEX
	gzq/VGiCLeHG3c/ReJJU4h0+r/Y9ICdV1TFq3q9/9BdWO0YRSODnN3VeGoTYYM1FJe63
	I2y+t3TTmIrn4lB6muL4hpnjUi7OMIAmMGXYs=
MIME-Version: 1.0
Received: by 10.52.173.79 with SMTP id bi15mr744793vdc.31.1329386097353; Thu,
	16 Feb 2012 01:54:57 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.220.3.84 with HTTP; Thu, 16 Feb 2012 01:54:57 -0800 (PST)
In-Reply-To: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
References: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
Date: Thu, 16 Feb 2012 07:54:57 -0200
X-Google-Sender-Auth: rT8Oev-C4gUKT8jiM3r0Hao8aBs
Message-ID: <CAP9ODKqzek7gA8K9iuU_MA-USdynLi6jnbVmGdHWaVOQ8yeZkQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe][v2] 00/22] systemd rework
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
X-List-Received-Date: Thu, 16 Feb 2012 10:03:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 16, 2012 at 00:02, Andreas M=FCller
<schnitzeltony@googlemail.com>wrote:

> Additional patches were prepared for other recipes inheriting systemd.
> These are
> not yet send because they move systemd support from ${PN} to ${PN}-system=
d
> which
> currently needs modifications on tasks/images. I'd be happy if a common
> accepted
> solution would be suggested/implemented (image-feature?).
>

Personally I think we'll end doing both: DISTRO_FEATURE and IMAGE_FEATURE.

--=20
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

