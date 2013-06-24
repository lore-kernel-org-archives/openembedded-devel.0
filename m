Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f42.google.com (mail-pb0-f42.google.com
	[209.85.160.42])
	by mail.openembedded.org (Postfix) with ESMTP id E0994618B5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jun 2013 15:49:31 +0000 (UTC)
Received: by mail-pb0-f42.google.com with SMTP id un1so11207373pbc.15
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jun 2013 08:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=K62IDKhYENujIIBEPU9UnxY2fxBzfmlWpkE39s6X0/M=;
	b=GCPTUNqjHHJxFsgBVQPyFMUj9kGu0qqIXhtGVt2++fVHqIQ3qQCwoIrONk7gpIG8sh
	1XAPWVS3umP40wft2qwiIRxEKKyaEghFV5MVX8DnCDxoAElxVxjkKS4EsLgBA4+Dy7hj
	aXeC10iu1qY58hPCnsJ8fYe+oStwZcMWfOF5p5IATeepZliGH/lOhWQD33rAH2/XTtpI
	bNHKwqmsgC3SvPHipstuFcuFRlhdABv6IKXscoklie+ojCBfGrbYWvWL6VAc02RNGWzv
	pIY6ZxDty6eQuWLEsBd1ke4XvZLkw50LjYnT+e6QFL0Ep+XBYsmzEUqXv2YTaKKUlb7G
	y4tg==
X-Received: by 10.67.10.163 with SMTP id eb3mr14384034pad.70.1372088972961;
	Mon, 24 Jun 2013 08:49:32 -0700 (PDT)
Received: from kosborne-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPSA id e2sm18712686pbc.23.2013.06.24.08.49.31
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 24 Jun 2013 08:49:32 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <34304782.BKnWrLGkFL@helios>
Date: Mon, 24 Jun 2013 08:49:31 -0700
Message-Id: <9288FDDF-3E67-4A30-BFF2-27A151BB2350@gmail.com>
References: <1372031841-21518-1-git-send-email-raj.khem@gmail.com>
	<34304782.BKnWrLGkFL@helios>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1508)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] proj: Update to 4.8.0
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
X-List-Received-Date: Mon, 24 Jun 2013 15:49:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Jun 24, 2013, at 7:10 AM, Paul Eggleton =
<paul.eggleton@linux.intel.com> wrote:

> Just so I'm clear, are we embarking on a policy now of dropping inc =
files?
>=20

depends. if recipes aren't updates frequent enough and chances of =
overrides existing in
remote layers is slim and we don't intend to carry multiple versions of =
the package
then carrying an .inc is not serving much purpose.=

