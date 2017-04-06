Return-Path: <andrej.rode@ettus.com>
Received: from mail-oi0-f45.google.com (mail-oi0-f45.google.com
	[209.85.218.45])
	by mail.openembedded.org (Postfix) with ESMTP id 3BA6972F87
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Apr 2017 07:13:02 +0000 (UTC)
Received: by mail-oi0-f45.google.com with SMTP id b187so41775756oif.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Apr 2017 00:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ettus-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=73G0S3p0+yVuvg0WoiNCkl2komFClDLx0hp3w2SGzWs=;
	b=g+q0uSRlT3wq2WOsJ9//GicM1CMKODLzyMV44mqhKawrHtW5x7GjcWRvR55vmmmnkS
	SSAAhZJ1CYAmhPmRtm19wx8qBkCS826WRdEKfftT4XQWw3+OFwJldC0KA7jXNCDjzZyO
	od3mRZuBWbD9YMX8yUh4+S0LVcHLrs+KcaaiEdeRhmRQzYfRs+PIOeSyFm4Z2kVrTJRE
	36TC+/jqQuvGNfm5amW/7kltrsih9Rm30uXZ5fLvj2Yfd2t9d4/9+PEFTD5piHnT+v8Y
	RkO3WmhcS9ytnQhVUKEzS5CHd6Dm5xTwC7+ioG9ycNOlC4Z4uUnvT8V05M6HyQrstoYL
	xIZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=73G0S3p0+yVuvg0WoiNCkl2komFClDLx0hp3w2SGzWs=;
	b=ZBNKHzFXaD13+rCMJ63urL2k+WbQLZeaN8OGv7wRKeceNZ/bWXPQudqUA9EV8GPIPN
	AFmZURY8ALYPnbQtkeP2BluMyUsgZ503VKGzyaj/OYyfyL2dXuGCRXs2GBcgURgjuHTP
	VJOWuAStru0Y2ZTT++XzxTwjMMPEc9pKQNludKcVUjGGsYAmYpn8ccFUuMrj85MRKYkN
	V2YmFPKw0CM42CbNII3QU+XZroT9eS2n564zWP0SbZF5wonYPyhOiTZ7KTLRxQMpsGJ8
	sSUy69XPWjPJieBEtUvdxUlvZM/QUYaZ/dcaF5dNtK1972TBtJxWI7uvisOPNT8wsOCA
	0H0w==
X-Gm-Message-State: AFeK/H3ZInno7Tqb0mcXTKpEA+kf95pYIa2t2/q+GS35iNiMTHspffcwAK1Y7JMiRrc+70QtX8MWneu9xCuDr4Lc
X-Received: by 10.157.1.22 with SMTP id 22mr16423464otu.221.1491462783696;
	Thu, 06 Apr 2017 00:13:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.42.50 with HTTP; Thu, 6 Apr 2017 00:13:03 -0700 (PDT)
In-Reply-To: <171FD608-F7C9-4CE8-9401-5E2848728E63@linux.intel.com>
References: <20170406011225.25591-1-andrej.rode@ettus.com>
	<171FD608-F7C9-4CE8-9401-5E2848728E63@linux.intel.com>
From: Andrej Rode <andrej.rode@ettus.com>
Date: Thu, 6 Apr 2017 00:13:03 -0700
Message-ID: <CAP9mK5MgaDEeYtGuCfB4o_nhoyHkVW+YiRacb95OKcifK_bL4w@mail.gmail.com>
To: Tim Orling <timothy.t.orling@linux.intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-python][PATCH] systemd-python: add a new recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Apr 2017 07:13:03 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Apr 5, 2017 at 11:30 PM, Tim Orling <
timothy.t.orling@linux.intel.com> wrote:

>
> > On Apr 6, 2017, at 3:12 AM, Andrej Rode <andrej.rode@ettus.com> wrote:
> >
> > Adds new recipe for systemd-python, python bindings for libsystemd
> >
>
> This is breaking Debian naming for python packages, it should be
> python-systemd, not systemd-python. We need to be consistent.
>

I thought about python-systemd-python, but that looked silly.
python-systemd is probably acceptable.


> > Signed-off-by: Andrej Rode <andrej.rode@ettus.com>
> > ---
> > meta-python/recipes-devtools/python/systemd-python_234.bb | 11
> +++++++++++
> > 1 file changed, 11 insertions(+)
> > create mode 100644 meta-python/recipes-devtools/python/
> systemd-python_234.bb
> >
> > diff --git a/meta-python/recipes-devtools/python/systemd-python_234.bb
> b/meta-python/recipes-devtools/python/systemd-python_234.bb
> > new file mode 100644
> > index 0000000..4cfa629
> > --- /dev/null
> > +++ b/meta-python/recipes-devtools/python/systemd-python_234.bb
> > @@ -0,0 +1,11 @@
> > +SUMMARY = "Python interface for libsystemd"
> > +HOMEPAGE = "https://github.com/systemd/systemd-python"
> > +LICENSE = "LGPLv2+"
> > +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=
> 4fbd65380cdd255951079008b364516c"
> > +DEPENDS += "systemd"
> > +RDEPENDS_${PN} += "systemd"
> > +
> > +SRC_URI[md5sum] = "5071ea5bcb976186e92a3f5e75df221d"
> > +SRC_URI[sha256sum] = "fd0e44bf70eadae45aadc292cb0a7e
> b5b0b6372cd1b391228047d33895db83e7"
> > +
> > +inherit pypi setuptools
> > --
> > 2.10.2
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>

