Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 837546E630
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Mar 2016 09:26:38 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 22 Mar 2016 02:26:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,376,1455004800"; d="scan'208";a="673689764"
Received: from mbabyjoh-mobl.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.71])
	by FMSMGA003.fm.intel.com with ESMTP; 22 Mar 2016 02:26:18 -0700
Date: Tue, 22 Mar 2016 11:26:32 +0200
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160322092632.GA9238@mbabyjoh-desk.ger.corp.intel.com>
References: <1458560352-17973-1-git-send-email-erkka.kaaria@intel.com>
	<1458560352-17973-2-git-send-email-erkka.kaaria@intel.com>
MIME-Version: 1.0
In-Reply-To: <1458560352-17973-2-git-send-email-erkka.kaaria@intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-java][PATCH 2/2] Openjdk-8: Fix build flags for adlc
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
X-List-Received-Date: Tue, 22 Mar 2016 09:26:38 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Erkka,

On Mon, Mar 21, 2016 at 01:39:12PM +0200, Erkka Kääriä wrote:
> Adlc is a native tool that openjdk builds and uses during its build process.
> Bitbake however passes target machine specific CFLAGS and CXXFLAGS because we
> are crosscompiling openjdk for the target architecture. This can cause issues,
> if these flags contains values, that work for the Yocto provided crosscompiler
> but not for the system compiler.
> 
> As an example, compilation will fail on Ubuntu 14.04 if
> -fstack-protector-strong is specified in the distro security flags. Ubuntu
> 14.04 ships with GCC 4.8, whereas this flag is only supported by GCC 4.9+.

Pushed both these fixes to master-next. Thanks !

Best Regards,
Maxin

