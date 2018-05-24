Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f48.google.com (mail-it0-f48.google.com
	[209.85.214.48])
	by mail.openembedded.org (Postfix) with ESMTP id 25471749CA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 14:39:06 +0000 (UTC)
Received: by mail-it0-f48.google.com with SMTP id 70-v6so2668600ity.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 07:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=XmpcmJUYVmbM/zLv6B1mtV6DWaf6aQE8gkd3Kr3wbug=;
	b=hK1hZXShDlZqUAOkEIThENrJSkwogJ8JI1Ae1maz3pCOE8HR6ArvG160jy0QCjObfD
	iBJFANWc0PGhNhTugYlA9r9lul7Hj8Vf5CBUUSJWBk+NrrFqz9yn9CpKPB8yWbBuWoQa
	wTls/3VvT/D5izep2JQxVyeZ1CH/+c5VyeeUw1to18RQ1H3BTN26W82XCqnUiMEo/fbk
	NVgCPfOjazE08nhlF1O/J7LvVjMVivIMnvt1ScviKs0TjnqDOr9ABlqlbGrMVi9iuU55
	r6A+fDchHQYumlNCnvGpBBpmxgoenbOJL33J32POkzTOfEOf43ITlx6XDHgn0LiR8mR/
	joIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=XmpcmJUYVmbM/zLv6B1mtV6DWaf6aQE8gkd3Kr3wbug=;
	b=boqMj+PAL0QsUrCC0URkt6WjDpUJTPJlxK6DqztZfLgtQYK/OQpyqGH1VUK2S/wC4e
	6ptMwd9PlGI/08GWByDZuZhE8Y098KaVX5x0MZ1JWqh9MEfrxmPUUOMgj/8HVfXK2kCe
	Ft1l7xvYEkHGLU8CIgDp8IukgzQECDN2pnfkRqcdKG4yYw4D/qGGVEZ49igdXPQOTJRU
	vE7xLIFEpFDz+se6JlQP5H3fyo6wtjLCXpkSpdYNk7cPhmLpFZXvYNHFJqbGN9E8tvzH
	yECBgoAIHLgfdZ3UY0ydaZSmxTW3T5wlBcGxueuSTwvCl/cqDjPSZi5r1Uo/hyEM1d3Z
	pR4A==
X-Gm-Message-State: ALKqPwelRdGKtESzHZPasjcYgnaj5onySkVPBzLTDy+ljzOS+Jw8T85V
	65nwUw18sp1MMOTNFCFaYVGNVurL
X-Google-Smtp-Source: AB8JxZofR8corkQieVENuwqIkiVSk9D4X2depKD9BFWT8kuiunMIxiiChjHTI5NttBgvtBLwI4D8Ow==
X-Received: by 2002:a24:a64d:: with SMTP id
	r13-v6mr9261114iti.124.1527172747516; 
	Thu, 24 May 2018 07:39:07 -0700 (PDT)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id
	a43-v6sm2435261itj.11.2018.05.24.07.39.05
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 May 2018 07:39:06 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 May 2018 10:38:38 -0400
Message-Id: <20180524143854.24096-2-twoerner@gmail.com>
X-Mailer: git-send-email 2.17.0.582.gccdcbd54c
In-Reply-To: <20180524143854.24096-1-twoerner@gmail.com>
References: <20180524143854.24096-1-twoerner@gmail.com>
Subject: [meta-oe][master-next][PATCH v3 01/17] openobex: rely on cmake.bbclass to put cmake package files in dev package
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
X-List-Received-Date: Thu, 24 May 2018 14:39:07 -0000

The cmake.bbclass in oe-core now ensures that ${libdir}/cmake and
${datadir}/cmake end up in the dev package, so recipes no longer need to
provide custom packaging rules to handles these files.

	http://git.openembedded.org/openembedded-core/commit/?id=d91dc4666683a96e9d03cbbd21b8a546f9069c93

Originally-conceived-by: Andre McCurdy <armccurdy@gmail.com>
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb b/meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb
index 1b56685c57..dcc2edf76e 100644
--- a/meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb
+++ b/meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb
@@ -34,7 +34,7 @@ do_install_append () {
 PACKAGES =+ "openobex-apps"
 FILES_${PN}-apps = "${bindir}/*"
 FILES_${PN} += "${libdir}/lib*.so.*"
-FILES_${PN}-dev += "${bindir}/openobex-config ${libdir}/cmake"
+FILES_${PN}-dev += "${bindir}/openobex-config"
 DEBIAN_NOAUTONAME_${PN}-apps = "1"
 
 BBCLASSEXTEND = "native"
-- 
2.17.0.582.gccdcbd54c


