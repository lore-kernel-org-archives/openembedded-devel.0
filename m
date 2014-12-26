Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id 3D80E7264D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Dec 2014 19:21:29 +0000 (UTC)
Received: by mail-qg0-f46.google.com with SMTP id q107so7429107qgd.33
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Dec 2014 11:21:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=WYj0o0QprST0M96caRcjuJSfSXP+pHG/4ET8Tgsy7D4=;
	b=J7SCdigIq2MmxLYqsQ+DVAIcq9BOS4TxnXXG/Sm/6YK7IN1L2D2dy/X5eRoJ4flRWl
	M1JHeCg7d22c9x6nThNMp8HBroQZulxxO1HN+Cc2esme17695xbOwFSaihDgs3yJOiyy
	yCg5bvETBTicn59Ksl2HDu5Za9Pf2KjL9G1OtGHTbb+CgLF3zP6FpZ3xj25vI2MFy+le
	tq6ltCfm4c9l4GnLAYzAMwS1KZ2cMgdTsFxvmC52WQTFZT5nQ/KDPFraweW50gYMwjxs
	5WJg4ngR+oNcwQo385rUsmhLtRk7qKp/96PeDQ+qZV0QhT4rs4mex6q9gRN+9rz0Wtt6
	nSig==
X-Received: by 10.229.48.132 with SMTP id r4mr11841821qcf.5.1419621690525;
	Fri, 26 Dec 2014 11:21:30 -0800 (PST)
Received: from centrium.lab.ossystems.com.br ([177.100.225.47])
	by mx.google.com with ESMTPSA id
	k11sm26659998qgf.18.2014.12.26.11.21.28
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 Dec 2014 11:21:29 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Fri, 26 Dec 2014 17:21:29 -0200
Message-Id: <1419621700-1102-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.1.3
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 01/12] nbench-byte: Fix license QA error
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
X-List-Received-Date: Fri, 26 Dec 2014 19:21:39 -0000

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


