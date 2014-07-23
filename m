Return-Path: <stephen.arnold42@gmail.com>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 3F09C70786
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Jul 2014 01:03:13 +0000 (UTC)
Received: by mail-wg0-f45.google.com with SMTP id x12so422102wgg.16
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jul 2014 18:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=Ip0AE1XYLsBeOIfGY0pBuX6u5RKVi+8yC6y5sDhbLiA=;
	b=lenfXwNKc+wLsOS6+rILF9x5v9FTsz9sF8nwoaZB0wQ4SD8K5XwgiDuRpJ528ZLHqX
	Zcq1u5CUNZo2yDWfgPNk2nkLYUxFWApMVt+CLufxbF9yMoylSc0MUVPzSaOIZe4FjdB3
	IcjsclrKdtqdKbBXWA2LEqqMEFm8AcA16WM9OYKBq5H7c7IwyOu3RSzPdlMZn8FgY0Wh
	X4icnsRyvi2CkHxAk15XYVnryzUCy5nmMy5S6dH51U4yPorqFWk9zN0+YkDvOYLXGId/
	Fdf3cfXHGjS+CXVHeKPL/c3UnWa2cBwU3M2pX+3OQ4G7atKCAyi4bkE8Lw/q3KGWgzu7
	kHRA==
MIME-Version: 1.0
X-Received: by 10.194.92.244 with SMTP id cp20mr39887948wjb.109.1406077394548; 
	Tue, 22 Jul 2014 18:03:14 -0700 (PDT)
Received: by 10.194.18.114 with HTTP; Tue, 22 Jul 2014 18:03:14 -0700 (PDT)
In-Reply-To: <20140722190116.GY22875@jama>
References: <cover.1405465524.git.TicoTimo@gmail.com>
	<20140722190116.GY22875@jama>
Date: Tue, 22 Jul 2014 18:03:14 -0700
Message-ID: <CAOLEWZVAwu4nRBUuSsES-qPqY5T7YubtwTeB=uxssqgy5JA+Yg@mail.gmail.com>
From: Stephen Arnold <stephen.arnold42@gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH 0/2] meta-python creation
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
X-List-Received-Date: Wed, 23 Jul 2014 01:03:16 -0000
Content-Type: text/plain; charset=UTF-8

And when you say "depend" in that context, you mean add it to your local
bblayers, right?

Just checking...

Steve


On Tue, Jul 22, 2014 at 12:01 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> On Tue, Jul 15, 2014 at 04:32:32PM -0700, Tim Orling wrote:
> > ********
> > This layer is intended to be the home of python modules for OpenEmbedded.
> > Modules in this layer need to be independent of openembedded-core and
> > meta-openembedded/meta-oe. Because of this, modules required by 'gateone'
> > and 'anki' are not included and remain in:
> >         meta-openembedded/meta-oe/recipes-devtools/python.
>
> meta-networking/README should be updated to depend on meta-python
>
> ERROR: Nothing PROVIDES 'python-m2crypto-native' (but
> meta-oe/meta-networking/recipes-connectivity/crda/crda_1.1.3.bb DEPENDS
> on or otherwise requires it).
>
> >
> > Maintainers:
> >         Tim "moto-timo" Orling <TicoTimo@gmail.com>
> >         Paul "bluelightning" Eggleton <paul.eggleton@linux.intel.com>
> > ********
> >
> > The following changes since commit
> 239debcd8a0359aad64406476b801948f9b8ff14:
> >
> >   usleep: add 1.0 recipe (2014-07-15 15:03:43 +0200)
> >
> > are available in the git repository at:
> >
> >   git://git.openembedded.org/meta-openembedded-contrib timo/meta-python
> >
> http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=timo/meta-python
> >
> > Tim Orling (2):
> >   meta-python: create layer
> >   meta-python: move recipes from meta-oe
> >
> >  meta-python/COPYING.MIT                            | 17 +++++++
> >  meta-python/README                                 | 53
> ++++++++++++++++++++++
> >  meta-python/conf/layer.conf                        |  9 ++++
> >  .../recipes-python}/pyrtm_0.2.bb                   |  0
> >  .../recipes-python}/python-autobahn_0.8.6.bb       |  0
> >  .../recipes-python}/python-cheetah_2.4.4.bb        |  0
> >  .../recipes-python}/python-cloudeebus_0.6.0.bb     |  0
> >  .../recipes-python}/python-cython_0.20.2.bb        |  0
> >  .../recipes-python}/python-dateutil_1.5.bb         |  0
> >  .../recipes-python}/python-epydoc_3.0.1.bb         |  0
> >  .../recipes-python}/python-feedparser_5.1.3.bb     |  0
> >  .../recipes-python}/python-gdata_1.2.4.bb          |  0
> >  .../recipes-python}/python-gevent_0.13.8.bb        |  0
> >  .../recipes-python}/python-greenlet_0.4.1.bb       |  0
> >  .../recipes-python}/python-ldap/setup.cfg.patch    |  0
> >  .../recipes-python}/python-ldap_2.3.9.bb           |  0
> >  .../recipes-python}/python-lxml_3.0.2.bb           |  0
> >  ...y-link-in-sysroot-not-in-host-directories.patch |  0
> >  .../recipes-python}/python-m2crypto_0.21.1.bb      |  0
> >  .../python-matplotlib/fix_setup.patch              |  0
> >  .../python-matplotlib/fix_setupext.patch           |  0
> >  .../recipes-python}/python-matplotlib_1.1.0.bb     |  0
> >  .../recipes-python}/python-numeric/no-lapack.patch |  0
> >  .../recipes-python}/python-numeric_24.2.bb         |  0
> >  .../recipes-python}/python-pexpect_2.3.bb          |  0
> >  .../recipes-python}/python-pip_1.3.1.bb            |  0
> >  .../recipes-python}/python-psutil_0.6.1.bb         |  0
> >  .../recipes-python}/python-pyalsaaudio_0.4.bb      |  0
> >  .../recipes-python}/python-pyserial_2.4.bb         |  0
> >  .../recipes-python}/python-pyudev_0.16.1.bb        |  0
> >  .../recipes-python}/python-pyusb_1.0.0a2.bb        |  0
> >  .../recipes-python}/python-pyyaml/setup.py         |  0
> >  .../recipes-python}/python-pyyaml_3.10.bb          |  0
> >  .../recipes-python}/python-smbus_3.0.3.bb          |  0
> >  .../recipes-python}/python-sqlalchemy_0.7.9.bb     |  0
> >  .../recipes-python}/python-twisted_13.2.0.bb       |  0
> >  .../recipes-python}/python-vobject_0.8.1c.bb       |  0
> >  .../recipes-python}/python-webdav_0.1.2.bb         |  0
> >  .../recipes-python}/python-zopeinterface_4.1.1.bb  |  0
> >  39 files changed, 79 insertions(+)
> >  create mode 100644 meta-python/COPYING.MIT
> >  create mode 100644 meta-python/README
> >  create mode 100644 meta-python/conf/layer.conf
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

