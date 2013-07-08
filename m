Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 8A20F6AF13
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Jul 2013 12:35:22 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 08 Jul 2013 05:36:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1020,1363158000"; d="scan'208";a="366825233"
Received: from unknown (HELO helios.localnet) ([10.252.122.28])
	by fmsmga002.fm.intel.com with ESMTP; 08 Jul 2013 05:35:21 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 08 Jul 2013 13:35:21 +0100
Message-ID: <10175102.kSY1axEz5R@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.4 (Linux/3.8.0-26-generic; KDE/4.10.4; i686; ; )
In-Reply-To: <20130705194525.667209b0@e6520eb>
References: <1373043676-5621-1-git-send-email-otavio@ossystems.com.br>
	<2710952.otpci6RPJ6@helios> <20130705194525.667209b0@e6520eb>
MIME-Version: 1.0
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Eric =?ISO-8859-1?Q?B=E9nard?= <eric@eukrea.com>
Subject: Re: [meta-oe PATCH] busybox: Follow OE-Core update to 1.12.1 version
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
X-List-Received-Date: Mon, 08 Jul 2013 12:35:22 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Friday 05 July 2013 19:45:25 Eric B=E9nard wrote:
> Le Fri, 05 Jul 2013 18:29:04 +0100,
> Paul Eggleton <paul.eggleton@linux.intel.com> a =E9crit :
> > Could someone *please* figure out what this bbappend is needed for =
and get
> > it into OE-Core if it is still needed so we can drop it here?
>=20
> it's only here to install /etc/default/busybox-syslog which contains
> only one line : OPTIONS=3D"-C64" which sets the size of the logbuffer=
.
> So obviously this could go into OE-Core.

Yes but why is this needed? If we are to merge this into OE-Core we'll =
need to=20
say why this change is needed in the commit message.

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre

