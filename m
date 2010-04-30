Received: from mail-ww0-f47.google.com ([74.125.82.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <xor.gate.engineering@gmail.com>) id 1O7qQJ-0001z6-BY
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Apr 2010 15:38:31 +0200
Received: by wwb18 with SMTP id 18so153311wwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Apr 2010 06:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=EKzbOxkvyirGHFJ48zmxWdMV5/U+o0mJGgxcoBk3wxQ=;
	b=KqBZ7LFpXB8QQR7Ij7ASt0/SMgTpYxW7GanZPEILeiznwiLSMjjRD4GU4mkIqa7GnJ
	ur7NvBA4tp50BDF9Vyrr7DSNqRXdqt3e2RFHP+fQRwzorXytqMORbu/TVyoaWV8gTUIm
	vvDWS7kk6tKXZd56mQuBEJTFxWEizql4BfBlw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=ir/FZyaCo2/gAOMZKDGzobiXfMrNmfdpkbcLXZxRuykeMyDVfqEld4SQbckHUyCo+8
	oyQ8isrd9OK03pi8sxJ0qxZje0FKHIl79HwfOcUpQ5o/xlXSA6ZE/GS0BoMmMLjYthfB
	8xmVY/I7QBmuFIjMpO2XyG7lGaNtNPN9qWlhI=
MIME-Version: 1.0
Received: by 10.216.88.134 with SMTP id a6mr4428158wef.66.1272634487863; Fri, 
	30 Apr 2010 06:34:47 -0700 (PDT)
Received: by 10.216.139.144 with HTTP; Fri, 30 Apr 2010 06:34:47 -0700 (PDT)
Date: Fri, 30 Apr 2010 15:34:47 +0200
Message-ID: <q2x8db82dd41004300634g46c42cf7na4871677b8d92cb7@mail.gmail.com>
From: Jerry Jacobs <xor.gate.engineering@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.47
X-SA-Exim-Mail-From: xor.gate.engineering@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Usage of meta recipe external-toolchain-csl
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
X-List-Received-Date: Fri, 30 Apr 2010 13:38:31 -0000
Content-Type: text/plain; charset=ISO-8859-1

Dear all,

I'm very new to openembedded and already have a clear view how it is
structured. My embedded board mini2440 is already in git and want to create
my own distro.
The problem where I bump against is how to use the Codesourcery external
toolchain for my target. I know there is the file in recipes/meta/
external-toolchain-csl.bb
but it not clear how to use it.

This is how my tree looks like:

/opt/arm-2010q1/bin  ==> codesourcery toolchain

/opt/mini2440/oe/
   |----- bitbake              ==> bitbake
   |----- openembedded ==> openembedded overlay
   |----- tunebox             ==> my distro buildir
           | ------ conf        ==> configuration dir for local.conf
           | ------ setenv    ==> script to set the environment

setenv:
export OEBASE=/opt/mini2440/oe/openembedded
export PATH=/opt/mini2440/oe/bitbake/bin:/opt/arm-2010q1/bin:$PATH
export BBPATH=/opt/mini2440/oe/tunebox:$OEBASE
export BB_ENV_EXTRAWHITE="OEBASE"

local.conf:
BBFILES = "/opt/mini2440/oe/openembedded/recipes/*/*.bb"
DISTRO = "micro"
MACHINE = "mini2440"

I found also the arago distro which has a toolchain-csl.conf and includes it
in local.conf, but they do black magic to set the variables:
TOOLCHAIN_SYSPATH
TOOLCHAIN_PATH
SDK_PATH

which can be found in the git repository.

I hope somebody can clear some things up, because its very obsecure if you
start from scratch.

Kind regards,
Jerry Jacobs

