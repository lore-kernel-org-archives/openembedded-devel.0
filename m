Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Q20nI-00043u-Lh
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Mar 2011 13:34:41 +0100
Received: by bwz10 with SMTP id 10so5578860bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Mar 2011 05:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=NnJwCFpFcwHf69TfcP1avsv9ibX59Drl9pMPSqjN9M0=;
	b=Ym9TtFvlT95p9WgIdBJvnat1Wn0sTLlAP8pi4hwelbcrhfR/OP8KNoRZJw9QsNt9Jx
	3I5UaPt6TOwcRHKBifQWmozGrUFgBPuafkxPro6VfiG5jteGJ3sTj/f3drFShF1prHUI
	pdnLvFqco5vJYZ3Qc3rdF/wYjkaxHRjFnUEb4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=dn30w7vZ6Db7lTIgaIVjAmyGTT9h0FaK522Z3RIX46QEjw8T/D885xHGf/jWUzN+x4
	CsyLH2K4MqRwYJy1kp7k5WBT6YgVdiuckpqd6dRKe066sNPDEgzBTw380ZZJYOuw2VHc
	Gs19shzi7+t5xVWCOtEqoUx5vXrD7rrUz6zds=
MIME-Version: 1.0
Received: by 10.204.75.88 with SMTP id x24mr4934628bkj.158.1300797169663; Tue,
	22 Mar 2011 05:32:49 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.8.15 with HTTP; Tue, 22 Mar 2011 05:32:49 -0700 (PDT)
In-Reply-To: <AANLkTi=Q6ATHuoUN87y8G9futYc+2iJ9c23YLRfPYOZj@mail.gmail.com>
References: <1300784531-13757-1-git-send-email-heinold@inf.fu-berlin.de>
	<AANLkTi=Q6ATHuoUN87y8G9futYc+2iJ9c23YLRfPYOZj@mail.gmail.com>
Date: Tue, 22 Mar 2011 09:32:49 -0300
X-Google-Sender-Auth: VH3YwIxBT3B3R3wJCiMro3U8cRQ
Message-ID: <AANLkTim2xJnB2x3gDkA4vfmghv6UeamRcUPYXhSxjxjf@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: lzma has no -e option
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
X-List-Received-Date: Tue, 22 Mar 2011 12:34:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 22, 2011 at 06:22, Andrea Adami <andrea.adami@gmail.com> wrote:
> Yes, I've seen this too.
> It's due to a mismatch between lzma (utils) and xz (utils).
>
> We should probably move to xz =A0 http://tukaani.org/xz/

I see no point in having lzma images but we can use xz utils to
generate lzma if desired. I'd say to us to drop lzma-native and use xz
to build those or drop them.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


