Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f175.google.com (mail-pd0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 4FCFE72CD5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jan 2015 22:54:22 +0000 (UTC)
Received: by mail-pd0-f175.google.com with SMTP id fl12so205688pdb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jan 2015 14:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=iVL32IdV09F2cW0E5zdIIPuUlrPrCw6OXjhYS2Lnc0A=;
	b=enFesEljpAt0HDOL/psreXBMkrI1t2eY9GcJx0lplFfDKBM5O+oUIEC7wO14y8QmIK
	WKU31rb1zY735fYzXthaHT7bdtb2jBJ8vrw5Jrz+Ee6sq19GEnFUzsvB9imGu5kp3Ocy
	x5Nk5hgkDTLTM919F48U4mY13XgO/dHkSA1mSXJomXnTkDlit7VV77lbSuturKDN90hX
	gmUjAtDwvaCgTmpFjadpGcAEPRdiXZqF0sJD8FcAPigCKGDoBCvC5MrPSeLmtdM4lcp1
	7bsWFyhNxhY/aZtvDP54NoztfRA3UrZHc8u6aVwQJ0f4mV6tsM553tJVZG3mCni3Sj29
	AuOA==
X-Received: by 10.68.217.97 with SMTP id ox1mr14853058pbc.53.1422053663165;
	Fri, 23 Jan 2015 14:54:23 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id gz6sm2932760pbc.38.2015.01.23.14.54.21
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 23 Jan 2015 14:54:21 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	otavio@ossystems.com.br
Date: Fri, 23 Jan 2015 14:53:50 -0800
Message-Id: <a38ff54d95fb5bfefd80a1e54d869a3fc17eea29.1422053452.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1422053452.git.akuster808@gmail.com>
References: <cover.1422053452.git.akuster808@gmail.com>
In-Reply-To: <cover.1422053452.git.akuster808@gmail.com>
References: <cover.1422053452.git.akuster808@gmail.com>
Subject: [PATCH 10/11] nbench-byte: Fix license QA error
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
X-List-Received-Date: Fri, 23 Jan 2015 22:54:22 -0000

From: Otavio Salvador <otavio@ossystems.com.br>

The license is not a common only and seems to be a 'free distribution'
license but without explicit rules about modification or similar. Due
that, we copied the license text from the README file and added it
onto nbench-byte license file.

This fixes following QA error:

,----
| WARNING: Recipe nbench-byte, LICENSE (freely distributable) has
|     invalid format, LICENSES must have operator "([&|() ])" between
| 	them.
`----

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/licenses/nbench-byte                               | 10 ++++++++++
 meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb |  2 +-
 2 files changed, 11 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/licenses/nbench-byte

diff --git a/meta-oe/licenses/nbench-byte b/meta-oe/licenses/nbench-byte
new file mode 100644
index 0000000..7e47ba6
--- /dev/null
+++ b/meta-oe/licenses/nbench-byte
@@ -0,0 +1,10 @@
+THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
+IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
+OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
+IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
+INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
+NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
+DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
+THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
+THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
diff --git a/meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb b/meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb
index a98d507..2eedd7e 100644
--- a/meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb
+++ b/meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "BYTE Magazine's native benchmarks (also called BYTEmark) \
 designed to expose the capabilities of a system's CPU, FPU, \
 and memory system."
 HOMEPAGE = "http://www.tux.org/~mayer/linux/"
-LICENSE = "freely distributable"
+LICENSE = "nbench-byte"
 LIC_FILES_CHKSUM = "file://README;beginline=57;endline=66;md5=020ef579f8fa5746b7e307a54707834f"
 SECTION = "console/utils"
 
-- 
1.9.1


