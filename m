Return-Path: <ticotimo@gmail.com>
Received: from mail-la0-f49.google.com (mail-la0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id B647A7003A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jul 2014 18:22:50 +0000 (UTC)
Received: by mail-la0-f49.google.com with SMTP id hz20so34083lab.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jul 2014 11:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=hSN1GkcDThEtzVCRWu6RlXM4oQJB0oPGykyp5hFndjU=;
	b=biNEkx2v97ddCs1vN2/7V5RthUERYMZjk2RQqMv1YfS3KEqphJjIyjGkrzEQTZ/vZW
	ObE33YIFZMwDwMlfqFAMnx1zXTnLW85byLPF+U7ItZMbt8nyI8mjh9rR3kNUpY9o0ke1
	4qdCR1zWZrSvwJBsgYOZkai56y6f34Rdyi9guIknnGnOslJjCt+0hWLYNHZpRB5++iRJ
	TLFkV4qdi/rMNWksUgkMNtfB3KCH4IK0EwIcU9QDxqhEM380Aa1gMUaEt6U+v0yNdy4J
	GPKbe76ndT/+RCfTjTwauFj0+VR+Y0LewrbBk5ZggeaTTbtztDtqp5rhtCo+1jaT5N4J
	RGLg==
MIME-Version: 1.0
X-Received: by 10.152.23.6 with SMTP id i6mr36803719laf.25.1406053370882; Tue,
	22 Jul 2014 11:22:50 -0700 (PDT)
Received: by 10.114.188.166 with HTTP; Tue, 22 Jul 2014 11:22:50 -0700 (PDT)
In-Reply-To: <CANx9H-BSGLqnw2hO86Ys5bo3y_R2fjGb+45cEWGnf5zZNjHiCQ@mail.gmail.com>
References: <1406028895-834-1-git-send-email-Martin.Jansa@gmail.com>
	<1406028895-834-2-git-send-email-Martin.Jansa@gmail.com>
	<CANx9H-B-XpPeLtcT0fGzNSNOn-gREp5MVQh7Su-kMpxBAsMt6g@mail.gmail.com>
	<20140722155207.GU22875@jama>
	<CANx9H-BSGLqnw2hO86Ys5bo3y_R2fjGb+45cEWGnf5zZNjHiCQ@mail.gmail.com>
Date: Tue, 22 Jul 2014 11:22:50 -0700
Message-ID: <CANx9H-ArgEMG2LE0rSh3fwLQU9jkD+exoVWxguAn3YG0nsCYMQ@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH 2/2] meta-python: rename recipes-python to recipes-devtools
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 22 Jul 2014 18:22:51 -0000
Content-Type: text/plain; charset=UTF-8

I see your point. Submitting patch to follow typical structure, more
similar to meta-perl, meta-networking, etc.

--Tim


On Tue, Jul 22, 2014 at 8:55 AM, Tim Orling <ticotimo@gmail.com> wrote:

> To work as intended, layer.conf should have had:
>
> # We have recipes-*/* and recipes-* directories, add to BBFILES
> BBFILES += "${LAYERDIR}/recipes-*/*.bb \
>             ${LAYERDIR}/recipes-*/*.bbappend \
>             ${LAYERDIR}/recipes-*/*/*.bb \
>             ${LAYERDIR}/recipes-*/*/*.bbappend"
>
> This works just fine without reverting to the original meta-oe structure.
>
>
> On Tue, Jul 22, 2014 at 8:52 AM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
>
>> On Tue, Jul 22, 2014 at 08:33:00AM -0700, Tim Orling wrote:
>> > I'd rather not keep the original structure, part of my motivation for
>> > creating the layer was to not hide python recipes three directories
>> deep.
>> > The structure of the meta-perl layer seems more natural to me.
>>
>> meta-perl has also three directories deep structure, just with each
>> recipe in separate directory.
>>
>> > However, I realize and regret that the layer.conf in my original patch
>> was
>> > broken and I need to fix it. Please see v2 for meta-python creation.
>>
>> It was already merged in master.
>>
>> > On Tue, Jul 22, 2014 at 4:34 AM, Martin Jansa <martin.jansa@gmail.com>
>> > wrote:
>> >
>> > > * match old structure from meta-oe
>> > >
>> > > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> > > ---
>> > >  meta-python/{recipes-python => recipes-devtools}/python/pyrtm_0.2.bb
>> > >  | 0
>> > >  .../{recipes-python => recipes-devtools}/python/
>> python-autobahn_0.8.6.bb
>> > >  | 0
>> > >  .../{recipes-python => recipes-devtools}/python/
>> python-cheetah_2.4.4.bb
>> > >   | 0
>> > >  .../python/python-cloudeebus_0.6.0.bb
>> > >   | 0
>> > >  .../{recipes-python => recipes-devtools}/python/
>> python-cython_0.20.2.bb
>> > >   | 0
>> > >  .../{recipes-python => recipes-devtools}/python/
>> python-dateutil_1.5.bb
>> > >  | 0
>> > >  .../{recipes-python => recipes-devtools}/python/
>> python-epydoc_3.0.1.bb
>> > >  | 0
>> > >  .../python/python-feedparser_5.1.3.bb
>> > >   | 0
>> > >  .../{recipes-python => recipes-devtools}/python/
>> python-gdata_1.2.4.bb
>> > >   | 0
>> > >  .../{recipes-python => recipes-devtools}/python/
>> python-gevent_0.13.8.bb
>> > >   | 0
>> > >  .../{recipes-python => recipes-devtools}/python/
>> python-greenlet_0.4.1.bb
>> > >  | 0
>> > >  .../python/python-ldap/setup.cfg.patch
>> > >  | 0
>> > >  .../{recipes-python => recipes-devtools}/python/python-ldap_2.3.9.bb
>> > >  | 0
>> > >  .../{recipes-python => recipes-devtools}/python/python-lxml_3.0.2.bb
>> > >  | 0
>> > >  .../0001-setup.py-link-in-sysroot-not-in-host-directories.patch
>> > > | 0
>> > >  .../{recipes-python => recipes-devtools}/python/
>> python-m2crypto_0.21.1.bb
>> > > | 0
>> > >  .../python/python-matplotlib/fix_setup.patch
>> > >  | 0
>> > >  .../python/python-matplotlib/fix_setupext.patch
>> > > | 0
>> > >  .../python/python-matplotlib_1.1.0.bb
>> > >   | 0
>> > >  .../python/python-numeric/no-lapack.patch
>> > > | 0
>> > >  .../{recipes-python => recipes-devtools}/python/
>> python-numeric_24.2.bb
>> > >  | 0
>> > >  .../{recipes-python => recipes-devtools}/python/
>> python-pexpect_2.3.bb
>> > >   | 0
>> > >  .../{recipes-python => recipes-devtools}/python/python-pip_1.3.1.bb
>> > >   | 0
>> > >  .../{recipes-python => recipes-devtools}/python/
>> python-psutil_0.6.1.bb
>> > >  | 0
>> > >  .../{recipes-python => recipes-devtools}/python/
>> python-pyalsaaudio_0.4.bb
>> > > | 0
>> > >  .../{recipes-python => recipes-devtools}/python/
>> python-pyserial_2.4.bb
>> > >  | 0
>> > >  .../{recipes-python => recipes-devtools}/python/
>> python-pyudev_0.16.1.bb
>> > >   | 0
>> > >  .../{recipes-python => recipes-devtools}/python/
>> python-pyusb_1.0.0a2.bb
>> > >   | 0
>> > >  .../{recipes-python =>
>> recipes-devtools}/python/python-pyyaml/setup.py
>> > >  | 0
>> > >  .../{recipes-python => recipes-devtools}/python/
>> python-pyyaml_3.10.bb
>> > >   | 0
>> > >  .../{recipes-python => recipes-devtools}/python/
>> python-smbus_3.0.3.bb
>> > >   | 0
>> > >  .../python/python-sqlalchemy_0.7.9.bb
>> > >   | 0
>> > >  .../{recipes-python => recipes-devtools}/python/
>> python-twisted_13.2.0.bb
>> > >  | 0
>> > >  .../{recipes-python => recipes-devtools}/python/
>> python-vobject_0.8.1c.bb
>> > >  | 0
>> > >  .../{recipes-python => recipes-devtools}/python/
>> python-webdav_0.1.2.bb
>> > >  | 0
>> > >  .../python/python-zopeinterface_4.1.1.bb
>> > >  | 0
>> > >  36 files changed, 0 insertions(+), 0 deletions(-)
>> > >  rename meta-python/{recipes-python => recipes-devtools}/python/
>> > > pyrtm_0.2.bb (100%)
>> > >  rename meta-python/{recipes-python => recipes-devtools}/python/
>> > > python-autobahn_0.8.6.bb (100%)
>> > >  rename meta-python/{recipes-python => recipes-devtools}/python/
>> > > python-cheetah_2.4.4.bb (100%)
>> > >  rename meta-python/{recipes-python => recipes-devtools}/python/
>> > > python-cloudeebus_0.6.0.bb (100%)
>> > >  rename meta-python/{recipes-python => recipes-devtools}/python/
>> > > python-cython_0.20.2.bb (100%)
>> > >  rename meta-python/{recipes-python => recipes-devtools}/python/
>> > > python-dateutil_1.5.bb (100%)
>> > >  rename meta-python/{recipes-python => recipes-devtools}/python/
>> > > python-epydoc_3.0.1.bb (100%)
>> > >  rename meta-python/{recipes-python => recipes-devtools}/python/
>> > > python-feedparser_5.1.3.bb (100%)
>> > >  rename meta-python/{recipes-python => recipes-devtools}/python/
>> > > python-gdata_1.2.4.bb (100%)
>> > >  rename meta-python/{recipes-python => recipes-devtools}/python/
>> > > python-gevent_0.13.8.bb (100%)
>> > >  rename meta-python/{recipes-python => recipes-devtools}/python/
>> > > python-greenlet_0.4.1.bb (100%)
>> > >  rename meta-python/{recipes-python =>
>> > > recipes-devtools}/python/python-ldap/setup.cfg.patch (100%)
>> > >  rename meta-python/{recipes-python => recipes-devtools}/python/
>> > > python-ldap_2.3.9.bb (100%)
>> > >  rename meta-python/{recipes-python => recipes-devtools}/python/
>> > > python-lxml_3.0.2.bb (100%)
>> > >  rename meta-python/{recipes-python =>
>> > >
>> recipes-devtools}/python/python-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch
>> > > (100%)
>> > >  rename meta-python/{recipes-python => recipes-devtools}/python/
>> > > python-m2crypto_0.21.1.bb (100%)
>> > >  rename meta-python/{recipes-python =>
>> > > recipes-devtools}/python/python-matplotlib/fix_setup.patch (100%)
>> > >  rename meta-python/{recipes-python =>
>> > > recipes-devtools}/python/python-matplotlib/fix_setupext.patch (100%)
>> > >  rename meta-python/{recipes-python => recipes-devtools}/python/
>> > > python-matplotlib_1.1.0.bb (100%)
>> > >  rename meta-python/{recipes-python =>
>> > > recipes-devtools}/python/python-numeric/no-lapack.patch (100%)
>> > >  rename meta-python/{recipes-python => recipes-devtools}/python/
>> > > python-numeric_24.2.bb (100%)
>> > >  rename meta-python/{recipes-python => recipes-devtools}/python/
>> > > python-pexpect_2.3.bb (100%)
>> > >  rename meta-python/{recipes-python => recipes-devtools}/python/
>> > > python-pip_1.3.1.bb (100%)
>> > >  rename meta-python/{recipes-python => recipes-devtools}/python/
>> > > python-psutil_0.6.1.bb (100%)
>> > >  rename meta-python/{recipes-python => recipes-devtools}/python/
>> > > python-pyalsaaudio_0.4.bb (100%)
>> > >  rename meta-python/{recipes-python => recipes-devtools}/python/
>> > > python-pyserial_2.4.bb (100%)
>> > >  rename meta-python/{recipes-python => recipes-devtools}/python/
>> > > python-pyudev_0.16.1.bb (100%)
>> > >  rename meta-python/{recipes-python => recipes-devtools}/python/
>> > > python-pyusb_1.0.0a2.bb (100%)
>> > >  rename meta-python/{recipes-python =>
>> > > recipes-devtools}/python/python-pyyaml/setup.py (100%)
>> > >  rename meta-python/{recipes-python => recipes-devtools}/python/
>> > > python-pyyaml_3.10.bb (100%)
>> > >  rename meta-python/{recipes-python => recipes-devtools}/python/
>> > > python-smbus_3.0.3.bb (100%)
>> > >  rename meta-python/{recipes-python => recipes-devtools}/python/
>> > > python-sqlalchemy_0.7.9.bb (100%)
>> > >  rename meta-python/{recipes-python => recipes-devtools}/python/
>> > > python-twisted_13.2.0.bb (100%)
>> > >  rename meta-python/{recipes-python => recipes-devtools}/python/
>> > > python-vobject_0.8.1c.bb (100%)
>> > >  rename meta-python/{recipes-python => recipes-devtools}/python/
>> > > python-webdav_0.1.2.bb (100%)
>> > >  rename meta-python/{recipes-python => recipes-devtools}/python/
>> > > python-zopeinterface_4.1.1.bb (100%)
>> > >
>> > > diff --git a/meta-python/recipes-python/python/pyrtm_0.2.bb
>> > > b/meta-python/recipes-devtools/python/pyrtm_0.2.bb
>> > > similarity index 100%
>> > > rename from meta-python/recipes-python/python/pyrtm_0.2.bb
>> > > rename to meta-python/recipes-devtools/python/pyrtm_0.2.bb
>> > > diff --git a/meta-python/recipes-python/python/
>> python-autobahn_0.8.6.bb
>> > > b/meta-python/recipes-devtools/python/python-autobahn_0.8.6.bb
>> > > similarity index 100%
>> > > rename from meta-python/recipes-python/python/
>> python-autobahn_0.8.6.bb
>> > > rename to meta-python/recipes-devtools/python/
>> python-autobahn_0.8.6.bb
>> > > diff --git a/meta-python/recipes-python/python/
>> python-cheetah_2.4.4.bb
>> > > b/meta-python/recipes-devtools/python/python-cheetah_2.4.4.bb
>> > > similarity index 100%
>> > > rename from meta-python/recipes-python/python/python-cheetah_2.4.4.bb
>> > > rename to meta-python/recipes-devtools/python/python-cheetah_2.4.4.bb
>> > > diff --git a/meta-python/recipes-python/python/
>> python-cloudeebus_0.6.0.bb
>> > > b/meta-python/recipes-devtools/python/python-cloudeebus_0.6.0.bb
>> > > similarity index 100%
>> > > rename from meta-python/recipes-python/python/
>> python-cloudeebus_0.6.0.bb
>> > > rename to meta-python/recipes-devtools/python/
>> python-cloudeebus_0.6.0.bb
>> > > diff --git a/meta-python/recipes-python/python/
>> python-cython_0.20.2.bb
>> > > b/meta-python/recipes-devtools/python/python-cython_0.20.2.bb
>> > > similarity index 100%
>> > > rename from meta-python/recipes-python/python/python-cython_0.20.2.bb
>> > > rename to meta-python/recipes-devtools/python/python-cython_0.20.2.bb
>> > > diff --git a/meta-python/recipes-python/python/python-dateutil_1.5.bb
>> > > b/meta-python/recipes-devtools/python/python-dateutil_1.5.bb
>> > > similarity index 100%
>> > > rename from meta-python/recipes-python/python/python-dateutil_1.5.bb
>> > > rename to meta-python/recipes-devtools/python/python-dateutil_1.5.bb
>> > > diff --git a/meta-python/recipes-python/python/python-epydoc_3.0.1.bb
>> > > b/meta-python/recipes-devtools/python/python-epydoc_3.0.1.bb
>> > > similarity index 100%
>> > > rename from meta-python/recipes-python/python/python-epydoc_3.0.1.bb
>> > > rename to meta-python/recipes-devtools/python/python-epydoc_3.0.1.bb
>> > > diff --git a/meta-python/recipes-python/python/
>> python-feedparser_5.1.3.bb
>> > > b/meta-python/recipes-devtools/python/python-feedparser_5.1.3.bb
>> > > similarity index 100%
>> > > rename from meta-python/recipes-python/python/
>> python-feedparser_5.1.3.bb
>> > > rename to meta-python/recipes-devtools/python/
>> python-feedparser_5.1.3.bb
>> > > diff --git a/meta-python/recipes-python/python/python-gdata_1.2.4.bb
>> > > b/meta-python/recipes-devtools/python/python-gdata_1.2.4.bb
>> > > similarity index 100%
>> > > rename from meta-python/recipes-python/python/python-gdata_1.2.4.bb
>> > > rename to meta-python/recipes-devtools/python/python-gdata_1.2.4.bb
>> > > diff --git a/meta-python/recipes-python/python/
>> python-gevent_0.13.8.bb
>> > > b/meta-python/recipes-devtools/python/python-gevent_0.13.8.bb
>> > > similarity index 100%
>> > > rename from meta-python/recipes-python/python/python-gevent_0.13.8.bb
>> > > rename to meta-python/recipes-devtools/python/python-gevent_0.13.8.bb
>> > > diff --git a/meta-python/recipes-python/python/
>> python-greenlet_0.4.1.bb
>> > > b/meta-python/recipes-devtools/python/python-greenlet_0.4.1.bb
>> > > similarity index 100%
>> > > rename from meta-python/recipes-python/python/
>> python-greenlet_0.4.1.bb
>> > > rename to meta-python/recipes-devtools/python/
>> python-greenlet_0.4.1.bb
>> > > diff --git
>> a/meta-python/recipes-python/python/python-ldap/setup.cfg.patch
>> > > b/meta-python/recipes-devtools/python/python-ldap/setup.cfg.patch
>> > > similarity index 100%
>> > > rename from
>> meta-python/recipes-python/python/python-ldap/setup.cfg.patch
>> > > rename to
>> meta-python/recipes-devtools/python/python-ldap/setup.cfg.patch
>> > > diff --git a/meta-python/recipes-python/python/python-ldap_2.3.9.bb
>> > > b/meta-python/recipes-devtools/python/python-ldap_2.3.9.bb
>> > > similarity index 100%
>> > > rename from meta-python/recipes-python/python/python-ldap_2.3.9.bb
>> > > rename to meta-python/recipes-devtools/python/python-ldap_2.3.9.bb
>> > > diff --git a/meta-python/recipes-python/python/python-lxml_3.0.2.bb
>> > > b/meta-python/recipes-devtools/python/python-lxml_3.0.2.bb
>> > > similarity index 100%
>> > > rename from meta-python/recipes-python/python/python-lxml_3.0.2.bb
>> > > rename to meta-python/recipes-devtools/python/python-lxml_3.0.2.bb
>> > > diff --git
>> > >
>> a/meta-python/recipes-python/python/python-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch
>> > >
>> b/meta-python/recipes-devtools/python/python-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch
>> > > similarity index 100%
>> > > rename from
>> > >
>> meta-python/recipes-python/python/python-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch
>> > > rename to
>> > >
>> meta-python/recipes-devtools/python/python-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch
>> > > diff --git a/meta-python/recipes-python/python/
>> python-m2crypto_0.21.1.bb
>> > > b/meta-python/recipes-devtools/python/python-m2crypto_0.21.1.bb
>> > > similarity index 100%
>> > > rename from meta-python/recipes-python/python/
>> python-m2crypto_0.21.1.bb
>> > > rename to meta-python/recipes-devtools/python/
>> python-m2crypto_0.21.1.bb
>> > > diff --git
>> > > a/meta-python/recipes-python/python/python-matplotlib/fix_setup.patch
>> > >
>> b/meta-python/recipes-devtools/python/python-matplotlib/fix_setup.patch
>> > > similarity index 100%
>> > > rename from
>> > > meta-python/recipes-python/python/python-matplotlib/fix_setup.patch
>> > > rename to
>> > > meta-python/recipes-devtools/python/python-matplotlib/fix_setup.patch
>> > > diff --git
>> > >
>> a/meta-python/recipes-python/python/python-matplotlib/fix_setupext.patch
>> > >
>> b/meta-python/recipes-devtools/python/python-matplotlib/fix_setupext.patch
>> > > similarity index 100%
>> > > rename from
>> > > meta-python/recipes-python/python/python-matplotlib/fix_setupext.patch
>> > > rename to
>> > >
>> meta-python/recipes-devtools/python/python-matplotlib/fix_setupext.patch
>> > > diff --git a/meta-python/recipes-python/python/
>> python-matplotlib_1.1.0.bb
>> > > b/meta-python/recipes-devtools/python/python-matplotlib_1.1.0.bb
>> > > similarity index 100%
>> > > rename from meta-python/recipes-python/python/
>> python-matplotlib_1.1.0.bb
>> > > rename to meta-python/recipes-devtools/python/
>> python-matplotlib_1.1.0.bb
>> > > diff --git
>> > > a/meta-python/recipes-python/python/python-numeric/no-lapack.patch
>> > > b/meta-python/recipes-devtools/python/python-numeric/no-lapack.patch
>> > > similarity index 100%
>> > > rename from
>> > > meta-python/recipes-python/python/python-numeric/no-lapack.patch
>> > > rename to
>> > > meta-python/recipes-devtools/python/python-numeric/no-lapack.patch
>> > > diff --git a/meta-python/recipes-python/python/python-numeric_24.2.bb
>> > > b/meta-python/recipes-devtools/python/python-numeric_24.2.bb
>> > > similarity index 100%
>> > > rename from meta-python/recipes-python/python/python-numeric_24.2.bb
>> > > rename to meta-python/recipes-devtools/python/python-numeric_24.2.bb
>> > > diff --git a/meta-python/recipes-python/python/python-pexpect_2.3.bb
>> > > b/meta-python/recipes-devtools/python/python-pexpect_2.3.bb
>> > > similarity index 100%
>> > > rename from meta-python/recipes-python/python/python-pexpect_2.3.bb
>> > > rename to meta-python/recipes-devtools/python/python-pexpect_2.3.bb
>> > > diff --git a/meta-python/recipes-python/python/python-pip_1.3.1.bb
>> > > b/meta-python/recipes-devtools/python/python-pip_1.3.1.bb
>> > > similarity index 100%
>> > > rename from meta-python/recipes-python/python/python-pip_1.3.1.bb
>> > > rename to meta-python/recipes-devtools/python/python-pip_1.3.1.bb
>> > > diff --git a/meta-python/recipes-python/python/python-psutil_0.6.1.bb
>> > > b/meta-python/recipes-devtools/python/python-psutil_0.6.1.bb
>> > > similarity index 100%
>> > > rename from meta-python/recipes-python/python/python-psutil_0.6.1.bb
>> > > rename to meta-python/recipes-devtools/python/python-psutil_0.6.1.bb
>> > > diff --git a/meta-python/recipes-python/python/
>> python-pyalsaaudio_0.4.bb
>> > > b/meta-python/recipes-devtools/python/python-pyalsaaudio_0.4.bb
>> > > similarity index 100%
>> > > rename from meta-python/recipes-python/python/
>> python-pyalsaaudio_0.4.bb
>> > > rename to meta-python/recipes-devtools/python/
>> python-pyalsaaudio_0.4.bb
>> > > diff --git a/meta-python/recipes-python/python/python-pyserial_2.4.bb
>> > > b/meta-python/recipes-devtools/python/python-pyserial_2.4.bb
>> > > similarity index 100%
>> > > rename from meta-python/recipes-python/python/python-pyserial_2.4.bb
>> > > rename to meta-python/recipes-devtools/python/python-pyserial_2.4.bb
>> > > diff --git a/meta-python/recipes-python/python/
>> python-pyudev_0.16.1.bb
>> > > b/meta-python/recipes-devtools/python/python-pyudev_0.16.1.bb
>> > > similarity index 100%
>> > > rename from meta-python/recipes-python/python/python-pyudev_0.16.1.bb
>> > > rename to meta-python/recipes-devtools/python/python-pyudev_0.16.1.bb
>> > > diff --git a/meta-python/recipes-python/python/
>> python-pyusb_1.0.0a2.bb
>> > > b/meta-python/recipes-devtools/python/python-pyusb_1.0.0a2.bb
>> > > similarity index 100%
>> > > rename from meta-python/recipes-python/python/python-pyusb_1.0.0a2.bb
>> > > rename to meta-python/recipes-devtools/python/python-pyusb_1.0.0a2.bb
>> > > diff --git a/meta-python/recipes-python/python/python-pyyaml/setup.py
>> > > b/meta-python/recipes-devtools/python/python-pyyaml/setup.py
>> > > similarity index 100%
>> > > rename from meta-python/recipes-python/python/python-pyyaml/setup.py
>> > > rename to meta-python/recipes-devtools/python/python-pyyaml/setup.py
>> > > diff --git a/meta-python/recipes-python/python/python-pyyaml_3.10.bb
>> > > b/meta-python/recipes-devtools/python/python-pyyaml_3.10.bb
>> > > similarity index 100%
>> > > rename from meta-python/recipes-python/python/python-pyyaml_3.10.bb
>> > > rename to meta-python/recipes-devtools/python/python-pyyaml_3.10.bb
>> > > diff --git a/meta-python/recipes-python/python/python-smbus_3.0.3.bb
>> > > b/meta-python/recipes-devtools/python/python-smbus_3.0.3.bb
>> > > similarity index 100%
>> > > rename from meta-python/recipes-python/python/python-smbus_3.0.3.bb
>> > > rename to meta-python/recipes-devtools/python/python-smbus_3.0.3.bb
>> > > diff --git a/meta-python/recipes-python/python/
>> python-sqlalchemy_0.7.9.bb
>> > > b/meta-python/recipes-devtools/python/python-sqlalchemy_0.7.9.bb
>> > > similarity index 100%
>> > > rename from meta-python/recipes-python/python/
>> python-sqlalchemy_0.7.9.bb
>> > > rename to meta-python/recipes-devtools/python/
>> python-sqlalchemy_0.7.9.bb
>> > > diff --git a/meta-python/recipes-python/python/
>> python-twisted_13.2.0.bb
>> > > b/meta-python/recipes-devtools/python/python-twisted_13.2.0.bb
>> > > similarity index 100%
>> > > rename from meta-python/recipes-python/python/
>> python-twisted_13.2.0.bb
>> > > rename to meta-python/recipes-devtools/python/
>> python-twisted_13.2.0.bb
>> > > diff --git a/meta-python/recipes-python/python/
>> python-vobject_0.8.1c.bb
>> > > b/meta-python/recipes-devtools/python/python-vobject_0.8.1c.bb
>> > > similarity index 100%
>> > > rename from meta-python/recipes-python/python/
>> python-vobject_0.8.1c.bb
>> > > rename to meta-python/recipes-devtools/python/
>> python-vobject_0.8.1c.bb
>> > > diff --git a/meta-python/recipes-python/python/python-webdav_0.1.2.bb
>> > > b/meta-python/recipes-devtools/python/python-webdav_0.1.2.bb
>> > > similarity index 100%
>> > > rename from meta-python/recipes-python/python/python-webdav_0.1.2.bb
>> > > rename to meta-python/recipes-devtools/python/python-webdav_0.1.2.bb
>> > > diff --git a/meta-python/recipes-python/python/
>> > > python-zopeinterface_4.1.1.bb b/meta-python/recipes-devtools/python/
>> > > python-zopeinterface_4.1.1.bb
>> > > similarity index 100%
>> > > rename from meta-python/recipes-python/python/
>> > > python-zopeinterface_4.1.1.bb
>> > > rename to meta-python/recipes-devtools/python/
>> > > python-zopeinterface_4.1.1.bb
>> > > --
>> > > 2.0.2
>> > >
>> > > --
>> > > _______________________________________________
>> > > Openembedded-devel mailing list
>> > > Openembedded-devel@lists.openembedded.org
>> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> > >
>> > --
>> > _______________________________________________
>> > Openembedded-devel mailing list
>> > Openembedded-devel@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>> --
>> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>>
>

