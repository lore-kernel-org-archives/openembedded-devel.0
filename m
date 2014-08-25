Return-Path: <Yasir_Khan@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 9649565D00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Aug 2014 18:39:14 +0000 (UTC)
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1XLzAh-0006q3-Uh from Yasir_Khan@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Aug 2014 11:39:15 -0700
Received: from svr-pkl-eng-06.pkl.mentorg.com ([137.202.156.65]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Mon, 25 Aug 2014 11:39:15 -0700
From: Yasir-Khan <yasir_khan@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 Aug 2014 23:38:31 +0500
Message-Id: <1408991911-47249-1-git-send-email-yasir_khan@mentor.com>
X-Mailer: git-send-email 1.7.9.5
X-OriginalArrivalTime: 25 Aug 2014 18:39:15.0694 (UTC)
	FILETIME=[DF5970E0:01CFC093]
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [meta-oe][PATCH] lmbench: add lmbench-exception LICENSE
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
X-List-Received-Date: Mon, 25 Aug 2014 18:39:21 -0000

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
Signed-off-by: Yasir-Khan <yasir_khan@mentor.com>
---
 meta-oe/licenses/GPL-2.0-with-lmbench-restriction  |  108 ++++++++++++++++++++
 .../recipes-benchmark/lmbench/lmbench_3.0-a9.bb    |    2 +-
 2 files changed, 109 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/licenses/GPL-2.0-with-lmbench-restriction

diff --git a/meta-oe/licenses/GPL-2.0-with-lmbench-restriction b/meta-oe/licenses/GPL-2.0-with-lmbench-restriction
new file mode 100644
index 0000000..3e1f7cc
--- /dev/null
+++ b/meta-oe/licenses/GPL-2.0-with-lmbench-restriction
@@ -0,0 +1,108 @@
+%M% %I% %E%
+
+The set of programs and documentation known as "lmbench" are distributed
+under the Free Software Foundation's General Public License with the
+following additional restrictions (which override any conflicting
+restrictions in the GPL):
+
+1. You may not distribute results in any public forum, in any publication,
+   or in any other way if you have modified the benchmarks.  
+
+2. You may not distribute the results for a fee of any kind.  This includes
+   web sites which generate revenue from advertising.
+
+If you have modifications or enhancements that you wish included in
+future versions, please mail those to me, Larry McVoy, at lm@bitmover.com.
+
+=========================================================================
+
+Rationale for the publication restrictions:
+
+In summary:
+
+    a) LMbench is designed to measure enough of an OS that if you do well in
+       all catagories, you've covered latency and bandwidth in networking,
+       disks, file systems, VM systems, and memory systems.
+    b) Multiple times in the past people have wanted to report partial results.
+       Without exception, they were doing so to show a skewed view of whatever
+       it was they were measuring (for example, one OS fit small processes into
+       segments and used the segment register to switch them, getting good 
+       results, but did not want to report large process context switches 
+       because those didn't look as good).
+    c) We insist that if you formally report LMbench results, you have to
+       report all of them and make the raw results file easily available.
+       Reporting all of them means in that same publication, a pointer
+       does not count.  Formally, in this context, means in a paper,
+       on a web site, etc., but does not mean the exchange of results
+       between OS developers who are tuning a particular subsystem.
+
+We have a lot of history with benchmarking and feel strongly that there
+is little to be gained and a lot to be lost if we allowed the results
+to be published in isolation, without the complete story being told.
+
+There has been a lot of discussion about this, with people not liking this
+restriction, more or less on the freedom principle as far as I can tell.
+We're not swayed by that, our position is that we are doing the right
+thing for the OS community and will stick to our guns on this one.
+
+It would be a different matter if there were 3 other competing
+benchmarking systems out there that did what LMbench does and didn't have
+the same reporting rules.  There aren't and as long as that is the case,
+I see no reason to change my mind and lots of reasons not to do so.  I'm
+sorry if I'm a pain in the ass on this topic, but I'm doing the right
+thing for you and the sooner people realize that the sooner we can get on
+to real work.
+
+Operating system design is a largely an art of balancing tradeoffs.
+In many cases improving one part of the system has negative effects
+on other parts of the system.  The art is choosing which parts to
+optimize and which to not optimize.  Just like in computer architecture,
+you can optimize the common instructions (RISC) or the uncommon
+instructions (CISC), but in either case there is usually a cost to
+pay (in RISC uncommon instructions are more expensive than common
+instructions, and in CISC common instructions are more expensive
+than required).  The art lies in knowing which operations are 
+important and optmizing those while minimizing the impact on the
+rest of the system.  
+
+Since lmbench gives a good overview of many important system features,
+users may see the performance of the system as a whole, and can
+see where tradeoffs may have been made.  This is the driving force
+behind the publication restriction: any idiot can optimize certain
+subsystems while completely destroying overall system performance.
+If said idiot publishes *only* the numbers relating to the optimized
+subsystem, then the costs of the optimization are hidden and readers
+will mistakenly believe that the optimization is a good idea.  By
+including the publication restriction readers would be able to
+detect that the optimization improved the subsystem performance
+while damaging the rest of the system performance and would be able
+to make an informed decision as to the merits of the optimization.
+
+Note that these restrictions only apply to *publications*.  We
+intend and encourage lmbench's use during design, development,
+and tweaking of systems and applications.  If you are tuning the
+linux or BSD TCP stack, then by all means, use the networking
+benchmarks to evaluate the performance effects of various 
+modifications; Swap results with other developers; use the
+networking numbers in isolation.  The restrictions only kick
+in when you go to *publish* the results.  If you sped up the
+TCP stack by a factor of 2 and want to publish a paper with the
+various tweaks or algorithms used to accomplish this goal, then
+you can publish the networking numbers to show the improvement.
+However, the paper *must* also include the rest of the standard
+lmbench numbers to show how your tweaks may (or may not) have
+impacted the rest of the system.  The full set of numbers may
+be included in an appendix, but they *must* be included in the
+paper.
+
+This helps protect the community from adopting flawed technologies
+based on incomplete data.  It also helps protect the community from
+misleading marketing which tries to sell systems based on partial
+(skewed) lmbench performance results.  
+
+We have seen many cases in the past where partial or misleading
+benchmark results have caused great harm to the community, and
+we want to ensure that our benchmark is not used to perpetrate
+further harm and support false or misleading claims.
+
+
diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
index a3873a6..ba0d10d 100644
--- a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Tools for performance analysis"
 HOMEPAGE = "http://lmbench.sourceforge.net/"
 SECTION = "console/utils"
-LICENSE = "GPLv2"
+LICENSE = "GPLv2 & GPL-2.0-with-lmbench-restriction"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
                     file://COPYING-2;md5=8e9aee2ccc75d61d107e43794a25cdf9"
 
-- 
1.7.9.5


