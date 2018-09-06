Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
	[209.85.210.173])
	by mail.openembedded.org (Postfix) with ESMTP id 30699796EC
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Sep 2018 17:22:25 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id h79-v6so5606325pfk.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Sep 2018 10:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=IVJBc4LqZ0GRlqYuSwWKuFzoLMflHtrchhE8rhpzM1c=;
	b=G6SjcoZjmEEug01zXDBZIreNaNhGifm8L625mSzZJ1VOtAvFSPFa6pV07Heo5Nc+eY
	PuOciLnWVHCLYN2sWLESma7NF2QcEOSrRxDt/3lC1J0ydPxbt+XM7Y8Rl6toJOu8YkNo
	6V0fqP8zlJvKEnn6Dw+5cv5xCB9Jrqs5tB/NoR8ZNKzZEk2bfEWrtpI473eM1YFj14UX
	9ioXeonlsg/XRlXepc3EfaWsuefY9wjECr1RnLZTajAZhXoYLKVa3/wicFHC+Zh+H1VF
	3I0p2VP9CQsuPzkd3isq3uTdV8IzwC+Jonxe8cTyoYD2hikHG3WRr/ilf8g3MG2F1xke
	6dKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=IVJBc4LqZ0GRlqYuSwWKuFzoLMflHtrchhE8rhpzM1c=;
	b=Lx5nO4G1EkU5ueRD6hNaezHJC6yFicIfqndH1LTEx2jniFo3YQiO3Tfnzq7cEocayw
	+oMXXKG82iIEgfX6nWSLO8EFk2tJ7MQ4fV3nwoEMOF6wy96PKSF6Dsq0IL4GooPob0zQ
	ENliYs8Ep6UbZzyba8wYdfnFcNldM8SNxpCLCqUoxoZ8OqGxWlIJYOyZUL9czvH1T1mC
	1SomgKzbNKVuvFp+kXb6IN4SW8cDZZkG+Hh/wY4/8M3ewx3/x0Ft1PqwSQNUx90ixIq+
	SyQJjf8uq1QT5kLkEAp5cJbW4Cd/lCm3EkyRBjaDHBbfeY0K88dW8Pr2Wchadpy3dGP5
	+mwg==
X-Gm-Message-State: APzg51DGj8E1YwNpjIfjI68yTNnNTsGuK7e0C5ZfqiCKxUmlw6KeV2RW
	2S9WuyaIcHaYzh3Umt7sEgelZP9A
X-Google-Smtp-Source: ANB0VdbkkGp/O56ivfCBT8682me93/W4krtEjtBLxxerv4lLWGam1b9oCP5Cggz0jRg7Ib18/N114w==
X-Received: by 2002:a63:2a0b:: with SMTP id
	q11-v6mr3817770pgq.36.1536254546019; 
	Thu, 06 Sep 2018 10:22:26 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::71e7])
	by smtp.gmail.com with ESMTPSA id
	22-v6sm8319828pfl.126.2018.09.06.10.22.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Sep 2018 10:22:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  6 Sep 2018 10:21:59 -0700
Message-Id: <20180906172210.42551-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180906172210.42551-1-raj.khem@gmail.com>
References: <20180906172210.42551-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 06/17] pam-ssh-agent-auth: Depend on openssl10
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
X-List-Received-Date: Thu, 06 Sep 2018 17:22:25 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/pam/pam-ssh-agent-auth_0.10.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/pam/pam-ssh-agent-auth_0.10.3.bb b/meta-oe/recipes-extended/pam/pam-ssh-agent-auth_0.10.3.bb
index 1638c41c88..2a461fc11a 100644
--- a/meta-oe/recipes-extended/pam/pam-ssh-agent-auth_0.10.3.bb
+++ b/meta-oe/recipes-extended/pam/pam-ssh-agent-auth_0.10.3.bb
@@ -11,7 +11,7 @@ SRC_URI = "http://sourceforge.net/projects/pamsshagentauth/files/pam_ssh_agent_a
 SRC_URI[md5sum] = "8dbe90ab3625e545036333e6f51ccf1d"
 SRC_URI[sha256sum] = "3c53d358d6eaed1b211239df017c27c6f9970995d14102ae67bae16d4f47a763"
 
-DEPENDS += "libpam openssl"
+DEPENDS += "libpam openssl10"
 
 inherit distro_features_check
 REQUIRED_DISTRO_FEATURES = "pam"
-- 
2.18.0


