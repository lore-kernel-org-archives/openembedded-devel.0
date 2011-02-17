Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Ppvxi-0003mf-Ic
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Feb 2011 05:59:30 +0100
Received: by fxm17 with SMTP id 17so2096065fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Feb 2011 20:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=IfrRbvbZ8cIL6dAwkWCnKYyPweF4qFtwjvb+u8Jea1g=;
	b=hW7FmunM0QrVTTrnJ5mlbmzfjjKY30xJskvECncIih0tbpQ8/SV35FWTuUgp08SRSz
	H5PgB9gaITQtIIeIRjZvVtLcApijpQUcWcd+ShCe6AXAlpndoSu2ukfpiF4L84Yn+Jid
	k6wwj+FvLKOJitG5mTZ/0UQ9DfJC1eZcVLN8I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=ks32nOOFu3n0ov4dW8Eb53Yfti9h4dlp8pPBVkZsqhBbP8k7OVJbetOjOzIMk882AD
	h9bqeL5n/sgGdEzWoCjZfONTm3fNznSvPCcbHl9jXRXVmuQVrep7ZQ3Pk0qn6A6BjGrS
	FmK0eIFVe69FfnXNweUN/VuvOIYxnkaOrpdKg=
Received: by 10.223.104.71 with SMTP id n7mr1771769fao.120.1297918698279; Wed,
	16 Feb 2011 20:58:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.66.22 with HTTP; Wed, 16 Feb 2011 20:49:51 -0800 (PST)
In-Reply-To: <AANLkTi=0f4K-azrbSEdD1UDJBqLFypDMQE4pMwLddv3L@mail.gmail.com>
References: <1297855134-19216-1-git-send-email-otavio@ossystems.com.br>
	<20110216230320.GP14525@sakrah.homelinux.org>
	<AANLkTi=0f4K-azrbSEdD1UDJBqLFypDMQE4pMwLddv3L@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 16 Feb 2011 20:49:51 -0800
Message-ID: <AANLkTimtTWF0SAOX=UnbY6yzVg+ykGDZ-=YX_kbUYKks@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 01/13] xkeyboard-config: avoid recipe code duplication and depends on intltool-native
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
X-List-Received-Date: Thu, 17 Feb 2011 04:59:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 16, 2011 at 3:21 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> On Wed, Feb 16, 2011 at 23:03, Khem Raj <raj.khem@gmail.com> wrote:
>> whynot use meta vars for datadir instead of hardcoding /usr/share ?
>> like below :)
>
> Good point. Fixed locally.
>
> Except for it, ack?

yes

>
> --
> Otavio Salvador=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0O.S. Systems
> E-mail: otavio@ossystems.com.br=C2=A0 http://www.ossystems.com.br
> Mobile: +55 53 9981-7854=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =
=C2=A0http://projetos.ossystems.com.br
>


