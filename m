Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
	[209.85.128.46])
	by mail.openembedded.org (Postfix) with ESMTP id D897D79C7C
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Oct 2019 09:34:16 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id g24so4606914wmh.5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Oct 2019 02:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=PQght2S/0t5QyUACfEIGxOcGzqQVrAf4GZmhIgP9AZI=;
	b=J6Gp1rAXM3JxYYAfcGBu+pBVnNe4GDbTVOWlYuWAYA6eESLUQ9pIkDmmmseK8cKbVQ
	3glzM5D34HlH3LjIqOAwl0C1lso8iUEWDEwAEI8381habZ2HBaD7EwEwIOvc4E5LaXqS
	OwrqGKFqWozmsccaKfgSpUsxWkE/ahIdHpkbLZTZsHDFRPWHPhXlp7MWhHcPkrtDdEGb
	aljsNAXyH52Q4Pmjl5rysnzQyH2sVEU4uCpP+NXi7PbUNSMcLvPxTOXyREbOTVEl1D9E
	50CfwyHFPWmnvLfRDDXUizp5o2n79zswiKvutCOpFBPQU/FFdmDF//biBR/hqtvMeADI
	om/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=PQght2S/0t5QyUACfEIGxOcGzqQVrAf4GZmhIgP9AZI=;
	b=FAR1vN9Zq90VJDe1+YhwWclZI991r4jc354jIjxUueL04c3hq1Qr1PTPgoK02Nqjh2
	rTsBcoQy8A0bfkcLHgCM9PJqdopvm+FUzNBVSqOnuRC7v5nhkBxox26jm4OegbdjMFM6
	FvyW4Z2nbm2em7sOgVK+P4boNle+kOqlMS/k5P3zqCsZ6x1wYSfNsw5q9IHvkEO5vGvv
	eQaMMOlSCRlg0q+2aFeHl3fTO1us+p30hVaUCWaHuOGO8w/lqY5Ncz4kO+SX7XMDl1d6
	gjcfJbCNXQYgnufFgz9b3w0TjYSGPqQd7zKyud8FE99u7seV0ExXF42N1zOutrRx7obH
	5g/A==
X-Gm-Message-State: APjAAAVBG5NwWyiSnzWQEWZ2w9nul18+I6VmMY0ErujaXdcyHOWc9LBU
	kJdFN8xmPS4guaMJeTdzbvFUXLt8
X-Google-Smtp-Source: APXvYqxnYMwJtgM32GZbkamzDJz4KTN9Vy1zzYKyauTMQ5W3hDu2jHWPBWENZMQNh50nBLNiw9Mglg==
X-Received: by 2002:a7b:c1d1:: with SMTP id a17mr6674040wmj.74.1572082457324; 
	Sat, 26 Oct 2019 02:34:17 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F3206021D85A12E97BB69DE.dip0.t-ipconnect.de.
	[2003:f0:7f32:602:1d85:a12e:97bb:69de])
	by smtp.gmail.com with ESMTPSA id
	w15sm6281482wro.65.2019.10.26.02.34.14
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 26 Oct 2019 02:34:16 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 Oct 2019 11:34:01 +0200
Message-Id: <20191026093404.19659-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH 0/2] More than zenity prettification
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
X-List-Received-Date: Sat, 26 Oct 2019 09:34:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

After zenity pret(t)ification was more a laughing matter I looked into the
recipe some more (created V1 patch month ago) and decided: Now that we have all
yelp-recipes required to build gnome help, go public with gnome-help.bbclass
and let zenity be the first consumer.

Andreas Müller (2):
  gnome-help.bbclass: Handle gnome-help files with new distro feature
    'helpfiles'
  zenity: rework recipe

 meta-gnome/classes/gnome-help.bbclass         | 69 +++++++++++++++++++
 meta-gnome/conf/layer.conf                    |  3 +
 .../0001-build-don-t-generate-manual.patch    | 50 --------------
 .../recipes-gnome/zenity/zenity_3.32.0.bb     | 14 ++--
 4 files changed, 79 insertions(+), 57 deletions(-)
 create mode 100644 meta-gnome/classes/gnome-help.bbclass
 delete mode 100644 meta-gnome/recipes-gnome/zenity/zenity/0001-build-don-t-generate-manual.patch

-- 
2.21.0


