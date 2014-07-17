Return-Path: <ticotimo@gmail.com>
Received: from mail-la0-f48.google.com (mail-la0-f48.google.com
	[209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id 87B3170680
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jul 2014 14:07:00 +0000 (UTC)
Received: by mail-la0-f48.google.com with SMTP id gl10so1785003lab.35
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jul 2014 07:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=7s0KX9ONpy5WB8OQzHbROEhR12ILYKFtYwAE7182FrU=;
	b=i1dSg7KHFdxRFHgRLxFZ7bcUWtDDlvl3c0EpY89+jGI++eJHqUDE3amtjhrYW1xvzP
	LWXg701TidcFmH8Ugef1ZewW221m5DIhD5FWDplyXt/d3ffL7DthyD2nKiA6DJk3WNfT
	MQzLvjj8ApvfL+A0JrywFhxLp8OmCR8jJZJGbgXCGZX1rxibh+VgGDa63GGHgnLIvuOZ
	JxRBJZJi6G8DOOXrshHXRPP/WQXFTAdKYdUxm1CdkH/gfC2jScfgl6MkjBcEiOinCn+1
	01G4dJsRYI2zxV3rlyzEuQ5aAPVXtWR7te9E0mDC0ZtY5ASRRaiqlHG4WKqg7NmGic7R
	TVQw==
MIME-Version: 1.0
X-Received: by 10.112.143.8 with SMTP id sa8mr3997302lbb.89.1405606021139;
	Thu, 17 Jul 2014 07:07:01 -0700 (PDT)
Received: by 10.114.216.35 with HTTP; Thu, 17 Jul 2014 07:07:01 -0700 (PDT)
In-Reply-To: <20140716125007.GV2433@jama>
References: <cover.1405465524.git.TicoTimo@gmail.com>
	<a6acceb1dc1d391e20c3722e685aa7c9cca313b3.1405465524.git.TicoTimo@gmail.com>
	<20140716125007.GV2433@jama>
Date: Thu, 17 Jul 2014 07:07:01 -0700
Message-ID: <CANx9H-BSe-REicRzcAgcv5=dLx3S8w7ysqgiwhtrC4U0z8P4Pg@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [meta-oe][PATCH 2/2] meta-python: move recipes from meta-oe
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
X-List-Received-Date: Thu, 17 Jul 2014 14:07:04 -0000
Content-Type: text/plain; charset=UTF-8

Well, that's embarrassing. Thank you, Martin. Obviously, I forgot to push a
local commit. I guess I'd better move to the back of the bus!


On Wed, Jul 16, 2014 at 5:50 AM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> On Tue, Jul 15, 2014 at 04:32:34PM -0700, Tim Orling wrote:
> >      * Move recipes from meta-openembedded/meta-oe that are not
> >        depended upon by recipes already in meta-oe (e.g. gateone,
> >        anki)
> >
> >      * Recipes NOT moved:
> >        python-futures
> >        python-pyopenssl
> >        python-simplejson
> >        python-tornado
> >        python-pyqt
> >        python-sip
> >
> > Signed-off-by: Tim Orling <TicoTimo@gmail.com>
> > ---
> >  .../recipes-devtools/python => meta-python/recipes-python}/pyrtm_0.2.bb
>   | 0
> >  .../python => meta-python/recipes-python}/python-autobahn_0.8.6.bb
>    | 0
> >  .../python => meta-python/recipes-python}/python-cheetah_2.4.4.bb
>     | 0
> >  .../python => meta-python/recipes-python}/python-cloudeebus_0.6.0.bb
>    | 0
> >  .../python => meta-python/recipes-python}/python-cython_0.20.2.bb
>     | 0
> >  .../python => meta-python/recipes-python}/python-dateutil_1.5.bb
>    | 0
> >  .../python => meta-python/recipes-python}/python-epydoc_3.0.1.bb
>    | 0
> >  .../python => meta-python/recipes-python}/python-feedparser_5.1.3.bb
>    | 0
> >  .../python => meta-python/recipes-python}/python-gdata_1.2.4.bb
>     | 0
> >  .../python => meta-python/recipes-python}/python-gevent_0.13.8.bb
>     | 0
> >  .../python => meta-python/recipes-python}/python-greenlet_0.4.1.bb
>    | 0
> >  .../python => meta-python/recipes-python}/python-ldap/setup.cfg.patch
>   | 0
> >  .../python => meta-python/recipes-python}/python-ldap_2.3.9.bb
>    | 0
> >  .../python => meta-python/recipes-python}/python-lxml_3.0.2.bb
>    | 0
> >  .../0001-setup.py-link-in-sysroot-not-in-host-directories.patch
>   | 0
> >  .../python => meta-python/recipes-python}/python-m2crypto_0.21.1.bb
>     | 0
> >  .../recipes-python}/python-matplotlib/fix_setup.patch
>   | 0
> >  .../recipes-python}/python-matplotlib/fix_setupext.patch
>    | 0
> >  .../python => meta-python/recipes-python}/python-matplotlib_1.1.0.bb
>    | 0
> >  .../python =>
> meta-python/recipes-python}/python-numeric/no-lapack.patch  | 0
> >  .../python => meta-python/recipes-python}/python-numeric_24.2.bb
>    | 0
> >  .../python => meta-python/recipes-python}/python-pexpect_2.3.bb
>     | 0
> >  .../python => meta-python/recipes-python}/python-pip_1.3.1.bb
>     | 0
> >  .../python => meta-python/recipes-python}/python-psutil_0.6.1.bb
>    | 0
> >  .../python => meta-python/recipes-python}/python-pyalsaaudio_0.4.bb
>     | 0
> >  .../python => meta-python/recipes-python}/python-pyserial_2.4.bb
>    | 0
> >  .../python => meta-python/recipes-python}/python-pyudev_0.16.1.bb
>     | 0
> >  .../python => meta-python/recipes-python}/python-pyusb_1.0.0a2.bb
>     | 0
> >  .../python => meta-python/recipes-python}/python-pyyaml/setup.py
>    | 0
> >  .../python => meta-python/recipes-python}/python-pyyaml_3.10.bb
>     | 0
> >  .../python => meta-python/recipes-python}/python-smbus_3.0.3.bb
>     | 0
> >  .../python => meta-python/recipes-python}/python-sqlalchemy_0.7.9.bb
>    | 0
> >  .../python => meta-python/recipes-python}/python-twisted_13.2.0.bb
>    | 0
> >  .../python => meta-python/recipes-python}/python-vobject_0.8.1c.bb
>    | 0
> >  .../python => meta-python/recipes-python}/python-webdav_0.1.2.bb
>    | 0
> >  .../python => meta-python/recipes-python}/python-zopeinterface_4.1.1.bb
>   | 0
>
> meta-python/recipes-python/*bb isn't included in BBFILES, causing this
> warning:
> WARNING: No bb files matched BBFILE_PATTERN_meta-python
> '^/home/jenkins/oe/world/shr-core/meta-openembedded/meta-python/'
>
> I'll move them to python subdirectory, but please be more careful when
> sending _tested_ patches.
>
> >  36 files changed, 0 insertions(+), 0 deletions(-)
> >  rename {meta-oe/recipes-devtools/python => meta-python/recipes-python}/
> pyrtm_0.2.bb (100%)
> >  rename {meta-oe/recipes-devtools/python => meta-python/recipes-python}/
> python-autobahn_0.8.6.bb (100%)
> >  rename {meta-oe/recipes-devtools/python => meta-python/recipes-python}/
> python-cheetah_2.4.4.bb (100%)
> >  rename {meta-oe/recipes-devtools/python => meta-python/recipes-python}/
> python-cloudeebus_0.6.0.bb (100%)
> >  rename {meta-oe/recipes-devtools/python => meta-python/recipes-python}/
> python-cython_0.20.2.bb (100%)
> >  rename {meta-oe/recipes-devtools/python => meta-python/recipes-python}/
> python-dateutil_1.5.bb (100%)
> >  rename {meta-oe/recipes-devtools/python => meta-python/recipes-python}/
> python-epydoc_3.0.1.bb (100%)
> >  rename {meta-oe/recipes-devtools/python => meta-python/recipes-python}/
> python-feedparser_5.1.3.bb (100%)
> >  rename {meta-oe/recipes-devtools/python => meta-python/recipes-python}/
> python-gdata_1.2.4.bb (100%)
> >  rename {meta-oe/recipes-devtools/python => meta-python/recipes-python}/
> python-gevent_0.13.8.bb (100%)
> >  rename {meta-oe/recipes-devtools/python => meta-python/recipes-python}/
> python-greenlet_0.4.1.bb (100%)
> >  rename {meta-oe/recipes-devtools/python =>
> meta-python/recipes-python}/python-ldap/setup.cfg.patch (100%)
> >  rename {meta-oe/recipes-devtools/python => meta-python/recipes-python}/
> python-ldap_2.3.9.bb (100%)
> >  rename {meta-oe/recipes-devtools/python => meta-python/recipes-python}/
> python-lxml_3.0.2.bb (100%)
> >  rename {meta-oe/recipes-devtools/python =>
> meta-python/recipes-python}/python-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch
> (100%)
> >  rename {meta-oe/recipes-devtools/python => meta-python/recipes-python}/
> python-m2crypto_0.21.1.bb (100%)
> >  rename {meta-oe/recipes-devtools/python =>
> meta-python/recipes-python}/python-matplotlib/fix_setup.patch (100%)
> >  rename {meta-oe/recipes-devtools/python =>
> meta-python/recipes-python}/python-matplotlib/fix_setupext.patch (100%)
> >  rename {meta-oe/recipes-devtools/python => meta-python/recipes-python}/
> python-matplotlib_1.1.0.bb (100%)
> >  rename {meta-oe/recipes-devtools/python =>
> meta-python/recipes-python}/python-numeric/no-lapack.patch (100%)
> >  rename {meta-oe/recipes-devtools/python => meta-python/recipes-python}/
> python-numeric_24.2.bb (100%)
> >  rename {meta-oe/recipes-devtools/python => meta-python/recipes-python}/
> python-pexpect_2.3.bb (100%)
> >  rename {meta-oe/recipes-devtools/python => meta-python/recipes-python}/
> python-pip_1.3.1.bb (100%)
> >  rename {meta-oe/recipes-devtools/python => meta-python/recipes-python}/
> python-psutil_0.6.1.bb (100%)
> >  rename {meta-oe/recipes-devtools/python => meta-python/recipes-python}/
> python-pyalsaaudio_0.4.bb (100%)
> >  rename {meta-oe/recipes-devtools/python => meta-python/recipes-python}/
> python-pyserial_2.4.bb (100%)
> >  rename {meta-oe/recipes-devtools/python => meta-python/recipes-python}/
> python-pyudev_0.16.1.bb (100%)
> >  rename {meta-oe/recipes-devtools/python => meta-python/recipes-python}/
> python-pyusb_1.0.0a2.bb (100%)
> >  rename {meta-oe/recipes-devtools/python =>
> meta-python/recipes-python}/python-pyyaml/setup.py (100%)
> >  rename {meta-oe/recipes-devtools/python => meta-python/recipes-python}/
> python-pyyaml_3.10.bb (100%)
> >  rename {meta-oe/recipes-devtools/python => meta-python/recipes-python}/
> python-smbus_3.0.3.bb (100%)
> >  rename {meta-oe/recipes-devtools/python => meta-python/recipes-python}/
> python-sqlalchemy_0.7.9.bb (100%)
> >  rename {meta-oe/recipes-devtools/python => meta-python/recipes-python}/
> python-twisted_13.2.0.bb (100%)
> >  rename {meta-oe/recipes-devtools/python => meta-python/recipes-python}/
> python-vobject_0.8.1c.bb (100%)
> >  rename {meta-oe/recipes-devtools/python => meta-python/recipes-python}/
> python-webdav_0.1.2.bb (100%)
> >  rename {meta-oe/recipes-devtools/python => meta-python/recipes-python}/
> python-zopeinterface_4.1.1.bb (100%)
> >
> > diff --git a/meta-oe/recipes-devtools/python/pyrtm_0.2.bb
> b/meta-python/recipes-python/pyrtm_0.2.bb
> > similarity index 100%
> > rename from meta-oe/recipes-devtools/python/pyrtm_0.2.bb
> > rename to meta-python/recipes-python/pyrtm_0.2.bb
> > diff --git a/meta-oe/recipes-devtools/python/python-autobahn_0.8.6.bb
> b/meta-python/recipes-python/python-autobahn_0.8.6.bb
> > similarity index 100%
> > rename from meta-oe/recipes-devtools/python/python-autobahn_0.8.6.bb
> > rename to meta-python/recipes-python/python-autobahn_0.8.6.bb
> > diff --git a/meta-oe/recipes-devtools/python/python-cheetah_2.4.4.bb
> b/meta-python/recipes-python/python-cheetah_2.4.4.bb
> > similarity index 100%
> > rename from meta-oe/recipes-devtools/python/python-cheetah_2.4.4.bb
> > rename to meta-python/recipes-python/python-cheetah_2.4.4.bb
> > diff --git a/meta-oe/recipes-devtools/python/python-cloudeebus_0.6.0.bb
> b/meta-python/recipes-python/python-cloudeebus_0.6.0.bb
> > similarity index 100%
> > rename from meta-oe/recipes-devtools/python/python-cloudeebus_0.6.0.bb
> > rename to meta-python/recipes-python/python-cloudeebus_0.6.0.bb
> > diff --git a/meta-oe/recipes-devtools/python/python-cython_0.20.2.bb
> b/meta-python/recipes-python/python-cython_0.20.2.bb
> > similarity index 100%
> > rename from meta-oe/recipes-devtools/python/python-cython_0.20.2.bb
> > rename to meta-python/recipes-python/python-cython_0.20.2.bb
> > diff --git a/meta-oe/recipes-devtools/python/python-dateutil_1.5.bb
> b/meta-python/recipes-python/python-dateutil_1.5.bb
> > similarity index 100%
> > rename from meta-oe/recipes-devtools/python/python-dateutil_1.5.bb
> > rename to meta-python/recipes-python/python-dateutil_1.5.bb
> > diff --git a/meta-oe/recipes-devtools/python/python-epydoc_3.0.1.bb
> b/meta-python/recipes-python/python-epydoc_3.0.1.bb
> > similarity index 100%
> > rename from meta-oe/recipes-devtools/python/python-epydoc_3.0.1.bb
> > rename to meta-python/recipes-python/python-epydoc_3.0.1.bb
> > diff --git a/meta-oe/recipes-devtools/python/python-feedparser_5.1.3.bb
> b/meta-python/recipes-python/python-feedparser_5.1.3.bb
> > similarity index 100%
> > rename from meta-oe/recipes-devtools/python/python-feedparser_5.1.3.bb
> > rename to meta-python/recipes-python/python-feedparser_5.1.3.bb
> > diff --git a/meta-oe/recipes-devtools/python/python-gdata_1.2.4.bb
> b/meta-python/recipes-python/python-gdata_1.2.4.bb
> > similarity index 100%
> > rename from meta-oe/recipes-devtools/python/python-gdata_1.2.4.bb
> > rename to meta-python/recipes-python/python-gdata_1.2.4.bb
> > diff --git a/meta-oe/recipes-devtools/python/python-gevent_0.13.8.bb
> b/meta-python/recipes-python/python-gevent_0.13.8.bb
> > similarity index 100%
> > rename from meta-oe/recipes-devtools/python/python-gevent_0.13.8.bb
> > rename to meta-python/recipes-python/python-gevent_0.13.8.bb
> > diff --git a/meta-oe/recipes-devtools/python/python-greenlet_0.4.1.bb
> b/meta-python/recipes-python/python-greenlet_0.4.1.bb
> > similarity index 100%
> > rename from meta-oe/recipes-devtools/python/python-greenlet_0.4.1.bb
> > rename to meta-python/recipes-python/python-greenlet_0.4.1.bb
> > diff --git a/meta-oe/recipes-devtools/python/python-ldap/setup.cfg.patch
> b/meta-python/recipes-python/python-ldap/setup.cfg.patch
> > similarity index 100%
> > rename from meta-oe/recipes-devtools/python/python-ldap/setup.cfg.patch
> > rename to meta-python/recipes-python/python-ldap/setup.cfg.patch
> > diff --git a/meta-oe/recipes-devtools/python/python-ldap_2.3.9.bb
> b/meta-python/recipes-python/python-ldap_2.3.9.bb
> > similarity index 100%
> > rename from meta-oe/recipes-devtools/python/python-ldap_2.3.9.bb
> > rename to meta-python/recipes-python/python-ldap_2.3.9.bb
> > diff --git a/meta-oe/recipes-devtools/python/python-lxml_3.0.2.bb
> b/meta-python/recipes-python/python-lxml_3.0.2.bb
> > similarity index 100%
> > rename from meta-oe/recipes-devtools/python/python-lxml_3.0.2.bb
> > rename to meta-python/recipes-python/python-lxml_3.0.2.bb
> > diff --git
> a/meta-oe/recipes-devtools/python/python-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch
> b/meta-python/recipes-python/python-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch
> > similarity index 100%
> > rename from
> meta-oe/recipes-devtools/python/python-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch
> > rename to
> meta-python/recipes-python/python-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch
> > diff --git a/meta-oe/recipes-devtools/python/python-m2crypto_0.21.1.bb
> b/meta-python/recipes-python/python-m2crypto_0.21.1.bb
> > similarity index 100%
> > rename from meta-oe/recipes-devtools/python/python-m2crypto_0.21.1.bb
> > rename to meta-python/recipes-python/python-m2crypto_0.21.1.bb
> > diff --git
> a/meta-oe/recipes-devtools/python/python-matplotlib/fix_setup.patch
> b/meta-python/recipes-python/python-matplotlib/fix_setup.patch
> > similarity index 100%
> > rename from
> meta-oe/recipes-devtools/python/python-matplotlib/fix_setup.patch
> > rename to meta-python/recipes-python/python-matplotlib/fix_setup.patch
> > diff --git
> a/meta-oe/recipes-devtools/python/python-matplotlib/fix_setupext.patch
> b/meta-python/recipes-python/python-matplotlib/fix_setupext.patch
> > similarity index 100%
> > rename from
> meta-oe/recipes-devtools/python/python-matplotlib/fix_setupext.patch
> > rename to meta-python/recipes-python/python-matplotlib/fix_setupext.patch
> > diff --git a/meta-oe/recipes-devtools/python/python-matplotlib_1.1.0.bb
> b/meta-python/recipes-python/python-matplotlib_1.1.0.bb
> > similarity index 100%
> > rename from meta-oe/recipes-devtools/python/python-matplotlib_1.1.0.bb
> > rename to meta-python/recipes-python/python-matplotlib_1.1.0.bb
> > diff --git
> a/meta-oe/recipes-devtools/python/python-numeric/no-lapack.patch
> b/meta-python/recipes-python/python-numeric/no-lapack.patch
> > similarity index 100%
> > rename from
> meta-oe/recipes-devtools/python/python-numeric/no-lapack.patch
> > rename to meta-python/recipes-python/python-numeric/no-lapack.patch
> > diff --git a/meta-oe/recipes-devtools/python/python-numeric_24.2.bb
> b/meta-python/recipes-python/python-numeric_24.2.bb
> > similarity index 100%
> > rename from meta-oe/recipes-devtools/python/python-numeric_24.2.bb
> > rename to meta-python/recipes-python/python-numeric_24.2.bb
> > diff --git a/meta-oe/recipes-devtools/python/python-pexpect_2.3.bb
> b/meta-python/recipes-python/python-pexpect_2.3.bb
> > similarity index 100%
> > rename from meta-oe/recipes-devtools/python/python-pexpect_2.3.bb
> > rename to meta-python/recipes-python/python-pexpect_2.3.bb
> > diff --git a/meta-oe/recipes-devtools/python/python-pip_1.3.1.bb
> b/meta-python/recipes-python/python-pip_1.3.1.bb
> > similarity index 100%
> > rename from meta-oe/recipes-devtools/python/python-pip_1.3.1.bb
> > rename to meta-python/recipes-python/python-pip_1.3.1.bb
> > diff --git a/meta-oe/recipes-devtools/python/python-psutil_0.6.1.bb
> b/meta-python/recipes-python/python-psutil_0.6.1.bb
> > similarity index 100%
> > rename from meta-oe/recipes-devtools/python/python-psutil_0.6.1.bb
> > rename to meta-python/recipes-python/python-psutil_0.6.1.bb
> > diff --git a/meta-oe/recipes-devtools/python/python-pyalsaaudio_0.4.bb
> b/meta-python/recipes-python/python-pyalsaaudio_0.4.bb
> > similarity index 100%
> > rename from meta-oe/recipes-devtools/python/python-pyalsaaudio_0.4.bb
> > rename to meta-python/recipes-python/python-pyalsaaudio_0.4.bb
> > diff --git a/meta-oe/recipes-devtools/python/python-pyserial_2.4.bb
> b/meta-python/recipes-python/python-pyserial_2.4.bb
> > similarity index 100%
> > rename from meta-oe/recipes-devtools/python/python-pyserial_2.4.bb
> > rename to meta-python/recipes-python/python-pyserial_2.4.bb
> > diff --git a/meta-oe/recipes-devtools/python/python-pyudev_0.16.1.bb
> b/meta-python/recipes-python/python-pyudev_0.16.1.bb
> > similarity index 100%
> > rename from meta-oe/recipes-devtools/python/python-pyudev_0.16.1.bb
> > rename to meta-python/recipes-python/python-pyudev_0.16.1.bb
> > diff --git a/meta-oe/recipes-devtools/python/python-pyusb_1.0.0a2.bb
> b/meta-python/recipes-python/python-pyusb_1.0.0a2.bb
> > similarity index 100%
> > rename from meta-oe/recipes-devtools/python/python-pyusb_1.0.0a2.bb
> > rename to meta-python/recipes-python/python-pyusb_1.0.0a2.bb
> > diff --git a/meta-oe/recipes-devtools/python/python-pyyaml/setup.py
> b/meta-python/recipes-python/python-pyyaml/setup.py
> > similarity index 100%
> > rename from meta-oe/recipes-devtools/python/python-pyyaml/setup.py
> > rename to meta-python/recipes-python/python-pyyaml/setup.py
> > diff --git a/meta-oe/recipes-devtools/python/python-pyyaml_3.10.bb
> b/meta-python/recipes-python/python-pyyaml_3.10.bb
> > similarity index 100%
> > rename from meta-oe/recipes-devtools/python/python-pyyaml_3.10.bb
> > rename to meta-python/recipes-python/python-pyyaml_3.10.bb
> > diff --git a/meta-oe/recipes-devtools/python/python-smbus_3.0.3.bb
> b/meta-python/recipes-python/python-smbus_3.0.3.bb
> > similarity index 100%
> > rename from meta-oe/recipes-devtools/python/python-smbus_3.0.3.bb
> > rename to meta-python/recipes-python/python-smbus_3.0.3.bb
> > diff --git a/meta-oe/recipes-devtools/python/python-sqlalchemy_0.7.9.bb
> b/meta-python/recipes-python/python-sqlalchemy_0.7.9.bb
> > similarity index 100%
> > rename from meta-oe/recipes-devtools/python/python-sqlalchemy_0.7.9.bb
> > rename to meta-python/recipes-python/python-sqlalchemy_0.7.9.bb
> > diff --git a/meta-oe/recipes-devtools/python/python-twisted_13.2.0.bb
> b/meta-python/recipes-python/python-twisted_13.2.0.bb
> > similarity index 100%
> > rename from meta-oe/recipes-devtools/python/python-twisted_13.2.0.bb
> > rename to meta-python/recipes-python/python-twisted_13.2.0.bb
> > diff --git a/meta-oe/recipes-devtools/python/python-vobject_0.8.1c.bb
> b/meta-python/recipes-python/python-vobject_0.8.1c.bb
> > similarity index 100%
> > rename from meta-oe/recipes-devtools/python/python-vobject_0.8.1c.bb
> > rename to meta-python/recipes-python/python-vobject_0.8.1c.bb
> > diff --git a/meta-oe/recipes-devtools/python/python-webdav_0.1.2.bb
> b/meta-python/recipes-python/python-webdav_0.1.2.bb
> > similarity index 100%
> > rename from meta-oe/recipes-devtools/python/python-webdav_0.1.2.bb
> > rename to meta-python/recipes-python/python-webdav_0.1.2.bb
> > diff --git a/meta-oe/recipes-devtools/python/
> python-zopeinterface_4.1.1.bb b/meta-python/recipes-python/
> python-zopeinterface_4.1.1.bb
> > similarity index 100%
> > rename from meta-oe/recipes-devtools/python/
> python-zopeinterface_4.1.1.bb
> > rename to meta-python/recipes-python/python-zopeinterface_4.1.1.bb
> > --
> > 1.9.3
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>

