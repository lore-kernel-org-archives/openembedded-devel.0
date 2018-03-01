Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3F85178836
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Mar 2018 13:36:04 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id a16so2443046pfn.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Mar 2018 05:36:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Hfm6VR+Q2MQ90mbl0E8quz2222geAQhReC369VH7nq8=;
	b=RmKaekorfYJhLCq8iCTAcMICCT2aM2HXHolzn13nYegpA15yngZlJnFRo+15UYk3aA
	HcRwLECx1as+ruIkHqHQR5W811S/f1IFIBVdeSGwVG0nn5UHOI4IqVzQtDiG5SoUXpaX
	Q60bLAdc3Kx62EPga7bQ2uUhB2XCRH0ZcmQsujkqSEwai8Kg78A32bgEkSbsFB3//GIz
	JnKTJYce5G55PEMb+F/W6+xXfshbRxiENi0esBlUwppRkJLn0XBC8oTzv2GoCHKLe+jg
	9d4VqN20G8Yb53mJyKOg/E8EpcvP6tHuJqpGPL3/dIgLyKghAkDcEXCPy+0Er1SSdKXf
	fq6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Hfm6VR+Q2MQ90mbl0E8quz2222geAQhReC369VH7nq8=;
	b=V5es4QoFyJgmGCyrMpLRHAuMtvWUsVFrvLW6ZgRth+79x/X+zWBbj/SaHx8fW+RUSu
	AsyMLn4DJ3jup3ccpdVJKuV+L3zLVCvAeX9TOZmbkWwI2V8/pm0GKASMkXtRGxheHjAI
	/bFWrX+MDYNmfcmd46vd5Fj6R3mIyRvowUGyPEImiyvefg6YCblUCCYN+jwELXlQJ1I8
	MfnbQNoEKZ+otZh2ZIGY9B3DgR008hG1AUoHbIqXHpD+lzVw33P46LH6sZ3e//yPwry4
	t9U8krCJAa2qAtiwqWdnsEkeciMcL/ytUfRD9d0dFR8QGbtrk7Jk0dDVZ2bRjryw5XSV
	Muew==
X-Gm-Message-State: APf1xPCrWSiyZ5er0fDQcLYUI6tC+ZHI20UFey5h4Ey3EYRIsP+HBjW4
	bZ9GYTG/6Z9D+KNrhQEkZXvXpeJ2
X-Google-Smtp-Source: AG47ELuF/dtuJhU8TIyUrbFlgYYuo2bHzcfJ7e/4WIxRkQYHl+ppNzKoG2pZOFNSnsM6Jqj1FcsP+w==
X-Received: by 10.101.89.74 with SMTP id g10mr1565356pgu.415.1519911366399;
	Thu, 01 Mar 2018 05:36:06 -0800 (PST)
Received: from jkrishnanjanappa-desktop.mvista.com ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id
	b6sm9853743pfm.160.2018.03.01.05.36.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 01 Mar 2018 05:36:05 -0800 (PST)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Mar 2018 19:05:52 +0530
Message-Id: <1519911354-18140-3-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1519911354-18140-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1519911354-18140-1-git-send-email-jkrishnanjanappa@mvista.com>
MIME-Version: 1.0
Subject: [meta-openwrt][PATCH 3/5] ustream-ssl: replace hardcoded 'lib' string to generic value
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
X-List-Received-Date: Thu, 01 Mar 2018 13:36:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

If libdir is other than /usr/lib/, then ustream-ssl fails with below
error in do_install task:

-- snip --
| mv: cannot stat ‘.../tmp_new2/work/corei7-64-montavista-linux/ustream-ssl/git-r0/image/usr/lib/libustream-ssl.so’: No such file or directory
-- snip --

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 recipes-core/ustream-ssl/ustream-ssl_git.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/recipes-core/ustream-ssl/ustream-ssl_git.bb b/recipes-core/ustream-ssl/ustream-ssl_git.bb
index ce46956..fd93e51 100644
--- a/recipes-core/ustream-ssl/ustream-ssl_git.bb
+++ b/recipes-core/ustream-ssl/ustream-ssl_git.bb
@@ -21,9 +21,8 @@ do_install_append() {
 	install -d ${D}${includedir}/libubox
 	install -m 0644 ${S}/*.h ${D}${includedir}/libubox
 
-	install -dm 0755 ${D}/lib
-	mv ${D}/usr/lib/libustream-ssl.so ${D}/lib/libustream-ssl.so
-	rmdir ${D}/usr/lib
+	install -dm 0755 ${D}${base_libdir}
+	mv ${D}${libdir}/libustream-ssl.so ${D}${base_libdir}/libustream-ssl.so
 }
 
 FILES_${PN}  += "${base_libdir}/*"
-- 
2.7.4


