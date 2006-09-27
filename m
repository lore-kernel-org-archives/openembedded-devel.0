Received: from [24.71.223.10] (helo=pd5mo1so.prod.shaw.ca)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <rayl@mail.com>) id 1GSZwR-000656-FU
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Sep 2006 15:59:15 +0200
Received: from pd2mr5so.prod.shaw.ca (pd2mr5so-qfe3.prod.shaw.ca [10.0.141.8])
	by l-daemon (Sun ONE Messaging Server 6.0 HotFix 1.01 (built Mar 15
	2004)) with ESMTP id <0J69001UL7XIG630@l-daemon> for
	openembedded-devel@lists.openembedded.org; Wed,
	27 Sep 2006 07:53:42 -0600 (MDT)
Received: from pn2ml4so.prod.shaw.ca ([10.0.121.148])
	by pd2mr5so.prod.shaw.ca (Sun ONE Messaging Server 6.0 HotFix 1.01
	(built Mar
	15 2004)) with ESMTP id <0J69005D17XIZII0@pd2mr5so.prod.shaw.ca> for
	openembedded-devel@lists.openembedded.org; Wed,
	27 Sep 2006 07:53:42 -0600 (MDT)
Received: from ray.lehtiniemi.com ([68.147.121.172])
	by l-daemon (Sun ONE Messaging Server 6.0 HotFix 1.01 (built Mar 15
	2004)) with ESMTP id <0J6900DNJ7XIR7B0@l-daemon> for
	openembedded-devel@lists.openembedded.org; Wed,
	27 Sep 2006 07:53:42 -0600 (MDT)
Received: from [192.168.5.101] (siconix [68.146.203.109])
	(using TLSv1 with cipher RC4-MD5 (128/128 bits))
	(Client did not present a certificate)	by ray.lehtiniemi.com (Postfix)
	with ESMTP id D5D044E327F	for
	<openembedded-devel@lists.openembedded.org>; 
	Wed, 27 Sep 2006 07:53:41 -0600 (MDT)
Date: Wed, 27 Sep 2006 07:53:41 -0600
From: Ray Lehtiniemi <rayl@mail.com>
In-reply-to: <200609270745.13235.rayl@mail.com>
To: openembedded-devel@lists.openembedded.org
Message-id: <200609270753.41280.rayl@mail.com>
Organization: Disorganized
MIME-version: 1.0
References: <45190D58.2020807@adtelecom.es> <451A29EA.1080309@adtelecom.es>
	<200609270745.13235.rayl@mail.com>
User-Agent: KMail/1.8.2
Subject: Re: List of dependent packages
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Sep 2006 13:59:15 -0000
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7bit
Content-disposition: inline

On Wednesday 27 September 2006 07:45, Ray Lehtiniemi wrote:
> On Wednesday 27 September 2006 01:36, Joaquim Duran wrote:

> > myFilterProvider preferred_versions[pn] =
> > bb.providers.findBestProvider(pn, pkg_pn)[2:4] TypeError:
> > findBestProvider() takes at least 3 arguments (2 given)
>
> i've found that there are several files under lib/bb/ with this problem.
>
> this patch is cut and pasted, so is probably whitespace mangled....

whoops, ignore that last patch.  upon closer inspection, i was actually seeing 
a different error with bb.providers.findBestProvider than you are...  mine 
looked like this:


Traceback (most recent call last):
  File "/opt/oe/bitbake/bin/bitbake", line 1161, in ?
    main()
  File "/opt/oe/bitbake/bin/bitbake", line 1156, in main
    cooker.cook( BBConfiguration( options ), args[1:] )
  File "/opt/oe/bitbake/bin/bitbake", line 888, in cook
    self.interactiveMode()
  File "/opt/oe/bitbake/bin/bitbake", line 793, in interactiveMode
    shell.start( self )
  File "/opt/oe/bitbake/lib/bb/shell.py", line 804, in start
    bbshell.main()
  File "/opt/oe/bitbake/lib/bb/shell.py", line 779, in main
    self.processCommand( tokens[0], tokens[1:] or "" )
  File "/opt/oe/bitbake/lib/bb/shell.py", line 736, in processCommand
    result = function( self.commands, params )
  File "/opt/oe/bitbake/lib/bb/shell.py", line 532, in which
    lv, lf, pv, pf = bb.providers.findBestProvider(preferred, 
cooker.configuration.data, cooker.status, cooker.build_cache_fail)
NameError: global name 'bb' is not defined



ray



