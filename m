Received: from [64.233.170.187] (helo=rn-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1Jp80y-0007WM-0e
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Apr 2008 22:25:56 +0200
Received: by rn-out-0910.google.com with SMTP id e28so1930689rng.20
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Apr 2008 13:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
	bh=26Km1qn+peUAsJoZM2x8lViYuoX5BFYiUTGUElFWYGM=;
	b=rqRfHvSUhCsGzdhhU6lIvYxyEjOOECFjZcQeNC+91Yhcb/Bvp9B0E+eZhsr5xJvBnfO4EetBoX4eY70dzPWo8ZGff/r8MNF4aHVzs6euzXQZxqgN7qlp9dQbL10I5vqBwOHgFAS7gtS5PWdj6AMhMi7Cbxgz+BIuWNLOFgLAPF4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
	b=FtRb2tcsFhNuPaoWhHKDzofJ1EiXpOTvOO7qEtk6KqRIBqq/U4kx8+ypTfou6290VRlIalmGuH83P6NJxAyA84tar4bEc3fGg8tJqvfU40m12hjxoaSzLKsJzLNrl2eazx78mxUn7SLFZwpCPvJ8mwGI2vAHkqFDKKDbY/3PZOQ=
Received: by 10.115.54.7 with SMTP id g7mr2354963wak.212.1209068742254;
	Thu, 24 Apr 2008 13:25:42 -0700 (PDT)
Received: by 10.114.190.2 with HTTP; Thu, 24 Apr 2008 13:25:42 -0700 (PDT)
Message-ID: <f96d234e0804241325l64a85878q905dc02eb177266d@mail.gmail.com>
Date: Thu, 24 Apr 2008 16:25:42 -0400
From: "Cliff Brake" <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: bitbake -c rebuild not running all tasks
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Thu, 24 Apr 2008 20:25:56 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I'm trying to sort out the xorg fonts stuff, and am running into an
issue where "bitbake -c rebuild" does not re-run all tasks when
rebuilding font-util.  It seems to me that bitbake should be running
all tasks including configure, compile, etc.

I'm using bitbake 1.8 HEAD, and a week old or so version of OE.  I'll
try the OE HEAD as soon as I get a build to finish.

Thanks,
Cliff


cbrake@happy:/build/bhthermal/bht_build/oe$ bitbake font-util -c rebuild
NOTE: Handling BitBake files: / (5365/5365) [100 %]
NOTE: Parsing finished. 5137 cached, 0 parsed, 228 skipped, 0 masked.
NOTE: Cache is clean, not saving.
NOTE: build 200804241623: started

OE Build Configuration:
BB_VERSION     = "1.8.11"
OE_REVISION    = "<unknown>"
TARGET_ARCH    = "i586"
TARGET_OS      = "linux"
MACHINE        = "pcm-9375"
DISTRO         = "angstrom"
DISTRO_VERSION = "2008.1-test-20080424"
TARGET_FPU     = ""

NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
ERROR: Multiple .bb files are due to be built which each provide xdmcp
(/build/bhthermal/bht_build/oe/oe/org.openembedded.dev/packages/xorg-lib/libxdmcp_1.0.2.bb
/build/bhthermal/bht_build/oe/oe/org.openembedded.dev/packages/xorg-lib/libxdmcp-native_1.0.2.bb).
 This usually means one provides something the other doesn't and should.
ERROR: Multiple .bb files are due to be built which each provide xau
(/build/bhthermal/bht_build/oe/oe/org.openembedded.dev/packages/xorg-lib/libxau_1.0.3.bb
/build/bhthermal/bht_build/oe/oe/org.openembedded.dev/packages/xorg-lib/libxau-native_1.0.3.bb).
 This usually means one provides something the other doesn't and should.
NOTE: Executing runqueue
NOTE: Removing stamps:
/build/bhthermal/bht_build/oe/build/angstrom-2008.1/tmp/stamps/geode-angstrom-linux/font-util-1_1.0.1-r2.*
NOTE: Running task 527 of 656 (ID: 2,
/build/bhthermal/bht_build/oe/oe/org.openembedded.dev/packages/xorg-font/font-util_1.0.1.bb,
do_prepackaged_stage)
NOTE: package font-util-1.0.1: started
NOTE: package font-util-1_1.0.1-r2: task do_prepackaged_stage: started
NOTE: Uninstalling any existing package from staging...
Removing package staging-font-util-geode-angstrom-linux from root...
NOTE: Following speedup

Installing staging-font-util-geode-angstrom-linux (1.0.1-r2) to root...
Configuring staging-font-util-geode-angstrom-linux
NOTE: package font-util-1_1.0.1-r2: task do_prepackaged_stage: completed
NOTE: package font-util-1.0.1: completed
NOTE: Running task 654 of 656 (ID: 11,
/build/bhthermal/bht_build/oe/oe/org.openembedded.dev/packages/xorg-font/font-util_1.0.1.bb,
do_qa_staging)
NOTE: package font-util-1.0.1: started
NOTE: package font-util-1_1.0.1-r2: task do_qa_staging: started
NOTE: QA checking staging
NOTE: package font-util-1_1.0.1-r2: task do_qa_staging: completed
NOTE: package font-util-1.0.1: completed
NOTE: Running task 655 of 656 (ID: 0,
/build/bhthermal/bht_build/oe/oe/org.openembedded.dev/packages/xorg-font/font-util_1.0.1.bb,
do_build)
NOTE: package font-util-1.0.1: started
NOTE: package font-util-1_1.0.1-r2: task do_build: started
NOTE: package font-util-1_1.0.1-r2: task do_build: completed
NOTE: package font-util-1.0.1: completed
NOTE: Running task 656 of 656 (ID: 1,
/build/bhthermal/bht_build/oe/oe/org.openembedded.dev/packages/xorg-font/font-util_1.0.1.bb,
do_rebuild)
NOTE: package font-util-1.0.1: started
NOTE: package font-util-1_1.0.1-r2: task do_rebuild: started
NOTE: package font-util-1_1.0.1-r2: task do_rebuild: completed
NOTE: package font-util-1.0.1: completed
NOTE: Tasks Summary: Attempted 656 tasks of which 652 didn't need to
be rerun and 0 failed.
NOTE: build 200804241623: completed


-- 
=======================
Cliff Brake
http://bec-systems.com


