Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
 by mx.groups.io with SMTP id smtpd.web12.106975.1597918341307900417
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Aug 2020 03:12:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@skidata.com header.s=selector1 header.b=tLDj9FQF;
 spf=pass (domain: skidata.com, ip: 91.230.2.91, mailfrom: richard.leitner@skidata.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
  t=1597918341; x=1629454341;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=8Oz7tPoTQsOdhBG2cVQUTFHBeSDMu+Jf8BVzRXJrjbc=;
  b=tLDj9FQFDzY8wcYSWJhfKULBPUHRI+NNDQhSCPCE3ZceqASOA8lLT6Km
   031FHle+u4q6XbYuHS2wHFbJobgzFPCrfVoWlfVspLJFyrwtMmqHYjrgP
   PuI4AReLm9GxtrclyYe93Ie2B2pvURHO7rMI9G4qK8DE7LkPP+tRO4fh6
   f1j5MTmTgdmPbcJYdKkeSEEkq8HGP0NJxKlh9FxzHeWUfAMAK/Re+O8Yv
   sflig32bSbEveraCEUIhnOgCdJRXvNSZcdjSGpe2V6Y+iZkJctjZlZq4f
   738uw+KVfA8l16ivyl9N5uoNcz6wa9sVYLC5Pzt8pxCcnVPksNUz+Sc0H
   Q==;
IronPort-SDR: jZ6Ags3IGQIMn5SpGhynbPHFyO6cgXKo7nZbtzjjrp+PNKmqkHuRbp2ao4fgUIGKQQ5kZd0Fl0
 KeQ+VYR3+kPwPc0YkM7+tUNNAY7hpP2DGw2/8N2xvoNPdO+iyqncgwEH4+LGhwu12+Qk1jlkCY
 lnRx4tyX48bVa9U2oNqotQ036qkwitWLuYlaMK8DpPpYhqnbMWI/Zpi9QVe7UqlJOEQpr37fgc
 PObonLloZv85RF9un7J8XZPGLf85Kx5qe0gK1/vG1F+w8mBQFzxTUFgnUTieyBSwRFJA0f/+td
 jX4=
X-IronPort-AV: E=Sophos;i="5.76,332,1592863200"; 
   d="scan'208";a="2646536"
Date: Thu, 20 Aug 2020 12:12:18 +0200
From: "Richard Leitner" <richard.leitner@skidata.com>
To: Jonatan Palsson <jonatan.p@gmail.com>
CC: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [PATCH] openjdk-8: Convert do_unpack postfunc to _append
Message-ID: <20200820101218.GC51054@pcleri>
References: <16285DBF18FAF8F7.27500@lists.openembedded.org>
 <CAKm+giMq=wbHhLn4WDM0xfnv4J2GJEQYfUzKts3vJukgBm2cYw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKm+giMq=wbHhLn4WDM0xfnv4J2GJEQYfUzKts3vJukgBm2cYw@mail.gmail.com>
Return-Path: richard.leitner@skidata.com
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex6srv.skidata.net (192.168.111.84) To
 sdex5srv.skidata.net (192.168.111.83)
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi,
thanks for your patch!
Unfortunately we already have a similar one in master-next (commit
b8e6267 (WORKDIR and ARCHIVER_WORKDIR support, 2020-05-09)).

Would you please have a look at it and if applicable send a rebased
(master-next) version?

regards;rl

On Wed, Aug 19, 2020 at 11:31:17AM +0200, Jonatan Palsson wrote:
> Ping
> 
> On Wed, Aug 5, 2020 at 2:05 PM Jonatan Pålsson via
> lists.openembedded.org <jonatan.p=gmail.com@lists.openembedded.org>
> wrote:
> >
> > archiver.bbclass will invoke do_unpack as a function (rather than a
> > task) during do_unpack_and_patch. When invoked as a function, the
> > postfuncs of do_unpack are not executed.
> >
> > Convert the postfuncs into an _append fragment on do_unpack instead.
> >
> > Fixes:
> >
> >     .. snip ..
> >     No file to patch.  Skipping patch.
> >     1 out of 1 hunk ignored
> >     Patch 1001-hotspot-fix-crash-on-JNI_CreateJavaVM.patch does not apply (enforce with -f)
> >     ERROR: Logfile of failure stored in: .. snip .. /build/tmp/work/x86_64-linux/openjdk-8-native/252-r0/temp/log.do_unpack_and_patch.220625
> >     ERROR: Task (.. snip .. /sources/openembedded-core/meta-java/recipes-core/openjdk/openjdk-8-native_252.bb:do_unpack_and_patch) failed with exit code '1'
> > ---
> >  recipes-core/openjdk/openjdk-8-common.inc | 10 +++++++---
> >  1 file changed, 7 insertions(+), 3 deletions(-)
> >
> > diff --git a/recipes-core/openjdk/openjdk-8-common.inc b/recipes-core/openjdk/openjdk-8-common.inc
> > index c78bb2a..123e896 100644
> > --- a/recipes-core/openjdk/openjdk-8-common.inc
> > +++ b/recipes-core/openjdk/openjdk-8-common.inc
> > @@ -46,6 +46,13 @@ do_unpack_delete_X11_wrappers() {
> >      find ${S}/jdk/src/solaris/classes/sun/awt/X11 -maxdepth 1 -name '*.java' -delete
> >  }
> >
> > +do_unpack_append() {
> > +    bb.build.exec_func('do_unpack_extract_submodules', d)
> > +
> > +    if not bb.utils.filter('PACKAGECONFIG', 'x11', d):
> > +        bb.build.exec_func('do_unpack_delete_X11_wrappers', d)
> > +}
> > +
> >  def package_config_option_cleanup(d):
> >      distro_x11 = bb.utils.contains('DISTRO_FEATURES', 'x11', True, False, d)
> >      distro_alsa = bb.utils.contains('DISTRO_FEATURES', 'alsa', True, False, d)
> > @@ -155,9 +162,6 @@ def jdk_configure_options(d):
> >      options = package_config_option_cleanup(d)
> >      return options[3]
> >
> > -do_unpack[postfuncs] += "do_unpack_extract_submodules"
> > -do_unpack[postfuncs] += "${@bb.utils.contains('PACKAGECONFIG', 'x11', '', 'do_unpack_delete_X11_wrappers', d)}"
> > -
> >  export DEBUG_BINARIES = "true"
> >
> >  ALTERNATIVE_PRIORITY = "50"
> > --
> > 2.26.1
> >
> > 

-- 
Richard Leitner
Hardware R&D / Senior Embedded Linux Engineer

SKIDATA | Driving Your Digital Future

SKIDATA GmbH
Untersbergstraße 40 | 5083 Grödig/Salzburg | Austria
[t] +43-6246-888-4245 | [m] +43-664-88616370
[w] www.skidata.com
