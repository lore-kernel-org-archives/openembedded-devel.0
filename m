Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RabPT-0005B4-58
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Dec 2011 00:05:19 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 13 Dec 2011 14:58:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="101866365"
Received: from unknown (HELO helios.localnet) ([10.252.122.62])
	by fmsmga002.fm.intel.com with ESMTP; 13 Dec 2011 14:58:21 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Date: Tue, 13 Dec 2011 22:58:20 +0000
Message-ID: <1545212.W5z1uACr0M@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.3 (Linux/3.0.0-14-generic-pae; KDE/4.7.3; i686; ; )
In-Reply-To: <1323811550-876-1-git-send-email-dbaryshkov@gmail.com>
References: <1323811550-876-1-git-send-email-dbaryshkov@gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-opie][PATCH] opie-bluetoothd: fix compilation issues
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
X-List-Received-Date: Tue, 13 Dec 2011 23:05:19 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 14 December 2011 01:25:50 Dmitry Eremin-Solenikov wrote:
> rfkill.cpp uses symbols from libsysfs. However opie-bluetoothd recipe
> lacks dependency on sysfsutils (package containing libsysfs) and project
> file also lacks -lsysfs in the LIBS rule. Fix those issues.

Rather than apply this patch I've merged the change upstream and updated the 
OPIE_SRCREV in meta-opie to f5c8bd6272b5bee393736f401232ce0ccc984fec (which 
includes a few other fixes as well.) Thanks!

As an aside, I'm contemplating removing the libsysfs-dependent code in favour 
of accessing the files directly, since that's what the current kernel sysfs 
documentation recommends.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


