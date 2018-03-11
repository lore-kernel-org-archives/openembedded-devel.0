Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id D2BD6788B9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Mar 2018 21:25:42 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id f25so9435051qkm.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Mar 2018 14:25:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=KOWYw8sOuHuh1e1hAcsNMwVAUaMxjeYiJhw7zptcK28=;
	b=KE23cChiN6Muafdd7MngznusP0ync2kh/5hloAXwpQp6LNDOtr85mSWpkKQpRON6ol
	wAbhAtuTyCN//jU+v1YbBfuNdBwOjfod10cwCMdIJvhQNgoP13Jhf29pA2M0122ZZDEA
	IFf/9yJxzZcsFlE+MFzv//N6ACLYi4erVHainV3FxMYg/IMoCX9GtNmLkjOhZKV9tKtS
	VOry7xfDLnc5bmv5SMnZ0pyKyhWk06IweClkO00oM+dF2lfe1/KjwL2FEKDBnxRgI8LJ
	euhUCjEpLJteOgEARpcbY9NIGxcQ1kOPUJeCWDtH423qEgWR0urtydCjqTQTu6bBu+FC
	Qhwg==
X-Gm-Message-State: AElRT7HUkJ2IbXbDBNjmhK/ptqpEv+ZKgO+JmyRc5oV24atTqF8gO0PU
	HxvTq44oH92G2MTB+iiEnJK0pBKG
X-Google-Smtp-Source: AG47ELtkf4prwanY6JMTXPut8arTJd6avIeykwNGu58L03Q6bkQeuMH5+FPpKu4/7s13P+Nwfl1Gwg==
X-Received: by 10.55.89.194 with SMTP id n185mr8849545qkb.111.1520803543896;
	Sun, 11 Mar 2018 14:25:43 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	w56sm4262115qta.65.2018.03.11.14.25.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 11 Mar 2018 14:25:43 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 11 Mar 2018 17:25:40 -0400
Message-Id: <1520803540-21139-2-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1520803540-21139-1-git-send-email-derek@asterius.io>
References: <1520803540-21139-1-git-send-email-derek@asterius.io>
Subject: [meta-webserver][PATCH 2/2] phpmyadmin: add correct versions for upstream url and version regex
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
X-List-Received-Date: Sun, 11 Mar 2018 21:25:43 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.7.9.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.7.9.bb b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.7.9.bb
index 27dfe0b..071572d 100644
--- a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.7.9.bb
+++ b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.7.9.bb
@@ -14,6 +14,9 @@ SRC_URI = "https://files.phpmyadmin.net/phpMyAdmin/${PV}/phpMyAdmin-${PV}-all-la
 SRC_URI[md5sum] = "0a862e3fa52c8b9078e0441ee82be831"
 SRC_URI[sha256sum] = "f19b503f0afb0dd3389d4bb11dab3f438d36e85eef11a5c400c592fd5f539398"
 
+UPSTREAM_CHECK_URI = "https://www.phpmyadmin.net/downloads/"
+UPSTREAM_CHECK_REGEX = "phpMyAdmin-(?P<pver>\d+(\.\d+)+)-all-languages.tar.xz"
+
 S = "${WORKDIR}/phpMyAdmin-${PV}-all-languages"
 
 inherit allarch
-- 
2.7.4


