Return-Path: <adam.yh.lee@gmail.com>
Received: from mail-yk0-f179.google.com (mail-yk0-f179.google.com
	[209.85.160.179])
	by mail.openembedded.org (Postfix) with ESMTP id 623AE6013D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Mar 2015 20:26:26 +0000 (UTC)
Received: by ykcn8 with SMTP id n8so47879745ykc.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Mar 2015 13:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=oBlYmIAt+qLZkzk2ZlMzMN3T7ttjAwDeBlvV3HUvJvw=;
	b=kA12OQPD70SNyhpf5IKMMYaxHTCslUNkbxQK7aWSEEZQM9ECfHll9ZSE3wiwoKWJd5
	aonS7I01MPaLkL1LzuPECmT933pn1i2fS/5lqRZx0cxU/RfZ88efkBWtUJThRDAdqBrl
	tJGE+XUsuml2/ao6uLd/76nH4ZG0HJdmtQA0sTFmcBZf3Vr8Z5bMYB9rFJ2nWJ7LBqWT
	gGCR/OFKVOSI2yn6J+y527rjy31OuBemWqJSs6BprBPWTA5BKwglfiNiiTrjrWvGXgk9
	BqVhcxQ85+3DqUitElXt5l5xARdcUc3xUpbEsotj/KasxoEXPgE3OR2pXeXaf5SO367X
	/wEg==
MIME-Version: 1.0
X-Received: by 10.52.78.35 with SMTP id y3mr15492669vdw.5.1426883187621; Fri,
	20 Mar 2015 13:26:27 -0700 (PDT)
Received: by 10.52.171.11 with HTTP; Fri, 20 Mar 2015 13:26:27 -0700 (PDT)
Date: Fri, 20 Mar 2015 13:26:27 -0700
Message-ID: <CAFeBWL4OG8=Nxw6pj+81JnsAdzUSPacJTM97+N_Cnq1eHrwtbw@mail.gmail.com>
From: Adam Lee <adam.yh.lee@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Reference to sysroot in PHP packages
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
X-List-Received-Date: Fri, 20 Mar 2015 20:26:29 -0000
Content-Type: text/plain; charset=UTF-8

On Yocto 1.7.1, running `bitbake php` will show a QA warning:

WARNING: QA Issue: php requires
/media/Build/master/build/tmp/work/cortexa8hf-vfp-neon-poky-linux-gnueabi/php/5.4.36-r0/image/usr/bin/php,
but no providers in its RDEPENDS [file-rdeps]


Doing a grep for sysroot within the packages-split directory shows a number
of references:

root@pine:/media/Build/master/build/tmp/work/cortexa8hf-vfp-neon-poky-linux-gnueabi/php/5.4.36-r0/packages-split#
grep media/Build/master/build/tmp/sysroots/x86_64-linux -r .

./php-pear/usr/bin/pear:  if test
"/media/Build/master/build/tmp/sysroots/x86_64-linux/usr/bin/php" =
'@'php_bin'@'; then
./php-pear/usr/bin/pear:
 PHP="/media/Build/master/build/tmp/sysroots/x86_64-linux/usr/bin/php"
./php-pear/usr/bin/peardev:  if test
"/media/Build/master/build/tmp/sysroots/x86_64-linux/usr/bin/php" =
'@'php_bin'@'; then
./php-pear/usr/bin/peardev:
 PHP="/media/Build/master/build/tmp/sysroots/x86_64-linux/usr/bin/php"
./php-pear/usr/bin/pecl:  if test
"/media/Build/master/build/tmp/sysroots/x86_64-linux/usr/bin/php" =
'@'php_bin'@'; then
./php-pear/usr/bin/pecl:
 PHP="/media/Build/master/build/tmp/sysroots/x86_64-linux/usr/bin/php"

I believe this problem also results in the failure of populate_sdk task.

