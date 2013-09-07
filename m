Return-Path: <lists@philipp-wagner.com>
Received: from turboconrad.planet-school.de (mail.planet-school.de
	[194.116.187.5])
	by mail.openembedded.org (Postfix) with ESMTP id AE97D6186F
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Sep 2013 21:58:05 +0000 (UTC)
Received: from turboconrad.planet-school.de (srv004.service.ps-server.net
	[194.116.186.79])
	by turboconrad.planet-school.de (Postfix) with ESMTP id C82D9B6A09C;
	Sat,  7 Sep 2013 23:58:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	srv004.service.ps-server.net
X-Spam-Level: 
X-Spam-Status: No, score=-101.2 required=5.0 tests=ALL_TRUSTED,AWL,
	LOCAL_USER_RULE autolearn=unavailable version=3.3.2
Received: from poweramy.site (ppp-188-174-85-119.dynamic.mnet-online.de
	[188.174.85.119])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: mail@philipp-wagner.com)
	by turboconrad.planet-school.de (Postfix) with ESMTPSA id 4C7A4B6A095; 
	Sat,  7 Sep 2013 23:58:05 +0200 (CEST)
Message-ID: <522BA139.1020500@philipp-wagner.com>
Date: Sat, 07 Sep 2013 23:57:13 +0200
From: Philipp Wagner <lists@philipp-wagner.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org, joe@deserted.net, 
	schnitzeltony@googlemail.com
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: [meta-networking] ntp: QA errors without systemd
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
X-List-Received-Date: Sat, 07 Sep 2013 21:58:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

I'm using ntp with no systemd and get some QA errors.

ERROR: QA Issue: ntp: Files/directories were installed but not shipped
  /lib
  /usr/lib
  /usr/lib/systemd
  /usr/lib/systemd/ntp-units.d
  /usr/lib/systemd/ntp-units.d/60-ntpd.list
ERROR: QA run found fatal errors. Please consider fixing them.
ERROR: Function failed: do_package_qa
ERROR: Logfile of failure stored in:
/home/philipp/src/poky/build/tmp/work/armv6-vfp-poky-linux-gnueabi/ntp/4.2.6p5-r6.0/temp/log.do_package.1178
ERROR: Task 257
(/home/philipp/src/poky/meta-openembedded/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bb,
do_package) failed with exit code '1'


Obviously the ntp recipe installs some unit files etc. even though
systemd is not used. What's the correct way to solve this? Check for
systemd? Put those files into another recipe?

Philipp

