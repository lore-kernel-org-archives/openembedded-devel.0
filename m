Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fromm@dresearch-fe.de>) id 1SUZte-0006by-OY
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 May 2012 10:47:50 +0200
Received: by lbol5 with SMTP id l5so338336lbo.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 May 2012 01:37:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding:x-gm-message-state;
	bh=UaSbTeuJ6f12DJ5Bmk1W1IC/Rs0s7Dt+mbsJnG6o9g8=;
	b=QPDnBCxjLpIaTtcOalWVzDfeEjchbHWLnjd3yBRSOP1CQLUO/XGW/AJTJKAVMiZvwb
	zV2tFL/h9Ih1bpRMvPsK0i5kxuD6IhZiGV9UUvOBM/G/OimZEeB/iqEWt3pSGzUwQitm
	zRAUHjPrZ8w0mu6b5xYRP6Iovow0TYuh4dUSd2FgcW2tBYiqvf3KXXyVFnqAb9sfnZnf
	r4LtJDDAsEp9I64oOxDzY6ujnOYepVfAVbUOeiaHnAhocvKrCX+8PhFRQONQFkBYQEjP
	RfCFai28qu7zpTvfKPdwqtBNyE/uEaWJEePWMTqM0P0K15ITZ35GqsCmIVkF7dhY+RWo
	drRw==
MIME-Version: 1.0
Received: by 10.112.88.34 with SMTP id bd2mr612406lbb.33.1337157469649; Wed,
	16 May 2012 01:37:49 -0700 (PDT)
Received: by 10.112.10.201 with HTTP; Wed, 16 May 2012 01:37:49 -0700 (PDT)
In-Reply-To: <jove3h$7qg$1@dough.gmane.org>
References: <CADZ6=asJ+xLvpodv=u9duDuWs=dp8mLamv=Sj6yJc6B5sjWMrw@mail.gmail.com>
	<jove3h$7qg$1@dough.gmane.org>
Date: Wed, 16 May 2012 10:37:49 +0200
Message-ID: <CADZ6=auuzv9dF1p58wVXPFdckBUmgk6nmucnarWpqdxMbyHpaw@mail.gmail.com>
From: Thilo Fromm <fromm@dresearch-fe.de>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQkHKDQJ/M1HLm8lzTtXjHbp5nGP948Fnlt/xNqtByTUel9rhiyQs3dYOsYKTTlb06lMnS3F
Subject: Re: Where do I override DISTRO_FEATURES?
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
X-List-Received-Date: Wed, 16 May 2012 08:47:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello Koen,

>> I'm trying to remove an element from DISTRO_FEATURES (specifically
>> "ld-is-gold"), but I am unable to find the right spot to do it. The
>> distribution we're using (Angstrom, as it happens) sets this in
>> conf/distro/angstrom-v2012.x.conf.
>
> Why aren't you using the angstrom release? That isn't using gold.

We're using angstrom-v2012.x.conf from the git HEAD since we want to
stay with latest and greatest for now. angstrom-v2012.x.conf is using
gold. It's OK, really, I think I can handle the gcc-4.5 configure
build problem.

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


