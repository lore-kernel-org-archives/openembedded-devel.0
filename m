Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QMRzu-0005uO-Ly
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 May 2011 23:40:10 +0200
Received: by bwz5 with SMTP id 5so973983bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 May 2011 14:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=elkNigill9j1jRMYokTd+/u5kAJzWwfbHBLYBH0NHMs=;
	b=TJfwbBqUUx9zEidLjS3Xe1VkaZ39IGXGh9N+/hRaQSj260V2/k9JCczSLClY7YMBub
	Il2EwTMhNQXEwuRW5GDwUX3mtCiGd3isQNu0h3OI+fTqlubtVq6E+ad2FNZbyLcfG7mD
	FxfychCkhfrHRTMuxlnMiIwfPT8ulfhRoSaeU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=al1wbaMVpfqR1ENRzQ+0BhhqgtFG/9LcVXaMyDO0hmgd1fP1vMXOT1H+RXzagTTEix
	mMOAV7zl3kQXZlB16eDC9w/CXlBRruqZVuUZbxUBWGvtvdxTWXmN9GjNNm8EhFrhtDJ9
	vfXHOL2qP2KnEYipek9Cl9GDElPUFZvaF+XHg=
MIME-Version: 1.0
Received: by 10.204.7.209 with SMTP id e17mr1155821bke.162.1305668236920; Tue,
	17 May 2011 14:37:16 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.79.70 with HTTP; Tue, 17 May 2011 14:37:16 -0700 (PDT)
In-Reply-To: <BANLkTik+RLj1jUVOdAXQ8LLpRRqiZXzTtQ@mail.gmail.com>
References: <1305663890-20372-1-git-send-email-raj.khem@gmail.com>
	<BANLkTinDjxwtBSQkQ-fbAKxR7JzNiaAo+A@mail.gmail.com>
	<BANLkTik+RLj1jUVOdAXQ8LLpRRqiZXzTtQ@mail.gmail.com>
Date: Tue, 17 May 2011 18:37:16 -0300
X-Google-Sender-Auth: MGXvtsY_qI71-cL11-cbzV71VXU
Message-ID: <BANLkTi=KDUTnmP8aL-PVA1p-Q5ND+QvGQA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] uclibc_git.bb: inherit gitpkgv to get PV
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
X-List-Received-Date: Tue, 17 May 2011 21:40:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, May 17, 2011 at 18:25, Khem Raj <raj.khem@gmail.com> wrote:
>> Is it working for you? here, with freerdp, it doesn't.xi
>
> hmmm it works fine when I have existing git repo but moment I use a diffe=
rent
> SRCREV I start getting 0.0.0

It used to work quite well with OE (dev) but with OE-core it is
failing; I think it might be related to changes on bitbake.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


