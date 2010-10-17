Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sean@chumby.com>) id 1P7WBw-0004YD-GD
	for Openembedded-devel@lists.openembedded.org;
	Sun, 17 Oct 2010 18:34:37 +0200
Received: by ywl5 with SMTP id 5so27809ywl.6
	for <Openembedded-devel@lists.openembedded.org>;
	Sun, 17 Oct 2010 09:34:03 -0700 (PDT)
Received: by 10.151.24.8 with SMTP id b8mr5044048ybj.374.1287333243427;
	Sun, 17 Oct 2010 09:34:03 -0700 (PDT)
Received: from [192.168.10.100] (cm198.psi191.maxonline.com.sg
	[58.146.191.198])
	by mx.google.com with ESMTPS id q5sm3520291ybe.18.2010.10.17.09.34.00
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 17 Oct 2010 09:34:01 -0700 (PDT)
From: Sean Cross <sean@chumby.com>
Date: Mon, 18 Oct 2010 00:33:58 +0800
Message-Id: <DCE1CD9C-F324-471B-B66D-81BE7D85F9F5@chumby.com>
To: Openembedded-devel@lists.openembedded.org
Mime-Version: 1.0 (Apple Message framework v1081)
X-Mailer: Apple Mail (2.1081)
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: sean@chumby.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] live555: Add latest version
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
X-List-Received-Date: Sun, 17 Oct 2010 16:34:37 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Live555 gets downloaded from http://www.live555.com/liveMedia/public/ =
but they only have the latest version available.  This recipe adds =
support for the latest version.

---
 recipes/live555/live555_20101015.bb |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)
 create mode 100644 recipes/live555/live555_20101015.bb

diff --git a/recipes/live555/live555_20101015.bb =
b/recipes/live555/live555_20101015.bb
new file mode 100644
index 0000000..eb6dfe3
--- /dev/null
+++ b/recipes/live555/live555_20101015.bb
@@ -0,0 +1,7 @@
+require live555.inc
+
+PR =3D "${INC_PR}.0"
+
+SRC_URI[md5sum] =3D "29734ddc6fddbb1a3a8f51a6de7a21c5"
+SRC_URI[sha256sum] =3D =
"278d99c0880f324769164d6872fea88f8d82ec5b87bb66c92035f46ee2f10adc"
+
--=20
1.7.0.4



