Received: from [62.169.194.61] (helo=memova2.tellas.gr)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <skoroneos@digital-opsis.com>) id 1IlMeC-0000F6-D7
	for openembedded-devel@openembedded.org; Fri, 26 Oct 2007 12:42:36 +0200
Received: from dias (62.169.211.226) by memova2.tellas.gr (7.3.118.8)
	id 4638635B04984C56 for openembedded-devel@openembedded.org;
	Fri, 26 Oct 2007 12:33:52 +0200
From: "Stelios Koroneos" <skoroneos@digital-opsis.com>
To: <openembedded-devel@openembedded.org>
Date: Fri, 26 Oct 2007 13:35:09 +0300
Message-ID: <HOECLKEKOHLAMMGDLLBHGEEKMKAA.skoroneos@digital-opsis.com>
MIME-Version: 1.0
X-Priority: 3 (Normal)
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook IMO, Build 9.0.2416 (9.0.2911.0)
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.3138
In-Reply-To: <20071025120035.49703327@cimmeria>
Importance: Normal
Subject: Re: Kernel Packages/Modules and Versioning
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
X-List-Received-Date: Fri, 26 Oct 2007 10:42:36 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

> This I feel is not a good idea for mobile system that can have package
> upgrades in the field. It is my feeling that kernel modules/images
> should never upgrade without attendance from the user.
>

Not all devices that use OE are mobile :)

> On reason for this is to make sure user is plugged into sufficient
> power and has facilities to fix device before doing such a drastic
> upgrade.

Well in that case it should be the device that should allow/disallow the
user from updating in general.
Its the only point where you can have this kind of information and be
accurate

My 2 cents are that it should be left generic and device specific issues
could be handled by a modified ipkg tool probably

Stelios S. Koroneos

Digital OPSiS - Embedded Intelligence
http://www.digital-opsis.com


> -----Original Message-----
> From: openembedded-devel-bounces@openembedded.org
> [mailto:openembedded-devel-bounces@openembedded.org]On Behalf Of
> Graeme Gregory
> Sent: Thursday, October 25, 2007 2:01 PM
> To: openembedded-devel@openembedded.org
> Subject: [oe] Kernel Packages/Modules and Versioning
>
>
> Hi, writing this with my OpenMoko hat on.
>
> Currently kernel modules create packages with names of the form
>
> kernel-module-umaga_${PV}-${PR}.ipk
>
>
> I would like to suggest all kernel packages are actually packaged as
>
> kernel-module-umaga-${PV}_${RELEASE_NO}-${PV}.ipk
>
> and that a kernel-updater is developed to guide user through kernel
> upgrades with less danger of broken devices at the end.
>
> Obviously some policy would be needed so that ${RELEASE_NO}-${PV} is
> guaranteed to load on all kernel-image-${PV} kernels.
>
> Anyway I thought I would expose this to the wider audience for more
> comments than just openmoko lists. I know this is suitable for all
> devices so Id like opinions.
>
> Graeme
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>




