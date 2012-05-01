Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radoslav@kolev.info>) id 1SPAy9-0000or-CB
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 May 2012 13:10:09 +0200
Received: by vcbfl13 with SMTP id fl13so2913795vcb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 May 2012 04:00:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:x-gm-message-state;
	bh=/swDj6n589QrHXMR8FEAyF61I49GR6xp0a7i5ykJS0E=;
	b=pIA62v19H56gi1wnI3j03v/Ir7hTTXePq3YRIt1D6tJV/O2IODHedJNk9j1PaZyklB
	d1QeEUcXPQhrUNraDTmj9xWVvIfsh9qdKgmDhMcNWCUm+ojFuaqlcfbTLKLx0SITQAq9
	WhyHjGlxg5nDlCbEsC5LrF64nL6y3/IejLMYQuKoBfGgseCwkG8Zma6Eih+r6yA2rb5G
	iLjf2grxfQz1S2+LKzEJvKgf2uf+jqlTfsRWA9yHw2Cr6iFdq2HftrKH3D6qt6ZYpz5a
	1bmZ8/fodKkRTIJKsR3PAiz5BBgo9m8drwy4TLoNJosk8lXUBTwHKHTghmObRXlKxZDO
	KKxw==
MIME-Version: 1.0
Received: by 10.52.178.129 with SMTP id cy1mr20750065vdc.8.1335870025945; Tue,
	01 May 2012 04:00:25 -0700 (PDT)
Received: by 10.220.27.139 with HTTP; Tue, 1 May 2012 04:00:25 -0700 (PDT)
In-Reply-To: <DB8F1B3EEF94C3439BFFE674EB05E3CC014CB5@HKNPRD0204MB116.apcprd02.prod.outlook.com>
References: <DB8F1B3EEF94C3439BFFE674EB05E3CC014CB5@HKNPRD0204MB116.apcprd02.prod.outlook.com>
Date: Tue, 1 May 2012 14:00:25 +0300
Message-ID: <CAA5cW2yko=hnX5Li=b-o846tbTo3hvdLg7m5609__-OdgJpm3w@mail.gmail.com>
From: Radoslav Kolev <radoslav@kolev.info>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQkP3oz5LTVxVZcKbOD7+lo+B2tA7ZNVsnDoCxnztia7anWYmkiA+GZFkDNfPGCa9iNvrjIJ
Subject: (No subject)
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
X-List-Received-Date: Tue, 01 May 2012 11:10:09 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, May 1, 2012 at 10:57 AM, Craig McQueen
<craig.mcqueen@beamcommunications.com> wrote:
> I am new to OE. I am trying to build OE from the git repository, for Freescale i.MX28, following the instructions here:

If you're starting a new project may be it's better to base it on
oe-core. Have a look here:
http://groups.google.com/group/meta-fsl-arm

> I am having a build failure trying to fetch elftosb-10.12.01.tar.gz. The command I run is:

change the SRC_URI to this one in the elftosb recipe:

SRC_URI = "http://repository.timesys.com/buildsources/e/elftosb/elftosb-${PV}/elftosb-${PV}.tar.gz"

Regards,
Rado


