Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P5Nd8-0008Iz-8F
	for openembedded-devel@openembedded.org; Mon, 11 Oct 2010 21:01:51 +0200
Received: by yxj4 with SMTP id 4so1062961yxj.6
	for <openembedded-devel@openembedded.org>;
	Mon, 11 Oct 2010 12:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=6mhnHWK5LM5koY1Nj+mayGdRJJxs3B2XoobA/Oe3ivo=;
	b=JlSAjPFE2d6vDUgFvy1Uo77Rd3byiCGEQhtAvrmbrc183Ft/JhEIX7uPYhcpQN022G
	CqUysaRg8VOMK1R9eb+JJbOnElKODShn/dXyaZsB4TBGsNtRHDcWhcguEX9EnjZk2Ky3
	IopUa/Ke7OatoeFgfJzD27BOHOlpbiAN/DGd8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=iGBGf6bBi2GGeCFlEfZjqct7oGuntLYzMdtvQZB4ggUynbl7Ri488Fh3WjkJ+g+Uch
	zN8uY1gJLRu4Al3GePGEPtAH2GUxVNyZCfiAh6eSLDJa/HRKG5DwhIR7v7yTj4oy2J/K
	+t58z0nyxCluZ8d05gNBHnRjlq0tWIJUtfQNQ=
MIME-Version: 1.0
Received: by 10.42.117.68 with SMTP id s4mr1797882icq.344.1286823682057; Mon,
	11 Oct 2010 12:01:22 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Mon, 11 Oct 2010 12:01:21 -0700 (PDT)
Date: Mon, 11 Oct 2010 21:01:21 +0200
Message-ID: <AANLkTikY65E7Y_LHngm7b6SdtNmWKjLFjd3sSU4PgTgN@mail.gmail.com>
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
X-List-Received-Date: Mon, 11 Oct 2010 19:01:51 -0000
Content-Type: text/plain; charset=ISO-8859-1

[this was still in my concepts folder, thought I'd sent it out  last week]

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

Any


