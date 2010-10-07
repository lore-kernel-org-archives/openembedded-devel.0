Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P3vKU-0007L7-Hp
	for openembedded-devel@openembedded.org; Thu, 07 Oct 2010 20:36:35 +0200
Received: by yxk8 with SMTP id 8so66734yxk.6
	for <openembedded-devel@openembedded.org>;
	Thu, 07 Oct 2010 11:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=c+U0A++RabWlMR4plW5J9oX4TFhp9SSecQeKtDgivU8=;
	b=qPG/rTKv+MzNCuRL46/+V7D9VtXpwUpy+bTS5kxFsUJJRnBN2W6fSwHQh6Kwz2Q9/9
	s/d0UL48Qg+nNN75qORX3RmpLXlO7vOWzg1HjR+5wFjye5ajo3LiiCsbWlwAQth2GWi9
	1pa1iJ3Y5muqNnlP7tmpKKFxKlRu0CpZS9G+w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=QHNRlOa0svcICJlXZAf6GiXhl9n4KUNJh7MIPqOUqxwsq82hR/lL8Vg69CaMqjXiMW
	+HA6rDQwX3lzAxhDd/2mDn3rDt1tOB4KXmVgzwlyjpe00eqDZ2//bvOvlYvGGN40+GjP
	a3zcdEawz0Xv5U2EGAML3BMHZen6Vx6QVzYPA=
MIME-Version: 1.0
Received: by 10.150.57.10 with SMTP id f10mr1599275yba.399.1286476572116; Thu,
	07 Oct 2010 11:36:12 -0700 (PDT)
Received: by 10.151.41.5 with HTTP; Thu, 7 Oct 2010 11:36:12 -0700 (PDT)
Date: Thu, 7 Oct 2010 20:36:12 +0200
Message-ID: <AANLkTimeMWsTvhkZjP+qjVJW7ynM69XcF_0WbS2VdenR@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: bitbake COMPATIBLE_MACHINE stack backtrace
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
X-List-Received-Date: Thu, 07 Oct 2010 18:36:35 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

If I run bitbake (git head of about a week ago) with a recipe that has
COMPATIBLE_MACHINE set and that is not for my machine, I get a bitbake
tracedump;

Log;
frans@linux-suse:~/oe/openembedded/recipes/zaurus-utils> grep COMPAT *
encdec-updater.bb:COMPATIBLE_MACHINE = '(poodle|c7x0|spitz|akita|tosa)'
nandlogical_1.0.0.bb:COMPATIBLE_MACHINE = "(poodle|c7x0|akita|spitz|tosa)"
zaurus-installer.bb:COMPATIBLE_MACHINE = '(collie|poodle|c7x0|spitz|akita|tosa)'
zaurus-legacy-tar.bb:COMPATIBLE_MACHINE = "spitz"
zaurus-updater.bb:COMPATIBLE_MACHINE = '(poodle|c7x0|spitz|akita|tosa)'

frans@linux-suse:~/oe/openembedded/recipes/zaurus-utils> bitbake -b
zaurus-legacy-tar.bb
ERROR: Command execution failed: Traceback (most recent call last):
  File "/home/frans/oe/bitbake/lib/bb/command.py", line 88, in runAsyncCommand
    commandmethod(self.cmds_async, self, options)
  File "/home/frans/oe/bitbake/lib/bb/command.py", line 174, in buildFile
    command.cooker.buildFile(bfile, task)
  File "/home/frans/oe/bitbake/lib/bb/cooker.py", line 650, in buildFile
    self.status.task_deps[fn]['depends'] = {}
TypeError: 'NoneType' object does not support item assignment

frans@linux-suse:~/oe/openembedded/recipes/zaurus-utils> bitbake
zaurus-legacy-tar
NOTE: Handling BitBake files: - (7148/7148) [100 %]
Parsing of 7148 .bb files complete (6693 cached, 455 parsed). 7333
targets, 330 skipped, 0 masked, 0 errors.
NOTE: oestats: build 93365
ERROR: Nothing PROVIDES 'zaurus-legacy-tar'
ERROR: Command execution failed: Traceback (most recent call last):
  File "/home/frans/oe/bitbake/lib/bb/command.py", line 88, in runAsyncCommand
    commandmethod(self.cmds_async, self, options)
  File "/home/frans/oe/bitbake/lib/bb/command.py", line 184, in buildTargets
    command.cooker.buildTargets(pkgs_to_build, task)
  File "/home/frans/oe/bitbake/lib/bb/cooker.py", line 737, in buildTargets
    taskdata.add_provider(localdata, self.status, k)
  File "/home/frans/oe/bitbake/lib/bb/taskdata.py", line 357, in add_provider
    self.add_provider_internal(cfgData, dataCache, item)
  File "/home/frans/oe/bitbake/lib/bb/taskdata.py", line 377, in
add_provider_internal
    raise bb.providers.NoProvider(item)
NoProvider: zaurus-legacy-tar

Especially in the first case there is no  real error message.
I seem to recall (but have not verified) that 1.10 handled this
without traceback.

Any opinions/fixes?

Frans


