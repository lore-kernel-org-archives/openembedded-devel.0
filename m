Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1OD2Ny-0007wp-Jx
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 May 2010 23:25:35 +0200
Received: by gwb17 with SMTP id 17so877690gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 May 2010 14:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=QH5cJaP/HeUrSMrgiBaqhIEhjZTZ4xZIlO6GDdHgC5Y=;
	b=Sfkk4dffGbwfGsxmTSUiks+yv9lyKHT4NmpccZyMLnDdzqo62liN4HNMfdi1m1Nd55
	gut3boLupbnXMuUrdUwbFEw8lhElpmLTWRCJA+MyJCgUHvl8sEDbiSWqCJG1RaWr+cSg
	GTFINvDuwchRC3hA1GkpsIkayxUxf/lix9fCs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=i0iJ3ADWx0Vqo3G1GiJ8LLefDrDeDy6uPkURP162LdTcz2rYsagZIeeyMXmiNfz7Ep
	8jeyfgWb4CQ0+IC6PYv1kztQ35eP5xL7ldOsFAf3GDE4yFD4HbbgAVSLxsjWk+MtjJHd
	2W9JG8QY4kLHF+kFdlqYyYg6dBE02qnSawbws=
MIME-Version: 1.0
Received: by 10.100.246.9 with SMTP id t9mr1883656anh.3.1273872097509; Fri, 14 
	May 2010 14:21:37 -0700 (PDT)
Received: by 10.100.108.2 with HTTP; Fri, 14 May 2010 14:21:37 -0700 (PDT)
In-Reply-To: <1273859746.22943.454.camel@trini-m4400>
References: <AANLkTil89_7H3CIZOSZd9QjKE-Cf6mv5B7xpFCqaM8oM@mail.gmail.com>
	<1273859746.22943.454.camel@trini-m4400>
Date: Fri, 14 May 2010 23:21:37 +0200
Message-ID: <AANLkTimDt7fVT14jNofov1ESwO2M_CvBAe6RsdvzZicE@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Issues with parallel build? (Was: gtk+native missing dep ?)
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
X-List-Received-Date: Fri, 14 May 2010 21:25:35 -0000
Content-Type: text/plain; charset=ISO-8859-1

> With DISTRO= ?  I do most of my builds with 4 and haven't seen this.
> But with a failure log on gtk+-native, figuring out the missing dep
> shouldn't be too bad.

FWIW distro is Angstrom, devel branch.

DEPENDS_virtclass-native = "libpng-native atk-native pango-native
cairo-native libxrender-native libxext-native"

It's not a problem of missing deps, I suppose, because

PARALLEL_MAKE = "-j5"
#BB_NUMBER_THREADS = "4"
BB_NUMBER_THREADS = "2"
fixed the things. This time the dependencies were (correctly) built before.

Short resume:

i repeatdly see (Angstrom) console-image failing *from scratch*
because gtk+native do_compile errors out with:

 Cannot load module
/oe/build/tmp/work/i686-linux/gtk+-native-2.20.0-r8.0/gtk+-2.20.0/modules/input/im-xim.la:
/oe/build/tmp/work/i686-linux/gtk+-native-2.20.0-r8.0/gtk+-2.20.0/mo
dules/input/.libs/im-xim.so: undefined symbol: g_realloc_n
| /oe/build/tmp/work/i686-linux/gtk+-native-2.20.0-r8.0/gtk+-2.20.0/modules/input/im-xim.la
does not export GTK+ IM module API:
/oe/build/tmp/work/i686-linux/gtk+-native-2.20.0-r8.0

g_realloc_n is defined in glib-2.0

I've inspected the workdir and I've noticed  "atk-native"  and
"pango-native" builds were not finished when gt+-native broke.
Both atk-native and pango-native (and cairo-native, which was built)
have glib-2 as explicit dependency, so something seems wrong...

Regards
Andrea


