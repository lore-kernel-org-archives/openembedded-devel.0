Return-Path: <sjl@vctlabs.com>
X-Greylist: delayed 525 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 13 May 2017 06:42:37 UTC
Received: from dent.vctlabs.com (net-cf9a4187.iis.impulse.net [207.154.65.135])
	by mail.openembedded.org (Postfix) with ESMTP id 4AA5B60684
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 May 2017 06:42:37 +0000 (UTC)
Received: by dent.vctlabs.com (Postfix, from userid 1000)
	id DF15C28019E; Fri, 12 May 2017 23:34:15 -0700 (PDT)
Date: Fri, 12 May 2017 23:34:15 -0700
From: "S. Lockwood-Childs" <sjl@vctlabs.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20170513063415.GQ9767@vctlabs.com>
Mail-Followup-To: "S. Lockwood-Childs" <sjl@vctlabs.com>,
	openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: meta-python: outrageously long cython shebang with pyro
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
X-List-Received-Date: Sat, 13 May 2017 06:42:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The recipe-specific sysroots in pyro are a wonderful thing for uncovering 
missing dependencies, but they also make it easier than ever to break
the cython scripts by exceeding the measly 128-byte limit on shebang lines. 

The cython recipe builds fine -- this is runtime breakage from recipes that
depend on cython. This was always a danger when using lengthy toplevel
directory names (e.g. as tends to happen in jenkins auto-builds), but
now I managed to get the dreaded "bad interpreter: No such file or directory"
failure from cython despite a not-ridiculously-long toplevel path:

#!/var/data/sjl/poky/build/tmp/work/armv7a-neon-oe-linux-gnueabi/libplist/git-r0/recipe-sysroot-native/usr/bin/python-native/python

Does anybody know of a recommended strategy for solving the shebang problem,
now that it has been exacerbated by the sysroot move? I'll be happy to submit a
corresponding cython patch if so. 

