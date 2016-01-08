Return-Path: <sjl@vctlabs.com>
X-Greylist: delayed 464 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 08 Jan 2016 10:15:31 UTC
Received: from dent.vctlabs.com (dent.vctlabs.com [68.183.110.161])
	by mail.openembedded.org (Postfix) with ESMTP id C8046731FB
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Jan 2016 10:15:31 +0000 (UTC)
Received: by dent.vctlabs.com (Postfix, from userid 1000)
	id 400F5280B45; Fri,  8 Jan 2016 02:06:57 -0800 (PST)
Date: Fri, 8 Jan 2016 02:06:57 -0800
From: "S. Lockwood-Childs" <sjl@vctlabs.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160108100657.GQ13572@vctlabs.com>
References: <568F8037.4050902@elfin.de>
	<CA+chaQfSnmR2MtpUvprHjDBFQ_6ifhA_cNtDW_ZzSY_H+NADjw@mail.gmail.com>
	<568F885F.2040206@elfin.de>
MIME-Version: 1.0
In-Reply-To: <568F885F.2040206@elfin.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: Unblacklisting package
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Jan 2016 10:15:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

No, because the image recipe isn't used when building individual
packages (unlike your local.conf file which is used with all
the recipes).

On Fri, Jan 08, 2016 at 10:58:55AM +0100, Piotr Lewicki wrote:
> Thank you.
> Can I do it in my image recipe?
> Once I added it to local.conf - it worked, but the same line in my image
> recipe - doesn't.
> 
> BR,
> Piotr Lewicki
> 
> On 08.01.2016 10:46, Martin Jansa wrote:
> >set it to empty value.
> >
> >On Fri, Jan 8, 2016 at 10:24 AM, Piotr Lewicki <piotr.lewicki@elfin.de>
> >wrote:
> >
> >>Dear Paul and oe-devel list,
> >>I've found as a part of this tread
> >>http://lists.openembedded.org/pipermail/openembedded-devel/2014-October/098410.html
> >>that you know how do "unblacklist" a package from my conf file.
> >>
> >>/You can still disable that PNBLACKLIST in your local.conf or distro.conf.
> >>>/
> >>>
> >>I was trying to find out how to disable it but my research failed.
> >>Could you share this knowledge with me?
> >>I'm trying to unblacklist modphp package.
> >>
> >>Best regards,
> >>Piotr Lewicki
> >>--
> >>_______________________________________________
> >>Openembedded-devel mailing list
> >>Openembedded-devel@lists.openembedded.org
> >>http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>
> 
> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

