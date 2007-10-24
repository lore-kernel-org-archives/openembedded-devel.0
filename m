Received: from [64.233.166.179] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <dfarning@gmail.com>) id 1Ikipt-0008GC-AN
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Oct 2007 18:12:01 +0200
Received: by py-out-1112.google.com with SMTP id a25so231531pyi
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Oct 2007 09:04:43 -0700 (PDT)
Received: by 10.65.220.8 with SMTP id x8mr1576693qbq.1193240183974;
	Wed, 24 Oct 2007 08:36:23 -0700 (PDT)
Received: from lenovo ( [71.13.116.9])
	by mx.google.com with ESMTPS id q17sm563446qbq.2007.10.24.08.36.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 24 Oct 2007 08:36:23 -0700 (PDT)
Received: by lenovo (sSMTP sendmail emulation); Wed, 24 Oct 2007 10:36:21 -0500
Date: Wed, 24 Oct 2007 10:36:21 -0500
From: David Farning <dfarning@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20071024153620.GA6691@lenovo>
References: <20071024095844.GA9952@lenovo>
	<f96d234e0710240401o7fcdae32qc7d43ef162f38744@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <f96d234e0710240401o7fcdae32qc7d43ef162f38744@mail.gmail.com>
User-Agent: Mutt/1.5.15+20070412 (2007-04-11)
Subject: Re: [doc] defining OpenEmbedded
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
X-List-Received-Date: Wed, 24 Oct 2007 16:12:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 24, 2007 at 07:01:30AM -0400, Cliff Brake wrote:
> On 10/24/07, David Farning <dfarning@gmail.com> wrote:
> > Getting started is coming along nicely.
> 
> Great!
> 
> > In the second case referring to OE as a collection of metadata is
> > confusing.  Metadata is data about the data.  OE is actually a
> > collection of patches, task lists, and configuration files.  I was
> > wondering if it would be more clear to refer to oe as either a ruleset
> > or task lists.
> 
> The term metadistribution seems to be somewhat accepted:
> http://gentoo-wiki.com/Metadistribution
> 
> In the most basic sense, a bitbake recipe is data about data (the
> source that needs built), so I think the term fits. Just my opinion.

I like metadistribution.  Metadistribution is a term referring to an
adaptable system that is capable of building itself to the user's
specification.

But, using the defination at
http://en.wikipedia.org/wiki/Metadata
does not seems to apply.

Metadata is data is data which describes the data. ie
<zipcode>54494</zipcode>
<telephonenumber>123-1234</telephonenumber>

A recipe on the other hand define what ingredients to use.  Source
files, patches, configs.... Then states what tasks to perform on the
ingredients to create the desired result.  Binaries compiled for an arch,
added to a filesystem, bundled in an image.

Patches contain the changes necessary to make a general package work on a
particular device.

Classes are a more abstract form of recipe.

Machine.conf and Distro.conf provide a high level abstraction for the
developer to define what classes and recipes to call to create a
distribution with the desired characteristics.

Am I missing anything in this very high level description?

Thanks
David Farning


