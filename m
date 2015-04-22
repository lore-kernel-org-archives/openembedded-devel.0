Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f179.google.com (mail-pd0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id 2208560167
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Apr 2015 01:48:46 +0000 (UTC)
Received: by pdbqa5 with SMTP id qa5so258758572pdb.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Apr 2015 18:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to;
	bh=7qU19NFNs/NCOi3MsIu7btI4zc2s+Thhmzbn0pVjRuo=;
	b=yRb1qmL6HYCzCHBFIhx7PWE6KF3rrJ2/J0VoV7c5RJ/mOonlxrV6oIzrG5pM5TQVwk
	jXVZDWOHSFAU1Xl2eIBPacX6+1lbYBA4YkoQK6PQ2DwHtc2C2MsE6HYqi+f6W9yfHI6A
	bTpucVjhu4kW6tVSBQe2+ByzwS1VdULff4cW6cZ4w5Ay3rxYxJ/G5LDrNE6tg6CMryGW
	JxEUlC2kZmbHbdrZiGKTCwUA94FFn9KFiVHF/zcyK778fJ6Ls88oKRPHZgab/oCjC7HH
	02hJs3h/U5Nuj09T2TCePX8Sqz/JmhcO2ADt0L+dWKaq2hVsMGNxANak7jLT9knzbSat
	b0+Q==
X-Received: by 10.70.133.170 with SMTP id pd10mr42469037pdb.127.1429667328119; 
	Tue, 21 Apr 2015 18:48:48 -0700 (PDT)
Received: from ?IPv6:2601:9:3580:84c:d437:6da1:248:2a1a?
	([2601:9:3580:84c:d437:6da1:248:2a1a])
	by mx.google.com with ESMTPSA id
	og11sm3275986pdb.91.2015.04.21.18.48.47
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 21 Apr 2015 18:48:47 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1429622845-32029-1-git-send-email-Martin.Jansa@gmail.com>
Date: Tue, 21 Apr 2015 18:48:46 -0700
Message-Id: <4A562261-AC0D-4171-8334-F4B02A823B50@gmail.com>
References: <1429622845-32029-1-git-send-email-Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2098)
Subject: Re: [meta-oe][PATCH] dialog-static: blacklist
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Apr 2015 01:48:47 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> On Apr 21, 2015, at 6:27 AM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
>=20
> +PNBLACKLIST[dialog-static] ?=3D "BROKEN: dialog.c:1378: error: =
undefined reference to 'COLS'"
> LDFLAGS +=3D "-static"

Why don=E2=80=99t we add

LDFLAGS +=3D "-lcurses -ltinfo -static=E2=80=9D and fix it instead=

