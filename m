Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>)
	id 1K4NxG-0006sE-0U; Fri, 06 Jun 2008 00:29:10 +0200
Received: from andromeda (e180185196.adsl.alicedsl.de [85.180.185.196])
	by drlauer-research.com (Postfix) with ESMTP id CB09B584C53;
	Fri,  6 Jun 2008 00:26:11 +0200 (CEST)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
Organization: Vanille-Media
To: openembedded-users@lists.openembedded.org
Date: Fri, 6 Jun 2008 00:24:22 +0200
User-Agent: KMail/1.9.9
References: <200806060643.37332.p_blacquiere@yahoo.co.uk>
In-Reply-To: <200806060643.37332.p_blacquiere@yahoo.co.uk>
MIME-Version: 1.0
Message-Id: <200806060024.23268.mickey@vanille-media.de>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Exception.ValueError during build
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
X-List-Received-Date: Thu, 05 Jun 2008 22:29:10 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thursday 05 June 2008 20:43:37 Paul Blacquiere wrote:
> Hi,
>
> While trying to build (independent of what machine or distro) I get the
> following error almost immediately.
>
> ********************************************************************
> $>  bitbake helloworld-image
>
> NOTE: Out of date cache found, rebuilding...
> NOTE: Handling BitBake files: | (0001/0001) [100 %]
> NOTE: Parsing finished. 0 cached, 1 parsed, 0 skipped, 0 masked.

This looks like either BitBake does not find your configuration directory 
(double check BBPATH) or you are missing the path to your BitBake files 
(double check BBFILES in your local.conf).

[...]

> NOTE: build 200806060630: started
> NOTE: <type 'exceptions.ValueError'>:substring not found while evaluating:
> ${@base_get_metadata_monotone_revision(d)}
> Traceback (most recent call last):
>   File "/stuff/bitbake/bin/bitbake", line 134, in <module>
>     main()
>   File "/stuff/bitbake/bin/bitbake", line 131, in main
>     cooker.cook()
>   File "/stuff/bitbake/lib/bb/cooker.py", line 636, in cook
>     return self.buildTargets(pkgs_to_build)
>   File "/stuff/bitbake/lib/bb/cooker.py", line 527, in buildTargets
>     bb.event.fire(bb.event.BuildStarted(buildname, targets,
> self.configuration.event_data))
>   File "/stuff/bitbake/lib/bb/event.py", line 67, in fire
>     if tmpHandler(event) == Handled:
>   File "tmpHandler(e)", line 31, in tmpHandler
>   File "/stuff/bitbake/lib/bb/data.py", line 97, in getVar
>     return d.getVar(var,exp)
>   File "/stuff/bitbake/lib/bb/data_smart.py", line 170, in getVar
>     return self.expand(value,var)
>   File "/stuff/bitbake/lib/bb/data_smart.py", line 85, in expand
>     s = __expand_python_regexp__.sub(python_sub, s)
>   File "/stuff/bitbake/lib/bb/data_smart.py", line 71, in python_sub
>     s = eval(code)
>   File "<string>", line 1, in <module>
>   File "<bb>", line 4, in base_get_metadata_monotone_revision
>   File "<bb>", line 4, in base_get_scmbasepath
> ValueError: substring not found

Fwiw, we should catch this error and put something more sane out.

:M:
-- 
Dr. Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de


