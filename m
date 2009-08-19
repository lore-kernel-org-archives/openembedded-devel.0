Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1Mdd3m-0001jE-Dk
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Aug 2009 06:46:06 +0200
Received: from tamarin.localnet (123-192-185-227.dynamic.kbronet.com.tw
	[123.192.185.227])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id CB5981B10C08;
	Wed, 19 Aug 2009 04:32:46 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Aug 2009 06:28:20 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc4; KDE/4.3.0; i686; ; )
References: <91283b620908182055l505fbbabt4dd5369f51cf260@mail.gmail.com>
In-Reply-To: <91283b620908182055l505fbbabt4dd5369f51cf260@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200908190628.20586.holger+oe@freyther.de>
Cc: "General mailing list for gumstix users."
	<gumstix-users@lists.sourceforge.net>
Subject: Re: Problem passing environment variables
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
X-List-Received-Date: Wed, 19 Aug 2009 04:46:06 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Wednesday 19 August 2009 05:55:14 Stuart Gray wrote:
> Hi,
>
> I am trying to build with support for Qt4 Embedded. This was working, but
> then I tried to add our most recent Qt4 project files and updated code, but
> the build failed.
>
> The issue is that the project files use environment variables which when
> using the Qt4 development environment works fine, but when this is compiled
> under the OE environment I cannot find a way to pass the variables into the
> qmake2 build.
>
> I have tried to add them on the line calling qmake2, but this has not
> worked.
>
> I have also tried to add then into my environment setup changing my .bashrc
> to add the variables. I have also added these to the BB_ENV_EXTRAWHITE, but
> the variables are still not found.

Well, it is hard to tell what kind of environment variables you have. But if 
you are using environment variables to configure you could

a) reconsider and use the qmake way to set variables on the command line. This 
can be achieved using the EXTRA_QMAKEVARS_PRE and EXTRA_QMAKEVARS_POST vars 
which will result in a command line like: qmake PRE -after POST

b) you can use "export VAR" in the recipe to ask bitbake to export the VAR to 
the shell. then export VAR should show up in the generated shell script for 
do_configure and do_compile.

z.


