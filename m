Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 7E20B731DA
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Sep 2016 15:32:24 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id w12so39670233wmf.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Sep 2016 08:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=qYFs2Zoh3w1utUVSaI/XcB1O5fYVcILEGgErBdIEH2o=;
	b=FOJiMZBZpHQjNQHmdZfEhZLy1zyMZ3uaiaBd8LgFSqKv5a7mNlX0yDmiMQI+wqIASp
	9CEOgQOolOzCeUOAYEfzG2L8ivv6nVYTooMR7VAEQNl31IFesg/V28YXpp7Uw4/yNbGu
	s9kU6p+DWbQbH35puT3eqpw++jlijApMaEaeI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=qYFs2Zoh3w1utUVSaI/XcB1O5fYVcILEGgErBdIEH2o=;
	b=L1DsqNKTyp00KdCZKJ1J4L1nrXHph6fjrsCdSQPeeWF+NMUzHeSUz/t7RZPTA6QwWo
	Nlqaopo8Tz8KV6VmUP3KJDJtUiAtbv1udLfbvJLsfu6I7a+67DErWe/BK/yNgFkRxvUP
	qUXbiX9hA21YjuEsgWdhonfXuBQBJpLC1AMF498IdNX0mJJb+EnbY6/Me/+CpQ96MhB1
	+g1mPZZsS2g7lSp/jrP86tx2t/YpdxFF6+CQ6RvUXUEuH7b9GMWuPKc+EtCmJYyts3VV
	Fx1OYKff5QBarjoPodAeGc8bc5lQqMtfZ9C4mYrT6nbUeHfMwQDq9PK1I4hOaRXTC49e
	mGPg==
X-Gm-Message-State: AE9vXwOePT1MqoPPp+ImXT+AEvO6PHyBP2GVi0isqmvFL6yNNgAVOGIIOtKwS4bL9LrYhVwT
X-Received: by 10.194.107.69 with SMTP id ha5mr40675763wjb.100.1473262344440; 
	Wed, 07 Sep 2016 08:32:24 -0700 (PDT)
Received: from hackbox.linaro.org ([81.128.185.36])
	by smtp.gmail.com with ESMTPSA id
	s184sm4841955wmb.11.2016.09.07.08.32.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 07 Sep 2016 08:32:23 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 Sep 2016 16:32:01 +0100
Message-Id: <1473262322-2821-2-git-send-email-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1473262322-2821-1-git-send-email-nicolas.dechesne@linaro.org>
References: <1473262322-2821-1-git-send-email-nicolas.dechesne@linaro.org>
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [meta-oe][PATCH 1/2] gpsd: make sure the recipe uses LDFLAGS
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
X-List-Received-Date: Wed, 07 Sep 2016 15:32:25 -0000

since commit fa436aeb3242cbfdbbe16d448d45bce8eb5b74fd in OE core, we are seeing
GNU_HASH QA failure when building gpsd. Since this commit we default to setting
the wrong linker hash style to detect such errors in recipes.

gpsd is using scons which does not take LDFLAGS into account, and LDFLAGS need
to be passed from the environment, using LINKFLAGS variable.

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb
index 822fc24..537facc 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb
@@ -55,12 +55,14 @@ do_compile_prepend() {
     export PKG_CONFIG_PATH="${PKG_CONFIG_PATH}"
     export PKG_CONFIG="PKG_CONFIG_SYSROOT_DIR=\"${PKG_CONFIG_SYSROOT_DIR}\" pkg-config"
     export STAGING_PREFIX="${STAGING_DIR_HOST}/${prefix}"
+    export LINKFLAGS="${LDFLAGS}"
 }
 
 do_install() {
     export PKG_CONFIG_PATH="${PKG_CONFIG_PATH}"
     export PKG_CONFIG="PKG_CONFIG_SYSROOT_DIR=\"${PKG_CONFIG_SYSROOT_DIR}\" pkg-config"
     export STAGING_PREFIX="${STAGING_DIR_HOST}/${prefix}"
+    export LINKFLAGS="${LDFLAGS}"
 
     export DESTDIR="${D}"
     # prefix is used for RPATH and DESTDIR/prefix for instalation
-- 
2.7.0


