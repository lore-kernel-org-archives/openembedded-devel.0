Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Ppqhj-0004ih-Gt
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Feb 2011 00:22:39 +0100
Received: by bwz10 with SMTP id 10so2008927bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Feb 2011 15:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=96QUr//K7VLoO/EZ8vHLKG/6BvCwJ2RMjGlEprILeHg=;
	b=qHdTf68CGJxEs5L2BxjOXYK/+KSKvEO7GhyypDD2CwlbSUXnV5JSBmD4TNiMcb298v
	K+aZlM6MbkRlwiVIyvjlSjAH3FHjOKX4YD34vxFLCQglT4/L9nCPURgS/YtHZ3J5o2fv
	Nc6Ddr2NeF6eX4engWrdr99XknZVGirGWMnCQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=tE+cqKRkHh9gJWXd8V7zw+OZVpczfYhnV3RP8C562zZ8D5pkr5KWUB/T9cT5PwqRNW
	wKxepauMlJTMq+tANfFM77wcIcW7C0VNQ+c1WoIyMuga3xA87KIk8jM2dnHVeWpmy3FK
	z80nln9uQwn6uM5APApCEG58ME64B2JEMhhsU=
MIME-Version: 1.0
Received: by 10.204.15.83 with SMTP id j19mr981503bka.105.1297898486545; Wed,
	16 Feb 2011 15:21:26 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.119.207 with HTTP; Wed, 16 Feb 2011 15:21:26 -0800 (PST)
In-Reply-To: <20110216230320.GP14525@sakrah.homelinux.org>
References: <1297855134-19216-1-git-send-email-otavio@ossystems.com.br>
	<20110216230320.GP14525@sakrah.homelinux.org>
Date: Wed, 16 Feb 2011 23:21:26 +0000
X-Google-Sender-Auth: 0aIwRM0RF1iMTiqSAuf19hF_IG0
Message-ID: <AANLkTi=0f4K-azrbSEdD1UDJBqLFypDMQE4pMwLddv3L@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org, 
	Otavio Salvador <otavio@ossystems.com.br>
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
X-List-Received-Date: Wed, 16 Feb 2011 23:22:39 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 16, 2011 at 23:03, Khem Raj <raj.khem@gmail.com> wrote:
> whynot use meta vars for datadir instead of hardcoding /usr/share ?
> like below :)

Good point. Fixed locally.

Except for it, ack?

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


