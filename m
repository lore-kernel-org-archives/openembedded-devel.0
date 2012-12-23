Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1TmqF8-0006o5-Ba
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Dec 2012 19:25:48 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so2570626eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2012 10:10:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=sd6Fqm+fRvhWrXDO9kiXF2INXZT1gHnzyuTOxjK2bW0=;
	b=QEGTxlwyq5RIWaz382BV+A8OG6DKH5FLgjDJ/FePLotWPip7QqXcEongvQDcundmkv
	fTXZ2DOaFBcNhm2daPFcZeJouhaFhW6dv62aI7/05M9CXrQ9HHxRY+X+H0xXj8/krvyi
	UrXewoldxQn3yXYOgQBPGa+WHEPTu/HgYw7pGdEIZlmMt8nDfOUzRCrXZ/ewxHjCCbr3
	OpkuDbHb774ObS7rhSQ18xQeV1O23StieS+pUoWhT/PxNWBBEVQVE/ZiY2FVUUK/cB4i
	aHEH2a+7ozDfWXRZdMgeHm9mjRYdUkOzyrb8CAUpiZzzatLZ3RaDVwiMla96h/BqRuAf
	Q5Fw==
X-Received: by 10.14.174.198 with SMTP id x46mr49692995eel.23.1356286257491;
	Sun, 23 Dec 2012 10:10:57 -0800 (PST)
Received: from [172.20.0.100] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id 43sm36228156eed.10.2012.12.23.10.10.55
	(version=SSLv3 cipher=OTHER); Sun, 23 Dec 2012 10:10:56 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20121223154736.3c151ef8@eb-e6520>
Date: Sun, 23 Dec 2012 19:10:54 +0100
Message-Id: <3DF8EBF7-61B4-4EBB-9C58-D1C63256FEF5@dominion.thruhere.net>
References: <CAMBWrQnMQtEs78=OtkSR1mjctfet8ArQ_XE43wDB6-6NKiDShA@mail.gmail.com>
	<CAMBWrQm6UbF9t5sAn=oudmhQ2MJdDNMb3ki6o7_sdjErun4SWw@mail.gmail.com>
	<CA+chaQcvSts25RvERVyOxOcsqaLRfADf8zTq_YpqAB8Bp_O+fg@mail.gmail.com>
	<CAMBWrQ=J8n9tm99UT0QvcU1oB4kUtpH+kguDUYfxWP7_u_TPYQ@mail.gmail.com>
	<20121222100318.14a48e10@eb-e6520> <kb40tq$84p$1@ger.gmane.org>
	<20121222120551.6916471a@eb-e6520>
	<20121223154736.3c151ef8@eb-e6520>
To: =?iso-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
X-Mailer: Apple Mail (2.1499)
X-Gm-Message-State: ALoCoQm6RiKVeC/yFl4eTfLPaoucS6SNovLZz1l87e1Npo4A3YeegHAuIO0ljP7YNpRUPRM1eGN8
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Multiple .bb files are due to be built which each provide udev
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
X-List-Received-Date: Sun, 23 Dec 2012 18:25:48 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 23 dec. 2012, om 15:47 heeft Eric B=E9nard <eric@eukrea.com> het =
volgende geschreven:

> Hi Koen,
>=20
> I need your help concerning denzil if you need to keep systemd 189
> there :
>=20
> with PREFERRED_PROVIDER_udev =3D "udev"
> systemd fails to package here

If you're going to use systemd then you'll need to use the matching udev =
version. New systemd with old udev won't work.

regards,

Koen=


