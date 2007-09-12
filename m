Received: from [62.169.194.61] (helo=memova2.tellas.gr)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <skoroneos@digital-opsis.com>) id 1IVLEw-0006aO-RA
	for openembedded-devel@openembedded.org; Wed, 12 Sep 2007 07:58:19 +0200
Received: from dias (62.169.211.226) by memova2.tellas.gr (7.3.118.8)
	id 4638635B02FD90ED for openembedded-devel@openembedded.org;
	Wed, 12 Sep 2007 07:54:01 +0200
From: "Stelios Koroneos" <skoroneos@digital-opsis.com>
To: <openembedded-devel@openembedded.org>
Date: Wed, 12 Sep 2007 08:55:08 +0300
Message-ID: <HOECLKEKOHLAMMGDLLBHOENOMDAA.skoroneos@digital-opsis.com>
MIME-Version: 1.0
X-Priority: 3 (Normal)
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook IMO, Build 9.0.2416 (9.0.2911.0)
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.3138
In-Reply-To: <46E7171B.7A0533BA@vollmann.ch>
Importance: Normal
Subject: Re: Cached MD5 sums
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
X-List-Received-Date: Wed, 12 Sep 2007 05:58:19 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

We had a similar problem when the sources resided in an nfs mount.
Is this the case with your sourse/md5 files ?

If yes you need to have statd running on *both* client and server machines
In debian/ubuntu just install the nfs-common package and it solves the issue

Stelios S. Koroneos

Digital OPSiS - Embedded Intelligence
http://www.digital-opsis.com


> -----Original Message-----
> From: openembedded-devel-bounces@openembedded.org
> [mailto:openembedded-devel-bounces@openembedded.org]On Behalf Of
> Detlef Vollmann
> Sent: Wednesday, September 12, 2007 1:31 AM
> To: openembedded-devel@openembedded.org
> Subject: [oe] Cached MD5 sums
>
>
> Hello,
>
> while trying to build a number of packages, I now got twice
> errors about MD5 sums.  Even after a new download bitbake
> still complained and insisted that some MD5 sum is required
> of which I have no idea where it comes from (definitely
> not from the accompanying .md5 file in DL_DIR, which
> contained the correct MD5 sum).
>
> So I assume that bitbake has in its cache some old MD5 sums
> from broken downloads, but I have no idea how to delete those.
>
> Any ideas?
>
>   Detlef
>
> --
> Detlef Vollmann   vollmann engineering gmbh
> Linux and C++ for Embedded Systems    http://www.vollmann.ch/
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>




