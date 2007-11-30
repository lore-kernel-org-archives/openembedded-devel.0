Received: from [209.85.146.183] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <papercrane@gmail.com>) id 1Iy8fn-0000uv-0r
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Nov 2007 17:25:04 +0100
Received: by wa-out-1112.google.com with SMTP id l24so3062138waf
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Nov 2007 08:21:51 -0800 (PST)
Received: by 10.114.200.2 with SMTP id x2mr341780waf.1196439711338;
	Fri, 30 Nov 2007 08:21:51 -0800 (PST)
Received: by 10.115.92.17 with HTTP; Fri, 30 Nov 2007 08:21:51 -0800 (PST)
Message-ID: <432beae0711300821n2783416n645bcefecfbef4d@mail.gmail.com>
Date: Fri, 30 Nov 2007 08:21:51 -0800
From: "Justin Patrin" <papercrane@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <f96d234e0711300615kb15b49bif5d815156f3b12c3@mail.gmail.com>
MIME-Version: 1.0
References: <f96d234e0711300615kb15b49bif5d815156f3b12c3@mail.gmail.com>
Subject: Re: creating ipks for all package dependencies
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
X-List-Received-Date: Fri, 30 Nov 2007 16:25:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Nov 30, 2007 6:15 AM, Cliff Brake <cliff.brake@gmail.com> wrote:
> I recently ran into an issue where I bitbake'd subversion.  I then
> tried to install subversion from an ipkg feed, and ipkg complained
> about dependencies not being available (neon, etc).  It turns out that
> bitbake does not run the do_package_write_ipk task due to recent
> corrections in the way dependencies are handled, so the ipks for
> subversion dependencies where not in the feeds.  Richard suggested
> merging a task from poky that forces all ipk files to be generated.
> It has not been merged in OE, and to use do the following:
>
> bitbake <your recipe> -c buildall
>
> This will force ipks for all dependencies of <your recipe> to be built
> as well as the package you are building.
>

This really sounds like a bug to me....why would bitbake not build the
ipks for runtime dependencies of a package?

-- 
Justin Patrin


