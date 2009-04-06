Received: from [209.85.132.244] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <esbenhaabendal@gmail.com>) id 1Lqy3p-0003j5-1k
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Apr 2009 01:17:03 +0200
Received: by an-out-0708.google.com with SMTP id b2so3870114ana.42
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Apr 2009 16:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=SBUFaNb+D1IK4wB+/pJ/9thciGhU6r/aZqZZhfBpU6s=;
	b=SoM2ObNofZoPOdcGLM2RR6V+lRhK/ATrerDdafDd0eIFMDe0yGjRAFu29Fd1yy1+it
	a4FeZ+XeELZMtj4iIxDKHYKhJE/4aF3Si13RCHH13CSTorKE2ZfZH98kTGv56UJu46/B
	HtdR2YBCW2Js8vrTVvXIdrJ3NNGSiPMUK6f8k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=YbzPM2seZpfnZ4uLAaMUM3TvL2Qi1OGcBL4Yj80y2EJlIc+X8czJje/4gruEPoOyQM
	tnwhU4poQ5zgFqMj8CYYxi0qJzccm48yHg2B113bedK7bo7EVRpnNh3KAcLT5T8bXiua
	q1d6/1et8qk8jIzISTT/N2/NY2D4Ha5skEyBQ=
MIME-Version: 1.0
Received: by 10.100.43.14 with SMTP id q14mr5176758anq.56.1239059647949; Mon, 
	06 Apr 2009 16:14:07 -0700 (PDT)
Date: Tue, 7 Apr 2009 01:14:07 +0200
Message-ID: <d2b9ea600904061614r2839effbla380925d536c3999@mail.gmail.com>
From: Esben Haabendal <esbenhaabendal@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.132.244
X-SA-Exim-Mail-From: esbenhaabendal@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=AWL,BAYES_20,RDNS_NONE,
	SPF_PASS,TVD_SPACE_RATIO autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [STABLE][PATCH] mingw-binutils: update to 2.19.1
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
X-List-Received-Date: Mon, 06 Apr 2009 23:17:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Signed-off-by: Esben Haabendal <eha@doredevelopment.dk>
---
 .../mingw-binutils-canadian-cross_2.19.1.bb        |   11 +++++++++++
 recipes/binutils/mingw-binutils_2.19.1.bb          |   12 ++++++++++++
 2 files changed, 23 insertions(+), 0 deletions(-)
 create mode 100644 recipes/binutils/mingw-binutils-canadian-cross_2.19.1.bb
 create mode 100644 recipes/binutils/mingw-binutils_2.19.1.bb

diff --git a/recipes/binutils/mingw-binutils-canadian-cross_2.19.1.bb
b/recipes/binutils/mingw-binutils-canadian-cross_2.19.1.bb
new file mode 100644
index 0000000..27e06c6
--- /dev/null
+++ b/recipes/binutils/mingw-binutils-canadian-cross_2.19.1.bb
@@ -0,0 +1,11 @@
+require mingw-binutils_${PV}.bb
+require binutils-canadian-cross.inc
+
+DEFAULT_PREFERENCE_sdk-mingw32 = "1"
+DEFAULT_PREFERENCE_sdk-mingw64 = "1"
+
+require binutils-canadian-cross.inc
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/mingw/binutils-${PV}-src.tar.gz"
+
+S = "${WORKDIR}/binutils-${PV}"
diff --git a/recipes/binutils/mingw-binutils_2.19.1.bb
b/recipes/binutils/mingw-binutils_2.19.1.bb
new file mode 100644
index 0000000..19d1077
--- /dev/null
+++ b/recipes/binutils/mingw-binutils_2.19.1.bb
@@ -0,0 +1,12 @@
+PR = "r1"
+
+require binutils.inc
+
+DESCRIPTION = "A GNU collection of binary utilities - MinGW port"
+HOMEPAGE = "http://www.mingw.org/"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/mingw/binutils-${PV}-src.tar.gz"
+
+S = "${WORKDIR}/binutils-${PV}"
+
+DEFAULT_PREFERENCE = "0"
-- 
1.6.2.2


