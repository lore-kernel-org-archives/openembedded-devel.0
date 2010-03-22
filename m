Received: from exprod5og111.obsmtp.com ([64.18.0.22])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martyn.welch@ge.com>) id 1Nte1o-0001gY-Js
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Mar 2010 10:34:38 +0100
Received: from source ([4.79.213.129]) (using TLSv1) by
	exprod5ob111.postini.com ([64.18.4.12]) with SMTP
	ID DSNKS6c47fC8gSrJi+KWZ+/rVUr/D4Zeipar@postini.com;
	Mon, 22 Mar 2010 02:31:27 PDT
Received: from unknown (HELO alpmlip01.e2k.ad.ge.com) ([3.159.17.48])
	by Alpmlip04.e2k.ad.ge.com with ESMTP; 22 Mar 2010 05:31:25 -0400
Received: from es-j7s4d2j.amer.consind.ge.com ([3.138.54.92])
	by alpmlip01.e2k.ad.ge.com with ESMTP; 22 Mar 2010 05:31:25 -0400
From: Martyn Welch <martyn.welch@ge.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Mar 2010 09:34:40 +0000
Message-ID: <20100322093440.27540.50671.stgit@ES-J7S4D2J.amer.consind.ge.com>
In-Reply-To: <20100322092415.27540.53806.stgit@ES-J7S4D2J.amer.consind.ge.com>
References: <20100322092415.27540.53806.stgit@ES-J7S4D2J.amer.consind.ge.com>
User-Agent: StGIT/0.13
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 64.18.0.22
X-SA-Exim-Mail-From: martyn.welch@ge.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 01/12] commit 587374363efe3fbd07f6a3d25bfb11230ac012f9
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
X-List-Received-Date: Mon, 22 Mar 2010 09:34:38 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Funky alt busybox

    This patch provides a mechanism to replace busybox buy defining a busybox package which actually just requires a set of other packages.

    To get it to be used rather than the standard busybox, define:

    PREFERRED_PROVIDER_busybox = "busybox-alt"
---

 recipes/busybox/busybox-alt_1.bb |  110 ++++++++++++++++++++++++++++++++++++++
 1 files changed, 110 insertions(+), 0 deletions(-)

diff --git a/recipes/busybox/busybox-alt_1.bb b/recipes/busybox/busybox-alt_1.bb
new file mode 100644
index 0000000..218ff4c
--- /dev/null
+++ b/recipes/busybox/busybox-alt_1.bb
@@ -0,0 +1,110 @@
+DESCRIPTION = "A set of alternatives to busybox"
+
+ALLOW_EMPTY = "1"
+PACKAGES = "busybox"
+PACKAGE_ARCH = "all"
+
+PROVIDES = "busybox"
+DEFAULT_PREFERENCE = "1"
+
+RDEPENDS = "\
+  bash \
+  bc \
+  bind-utils \
+  binutils \
+  binutils-symlinks \
+  bzip2 \
+  console-tools \
+  coreutils \
+  cpio \
+  debianutils \
+  dhcp-client \
+  diffutils \
+  e2fsprogs \
+  e2fsprogs-fsck \
+  e2fsprogs-libs \
+  fbset \
+  findutils \
+  gawk \
+  grep \
+  gzip \
+  ifupdown \
+#  inetutils \
+  iproute2 \
+  iputils-ping \
+  iputils-ping6 \
+  iputils-arping \
+  less \
+  minicom \
+  mktemp \
+  module-init-tools \
+  ncurses \
+  netcat \
+  net-tools \
+  patch \
+  procps \
+  psmisc \
+  openrdate \
+  realpath \
+  sed \
+  start-stop-daemon \
+  syslog-ng \
+  sysvinit \
+  tar \
+  tftp-hpa \
+  time \
+  traceroute \
+  util-linux-ng \
+  unzip \
+  vim \
+  wget \
+"
+
+DEPENDS = "\
+  bash \
+  bc \
+  bind \
+  binutils \
+  bzip2 \
+  console-tools \
+  coreutils \
+  cpio \
+  debianutils \
+  dhcp \
+  diffutils \
+  e2fsprogs \
+  fbset \
+  findutils \
+  gawk \
+  grep \
+  gzip \
+  ifupdown \
+#  inetutils \
+  iproute2 \
+  iputils \
+  less \
+  minicom \
+  mktemp \
+  module-init-tools \
+  ncurses \
+  netcat \
+  net-tools \
+  patch \
+  procps \
+  psmisc \
+  openrdate \
+  realpath \
+  sed \
+  start-stop-daemon \
+  syslog-ng \
+  sysvinit \
+  tar \
+  tftp-hpa \
+  time \
+  traceroute \
+  util-linux-ng \
+  unzip \
+  vim \
+  wget \
+"
+


--
Martyn Welch (Principal Software Engineer)   |   Registered in England and
GE Intelligent Platforms                     |   Wales (3828642) at 100
T +44(0)127322748                            |   Barbirolli Square, Manchester,
E martyn.welch@ge.com                        |   M2 3AB  VAT:GB 927559189


