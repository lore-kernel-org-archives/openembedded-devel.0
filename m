Received: from mail-ee0-f53.google.com ([74.125.83.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tr6V6-0008RR-Si
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Jan 2013 13:36:07 +0100
Received: by mail-ee0-f53.google.com with SMTP id c50so8190732eek.40
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Jan 2013 04:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=n9VSwB3LULqgh1H3UosyIv3CRUOHkrR2omST0a47XHo=;
	b=O4hXN83E9TL7CR8kK766Q15WPuybRdDNrYyKcwk9DO6ZzxzgAVYnr9SwlZZnXd3nNS
	d+MtvmTv2BzxBNSlXR8Uz6J6ig1IP6skOXGlsvFfDLq8/V+JwheaZ9XVzN0IS2jluYqh
	Xr2EHUCUmNdgikxE9rd3ii5WVuvWe7Z8VLu5xO0TUGVKEQLeWCvjYu/kAflt4XgFRR03
	hzX6qBjTehwP9duiPwlEgEbwTLUh86GbZYXO21K4jKdHlza18wSAvIEBgPm1FK1pJhW/
	FmfLUu4Fy3WKBht6n9PJFv30IDXaxLqU0eA0pX5NftHU9BjlJ7a9HRmbFcB83V48+DFO
	fKZg==
X-Received: by 10.14.206.197 with SMTP id l45mr143316758eeo.17.1357302048106; 
	Fri, 04 Jan 2013 04:20:48 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id z8sm110366985eeo.11.2013.01.04.04.20.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 04 Jan 2013 04:20:47 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  4 Jan 2013 13:20:33 +0100
Message-Id: <b413ee6f410ab3dc909d64176eb43ffef58da9da.1357301108.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1357301108.git.Martin.Jansa@gmail.com>
References: <cover.1357301108.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1357301108.git.Martin.Jansa@gmail.com>
References: <cover.1357301108.git.Martin.Jansa@gmail.com>
Cc: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [meta-oe][danny][PATCH 3/6] devilspie2: move to meta-gnome (libwnck is there)
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
X-List-Received-Date: Fri, 04 Jan 2013 12:36:14 -0000

From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 .../recipes-gnome}/devilspie/devilspie2_0.24.bb                           | 0
 .../recipes-gnome}/devilspie/files/default.lua                            | 0
 .../recipes-gnome}/devilspie/files/devilspie2.desktop                     | 0
 3 files changed, 0 insertions(+), 0 deletions(-)
 rename {meta-oe/recipes-graphics => meta-gnome/recipes-gnome}/devilspie/devilspie2_0.24.bb (100%)
 rename {meta-oe/recipes-graphics => meta-gnome/recipes-gnome}/devilspie/files/default.lua (100%)
 rename {meta-oe/recipes-graphics => meta-gnome/recipes-gnome}/devilspie/files/devilspie2.desktop (100%)

diff --git a/meta-oe/recipes-graphics/devilspie/devilspie2_0.24.bb b/meta-gnome/recipes-gnome/devilspie/devilspie2_0.24.bb
similarity index 100%
rename from meta-oe/recipes-graphics/devilspie/devilspie2_0.24.bb
rename to meta-gnome/recipes-gnome/devilspie/devilspie2_0.24.bb
diff --git a/meta-oe/recipes-graphics/devilspie/files/default.lua b/meta-gnome/recipes-gnome/devilspie/files/default.lua
similarity index 100%
rename from meta-oe/recipes-graphics/devilspie/files/default.lua
rename to meta-gnome/recipes-gnome/devilspie/files/default.lua
diff --git a/meta-oe/recipes-graphics/devilspie/files/devilspie2.desktop b/meta-gnome/recipes-gnome/devilspie/files/devilspie2.desktop
similarity index 100%
rename from meta-oe/recipes-graphics/devilspie/files/devilspie2.desktop
rename to meta-gnome/recipes-gnome/devilspie/files/devilspie2.desktop
-- 
1.8.0.2



