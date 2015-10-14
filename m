Return-Path: <sjl@dent.vctlabs.com>
Received: from dent.vctlabs.com (dent.vctlabs.com [68.183.110.161])
	by mail.openembedded.org (Postfix) with ESMTP id D086876E3F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Oct 2015 18:18:41 +0000 (UTC)
Received: by dent.vctlabs.com (Postfix, from userid 1000)
	id 0BBADC05A2; Wed, 14 Oct 2015 11:35:56 -0700 (PDT)
Date: Wed, 14 Oct 2015 11:35:56 -0700
From: "S. Lockwood-Childs" <sjl@vctlabs.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151014183556.GB3552@dent.vctlabs.com>
MIME-Version: 1.0
In-Reply-To: <1439220090-3305-1-git-send-email-s.mueller-klieser@phytec.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: Re: kernel.bbclass: Fix do_shared_workdir task ordering
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
X-List-Received-Date: Wed, 14 Oct 2015 18:18:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

http://patchwork.openembedded.org/patch/99875/

Apparently this patch is still not in master, and I just ran across the
problem with an externally built module (omaplfb from omap3-sgx-modules) 
in meta-ti layer.

What's the plan for getting a correct Module.symver into shared_workdir 
for external modules to build against? Above patch, or does someone have
an even better idea?

