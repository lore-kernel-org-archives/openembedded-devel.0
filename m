Received: from [209.85.219.223] (helo=mail-ew0-f223.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1MSTPo-0006V4-Lr
	for openembedded-devel@lists.openembedded.org;
	Sun, 19 Jul 2009 12:14:44 +0200
Received: by ewy23 with SMTP id 23so1705254ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Jul 2009 03:00:54 -0700 (PDT)
Received: by 10.210.125.13 with SMTP id x13mr3728568ebc.28.1247997654154;
	Sun, 19 Jul 2009 03:00:54 -0700 (PDT)
Received: from ?192.168.1.10? (94-193-93-235.zone7.bethere.co.uk
	[94.193.93.235])
	by mx.google.com with ESMTPS id 9sm6643340ewy.23.2009.07.19.03.00.53
	(version=SSLv3 cipher=RC4-MD5); Sun, 19 Jul 2009 03:00:53 -0700 (PDT)
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4A62E981.40607@dresearch.de>
References: <4A62DF07.8000804@dresearch.de> <h3unsp$1cs$1@ger.gmane.org>
	<4A62E981.40607@dresearch.de>
Date: Sun, 19 Jul 2009 11:00:52 +0100
Message-Id: <1247997652.3356.0.camel@xora-desktop.xora.org.uk>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.2 (2.26.2-1.fc11) 
Subject: Re: do_qa_configure apr-util_1.3.4 fails
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
X-List-Received-Date: Sun, 19 Jul 2009 10:14:44 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, 2009-07-19 at 11:38 +0200, Steffen Sledz wrote:
> >> /opt/openembedded/recipes/apr/apr-util_1.3.4.bb, do_qa_configure)
> >> ERROR: This autoconf log indicates errors, it looked at host includes.
> >> Rerun configure task after fixing this. The path was
> >> '/home/sledz/work/HydraIP/OpenEmbedded/tmp.3/work/armv5te-angstrom-linux-gnueabi/apr-util-1.3.4-r5/apr-util-1.3.4'
> >> ...
> >> I'd a look into the configure log (see attached file) but couldn't
> >> find the autoconf problem which causes this error. :(
> > 
> > The error would be shown in ${S}/config.log
> 
> I also couldn't identify the problem there. Attached config.log contains some "No such file or directory" and "cc1: internal compiler error", but it's not clear to me if they are part of the tests or real problems.
> 
The message is pretty self explanatory and 10 secs with google would
have given you the answer.

The configure script is referencing /usr/include in the include
directorys. This is always an error.

Graeme




