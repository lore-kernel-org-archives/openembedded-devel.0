Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <josh@linux.intel.com>) id 1OXG4N-0006I9-SN
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Jul 2010 18:05:56 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 09 Jul 2010 02:47:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.53,562,1272870000"; d="scan'208";a="533845604"
Received: from unknown (HELO [10.255.17.68]) ([10.255.17.68])
	by orsmga002.jf.intel.com with ESMTP; 09 Jul 2010 02:49:10 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <201007091049.09034.schnitzeltony@gmx.de>
References: <0B51A1E7C61D114DAE6FC10B0FD0ABA501819DAE@deimsg40.de.net.world>
	<201007091049.09034.schnitzeltony@gmx.de>
Date: Fri, 09 Jul 2010 10:48:32 +0100
Message-ID: <1278668912.2706.3.camel@scimitar>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.2 (2.30.2-1.fc13) 
X-SA-Exim-Connect-IP: 134.134.136.24
X-SA-Exim-Mail-From: josh@linux.intel.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Best practice to resolve dependency loops ?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 09 Jul 2010 16:06:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2010-07-09 at 10:49 +0200, Andreas Mueller wrote:
> On Friday 09 July 2010 10:05:56 am Hauser, Wolfgang (external) wrote:
> > What is the best practice to examine and solve such problems ?
> 
> I would like to add an additional question:
> 
> bitbake supports -g for dependency trees in dot syntax. What is the best tool to browse these files. I checked graphviz but this just paints complete unviewable posters. Is there e.g something like 
> a dot to html converter aavialable?

You can use the dependency explorer UI built into Bitbake:

bitbake -g -u depexp some-task

Cheers,
Joshua
-- 
Joshua Lock
        Intel Open Source Technology Centre



