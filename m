Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 7CF2372718
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jan 2015 11:22:12 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 23 Jan 2015 03:22:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="444154963"
Received: from vvatula-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.22.114])
	by FMSMGA003.fm.intel.com with ESMTP; 23 Jan 2015 03:08:44 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Szombathelyi =?ISO-8859-1?Q?Gy=F6rgy?= <gyurco@freemail.hu>,
	Joe MacDonald <joe_macdonald@mentor.com>
Date: Fri, 23 Jan 2015 11:22:10 +0000
Message-ID: <3857819.a4dzGtPs1K@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.3 (Linux/3.17.8-200.fc20.x86_64; KDE/4.14.3; x86_64; ; )
In-Reply-To: <1475068.2YaKjJgxm5@gyurco.localdomain>
References: <3131686.1jEHazhdRQ@gyurco.localdomain>
	<1443677.77tJzovrQh@gyurco.localdomain>
	<1475068.2YaKjJgxm5@gyurco.localdomain>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH]ntp: fix perl path
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
X-List-Received-Date: Fri, 23 Jan 2015 11:22:19 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Wednesday 21 January 2015 21:05:12 Szombathelyi Gy=F6rgy wrote:
> ...more precisely, without the patch ntp-utils will have a /bin/perl
> dependency, so it becomes uninstallable (nothing provides /bin/perl).=


We do definitely want to fix this, yes - and the breakage may have been=
 my=20
fault, sorry about that.

I think one reason your patch hasn't been picked up yet may be that it =
should=20
have been marked as [meta-networking] rather than [meta-oe] since meta-=

networking is the layer in which the ntp recipe resides.

Joe, can you please apply this?

Thanks,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre

