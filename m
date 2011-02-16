Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PpeiJ-0000we-Vz
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Feb 2011 11:34:28 +0100
Received: by bwz10 with SMTP id 10so1347404bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Feb 2011 02:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=zwaUbH/EYxh3c/ANf+UNIEcIbQ2D5w5w30NjhZz/smU=;
	b=cv/3MA+Qw61/R1GnbAOcNvgUkpVHOyDusC4rUEGrNHNhp6orFqPAy/q11LPJ0xXLRL
	VRpTtLQRrfxFVcW3qohApFOjIE5+ojQ/vBvYus7kHUrOMf4ClR+X4g3wqsd+faN7AslD
	EdPkn5ezR6jii7vxoif+5pP5ZyiAJ/DUGdJk8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=djO8Os7KJcn7GXtZBrH+djCntaPCcL4Glf1VIS+OnrFqjRhMtFOPQYimis59HF9udx
	aFdAg3OsmRWM7zuRGMahnizsCygc5q0v4uXzkAGSvLzvHSdubI7b7A1fSUK6srcWonWi
	bdvw0bvOlSarmbnzLjCb/Zx6NhxxotIto9o+0=
MIME-Version: 1.0
Received: by 10.204.15.83 with SMTP id j19mr324419bka.105.1297852392745; Wed,
	16 Feb 2011 02:33:12 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.119.207 with HTTP; Wed, 16 Feb 2011 02:33:12 -0800 (PST)
In-Reply-To: <201102161030.43048.marcin@juszkiewicz.com.pl>
References: <1297825404-20674-1-git-send-email-obi@opendreambox.org>
	<201102161030.43048.marcin@juszkiewicz.com.pl>
Date: Wed, 16 Feb 2011 10:33:12 +0000
X-Google-Sender-Auth: BdjsL-sJR50ytbrVSSc4aq_rlcY
Message-ID: <AANLkTi=oE+H2+p36z4qYOpV2p7JOcEbDpjdW1kYxEWX-@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] wpa-supplicant-0.7.3: use MACHINE_ARCH
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
X-List-Received-Date: Wed, 16 Feb 2011 10:34:28 -0000
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 16, 2011 at 09:30, Marcin Juszkiewicz
<marcin@juszkiewicz.com.pl> wrote:
> Dnia =B6roda, 16 lutego 2011 o 04:03:24 Andreas Oberritter napisa=B3(a):
>> * Because of madwifi, wpa-supplicant depends on COMBINED_FEATURES.
>> =A0 Thus, PACKAGE_ARCH must be set to MACHINE_ARCH.
>> * Use INC_PR and bump it.
>
> What about setting PACKAGE_ARCH=3DMACHINE_ARCH only for machines with mad=
wifi?
> Most of out targets does not support madwifi.

Well but not having it is also an "option" so it seems the right is to
have it globaly.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


