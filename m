Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f52.google.com (mail-pb0-f52.google.com
	[209.85.160.52])
	by mail.openembedded.org (Postfix) with ESMTP id 3F6E26CFE9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Oct 2013 19:45:39 +0000 (UTC)
Received: by mail-pb0-f52.google.com with SMTP id wz12so6403929pbc.25
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Oct 2013 12:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=sMlEjDB2H2/flopJaODnF+Cd+UmdnC7KhU5Y3DTEnWQ=;
	b=r5+mLVU66MARkCYLlwEOppLIrT/K4ZEm1nDyeEJM/k0HTdxtHYiJ8XLVYctBBaDhUA
	END0rMZCRfJJ/ARGR3UmwFcPkfwIafHsK2u6I+yhraOhkiShHE5aE6xJfv/OZEvAIF6J
	JdETQvDXyA1ZXWhnzJceg7w2A4wwpwNqignH2kWl7MBjwTJ7JaUlSWtJhGHo83haAxEj
	kFjEETXElDaNePxKhy4qF1H7UdKH/J/+xwzzqIXl7EZ0znuBtt5GGKEZCOQGZb4+hwVw
	as63Rqpm23g/sA6DknP+z/wGDScmauPqWU7oEBzg37gitmofNZ0NyFLdjue2y1R8P5tG
	lilQ==
X-Received: by 10.68.197.73 with SMTP id is9mr31910845pbc.75.1381693540704;
	Sun, 13 Oct 2013 12:45:40 -0700 (PDT)
Received: from kraj-sslvpn-nc.jnpr.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPSA id
	tz3sm73494568pbc.20.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 13 Oct 2013 12:45:39 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.6 \(1510\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1596233.ZQ7J3xl2Nd@helios>
Date: Sun, 13 Oct 2013 12:45:38 -0700
Message-Id: <1D7F89CC-74A8-4960-BE17-B59701B0F943@gmail.com>
References: <1381653835-32079-1-git-send-email-raj.khem@gmail.com>
	<1596233.ZQ7J3xl2Nd@helios>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1510)
Cc: Cliff Brake <cbrake@bec-systems.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 1/6] libraw1394: add recipe
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
X-List-Received-Date: Sun, 13 Oct 2013 19:45:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Oct 13, 2013, at 4:10 AM, Paul Eggleton =
<paul.eggleton@linux.intel.com> wrote:

> On Sunday 13 October 2013 01:43:50 Khem Raj wrote:
>> From: Cliff Brake <cbrake@bec-systems.com>
>>=20
>> Initial recipe created by Khem Raj
>>=20
>> Signed-off-by: Cliff Brake <cbrake@bec-systems.com>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> meta-oe/recipes-multimedia/libraw1394/libraw1394_2.0.9.bb | 11 =
+++++++++++
>=20
> Could these multimedia recipes go into meta-multimedia instead of =
meta-oe?

Its ok to put them into meta-multimedia, but they depend on meta-oe a =
lot
may be more recipes like opencv should be moved as well.

Martin, do you need a fresh set of patches for it or can you handle the =
move from
meta-oe -> meta-multimedia

>=20
> Cheers,
> Paul
>=20
> --=20
>=20
> Paul Eggleton
> Intel Open Source Technology Centre


