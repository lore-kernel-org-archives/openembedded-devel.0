Return-Path: <maxin.john@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id F1C48731CC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Apr 2016 11:43:01 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 28 Apr 2016 04:43:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,546,1455004800"; d="scan'208";a="968344124"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.71])
	by fmsmga002.fm.intel.com with ESMTP; 28 Apr 2016 04:43:01 -0700
Date: Thu, 28 Apr 2016 14:43:02 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160428114301.GB28788@mbabyjoh-desk.ger.corp.intel.com>
References: <1461322108-20584-1-git-send-email-erkka.kaaria@intel.com>
MIME-Version: 1.0
In-Reply-To: <1461322108-20584-1-git-send-email-erkka.kaaria@intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-java][PATCH 1/3] java-bootstrapping: Do not rely on hardcoded paths
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
X-List-Received-Date: Thu, 28 Apr 2016 11:43:02 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Erkka,

Have a couple of comments about this patch-set:

1. Upstream-Status is missing
2. cacao build fails after applying this patch. 

On Fri, Apr 22, 2016 at 01:48:26PM +0300, Erkka Kääriä wrote:
> Various paths to files are hardcoded in either helper scripts or the
> resulting binaries (like path to Java class libraries). While this works
> well when using the files on the build machine, things start breaking
> down when the sstate gets shared between multiple workers in CI, as
> the paths between workers can differ.
> 
> Instead of using these hardcoded paths, form the paths at runtime and pass them as parameters when required.
> 
<snip>


> -do_install_append () {
> -    rm ${D}/${bindir}/java
> -}
> -
> -do_install_append_class-native () {
> -    ln -sf cacao ${D}/${bindir}/java
> -}

# bitbake cacao 
...
NOTE: Executing RunQueue Tasks
ERROR: cacao-1.6.1-r0 do_package: QA Issue: cacao: Files/directories were installed but not shipped in any package:
  /usr/bin/java
  Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
  cacao: 1 installed and not shipped files. [installed-vs-shipped]
  ERROR: cacao-1.6.1-r0 do_package: Fatal QA errors found, failing task.
  ERROR: cacao-1.6.1-r0 do_package: Function failed: do_package

Please fix it.

Best Regards,
Maxin

