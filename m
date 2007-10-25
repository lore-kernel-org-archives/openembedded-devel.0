Received: from [209.85.146.183] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <cliff.brake@gmail.com>) id 1IlBqU-0008AJ-Gi
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Oct 2007 01:10:36 +0200
Received: by wa-out-1112.google.com with SMTP id l24so897964waf
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Oct 2007 16:03:09 -0700 (PDT)
Received: by 10.115.77.1 with SMTP id e1mr2343193wal.1193333691071;
	Thu, 25 Oct 2007 10:34:51 -0700 (PDT)
Received: by 10.114.254.11 with HTTP; Thu, 25 Oct 2007 10:34:50 -0700 (PDT)
Message-ID: <f96d234e0710251034s488b9c13me8c4d9731638a94e@mail.gmail.com>
Date: Thu, 25 Oct 2007 13:34:51 -0400
From: "Cliff Brake" <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20071025121153.GA8231@lenovo>
MIME-Version: 1.0
References: <471FC1C0.4010103@linux.it> <20071025001926.GA14645@lenovo>
	<472047C3.20208@student.utwente.nl> <20071025121153.GA8231@lenovo>
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
X-List-Received-Date: Thu, 25 Oct 2007 23:10:39 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 10/25/07, David Farning <dfarning@gmail.com> wrote:
> On Thu, Oct 25, 2007 at 09:37:39AM +0200, Koen Kooi wrote:
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA1
> >
> > David Farning schreef:
> > Actually they aren't the same :)
> >
> > A bitbake file and a recipe are the same thing, but they produces a
> > package (.ipk, .deb, etc). That's why we have DEPENDS (for the recipe)
> > and RDEPENDS (for the package).
>
> At least on place in either the bitbake or oe manual, the stuff under
> the dev/packages/ is referred to as packages.
>
> In the bitbake help, the usage is show as $bitbake [option] [package].
> How can base-task of gpe-image be a package.
>
> I know this this sounds really picky;)

No, we need to be consistent -- this is a good exercise.  Perhaps
<oe>/packages should really be <oe>/recipes.

> But I am struggling over what to call the object of a bitebake.  (In
> make they are call targets .ie make all, but in the embedded world
> target is used to refer to the device for which you are building.)
>
> $bitbake vim
> $bitbake task-base
> $bitbake gpe-image
> $bitbake world
> A package, a task, an image, and world?

I suppose it depends -- saying that I'm "building a packages" is
technically correct as the ipk/deb is the output.  But, "bitbaking a
recipe" is probably more correct.

perhaps recipe -- that way it is very obvious what we are talking about.

Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com


