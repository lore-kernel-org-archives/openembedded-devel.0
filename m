Received: from [209.85.146.182] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1KNqsZ-0000sI-Pk
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Jul 2008 17:12:48 +0200
Received: by wa-out-1112.google.com with SMTP id j37so3116912waf.22
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jul 2008 08:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:mime-version:content-type:content-transfer-encoding
	:content-disposition;
	bh=/4CDrNjvqld/ys/xgwlMNjdCNXsjfKOzsJlOuyZtRKk=;
	b=qFU5f5O+jg6E3j22n+xKYlM9C0ATJyS/vfhzf3AXlnChZN8BLz86ddqfiP3WKQAqBY
	tibps5Hc8JgN+1Ot3gk6pcQYzYse2CxngGVNZrek19Oq1Kbw7UD6R1JfH3prRuAbip01
	AmZMG6CdZZmdUlfCJU/cGLnchNCqGy4ghTsLU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:mime-version:content-type
	:content-transfer-encoding:content-disposition;
	b=ZJwQIi91pAe9CvpzTgX8phBQ/fE4iaWsllrwGPtkwNUFlv8nGHBzpF/x7TI3ZMdFEw
	DniLk3XqbbTnYUwJcBplwlO8b3BYSp+gWRdu1GLLIA30Dq90vzZnPHGOcSAodnYkcDVU
	65s7xPIksP/lfQoZ3+K05fUnGMppXwTXa0V8g=
Received: by 10.114.205.1 with SMTP id c1mr6725308wag.56.1217344268892;
	Tue, 29 Jul 2008 08:11:08 -0700 (PDT)
Received: by 10.114.184.13 with HTTP; Tue, 29 Jul 2008 08:11:08 -0700 (PDT)
Message-ID: <f96d234e0807290811w76f58c6t8420d56d1b5b9533@mail.gmail.com>
Date: Tue, 29 Jul 2008 11:11:08 -0400
From: "Cliff Brake" <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: multiple entries in PREMIRRORS
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Tue, 29 Jul 2008 15:12:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I've been trying to set up multiple entries in PREMIRRORS in a conf file like:

PREMIRRORS = "(ftp|https?)$://.*/.*/ http://dev.bec-systems.com/oesources/ \
http://downloads.sleepycat.com/db-4.3.29.tar.gz
http://dev.bec-systems.com/oesources/db-4.3.29.tar.gz"

which results in:

NOTE: Resolving missing task queue dependencies
NOTE: preferred version 2.5 of glibc not available (for item
virtual/arm-angstrom-linux-gnueabi-libc-for-gcc)
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 9 of 9 (ID: 0,
/build/pp/oe2-test-package-fetch/oe/custom/packages/linux/compulab-pxa270_2.6.25-rc5.bb,
do_fetch)
NOTE: package compulab-pxa270-2.6.25-rc5: started
NOTE: package compulab-pxa270-2.6.25-rc5-r3: task do_fetch: started
NOTE: Task failed: Unknown fetch Error: too many values to unpack
NOTE: package compulab-pxa270-2.6.25-rc5-r3: task do_fetch: failed
ERROR: TaskFailed event exception, aborting
NOTE: package compulab-pxa270-2.6.25-rc5: failed
ERROR: Build of
/build/pp/oe2-test-package-fetch/oe/custom/packages/linux/compulab-pxa270_2.6.25-rc5.bb
do_fetch failed
ERROR: Task 0 (/build/pp/oe2-test-package-fetch/oe/custom/packages/linux/compulab-pxa270_2.6.25-rc5.bb,
do_fetch) failed
NOTE: Tasks Summary: Attempted 8 tasks of which 8 didn't need to be
rerun and 1 failed.
ERROR: '/build/pp/oe2-test-package-fetch/oe/custom/packages/linux/compulab-pxa270_2.6.25-rc5.bb'
failed

But, if I define a new class:

bec-mirrors.bbclass:

PREMIRRORS_append () {
ftp://.*/.*/	http://dev.bec-systems.com/oesources/
http://.*/.*/	http://dev.bec-systems.com/oesources/
http://downloads.sleepycat.com/db-4.3.29.tar.gz
http://dev.bec-systems.com/oesources/db-4.3.29.tar.gz
}

and put the following in *.conf:
INHERIT += "bec-mirrors"

it works fine.

What is the difference?  Why do multiple lines work fine in a
PREMIRRORS_append, but not directly assigning a variable?  I started
tracing through the code, but its bouncing back and forth between
bbclass and bitbake code, so I'm asking first :-)

Thanks,
Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com


