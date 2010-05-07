Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OAK1D-0007gV-Nd for openembedded-devel@lists.openembedded.org;
	Fri, 07 May 2010 11:38:52 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OAJxX-0001I8-ID for openembedded-devel@lists.openembedded.org;
	Fri, 07 May 2010 11:35:03 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 May 2010 11:35:03 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 May 2010 11:35:03 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
connect(): No such file or directory
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 07 May 2010 11:30:47 +0200
Message-ID: <hs0mk7$rst$2@dough.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.9) Gecko/20100421 Shredder/3.0.5pre
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: meta-toolchain doesn't build due to gdb-cross-sdk
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
X-List-Received-Date: Fri, 07 May 2010 09:38:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

Currently meta-toolchain is unbuildable:

Missing or unbuildable dependency chain was: ['gdb-cross-sdk']
NOTE: Runtime target 'task-sdk-host' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-sdk-host',
'gdb-cross-sdk']
ERROR: Required build target 'meta-toolchain' has no buildable providers.
Missing or unbuildable dependency chain was: ['meta-toolchain',
'task-sdk-host', 'gdb-cross-sdk']
Command execution failed: Traceback (most recent call last):
  File "/OE/bitbake/lib/bb/command.py", line 88, in runAsyncCommand
    commandmethod(self.cmds_async, self, options)
  File "/OE/bitbake/lib/bb/command.py", line 174, in buildTargets
    command.cooker.buildTargets(pkgs_to_build, task)
  File "/OE/bitbake/lib/bb/cooker.py", line 757, in buildTargets
    taskdata.add_unresolved(localdata, self.status)
  File "/OE/bitbake/lib/bb/taskdata.py", line 562, in add_unresolved
    self.remove_runtarget(self.getrun_id(target))
  File "/OE/bitbake/lib/bb/taskdata.py", line 535, in remove_runtarget
    self.fail_fnid(fnid, missing_list)
  File "/OE/bitbake/lib/bb/taskdata.py", line 495, in fail_fnid
    self.remove_runtarget(target, missing_list)
  File "/OE/bitbake/lib/bb/taskdata.py", line 535, in remove_runtarget
    self.fail_fnid(fnid, missing_list)
  File "/OE/bitbake/lib/bb/taskdata.py", line 490, in fail_fnid
    self.remove_buildtarget(target, missing_list)
  File "/OE/bitbake/lib/bb/taskdata.py", line 519, in remove_buildtarget
    raise bb.providers.NoProvider
NoProvider

The weird thing is that 'bitbake gdb-cross-sdk' *DOES* work. Any ideas?


regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFL493HMkyGM64RGpERAsfeAJ4+dAGLxl374iYexNPvF7aOl1L9jwCdEvTu
mKxwdYeXXCsZzQ0H8yocaBw=
=uhtx
-----END PGP SIGNATURE-----



