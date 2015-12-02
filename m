Return-Path: <daniel.adolfsson@bluetest.se>
Received: from mail-lf0-f48.google.com (mail-lf0-f48.google.com
	[209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id A63406014E
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Dec 2015 10:48:53 +0000 (UTC)
Received: by lfs39 with SMTP id 39so42699545lfs.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Dec 2015 02:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bluetest-se.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=Z0DI4/Bo/cVXSy4ObhJnMJnXqzp5k0wI+sXgAGz8f50=;
	b=GrXrPTrrDvObrwNUQOc+06NG3LP0tkpNNC4reln/P+iF9Nx3eZFXendV/28GWiFxBG
	xrvzfTqSNCDEXl2iz99EpEtMEwcjBVQR/6cn6FuG1gQJAfDkhdnR//vkFWgn5F+FINeZ
	0Ta8CCcCQWtCtcKeRo4ezNqiPxyw3ZmoYSdDtSixi8omil1JMGpwxdJOd0bl3L+5wdzU
	NG6sSk4MeLbcOuhyqxbUHeUt64sYH5lBTChEFc7QfGXq2d+uEMSDrQQ1AqlqHUmidG1U
	S5JvY4Sh2f35VuBwe6ye4o+SZlLnV3CGJlrIP+0Wkahzcz999/MnfgV/MQiioYH9nDtX
	J6TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Z0DI4/Bo/cVXSy4ObhJnMJnXqzp5k0wI+sXgAGz8f50=;
	b=nGw5RVc9Pw5c6WH6p8ut+ZnwMYRSdZgmSqwFPwXMbyxraj/ygxasBNojTTvfC6gVCm
	5EpcFt4gT/q+dCkUUOGXbqVKiCLQ7bu86t7IEv8OtqREU7FyTx4su0dVlPtyRGx7JFgo
	KMTeSQsv05n8CA8T+fHjhy0fYQGCoXG3FWBoOTfpClp1N7BDHgSvf7o/YOzfaXuWx/Cp
	j5cRwAk2Fmj6R24Sg32AOR+/5cBqIg6LyoVMs+n//DzJoOX7n53n/ActrpcrR6KdtplF
	Sl4EphypT57fX/bMFP/FHtFvRhe0XFmM2dsw8ol0Ubnk2ewgeCnjSGgZyk+xVL17n2Nn
	i85g==
X-Gm-Message-State: ALoCoQlT9vFXImEpAb7IXDrXXBEG3/pNbvy5Dtc4Aeer8Pj3EjqOI+C0kSnHdTTDI+NWxNYEcHwh
X-Received: by 10.25.20.217 with SMTP id 86mr1699497lfu.164.1449053333356;
	Wed, 02 Dec 2015 02:48:53 -0800 (PST)
Received: from bluepc-13-008.internal.bluetest.se
	(user145.217-10-117.netatonce.net. [217.10.117.145])
	by smtp.gmail.com with ESMTPSA id l81sm384574lfb.40.2015.12.02.02.48.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 02 Dec 2015 02:48:52 -0800 (PST)
From: Daniel Adolfsson <daniel.adolfsson@bluetest.se>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 Dec 2015 11:48:46 +0100
Message-Id: <1449053326-20657-1-git-send-email-daniel.adolfsson@bluetest.se>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] gitpkgv.bbclass: Add support for gitsm:// url type
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
X-List-Received-Date: Wed, 02 Dec 2015 10:48:56 -0000

When using "gitsm://", for projects using submodules, instead of "git://", gitpkgv does not work.

The limitation is synthetic, this patch simply adds gitsm as an allowed url type.

Signed-off-by: Daniel Adolfsson <daniel.adolfsson@bluetest.se>
---
 meta-oe/classes/gitpkgv.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/classes/gitpkgv.bbclass b/meta-oe/classes/gitpkgv.bbclass
index 7bdc538..1cba00c 100644
--- a/meta-oe/classes/gitpkgv.bbclass
+++ b/meta-oe/classes/gitpkgv.bbclass
@@ -65,7 +65,7 @@ def get_git_pkgv(d, use_tags):
 
     found = False
     for url in ud.values():
-        if url.type == 'git':
+        if url.type == 'git' or url.type == 'gitsm':
             for name, rev in url.revisions.items():
                 if not os.path.exists(url.localpath):
                     return None
-- 
1.9.1


