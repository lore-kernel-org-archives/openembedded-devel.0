Return-Path: <olof.johansson@axis.com>
X-Greylist: delayed 586 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 19 Feb 2016 14:09:23 UTC
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 364FE771D8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Feb 2016 14:09:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id B42DE2E0AC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Feb 2016 14:59:37 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id kUg5emNt-IRQ
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Feb 2016 14:59:37 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id 460152E0A7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Feb 2016 14:59:37 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 2715D1669
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Feb 2016 14:59:37 +0100 (CET)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id 1BFA010F0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Feb 2016 14:59:37 +0100 (CET)
Received: from lnxolofjn.se.axis.com (lnxolofjn.se.axis.com [10.92.17.1])
	by thoth.se.axis.com (Postfix) with ESMTP id 19FD83424D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Feb 2016 14:59:37 +0100 (CET)
Received: by lnxolofjn.se.axis.com (Postfix, from userid 20466)
	id 075A19C075; Fri, 19 Feb 2016 14:59:36 +0100 (CET)
Date: Fri, 19 Feb 2016 14:59:36 +0100
From: Olof Johansson <olof.johansson@axis.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160219135936.GA31212@axis.com>
References: <CAAPZna3WT_cz9YpCaE0iueYXCYxNd0ONRCu0=yuHLcrqUdoKaw@mail.gmail.com>
	<6E3439D2-FEE9-4286-88C5-0D7E3E2AF4B2@gmail.com>
	<CAP9ODKpXkzdSki8exzpbge08Uns1M3rQcc2C1UTPGpuA-WUKOQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKpXkzdSki8exzpbge08Uns1M3rQcc2C1UTPGpuA-WUKOQ@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-python] Python Flask recipes
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
X-List-Received-Date: Fri, 19 Feb 2016 14:09:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 16-02-19 11:32 -0200, Otavio Salvador wrote:
> Agreed but this is a specific framework which is not 'core' to python.
> Do you think we ought to merge those on meta-python or keep them split
> out?

Things that are really core to python are already in OE-Core,
built as part of the python recipe. Even if *I* don't use
something, I would expect a meta-python layer to include all
(reasonably common) parts of the python ecosystem, and doing web
applications is certainly one part of that.

-- 
olofjn

