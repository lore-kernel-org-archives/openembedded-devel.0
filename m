Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PpqkI-0004s6-Ks
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Feb 2011 00:25:18 +0100
Received: by bwz10 with SMTP id 10so2011034bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Feb 2011 15:24:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=6XsNic8fMaPunm0N+6NIdx7SChIdiRajk0Wr4tfkXw8=;
	b=v7j5aUKjciGnve4YE8BzJeTtDOwNp2z2rOewejfhN2kw1OT8k8iN5y//5QGrnGLKX6
	UfiffcBppA5ZGyzajLCHVz1p6WST/5En1qs5aLLJW2b3dOxCFpWGYAnFjBoLKRGo1nX9
	8vRyPgoUeJwCpkPLW5lRTaOpqOKaCCV8uUy00=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=FNAL3+shrzKSOwg5o+MoxXTta5nkA5MehpR1JXTpwL77P6FI/TEqmi2LJQB8X0KiFN
	MhIoVMuftxVtp5GGlFwyRvnkPMiZ6uilBK2LPccEdoKDf8uFeih2Cy40ZWj/pTq4kzQb
	ZlQB4CKjnvkuy8UjI3tbgbDbo/KcJkjIBB+wg=
MIME-Version: 1.0
Received: by 10.204.46.210 with SMTP id k18mr976904bkf.159.1297898646838; Wed,
	16 Feb 2011 15:24:06 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.119.207 with HTTP; Wed, 16 Feb 2011 15:24:06 -0800 (PST)
In-Reply-To: <20110216231845.GX14525@sakrah.homelinux.org>
References: <1297855134-19216-1-git-send-email-otavio@ossystems.com.br>
	<1297855134-19216-2-git-send-email-otavio@ossystems.com.br>
	<20110216230438.GQ14525@sakrah.homelinux.org>
	<AANLkTi=3FiQZFfdXX0jxRm=EN3qEqDGdG9X5SU9=p4aP@mail.gmail.com>
	<20110216231845.GX14525@sakrah.homelinux.org>
Date: Wed, 16 Feb 2011 23:24:06 +0000
X-Google-Sender-Auth: 1Jk4UAg8PBlFNsktGMsEBYqR8yU
Message-ID: <AANLkTikf1LFop3zN4xX5BhtT0h5Ga3ea1MvKf4Sq4soW@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Otavio Salvador <otavio@ossystems.com.br>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 02/13] python-dbus: update to 0.83.2 and fix rpath to use absolute path
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
X-List-Received-Date: Wed, 16 Feb 2011 23:25:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 16, 2011 at 23:18, Khem Raj <raj.khem@gmail.com> wrote:
> On (16/02/11 23:14), Otavio Salvador wrote:
>> On Wed, Feb 16, 2011 at 23:04, Khem Raj <raj.khem@gmail.com> wrote:
>> > why is PR different then 'mlX'
>>
>> Any specific reason to use mlX? Most recipes use rX so I changed it whil=
e on it.
>
> thats been python's lingua I will leave that to it still it should have
> started at 0

Changed it to:

PR =3D "ml0"

Seems OK otherwise?

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


