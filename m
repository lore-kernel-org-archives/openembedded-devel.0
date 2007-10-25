Received: from [80.68.91.202] (helo=xora.org.uk)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <dp@xora.org.uk>) id 1Il0Z7-0008RS-8N
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Oct 2007 13:07:53 +0200
Received: from cimmeria ([::ffff:78.86.130.156])
	(AUTH: LOGIN dp, SSL: TLSv1/SSLv3,256bits,AES256-SHA)
	by xora.org.uk with esmtp; Thu, 25 Oct 2007 12:00:31 +0100
	id 0006856B.4720774F.000070A5
Date: Thu, 25 Oct 2007 12:00:35 +0100
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20071025120035.49703327@cimmeria>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.0; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Subject: Kernel Packages/Modules and Versioning
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
X-List-Received-Date: Thu, 25 Oct 2007 11:07:53 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi, writing this with my OpenMoko hat on.

Currently kernel modules create packages with names of the form

kernel-module-umaga_${PV}-${PR}.ipk

This I feel is not a good idea for mobile system that can have package
upgrades in the field. It is my feeling that kernel modules/images
should never upgrade without attendance from the user.

On reason for this is to make sure user is plugged into sufficient
power and has facilities to fix device before doing such a drastic
upgrade.

I would like to suggest all kernel packages are actually packaged as

kernel-module-umaga-${PV}_${RELEASE_NO}-${PV}.ipk

and that a kernel-updater is developed to guide user through kernel
upgrades with less danger of broken devices at the end.

Obviously some policy would be needed so that ${RELEASE_NO}-${PV} is
guaranteed to load on all kernel-image-${PV} kernels.

Anyway I thought I would expose this to the wider audience for more
comments than just openmoko lists. I know this is suitable for all
devices so Id like opinions.

Graeme


