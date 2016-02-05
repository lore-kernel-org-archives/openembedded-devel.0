Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2F6C577331
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Feb 2016 02:17:41 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u152HgrA009633
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 4 Feb 2016 18:17:42 -0800 (PST)
Received: from pek-jhuang0-d1.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Thu, 4 Feb 2016 18:17:41 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 5 Feb 2016 10:16:59 +0800
Message-ID: <62e8a1995c664dcb71001522b403bd1f65b0ad86.1454638380.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1454638380.git.jackie.huang@windriver.com>
References: <cover.1454638380.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-java][PATCH 3/5] jacl: fix license and add license files
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
X-List-Received-Date: Fri, 05 Feb 2016 02:17:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Jackie Huang <jackie.huang@windriver.com>

license.amd(AMD): applies to the TJC compiler source and test files
license.itcl(CDS): applies to the Itcl source and test files
license.ucb(UCB): applies to portions of Jacl and Tcl Blend sources
license.terms(SUN): applies to the other cource files

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 licenses/AMD                    | 50 +++++++++++++++++++++++++
 licenses/CDS                    | 83 +++++++++++++++++++++++++++++++++++++++++
 licenses/SUN                    | 31 +++++++++++++++
 recipes-core/jacl/jacl_1.4.1.bb |  5 ++-
 4 files changed, 167 insertions(+), 2 deletions(-)
 create mode 100644 licenses/AMD
 create mode 100644 licenses/CDS
 create mode 100644 licenses/SUN

diff --git a/licenses/AMD b/licenses/AMD
new file mode 100644
index 0000000..30cef1b
--- /dev/null
+++ b/licenses/AMD
@@ -0,0 +1,50 @@
+© 2005 Advanced Micro Devices, Inc. All rights reserved.
+
+Redistribution and use in source and binary forms, with or without
+modification, are permitted provided that existing copyright notices
+are retained in all copies, this notice is included verbatim in any
+distributions, and the terms and conditions hererin are met.
+
+Use of the this software manifests acceptance of the terms of this
+license by performance.
+
+The name of Advanced Micro Devices, Inc. may not be used to endorse or
+promote products derived from this software without specific prior
+written permission.
+
+THIS SOFTWARE IS PROVIDED BY ADVANCED MICRO DEVICES, INC. "AS IS" AND ANY
+EXPRESS, IMPLIED OR STATUTORY WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
+THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
+PURPOSE AND NON-INFRINGEMENT, OR THOSE ARISING FROM CUSTOM OF TRADE OR
+COURSE OF USAGE ARE DISCLAIMED.
+
+IN NO EVENT SHALL ADVANCED MICRO DEVICES, INC. BE LIABLE FOR ANY DIRECT,
+INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
+(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
+SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
+CAUSED, AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
+LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
+OUT OF THE USE OF THIS SOFTWARE ITS DOCUMENTATION OR ANY DERIVATIVES
+THEREOF, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. BY USING THIS
+SOFTWARE WITHOUT CHARGE, YOU ACCEPT THIS ALLOCATION OF RISK. THIS
+DISCLAIMER OF LIABILITY CONSTITUTES AN ESSENTIAL PART OF THIS LICENSE.
+ADVANCED MICRO DEVICES, INC. HAS NO OBLIGATION TO PROVIDE MAINTENANCE,
+SUPPORT, UPDATES, ENHANCEMENTS, OR MODIFICATIONS OF THIS SOFTWARE.
+
+In the redistribution and use of this software, each party shall at all
+times comply with all applicable governmental laws, statutes, ordinances,
+rules, regulations, orders, and other requirements, including without
+limitation such governmental requirements applicable to environmental
+protection, health, safety, wages, hours, equal employment opportunity,
+nondiscrimination, working conditions, import or export control, and
+transportation. Without limiting the foregoing, each party shall adhere
+to the U.S. Export Administration Regulations (EAR), currently found at
+15 C.F.R. Sections 730 through 744, and, unless properly authorized by
+the U.S. Government, shall not (1) export, re-export or release restricted
+technology, software, or source code to a national of a country in Country
+Groups D:1 or E:1, or (2) export to Country Groups D:1 or E:1 the direct
+product of such technology or software, if such foreign produced direct
+product is subject to national security controls as identified on the
+Commerce Control List (currently found in Supplement 1 to Section 774 of EAR).
+These export requirements shall survive any expiration or termination
+of this agreement.
diff --git a/licenses/CDS b/licenses/CDS
new file mode 100644
index 0000000..296de7f
--- /dev/null
+++ b/licenses/CDS
@@ -0,0 +1,83 @@
+This software is copyrighted by Cadence Design Systems, Inc., and other
+parties.  The following terms apply to all files associated with the
+software unless explicitly disclaimed in individual files.
+
+The authors hereby grant permission to use, copy, modify, distribute,
+and license this software and its documentation for any purpose, provided
+that existing copyright notices are retained in all copies and that this
+notice is included verbatim in any distributions. No written agreement,
+license, or royalty fee is required for any of the authorized uses.
+Modifications to this software may be copyrighted by their authors
+and need not follow the licensing terms described here, provided that
+the new terms are clearly indicated on the first page of each file where
+they apply.
+
+IN NO EVENT SHALL THE AUTHORS OR DISTRIBUTORS BE LIABLE TO ANY PARTY
+FOR DIRECT, INDIRECT, SPECIAL, INCIDENTAL, OR CONSEQUENTIAL DAMAGES
+ARISING OUT OF THE USE OF THIS SOFTWARE, ITS DOCUMENTATION, OR ANY
+DERIVATIVES THEREOF, EVEN IF THE AUTHORS HAVE BEEN ADVISED OF THE
+POSSIBILITY OF SUCH DAMAGE.
+
+THE AUTHORS AND DISTRIBUTORS SPECIFICALLY DISCLAIM ANY WARRANTIES,
+INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY,
+FITNESS FOR A PARTICULAR PURPOSE, AND NON-INFRINGEMENT.  THIS SOFTWARE
+IS PROVIDED ON AN "AS IS" BASIS, AND THE AUTHORS AND DISTRIBUTORS HAVE
+NO OBLIGATION TO PROVIDE MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR
+MODIFICATIONS.
+
+GOVERNMENT USE: If you are acquiring this software on behalf of the
+U.S. government, the Government shall have only "Restricted Rights"
+in the software and related documentation as defined in the Federal 
+Acquisition Regulations (FARs) in Clause 52.227.19 (c) (2).  If you
+are acquiring the software on behalf of the Department of Defense, the
+software shall be classified as "Commercial Computer Software" and the
+Government shall have only "Restricted Rights" as defined in Clause
+252.227-7013 (c) (1) of DFARs.  Notwithstanding the foregoing, the
+authors grant the U.S. Government and others acting in its behalf
+permission to use and distribute the software in accordance with the
+terms specified in this license. 
+
+-----------------------------------------------------------------------
+ Following is the original agreement for the Tcl/Tk software from
+ Sun Microsystems.
+-----------------------------------------------------------------------
+
+This software is copyrighted by the Regents of the University of
+California, Sun Microsystems, Inc., and other parties.  The following
+terms apply to all files associated with the software unless explicitly
+disclaimed in individual files.
+
+The authors hereby grant permission to use, copy, modify, distribute,
+and license this software and its documentation for any purpose, provided
+that existing copyright notices are retained in all copies and that this
+notice is included verbatim in any distributions. No written agreement,
+license, or royalty fee is required for any of the authorized uses.
+Modifications to this software may be copyrighted by their authors
+and need not follow the licensing terms described here, provided that
+the new terms are clearly indicated on the first page of each file where
+they apply.
+
+IN NO EVENT SHALL THE AUTHORS OR DISTRIBUTORS BE LIABLE TO ANY PARTY
+FOR DIRECT, INDIRECT, SPECIAL, INCIDENTAL, OR CONSEQUENTIAL DAMAGES
+ARISING OUT OF THE USE OF THIS SOFTWARE, ITS DOCUMENTATION, OR ANY
+DERIVATIVES THEREOF, EVEN IF THE AUTHORS HAVE BEEN ADVISED OF THE
+POSSIBILITY OF SUCH DAMAGE.
+
+THE AUTHORS AND DISTRIBUTORS SPECIFICALLY DISCLAIM ANY WARRANTIES,
+INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY,
+FITNESS FOR A PARTICULAR PURPOSE, AND NON-INFRINGEMENT.  THIS SOFTWARE
+IS PROVIDED ON AN "AS IS" BASIS, AND THE AUTHORS AND DISTRIBUTORS HAVE
+NO OBLIGATION TO PROVIDE MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR
+MODIFICATIONS.
+
+GOVERNMENT USE: If you are acquiring this software on behalf of the
+U.S. government, the Government shall have only "Restricted Rights"
+in the software and related documentation as defined in the Federal 
+Acquisition Regulations (FARs) in Clause 52.227.19 (c) (2).  If you
+are acquiring the software on behalf of the Department of Defense, the
+software shall be classified as "Commercial Computer Software" and the
+Government shall have only "Restricted Rights" as defined in Clause
+252.227-7013 (c) (1) of DFARs.  Notwithstanding the foregoing, the
+authors grant the U.S. Government and others acting in its behalf
+permission to use and distribute the software in accordance with the
+terms specified in this license. 
diff --git a/licenses/SUN b/licenses/SUN
new file mode 100644
index 0000000..a5e92b5
--- /dev/null
+++ b/licenses/SUN
@@ -0,0 +1,31 @@
+SUN MICROSYSTEMS, INC. THROUGH ITS SUN MICROSYSTEMS LABORATORIES
+DIVISION ("SUN") WILL LICENSE THIS SOFTWARE AND THE ACCOMPANYING
+DOCUMENTATION TO YOU (a "Licensee") ONLY ON YOUR ACCEPTANCE OF ALL 
+THE TERMS SET FORTH BELOW.
+
+Sun grants Licensee a non-exclusive, royalty-free right to download,
+install, compile, use, copy and distribute the Software, modify or
+otherwise create derivative works from the Software (each, a
+"Modification") and distribute any Modification in source code and/or
+binary code form to its customers with a license agreement containing
+these terms and noting that the Software has been modified. The
+Software is copyrighted by Sun and other third parties and Licensee
+shall retain and reproduce all copyright and other notices presently 
+on the Software. As between Sun and Licensee, Sun is the sole owner of
+all rights in and to the Software other than the limited rights
+granted to Licensee herein; Licensee will own its Modifications,
+expressly subject to Sun's continuing ownership of the
+Software. Licensee will, at its expense, defend and indemnify Sun and
+its licensors from and against any third party claims, including costs
+and reasonable attorneys' fees, and be wholly responsible for any
+liabilities arising out of or related to Licensee's development, use
+or distribution of the Software or Modifications. Any distribution of
+the Software and Modifications must comply with all applicable United
+States export control laws.
+
+THE SOFTWARE IS BEING PROVIDED TO LICENSEE "AS IS" AND ALL EXPRESS OR
+IMPLIED CONDITIONS AND WARRANTIES, INCLUDING ANY IMPLIED WARRANTY OF
+MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE OR NON-INFRINGEMENT,
+ARE DISCLAIMED. IN NO EVENT WILL SUN BE LIABLE HEREUNDER FOR ANY
+DIRECT DAMAGES OR ANY INDIRECT, PUNITIVE, SPECIAL, INCIDENTAL OR
+CONSEQUENTIAL DAMAGES OF ANY KIND.
diff --git a/recipes-core/jacl/jacl_1.4.1.bb b/recipes-core/jacl/jacl_1.4.1.bb
index b413719..4c6b7b1 100644
--- a/recipes-core/jacl/jacl_1.4.1.bb
+++ b/recipes-core/jacl/jacl_1.4.1.bb
@@ -1,9 +1,10 @@
 DESCRIPTION = "Tcl interpreter for Java"
-# see this case study about JACL http://olex.openlogic.com/wazi/2008/jacl-license-case-study/
-LICENSE = "JACL"
+LICENSE = "UCB & SUN & AMD & CDS"
 LIC_FILES_CHKSUM = " \
                     file://license.ucb;md5=997c6617d2f2a747e39945c0f2d1a264 \
                     file://license.terms;md5=ce3ac33515250b3a438b2633ccb29aac \
+                    file://license.itcl;md5=52f12c6c2c239f3481edb3e52fc638b8 \
+                    file://license.amd;md5=a286e569daafb1cf4c3f943d354badab \
                    "
 
 HOMEPAGE = "http://sourceforge.net/projects/tcljava"
-- 
1.9.1


