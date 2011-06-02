Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QSD2h-0007Ng-MX
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Jun 2011 20:54:51 +0200
Received: by mail-bw0-f47.google.com with SMTP id 5so1385143bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Jun 2011 11:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references;
	bh=J/cee4TJSzpFCyN50i9xpFPzlYSEGZDygf1BDlTaYmA=;
	b=H+tbayW+yPUlA2RB5bxX3vo2/x8ci/T1CQWgR7JUNH5F29YmzRxR812VPcQHGuprIT
	ygVrtQDcKa9hMVS2OfThXcNkcDSgkZ/s0VuuA01WA73DRLe52Q+Fix4ftUjXdatfAJhe
	fiyzFMZuQSMS1OXuOc5yZFSTQjJLaYwHFetcA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=wem0JxfTJkjm3/MmanyZcCtIi15xsRbncdjGqquuqNuSYWymvTuE4DfObM74EHdNjw
	+zOEkOjP5pKBVY48U18VaNHa8JKNZK+wi4fDS7VuDlsKG/I325kFR2v94YEkqPOo1Jtr
	QTlq/WxkmxDfXZx/N4JuTQ4gRuwll0CIXW2Ds=
Received: by 10.204.26.215 with SMTP id f23mr1086055bkc.140.1307040702068;
	Thu, 02 Jun 2011 11:51:42 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id ag6sm683169bkc.18.2011.06.02.11.51.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 02 Jun 2011 11:51:41 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Jun 2011 20:51:35 +0200
Message-Id: <05f2ea8983cb1476e8bc618a2076d08552099e71.1307040582.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.3
In-Reply-To: <1eefebc5e34260c875302a181cb80724bad4303d.1307040582.git.Martin.Jansa@gmail.com>
References: <1eefebc5e34260c875302a181cb80724bad4303d.1307040582.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1307040582.git.Martin.Jansa@gmail.com>
References: <cover.1307040582.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/2] gobject-introspection: move to recipes-gnome to match oe-core structure
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
X-List-Received-Date: Thu, 02 Jun 2011 18:54:51 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../use-usr-bin-env-for-python.patch               |    0
 .../gnome}/gobject-introspection_0.9.10.bb         |    0
 .../gnome}/gobject-introspection_git.bb            |    0
 3 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/{recipes-devtools/gobject-introspection => recipes-gnome/gnome}/gobject-introspection/use-usr-bin-env-for-python.patch (100%)
 rename meta-oe/{recipes-devtools/gobject-introspection => recipes-gnome/gnome}/gobject-introspection_0.9.10.bb (100%)
 rename meta-oe/{recipes-devtools/gobject-introspection => recipes-gnome/gnome}/gobject-introspection_git.bb (100%)

diff --git a/meta-oe/recipes-devtools/gobject-introspection/gobject-introspection/use-usr-bin-env-for-python.patch b/meta-oe/recipes-gnome/gnome/gobject-introspection/use-usr-bin-env-for-python.patch
similarity index 100%
rename from meta-oe/recipes-devtools/gobject-introspection/gobject-introspection/use-usr-bin-env-for-python.patch
rename to meta-oe/recipes-gnome/gnome/gobject-introspection/use-usr-bin-env-for-python.patch
diff --git a/meta-oe/recipes-devtools/gobject-introspection/gobject-introspection_0.9.10.bb b/meta-oe/recipes-gnome/gnome/gobject-introspection_0.9.10.bb
similarity index 100%
rename from meta-oe/recipes-devtools/gobject-introspection/gobject-introspection_0.9.10.bb
rename to meta-oe/recipes-gnome/gnome/gobject-introspection_0.9.10.bb
diff --git a/meta-oe/recipes-devtools/gobject-introspection/gobject-introspection_git.bb b/meta-oe/recipes-gnome/gnome/gobject-introspection_git.bb
similarity index 100%
rename from meta-oe/recipes-devtools/gobject-introspection/gobject-introspection_git.bb
rename to meta-oe/recipes-gnome/gnome/gobject-introspection_git.bb
-- 
1.7.5.3



