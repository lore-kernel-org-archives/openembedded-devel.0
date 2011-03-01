Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PuTk8-0004Ed-5J
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Mar 2011 18:52:16 +0100
Received: by bwz10 with SMTP id 10so4783718bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Mar 2011 09:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=V3K9civ61YOJgRntWsHbc3Yu+785xlAsErIK5vB+cZE=;
	b=aSNCnByn3nXoTvf7m3UP18QcIjQb/0CFtF27fuRUksbYKIhvUY2f03drhpqzXwd6qG
	PjnyCBwzPNJhTogPGAzMcgpYxw5UiaCXkCyLxNs6IA7MnsOG9u1CPrnbk9sv0o5k0QOL
	fbSd3g+7lyPyVIpxKzXr6RO5J1gyNbCV/15UE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=JvmduLQAhu7D5dy5ap1AL6X4OfSJh89Tww1Ax90EtXkbe+7SPOvIIFqnKccrpEgSA4
	T/gjs89TuVlvYcbW3pBGA1ZG7+ypGr8c1Zarviec2mp/PEsEs8t5TP2qg0lmQ2Ix7E2M
	V/QWHwsIzu0q2ZBCBnHRpPAZA5LgE0yq15LQo=
MIME-Version: 1.0
Received: by 10.204.81.72 with SMTP id w8mr6357689bkk.205.1299001848129; Tue,
	01 Mar 2011 09:50:48 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.119.207 with HTTP; Tue, 1 Mar 2011 09:50:46 -0800 (PST)
In-Reply-To: <4D6D2F3F.7060403@mentor.com>
References: <1298970609-4974-1-git-send-email-Martin.Jansa@gmail.com>
	<4D6D19AD.5010505@mentor.com>
	<AANLkTinXnoSaJDqBSMHp2V0xA1Wbku1ktx3UKh37KV8=@mail.gmail.com>
	<4D6D2F3F.7060403@mentor.com>
Date: Tue, 1 Mar 2011 17:50:46 +0000
X-Google-Sender-Auth: YFONF0kcGm25i9SaM35FtpXyBGA
Message-ID: <AANLkTik7Cm2P6KL5aRDVf4sOUGsnAbpACyS+PucRpHiX@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Tom Rini <tom_rini@mentor.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] sane-toolchain-*: add -g to FULL_OPTIMIZATION to make -dbg packages more usefull
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
X-List-Received-Date: Tue, 01 Mar 2011 17:52:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 1, 2011 at 17:39, Tom Rini <tom_rini@mentor.com> wrote:
> On 03/01/2011 10:03 AM, Otavio Salvador wrote:
>> Having -g shouldn't hurt since the debugging symbols end up on the
>> -dbg packages. Why having it "disabled" by default?
>
> In the case of host packages, I disable debug symbols (don't want, takes =
up
> space when shipping). =A0In the case of target stuff, we may want more de=
bug
> info to be available. =A0Or one may want to have less because again, it t=
akes
> up space when shipping.

I see but this could be overriden by distro, couldn't it?

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


