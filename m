Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S2OdO-0004Hb-05
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Feb 2012 16:06:34 +0100
Received: by vbbfr13 with SMTP id fr13so2075229vbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2012 06:58:06 -0800 (PST)
Received-SPF: pass (google.com: domain of otavio.salvador@gmail.com designates
	10.52.71.80 as permitted sender) client-ip=10.52.71.80; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	otavio.salvador@gmail.com designates 10.52.71.80 as permitted
	sender) smtp.mail=otavio.salvador@gmail.com;
	dkim=pass header.i=otavio.salvador@gmail.com
Received: from mr.google.com ([10.52.71.80])
	by 10.52.71.80 with SMTP id s16mr13231020vdu.131.1330441086352
	(num_hops = 1); Tue, 28 Feb 2012 06:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=IKoYMJPmAr1kAC5FsbNnCpxhlaJpfq3Btlgm6PVIQQs=;
	b=D6IV0J4Fg5TZpKa5FDuVpHoza4egBUbgQ8DlO4NWYNa090Q/vh1IgL0rKeu7OZ4DeI
	XmkOZB2UyiSq14X/y5rm7AZhZXwbXsGbRLgy+LOyTGeHm+fMYAOlJYqQWj896oLhfw76
	WiJS1ffGyGJfJ2q+CddxbZNTnbgPcxiPp8DUI=
MIME-Version: 1.0
Received: by 10.52.71.80 with SMTP id s16mr10933671vdu.131.1330441086058; Tue,
	28 Feb 2012 06:58:06 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.220.7.208 with HTTP; Tue, 28 Feb 2012 06:58:06 -0800 (PST)
In-Reply-To: <CAAQYJAv0-czYNsmCCqaXs3jpu-OJmRPd+fZU-C2zhG0xKaP0XQ@mail.gmail.com>
References: <1330435070-30907-1-git-send-email-koen@dominion.thruhere.net>
	<CAAQYJAv0-czYNsmCCqaXs3jpu-OJmRPd+fZU-C2zhG0xKaP0XQ@mail.gmail.com>
Date: Tue, 28 Feb 2012 11:58:06 -0300
X-Google-Sender-Auth: y5FNP_fNXyDW9CVbD1fRaxROSc4
Message-ID: <CAP9ODKoddtFdzFVESfzeKA8zxzOb0D=4j-prRcLG54wxO=ak8Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe] xinput-calibrator 0.7.5: fix calibration script
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
X-List-Received-Date: Tue, 28 Feb 2012 15:06:34 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 28, 2012 at 10:58, Andrea Adami <andrea.adami@gmail.com> wrote:
> do you think the recipe is now mature enough to be committed in oe-core?
> This would follow xinput commit and could make easier the unification
> of xserver-nodm-init between oe-core and meta-oe.
>
> I think thi sis needed because at the moment xserver ts calibration is
> not working when using oe-core (xtscal fails because XCALIBRATE ext
> has been removed).

The touchscreens we have here do not work with it as it doesn't handle
the swap and reverse properly.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


