Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RTPSk-0003tH-LL
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Nov 2011 03:54:58 +0100
Received: by faat2 with SMTP id t2so2493798faa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2011 18:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=lkFrjrL92SPWgmc3be1372ai5S61qj1bmsjnJgdAdr8=;
	b=p8493fj8O3C5z9mQKIvXzFxUwFpSJ/bTbCb1a3eahURnjMjUYs6hbdh2f+I1b58PIQ
	CpNCZBYSg1P2SdrWE/+r4Kzk3avXO7AZPIHj8I/w4Km3OeaHufY2n44i1rSg93o0QpIu
	cbytHfhDy7rFSoEg0jfUqOh8Tg6HVLd0+BaJA=
Received: by 10.152.106.38 with SMTP id gr6mr16661831lab.35.1322102906142;
	Wed, 23 Nov 2011 18:48:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Wed, 23 Nov 2011 18:47:55 -0800 (PST)
In-Reply-To: <ED3E0BCACD909541BA94A34C4A164D4C4019E837@post.tritech.se>
References: <ED3E0BCACD909541BA94A34C4A164D4C4019E820@post.tritech.se>
	<ED3E0BCACD909541BA94A34C4A164D4C4019E837@post.tritech.se>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 23 Nov 2011 18:47:55 -0800
Message-ID: <CAMKF1soCu==EdqN5dB7wVLQQ2=f3K+L9ZoWxUsdsvNgNHMgKbQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Replacing a config file from other package
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
X-List-Received-Date: Thu, 24 Nov 2011 02:54:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 18, 2011 at 2:23 AM, Mats K=C3=A4rrman <Mats.Karrman@tritech.se=
> wrote:
> A problem occurs when i try to install the "config-ppp" package because I=
 want to replace some files already provided by the ppp package, e.g. "pap-=
secrets"; the image build and/or installation fails and refuses to overwrit=
e an existing file.
>

in your own layer you could .bbappend to existing ppp recipe which is
providing this package and rm the concerned file.


