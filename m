Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 5C66F77972
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Jun 2017 09:46:12 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id n195so71182609wmg.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Jun 2017 02:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=DHaFhk+7vIyw/HPCRij76VLTJMWu5kbUc/Ec1uO5Tt4=;
	b=yZxoe1MBoBuuz4vmBmTvVIF99rQuMnqCdTcKR+WDsAyDJSSOUo+kcB57MY8SZ5mMp1
	LcYviWfC7yh3cl8XFICU4orEim5z3A98nBusbcUECtihCjbG+dvy1cuwjX9Wtb/gOHzw
	BB9Kt/Xzki0WYDnuzFfkttjHLjchKxwFjdFjxyAsSvS8Fb4eBFfvMzwyJWjkbNluEXTV
	wXmcmSedZsW6WGFmz0IZG4rE77DMZDFDOwJnO2Ae3uUueBPlCVUX7OyFZHdfA0N7Qw5Y
	evyKeL8pQINm+OcLf3hOBmJg4G9248VURba94Ay1JpwCd+H4L/CalSSQgKcVd91rN6hf
	vv+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=DHaFhk+7vIyw/HPCRij76VLTJMWu5kbUc/Ec1uO5Tt4=;
	b=EY2LNUqEPPyJ5HWD7LeOZeSGWDS9wNltS2Dd5TfW0hrsr9N/Pp9DZH0R0CQ41WLhia
	0weNbnDkqR0sJyuTh3F8QF2fqWeSvRCwX13mEH0YvYc9XAnGVEOE2mqyPWFa6Xt0cX2c
	uZrlobsBh6NlpTCrCFWZWFFfEMZAQyArclUkwtZ7uZin/G6Iwq80l1pn9iiKKTMmtWhz
	7q+jirq9oXR43X2Dk8kDQaPmHtgJskhUl7y5Vk/SLGEIu4tWZPTh39cxLaNP/Wbwpn7F
	oVmFlAgTtPdFv+Kw69GtV28lhxdkSjwN0YWbV177A0pB3H6Zk/yXjsMMNWZo9kRCmC1Q
	hboQ==
X-Gm-Message-State: AODbwcDYQRmn+WfN0VjDoApqkBo8kMWPqjz9kUsDoy6yUAi9beiBUQUm
	mu2x9eCcCkG+2EeAUMo=
X-Received: by 10.28.131.213 with SMTP id f204mr6992641wmd.26.1496655973700;
	Mon, 05 Jun 2017 02:46:13 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	e19sm10311010wma.25.2017.06.05.02.46.12
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 05 Jun 2017 02:46:13 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  5 Jun 2017 10:46:10 +0100
Message-Id: <1496655970-1826-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] meson: don't pass localedir
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
X-List-Received-Date: Mon, 05 Jun 2017 09:46:13 -0000

For historic reasons the localedir directory is where binary locales are stored
(/usr/lib/locale) , not where application translations belong (typically,
/usr/share/locale).  Don't pass localedir explicitly, and let Meson use the
default of $datadir/locale to match the behaviour of autotools.bbclass and the
expectations of the system.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-oe/classes/meson.bbclass | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/classes/meson.bbclass b/meta-oe/classes/meson.bbclass
index 0cf78e4..54b984f 100644
--- a/meta-oe/classes/meson.bbclass
+++ b/meta-oe/classes/meson.bbclass
@@ -27,7 +27,6 @@ MESONOPTS = " --prefix ${prefix} \
               --libexecdir ${@noprefix('libexecdir', d)} \
               --includedir ${@noprefix('includedir', d)} \
               --mandir ${@noprefix('mandir', d)} \
-              --localedir ${@noprefix('localedir', d)} \
               --sysconfdir ${sysconfdir}"
 
 MESON_C_ARGS = "${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
-- 
2.8.1


