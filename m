Return-Path: <maxin.john@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id D5EE56014F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2016 08:33:33 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 31 Aug 2016 01:33:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,261,1470726000"; d="scan'208";a="755354771"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.71])
	by FMSMGA003.fm.intel.com with ESMTP; 31 Aug 2016 01:33:33 -0700
Date: Wed, 31 Aug 2016 11:31:15 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160831083114.GA27076@mbabyjoh-desk.ger.corp.intel.com>
References: <9cb3a54e-58ef-9433-06d9-514238fb9443@siemens.com>
MIME-Version: 1.0
In-Reply-To: <9cb3a54e-58ef-9433-06d9-514238fb9443@siemens.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-java] Unify virtual java providers
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
X-List-Received-Date: Wed, 31 Aug 2016 08:33:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Tue, Aug 30, 2016 at 04:37:53PM +0200, Pascal Bach wrote:
> Hello
> 
> 
> Because I'm experimenting with different java providers (OpenJDK, Oracle Java, Azul Zulu) and thus had a look at different java layers (meta-java, meta-oracle-java).
> 
> I noticed that there are many different PROVIDES statements among these recipes, but nothing seems consistent.
> 
> My proposal is thus to introduce a consistent naming for these provides so that recipes that depend on java can be written in a JRE/JDK independent way.
> The naming would be the following:
> 
> - virtual/java => recipes providing a java runtime for the target (used in meta-oracle-java, replaces: java2-runtime, java2-vm)
> - virtual/java-native => provide a native java runtime (exists already)
> - virtual/javac => provide a jdk for the target (new, nothing like this exists, might never be used but should be defined)
> - virtual/javac-native => provide a jdk for native (exists already)
> 
> It should be properly documented in the readme and the virtual packages should be the preferred way for users to depend on java/jre resp javac/jdk
> 
> An alternative to the above would be:
> 
> - virtual/jre
> - virtual/jre-native
> - virtual/jdk
> - virtual/jdk-native
> But this would deviate more from the current naming.

+1 for the jre/jdk naming. 

> 
> Any feedback on this proposal?
> 
> Pascal

Best Regards,
Maxin

