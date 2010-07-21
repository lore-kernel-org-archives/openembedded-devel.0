Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1ObYNQ-0001LZ-GK
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Jul 2010 14:26:26 +0200
Received: by bwz10 with SMTP id 10so123796bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Jul 2010 05:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=+8s8Js1ZUj8H6NhtbX+iv5xHjXquFv3xZZ4NIv4YbYo=;
	b=O2U7SajEcCq2V5RXKVf/THsVoBAnWfeR0pusBE/7A46E5aWsUYZpE8f+xW/rFnyWpn
	q3uEUKCzHTB6L+PzkIkqWhgEF5jNFjaKENziJoAmvhfc4zVPYchc5a/5qIOkSvSRiIjd
	fePa+sQ7JVBEkXzk6bN+v7CiV8hSB9N32OA3o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=D4wjGbeB8WmyPNq6pBjW5AVJeo8sP+O3p+lhbvfwoglFSxx8nIIQg2J02HkAZSQHek
	PLbmK6LL/V8nvHtQLYP7kFLZQm0fRTiY8+duklUrs1/aKpeUVf0q7vphLVF4k2gQAEBn
	uj5G7/8Qqy0XQ1TwHAfpcbYhO8itVitFJRE3M=
MIME-Version: 1.0
Received: by 10.204.135.214 with SMTP id o22mr85257bkt.56.1279715170633; Wed, 
	21 Jul 2010 05:26:10 -0700 (PDT)
Received: by 10.204.60.208 with HTTP; Wed, 21 Jul 2010 05:26:10 -0700 (PDT)
In-Reply-To: <i26ku8$3cu$1@dough.gmane.org>
References: <i26ku8$3cu$1@dough.gmane.org>
Date: Wed, 21 Jul 2010 14:26:10 +0200
Message-ID: <AANLkTimK0WRNk0i26nYcZW4wWms8SUwne06nGjnXw5zN@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: legacy staging
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
X-List-Received-Date: Wed, 21 Jul 2010 12:26:28 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/7/21 Koen Kooi <k.kooi@student.utwente.nl>

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Hi,
>
> I built only a small sample of packages (angstrom-gnome-image and
> openjdk) and I get these 53 in legagy-staging.log:
>
> bcel/bcel_5.2.bb
> cacao/cacaoh-native_0.99.3.bb
> classpath/classpath-tools-native.bb
> classpath/classpath_0.98.bb
> cup/cup_0.10k.bb
> dbus/dbus-glib-native_0.76.bb
> gawk/gawk-native_3.1.4.bb
> gdbm/gdbm-native_1.8.3.bb
> gdbm/gdbm_1.8.3.bb
> glib-1.2/glib-1.2-native_1.2.10.bb
> gnome/gconf-native_2.6.1.bb
> gnome/pyorbit_2.24.0.bb
> gtk+/gtk+-1.2_1.2.10.bb
> guile/guile_1.8.7.bb
> intltool/intltool_0.40.3.bb
> jakarta-libs/regexp_1.5.bb
> jamvm/jamvm-initial_1.4.5.bb
> jlex/jlex_1.2.6.bb
> libffi/libffi-native_2.0+gcc4.3.2.bb
> libffi/libffi_3.0.8.bb
> libfribidi/libfribidi-native_0.10.4.bb
> libglade/libglade_2.6.4.bb
> libgsm/libgsm_1.0.12.bb
> libtool/libtool-cross_2.2.6b.bb
> libtool/libtool_2.2.6b.bb
> llvm/llvm2.7-native_2.7.bb
> llvm/llvm2.7_2.7.bb
> makedevs/makedevs-native_1.0.0.bb
> mml-widget/gtkmathview_0.8.0.bb
> mozilla/rhino_1.7r1.bb
> mpeg2dec/mpeg2dec_0.4.0b.bb
> mysql/mysql5-native_5.1.40.bb
> mysql/mysql5_5.1.40.bb
> openjdk/openjdk-6_6b18-1.8.bb
> openobex/openobex_1.5.bb
> perl/libnet-dbus-perl_0.33.6.bb
> perl/libxml-parser-perl_2.36.bb
> perl/libxml-simple-perl_2.18.bb
> perl/libxml-twig-perl_3.33.bb
> perl/perl_5.8.8.bb
> python/python-docutils-native_0.5.bb
> python/python_2.6.4.bb
> samba/samba_3.3.9.bb
> squashfs-tools/squashfs-tools-native_4.0.bb
> tcltk/tcl-native_8.4.19.bb
> tzcode/tzcode-native_2010j.bb
> u-boot/u-boot_git.bb
> xalan-j/xalan-j_2.7.1.bb
> xerces-j/xerces-j_2.9.1.bb
> xml-commons/jaxp1.3_1.3.04.bb
> xml-commons/xml-commons-resolver1.1_1.2.bb
> xorg-font/font-util-native_1.1.1.bb
> xorg-proto/calibrateproto_git.bb
>
>
> regards,
>
> Koen
>

What do you want to say with this list?
I did a grep for do_stage and found 1119 recipes that still have a do_stage
function.
In my opinion all of these should be updated or removed (where for old
recipes that are not pinned I have a strong preference for removing).

Ideally in the end we should be able to remove the do_stage invocation from
the build machinery (and if there are one or two recipes where it is
unavoidable they could add it as a private task)

I browsed the list to see if there was anything I created and/or felt
responsible for.
The only thing I could come up with is perl/libxml-twig-perl_3.33.bb which I
created for mythtv.
I've peeked into it and it has no do_stage, but it inherits cpan and
cpan.bbclass contains a cpan_do_stage function.
My guesspectation is that in cpan.bbclass the function cpan_do_stage can go
together with the test in cpan_do_install, but I have not enough knowledge
of our build machinery or perl & cpan to be sure enough to remove it.

Frans.

BTW: the observation with libxml-twig-perl shows that the actual # of
recipes that has legacy staging is even greater than the 1119 I mentoned.
The good news is that fixing things like cpan.bbclass fixes a lot of them at
once.

