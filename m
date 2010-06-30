Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <joaohf@gmail.com>) id 1OTlQz-0001Mw-Ue
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Jun 2010 02:45:51 +0200
Received: by gxk1 with SMTP id 1so144081gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jun 2010 17:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=lrNzTpVCDD4360TMMQpRuhpGVULKxygJXX3Io37pJ7U=;
	b=WJXgZVcO5n5Yw+4c/1DSIHx9KVtwBwKF/9dD7zwSFOOenC0DSZXmsk9tSl6ck2XgjG
	lHTvisTsBaiBRGRBnbf3KwuuqWqgqExRUeuZ0s04NPHkSgqFbGpn56fCkATa5aQZx+vZ
	jGvvTPkqFfvS+oTTLOQD71ybz3j93G1A6TvTc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=lOQsQrGxFaxQSCGDQuBRlDbJeASwBRGiZtoxI1nFyouz+8jX89iyzrZQUbGnSHK9eO
	93hOEBey2FWGsIfOH07UxHceZ0lITpOcIv2vEay7QB3WYznYNoacTwypXrPtRJDpkD2F
	EeKoit33DUpzsq96DGs9UrqFHooIupplaTVhY=
Received: by 10.91.100.18 with SMTP id c18mr5568202agm.151.1277858465891;
	Tue, 29 Jun 2010 17:41:05 -0700 (PDT)
Received: from localhost.localdomain ([201.53.204.31])
	by mx.google.com with ESMTPS id 36sm344282ybr.8.2010.06.29.17.41.04
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 29 Jun 2010 17:41:05 -0700 (PDT)
From: "Joao H. Freitas" <joaohf@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Jun 2010 21:40:42 -0300
Message-Id: <1277858443-27280-5-git-send-email-joaohf@gmail.com>
X-Mailer: git-send-email 1.7.0.2
In-Reply-To: <1277858443-27280-1-git-send-email-joaohf@gmail.com>
References: <1277858443-27280-1-git-send-email-joaohf@gmail.com>
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: joaohf@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 4/5] add cgreen beta package
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
X-List-Received-Date: Wed, 30 Jun 2010 00:45:51 -0000

---
 recipes/cgreen/cgreen_1.0.0-beta2.bb |   17 +++++++++++++++++
 1 files changed, 17 insertions(+), 0 deletions(-)
 create mode 100644 recipes/cgreen/cgreen_1.0.0-beta2.bb

diff --git a/recipes/cgreen/cgreen_1.0.0-beta2.bb b/recipes/cgreen/cgreen_1.0.0-beta2.bb
new file mode 100644
index 0000000..3e358c3
--- /dev/null
+++ b/recipes/cgreen/cgreen_1.0.0-beta2.bb
@@ -0,0 +1,17 @@
+require cgreen.inc
+
+PR = "${INC_PR}.0"
+
+S = "${WORKDIR}/cgreen"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/cgreen/cgreen-${PV}.tar.gz"
+
+EXTRA_OECONF = ""
+EXTRA_OEMAKE = "INSTALL_PREFIX=${D}"
+
+EXTRA_OECMAKE = ""
+
+OECMAKE_SOURCEPATH = "../cgreen-${PV}"
+
+SRC_URI[md5sum] = "6f1777bc700639592197861129d72e98"
+SRC_URI[sha256sum] = "ebcf028fa97ba17f92387649a0ba5fa2e025fc2dd7bce36a2096fadaf7cf0649"
\ No newline at end of file
-- 
1.7.0.2



