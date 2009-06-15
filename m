Received: from [93.97.175.187] (helo=dan.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1MG7Qc-0002G3-VO
	for openembedded-devel@openembedded.org; Mon, 15 Jun 2009 10:20:31 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	n5F89r0b027625; Mon, 15 Jun 2009 09:09:53 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id C+zAuk3RJcVm; Mon, 15 Jun 2009 09:09:53 +0100 (BST)
Received: from [192.168.1.3] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	n5F89ikN027452
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Mon, 15 Jun 2009 09:09:47 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <1244924378.29153.12.camel@lenovo.internal.reciva.com>
References: <1244924378.29153.12.camel@lenovo.internal.reciva.com>
Date: Mon, 15 Jun 2009 09:08:44 +0100
Message-Id: <1245053324.5971.0.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Cc: Jeremy =?ISO-8859-1?Q?Lain=E9?= <jeremy.laine@m4x.org>
Subject: Re: lib*.so in FILES_${PN}
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
X-List-Received-Date: Mon, 15 Jun 2009 08:20:31 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, 2009-06-13 at 21:19 +0100, Phil Blundell wrote:
> This recent checkin:
> 
> http://cgit.openembedded.net/cgit.cgi?url=openembedded/commit/&id=ba434bd1dc9dc8ed61953a1579ea9e993e81cbb2
> 
> added ${base_libdir}/lib*.so to the default FILES_${PN}, on the grounds
> that this is necessary to get procps packaged correctly.
> 
> However, I think this cure is worse than the original disease, in that
> it's now virtually impossible to prevent *.so development symlinks
> (which obviously belong in ${PN}-dev) from leaking into ${PN}.  This
> situation is particularly bad if ${base_libdir} and ${libdir} are the
> same, since you then end up with a useless .so symlink being installed
> in your rootfs for virtually every library on the system.
> 
> I propose to revert the patch in question, and instead just let
> procps.bb adjust its own local setting of FILES as necessary.
> 
> Comments?

Agreed, that shouldn't be a default.

Richard



