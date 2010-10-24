Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1P9wRX-0004zb-GQ
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 Oct 2010 11:00:47 +0200
Received: by qyk33 with SMTP id 33so642342qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Oct 2010 02:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=e09vVIed/v2QbOfcW8VX05/wveT7WZhPwlc+115rGtU=;
	b=YtJBSyxl98vfndWxUqKyI+orveDbgeeD81Av49voi72CbTpwziixBgJ/xNXxBMr0f4
	W86i5EbCHwDHwMh9Cu7bPQdZxhZAbFew0tN/7iYq2FHoN9N5IsizYFZ4qui9A0iXNwst
	tXIKHyiynMBgjRtBHvwzZUPzy/WbnP9njhlGg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=gRMRdPH5x203OaZzmF10KF30YqFYePY4JsyOtkcs3GqeIwPygVKVDaHE3q1fE50xzw
	8jyFu1Dv0j1k9ttCdbD+LR+CgIWOwE8psHGsj1AYseoQwg1gGQJnJXSl+oZYRkGphusO
	Dnq3f1awdQdVcoZ+rec9oxFHIIIKeIk0fAKn4=
MIME-Version: 1.0
Received: by 10.229.65.25 with SMTP id g25mr4855648qci.196.1287910797638; Sun,
	24 Oct 2010 01:59:57 -0700 (PDT)
Received: by 10.229.247.140 with HTTP; Sun, 24 Oct 2010 01:59:57 -0700 (PDT)
Date: Sun, 24 Oct 2010 10:59:57 +0200
Message-ID: <AANLkTinXYcNN=iozP-aXPDuFzQqM13KDf5my1W6DTap6@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.182
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Race issues (lzma-native)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 24 Oct 2010 09:00:47 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

during first build of console image I notice a strange fault:
subsequent builds are ok.
My scripts builds console-image and opie-image.

ERROR: Task 2411
(virtual:native:/oe/openembedded/recipes/lzma/lzma_4.65.bb,
do_distribute_sources) failed with exit code '1'
NOTE: Unpacking ../sources/lzma465.tar.bz2 to
tmp/work/i686-linux/lzma-native-4.65-r4.1/
NOTE: package lzma-native-4.65-r4.1: task do_distribute_sources: Started
NOTE: package lzma-native-4.65-r4.1: task SRC_DISTRIBUTECOMMAND: Failed
ERROR: Function 'SRC_DISTRIBUTECOMMAND' failed


Looking at the
run.SRC_DISTRIBUTECOMMAND.18268   16384 (failing)
run.SRC_DISTRIBUTECOMMAND.9570     34334

it looks like the file is not complete / malformed:

package_generate_ipkg_conf() {
<------>mkdir -p /oe/build/tmp/sysroots/i686-linux/etc/
<------>echo "src oe file:/oe/build/tmp/deploy/glibc/ipk" >
/oe/build/tmp/sysroots/i686-linux/etc/opkg.conf
<------>echo "src oe file:/
EOF

run.do_distribute_sources.18268  is empty, while second time
run.do_distribute_sources.9570   1051 contains  def do_distribute_sources(d):

This seems indeed a race issue...

Andrea


