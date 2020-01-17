Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 288007FC1B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jan 2020 21:26:39 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id j42so24006211wrj.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jan 2020 13:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=/Up+XN26c9fKEaVQxcKJ3ZA8zG2+YnnjbD0dKQ0Siyc=;
	b=PU/0oaV1GajVjpxGbrof6TMukAwECfHMkuIrmCoBRGtgWPkS2ZRjlyie6BiCo1QWlk
	zfr2YqS5wLvL75t+D62LU35vpvpGj5GiVgekWvnUdOxvm/fgD7Ot5TTW75j9h5lQSlLf
	ai6+8aLzDMAt+rmtfT/1lxQFzzvDrxlpkMnBNAufidaunipi4sXhQuaEw7SsW3khsvj7
	dBX9QQsxODPUIotU0zSbbaiZTgVTK7eJTT7+kxEdKF49W7igC56741YxgIurpRord/rm
	S/jxfpg3Zz36pnAquRFfdKPBczbC12wcFU8dkJIdPNb+bn44Krj4N1tgGGZjXQjhPWUI
	HaoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=/Up+XN26c9fKEaVQxcKJ3ZA8zG2+YnnjbD0dKQ0Siyc=;
	b=gDRE29Yzo6vXwz5EhOONoQQZHOSwCImYl6iWHSIvqPlQgsTna8EKBiLlm84QhNX3L3
	Sm8hxDSpizv+u4keADvwudG67TxbJkk1R7JKd+pSTNUSlekMg5osH/Dy6iz+wiD6Hnz3
	ja87J+K4Ozx5yHfSEsCPNLUNErmdhBnpzRnR1LxdHwb7QNOj8wtxneR9Rnzd47/mLp4Q
	vKRkEGVIW/d66fjfYDMeT2QI8zqk3tVkWqj63WG64uWzvC78ZtJNEY/AeSSfa/p8h3EN
	HofeC5DojSaEruZbNE0eSnUzSEkyScEaw4g924hqeeRp4nizA9qRH9YbXSsJ2vmMYA70
	6WNA==
X-Gm-Message-State: APjAAAUG1HIQ7jbFjOXRaTsrkwWQHAmuIk7Eyv/gqQ6xeCrd4+Z7j9t/
	qVMgawS3tXQwdE5fdhNC/Eg=
X-Google-Smtp-Source: APXvYqzkp282j8J8kVcblZtyhjruOd6p82D97+lBzxlQzIw+FQWX6nVCtnfwDFgWIdH0G6A3/nItbg==
X-Received: by 2002:adf:ee52:: with SMTP id w18mr5177264wro.415.1579296399903; 
	Fri, 17 Jan 2020 13:26:39 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0BBB19EA1F5BE194E084E5.dip0.t-ipconnect.de.
	[2003:f0:7f0b:bb19:ea1f:5be1:94e0:84e5])
	by smtp.gmail.com with ESMTPSA id f127sm701415wma.4.2020.01.17.13.26.39
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 17 Jan 2020 13:26:39 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: kai.kang@windriver.com,
	openembedded-devel@lists.openembedded.org
Date: Fri, 17 Jan 2020 22:26:15 +0100
Message-Id: <20200117212615.32526-10-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200117212615.32526-1-schnitzeltony@gmail.com>
References: <20200117212615.32526-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 5/5] xfdesktop: upgrade 4.14.1 -> 4.14.2
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
X-List-Received-Date: Fri, 17 Jan 2020 21:26:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 4.14.2
========================
- Update thumbnail when file changes (Bug #14919)
- Add DnD support for application/octet-stream (Bug #14919)
- windowlist: Fix ellipsizing (Bug #15851)
- Add padding to custom actions without icon (Bug #14628)
- Fix yet another rubber band DnD issue (Bug #16046)
- Reintroduce workaround for Bug #11283
- Show file names in tooltips (Bug #15899)
- fallback style: Highlight selected icons (Bug #15866)
- Translation Updates: Albanian, Amharic, Arabic, Armenian (Armenia),
Asturian, Basque, Belarusian, Bulgarian, Catalan, Chinese (China),
Chinese (Hong Kong), Chinese (Taiwan), Croatian, Czech, Danish, Dutch,
English (Australia), English (Canada), English (United Kingdom),
Estonian, Finnish, French, Galician, Georgian, German, Greek, Hebrew,
Hungarian, Icelandic, Indonesian, Interlingue, Italian, Japanese,
Kazakh, Korean, Lithuanian, Malay, Norwegian Bokmål, Norwegian Nynorsk,
Occitan (post 1500), Persian (Iran), Polish, Portuguese, Portuguese
(Brazil), Romanian, Russian, Serbian, Slovak, Slovenian, Spanish,
Swedish, Thai, Turkish, Uighur, Ukrainian, Uzbek

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../xfdesktop/{xfdesktop_4.14.1.bb => xfdesktop_4.14.2.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/xfdesktop/{xfdesktop_4.14.1.bb => xfdesktop_4.14.2.bb} (74%)

diff --git a/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.14.1.bb b/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.14.2.bb
similarity index 74%
rename from meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.14.1.bb
rename to meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.14.2.bb
index fe9f40b38..a512a62ff 100644
--- a/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.14.1.bb
+++ b/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.14.2.bb
@@ -8,8 +8,8 @@ inherit xfce features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[md5sum] = "de4b8f6687862ad46dbe4e1ced453f4d"
-SRC_URI[sha256sum] = "f705a016246ec54ab0c688d1a0577f6c2b45a446690aa8d9e5a7ac23efebf882"
+SRC_URI[md5sum] = "5db09df39b0808f25bd3a3128f8c9e77"
+SRC_URI[sha256sum] = "a30534461fea907f969f608a11c84be0b1aaad687c591c32cd56a9d274ea3e74"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[notify] = "--enable-notifications,--disable-notifications,libnotify"
-- 
2.21.0


