Return-Path: <andreas.kling@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 65B1777317
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Feb 2017 09:07:39 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id r18so6413177wmd.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Feb 2017 01:07:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=RT0AFngnHJk2qaSScXzVg+jorrRG/VFdZCQbeqtwTto=;
	b=dWtY1NaIGB0iwe+G7916rqPFOuDvkDdnmsr+lgGiXCd5xa449Jrgx5C3e5FFhr+FVC
	E5lo8KXoemVswdiqcdZwelLL1J+wcbSHFnoAsFXHnrP2UPJZ7ooykXALPVxz20OSS/Kc
	+wBf7TbDNv1LMb9dhS/T1noEjjOJ9rTIFXxrAIQgCAn1rXF7jRi9YhPVLHyAJCWTCKjh
	RtPhCv08MRiLLdYXB18Nt38a1QEv6b5oz0tTkFt4CAvBxfoN4EeS4gn2zQnAr4Gp+JKw
	UohujfIWbxT7U9scV4r9kzGVrEshj0ZfDO6A4gpWycd5OZIDUnjNE5Ww/LhpIdPxNCL4
	Llew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=RT0AFngnHJk2qaSScXzVg+jorrRG/VFdZCQbeqtwTto=;
	b=US0nLZoNE0IzSpcOTNCuij7f58lK6gEj8lOvp3nSccOO3FwzBfKSrT62RElNecOABi
	89hVUaaGva+Rba80/JrTMTazxSHsRnOlk7m7HT0QL7CaVpOK7xR3yjK9exQ7hRER+GlY
	/c4ZU6ORLvLDxvHVlz6vnxzZPBXG/5fYHwScaZnuxifD93Sr6OYtQn9aR/rPwxdNzvWh
	JRfknzG4JrXrm+yZpkpj+e/sA+lkt8w01l/ttFKpjCr1c8XkBTcxetFmy34S8YQ4F2ot
	QrU9ThVQq3QFx5lEzoQ8s8wYwlPvGypiQBdt/l/Si3a4vJk3XJ6VQLflenIP/6PelrV8
	WHSA==
X-Gm-Message-State: AMke39mI2Qrj3EL1hz97eplARfzbW3CUvS+jGQF4A05nYYVKGSH1dCpnyitYx9x+rNcGAA==
X-Received: by 10.28.181.145 with SMTP id e139mr6292321wmf.103.1486717659788; 
	Fri, 10 Feb 2017 01:07:39 -0800 (PST)
Received: from nb-lx-hgc-001.peiker-cee.de
	(business-176-094-229-202.static.arcor-ip.net. [176.94.229.202])
	by smtp.gmail.com with ESMTPSA id v128sm565618wmv.2.2017.02.10.01.07.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 Feb 2017 01:07:38 -0800 (PST)
From: andreas.kling@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Feb 2017 10:07:21 +0100
Message-Id: <20170210090722.11753-3-andreas.kling@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170210090722.11753-1-andreas.kling@gmail.com>
References: <CALbNGRQAEX5aBsvsb3rY3CQ1C0V-WFzsJKxnNnLos8LdJJxA9g@mail.gmail.com>
	<20170210090722.11753-1-andreas.kling@gmail.com>
Subject: [meta-gnome][PATCH v03 2/3] dconf: fix bash completion in wrong package
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
X-List-Received-Date: Fri, 10 Feb 2017 09:07:40 -0000

From: Andy Kling <andreas.kling@peiker-cee.de>

  bash completion is used by dconf itself not by editor.
  move file to main package.
---
 meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb b/meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb
index 2830e717b..f7666cc0f 100644
--- a/meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb
+++ b/meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb
@@ -22,10 +22,10 @@ PACKAGES =+ "dconf-editor"
 FILES_${PN} += " \
     ${datadir}/dbus-1 \
     ${libdir}/gio/modules/*.so \
+    ${datadir}/bash-completion \
 "
 FILES_dconf-editor = " \
     ${bindir}/dconf-editor \
     ${datadir}/icons \
-    ${datadir}/bash-completion \
 "
 FILES_${PN}-dbg += "${libdir}/gio/modules/.debug/libdconfsettings.so"
-- 
2.11.0


