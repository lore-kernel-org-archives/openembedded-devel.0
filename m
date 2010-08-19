Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <coolaj86@gmail.com>) id 1Om7jJ-0001Cw-J0
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Aug 2010 18:12:40 +0200
Received: by fxm6 with SMTP id 6so1214262fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Aug 2010 09:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:from:date
	:message-id:subject:to:content-type;
	bh=JTMiQYkx5uXpwzqsCQ0PwRQ6q3K0ygO0TMog/islZT0=;
	b=S42fg0k6IL8qM4Ox4ZbU8xMaoWKcH+qOuH13jdbjx+SXUsECY9L9bw0ChCkTTSZNtR
	bVLSd29FvmPJ7kYyfB+OvLmQUObSy0pUQmTwlIy8aEWA+ahT/XemXnVtUKV2ZdYGHOBm
	f1vSvnKlpw7Q7vf3FuAgs/cjN+xhO6CUvy9Bw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	b=RNg4MUh3nOBi6EeA5VyWVLuhjfKvgA/uJrMmoQtqr9OL7K00xL7YRgwR/YVcO/vOb6
	VIahrWWPrSDyiWP39gkSRbweTiuByyEB873mETaKbVCMbHjhEMYejCV3qjg4DovHa/pP
	5rQSUytM37P6ZUSoxCIwjjzdQ+hdvu2uCvlcE=
Received: by 10.223.104.145 with SMTP id p17mr56627fao.34.1282234337211; Thu,
	19 Aug 2010 09:12:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.125.209 with HTTP; Thu, 19 Aug 2010 09:11:57 -0700 (PDT)
From: AJ ONeal <coolaj86@gmail.com>
Date: Thu, 19 Aug 2010 10:11:57 -0600
Message-ID: <AANLkTinbLOK+FkKCKxkrA0pCQDD0O6DbimBUbDEv0dKZ@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: coolaj86@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,
	HTML_FONT_FACE_BAD,HTML_MESSAGE,SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Creating a new recipe, how to fix config.log: CROSS COMPILE Badness /usr/include in INCLUDEPATH?
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
X-List-Received-Date: Thu, 19 Aug 2010 16:12:40 -0000
Content-Type: text/plain; charset=ISO-8859-1

I'm assuming that this "CROSS COMPILE Badness" is part of OE and not part of
the package.

What is it that I need to do to correct this error? Please point me in the
right direction.


NOTE: Running task 391 of 552 (ID: 8,
/home/coolaj86/overo-oe/user.collection/recipes/nodejs/nodejs_0.1.104.bb,
do_qa_configure)
ERROR: This autoconf log indicates errors, it looked at host includes.
Rerun configure task after fixing this.




config.log:
----------------------------------------
Checking for library execinfo
==>

int main() {
  return 0;
}

<==
[1/2] cxx: build/.conf_check_0/test.cpp ->
build/.conf_check_0/testbuild/default/test_1.o
CROSS COMPILE Badness: /usr/include in INCLUDEPATH: /usr/include
cc1plus: internal compiler error: in add_path, at c-incpath.c:425
Please submit a full bug report,
with preprocessed source if appropriate.
See <http://gcc.gnu.org/bugs.html> for instructions.
['arm-angstrom-linux-gnueabi-g++', '-march=armv7-a', '-mtune=cortex-a8',
'-mfpu=neon', '-mfloat-abi=softfp',
'-isystem/home/coolaj86/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include',
'-fexpensive-optimizations', '-frename-registers', '-fomit-frame-pointer',
'-O2', '-ggdb3', '-fpermissive', '-fvisibility-inlines-hidden',
'-isystem/home/coolaj86/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include',
'-isystem/home/coolaj86/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include',
'-I/usr/local/include', '-I/usr/include', '../test.cpp', '-c', '-o',
'default/test_1.o']
command returned 'Build failed:  -> task failed (err #1): \n\t{task: cxx
test.cpp -> test_1.o}'not found




I'm also assuming that this error is not what triggered the config.log
error?

Checking for header port.h
==>
#include <port.h>

int main() {
  return 0;
}

<==
[1/2] cc: build/.conf_check_0/test.c ->
build/.conf_check_0/testbuild/default/test_1.o
../test.c:1:18: error: port.h: No such file or directory
['arm-angstrom-linux-gnueabi-gcc', '-march=armv7-a', '-mtune=cortex-a8',
'-mfpu=neon', '-mfloat-abi=softfp',
'-isystem/home/coolaj86/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include',
'-fexpensive-optimizations', '-frename-registers', '-fomit-frame-pointer',
'-O2', '-ggdb3', '-rdynamic', '-D_GNU_SOURCE', '-DHAVE_CONFIG_H=1',
'-isystem/home/coolaj86/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include',
'-isystem/home/coolaj86/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include',
'../test.c', '-c', '-o', 'default/test_1.o']
command returned 'Build failed:  -> task failed (err #1): \n\t{task: cc
test.c -> test_1.o}'not found



AJ ONeal

