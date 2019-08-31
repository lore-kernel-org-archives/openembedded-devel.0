Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
	[209.85.214.179])
	by mail.openembedded.org (Postfix) with ESMTP id 0008E7F50C
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Aug 2019 21:37:40 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id bj8so4900009plb.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Aug 2019 14:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=ZFLJZ6PTyXlXT7zuUb0jLW/5k01pcmhJj0mG993wIj4=;
	b=TZfzoJdcGVTyxcT4mqy+9YYO7zcm29U3QpGtj7CMLWXGYOBfKSAOEzxMZTwRbf+IZb
	VuNxRziwWAu02HV9hxHk6OVcKiMjzocHhL6VX+ZiYMAP7jkbonSC61Ta7ik/OQtstFPb
	cthXAHwYbpB8bsmN9UFuA4DFouvFgJXbT/oS7QtHlQ3f/Qf3qcJFv8xiyigCNF7c/9J2
	Q0JE2jAjREsvOXGSzDL8gy92EjS0ZKq8HNHmSsCy1edH0Q8ZxfjIVcBLrVhItMjTnVYT
	IP4Ku8OS+UzV+XTM45EvaaGZEHowEOle34l+wdxxs1FTRCca7vALEdxsvgBgm2M9g2WS
	oePw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ZFLJZ6PTyXlXT7zuUb0jLW/5k01pcmhJj0mG993wIj4=;
	b=j3GIkRWn8BtYYHSpUmPPWzs5LfFU0/xRVCEfW393gw4PDo9RV96juOLsM4s68LaLHu
	ofu4jTfaItIvUXnrK7N3a6AngSA1NEfOB/Gzm2Es+NIW4sNG6pz/aVSOPibXiL29mfzP
	xt+caw+2ADL13cdaWbqH5p88p09Z4IQL3Qme8JDnY2oULmu7ZGt01v9Q6o87mCkEMyuH
	4dwlhQMMsUAA1zYS+npxWDSa53MOdXlvKZQ6e7Vk/pruc4GFAaArp+gA/bnKl5Q9fMW2
	PhdoUG/eEppQoyfvWc3PvVUz0yIC6VRzF6WL3LaXoCds+cww0VQiUvwhBvO3O/UIiLuc
	wlfw==
X-Gm-Message-State: APjAAAWl1F41vhf1mdIuoup5AArJN/cem0lkj/pZDiP2CWXZ7wUdvs7n
	TCX+nQcUEiD1syBDqrgrP+K48cFo
X-Google-Smtp-Source: APXvYqznv+It9fBDTKMA5HKsToM96tOD9gbc3QA2XNCyre2rvwU6L09Bd2VL9ZkzcbEF6/PnDc3Crg==
X-Received: by 2002:a17:902:183:: with SMTP id
	b3mr22998095plb.210.1567287462055; 
	Sat, 31 Aug 2019 14:37:42 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:8107:6109:754a:f033])
	by smtp.gmail.com with ESMTPSA id d6sm9443836pgf.55.2019.08.31.14.37.41
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 31 Aug 2019 14:37:41 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 31 Aug 2019 14:37:35 -0700
Message-Id: <64985f2526208658406a7ea14a41d0f037f2a07f.1567287402.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1567287402.git.akuster808@gmail.com>
References: <cover.1567287402.git.akuster808@gmail.com>
Subject: [thud 1/4] apache2: set CVE_PRODUCT
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
X-List-Received-Date: Sat, 31 Aug 2019 21:37:41 -0000

From: "Qi.Chen@windriver.com" <Qi.Chen@windriver.com>

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-webserver/recipes-httpd/apache2/apache2_2.4.34.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.34.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.34.bb
index a87e384..80c8b20 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.34.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.34.bb
@@ -31,6 +31,8 @@ S = "${WORKDIR}/httpd-${PV}"
 
 inherit autotools update-rc.d pkgconfig systemd update-alternatives
 
+CVE_PRODUCT = "http_server"
+
 ALTERNATIVE_${PN}-doc = "htpasswd.1"
 ALTERNATIVE_LINK_NAME[htpasswd.1] = "${mandir}/man1/htpasswd.1"
 
-- 
2.7.4


