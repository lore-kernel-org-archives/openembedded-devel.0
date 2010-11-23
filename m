Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PKvuw-0005ts-Ot
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Nov 2010 17:40:34 +0100
Received: by gyd12 with SMTP id 12so2415476gyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Nov 2010 08:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=jfmmrlqd9MdIlmMWokfB5CFnfSsS7Ueoh/CIYxrAsJ0=;
	b=R29vZxC6lZP3vH3y7L0yphV8oBdPuGyx0izJoDdOCwyZ7UVAcFXTSEPyaiTWyQRKoT
	vKQlnJsKILVFsuet0bMKRkw+T7b3AKAqt+yarzfyemItrQIZczerbKiht5k5Q8Hx/hOF
	MSb3aQgsZ2HrFQt3afVKba5C4ZdSUcAmkfHGM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=H4TntI0nH5uMHSrXzvfEnQe3gNP+7vrcpuMyOBWc5Pvj5Ul4PkkFwfMT+K6lN8GSJt
	RosxDgOu7B4A8FRCjC7ycAtM6BoClxckqhWs/EDfxpKYZaC+m+oAkYhHnHlMjL4rCYXM
	ej1EyZZH6cRPF4KkakPCxoactEqPlhi7eO5oU=
Received: by 10.91.47.38 with SMTP id z38mr8958864agj.129.1290530356393; Tue,
	23 Nov 2010 08:39:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Tue, 23 Nov 2010 08:38:55 -0800 (PST)
In-Reply-To: <4CEB8C49.9020000@eukrea.com>
References: <4CEB8C49.9020000@eukrea.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 23 Nov 2010 08:38:55 -0800
Message-ID: <AANLkTimeW43zOzPvvfW+9_fPhM49M1xXVi=_iDv65fiM@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: wrong file on sources.openembedded.org
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
X-List-Received-Date: Tue, 23 Nov 2010 16:40:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 23, 2010 at 1:41 AM, Eric B=C3=A9nard <eric@eukrea.com> wrote:
> Hi,
>
> http://sources.openembedded.org//binutils-2.19.51.tar.bz2
> gives : ae08e3f6d3bd59a4855e99d9bfaa56fe =C2=A0binutils-2.19.51.tar.bz2

.51 means a random dev snapshot of binutils so the contents could
vary we should avoid using the dev snapshots and not create
recipes for such

>
> but recipe (and sourceware's archive) have :
> SRC_URI[md5sum] =3D "fd59f36022f6ea802d1c844a2576e616"
>
> Eric
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


