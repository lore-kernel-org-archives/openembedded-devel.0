Return-Path: <b.hutchman@gmail.com>
Received: from mail-ea0-f176.google.com (mail-ea0-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id 7BE5F6D4B7
	for <Openembedded-devel@lists.openembedded.org>;
	Mon,  4 Nov 2013 21:09:21 +0000 (UTC)
Received: by mail-ea0-f176.google.com with SMTP id m14so511655eaj.7
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 04 Nov 2013 13:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=Jbg2vmmcv9lElrB/P3kc67shtUbuNK9tyGdykwPYJAc=;
	b=0KHoPy0YlwWQKbsl0flvgPXgNLzf1QzFn9b9xTzeBoQpa5xcTlwJLXYrZYoQeZ5NV0
	yoDxruafFTIMibUZfLFFeJ81BfyQBvnker/L7phBpB7nKHAFET0OFwop7UHypvPWj8GY
	4KXpaTb6hTbxiTjdGfAB9nIXGGuiKUUJefCPLcC1gzbJ+U77G6VUj/cOUvFjk6/EPh/y
	jgUztIWFasNz3+y8+dHYLIY3j/2vUAV52yh5omMsENIOeIaPoOMgy0IkWYM6meUPInrH
	/mOxvjofbJsBpWLARsAdob2nOKX143arFbw6vpKSxRVslmqMlzyzdEo0qq+uKHjCYmTl
	QVSA==
MIME-Version: 1.0
X-Received: by 10.14.3.9 with SMTP id 9mr6864150eeg.72.1383599362523; Mon, 04
	Nov 2013 13:09:22 -0800 (PST)
Received: by 10.223.170.195 with HTTP; Mon, 4 Nov 2013 13:09:22 -0800 (PST)
Date: Mon, 4 Nov 2013 16:09:22 -0500
Message-ID: <CAFZh4h9pmB59YS7wRKD1ubui2_yf1Hjg5NgtW-nDr9eC8im1dA@mail.gmail.com>
From: Brian Hutchinson <b.hutchman@gmail.com>
To: Openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Still getting gd-2.0.36RC1.tar.gz errors in meta-oe/recipes-support/gd/gd_2.0.35+2.0.36rc1.bb
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
X-List-Received-Date: Mon, 04 Nov 2013 21:09:21 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

This has been going on for the last month or two.  Apparently this upstream
project name changed and it no longer available at the URL.  I looked into
it several weeks ago but it didn't look like a simple URL path fix as it
looked like other stuff depends on it.  I've been coping the file from an
earlier build to my downloads directory to get my builds to complete.

Regards,

Brian

Loading cache: 100%
|####################################################################################################################################################|
ETA:  00:00:00
Loaded 1877 entries from dependency cache.
Parsing recipes: 100%
|##################################################################################################################################################|
Time: 00:00:00
Parsing of 1471 .bb files complete (1470 cached, 1 parsed). 1876 targets,
96 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies
NOTE: multiple providers are available for jpeg (jpeg, libjpeg-turbo)
NOTE: consider defining a PREFERRED_PROVIDER entry to match jpeg

Build Configuration:
BB_VERSION        = "1.21.0"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "Debian-7.1"
TARGET_SYS        = "arm-oe-linux-gnueabi"
MACHINE           = "am180x-evm"
DISTRO_VERSION    = "oe-core.0"
TUNE_FEATURES     = "armv5 thumb dsp"
TARGET_FPU        = "soft"
toolchain-layer
meta-oe
meta-multimedia
meta-networking
meta-webserver    = "master:4d62e7f575e2a87197c74ab4639561b45eec0e60"
meta-ti           = "master:15243e8ec3ce0652f7ddb7542df022306f40d888"
meta              = "master:0636093711547957a8f5b25322bd3e0da367cfc4"

NOTE: Preparing runqueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
WARNING: Failed to fetch URL
http://www.libgd.org/releases/gd-2.0.36RC1.tar.gz, attempting MIRRORS if
available
ERROR: Fetcher failure: Fetch command failed with exit code 8, output:
http://libgd.bitbucket.org/releases/gd-2.0.36RC1.tar.gz:
2013-11-04 15:43:25 ERROR 404: NOT FOUND.

ERROR: Function failed: Fetcher failure for URL: '
http://www.libgd.org/releases/gd-2.0.36RC1.tar.gz'. Unable to fetch URL
from any source.
ERROR: Logfile of failure stored in:
/home/hutch/arago_11_1_2013/tisdk/build/arago-tmp-eglibc/work/armv5te-oe-linux-gnueabi/gd/2.0.35+2.0.36rc1-r5/temp/log.do_fetch.32535
ERROR: Task 1136
(/home/hutch/arago_11_1_2013/tisdk/sources/meta-openembedded/meta-oe/recipes-support/gd/gd_2.0.35+
2.0.36rc1.bb, do_fetch) failed with exit code '1'
NOTE: Tasks Summary: Attempted 1581 tasks of which 1119 didn't need to be
rerun and 1 failed.
Waiting for 0 running tasks to finish:

Summary: 1 task failed:

/home/hutch/arago_11_1_2013/tisdk/sources/meta-openembedded/meta-oe/recipes-support/gd/gd_2.0.35+
2.0.36rc1.bb, do_fetch
Summary: There was 1 WARNING message shown.
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.

