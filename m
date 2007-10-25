Received: from [209.85.132.243] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <dfarning@gmail.com>) id 1Il3Bo-0004TE-Vc
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Oct 2007 15:56:01 +0200
Received: by an-out-0708.google.com with SMTP id c31so92299ana
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Oct 2007 06:48:37 -0700 (PDT)
Received: by 10.100.251.8 with SMTP id y8mr2337893anh.1193314318359;
	Thu, 25 Oct 2007 05:11:58 -0700 (PDT)
Received: from lenovo ( [75.121.171.134])
	by mx.google.com with ESMTPS id j4sm1617861nzd.2007.10.25.05.11.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 25 Oct 2007 05:11:57 -0700 (PDT)
Received: by lenovo (sSMTP sendmail emulation); Thu, 25 Oct 2007 07:11:53 -0500
Date: Thu, 25 Oct 2007 07:11:53 -0500
From: David Farning <dfarning@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20071025121153.GA8231@lenovo>
References: <471FC1C0.4010103@linux.it> <20071025001926.GA14645@lenovo>
	<472047C3.20208@student.utwente.nl>
MIME-Version: 1.0
In-Reply-To: <472047C3.20208@student.utwente.nl>
User-Agent: Mutt/1.5.15+20070412 (2007-04-11)
Subject: Re: getting started - docbook
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 25 Oct 2007 13:56:01 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 25, 2007 at 09:37:39AM +0200, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> David Farning schreef:
> Actually they aren't the same :)
> 
> A bitbake file and a recipe are the same thing, but they produces a
> package (.ipk, .deb, etc). That's why we have DEPENDS (for the recipe)
> and RDEPENDS (for the package).

At least on place in either the bitbake or oe manual, the stuff under
the dev/packages/ is referred to as packages.  

In the bitbake help, the usage is show as $bitbake [option] [package].
How can base-task of gpe-image be a package.

I know this this sounds really picky;)

But I am struggling over what to call the object of a bitebake.  (In
make they are call targets .ie make all, but in the embedded world
target is used to refer to the device for which you are building.)

$bitbake vim
$bitbake task-base
$bitbake gpe-image
$bitbake world

A package, a task, an image, and world?

thanks
David Farning


