Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id EC2CE6B5C6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Feb 2019 05:30:25 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Feb 2019 21:30:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,387,1544515200"; d="scan'208";a="144588978"
Received: from hliu15-mobl2.amr.corp.intel.com ([10.251.132.5])
	by fmsmga002.fm.intel.com with ESMTP; 18 Feb 2019 21:30:26 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
Mime-Version: 1.0 (Mac OS X Mail 12.2 \(3445.102.3\))
Message-Id: <121AFB8E-F806-4725-BCE0-E6E14952B2CD@linux.intel.com>
Date: Mon, 18 Feb 2019 21:30:25 -0800
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
X-Mailer: Apple Mail (2.3445.102.3)
Subject: UPSTREAM_CHECK_REGEX help needed with libterm-readkey-perl
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
X-List-Received-Date: Tue, 19 Feb 2019 05:30:27 -0000
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

I cannot figure out what I am missing. I have tried (and other =
variations):

UPSTREAM_CHECK_REGEX =3D =
"TermReadKey\-(?P<pver>(\d+\.\d+))(?!_\d+)\.tar=E2=80=9D

But still the result is:

INFO: Skip package libterm-readkey-perl (status =3D UNKNOWN_BROKEN, =
current version =3D 2.37, next version =3D N/A)


This is the only perl module recipe in meta-perl/meta-oe that does not =
properly check upstream version.

=E2=80=94Tim=

