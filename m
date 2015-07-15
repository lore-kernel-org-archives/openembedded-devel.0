Return-Path: <dominic.sacre@gmx.de>
X-Greylist: delayed 304 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 15 Jul 2015 23:05:46 UTC
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	by mail.openembedded.org (Postfix) with ESMTP id D261475E6A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jul 2015 23:05:46 +0000 (UTC)
Received: from dastp.lan ([37.24.103.185]) by mail.gmx.com (mrgmx001) with
	ESMTPSA (Nemesis) id 0MNqfr-1ZLrJi1w55-007WfL; Thu, 16 Jul 2015 01:00:41
	+0200
From: =?UTF-8?q?Dominic=20Sacr=C3=A9?= <dominic.sacre@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Jul 2015 01:00:19 +0200
Message-Id: <1437001219-5383-1-git-send-email-dominic.sacre@gmx.de>
X-Mailer: git-send-email 2.4.5
MIME-Version: 1.0
X-Provags-ID: V03:K0:uuGbpv/5cbPWuJbap9speOeD5zwZJFd4YIbtioY7DtpegYEgRAJ
	gCtYejUvwD0+6Uh+4wEF5rxIsxg7OdwdTy7Fn3OvlUI6co+Hxs+khAFcHOWZoPcoITQW4P1
	A3VG5MgZ8uumYadKzn7hCCGs7EOhEY+RazQWCd2bpcrv0Gk2hIQ4BkZ1HrJns3OV75AnZqc
	seXmPwnuvZ66oEqwLXGng==
X-UI-Out-Filterresults: notjunk:1;V01:K0:ERDdbf4iwNQ=:Op2jEFmzvvXxgDA7hk+7Mh
	QYVSPPZTOwzKYASHqVuHGiU3GkvSeemRDpSX9oIoV5rhYakDSVhvlMhvgEjw0vPijUSCiZxXN
	7AYOF8AXD9NCn/oBj53Cp1chi0htP8eaJUFq2LLp3bCl5d3GxjMeENxZC4sjVG3cB/moBnG0Y
	HXkLTDhPXwTsUADGb4XN/yI8PR2T4eLjSqND+w+X94mfmkWFsRwgSF2L+7PSGFwQxLVqDcBAI
	kd55bTq33gz+2d+PlKc9o+y3hnpxECYlvfLKspv126uRarccOcOSSViqxnrtOhwQTf0C9ALc/
	mEQdZ0stSQ7a240DlyP3TGEq7fzIaaY3AJzO03X0rLb1ksBO6t8NvlHJ/2cKHlyOS2zZ3UCk8
	0r19fUdqKCWLAN7Qk6uGdCuDK/O03cc/RwWz00H9M1buLy4i9WrCDu8oQ70sb6DCtQOexyH4d
	3wvf8ou4+GSmQOzOPfw53Pj9Xj7d+LfQwa20PEDmNzgm22drk9Zzr010WintTpuqazz4at/SB
	+voqrRiY4RL0A1qY0qXJb6GSqznaoGLSy0IqTeJnKwtiwwQcmLNzi91+JI9gnQ9til9B8btaW
	L3ZmM3xdsrRzsnNFjja4zGUWJfg3wuuTOB+7uSbN6O698Pm5lzzdY6vuarpN4F6G3mYHlonHB
	jaBqUvz5GvaYOaNTnrA/RqV3GLBAVYDrLAVfA6mRzlpewkNgGaYLjrKaYGrKiz+J1+3k=
Subject: [meta-oe][PATCH] fio: re-enable building for ARM
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
X-List-Received-Date: Wed, 15 Jul 2015 23:05:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

fio's use of libnuma/numactl is optional, and the availability of
the library is detected during configure.

This patch allows fio to build for ARM again, by conditionally
removing the dependency on numactl (which does not support ARM).

Signed-off-by: Dominic Sacré <dominic.sacre@gmx.de>
---
 meta-oe/recipes-benchmark/fio/fio_2.2.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-benchmark/fio/fio_2.2.6.bb b/meta-oe/recipes-benchmark/fio/fio_2.2.6.bb
index 82f9cd4..fe41020 100644
--- a/meta-oe/recipes-benchmark/fio/fio_2.2.6.bb
+++ b/meta-oe/recipes-benchmark/fio/fio_2.2.6.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
 DEPENDS = "libaio zlib numactl"
 
 # ARM does not currently support NUMA
-COMPATIBLE_HOST = "^((?!arm).*)$"
+DEPENDS_remove_arm = "numactl"
 
 # rev for v2.2.6
 SRCREV = "f52c9691bc8c285f3445235c69acdfd6de7f9b82"
-- 
2.4.5


