Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1PGDSJ-00083I-BA
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Nov 2010 17:23:28 +0100
Received: by bwz10 with SMTP id 10so870158bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Nov 2010 08:22:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:sender:received
	:in-reply-to:references:date:x-google-sender-auth:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=0zbiUS0m2TdGM5LPJ95tryuRiXxGwGIfN32N7mWDvEc=;
	b=pVlkD5wsjffVg+vb2kuDXfbJZIeW2bXOEwhhdnnyfxTqByv/3WH51ZXzm9TwMWaBNk
	c51B4mpsNd6xHKxknN5/3/H8MH8/TVe7wVDN+4KRgNAra3ui/c/1U9m4APrtOWGAsX2f
	zVSOg1AXGK6fjlmg7m53/5R8xiFLGN4t/e+uU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=jR+phSQxbT+ahITp6AL1wwVlgt1ZyCumyagUX1OoT+HVTUu6dTnzXDew7Si4KEr6FQ
	nBSZbLoitAWakkSP5Lrz00Dwfh+c4HhaMgYiUNhatXcfyhMDEBdekKEY3pUj5VEislnh
	pKR7hjEUECfUf3BIHqpnCCYMEUk12hZplQ8B0=
MIME-Version: 1.0
Received: by 10.204.66.145 with SMTP id n17mr8436459bki.73.1289406150636; Wed,
	10 Nov 2010 08:22:30 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.2.75 with HTTP; Wed, 10 Nov 2010 08:22:30 -0800 (PST)
In-Reply-To: <1289399216.1272.415.camel@rex>
References: <1287113787-21268-1-git-send-email-kergoth@gmail.com>
	<1287157281-31597-1-git-send-email-kergoth@gmail.com>
	<i9aai3$tmj$1@dough.gmane.org>
	<AANLkTimuTVEWPsZT=hx+fuLLHKtVVrVzud0xq5R_TSEO@mail.gmail.com>
	<1289399216.1272.415.camel@rex>
Date: Wed, 10 Nov 2010 14:22:30 -0200
X-Google-Sender-Auth: eO6Bvju5Jm6RfQ1qRwmhvmP3IB0
Message-ID: <AANLkTi=gsOK=1-u5OBRR2iYXmxamr_LTyJk-gtvdUUWp@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH (v2)] Reverse the order of OVERRIDES
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
X-List-Received-Date: Wed, 10 Nov 2010 16:23:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 10, 2010 at 12:26 PM, Richard Purdie <rpurdie@rpsys.net> wrote:
...
> This change is pretty serious and potentially alters the handling of any
> double override. Poky uses them a bit more extensively than OE does. Its
> effectively an architecture change to OE yet no discussion was had at
> any TSC meeting :(.
...

I agree with Richard here. It was merged too fast.

We are suppose to have a release soon and this kind of change
shouldn't be done so near of it.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 O.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 http://projetos.ossystems.com.br


