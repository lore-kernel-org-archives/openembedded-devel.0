Received: from [68.230.241.45] (helo=fed1rmmtao101.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LaJkp-0005it-3y
	for openembedded-devel@openembedded.org; Fri, 20 Feb 2009 02:00:35 +0100
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao101.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20090220005805.UZLN2948.fed1rmmtao101.cox.net@fed1rmimpo03.cox.net>;
	Thu, 19 Feb 2009 19:58:05 -0500
Received: from localhost ([68.230.61.57]) by fed1rmimpo03.cox.net with bizsmtp
	id J0y51b00T1E665w040y5KR; Thu, 19 Feb 2009 19:58:05 -0500
X-Authority-Analysis: v=1.0 c=1 a=iBZYGkikSAUA:10 a=wFfnh1RIUdYA:10
	a=2mGlKUAvdft-jcKsr-AA:9 a=UpUV4ZyWn25gpbNL_UTEg5ONL2gA:4
	a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Thu, 19 Feb 2009 17:58:05 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090220005805.GA5352@smtp.west.cox.net>
References: <1235086132-21843-1-git-send-email-clarson@kergoth.com>
	<20090219234114.GD22652@denix.org>
	<b6ebd0a50902191627x48e60175o8f3e20e0a0bf2104@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <b6ebd0a50902191627x48e60175o8f3e20e0a0bf2104@mail.gmail.com>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Cc: Chris Larson <clarson@mvista.com>
Subject: Re: [PATCH] bitbake.conf: rework FILESPATH generation.
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
X-List-Received-Date: Fri, 20 Feb 2009 01:00:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 19, 2009 at 05:27:34PM -0700, Chris Larson wrote:
[snip]
> My intent is to create a class to facilitate running make menuconfig
> on your kernel and busybox, and retain those changes.  Today, people
> either go into workdir and customize it there, but those changes are
> lost when you clean the package, or they overwrite files in the
> metadata repository, which can lead to conflicts, and is just all
> around more annoying to work with.  It's better to be able to have per
> build or site wide overrides of those files.

Playing the devils advocate here, conflicts make you go "Oh, I need to
see what happened", or at least should.  But so long as wherever this
gets documented emphasizes that people need to be aware what they're
doing (it's like setting up your own overlay, but not quite as
intensive) and need to keep an eye out when re-syncing with upstream, it
should certainly fix more headaches than it creates.

-- 
Tom Rini


