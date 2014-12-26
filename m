Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qa0-f50.google.com (mail-qa0-f50.google.com
	[209.85.216.50])
	by mail.openembedded.org (Postfix) with ESMTP id DBE5B72550
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Dec 2014 17:13:31 +0000 (UTC)
Received: by mail-qa0-f50.google.com with SMTP id dc16so7123701qab.37
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Dec 2014 09:13:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=WYj0o0QprST0M96caRcjuJSfSXP+pHG/4ET8Tgsy7D4=;
	b=xGPSUByg3dXt0HvOvje1Mw1F1/WDsmEk8tbh+7GofR34GkK1xWLVXZR4bi3KOFIh5D
	622OMPuK0714f4l/rbqXbidw+I5RXDnXcuSFksLuA4CvS5qGZ8QJxO4j0r9ZY6T8mr4L
	uDvhI2pybmcc2ZFmVZzBSn3dh8GtDRQFmXpgDkAuHme2UueNO53RO81aUdgJFXCh16Lo
	S/xzYDvn76yqjrdM7mSmhCOPziLN/Vyvv7KGduaH1w/iJGVrZXwyxYrFwJyRlcTv5xlT
	SlypkN4/4c+B1nIO0J5hrOj8JOSyiCpESncFRZ/wWYfo57WfehaF3CtURYC/4WF1qAjL
	qrrw==
X-Received: by 10.224.73.135 with SMTP id q7mr70773298qaj.6.1419614011711;
	Fri, 26 Dec 2014 09:13:31 -0800 (PST)
Received: from centrium.lab.ossystems.com.br ([177.100.225.47])
	by mx.google.com with ESMTPSA id
	p49sm26407429qgp.30.2014.12.26.09.13.29
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 Dec 2014 09:13:30 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Fri, 26 Dec 2014 15:13:17 -0200
Message-Id: <1419613997-32368-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.1.3
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH] nbench-byte: Fix license QA error
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
X-List-Received-Date: Fri, 26 Dec 2014 17:13:32 -0000

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
2.1.3


