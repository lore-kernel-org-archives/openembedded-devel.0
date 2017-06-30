Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8303660721
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jun 2017 12:07:42 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id p204so7639219wmg.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jun 2017 05:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=tv9z0R4uG8UfAGoihyIZKsirLMGEKHDW5vR2D6glDGg=;
	b=Y20eJBZzMBz+V1mhEKW1bXWLsaHdnSbt51joWgnckFULYKJFsl5aTWLMqenU4Zq1E6
	3+CvW9JxfLHtHTP14ItSqp+YfIM4HAmN+yU4W0MKpo5quYyZHDDyinoVV6Rgb426xYEE
	ZE5YWTuW+cjvlINvVJvE0Ai+6U0LChbDJQ7Z4vvjhdjXVS3ftJpDUM1skC4cE1JSeZtP
	RFqFdtnK5WUxmmgR8gVV7NVY43hWB2d7UTsmU/Rl+0gBXNlb79x2RZrXWT5eWKMKfuAb
	Dun8d1SdmZBTRIHp5AdoU5VplUBdLgHweSIybW7Y7fZCU6qdVGkrVV8VEURa4fxBCW/j
	GAMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=tv9z0R4uG8UfAGoihyIZKsirLMGEKHDW5vR2D6glDGg=;
	b=N5znfGM84ylFmsbQzCjPoXSFzXTn7DU02Cp2EFvMaiVdCs2+bX/4wcJsB/WPKc0gzz
	+NduRlHI5M/ZuIW9i0TXdkQ26evbg2XUrbLxiWpKSfwfYbc25LSEn+xzDb1zKoCXgE0n
	aFR/mOVnS9xeAlxwq0caJkxg+poeCD8VUrk5x/LIfrtq6xZYARsp+BQ430rVqwCLozEV
	cus/0QYJkV3Ws9E0m4sYu7ThJlK2bZEXdNycj7gKzh+Yp4RvwYob4764x57RHb6ajce6
	UBgSFMBiFDTYjsdSKHIb5PiLMLi2bN/9XweSqOTugEGBeXusJRPVM0Sb7U+QIx470kmT
	l0bw==
X-Gm-Message-State: AKS2vOzZuRA3ZIRe0GJ/RoHLXtyXyfnpxC6Mvhx58D1ms9yPpy87ulWE
	VogV3aFkxyG0Nnpq
X-Received: by 10.28.127.21 with SMTP id a21mr14072862wmd.18.1498824462678;
	Fri, 30 Jun 2017 05:07:42 -0700 (PDT)
Received: from mueller-a-nb-linux.zera.local
	(ip-109-91-251-134.hsi12.unitymediagroup.de. [109.91.251.134])
	by smtp.googlemail.com with ESMTPSA id
	d91sm14159496wma.7.2017.06.30.05.07.41
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Jun 2017 05:07:41 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Jun 2017 14:07:28 +0200
Message-Id: <20170630120731.3745-1-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.4
MIME-Version: 1.0
Subject: [PATCH 0/3] gimp related updates
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
X-List-Received-Date: Fri, 30 Jun 2017 12:07:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It started with gegl failing with gcc 7.1...

Andreas Müller (3):
  babl: update 0.1.16 -> 0.1.26
  gegl: update 0.3.4 -> 0.3.16
  gimp: update 2.8.20 to 2.8.22

 meta-oe/recipes-graphics/babl/{babl_0.1.16.bb => babl_0.1.26.bb} | 4 ++--
 meta-oe/recipes-graphics/gegl/{gegl_0.3.4.bb => gegl_0.3.16.bb}  | 4 ++--
 meta-oe/recipes-graphics/gimp/{gimp_2.8.20.bb => gimp_2.8.22.bb} | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)
 rename meta-oe/recipes-graphics/babl/{babl_0.1.16.bb => babl_0.1.26.bb} (72%)
 rename meta-oe/recipes-graphics/gegl/{gegl_0.3.4.bb => gegl_0.3.16.bb} (91%)
 rename meta-oe/recipes-graphics/gimp/{gimp_2.8.20.bb => gimp_2.8.22.bb} (89%)

-- 
2.9.4


