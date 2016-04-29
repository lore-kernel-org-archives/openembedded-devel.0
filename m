Return-Path: <maxin.john@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 7408B76988
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Apr 2016 10:22:37 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 29 Apr 2016 03:22:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,551,1455004800"; d="scan'208";a="969070109"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.71])
	by fmsmga002.fm.intel.com with ESMTP; 29 Apr 2016 03:22:13 -0700
Date: Fri, 29 Apr 2016 13:22:16 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160429102215.GA2857@mbabyjoh-desk.ger.corp.intel.com>
References: <1461912501-602-1-git-send-email-erkka.kaaria@intel.com>
MIME-Version: 1.0
In-Reply-To: <1461912501-602-1-git-send-email-erkka.kaaria@intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-java][PATCH v2 1/3] java-bootstrapping: Do not rely on hardcoded paths
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
X-List-Received-Date: Fri, 29 Apr 2016 10:22:38 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi,

On Fri, Apr 29, 2016 at 09:48:19AM +0300, Erkka K‰‰ri‰ wrote:
> Various paths to files are hardcoded in either helper scripts or the
> resulting binaries (like path to Java class libraries). While this works
> well when using the files on the build machine, things start breaking
> down when the sstate gets shared between multiple workers in CI, as
> the paths between workers can differ.
> 
> Instead of using these hardcoded paths, form the paths at runtime and pass them as parameters when required.
> 
> Signed-off-by: Erkka K‰‰ri‰ <erkka.kaaria@intel.com>
> ---
>  ...cacao-1.6.1-do-not-rely-on-absolute-paths.patch | 41 ++++++++++++++++++++++
>  recipes-core/cacao/cacao-initial-native_0.98.bb    |  1 +
>  recipes-core/cacao/cacao_1.6.1.bb                  | 21 ++++-------
>  ...cacao-0.9.8-do-not-rely-on-absolute-paths.patch | 33 +++++++++++++++++
>  recipes-core/ecj/ecj-bootstrap-native.bb           |  8 ++++-
>  recipes-core/ecj/ecj-initial-native.bb             |  9 ++++-
>  6 files changed, 96 insertions(+), 17 deletions(-)
>  create mode 100644 recipes-core/cacao/cacao-1.6.1/cacao-1.6.1-do-not-rely-on-absolute-paths.patch
>  create mode 100644 recipes-core/cacao/files/cacao-0.9.8-do-not-rely-on-absolute-paths.patch

Pushed to master. Thank you!

Best Regards,
Maxin

