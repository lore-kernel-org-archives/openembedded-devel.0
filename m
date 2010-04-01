Received: from 3a.49.1343.static.theplanet.com
	([67.19.73.58] helo=pug.o-hand.com ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <josh@linux.intel.com>) id 1NxO4B-0004td-DZ
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Apr 2010 19:20:28 +0200
Received: from [10.250.128.186] (unknown [158.43.2.102])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by pug.o-hand.com (Postfix) with ESMTP id 73FCC12EC1F8
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Apr 2010 12:41:21 -0500 (CDT)
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4BB4CBD1.2050803@mlbassoc.com>
References: <1270135981.4993.128.camel@rex>  <4BB4CBD1.2050803@mlbassoc.com>
Date: Thu, 01 Apr 2010 18:17:09 +0100
Message-ID: <1270142229.27358.8.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 (2.28.3-1.fc12) 
X-SA-Exim-Connect-IP: 67.19.73.58
X-SA-Exim-Mail-From: josh@linux.intel.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Request for branch merge
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
X-List-Received-Date: Thu, 01 Apr 2010 17:20:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2010-04-01 at 10:37 -0600, Gary Thomas wrote:
> On 04/01/2010 09:33 AM, Richard Purdie wrote:
> > I've been aware that Poky and OE have been diverging slightly and I'd
> > like to correct this. There are some patches that I've promised for a
> > while too such as the rename from do_populate_staging ->
> > do_populate_sysroot.
> >
> > With some help from Joshua Lock, I have a branch I'd like to propose be
> > merged into OE.dev:
> >
> > http://cgit.openembedded.org/cgit.cgi/openembedded/log/?h=rpurdie/work-in-progress
> 
> Not much luck with this I'm afraid.

Whoops, good old fashioned copy and paste error. The test build I ran
didn't trigger this... Sorry.

I just force pushed an amended tree.

Cheers,
Joshua 

>    MACHINE=efika
>    DISTRO="angstrom-2008.1"
> 
> ERROR: '/local/Angstrom_BeagleBoard/openembedded/recipes/shasum/shasum-native.bb' failed
> NOTE: package shasum-native-1.0-r1: task do_qa_configure: Started
> ERROR: Error in executing python function in: /local/Angstrom_BeagleBoard/openembedded/recipes/shasum/shasum-native.bb
> ERROR: Exception:<type 'exceptions.NameError'> Message:global name 'configs' is not defined
> ERROR: Printing the environment of the function
> ERROR:  0021:       else:
> ERROR:  0022:          gt = "gettext"
> ERROR:  0023:       deps = bb.utils.explode_deps(bb.data.getVar('DEPENDS', d, True) or "")
> ERROR:  0024:       if gt not in deps:
> ERROR:  0025:          for config in configs:
> ERROR:  0026:              gnu = "grep \"^[[:space:]]*AM_GNU_GETTEXT\" %s >/dev/null" % config
> ERROR:  0027:              if os.system(gnu) == 0:
> ERROR:  0028:                 bb.note("""Gettext required but not in DEPENDS for file %s.
> ERROR:  0029:Missing inherit gettext?""" % config)
> ERROR: Function do_qa_configure failed
> NOTE: Task failed: ('function do_qa_configure failed', '/local/Angstrom_BeagleBoard/tmp/work/i686-linux/shasum-native-1.0-r1/temp/log.do_qa_configure.24200')
> ERROR: Logfile of failure stored in: /local/Angstrom_BeagleBoard/tmp/work/i686-linux/shasum-native-1.0-r1/temp/log.do_qa_configure.24200
> Log data follows:
> | ERROR: Error in executing python function in: /local/Angstrom_BeagleBoard/openembedded/recipes/shasum/shasum-native.bb
> | ERROR: Exception:<type 'exceptions.NameError'> Message:global name 'configs' is not defined
> | ERROR: Printing the environment of the function
> | ERROR:        0021:       else:
> | ERROR:        0022:          gt = "gettext"
> | ERROR:        0023:       deps = bb.utils.explode_deps(bb.data.getVar('DEPENDS', d, True) or "")
> | ERROR:        0024:       if gt not in deps:
> | ERROR:        0025:          for config in configs:
> | ERROR:        0026:              gnu = "grep \"^[[:space:]]*AM_GNU_GETTEXT\" %s >/dev/null" % config
> | ERROR:        0027:              if os.system(gnu) == 0:
> | ERROR:        0028:                 bb.note("""Gettext required but not in DEPENDS for file %s.
> | ERROR:        0029:Missing inherit gettext?""" % config)
> | ERROR: Function do_qa_configure failed
> NOTE: package shasum-native-1.0-r1: task do_qa_configure: Failed
> ERROR: TaskFailed event exception, aborting
> 
> I tried this with bitbake-1.8.18 and the version from Poky mainline.
> 

-- 
Joshua Lock
        Intel Open Source Technology Centre



