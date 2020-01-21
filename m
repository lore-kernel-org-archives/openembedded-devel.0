Return-Path: <sumit.garg@linaro.org>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 9A6997FDA0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jan 2020 08:56:49 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id b9so1091923pgk.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jan 2020 00:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=lx3qgQ4gVUHJaAcisptCTuPVgYdEk5i6H1TMGnVTSdk=;
	b=dRCfJh3ScAYD6tooJaZct7PC+YaNyga6HAbagXYI2JZFyxdblRRqGjdhncLIY6WD+9
	nbT54FSDVGYC/BNvIWrQZOoOtUEUOsAI62CtbnXtlZJ+Vs7zetfn4N3iiqO3voMIMkv+
	wkrjVRKFOU5qA12kB5+aP+V4ueGToUhLhpOJW/d2/aIskXnJsTPjSCzP3PN4POHuw7am
	EGCkiO6bAnBqIEd4UuFujJKLhrl0ubg8k9ejhEdMm+yjfsDfoeC3Z1BuD7JJXbr8zQ1+
	CyIY5CiYDU9CksHaUGApsM6A6IkzRc+Y+/btXK9RU2nc5v0sJ3sIeQWjQ2OA3+FaIlUt
	OXfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=lx3qgQ4gVUHJaAcisptCTuPVgYdEk5i6H1TMGnVTSdk=;
	b=lT9f60mwl/F5E0Bfk7xiWWomvJs8OM1yAGyFShiZqFVmm32/alJc6CN+cN/binD6Md
	pDk9f9d9l/PXhBc2mIHRtBPnISifIb9bs9tq4FfSirLFfvR3T7l2R8hx0NT2v3kktT9Y
	pg7vtTQg76w9YCNz9f/IzOIN57L9QlLb6+RA6R97XzSpODYfNjKRY20BSKaNCQjZyq6e
	HhzLpG9iYHahkGd6vvPghvDXtd9nDXrTPbToLJ4fFbdPsf2RHBnZh3AEGLU7yey8DUuB
	YFW6ob2hDSGEXZiI2uWglfrfjx0G7X7wO5hf4gNH5bMGEebp/38v13yvlxIOVmV7XQb+
	qzww==
X-Gm-Message-State: APjAAAXTB2p/P0+Cc7ZEzyKiP3q3K0nCxJvENqGMR2+FYVeLMZnJNdAQ
	a82SuR7GjsL0K+B8hlNdZTyvqLMqAXY=
X-Google-Smtp-Source: APXvYqxNJDCGom4KQWTj1sWOMCAwcmLRQtYy6Uu/u1PWqLHVuixMp7clJixmWLsw0z3UwqXvXaccaA==
X-Received: by 2002:aa7:848c:: with SMTP id u12mr3377843pfn.12.1579597010422; 
	Tue, 21 Jan 2020 00:56:50 -0800 (PST)
Received: from localhost.localdomain ([117.252.69.227])
	by smtp.gmail.com with ESMTPSA id
	m22sm42546378pgn.8.2020.01.21.00.56.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 21 Jan 2020 00:56:49 -0800 (PST)
From: Sumit Garg <sumit.garg@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Jan 2020 14:26:10 +0530
Message-Id: <1579596971-24752-4-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1579596971-24752-1-git-send-email-sumit.garg@linaro.org>
References: <1579596971-24752-1-git-send-email-sumit.garg@linaro.org>
Cc: daniel.thompson@linaro.org
Subject: [meta-networking][PATCH v2 3/4] dovecot: fix gettext tool dependency
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
X-List-Received-Date: Tue, 21 Jan 2020 08:56:49 -0000

gettext tool dependency was implicitly met while building with source
GCC tool-set which isn't the case with external tool-set.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 meta-networking/recipes-support/dovecot/dovecot_2.2.36.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.2.36.4.bb b/meta-networking/recipes-support/dovecot/dovecot_2.2.36.4.bb
index 239a252..0f7fad2 100644
--- a/meta-networking/recipes-support/dovecot/dovecot_2.2.36.4.bb
+++ b/meta-networking/recipes-support/dovecot/dovecot_2.2.36.4.bb
@@ -19,7 +19,7 @@ DEPENDS = "openssl xz zlib bzip2 libcap icu libtirpc"
 CFLAGS += "-I${STAGING_INCDIR}/tirpc"
 LDFLAGS += "-ltirpc"
 
-inherit autotools pkgconfig systemd useradd
+inherit autotools pkgconfig systemd useradd gettext
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ldap pam', d)}"
 
-- 
2.7.4


