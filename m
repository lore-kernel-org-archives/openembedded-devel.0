Received: from [209.85.220.224] (helo=mail-fx0-f224.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stuart68@gmail.com>) id 1Meng1-0004NP-Lu
	for openembedded-devel@lists.openembedded.org;
	Sat, 22 Aug 2009 12:18:26 +0200
Received: by fxm24 with SMTP id 24so736465fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Aug 2009 03:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=XaP4vqt5qDoONbTt+LjmFJNXwIcmQhIispsMXOoR2WA=;
	b=eOyb9kuxe7cszYfw+0GoExfQCg03dLH0qecwguO8/KbvOlZU6hDPYpdVGRweE7LJ+s
	Ai0WdQYCQCHuG/0Z5AuvEwhnrwBcLxdr/rx6yVOfgd2rpL0vHGsUTGvLz4gvQzJPk+9r
	kRUfKxGUAN4E4Qr0AbU+pvjrP3BQCKOr3rARc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=Cn4m5PmAMkUCHeH2iC9xuw7HM4g03zg2faoakvfFKNx0CoaN/0it5MmH4uc+Y7PHC2
	okmQheIA/pHRdLmD5NwV1N36tgn/ewGADm0yATJO8NxADyS7+POz2iwvmBIQXONtvYJh
	6W4pj051sjyZG74dFwB6OU5e1UcQ+63qvvqGU=
MIME-Version: 1.0
Received: by 10.102.226.17 with SMTP id y17mr894154mug.67.1250935254425; Sat, 
	22 Aug 2009 03:00:54 -0700 (PDT)
Date: Sat, 22 Aug 2009 11:00:54 +0100
Message-ID: <91283b620908220300u6770aaebo7aa89b1b1b91e2fd@mail.gmail.com>
From: Stuart Gray <stuart68@gmail.com>
To: "General mailing list for gumstix users."
	<gumstix-users@lists.sourceforge.net>, 
	openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Musicbrainz
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
X-List-Received-Date: Sat, 22 Aug 2009 10:18:27 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

hi,

Has any one successfully compiled libmusicbrainz_3.0.2.

I have this compiling but it fails at the linking stage as it cannot find
the library libstdc++.so.6.

I have tried various EXTRA_OEMAKE, OECONF, OECMAKE, but none will add the
option to the linking stage. Can anyone give me some pointers.


|
/home/stuart/overo-oe/tmp/cross/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/../../../../arm-angstrom-linux-gnueabi/bin/ld:
warning: libstdc++.so.6, needed by ../src/libmusicbrainz3.so.6.2.0, not
found (try using -rpath or -rpath-link)
| ../src/libmusicbrainz3.so.6.2.0: undefined reference to
`__cxa_allocate_exception@CXXABI_1.3'
| ../src/libmusicbrainz3.so.6.2.0: undefined reference to
`__gnu_cxx::__exchange_and_add(int volatile*, int)@GLIBCXX_3.4'
| ../src/libmusicbrainz3.so.6.2.0: undefined reference to
`std::basic_string<char, std::char_traits<char>, std::allocator<char>
>::rfind(char, unsigned int) const@GLIBCXX_3.4'
| ../src/libmusicbrainz3.so.6.2.0: undefined reference to
`std::basic_string<char, std::char_traits<char>, std::allocator<char>
>::assign(std::basic_string<char, std::char_traits<char>,
std::allocator<char> > const&)@GLIBCXX_3.4'


I thoungth this should the place where I could add the linrary

oe_soinstall() {
    # Purpose: Install shared library file and
    #          create the necessary links
    # Example:
    #
    # oe_
    #
    #oenote installing shared library $1 to $2
    #
    libname=`basename $1`
    install -m 755 $1 $2/$libname
    sonamelink=`arm-angstrom-linux-gnueabi-readelf -d $1 |grep 'Library
soname:' |sed -e 's/.*\[\(.*\)\].*/\1/'`
    solink=`echo $libname | sed -e 's/\.so\..*/.so/'`
    ln -sf $libname $2/$sonamelink
    ln -sf $libname $2/$solink

}

Please let me know if this is the correct way to proceed.

Thanks,
Stuart

