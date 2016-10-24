Return-Path: <philip.balister@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3650B70100
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Oct 2016 19:21:51 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id z190so13828337qkc.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Oct 2016 12:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=cyqOdNvXDInuWh1jCjqBVIKYgPA/L7ptEDlKnz53pBk=;
	b=heQ5xntpaYcj8BsGfMKkIZ9MNICUqE9PfI6fc2BxKs9kYfk6mvSbhLU8u6nwcdq839
	c8V2TEvOXpQ7pJaWf+EfdQ9UFtBinqj5kHEmsWZ6Pv1Yv2hbrNiatrWplqSYWGKfn24I
	j4ymUqILNtkVMF4czvB+3nrFy1/IG9P2mvTCvyH5IC3SxeSYuGm23tO0eJiXrsFxv3co
	l46I+qOeiLuT0wicSOVqoWGNRKOYSUSnqnzon+tSL7s5iYC/uFcnmCn8Va4xJnXMyDsa
	bj/jH9iG1r+RQ2kbU3aoBhuF67vkH7n+c87XKaOG1o4x45ysACsX0SpvVwy0bgq/CvRS
	uIyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=cyqOdNvXDInuWh1jCjqBVIKYgPA/L7ptEDlKnz53pBk=;
	b=aoMNQseEXQlTsJzXLCGo+HX+RKmS2lfNYBLn1zY/rH+lpbP6hEJ49rl6buLpbrfQwy
	pC/Ljhc3AlPBMq8L8t/YdGHRDLwCmTcwcs4lXiNZAvsOOg6wW0n0j4wXjFYDd0x7LX4N
	kTTy2JtOPJAE8lIMu4gzPYpySKRFIeJ1fyOcr5Pr8UX69seO1nk4QtZORO+4x9lDzyC+
	0K+indQhVEFlgSWtp4R9bD1H++/BOVoyOEoVpkf0M2DHlsDyovtKC19U0B8gcDAEL/71
	GcqKvx1/48svpurOJ4lTcaO73JUC7bXFrhSi/gw8Ev7BFnZoquifhblsYRP1iFlfhjz9
	/sMQ==
X-Gm-Message-State: ABUngvcbAPv/gYHeVrUUc0AL09pwqW/IL96ATKzo5zSZcqZuL+YADECAwYXHoJ+K3IW+xw==
X-Received: by 10.55.188.193 with SMTP id m184mr15621994qkf.129.1477336912738; 
	Mon, 24 Oct 2016 12:21:52 -0700 (PDT)
Received: from thuvia.localdomain (pool-71-171-14-165.ronkva.east.verizon.net.
	[71.171.14.165])
	by smtp.gmail.com with ESMTPSA id f79sm9170669qke.6.2016.10.24.12.21.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Oct 2016 12:21:52 -0700 (PDT)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Oct 2016 15:21:37 -0400
Message-Id: <1477336897-969-1-git-send-email-philip@balister.org>
X-Mailer: git-send-email 2.5.5
Subject: [meta-oe][PATCHv2] fftw: Remove the fftw-dev package dependency on non-existent fftw package.
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
X-List-Received-Date: Mon, 24 Oct 2016 19:21:52 -0000

The fftw-dev package RDEPENDS on the fftw package, but the package is not
created. Remove the dependency on fftw so that images using fftw-dev will
build.

Signed-off-by: Philip Balister <philip@balister.org>
---
 meta-oe/recipes-support/fftw/fftw_3.3.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/fftw/fftw_3.3.4.bb b/meta-oe/recipes-support/fftw/fftw_3.3.4.bb
index 0faaea1..e753743 100644
--- a/meta-oe/recipes-support/fftw/fftw_3.3.4.bb
+++ b/meta-oe/recipes-support/fftw/fftw_3.3.4.bb
@@ -69,4 +69,6 @@ FILES_fftwl-wisdom = "${bindir}/fftwl-wisdom"
 FILES_fftwf-wisdom = "${bindir}/fftwf-wisdom"
 FILES_fftw-wisdom-to-conf = "${bindir}/fftw-wisdom-to-conf"
 
+RDEPENDS_${PN}-dev = ""
+
 BBCLASSEXTEND = "native"
-- 
2.5.5


