Return-Path: <rcagley@gmail.com>
Received: from mail-yk0-f177.google.com (mail-yk0-f177.google.com
	[209.85.160.177])
	by mail.openembedded.org (Postfix) with ESMTP id C5C9165DFE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Apr 2014 19:56:25 +0000 (UTC)
Received: by mail-yk0-f177.google.com with SMTP id q200so3733047ykb.36
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Apr 2014 12:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=FJf8nNznuZjq4M476Fvxv035YFxzmoBtCofMX1l70D4=;
	b=TO1CNtN8SN0iWtBtSF4Y8Dw/e+dc/KSVcbA5UO9GaGgs2kObZYkF/X1HKeO239u8rV
	7n/R5o9rL1IiiMKlt9vbRtX2YxQ9sjrOMA4zF09r0vbtdWUUPRm9FRFvCT5IRGDwYTiu
	5jtjKYQeUvRrolgf/saeVTBCREcyJx11tCW6G0A0khwBEMtv5BKfR9rWvg8t+haTdujy
	uaQOe6CcbDTta1bpAwS9M+5qe2vMWraZTue/aYQtDHznkAREiLBf2NZovtDyvhSvt605
	wN5apqsAgkvMKK71PlmQwksrjxxyWzAokaWsRe7f7QlniCMj4Ef5gqClD4y1k+JRsL95
	RSqQ==
MIME-Version: 1.0
X-Received: by 10.236.181.4 with SMTP id k4mr5615932yhm.129.1398455786317;
	Fri, 25 Apr 2014 12:56:26 -0700 (PDT)
Received: by 10.170.143.196 with HTTP; Fri, 25 Apr 2014 12:56:26 -0700 (PDT)
Date: Fri, 25 Apr 2014 12:56:26 -0700
Message-ID: <CAN-NoH3n=jjiSUou_drXk1xSD8rrKymWXiERgoHEeyus2LCz+A@mail.gmail.com>
From: Richard Cagley <rcagley@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: v4l-utils won't build
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
X-List-Received-Date: Fri, 25 Apr 2014 19:56:27 -0000
Content-Type: text/plain; charset=UTF-8

After running bitbake core-image-minimal I'm trying to run bitbake opencv
and I get the below. I've looking through the log files and the v4l-utils
recipe. All I can see is that it's unhappy about something to do with the
autotools configuration for the project. Any ideas?

NOTE: Preparing runqueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
ERROR: Function failed: do_configure (log file is located at
/home/rcagley/oe-zed-track/build/tmp-eglibc/work/i586-oe-linux/v4l-utils/0.8.8-r2/temp/log.do_configure.3977)
ERROR: Logfile of failure stored in:
/home/rcagley/oe-zed-track/build/tmp-eglibc/work/i586-oe-linux/v4l-utils/0.8.8-r2/temp/log.do_configure.3977
Log data follows:
| DEBUG: Executing python function sysroot_cleansstate
| DEBUG: Python function sysroot_cleansstate finished
| DEBUG: SITE files ['endian-little', 'bit-32', 'ix86-common',
'common-linux', 'common-glibc', 'i586-linux', 'common']
| DEBUG: Executing shell function autotools_preconfigure
| DEBUG: Shell function autotools_preconfigure finished
| DEBUG: Executing python function autotools_copy_aclocals
| DEBUG: Python function autotools_copy_aclocals finished
| DEBUG: Executing shell function do_configure
| autoreconf: 'configure.ac' or 'configure.in' is required
| WARNING:
/home/rcagley/oe-zed-track/build/tmp-eglibc/work/i586-oe-linux/v4l-utils/0.8.8-r2/temp/run.do_configure.3977:1
exit 1 from
|   autoreconf -vfi
| ERROR: Function failed: do_configure (log file is located at
/home/rcagley/oe-zed-track/build/tmp-eglibc/work/i586-oe-linux/v4l-utils/0.8.8-r2/temp/log.do_configure.3977)
ERROR: Task 385
(/home/rcagley/oe-zed-track/meta-oe/meta-oe/recipes-multimedia/v4l2apps/
v4l-utils_0.8.8.bb, do_configure) failed with exit code '1'
NOTE: Tasks Summary: Attempted 1698 tasks of which 879 didn't need to be
rerun and 1 failed.
Waiting for 0 running tasks to finish:

Summary: 1 task failed:
  /home/rcagley/oe-zed-track/meta-oe/meta-oe/recipes-multimedia/v4l2apps/
v4l-utils_0.8.8.bb, do_configure
Summary: There was 1 ERROR message shown, returning a non-zero exit code.

