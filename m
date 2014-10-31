Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-ie0-f182.google.com (mail-ie0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 7388260557
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Oct 2014 10:14:01 +0000 (UTC)
Received: by mail-ie0-f182.google.com with SMTP id rd18so913635iec.41
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Oct 2014 03:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=MTZV8Lo4oqc+HCfH3K+Lp74kUNBie2dZizCuLvNlXgY=;
	b=VwjaZCQZ8O8vPanM1pEYKnW1PcjZXRzLCf28FpdHRoDpmNztvqMjWbnrFCR/Iu+UFL
	aiv3/F9F20unVEFA4h3gCt7s8kTmAOj80meKtR0ZCL78tz3MonsuGE/J32JhuJHR4qcz
	IxvDBFVNxdLoTPWy6DYK9re+G9paZtKrWnBM3QKVYy+ylgvaxW5py8hwJxYM/i9NF6Mz
	x/mFfu/z59X67xBNkJy1NRFB4Ng+eyLkryZv7gSMSe1T/Erm2J6hBjFwfgJHbGll2csq
	mLfz4yZXmZev5nFINWvB03cXgQ3qXjZamxWmWnu8/UQhp9Tb9xJPw18ExWZdEF/G3u/j
	kCDQ==
MIME-Version: 1.0
X-Received: by 10.107.6.7 with SMTP id 7mr27178560iog.38.1414750442082; Fri,
	31 Oct 2014 03:14:02 -0700 (PDT)
Received: by 10.107.148.76 with HTTP; Fri, 31 Oct 2014 03:14:02 -0700 (PDT)
Date: Fri, 31 Oct 2014 11:14:02 +0100
Message-ID: <CAD0=qkKGx8o9xAf14G1NOXxD5QzKXKJBqfCXDBgc8saTfrW_zQ@mail.gmail.com>
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Yocto 1.7 building alsa-lib do_package fails
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
X-List-Received-Date: Fri, 31 Oct 2014 10:14:02 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

When I try to build alsa-lib on master branch of oe-core I get the
following error:

ERROR: Function failed: opkg-build execution failed
ERROR: Logfile of failure stored in:
/media/bitbakeTmp/angstrom-dizzy/build/tmp-angstrom_v2014_12-glibc/work/-angstrom-linux-gnueabi/alsa-lib/1.0.28-r0/temp/log.do_package_write_ipk.29979
Log data follows:
| DEBUG: Executing python function sstate_task_prefunc
| DEBUG: Python function sstate_task_prefunc finished
| DEBUG: Executing python function do_package_write_ipk
| DEBUG: Executing python function read_subpackage_metadata
| DEBUG: Python function read_subpackage_metadata finished
| DEBUG: Executing python function do_package_ipk
| *** Error: CONTROL/control is missing field Architecture
|
| opkg-build: Please fix the above errors and try again.
| DEBUG: Python function do_package_ipk finished
| DEBUG: Python function do_package_write_ipk finished
| ERROR: Function failed: opkg-build execution failed
ERROR: Task 1625
(/media/bitbakeTmp/angstrom-dizzy/sources/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.0.28.bb,
do_package_write_ipk) failed with exit code '1'
NOTE: Tasks Summary: Attempted 2214 tasks of which 15 didn't need to
be rerun and 1 failed.


I'm using Angstrom setup-scripts on branch angstrom-v2014.12-yocto1.7

Can anybody give me an advice where to look for the source of the problem?

Regards,
Sven

