Received: from hermes.mlbassoc.com ([76.76.67.137] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gary@mlbassoc.com>) id 1NxNRu-0000np-1k
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Apr 2010 18:40:59 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id 40A6116604CA; Thu,  1 Apr 2010 10:37:38 -0600 (MDT)
Received: from hermes.chez-thomas.org (hermes_local [192.168.1.101])
	by mail.chez-thomas.org (Postfix) with ESMTP id 84987166059D;
	Thu,  1 Apr 2010 10:37:37 -0600 (MDT)
Message-ID: <4BB4CBD1.2050803@mlbassoc.com>
Date: Thu, 01 Apr 2010 10:37:37 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.8) Gecko/20100301 Fedora/3.0.3-1.fc11 Thunderbird/3.0.3
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1270135981.4993.128.camel@rex>
In-Reply-To: <1270135981.4993.128.camel@rex>
X-SA-Exim-Connect-IP: 76.76.67.137
X-SA-Exim-Mail-From: gary@mlbassoc.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: "Lock, Joshua" <joshua.lock@intel.com>
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
X-List-Received-Date: Thu, 01 Apr 2010 16:40:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/01/2010 09:33 AM, Richard Purdie wrote:
> I've been aware that Poky and OE have been diverging slightly and I'd
> like to correct this. There are some patches that I've promised for a
> while too such as the rename from do_populate_staging ->
> do_populate_sysroot.
>
> With some help from Joshua Lock, I have a branch I'd like to propose be
> merged into OE.dev:
>
> http://cgit.openembedded.org/cgit.cgi/openembedded/log/?h=rpurdie/work-in-progress

Not much luck with this I'm afraid.
   MACHINE=efika
   DISTRO="angstrom-2008.1"

ERROR: '/local/Angstrom_BeagleBoard/openembedded/recipes/shasum/shasum-native.bb' failed
NOTE: package shasum-native-1.0-r1: task do_qa_configure: Started
ERROR: Error in executing python function in: /local/Angstrom_BeagleBoard/openembedded/recipes/shasum/shasum-native.bb
ERROR: Exception:<type 'exceptions.NameError'> Message:global name 'configs' is not defined
ERROR: Printing the environment of the function
ERROR:  0021:       else:
ERROR:  0022:          gt = "gettext"
ERROR:  0023:       deps = bb.utils.explode_deps(bb.data.getVar('DEPENDS', d, True) or "")
ERROR:  0024:       if gt not in deps:
ERROR:  0025:          for config in configs:
ERROR:  0026:              gnu = "grep \"^[[:space:]]*AM_GNU_GETTEXT\" %s >/dev/null" % config
ERROR:  0027:              if os.system(gnu) == 0:
ERROR:  0028:                 bb.note("""Gettext required but not in DEPENDS for file %s.
ERROR:  0029:Missing inherit gettext?""" % config)
ERROR: Function do_qa_configure failed
NOTE: Task failed: ('function do_qa_configure failed', '/local/Angstrom_BeagleBoard/tmp/work/i686-linux/shasum-native-1.0-r1/temp/log.do_qa_configure.24200')
ERROR: Logfile of failure stored in: /local/Angstrom_BeagleBoard/tmp/work/i686-linux/shasum-native-1.0-r1/temp/log.do_qa_configure.24200
Log data follows:
| ERROR: Error in executing python function in: /local/Angstrom_BeagleBoard/openembedded/recipes/shasum/shasum-native.bb
| ERROR: Exception:<type 'exceptions.NameError'> Message:global name 'configs' is not defined
| ERROR: Printing the environment of the function
| ERROR:        0021:       else:
| ERROR:        0022:          gt = "gettext"
| ERROR:        0023:       deps = bb.utils.explode_deps(bb.data.getVar('DEPENDS', d, True) or "")
| ERROR:        0024:       if gt not in deps:
| ERROR:        0025:          for config in configs:
| ERROR:        0026:              gnu = "grep \"^[[:space:]]*AM_GNU_GETTEXT\" %s >/dev/null" % config
| ERROR:        0027:              if os.system(gnu) == 0:
| ERROR:        0028:                 bb.note("""Gettext required but not in DEPENDS for file %s.
| ERROR:        0029:Missing inherit gettext?""" % config)
| ERROR: Function do_qa_configure failed
NOTE: package shasum-native-1.0-r1: task do_qa_configure: Failed
ERROR: TaskFailed event exception, aborting

I tried this with bitbake-1.8.18 and the version from Poky mainline.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


