Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fromm@dresearch-fe.de>) id 1SkEb6-0004UD-Fu
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Jun 2012 15:17:24 +0200
Received: by lbol5 with SMTP id l5so2981140lbo.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jun 2012 06:06:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=4x9tJh6thf+oV1lLVwOBSnIOhyZaJATUce0ZJxpyX1A=;
	b=bcCwYYTkBS/KsTrC5xquiPQQ8vObzPQ/pEhNc1xPwdy61SWyWifUIuXZ3YRBsMOFxJ
	PXv3TY2bQKWiT/zX2Lrs0U/omh16q5EkyR4BDzMGpqNdrbCOyq5IxBA4BJTySNqyyX77
	/Ag1TM5DIgpN2yvt7Wyh56j/qhTD3kbtk57vjBJTK0FRJm1p0p+YO4Z/vJxxf8LsxfU3
	VbH2IHAB/i08/tcd+F139P9h60O3LtJvM0abaouXpIRhOcUb8kDdIOkXKsrYHkjFGz5O
	WI1o4UBiimgvE79HB8R0sOj/nAiHs3rI5z0vkeSbZq2UsmIh9ilgQomgFvJ6mKD7ljQ1
	8lOg==
MIME-Version: 1.0
Received: by 10.112.26.131 with SMTP id l3mr1095473lbg.80.1340888789719; Thu,
	28 Jun 2012 06:06:29 -0700 (PDT)
Received: by 10.112.100.132 with HTTP; Thu, 28 Jun 2012 06:06:29 -0700 (PDT)
Date: Thu, 28 Jun 2012 15:06:29 +0200
Message-ID: <CADZ6=avV5=3g9CkMMDc9cKLUpw_-Bk_q7fb5MceJmtR0gH6YvQ@mail.gmail.com>
From: Thilo Fromm <fromm@dresearch-fe.de>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQlvalBWny7eTjlAJvfITyeOtZVJ8mSSfLnBgaGvgOmtoloqZiSMPA1HDfm2Jkct4PGYObS1
Subject: meta-oe breakage since oe-core removed gcc-4.6
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
X-List-Received-Date: Thu, 28 Jun 2012 13:17:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi meta-openembedded maintainers,

meta-openembedded buid is currently broken since oe-core removed
recipes for gcc-4.6, and meta-oe has .bbappends for several gcc 4.6
recipes now unavailable in oe-core.

No matter what's meta-oe's plan to handle this (i.e. move gcc-4.6 into
meta-oe/toolchain-layer completely vs. remove gcc 4.6 .bbappends
altogether), the current state - having the .bbappends in meta-oe and
no original recipes anymore in oe-core - breaks the build. Is this
going to change anytime soon? In either way?

Regards,
Thilo

--=20
Dipl.-Ing (FH) Thilo Fromm, MSc., Embedded Systems Architect
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, D-10319 Berlin, Germany
Tel: +49 (30) 515 932 228 =C2=A0 mailto:fromm@dresearch-fe.de
Fax: +49 (30) 515 932 77 =C2=A0 =C2=A0http://www.dresearch.de
Amtsgericht: Berlin Charlottenburg, HRB 130120 B
Ust.-IDNr. DE273952058
Gesch=C3=A4ftsf=C3=BChrer: Dr. M. Weber, W. M=C3=B6gle


