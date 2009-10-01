Received: from [80.91.229.12] (helo=lo.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MtLXX-0002Av-4F for openembedded-devel@lists.openembedded.org;
	Thu, 01 Oct 2009 15:17:50 +0200
Received: from list by lo.gmane.org with local (Exim 4.50) id 1MtLWq-0004yQ-22
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Oct 2009 15:17:04 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Oct 2009 15:17:04 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Oct 2009 15:17:04 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 01 Oct 2009 15:16:39 +0200
Message-ID: <ha2a3n$s6q$1@ger.gmane.org>
References: <1254397289.21355.57.camel@orest.ift.cs.uni-potsdam.de>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.3pre) Gecko/20090811 Shredder/3.0b4pre
In-Reply-To: <1254397289.21355.57.camel@orest.ift.cs.uni-potsdam.de>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Failed to build opencv_1.0.0.bb recipe
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
X-List-Received-Date: Thu, 01 Oct 2009 13:17:50 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Don't use -b unless you know what you are doing

On 01-10-09 13:41, Ali Akbar Zarezadeh wrote:
> Hi,
>
> I am trying to build opencv_1.0.0.bb recipe with this command:
>
> bitbake -b /opt/local/oe/openembedded/recipes/opencv/opencv_1.0.0.bb
>
> I've just faced with this error: "oe_runconf: command not found"
>
> Maybe this log would be helpful to get the point what happened:
>
> -------------------------------------------------------------------------------------------------
>
> NOTE: Preparing runqueue
> NOTE: Executing runqueue
> NOTE: Running task 5 of 17 (ID:
> 5, /opt/local/oe/openembedded/recipes/opencv/opencv_1.0.0.bb,
> do_configure)
> __builtin__:6: DeprecationWarning: raising a string exception is
> deprecated
> NOTE: No Python in STAGING_INCDIR. Forgot to build python-native ?:None
> while evaluating:
> ${@python_dir(d)}
> /opt/local/oe/bitbake/lib/bb/data_smart.py:92: DeprecationWarning:
> raising a string exception is deprecated
>    raise
> NOTE: No Python in STAGING_INCDIR. Forgot to build python-native ?:None
> while evaluating:
> --disable-debug  --without-gtk --without-python --disable-apps
> az_python_cspec=${STAGING_INCDIR}/${PYTHON_DIR}
> NOTE: No Python in STAGING_INCDIR. Forgot to build python-native ?:None
> while evaluating:
> 	if [ -x ${S}/configure ] ; then
> 		cfgcmd="${S}/configure \
> 		    --build=${BUILD_SYS} \
> 		    --host=${HOST_SYS} \
> 		    --target=${TARGET_SYS} \
> 		    --prefix=${prefix} \
> 		    --exec_prefix=${exec_prefix} \
> 		    --bindir=${bindir} \
> 		    --sbindir=${sbindir} \
> 		    --libexecdir=${libexecdir} \
> 		    --datadir=${datadir} \
> 		    --sysconfdir=${sysconfdir} \
> 		    --sharedstatedir=${sharedstatedir} \
> 		    --localstatedir=${localstatedir} \
> 		    --libdir=${libdir} \
> 		    --includedir=${includedir} \
> 		    --oldincludedir=${oldincludedir} \
> 		    --infodir=${infodir} \
> 		    --mandir=${mandir} \
> 			${EXTRA_OECONF} \
> 		    $@"
> 		oenote "Running $cfgcmd..."
> 		$cfgcmd || oefatal "oe_runconf failed"
> 	else
> 		oefatal "no configure script found"
> 	fi
>
> ERROR: function do_configure failed
> ERROR: log data follows
> (/opt/local/oe/tmp/work/ppc405-angstrom-linux/opencv-1.0.0-r2/temp/log.do_configure.24130)
> | /opt/local/oe/tmp/work/ppc405-angstrom-linux/opencv-1.0.0-r2/temp/run.do_configure.24130: line 745: oe_runconf: command not found
> NOTE: Task
> failed: /opt/local/oe/tmp/work/ppc405-angstrom-linux/opencv-1.0.0-r2/temp/log.do_configure.24130
> ERROR: TaskFailed event exception, aborting
> ERROR: Build
> of /opt/local/oe/openembedded/recipes/opencv/opencv_1.0.0.bb
> do_configure failed
> ERROR: Task 5
> (/opt/local/oe/openembedded/recipes/opencv/opencv_1.0.0.bb,
> do_configure) failed
> NOTE: Tasks Summary: Attempted 5 tasks of which 5 didn't need to be
> rerun and 1 failed.
> ERROR: '/opt/local/oe/openembedded/recipes/opencv/opencv_1.0.0.bb'
> failed
>
> -------------------------------------------------------------------------------------------------
>
> I would be grateful if somebody would help me to figure out the problem.
>
> CIAO
> Ali




