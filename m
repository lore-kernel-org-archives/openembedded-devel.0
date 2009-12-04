Received: from mail.borenet.se ([213.134.106.117] helo=mail-storage.borenet.se)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <xerxes@zafena.se>) id 1NGZkv-0007rJ-5H
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Dec 2009 16:07:40 +0100
Received: from [192.168.1.114] (labb.zafena.se [213.134.106.61])
	by mail-storage.borenet.se (Postfix) with ESMTP id DC5DB30E3AC
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Dec 2009 15:59:10 +0100 (CET)
Message-ID: <4B1923BF.2090801@zafena.se>
Date: Fri, 04 Dec 2009 15:59:11 +0100
From: =?ISO-8859-1?Q?Xerxes_R=E5nby?= <xerxes@zafena.se>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <BAY127-W12EABE192FF93EC42483CFD8930@phx.gbl>
In-Reply-To: <BAY127-W12EABE192FF93EC42483CFD8930@phx.gbl>
X-SA-Exim-Connect-IP: 213.134.106.117
X-SA-Exim-Mail-From: xerxes@zafena.se
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Facing problem with "bitbake" command
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
X-List-Received-Date: Fri, 04 Dec 2009 15:07:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

saleh usman wrote:
> Hello 
>
> I am new to openembedded and I am following Getting started page of openembedded to work with it.I am facing problem in Building Software section and bitbake command is not working.
> I've edited the local configuration file and also directory where I've downloaded openembedded contains bitabake and build directory.
>
>
> It seems like this
>
> [root@localhost build]# bitbake nano
> bash: bitbake: command not found
> [root@localhost build]# 
>
> Plz tell me where might be the problem.
>
> Regards 
> Saleh Usman
>   
Hi the problem are that bash cant find the bitbake executable in the PATH.
You need to setup the environment by running:

export PATH=/stuff/bitbake/bin:$PATH

The PATH environment variable are used by bash, (the program that
displays your command line), to find where executables to run are
located on your system.
By exporting PATH to include the bitbake/bin dir makes the bitbake
command available.

You probably also need to set the BBPATH variable as well so that
bitbake can find its configuration when run.

export BBPATH=/stuff/build:/stuff/openembedded

Cheers
Xerxes



