Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8C1CF78855
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Jan 2018 03:24:42 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id p1so1458326pfh.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jan 2018 19:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=/opZ0NR30TSSluxKgvlffo2OKEa/daNsXyvseFGwz58=;
	b=fnfjc3LKIHLHF0uJWmfXMoOOrXj9k5HVrYqhRmTfrLmgGkbpOzidOW1Y4ft3czdWjC
	c5wZHlXkXBLfSfTLde2Yi9sv6SAJPy7cgK2sHZY4o5LjrkRa0BaFMnh/b+DfH9VDqZNN
	tZQ+EVKtuiBFQ+ypQYXfYfhCyshudNlIzu3MWgnd+bmI2JbQI83b2kFtoFqdjlWAXoc9
	0aNv7bFRFnOBBgVJWMSz0PbDnTroMImiSks7HEV7w4wuyJeK+JzKevojqmd9hwsqqV3R
	dEFE5z3rctk5HMxB/81JoEdkNl99e3WmqAOw3ynjyA97blQC9K4AvkyRq6dDHUQ4wYLL
	ll/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=/opZ0NR30TSSluxKgvlffo2OKEa/daNsXyvseFGwz58=;
	b=m9+cXOru3Qndcx1zmbMwbegD/Iow5Plp8xcEep0yDPER66NQZOvMqHOSbfd+Vbi9cu
	D6oimX0rydeQsxm+XNlAywjSmSyUqxwtGCQ8zFt6s7e7tH3DOKFHYSBZwW2tjCImVRA+
	mTpWmXy2TqemAxfW952pu06MfXf90qAjGfRAG8I6vh1SS6SJp0vi5RBzN3rY4e19ScFq
	ycxg09Kzr7o8h3oEZ4c4ll7qyNwicR8TNFHY7khDRnUPGjF9o5Sz3gefFE6iaHfhaVSU
	GEmj+WT/AzBtf/ddxQqIE47ZUaem8Y6KLlYEdUH7hpV9tpLX0aDmkF9anTnN3UVbogmM
	L1Jg==
X-Gm-Message-State: AKwxytezRpXsX6/IgaeDvntVxJw63QbM0HQUfmM+sFGo8ZSX2FEnCt2B
	8aV0Zk/UH7jMyGBRFmjXi2AYmg==
X-Google-Smtp-Source: AH8x226jqfvn5xLP6Wr3JWpLe1EMH9OiCi//sk3fBQ8I5v5borWWClAe+R/78aGbMyUwdbykVnbwzg==
X-Received: by 10.98.7.73 with SMTP id b70mr20538097pfd.39.1517023484246;
	Fri, 26 Jan 2018 19:24:44 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:2999:2a82:b9b6:e74c])
	by smtp.gmail.com with ESMTPSA id
	v22sm6692206pfa.158.2018.01.26.19.24.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 Jan 2018 19:24:43 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-devel@lists.openembedded.org
Date: Fri, 26 Jan 2018 19:24:03 -0800
Message-Id: <80985a36504d808dfe1ad548042687af007f2f50.1517023286.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1517023286.git.akuster808@gmail.com>
References: <cover.1517023286.git.akuster808@gmail.com>
Subject: [PATCH 03/36] libpwquality: fix Nothing RPROVIDES 'lib32-python3-libpwquality'
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
X-List-Received-Date: Sat, 27 Jan 2018 03:24:42 -0000

From: Hongxu Jia <hongxu.jia@windriver.com>

While multilib enabled, if other recipe RDEPENDS python3-libpwquality,
it failed with:
...
ERROR: Nothing RPROVIDES 'lib32-python3-libpwquality'
...

Do not use python3-${PN} could fix the issue.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
(cherry picked from commit 3c73befc036fed4506c9bb8adc6c615dd2d2999c)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-extended/libpwquality/libpwquality_1.4.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.0.bb b/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.0.bb
index daf6604..2c96063 100644
--- a/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.0.bb
+++ b/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.0.bb
@@ -15,7 +15,7 @@ SRC_URI[sha256sum] = "1de6ff046cf2172d265a2cb6f8da439d894f3e4e8157b056c515515232
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 DEPENDS = "cracklib virtual/gettext python3"
-RDEPENDS_python3-${PN} = "${PN}"
+RDEPENDS_python3-libpwquality = "${PN}"
 
 inherit autotools python3native gettext
 
@@ -36,7 +36,7 @@ EXTRA_OECONF += "--with-python-rev=${PYTHON_BASEVERSION} \
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
 PACKAGECONFIG[pam] = "--enable-pam, --disable-pam, libpam"
 
-PACKAGES += "python3-${PN} python3-${PN}-dbg"
+PACKAGES += "python3-libpwquality python3-libpwquality-dbg"
 FILES_${PN} += "${libdir}/security/pam_pwquality.so"
 FILES_${PN}-dbg += "${libdir}/security/.debug"
 FILES_${PN}-staticdev += "${libdir}/security/pam_pwquality.a"
-- 
2.7.4


