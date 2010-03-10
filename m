Received: from qw-out-1920.google.com ([74.125.92.146])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sakoman@gmail.com>) id 1NpPf6-0004QC-Ei
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Mar 2010 18:25:40 +0100
Received: by qw-out-1920.google.com with SMTP id 5so2244000qwc.36
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Mar 2010 09:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=qgsRLrInyiiztEtq2tmvFeBJIQZ0D1n+1zApHEO/JY8=;
	b=siJlJ6+DZfkYxIu2hx4KBCskzBo1a0LWTbKbzdli/jbxRhuimqrVudRU42k0TAKLvA
	DsoF/HRl2JZ7glLa1j/a9JitfoZxRM2T6cgGM1nAECrR1KW21ywdO1hOhT+/nGnXJ6t4
	QHVG7Z8Amaqb3TmSKcasZDN69VBHBnN15p/ZI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=itnVwOJcvPe+79+eXJI8wVTKuwrXwvTvW/MtXTMRu/LZAagF6Oj52u7kiy81hoIhP1
	gvWlcPsRbMRKLPCNaO+u8zS3Fj+pHT5ccnuL+OsXr+PTP22seHK9dz9ClATlgJ3tEDfU
	biioTmkek2Fr86/etg7Bicgkp0opULzE6uWQI=
MIME-Version: 1.0
Received: by 10.229.241.82 with SMTP id ld18mr1029475qcb.60.1268241759807; 
	Wed, 10 Mar 2010 09:22:39 -0800 (PST)
In-Reply-To: <1268159056.5437.2018.camel@lenovo.internal.reciva.com>
References: <E1NnJzb-0001K2-HM@melo.openembedded.org>
	<141020e31003052236w4afdcc26x1008a539f0491c9a@mail.gmail.com>
	<1267888617.11175.42.camel@rex> <20100309181656.GA19931@denix.org>
	<1268159056.5437.2018.camel@lenovo.internal.reciva.com>
Date: Wed, 10 Mar 2010 09:22:39 -0800
Message-ID: <5e088bd91003100922t9b6668fl577fdbafae53c82@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.92.146
X-SA-Exim-Mail-From: sakoman@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Phil Blundell : gtk+: build gtk-demo and package it appropriately
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
X-List-Received-Date: Wed, 10 Mar 2010 17:25:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 9, 2010 at 10:24 AM, Phil Blundell <philb@gnu.org> wrote:
> On Tue, 2010-03-09 at 13:16 -0500, Denys Dmytriyenko wrote:
>> So, what would be the proper fix? I'm blocked at the moment with this
>> gtk+/apple-red.png issue, where gtk+ is being pulled by gstreamer...
>> Thanks in advance for any help or suggestions.
>
> I think the patch that Graeme posted, or a subset of it, is at least
> part of the proper fix. =A0I'll check that in this evening. =A0With that,
> using gtk+ as the provider for gdk-pixbuf-csource-native ought to do
> what you need.

Prior to the above patch, gtk+ would build for me with no problems.
Afterwards I get:

| Making all in demos
| make[2]: Entering directory
`/home/sakoman/source/omap3-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gtk+-=
2.18.6-r8.3/gtk+-2.18.6/demos'
| /home/sakoman/source/omap3-oe/tmp/staging/i686-linux/usr/bin/gdk-pixbuf-c=
source
--raw --build-list		\
| 	        apple_red  ./apple-red.png	\
|                 gnome_foot ./gnome-foot.png	\
|         > test-inline-pixbufs.h				\
| 	|| (rm -f test-inline-pixbufs.h && false)
|
| (process:4835): GdkPixbuf-WARNING **: Cannot open pixbuf loader
module file '/home/sakoman/source/omap3-oe/tmp/staging/i686-linux/etc/gtk-2=
.0/gdk-pixbuf.loaders':
No such file or directory
| failed to load "./apple-red.png": Couldn't recognize the image file
format for file './apple-red.png'
| make[2]: *** [test-inline-pixbufs.h] Error 1

So for me it seems to have triggered the problem it was trying to fix!

Steve

> Getting the standalone g-p-c-n to DTRT will require a bit more fiddling
> but I don't think it should be very hard.
>
> p.
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


