Return-Path: <Alex.Gonzalez@digi.com>
X-Greylist: delayed 389 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 26 Dec 2014 17:43:10 UTC
Received: from mail1.bemta12.messagelabs.com (mail1.bemta12.messagelabs.com
	[216.82.251.5])
	by mail.openembedded.org (Postfix) with ESMTP id 8921772644
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Dec 2014 17:43:10 +0000 (UTC)
Received: from [216.82.249.147] by server-5.bemta-12.messagelabs.com id
	18/9E-03158-9AC9D945; Fri, 26 Dec 2014 17:36:41 +0000
X-Env-Sender: Alex.Gonzalez@digi.com
X-Msg-Ref: server-10.tower-29.messagelabs.com!1419615401!34102716!1
X-Originating-IP: [66.77.174.14]
X-StarScan-Received: 
X-StarScan-Version: 6.12.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5814 invoked from network); 26 Dec 2014 17:36:41 -0000
Received: from mail.mx4.digi.com (HELO mcl-sms-ns2.DIGI.COM) (66.77.174.14)
	by server-10.tower-29.messagelabs.com with RC4-SHA encrypted SMTP;
	26 Dec 2014 17:36:41 -0000
Received: from MTK-SMS-XCH02.digi.com (10.10.8.196) by mail.mx2.digi.com
	(172.16.1.14) with Microsoft SMTP Server (TLS) id 8.3.389.2;
	Fri, 26 Dec 2014 11:36:24 -0600
Received: from DOR-SMS-XCH01.digi.com (10.49.8.99) by MTK-SMS-XCH02.digi.com
	(10.10.8.196) with Microsoft SMTP Server (TLS) id 14.3.210.2;
	Fri, 26 Dec 2014 11:36:40 -0600
Received: from log-linux-hp-agonzal.digi.com (10.101.2.169) by
	dor-sms-xch01.digi.com (10.49.8.99) with Microsoft SMTP Server (TLS) id
	14.3.210.2; Fri, 26 Dec 2014 18:36:38 +0100
From: Alex Gonzalez <alex.gonzalez@digi.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 26 Dec 2014 18:36:25 +0100
Message-ID: <1419615386-27100-1-git-send-email-alex.gonzalez@digi.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.101.2.169]
X-KSE-AntiSpam-Interceptor-Info: protection disabled
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean
Subject: [openembedded-devel][meta-java][PATCH] Fix openjdk-7 build for daisy
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
X-List-Received-Date: Fri, 26 Dec 2014 17:43:13 -0000
Content-Type: text/plain

Building openjdk-7 with daisy fails with the following error:

| DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common', 'common-linux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi', 'common']
| DEBUG: Executing shell function do_install
| cp: cannot stat '/opt/yocto/fsl-community-bsp/wandboard-quad-openjdk-daisy/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/openjdk-7-jre/25b30-2.3.12-r5.1/
build/openjdk.build/j2sdk-image': No such file or directory
| WARNING: /opt/yocto/fsl-community-bsp/wandboard-quad-openjdk-daisy/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/openjdk-7-jre/25b30-2.3.12-r5.1/temp/run
.do_install.32726:1 exit 1 from
|   cp -R /opt/yocto/fsl-community-bsp/wandboard-quad-openjdk-daisy/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/openjdk-7-jre/25b30-2.3.12-r5.1/build/ope
njdk.build/j2sdk-image /opt/yocto/fsl-community-bsp/wandboard-quad-openjdk-daisy/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/openjdk-7-jre/25b30-2.3.12-r
5.1/image/usr/lib/jvm/java-7-openjdk
| ERROR: Function failed: do_install (log file is located at /opt/yocto/fsl-community-bsp/wandboard-quad-openjdk-daisy/tmp/work/cortexa9hf-vfp-neon-poky-linu
x-gnueabi/openjdk-7-jre/25b30-2.3.12-r5.1/temp/log.do_install.32726)

This commit from the https://github.com/woglinde/meta-java pull request list fixes it.

Max Krummenacher (1):
  openjdk: fix do_install for out of source builds

 recipes-core/openjdk/openjdk-6-common.inc | 2 +-
 recipes-core/openjdk/openjdk-7-common.inc | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)


