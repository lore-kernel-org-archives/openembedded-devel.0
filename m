Return-Path: <maxin.john@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3E2F56FF84
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Dec 2015 13:27:23 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 11 Dec 2015 05:27:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,413,1444719600"; d="scan'208";a="871623717"
Received: from mbabyjoh-mobl.fi.intel.com ([10.237.72.71])
	by fmsmga002.fm.intel.com with ESMTP; 11 Dec 2015 05:27:21 -0800
Date: Fri, 11 Dec 2015 15:28:34 +0200
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151211132834.GB15763@mbabyjoh-mobl.fi.intel.com>
References: <1449737145-27963-1-git-send-email-erkka.kaaria@intel.com>
MIME-Version: 1.0
In-Reply-To: <1449737145-27963-1-git-send-email-erkka.kaaria@intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-java][PATCH] gnumail: Fix race condition in makefile
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
X-List-Received-Date: Fri, 11 Dec 2015 13:27:27 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Erkka,

On Thu, Dec 10, 2015 at 10:45:45AM +0200, Erkka K‰‰ri‰ wrote:
> Parallel make does not handle multiple javac invocations correctly, as javac
> compiles any uncompiled dependencies on its own. This leads to a race condition
> where make may see incomplete class files and incorrectly assume that the
> class files has already been compiled. This ultimately causes incomplete class
> files to be included in one of the jars, causing build failures later one when
> javac attempts to use such class file.
> 
> This issue is fixed by patching the makefile so that only one instance of javac
> is invoked, which compiles all the java files in one go.
> 
> Signed-off-by: Erkka K‰‰ri‰ <erkka.kaaria@intel.com>
> ---
>  .../fix_makefile_race_condition.patch              | 129 +++++++++++++++++++++
>  recipes-core/classpathx/gnumail_1.1.2.bb           |   1 +

Pushed to master with the fix for encoding weirdness which caused some troubles.
Thanks for these fixes.

Best Regards,
Maxin

