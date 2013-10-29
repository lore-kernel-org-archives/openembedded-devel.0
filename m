Return-Path: <p.patat@gmail.com>
Received: from mail-we0-f172.google.com (mail-we0-f172.google.com
	[74.125.82.172])
	by mail.openembedded.org (Postfix) with ESMTP id 46D266CE9E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2013 13:07:41 +0000 (UTC)
Received: by mail-we0-f172.google.com with SMTP id q58so8279336wes.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2013 06:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=2LRd/o1hr8ubVV+dLfz1MVbujkdn9NTosPREZpi+7Ug=;
	b=bsaoZp8sRaMl654j0BAMgumym9QQnQUEYbwcEn9bG/LSMwhnl+VEcPCnpjhFJfmlUJ
	ONKQnYIxyg0A5daibSrTyzQq+Ev8mjQgUgFftwWkjghM5nt59fmSaolOfsfJrk9yX7hX
	296i46FIWFHVz1UIyYk2g/7szePxro7i8goJXsKmQXKa8VxD010y038Za4aOPK0OePzk
	GU/MuMwPxejk4qq4hSBKYtYQY9wUbGi+OLlXbsWcMlzwIOwFCbRIPQ7mUz/c997c88T0
	/2xcmXvV0h5J8Yw5ElUJpKVMKdIPweIwtCila1muwPjcrffGDdbQwr6iej+QQzo5IAQr
	5zSA==
X-Received: by 10.194.173.163 with SMTP id bl3mr23648124wjc.10.1383052062809; 
	Tue, 29 Oct 2013 06:07:42 -0700 (PDT)
Received: from ppatat-desktop.mpl.mstarsemi.fr ([94.103.137.126])
	by mx.google.com with ESMTPSA id qc10sm618358wic.9.2013.10.29.06.07.42
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 29 Oct 2013 06:07:42 -0700 (PDT)
Sender: patrick patat <p.patat@gmail.com>
From: Patrick Patat <patrick.patat@innotis.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Oct 2013 14:07:15 +0100
Message-Id: <1383052035-2340-1-git-send-email-patrick.patat@innotis.org>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-multimedia][PATCH v2] libao add missing plugin to packages list
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
X-List-Received-Date: Tue, 29 Oct 2013 13:07:42 -0000

Signed-off-by: Patrick Patat <patrick.patat@innotis.org>
---
 .../recipes-multimedia/libao/libao_1.1.0.bb        |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/libao/libao_1.1.0.bb b/meta-multimedia/recipes-multimedia/libao/libao_1.1.0.bb
index 08950b5..efd5ec3 100644
--- a/meta-multimedia/recipes-multimedia/libao/libao_1.1.0.bb
+++ b/meta-multimedia/recipes-multimedia/libao/libao_1.1.0.bb
@@ -11,6 +11,8 @@ SRC_URI[sha256sum] = "29de5bb9b1726ba890455ef7e562d877df87811febb0d99ee69164b88c
 
 inherit autotools
 
+PACKAGES_DYNAMIC += "^${BPN}-plugin-.*"
+
 do_install_append () {
     find "${D}" -name '*.la' -exec rm -f {} +
 }
-- 
1.7.9.5


