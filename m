Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PzX4z-0001e7-QP
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Mar 2011 17:26:42 +0100
Received: by fxm19 with SMTP id 19so720970fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Mar 2011 09:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=jkZ/FvcwlNSW4HkSWd0sz5KO+kOFppZDWV7fwjIh4eA=;
	b=iWJacKu/RvPqfEZ73Il6wqm1R9/ip4c/eGNc11/Kfj4wYhsZymxCvbTBXoS6v2ir1A
	exbiL/9j9VJMWZSYgxHXn4n6ATX3SCQbXCiKdSvJ75s3A9BG6PvdFZHcWIncuG/6NWJV
	MZqlRlAcTgfEAXFSCj4TPlaXTDb6fjXCzcr0A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=YGwSnGQTIB9Bpti7kh3ig3XmlWO+ucIhm+3UgQFFazInFr51qqv7y4Yb88HMRCqdkF
	qJ8Q4pN43rChXIcgxAX+mHrzQydzFm7vx7F/7hMxgxSHqW4lXFeFgVFpphdDzT+Mk30s
	Gb90wd/C/zZpkQZXUkw/eDPcShiiKWjwF+xZE=
Received: by 10.223.77.16 with SMTP id e16mr1166034fak.87.1300206189112; Tue,
	15 Mar 2011 09:23:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.41.89 with HTTP; Tue, 15 Mar 2011 09:22:17 -0700 (PDT)
In-Reply-To: <1300194647.3759.256.camel@mattotaupa>
References: <1300194647.3759.256.camel@mattotaupa>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 15 Mar 2011 09:22:17 -0700
Message-ID: <AANLkTi=-9cukS2AG7Dtdnusvvggt5PLvELkK2CcWZ+nO@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Paul Menzel <paulepanter@users.sourceforge.net>
Subject: Re: pygtksourceview-2.10.1: task compile fails, because $(srcdir) not substituted with staging directory
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
X-List-Received-Date: Tue, 15 Mar 2011 16:26:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 15, 2011 at 6:10 AM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> Dear OE folks,
>
>
> task compile of `pygtksourceview-2.10.1.bb` fails with the following
> error.
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0+ do_compile
> =C2=A0 =C2=A0 =C2=A0 =C2=A0+ base_do_compile
> =C2=A0 =C2=A0 =C2=A0 =C2=A0+ '[' -e Makefile -o -e makefile -o -e GNUmake=
file ']'
> =C2=A0 =C2=A0 =C2=A0 =C2=A0+ oe_runmake
> =C2=A0 =C2=A0 =C2=A0 =C2=A0+ oenote make -j4
> =C2=A0 =C2=A0 =C2=A0 =C2=A0+ echo NOTE: 'make -j4'
> =C2=A0 =C2=A0 =C2=A0 =C2=A0NOTE: make -j4
> =C2=A0 =C2=A0 =C2=A0 =C2=A0+ make -j4
> =C2=A0 =C2=A0 =C2=A0 =C2=A0make =C2=A0all-recursive
> =C2=A0 =C2=A0 =C2=A0 =C2=A0make[1]: Entering directory `/oe/build-angstro=
m-next/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/python-pygtksourcevi=
ew-2.10.1-r0/pygtksourceview-2.10.1'
> =C2=A0 =C2=A0 =C2=A0 =C2=A0Making all in test
> =C2=A0 =C2=A0 =C2=A0 =C2=A0make[2]: Entering directory `/oe/build-angstro=
m-next/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/python-pygtksourcevi=
ew-2.10.1-r0/pygtksourceview-2.10.1/test'
> =C2=A0 =C2=A0 =C2=A0 =C2=A0make[2]: Nothing to be done for `all'.
> =C2=A0 =C2=A0 =C2=A0 =C2=A0make[2]: Leaving directory `/oe/build-angstrom=
-next/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/python-pygtksourcevie=
w-2.10.1-r0/pygtksourceview-2.10.1/test'
> =C2=A0 =C2=A0 =C2=A0 =C2=A0Making all in docs
> =C2=A0 =C2=A0 =C2=A0 =C2=A0make[2]: Entering directory `/oe/build-angstro=
m-next/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/python-pygtksourcevi=
ew-2.10.1-r0/pygtksourceview-2.10.1/docs'
> =C2=A0 =C2=A0 =C2=A0 =C2=A0/oe/build-angstrom-next/angstrom-dev/sysroots/=
i686-linux/usr/bin/python -c 'import datetime; print datetime.date.today()'=
 > reference/builddate.xml
> =C2=A0 =C2=A0 =C2=A0 =C2=A0/oe/build-angstrom-next/angstrom-dev/sysroots/=
i686-linux/usr/bin/xsltproc --nonet --xinclude -o ../docs/html/ \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 --path ../docs/reference:./reference \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 --stringparam gtkdoc.bookname "pygtksourceview2" \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 --stringparam gtkdoc.version . \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 /usr/share/pygobject/xsl/ref-html-style.xsl ./reference/gtksourc=
eview2-ref.xml
> =C2=A0 =C2=A0 =C2=A0 =C2=A0warning: failed to load external entity "/usr/=
share/pygobject/xsl/ref-html-style.xsl"
> =C2=A0 =C2=A0 =C2=A0 =C2=A0cannot parse /usr/share/pygobject/xsl/ref-html=
-style.xsl
> =C2=A0 =C2=A0 =C2=A0 =C2=A0make[2]: *** [build_stamp] Error 4
> =C2=A0 =C2=A0 =C2=A0 =C2=A0make[2]: Leaving directory `/oe/build-angstrom=
-next/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/python-pygtksourcevie=
w-2.10.1-r0/pygtksourceview-2.10.1/docs'
> =C2=A0 =C2=A0 =C2=A0 =C2=A0make[1]: *** [all-recursive] Error 1
> =C2=A0 =C2=A0 =C2=A0 =C2=A0make[1]: Leaving directory `/oe/build-angstrom=
-next/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/python-pygtksourcevie=
w-2.10.1-r0/pygtksourceview-2.10.1'
> =C2=A0 =C2=A0 =C2=A0 =C2=A0make: *** [all] Error 2
> =C2=A0 =C2=A0 =C2=A0 =C2=A0+ die 'oe_runmake failed'
>
> Apparently in
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0$ more docs/Makefile.am
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[=E2=80=A6]
> =C2=A0 =C2=A0 =C2=A0 =C2=A0build_stamp: $(REFERENCE_DEPS)reference/buildd=
ate.xml
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xsltproc --nonet -=
-xinclude -o $(BUILDDIR)/html/ \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 --path $(BUILDDIR)/reference:$(srcdir)/reference \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 --stringparam gtkdoc.bookname "pygtksourceview2" \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 --stringparam gtkdoc.version ${REF_VERSION} \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 $(HTML_STYLE) $(srcdir)/reference/gtksourceview2-ref.xml
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(PYGOBJECT_FIXXRE=
F) -i $(PYGOBJECT_PYGDOCS) $(BUILDDIR)/html
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0touch $@
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[=E2=80=A6]
>
> `$(srcdir)` is not set to the staging directory.
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0angstrom-dev/work/armv7a-angstrom-linux-gnueab=
i/python-pygtksourceview-2.10.1-r0/pygtksourceview-2.10.1/Makefile:srcdir =
=3D .
>
> How is that dealt with in OE? Or should something else be used in
> `Makefile.am`?
>


EXTRA_OEMAKE +=3D "srcdir=3D${S}" or something like that might help may be
it needs a dir below $S
>
> Thanks,
>
> Paul
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


