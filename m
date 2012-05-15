Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fromm@dresearch-fe.de>) id 1SUKWC-0006L8-7N
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 May 2012 18:22:36 +0200
Received: by lags15 with SMTP id s15so4304009lag.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 May 2012 09:12:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=0BwlLsNkqO6L0T52XL6QBmfKlUYCAUZeguwZscLn0Yo=;
	b=nyDM5PEAVWgd0ELcy640xHZxfg4oiBuTWcAtIRvLvvTyJ/Vdlk26ZJDOfB3MUMmP9j
	0KxomH8ywn2y1e7kIQBYbsQ4eiEGSoamWo/bYmGaS8BBJOLAfiUVEB7eTtbXphUWG/m7
	LtDbCJ4HR/m84NLiJnTUeh19N4Zxuidgwo0vauWi7adNee/jNduo8auswyXohtgf807X
	0M63TDuZX6iVG257XyJCQPCwJ/8tPrRVLnHM4Yc5rFGiCSdksmF9+0cRyfKfXSAZfYy0
	GCp0dTAneE99qd3OS57MpNNiGvOR9nfV6VA4oP4mODJQ76XCVYy3i8EAtAPLS2NY+u/y
	SiQg==
MIME-Version: 1.0
Received: by 10.152.129.74 with SMTP id nu10mr12838909lab.50.1337098355730;
	Tue, 15 May 2012 09:12:35 -0700 (PDT)
Received: by 10.112.10.201 with HTTP; Tue, 15 May 2012 09:12:35 -0700 (PDT)
Date: Tue, 15 May 2012 18:12:35 +0200
Message-ID: <CADZ6=asJ+xLvpodv=u9duDuWs=dp8mLamv=Sj6yJc6B5sjWMrw@mail.gmail.com>
From: Thilo Fromm <fromm@dresearch-fe.de>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQmfgDwUM8xTXdCna7u3Rz7KcSlvcTfG0phmTL0nEfp1gEo1zEexf9XiwsjQEGnz7uIXk7mS
Subject: Where do I override DISTRO_FEATURES?
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
X-List-Received-Date: Tue, 15 May 2012 16:22:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello,

I'm trying to remove an element from DISTRO_FEATURES (specifically
"ld-is-gold"), but I am unable to find the right spot to do it. The
distribution we're using (Angstrom, as it happens) sets this in
conf/distro/angstrom-v2012.x.conf. My machine configuration is the
wrong spot to modify DISTRO_FEATURES, since it will be processed
first. local.conf is not working, too.

So could anybody please tell me where I need to put my

DISTRO_FEATURES =3D "${@'${DISTRO_FEATURES}}'.replace('ld-is-gold',  '')}"

so it applies for the build?

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


