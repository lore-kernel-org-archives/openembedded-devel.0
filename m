Return-Path: <maxin.john@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 5E98B6FF9F
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Jan 2018 13:15:24 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Jan 2018 05:15:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,501,1508828400"; 
   d="scan'208";a="7037445"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.84])
	by fmsmga002.fm.intel.com with ESMTP; 03 Jan 2018 05:15:23 -0800
Date: Wed, 3 Jan 2018 15:14:03 +0200
From: "Maxin B. John" <maxin.john@intel.com>
To: liu.ming50@gmail.com
Message-ID: <20180103131403.GA3971@mbabyjoh-desk.ger.corp.intel.com>
References: <1514944050-12039-1-git-send-email-liu.ming50@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1514944050-12039-1-git-send-email-liu.ming50@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-java][PATCH 0/7] Several fixes for java/ant recipes
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
X-List-Received-Date: Wed, 03 Jan 2018 13:15:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Wed, Jan 03, 2018 at 02:47:23AM +0100, liu.ming50@gmail.com wrote:
> From: Ming Liu <liu.ming50@gmail.com>
> 
> Ming Liu (7):
>   meta: drop redundant DEPENDS_virtcalss-native definitions
>   meta: drop deprecated virtclass-native
>   commons-cli: extend native bbclass
>   commons-codec: extend native bbclass

>   commons-httpclient: extend native bbclass

The above listed patch (PATCH 5/7) seems to be missing here. Please resend it.

>   jamvm: avoid checking x11 distro feature for native build
>   ant-contrib-native: add recipe
> 
>  .../ant-contrib/ant-contrib-native_1.0b3.bb        | 37 ++++++++++++++++++++++
>  recipes-core/bcel/bcel_5.2.bb                      |  2 --
>  recipes-core/cup/cup_0.10k.bb                      |  2 +-
>  recipes-core/jakarta-commons/commons-cli_1.1.bb    |  4 +--
>  recipes-core/jakarta-commons/commons-codec_1.3.bb  |  2 ++
>  .../jakarta-commons/commons-httpclient_3.1.bb      |  4 ++-
>  .../jakarta-commons/commons-logging_1.1.1.bb       |  1 -
>  recipes-core/jakarta-commons/commons-net_1.4.1.bb  |  3 +-
>  recipes-core/jakarta-libs/bsf_2.4.0.bb             |  1 -
>  recipes-core/jakarta-libs/log4j1.2_1.2.17.bb       |  1 -
>  recipes-core/jakarta-libs/logkit_1.2.2.bb          |  1 -
>  recipes-core/jamvm/jamvm.inc                       | 17 +++++-----
>  recipes-core/jamvm/jamvm_git.bb                    |  4 ---
>  recipes-core/jcraft/jsch_0.1.40.bb                 |  3 +-
>  recipes-core/jikes/jikes_1.22.bb                   |  4 +--
>  recipes-core/jlex/jlex_1.2.6.bb                    |  2 +-
>  recipes-core/rhino/rhino_1.7r4.bb                  |  2 +-
>  recipes-core/xalan-j/xalan-j_2.7.1.bb              |  3 --
>  recipes-core/xerces-j/xerces-j_2.11.0.bb           |  3 +-
>  .../xml-commons/xml-commons-resolver1.1_1.2.bb     |  1 -
>  20 files changed, 61 insertions(+), 36 deletions(-)
>  create mode 100644 recipes-core/ant-contrib/ant-contrib-native_1.0b3.bb
> 
> -- 

Best Regards,
Maxin

