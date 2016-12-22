Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wj0-f196.google.com (mail-wj0-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id DBF567768B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Dec 2016 22:34:02 +0000 (UTC)
Received: by mail-wj0-f196.google.com with SMTP id kp2so38044172wjc.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Dec 2016 14:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=pDk1O01FmFzLgKxEnNNEL5VzMojmMwNDD4897/v3DjU=;
	b=ISc7bNdc01v+4It6o+YIevfc4mizTqLHu8FtOsORHV0ww+g+mDaZmnxiiPE4YTcR7P
	rqP43FLvHFBN0YID3O8m+F9r6OKgGxOPGgwMAW+XAQzrQwfz0Cwym+mcy8b+vdVkPyKV
	0xTkYQlMw98YckgfZfhJZytqZINNYVNDS1vzkRJ6Q5sFutQsLh/K5lB+B1i72YO8myit
	y/qkhFzsIkfeJuDQNCxj/aqG5sp96cW89/QOIRE0TWsfNxog2OHJZC63pS2EUFrYyoup
	zOQ9bHhxGwXL+hgQ3ZKiA1eHjeyhKxo3VeH+DPj/GboC4wWtnZPsQxY40dOn6DCvk8oF
	y0FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=pDk1O01FmFzLgKxEnNNEL5VzMojmMwNDD4897/v3DjU=;
	b=qgvurBRKVmKKVXAZ+GlhxfmFDIZUoW41lmK7y91nbdagpCMR/AOjRyOruiRh7xSv95
	0ommERnZXtt3ec6JQjJeThJa7O4uERvugaZrx154UpjbBrRyDLcEqy1tgJinLUUXLDPr
	zshLL5ZgtoHhaxj23kYeIxFfSsM4Vf8vo/At3olZcE7fz+KJabtWazisvvOJifcc60Ii
	sWpUJH5bQLTuRngNIJNTBpKEk0VNa/vFRtTkRQrsk0jac0hQNeoDDiFrLyMXg87V/5XA
	S8CU+82lY9fApkCS6ZDNID/vRjN675KuU3LdJcUGf9YgpD60a4AiXLDp9gxaZxfHTJN1
	bL3A==
X-Gm-Message-State: AIkVDXIhV2rFi9jVIwyt6bS5G1lJ2yLjSy+gygx5qQNaTkI6y/YdU3AZ9WYbjqI5BQDzXQ==
X-Received: by 10.194.72.100 with SMTP id c4mr10653865wjv.188.1482446043509;
	Thu, 22 Dec 2016 14:34:03 -0800 (PST)
Received: from localhost.localdomain (p579F7B0D.dip0.t-ipconnect.de.
	[87.159.123.13]) by smtp.googlemail.com with ESMTPSA id
	m145sm34179574wma.3.2016.12.22.14.34.02
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Dec 2016 14:34:02 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Dec 2016 23:33:36 +0100
Message-Id: <1482446018-17187-5-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1482446018-17187-1-git-send-email-schnitzeltony@googlemail.com>
References: <1482446018-17187-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 5/7] mpd: add PACKAGECONFIG for audiofile
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
X-List-Received-Date: Thu, 22 Dec 2016 22:34:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

| WARNING: mpd-0.19.15-r0 do_package_qa: QA Issue: mpd rdepends on audiofile, but it isn't a build dependency, missing audiofile in DEPENDS or PACKAGECONFIG? [build-deps]

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.15.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.15.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.15.bb
index 0fed867..f0b5c88 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.15.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.15.bb
@@ -17,6 +17,7 @@ inherit autotools useradd systemd
 EXTRA_OECONF = "enable_bzip2=yes"
 EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/', '--without-systemdsystemunitdir', d)}"
 
+PACKAGECONFIG[audiofile] = "--enable-audiofile,--disable-audiofile,audiofile"
 PACKAGECONFIG[mad] = "--enable-mad,--disable-mad,libmad"
 PACKAGECONFIG[id3tag] = "--enable-id3,--disable-id3,libid3tag"
 PACKAGECONFIG[lame] = "--enable-lame-encoder,--disable-lame-encoder,lame"
-- 
2.5.5


