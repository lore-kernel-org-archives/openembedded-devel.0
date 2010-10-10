Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1P50Nm-0004ll-U7
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Oct 2010 20:12:28 +0200
Received: by wyf23 with SMTP id 23so2191879wyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Oct 2010 11:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=gAjvrMRbYoihK6W4oNenFVtcfjlEB/qa17KGAo/pA5A=;
	b=bzQ4H4hTiVMtprKQOb8j3E1EdZ3gQYqaSj84H9lMHF4TjycwA+wH23Y/+7tWgTLD6x
	ui2Ie8IXoF1rZd6nBE/4IDgUQu1DKtsErPz+QfsMitm7OK/gnmCFLZQ9EcvZibZlyBw/
	ydCGGIXVK6tuTrTPAoi38FCUVIh2Ww3VhTKjY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=N847VMKw4dsR7bewfL1khmf1FN4bty+dHbf1SQKFFl+ger6akbe4bs4HLXZ8iaodtk
	HDLUfVAIJrD5XNqjDBvjTDOaeYdNOTb5FEFAZlXsyDQbkEefOrFIjGid45MEUXvKYTLt
	kOJjus8eQrPwFU8uP7oe48ynFjFHpP2kgc+mE=
Received: by 10.216.185.4 with SMTP id t4mr4620896wem.87.1286734321036; Sun,
	10 Oct 2010 11:12:01 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.0.142 with HTTP; Sun, 10 Oct 2010 11:11:40 -0700 (PDT)
In-Reply-To: <1286732323.3808.111.camel@mattotaupa>
References: <1286730309.3808.88.camel@mattotaupa>
	<AANLkTikZquiw4kwdKipq7x++Efeerp1gdcvHmDYxW0Sj@mail.gmail.com>
	<1286732323.3808.111.camel@mattotaupa>
From: Chris Larson <clarson@kergoth.com>
Date: Sun, 10 Oct 2010 11:11:40 -0700
X-Google-Sender-Auth: MAEmNkOF1nAO9EH7UvbIo-_C3XE
Message-ID: <AANLkTinEX-Y65vR4KfRJOk6gSy6JkrwsuQSX4oQhw43J@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Preferred handling of pkg-config in cross compile environments.
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
X-List-Received-Date: Sun, 10 Oct 2010 18:12:28 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Oct 10, 2010 at 10:38 AM, Paul Menzel <
paulepanter@users.sourceforge.net> wrote:

> Am Sonntag, den 10.10.2010, 10:09 -0700 schrieb Chris Larson:
> > On Sun, Oct 10, 2010 at 10:05 AM, Paul Menzel <
> > paulepanter@users.sourceforge.net> wrote:
> >
> > > I stumbled upon several programs who call plain `pkg-config` [1][2].
> > >
> > > Is the following statement correct?
> > >
> > > To be able to cross compile programs correctly, the build files are
> > > supposed to use the environment variable `PKG_CONFIG` and only call
> > > pkg-config directly if `PKG_CONFIG` is empty.
> > >
> > >        if test -z "${PKG_CONFIG}"; then
> > >            PKG_CONFIG="pkg-config"
> > >
> > > If you agree I would note that somewhere in the Wiki, so that upstream
> > > can be pointed to some documentation and search the Web will result in
> > > some useful results.
> > >
> >
> > Can you explain why running just 'pkg-config' is a problem?  It seems to
> > work just fine..
>
> Do you have a minimal build host. Some problems do not surface if some
> files are installed locally on the build host.
>
> Please take a look at [2] I forgot to add in my original message. I have
> no clue why the staged(?) pkg-config behaves differently than the local
> installed one. Does it search the paths in a different order?
>

pkgconfig-native searches its own built in path (the one in the native
sysroot) along with the paths in PKG_CONFIG_PATH.  None of those are outside
of the sysroots.

Secondly I am having a similar problem with `gobject-introspection`
> where [1]
>
>        gir/Makefile.am:GLIB_INCLUDEDIR=$(shell pkg-config
> --variable=includedir glib-2.0)/glib-2.0
>        gir/Makefile.am:GLIB_LIBDIR=$(shell pkg-config --variable=libdir
> glib-2.0)
>
> returns the wrong path.
>
>        Making all in gir
>        make[2]: Entering directory
> `/oe/build-minimal-libc/minimal-dev/work/armv7a-oe-linux-gnueabi/gobject-introspection-0.9.12-r0/gobject-introspection-0.9.12/gir'
>        make[2]: *** No rule to make target
> `/usr/lib/glib-2.0/include/glibconfig.h', needed by `GLib-2.0.gir'.  Stop.
>        make[2]: Leaving directory
> `/oe/build-minimal-libc/minimal-dev/work/armv7a-oe-linux-gnueabi/gobject-introspection-0.9.12-r0/gobject-introspection-0.9.12/gir'
>        make[1]: *** [all-recursive] Error 1


/usr/{lib,include} paths are mangled by pkg-config using
PKG_CONFIG_SYSROOT_DIR.  If that's not happening here, that's a bug that
should be investigated, but I fail to see how setting PKG_CONFIG is going to
magically fix it.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

