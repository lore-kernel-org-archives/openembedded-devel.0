Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id E6D8374197
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Feb 2016 13:52:21 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id g62so53737979wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Feb 2016 05:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=Q4DJ9pAiTIhxs4ICbvx8PHC4p4TB7oRcVz/d/SBy1QQ=;
	b=pQljzHv09a46BNOSrnfa9PGvtFIEIWKFl1/GOyFese1BPGaS2vVTmSjcNH+f2OYIPX
	a4FZXPDyc3DqIU/axM+YmuptHkhKwouRwj8zWeYADqTg7arpQuAOwPRrprYWM4dVQdY+
	cJHYiCqpqwAST3q97gmLxqJ+psUWCJhf9jxuNDTltU8wqlV+U4rGC64XYNzmUbiOhczC
	V/HUbuKQUJ7Tgp2+tQ1lpwcfnu0yPRniy0p64J4o7qZ/jwkXE7/+0ta5tsmalVcjxKnV
	/OKltlczslnl30M/NtstCfV1qgxOxu5nFUU1KETukbXTfT3EcGOyHHqQ5jtVTdJ0GUUU
	u/Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-type:content-transfer-encoding;
	bh=Q4DJ9pAiTIhxs4ICbvx8PHC4p4TB7oRcVz/d/SBy1QQ=;
	b=Kmra/9Gh3vhpJroR8Fgj1fMx38wP5PFEk4W82/HDwJoAEHgbtZxEpIUBjz4jx9CYVs
	Jn1Wkg5mEL/LkOiP0J1XWvj8TeoeBu3//yzIxcPdhThQKztSpxrVD+++WOWMnTIZpsyN
	raactGwzVq4Ql1HNTLaMSycNhAV+xJLnPkiiObbisxJOg3SKiKQLNkGmnFyB2P+46axe
	9JJpOYdjYMqbxK5Z3jgYpkbemqo+V2OpdScUuNL/XKME1QU0PcBRMG6UKCNUxAkRPm8z
	o+WBGLntrsw4UwjP8CI7RsYtueeA/WQO7YDEPpluKAP53xNIRsmwyA1na4uGw4dsHUZY
	0uwQ==
X-Gm-Message-State: AG10YOSY6GyPieiuqKflspQmpfRz/5pIPtrIc0yK+32qoAYaI58yC/z2+ZTym+PYxwV7xA==
X-Received: by 10.194.186.232 with SMTP id fn8mr6679076wjc.93.1455371542144;
	Sat, 13 Feb 2016 05:52:22 -0800 (PST)
Received: from localhost.localdomain (p4FDF11DE.dip0.t-ipconnect.de.
	[79.223.17.222]) by smtp.googlemail.com with ESMTPSA id
	jo6sm16553106wjb.48.2016.02.13.05.52.21
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 13 Feb 2016 05:52:21 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 13 Feb 2016 14:52:03 +0100
Message-Id: <1455371527-11604-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Subject: [PATCH 0/4] cn/jp/kr/tw fonts
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
X-List-Received-Date: Sat, 13 Feb 2016 13:52:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Did not yet find somebody reading them but to me they look authentic

Andreas Müller (4):
  source-han-sans-cn-fonts: initial add 1.004
  source-han-sans-jp-fonts: initial add 1.004
  source-han-sans-kr-fonts: initial add 1.004
  source-han-sans-tw-fonts: initial add 1.004

 .../44-source-han-sans-cn.conf                     | 19 ++++++++++++
 .../ttf-fonts/source-han-sans-cn-fonts_1.004.bb    | 34 ++++++++++++++++++++++
 .../44-source-han-sans-jp.conf                     | 19 ++++++++++++
 .../ttf-fonts/source-han-sans-jp-fonts_1.004.bb    | 34 ++++++++++++++++++++++
 .../44-source-han-sans-kr.conf                     | 19 ++++++++++++
 .../ttf-fonts/source-han-sans-kr-fonts_1.004.bb    | 34 ++++++++++++++++++++++
 .../44-source-han-sans-tw.conf                     | 19 ++++++++++++
 .../ttf-fonts/source-han-sans-tw-fonts_1.004.bb    | 34 ++++++++++++++++++++++
 8 files changed, 212 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/ttf-fonts/source-han-sans-cn-fonts/44-source-han-sans-cn.conf
 create mode 100644 meta-oe/recipes-graphics/ttf-fonts/source-han-sans-cn-fonts_1.004.bb
 create mode 100644 meta-oe/recipes-graphics/ttf-fonts/source-han-sans-jp-fonts/44-source-han-sans-jp.conf
 create mode 100644 meta-oe/recipes-graphics/ttf-fonts/source-han-sans-jp-fonts_1.004.bb
 create mode 100644 meta-oe/recipes-graphics/ttf-fonts/source-han-sans-kr-fonts/44-source-han-sans-kr.conf
 create mode 100644 meta-oe/recipes-graphics/ttf-fonts/source-han-sans-kr-fonts_1.004.bb
 create mode 100644 meta-oe/recipes-graphics/ttf-fonts/source-han-sans-tw-fonts/44-source-han-sans-tw.conf
 create mode 100644 meta-oe/recipes-graphics/ttf-fonts/source-han-sans-tw-fonts_1.004.bb

-- 
2.5.0


