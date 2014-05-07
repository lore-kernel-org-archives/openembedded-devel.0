Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4F46D60167
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 May 2014 08:57:55 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 07 May 2014 01:57:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,1001,1389772800"; d="scan'208";a="507519253"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.122.213])
	by orsmga001.jf.intel.com with ESMTP; 07 May 2014 01:57:54 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 07 May 2014 09:57:52 +0100
Message-ID: <6062362.lpz6Qfmmsr@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.5 (Linux/3.14.2-200.fc20.x86_64; KDE/4.12.4; x86_64; ; )
In-Reply-To: <lkcqt0$j26$1@ger.gmane.org>
References: <1399445635-29373-1-git-send-email-koen.kooi@linaro.org>
	<CAMKF1so17ynGToCMO_i8mw+UpUdnZC3NL_797JJbbrbMOd=_-w@mail.gmail.com>
	<lkcqt0$j26$1@ger.gmane.org>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] openldap: fix build against gnutls3
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
X-List-Received-Date: Wed, 07 May 2014 08:57:58 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 07 May 2014 10:29:21 Koen Kooi wrote:
> Khem Raj schreef op 07-05-14 09:47:
> > On Tue, May 6, 2014 at 11:53 PM, Koen Kooi <koen.kooi@linaro.org> wrote:
> >> ++                              TLS_LIBS="-lgnutls -lgcrypt"
> > 
> > Does this mean we need something more in DEPENDS or DEPENDS part of
> > PACKAGECONFIG too ?
> 
> Should be automatic since gnutls depends on it. It's not a new dependency.

BitBake does not automatically ensure dependencies-of-dependencies are in the 
sysroot. They almost always will be, but I have seen failures in these kinds 
of situations before. Since it explicitly wants to link against libgcrypt, 
libgcrypt should be in its DEPENDS.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

