Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 3E68260017
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Feb 2015 18:26:28 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 02 Feb 2015 10:26:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,507,1418112000"; d="scan'208";a="671624625"
Received: from bbodonog-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.3.158])
	by fmsmga002.fm.intel.com with ESMTP; 02 Feb 2015 10:26:27 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Raphael Freudiger <raphael.freudiger@siemens.com>
Date: Mon, 02 Feb 2015 18:26:27 +0000
Message-ID: <7694448.9cNyM1zEqv@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.4 (Linux/3.17.8-200.fc20.x86_64; KDE/4.14.4; x86_64; ; )
In-Reply-To: <1422877877-4570-1-git-send-email-raphael.freudiger@siemens.com>
References: <1422877877-4570-1-git-send-email-raphael.freudiger@siemens.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v6] p7zip: new recipe
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
X-List-Received-Date: Mon, 02 Feb 2015 18:26:29 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Raphael,

On Monday 02 February 2015 12:51:17 Raphael Freudiger wrote:
> p7zip is the command line version of 7-Zip for Unix/Linux.
> 
> Signed-off-by: Raphael Freudiger <raphael.freudiger@siemens.com>
> Reviewed-By: Pascal Bach <pascal.bach@siemens.com>
> ---
> ...
> +# binary is already stripped, don't strip it again
> +INHIBIT_PACKAGE_STRIP = "1"

I know there have been a lot of suggested revisions already, and someone
should have said this earlier - but in general we prefer to stop the original
stripping from happening rather than trying to work around the result being
stripped. There is a section in the Yocto Project reference manual on how to
deal with various QA issues, the one in question is here:

http://www.yoctoproject.org/docs/current/ref-manual/ref-manual.html#qa-issue-already-stripped

While you are at it if you could set SUMMARY instead of DESCRIPTION (since
the value you're setting is short) that would be great.

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

