Received: from [217.200.184.87] (helo=fepna02-svc.tim.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gremlin@gremlin.it>) id 1LdPIc-0001wk-0V
	for openembedded-devel@openembedded.org; Sat, 28 Feb 2009 14:32:14 +0100
Received: from sesha.loc ([217.203.130.38]) by fepna02-svc.tim.it
	(InterMail vM.6.01.06.03 201-2131-130-104-20060516) with ESMTP
	id <20090228132833.OODP15437.fepna02-svc.tim.it@sesha.loc>
	for <openembedded-devel@openembedded.org>;
	Sat, 28 Feb 2009 14:28:33 +0100
Message-ID: <49A93B72.1020208@gremlin.it>
Date: Sat, 28 Feb 2009 14:26:10 +0100
From: Alessandro GARDICH <gremlin@gremlin.it>
User-Agent: Thunderbird 2.0.0.19 (X11/20090105)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <49A93A3D.7060003@balister.org>
In-Reply-To: <49A93A3D.7060003@balister.org>
Subject: Re: Tinylogin fetching failing
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
X-List-Received-Date: Sat, 28 Feb 2009 13:32:14 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Philip Balister wrote:
> Gremlin is building minimal distro and finds he cannot fetch tiny login 
> due to a ssl problem. I've tried wget and see this:
> 
> [balister@localhost ~]$ wget 
> http://tinylogin.busybox.net/downloads/tinylogin-1.4.tar.bz2
> --08:13:18--  http://tinylogin.busybox.net/downloads/tinylogin-1.4.tar.bz2
>            => `tinylogin-1.4.tar.bz2'
> Resolving tinylogin.busybox.net... 140.211.167.224
> Connecting to tinylogin.busybox.net|140.211.167.224|:80... connected.
> HTTP request sent, awaiting response... 301 Moved Permanently
> Location: https://bugs.busybox.net/downloads/tinylogin-1.4.tar.bz2 
> [following]
> --08:13:19--  https://bugs.busybox.net/downloads/tinylogin-1.4.tar.bz2
>            => `tinylogin-1.4.tar.bz2'
> Resolving bugs.busybox.net... 140.211.167.224
> Connecting to bugs.busybox.net|140.211.167.224|:443... connected.
> ERROR: Certificate verification error for bugs.busybox.net: unable to 
> get local issuer certificate
> To connect to bugs.busybox.net insecurely, use `--no-check-certificate'.
> Unable to establish SSL connection.
> [balister@localhost ~]$ wget 
> https://bugs.busybox.net/downloads/tinylogin-1.4.tar.bz2
> --08:15:19--  https://bugs.busybox.net/downloads/tinylogin-1.4.tar.bz2
>            => `tinylogin-1.4.tar.bz2'
> Resolving bugs.busybox.net... 140.211.167.224
> Connecting to bugs.busybox.net|140.211.167.224|:443... connected.
> ERROR: Certificate verification error for bugs.busybox.net: unable to 
> get local issuer certificate
> To connect to bugs.busybox.net insecurely, use `--no-check-certificate'.
> Unable to establish SSL connection.
> [balister@localhost ~]$
> 
> I need to run some errands today, so I cannot look at this further, but 
> I wanted to bring this up in hopes someone can resolve the problem.
> 
> Philip
> 
> PS: If you are building for Angstrom, the source mirror masks the 
> problem :)
> 
> 
> ------------------------------------------------------------------------
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


the real problem is that tinylogin.busybox.net will redirect to https 
bugzilla site, and a part a bad certificate the source don't exist.

I fetch the sources via subversion, seem the only way available.

-- 
  /-------------------------------------------------------------\
|           Alessandro Gardich : gremlin#gremlin!it             |
  >-------------------------------------------------------------<
|  I never saw a wild thing sorry for itself.                   |
|  A small bird will drop frozen dead from a bough              |
|  without ever having felt sorry for itself.                   |
  \-------------------------------------------------------------/


