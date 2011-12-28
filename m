Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RfqZY-0005kV-Gd
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Dec 2011 11:17:24 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 28 Dec 2011 02:10:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="90912620"
Received: from unknown (HELO helios.localnet) ([10.252.122.71])
	by orsmga001.jf.intel.com with ESMTP; 28 Dec 2011 02:10:09 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
Date: Wed, 28 Dec 2011 10:10:06 +0000
Message-ID: <10519823.CSrPkrPaVF@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.3 (Linux/3.0.0-14-generic-pae; KDE/4.7.4; i686; ; )
In-Reply-To: <CAOHjBZs+qDj-Rz-rMeMXrAPPDq2huA2cobNBv0cK7qncejMk-g@mail.gmail.com>
References: <CAOHjBZtWd8-_xgqbzx=jBjA4=tRD3CHJ62YiA=dzFr9QsUzaVA@mail.gmail.com>
	<CAOHjBZv6UcZcc1CNqzUEinbmUWeKw85AjoADWKE_gM0m9VEOMw@mail.gmail.com>
	<CAOHjBZs+qDj-Rz-rMeMXrAPPDq2huA2cobNBv0cK7qncejMk-g@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Question about package prefix
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
X-List-Received-Date: Wed, 28 Dec 2011 10:17:24 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 28 December 2011 10:40:47 Giuseppe Condorelli wrote:
> any advices?
> Thanks again,
> Giuseppe
> 
> 2011/12/20 Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
> > looking at the link Paul suggested me I cannot see anything that can be
> > address me to solve my problem.
> > The lone modification I can see here is the prefix, exec_prefix, etc...
> > setting inside micro.conf file, but this
> > is not good to help me.
> > I'm showing an example:
> > 
> > 1) imagine we have a package rpm, for example zlib
> > 2) rpm -qpli zlib.rpm (let me to call the package in this manner) will
> > show a list of the included files plus other info.
> > 
> >    All of those will have absolute path (/usr, etc...)
> > 
> > 3) What I need is to change this to a prefixed one (for example
> > /opt/test/distro/usr, etc...)
> > 4) I need this for all package in my distribution

So I'm not entirely sure I understand why this doesn't solve your problem. For 
your purposes you should have your own distro config file 
(conf/distro/distroname.conf) and set DISTRO = "distroname" in local.conf, and 
AFAICT then you should just need to set the *_prefix variables in the distro 
config as micro.conf does. You can look at classes/nativesdk.bbclass in OE-Core 
for another example of setting these prefixes.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


