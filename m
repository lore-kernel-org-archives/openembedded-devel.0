Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sujak.marek@gmail.com>) id 1Pio4H-0002xb-2j
	for openembedded-devel@lists.openembedded.org;
	Fri, 28 Jan 2011 14:08:49 +0100
Received: by fxm17 with SMTP id 17so3354328fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jan 2011 05:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=D3bQGyM3SRTT881GjKX+xZbuoO5fIA1qQzrUIZcdkDE=;
	b=TPLE1EgPpa9vNuT6/ChnJn64yGYUiOEvfdOn4UcgDD+iGOfRbLDVcSDzZKK7HtlFJj
	VsWIOpDGlIWLs0SRbh2mnLT8351agp/WhUBvXZDt0eQndjyi99wGPwhhKQL3fxu1EWLP
	ifTWgFtno0wnY7naw8xROHXH3CVuOYM+cpltE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=LdVkZel4haPN5n2b+fJo6p3HbJBSPr5bCO2iygaFIhlGmL3jHM9NAYrTkLWFwXwvbs
	aAMnC9jMO6UR7xuVVYow7oNXdyHx+BSNJZvyN93k+Udvnd1IHpzbOGYPcP7ygF1C1gjK
	ksJjy+ztEuqID9rFnPcR7d1Txr28CIKc/+AOA=
Received: by 10.223.105.139 with SMTP id t11mr2309006fao.111.1296220078849;
	Fri, 28 Jan 2011 05:07:58 -0800 (PST)
Received: from localhost.localdomain (dial-92-52-20-198-orange.orange.sk
	[92.52.20.198])
	by mx.google.com with ESMTPS id 17sm6418362far.43.2011.01.28.05.07.57
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 28 Jan 2011 05:07:58 -0800 (PST)
From: "sujak.marek" <sujak.marek@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 28 Jan 2011 14:07:26 +0100
Message-Id: <1296220046-14636-1-git-send-email-sujak.marek@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH v2] barebox: added recipe for barebox v 2010.10
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
X-List-Received-Date: Fri, 28 Jan 2011 13:08:49 -0000

* included path for vmx25

Signed-off-by: sujak.marek <sujak.marek@gmail.com>
---
 recipes/barebox/barebox_2010.10.bb |   25 +++++++++++++++++++++++++
 1 files changed, 25 insertions(+), 0 deletions(-)
 create mode 100644 recipes/barebox/barebox_2010.10.bb

diff --git a/recipes/barebox/barebox_2010.10.bb b/recipes/barebox/barebox_2010.10.bb
new file mode 100644
index 0000000..b079a7c
--- /dev/null
+++ b/recipes/barebox/barebox_2010.10.bb
@@ -0,0 +1,25 @@
+require barebox.inc
+
+PR = "r0"
+
+DEFAULT_PREFERENCE = "-1"
+
+# Mark archs/machines that this kernel supports
+DEFAULT_PREFERENCE = "-1"
+DEFAULT_PREFERENCE_vmx25 = "1"
+
+BAREBOX_REVISION ?= "0"
+
+S = "${WORKDIR}/barebox-${PV}.${BAREBOX_REVISION}"
+
+SRC_URI = "\
+	http://barebox.org/download/barebox-${PV}.${BAREBOX_REVISION}.tar.bz2;name=barebox-${PV}.${BAREBOX_REVISION} \
+	file://defconfig \
+	"
+
+SRC_URI_append_vmx25 = "\
+	file://barebox_2010.10-vmx25-20110112.patch; \
+	"
+
+SRC_URI[barebox-2010.10.0.md5sum] = "60c208f86333430804d6e2ed40e4ff33"
+SRC_URI[barebox-2010.10.0.sha256sum] = "4ba3b6aa4cb0ad91dcf3c4f15951dc5f642ed86e5297bfd79d842cc1ad0b7841"
-- 
1.7.0.4



