Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sagasolauyeoldum@gmail.com>) id 1R1ioi-0006nr-PS
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Sep 2011 19:55:12 +0200
Received: by bkbzu17 with SMTP id zu17so848598bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Sep 2011 10:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:x-enigmail-version:content-type:content-transfer-encoding;
	bh=ehUrvQlE3LXvRdjVlC3xFB0zGkDY1kbe72KJl7AhdFk=;
	b=k6BH7Fjs2kc2YQqVCK9+RChf+jnvgU7OWi+LHJvpHBgBeWZbJOQQ+M4XPCOwwlvEBi
	sCXUoSdLXJMMGszjvPmbuJQVTUhgPObrwMPQc7HahjlhpuiU4AHoBzqc+wHNGMf8gA0N
	oQMsPP7BNLNdHubg+XztKYLEr8JHio48GYN2s=
Received: by 10.204.140.88 with SMTP id h24mr753351bku.170.1315504208854;
	Thu, 08 Sep 2011 10:50:08 -0700 (PDT)
Received: from [192.168.1.105] ([88.243.5.169])
	by mx.google.com with ESMTPS id p9sm920655fah.1.2011.09.08.10.50.07
	(version=SSLv3 cipher=OTHER); Thu, 08 Sep 2011 10:50:07 -0700 (PDT)
Message-ID: <4E69004E.30701@gmail.com>
Date: Thu, 08 Sep 2011 20:50:06 +0300
From: Jim Qode <sagasolauyeoldum@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.21) Gecko/20110831 Thunderbird/3.1.13
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 1.1.2
Subject: bitbake -b workaround
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
X-List-Received-Date: Thu, 08 Sep 2011 17:55:12 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello,

I updated my build environment today. Now bitbake -b fails with the
following errors. Is there any workaround I can use to continue working
on my project before a patch is issued?

ERROR: Command execution failed: Traceback (most recent call last):
  File
"/home/jimqode/Werk/oe/setup-scripts/sources/bitbake/lib/bb/command.py",
line 102, in runAsyncCommand
    commandmethod(self.cmds_async, self, options)
  File
"/home/jimqode/Werk/oe/setup-scripts/sources/bitbake/lib/bb/command.py",
line 190, in buildFile
    command.cooker.buildFile(bfile, task)
  File
"/home/jimqode/Werk/oe/setup-scripts/sources/bitbake/lib/bb/cooker.py",
line 627, in buildFile
    buildfile = self.matchFile(fn)
  File
"/home/jimqode/Werk/oe/setup-scripts/sources/bitbake/lib/bb/cooker.py",
line 604, in matchFile
    matches = self.matchFiles(buildfile)
  File
"/home/jimqode/Werk/oe/setup-scripts/sources/bitbake/lib/bb/cooker.py",
line 586, in matchFiles
    filelist, masked = self.collect_bbfiles()
  File
"/home/jimqode/Werk/oe/setup-scripts/sources/bitbake/lib/bb/cooker.py",
line 853, in collect_bbfiles
    files.sort( key=lambda fileitem: self.calc_bbfile_priority(fileitem) )
  File
"/home/jimqode/Werk/oe/setup-scripts/sources/bitbake/lib/bb/cooker.py",
line 853, in <lambda>
    files.sort( key=lambda fileitem: self.calc_bbfile_priority(fileitem) )
  File
"/home/jimqode/Werk/oe/setup-scripts/sources/bitbake/lib/bb/cooker.py",
line 397, in calc_bbfile_priority
    for _, _, regex, pri in self.status.bbfile_config_priorities:
AttributeError: 'NoneType' object has no attribute
'bbfile_config_priorities'



