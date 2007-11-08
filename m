Received: from [66.249.90.181] (helo=ik-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <dfarning@gmail.com>) id 1Iq96K-00085Z-Dx
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Nov 2007 16:15:24 +0100
Received: by ik-out-1112.google.com with SMTP id c30so103516ika
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Nov 2007 07:14:25 -0800 (PST)
Received: by 10.150.177.20 with SMTP id z20mr60432ybe.1194528374850;
	Thu, 08 Nov 2007 05:26:14 -0800 (PST)
Received: from lenovo ( [75.121.174.189])
	by mx.google.com with ESMTPS id 15sm680704nzn.2007.11.08.05.26.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 08 Nov 2007 05:26:13 -0800 (PST)
Received: by lenovo (sSMTP sendmail emulation); Thu, 08 Nov 2007 07:26:06 -0600
Date: Thu, 8 Nov 2007 07:26:06 -0600
From: David Farning <dfarning@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20071108132605.GA6591@lenovo>
References: <20071107195845.GA1583@lenovo>
	<b6ebd0a50711071945ye0413b8rbae1f933b63903cf@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <b6ebd0a50711071945ye0413b8rbae1f933b63903cf@mail.gmail.com>
User-Agent: Mutt/1.5.15+20070412 (2007-04-11)
Subject: Re: naming tasks
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
X-List-Received-Date: Thu, 08 Nov 2007 15:15:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 07, 2007 at 08:45:03PM -0700, Chris Larson wrote:
> "EXPORT_FUNCTIONS do_patch" in patch.bbclass just makes do_patch ->
> patch_do_patch.  That way you can override the do_patch function and
> call back to the patch.bbclass do_patch (patch_do_patch) manually if
> need be, but if you don't, do_patch is still defined.
> EXPORT_FUNCTIONS was just a convenience.

That make sense.  Introducing modularity through namespaces.

Thanks
David Farning

> 
> On Nov 7, 2007 12:58 PM, David Farning <dfarning@gmail.com> wrote:
> > Still working on the manual!
> >
> > I've come across a question on how tasks are named.  What is the
> > purpose of the prefix patch in the def patch_do_patch found in
> > the patch class?  Most task seems to be called do_taskname.
> > I am thinking that it has something to do with
> > scope but I am unsure.
> >
> > addtask refers to do_patch and
> > EXPORT_FUNCTIONS refers to do_patch
> >
> > Thanks
> > David
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
> 
> 
> 
> -- 
> Chris Larson - clarson at kergoth dot com
> Dedicated Engineer - MontaVista - clarson at mvista dot com
> Core Developer/Architect - TSLib, BitBake, OpenEmbedded, OpenZaurus
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


