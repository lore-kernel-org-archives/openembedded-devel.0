Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8178370057
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Sep 2016 05:53:03 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id 133so6660393wmq.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Sep 2016 22:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=ScoBDHVWwIB1F5JR7/ZEfTnRUysH8hd5Quvejl5KU+M=;
	b=PoOJoiWd026JeFMlLtT8Geou/M7Q3GP507QE71GHPADLXCRqoEKctTHfArOvXvUL41
	dhvuuQ+FQaAVw7ftKgxwUzdjcpNOTQ8QIt8DTvLDnhTmLbskCtUEbaBxBaJpeC5JCX/y
	qm1+s0+ecae2/2XN31rnMstfLM5IX84QI6w47ro0HbeUStOp0G4maDdV6Fy22JpiSpAq
	eDtjpukIAdMAoL5/QiU4EyzUgtxT2HmDxuja9bESW1JlZKl/3URGnpWj1Nn/T6Q+nWeD
	cX4rwP9ert4ULTO+h+QqGu9AgSV74VoZ8fsfOlh7ROkatJrTOMf46EkPlNNvpQQd6UC3
	zCuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ScoBDHVWwIB1F5JR7/ZEfTnRUysH8hd5Quvejl5KU+M=;
	b=UzlB1l1Lh0nmO3xWjqV8Ec9y4pPtBWS/A0Dry5PKdM8X6AksGEnKqJMGJ7tzLETDnO
	KoRfaqPs3JMs4ySgI0EmuriLY78mS3g44p1cIaAGr7AxbZIFQPJQXbEFttcKdA+in8tl
	DvHitB6dwfDNR/YMNetLHr3a6+jIJ8BPeI52I/uRt1yFxCaHskInDk3xqxL51C4JbDlY
	bVcSwFT4d4393sGJ2+VyTn+92Mfax/hOLAQrZEnJpOqO0VxUtQ/Pmse5Il26CqXNoqsl
	kOrGU4OkK2KmdYknDVXdBNx25VDBp8jz3beyBP1Ad57UJCPk+iQjJnWQYy4J0aLy8MCo
	H/oA==
X-Gm-Message-State: AE9vXwPhfPUNO4ReVBYK+sl5vznB/juudtcLGUi4nXxeZjvJxNxbt6Sjq/PFYK2wtGFw6w==
X-Received: by 10.194.90.104 with SMTP id bv8mr38785037wjb.189.1474437184293; 
	Tue, 20 Sep 2016 22:53:04 -0700 (PDT)
Received: from localhost.localdomain (p4FDF06F5.dip0.t-ipconnect.de.
	[79.223.6.245]) by smtp.googlemail.com with ESMTPSA id
	b128sm30776307wmb.21.2016.09.20.22.53.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Sep 2016 22:53:03 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Sep 2016 07:52:52 +0200
Message-Id: <1474437173-26079-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1474437173-26079-1-git-send-email-schnitzeltony@googlemail.com>
References: <1474437173-26079-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] fftw: fix reconfigure error introduced in previous patch
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
X-List-Received-Date: Wed, 21 Sep 2016 05:53:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

| config.status: executing libtool commands
| mv: cannot move ‘<WORKDIR>/build’ to ‘<WORKDIR>/build-fftw/build’: Directory not empty
| WARNING: <WORKDIR>/temp/run.do_configure.21632:1 exit 1 from 'mv <WORKDIR>/build <WORKDIR>/build-fftw'
| ERROR: Function failed: do_configure (log file is located at <WORKDIR>/temp/log.do_configure.21632)

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-support/fftw/fftw_3.3.4.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/fftw/fftw_3.3.4.bb b/meta-oe/recipes-support/fftw/fftw_3.3.4.bb
index cbcd1b9..a453214 100644
--- a/meta-oe/recipes-support/fftw/fftw_3.3.4.bb
+++ b/meta-oe/recipes-support/fftw/fftw_3.3.4.bb
@@ -16,6 +16,7 @@ EXTRA_OECONF = "--disable-fortran --enable-shared --enable-threads"
 
 do_configure() {
     # configure fftw
+    rm -rf ${WORKDIR}/build-fftw
 	mkdir -p ${B}
     cd ${B}
     # full (re)configure
@@ -23,6 +24,7 @@ do_configure() {
     mv ${B} ${WORKDIR}/build-fftw
 
     # configure fftwl
+    rm -rf ${WORKDIR}/build-fftwl
 	mkdir -p ${B}
     cd ${B}
     # configure only
@@ -30,6 +32,7 @@ do_configure() {
     mv ${B} ${WORKDIR}/build-fftwl 
 
     # configure fftwf
+    rm -rf ${WORKDIR}/build-fftwf
 	mkdir -p ${B}
     cd ${B}
     # configure only
-- 
2.5.5


