Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 172DC60097
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jun 2015 11:49:26 +0000 (UTC)
Received: by wiwd19 with SMTP id d19so72398058wiw.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jun 2015 04:49:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=9ny6994CilbC1TgyiLmDejAIiiRqTppCsDM28ZMQWco=;
	b=AvN2349Vqdbe8xaoYGVSxKmw5Mcf+ZkdnwZnG8ALF8GBjE7k9KcZaxl5ONmJG+5m5I
	JF3SUWDu+1ALSfFMCv+W0BWxmFKnUyPL+HoeUEGaBDwH5DYwWQn34MSRDrTnGaodrzuX
	F3HYN83Qid+fnzPSQEyixqkknFIz+OYGTMz2qWMSiGPnpWbXeWX3ugN7LYPqrQqaAG9d
	HXeiVrvaFy4qqSh66jzwNQNYX8T5QXAyyVUhRf/VM8b1kUP/pO1bBOTy+psSC6izACg8
	TKiJQq3BotFbb6bebHBlIQZVPFV6BMywaI5yvBxv4K88whR8guMXa/ofI//ZGVB059sb
	b0GA==
X-Gm-Message-State: ALoCoQkLlCQeJX6rcQ7xl8HqS0JDEfysmxi99xL3Kzc/51p3uxp25+zlCXzsfezLNzN920sA55uS
X-Received: by 10.180.74.210 with SMTP id w18mr30548118wiv.77.1434368967431;
	Mon, 15 Jun 2015 04:49:27 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by mx.google.com with ESMTPSA id
	gh3sm18594229wjb.36.2015.06.15.04.49.26
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 15 Jun 2015 04:49:26 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Jun 2015 12:44:40 +0100
Message-Id: <1434368680-29022-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH][meta-multimedia] libao: fix PACKAGECONFIG definition
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 15 Jun 2015 11:49:27 -0000

The ${base_contains...} calls were missing their trailing }.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-multimedia/recipes-multimedia/libao/libao_1.1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/libao/libao_1.1.0.bb b/meta-multimedia/recipes-multimedia/libao/libao_1.1.0.bb
index 1a22604..04e8461 100644
--- a/meta-multimedia/recipes-multimedia/libao/libao_1.1.0.bb
+++ b/meta-multimedia/recipes-multimedia/libao/libao_1.1.0.bb
@@ -26,7 +26,7 @@ python populate_packages_prepend () {
     do_split_packages(d, rootdir_dbg, '^(.*)\.so$', output_pattern='${BPN}-plugin-%s-dbg', description='AO %s plugin debug data')
 }
 
-PACKAGECONFIG ?= "${@base_contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d) ${@base_contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)"
+PACKAGECONFIG ?= "${@base_contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)} ${@base_contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)}"
 PACKAGECONFIG[esound] = "--enable-esd,--disable-esd,esound"
 PACKAGECONFIG[alsa] = "--enable-alsa,--disable-alsa,alsa-lib"
 PACKAGECONFIG[pulseaudio] = "--enable-pulse,--disable-pulse,pulseaudio"
-- 
2.1.4


