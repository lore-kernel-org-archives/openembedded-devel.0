Return-Path: <behanw@converseincode.com>
Received: from mail-pg0-f49.google.com (mail-pg0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id 4EDEB78212
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Aug 2017 16:54:49 +0000 (UTC)
Received: by mail-pg0-f49.google.com with SMTP id v77so5173249pgb.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Aug 2017 09:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=converseincode.com; s=google;
	h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
	:references; bh=ihr1Ri9Z2IlTcbblzqrqxsBN0JORK5A+X9jYsY10Y7M=;
	b=Wq6xZaw52vGhDLwBz+ImTGY0V+xR5hJfYHOVGLHJu+JJMVUvOeeRta/9HU7dyD95IG
	mBS4VxXDhVL2EfjzvrrNOB8JsafAa+rc5XLAU5pVUDFiYFMGR5c+pFh/rpjT5SIsX2ih
	Fkt2OUdmpZnwD1KoxYM39FTvZ6dZMCcIZjMwk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:mime-version:subject:date
	:in-reply-to:cc:to:references;
	bh=ihr1Ri9Z2IlTcbblzqrqxsBN0JORK5A+X9jYsY10Y7M=;
	b=YhcjuJZxZphz+WrsCAje3E/D5w7ebwqmWWEfk2LY24PUv23lhW7y3si8c7xj/fzN5b
	rQNfm6eIF+D64iCRVJaAm7m7kMtUWRI8TF+6XdpbZ+E7HjNH01qTnWb4CObyNaUyHgQ2
	qyCZiNHMj/frw7rxei7QvVSsrmNpRQ7TIy/fMINKIGQMy6Z52lVPRK1khOLPCGZynKX+
	xjsewSmpalQQjqgDb3Ii4XCAuZdH79zikXo3aIBL7W+0aT0CdsyEYFuhrZSfS2HCU8ZX
	Q4VHViaAvfFuk6zfuU/HbKUTf1Kaq3npkcWKmg+JcBKUUmmmtZB+ChovXCQUZlG0Rtmr
	CKPA==
X-Gm-Message-State: AHYfb5hThQZ051HHb7jeV4xxmHZYBej3PDp1SxpZ8E+T5gmagOgcHAYA
	YCBi94Lq6Hr/g7JB
X-Received: by 10.99.113.79 with SMTP id b15mr12175621pgn.11.1502384091552;
	Thu, 10 Aug 2017 09:54:51 -0700 (PDT)
Received: from [192.168.120.225] (d207-6-122-147.bchsia.telus.net.
	[207.6.122.147]) by smtp.gmail.com with ESMTPSA id
	z25sm10748676pfg.113.2017.08.10.09.54.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Aug 2017 09:54:50 -0700 (PDT)
From: Behan Webster <behanw@converseincode.com>
Message-Id: <11A89FF7-A4CE-4287-889F-AED3D0A5EA3F@converseincode.com>
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Date: Thu, 10 Aug 2017 09:54:49 -0700
In-Reply-To: <B7CAC62B-B2BD-4DB5-BE14-83EB8AA6EEF8@converseincode.com>
To: Tim Orling <ticotimo@gmail.com>
References: <73F79297-B92A-4F4D-A3F1-A3F43CD39DAE@converseincode.com>
	<1502288526.1934.39.camel@linux.intel.com>
	<879E7479-CCE4-47D5-BB40-E789BA93185C@converseincode.com>
	<CANx9H-AJpd0OpMG13ps89kQ7bpzH3b3GdN5xzfhVPTW3EcdjmA@mail.gmail.com>
	<CANx9H-D3NL4ikmCGQ5NS5b+70-3drcYr=5Pp1dhpVOdcm=Sm+g@mail.gmail.com>
	<B7CAC62B-B2BD-4DB5-BE14-83EB8AA6EEF8@converseincode.com>
X-Mailer: Apple Mail (2.3273)
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: Alpha release of check-requirement.sh
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 10 Aug 2017 16:54:51 -0000
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

> On Aug 10, 2017, at 9:49 AM, Behan Webster <behanw@converseincode.com> =
wrote:
>=20
> There is already a test system for packages per distro. It uses a =
second script called pkgsearch which uses meta data from pkgs.org =
<http://pkgs.org/> (pkgsearch is also in my git repo). You can see part =
of the test machinery in the =E2=80=94check-packages option in the =
check-requirements.sh script. (I couldn=E2=80=99t maintain the lists of =
packages for all the LF courses without an automated test system).
>=20


If anyone is interested, pkgsearch is here, though not advertised =
anywhere (I suppose it is now). ;)

https://training.linuxfoundation.org/cm/prep/pkgsearch =
<https://training.linuxfoundation.org/cm/prep/pkgsearch>

Again, all in git. Just tied into a lot of other LF things right now I =
need to disentangle.

Behan=

