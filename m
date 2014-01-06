Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id E581860D2D
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Jan 2014 09:46:18 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 06 Jan 2014 01:46:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,611,1384329600"; d="scan'208";a="454176586"
Received: from unknown (HELO helios.localnet) ([10.252.122.119])
	by fmsmga001.fm.intel.com with ESMTP; 06 Jan 2014 01:46:18 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Detlef Vollmann <dv@vollmann.ch>
Date: Mon, 06 Jan 2014 09:46:17 +0000
Message-ID: <2452646.bnugQMsZpK@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-34-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <52C9DCCB.5070602@vollmann.ch>
References: <52C9DCCB.5070602@vollmann.ch>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: ASSUME_PROVIDED += sqlite3-native doesn't work
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
X-List-Received-Date: Mon, 06 Jan 2014 09:46:21 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Detlef,

On Sunday 05 January 2014 23:29:31 Detlef Vollmann wrote:
> Specifying "ASSUME_PROVIDED += sqlite3-native" doesn't work,
> as pseudo-native explicitely requires SQLite headers in
> ${STAGING_DIR_NATIVE}.
> Am I missing something or is this a bug?

I don't think we'd consider this a bug. Basically, if you play around with 
ASSUME_PROVIDED and stuff breaks, you're on your own. In most cases it's safer 
to build our own versions of things rather than relying on them being 
available on the build host, particularly if you want things to continue to 
work on different host distributions.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

