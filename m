Return-Path: <Zhiquan.Li@windriver.com>
X-Greylist: delayed 1042 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 23 Oct 2015 10:07:47 UTC
Received: from mail5.wrs.com (unknown [64.129.254.146])
	by mail.openembedded.org (Postfix) with ESMTP id D92E97570D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Oct 2015 10:07:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id t9NA7mfY028182
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Oct 2015 03:07:48 -0700
Received: from pek-lpd-ccm1.wrs.com (128.224.179.178) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.248.2; Fri, 23 Oct 2015 03:07:47 -0700
From: Zhiquan Li <zhiquan.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 23 Oct 2015 18:07:34 +0800
Message-ID: <1445594855-39110-1-git-send-email-zhiquan.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [ LIN8-299 ] snort: fix m4 causes out of memory during configure
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
X-List-Received-Date: Fri, 23 Oct 2015 10:07:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Summary: snort: fix m4 causes out of memory during configure
Tech Review: Jie Huang
Gatekeeper: Liezhi Yang
Lockdown Approval (if needed): 
Branch Tag: wr-8.0-20151008

IP Statement (form link or license statement, usually automated):
Crypto URL(s) (if needed): see http://wiki.wrs.com/PBUeng/LinuxProductDivisionExportProcess
Parent Template (where applicable):


-------------------------------------
Impacted area             Impact y/n
-------------------       -----------
docs/tech-pubs                 n
tests                          n
build system                   y
host dependencies              n
RPM/packaging                  n
toolchain                      n
kernel code                    n
user code                      n
configuration files            n
target configuration           n
Other                          n
Applicable to Yocto/upstream   n
New Kernel Warnings            n


Comments (indicate scope for each "y" above):
---------------------------------------------
commit 04542e758db84f4d20d9df09b204c6164b05f654
Author: Zhiquan Li <zhiquan.li@windriver.com>
Date:   Thu Oct 22 13:28:47 2015 +0800

    snort: fix m4 causes out of memory during configure
    
    Issue: LIN8-299
    
    There is an incorrect m4_define() in configure.in which will result in an
    infinite recursion, and it doesn't make sense, since snort 2.9.7 it has been
    commented out. We follow this solution to fix it.
    
    Upstream-Status: Backport
    
    (LOCAL REV: NOT UPSTREAM) -- Sent to oe-devel on 20151023
    
    Signed-off-by: Zhiquan Li <zhiquan.li@windriver.com>


Added Files:
------------
 .../snort/snort/m4-oom-during-configure.patch       | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

Removed Files:
--------------
None.

Remaining Changes (diffstat):
-----------------------------
 .../recipes-connectivity/snort/snort_2.9.6.0.bb          | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

Testing Applicable to:
----------------------
common_pc_64 standard glibc_std

Testing Commands:
-----------------
1 configure --enable-board=intel-x86-64 --enable-kernel=standard --enable-rootfs=glibc-std
2 make snort

Testing, Expected Results:
--------------------------
The packages of snort can be created successfully.

Conditions of submission:
-------------------------
N/A

Arch    built      boot     boardname
-------------------------------------
MIPS      n         n
MIPS64    n         n
MIPS64n32 n         n
ARM32     n         n
ARM64     n         n
x86       n         n
x86_64    y         n
PPC       n         n
PPC64     n         n
SPARC64   n         n


Reviewer Checklist:
-------------------
[Submitters: make sure that your review doesn't trigger any checkmarks!]


Your checkin has not passed review/gatekeep because (see checked entries):

___ Your RR template is generally incomplete; it has too many blank entries
    that need proper data filled in.

___ You've not properly listed things in the proper sections from
    the perspective of the SCM for new, removed, and changed files

___ You have failed to nominate a proper person for gatekeep or review.

___ Your patches do not have proper short+long header

___ You have grammar/spelling in your header that is unacceptable.

___ You have exceeded a sensible line length in your headers/comments/text.

___ Your patches have timestamps and/or index lines

___ You have failed to put in a proper CQID into your commits.

___ You have incorrectly put internal data like CQID commits into
    customer visible files (things shipped directly as patches etc).

___ Your "Signed-off-by:" is either missing or invalid

___ You have not built for enough appropriate architecture families,
    and/or you've chosen an arch family that is guaranteed to succeed.

___ You've included large amounts of useless and irrelevant diffstat
    information.

___ You've included binary files in your RR which appear as a large
    number of lines of useless "uuencode" information.

___ You have changed a host tool and not tested on enough supported hosts.

___ You have not given any evidence of testing beyond basic build tests.
    Demonstrate some level of runtime or other sanity testing.

___ You have ^M present in some of your files.  These have to be removed.

___ You have carried forward some ancient/meaningless internal WRS CVS
    tags (i.e. $Id$) in some of your files.  These have to be removed.

___ You have not clearly specified the origin of some/all of your added
    content (i.e. patches from a mailing list, a git tree, done internally?)

___ You have needlessly changed whitespace or added whitespace crimes
    like trailing spaces, or spaces before tabs.

___ You have mixed real technical changes with whitespace and other
    cosmetic code cleanup changes.  These have to be separate commits.

___ You need to refactor your submission into logical chunks; there is
    too much content into a single commit.

___ You have extraneous garbage in your review (merge commits etc)

___ You have giant attachments which should never have been sent;
    Instead you should place your content in a tree to be pulled.

___ You have too many commits attached to an e-mail; resend as threaded
    commits, or place in a tree for a pull.

___ You have resent this content multiple times without a clear indication
    of what has changed between each re-send.

___ You have dropped patches that were used on the old pkg version
    without clearly justifying why they are no longer needed.

___ You have failed to adequately and individually address all of the
    comments and change requests that were proposed in the initial review.

___ You have added a new package, but not indicated that the package
    addition matches the Makefile template specified by the Userspace group

___ New Kernel Warnings were created and you did not validate that there
    are no corresponding functional problems.

-----------
Original of this form hosted at:
  http://git.wrs.com/cgi-bin/cgit.cgi/bin/tree/etc/review.txt
From: Zhiquan Li <zhiquan.li@windriver.com>
Subject: 
In-Reply-To: 


