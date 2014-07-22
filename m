Return-Path: <ticotimo@gmail.com>
Received: from mail-la0-f49.google.com (mail-la0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id 6F647705FC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jul 2014 15:32:59 +0000 (UTC)
Received: by mail-la0-f49.google.com with SMTP id hz20so6186553lab.36
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jul 2014 08:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=dbYulZ1r+y5ZYzJhlTW07DyRygcDGasA9xLUm6dL5ic=;
	b=sfqoMvzO/wdwWrOa4vsBvE7yKmi+AyZw2/tyO7mGwFARjPfFtVb49FCLVBCR4+wRyT
	Vo+8fnngak2FIcVQ1mM9pU6kvu+mXdt5GgKqwVQJyJIR5voFu5F95z6Ue3DyBaL08dDI
	ZrMHP/jWqyFEu8cF+ywkC4BTicmf0B0eN/cjxvYf8+J7vEK88JD9Jyju9b5j2z5W4LsR
	ddd2jH/TPtdAJLBKzGdldQTVeZyYBLgFrfts4LoxG8M8ZED3ElAVeRZ19c9XXRgkyDcG
	BLxOgmhwY+QZtOFHYSqiE+4VvRjftOAM5MWYrLK9tj+KadqOkS7R9ZUJEO400Pk+5Ebm
	C7FQ==
MIME-Version: 1.0
X-Received: by 10.152.23.6 with SMTP id i6mr35560090laf.25.1406043180561; Tue,
	22 Jul 2014 08:33:00 -0700 (PDT)
Received: by 10.114.188.166 with HTTP; Tue, 22 Jul 2014 08:33:00 -0700 (PDT)
In-Reply-To: <1406028895-834-2-git-send-email-Martin.Jansa@gmail.com>
References: <1406028895-834-1-git-send-email-Martin.Jansa@gmail.com>
	<1406028895-834-2-git-send-email-Martin.Jansa@gmail.com>
Date: Tue, 22 Jul 2014 08:33:00 -0700
Message-ID: <CANx9H-B-XpPeLtcT0fGzNSNOn-gREp5MVQh7Su-kMpxBAsMt6g@mail.gmail.com>
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
X-List-Received-Date: Tue, 22 Jul 2014 15:33:06 -0000
Content-Type: text/plain; charset=UTF-8

I'd rather not keep the original structure, part of my motivation for
creating the layer was to not hide python recipes three directories deep.
The structure of the meta-perl layer seems more natural to me.

However, I realize and regret that the layer.conf in my original patch was
broken and I need to fix it. Please see v2 for meta-python creation.

--Tim


On Tue, Jul 22, 2014 at 4:34 AM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> * match old structure from meta-oe
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-python/{recipes-python => recipes-devtools}/python/pyrtm_0.2.bb
>  | 0
>  .../{recipes-python => recipes-devtools}/python/python-autobahn_0.8.6.bb
>  | 0
>  .../{recipes-python => recipes-devtools}/python/python-cheetah_2.4.4.bb
>   | 0
>  .../python/python-cloudeebus_0.6.0.bb
>   | 0
>  .../{recipes-python => recipes-devtools}/python/python-cython_0.20.2.bb
>   | 0
>  .../{recipes-python => recipes-devtools}/python/python-dateutil_1.5.bb
>  | 0
>  .../{recipes-python => recipes-devtools}/python/python-epydoc_3.0.1.bb
>  | 0
>  .../python/python-feedparser_5.1.3.bb
>   | 0
>  .../{recipes-python => recipes-devtools}/python/python-gdata_1.2.4.bb
>   | 0
>  .../{recipes-python => recipes-devtools}/python/python-gevent_0.13.8.bb
>   | 0
>  .../{recipes-python => recipes-devtools}/python/python-greenlet_0.4.1.bb
>  | 0
>  .../python/python-ldap/setup.cfg.patch
>  | 0
>  .../{recipes-python => recipes-devtools}/python/python-ldap_2.3.9.bb
>  | 0
>  .../{recipes-python => recipes-devtools}/python/python-lxml_3.0.2.bb
>  | 0
>  .../0001-setup.py-link-in-sysroot-not-in-host-directories.patch
> | 0
>  .../{recipes-python => recipes-devtools}/python/python-m2crypto_0.21.1.bb
> | 0
>  .../python/python-matplotlib/fix_setup.patch
>  | 0
>  .../python/python-matplotlib/fix_setupext.patch
> | 0
>  .../python/python-matplotlib_1.1.0.bb
>   | 0
>  .../python/python-numeric/no-lapack.patch
> | 0
>  .../{recipes-python => recipes-devtools}/python/python-numeric_24.2.bb
>  | 0
>  .../{recipes-python => recipes-devtools}/python/python-pexpect_2.3.bb
>   | 0
>  .../{recipes-python => recipes-devtools}/python/python-pip_1.3.1.bb
>   | 0
>  .../{recipes-python => recipes-devtools}/python/python-psutil_0.6.1.bb
>  | 0
>  .../{recipes-python => recipes-devtools}/python/python-pyalsaaudio_0.4.bb
> | 0
>  .../{recipes-python => recipes-devtools}/python/python-pyserial_2.4.bb
>  | 0
>  .../{recipes-python => recipes-devtools}/python/python-pyudev_0.16.1.bb
>   | 0
>  .../{recipes-python => recipes-devtools}/python/python-pyusb_1.0.0a2.bb
>   | 0
>  .../{recipes-python => recipes-devtools}/python/python-pyyaml/setup.py
>  | 0
>  .../{recipes-python => recipes-devtools}/python/python-pyyaml_3.10.bb
>   | 0
>  .../{recipes-python => recipes-devtools}/python/python-smbus_3.0.3.bb
>   | 0
>  .../python/python-sqlalchemy_0.7.9.bb
>   | 0
>  .../{recipes-python => recipes-devtools}/python/python-twisted_13.2.0.bb
>  | 0
>  .../{recipes-python => recipes-devtools}/python/python-vobject_0.8.1c.bb
>  | 0
>  .../{recipes-python => recipes-devtools}/python/python-webdav_0.1.2.bb
>  | 0
>  .../python/python-zopeinterface_4.1.1.bb
>  | 0
>  36 files changed, 0 insertions(+), 0 deletions(-)
>  rename meta-python/{recipes-python => recipes-devtools}/python/
> pyrtm_0.2.bb (100%)
>  rename meta-python/{recipes-python => recipes-devtools}/python/
> python-autobahn_0.8.6.bb (100%)
>  rename meta-python/{recipes-python => recipes-devtools}/python/
> python-cheetah_2.4.4.bb (100%)
>  rename meta-python/{recipes-python => recipes-devtools}/python/
> python-cloudeebus_0.6.0.bb (100%)
>  rename meta-python/{recipes-python => recipes-devtools}/python/
> python-cython_0.20.2.bb (100%)
>  rename meta-python/{recipes-python => recipes-devtools}/python/
> python-dateutil_1.5.bb (100%)
>  rename meta-python/{recipes-python => recipes-devtools}/python/
> python-epydoc_3.0.1.bb (100%)
>  rename meta-python/{recipes-python => recipes-devtools}/python/
> python-feedparser_5.1.3.bb (100%)
>  rename meta-python/{recipes-python => recipes-devtools}/python/
> python-gdata_1.2.4.bb (100%)
>  rename meta-python/{recipes-python => recipes-devtools}/python/
> python-gevent_0.13.8.bb (100%)
>  rename meta-python/{recipes-python => recipes-devtools}/python/
> python-greenlet_0.4.1.bb (100%)
>  rename meta-python/{recipes-python =>
> recipes-devtools}/python/python-ldap/setup.cfg.patch (100%)
>  rename meta-python/{recipes-python => recipes-devtools}/python/
> python-ldap_2.3.9.bb (100%)
>  rename meta-python/{recipes-python => recipes-devtools}/python/
> python-lxml_3.0.2.bb (100%)
>  rename meta-python/{recipes-python =>
> recipes-devtools}/python/python-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch
> (100%)
>  rename meta-python/{recipes-python => recipes-devtools}/python/
> python-m2crypto_0.21.1.bb (100%)
>  rename meta-python/{recipes-python =>
> recipes-devtools}/python/python-matplotlib/fix_setup.patch (100%)
>  rename meta-python/{recipes-python =>
> recipes-devtools}/python/python-matplotlib/fix_setupext.patch (100%)
>  rename meta-python/{recipes-python => recipes-devtools}/python/
> python-matplotlib_1.1.0.bb (100%)
>  rename meta-python/{recipes-python =>
> recipes-devtools}/python/python-numeric/no-lapack.patch (100%)
>  rename meta-python/{recipes-python => recipes-devtools}/python/
> python-numeric_24.2.bb (100%)
>  rename meta-python/{recipes-python => recipes-devtools}/python/
> python-pexpect_2.3.bb (100%)
>  rename meta-python/{recipes-python => recipes-devtools}/python/
> python-pip_1.3.1.bb (100%)
>  rename meta-python/{recipes-python => recipes-devtools}/python/
> python-psutil_0.6.1.bb (100%)
>  rename meta-python/{recipes-python => recipes-devtools}/python/
> python-pyalsaaudio_0.4.bb (100%)
>  rename meta-python/{recipes-python => recipes-devtools}/python/
> python-pyserial_2.4.bb (100%)
>  rename meta-python/{recipes-python => recipes-devtools}/python/
> python-pyudev_0.16.1.bb (100%)
>  rename meta-python/{recipes-python => recipes-devtools}/python/
> python-pyusb_1.0.0a2.bb (100%)
>  rename meta-python/{recipes-python =>
> recipes-devtools}/python/python-pyyaml/setup.py (100%)
>  rename meta-python/{recipes-python => recipes-devtools}/python/
> python-pyyaml_3.10.bb (100%)
>  rename meta-python/{recipes-python => recipes-devtools}/python/
> python-smbus_3.0.3.bb (100%)
>  rename meta-python/{recipes-python => recipes-devtools}/python/
> python-sqlalchemy_0.7.9.bb (100%)
>  rename meta-python/{recipes-python => recipes-devtools}/python/
> python-twisted_13.2.0.bb (100%)
>  rename meta-python/{recipes-python => recipes-devtools}/python/
> python-vobject_0.8.1c.bb (100%)
>  rename meta-python/{recipes-python => recipes-devtools}/python/
> python-webdav_0.1.2.bb (100%)
>  rename meta-python/{recipes-python => recipes-devtools}/python/
> python-zopeinterface_4.1.1.bb (100%)
>
> diff --git a/meta-python/recipes-python/python/pyrtm_0.2.bb
> b/meta-python/recipes-devtools/python/pyrtm_0.2.bb
> similarity index 100%
> rename from meta-python/recipes-python/python/pyrtm_0.2.bb
> rename to meta-python/recipes-devtools/python/pyrtm_0.2.bb
> diff --git a/meta-python/recipes-python/python/python-autobahn_0.8.6.bb
> b/meta-python/recipes-devtools/python/python-autobahn_0.8.6.bb
> similarity index 100%
> rename from meta-python/recipes-python/python/python-autobahn_0.8.6.bb
> rename to meta-python/recipes-devtools/python/python-autobahn_0.8.6.bb
> diff --git a/meta-python/recipes-python/python/python-cheetah_2.4.4.bb
> b/meta-python/recipes-devtools/python/python-cheetah_2.4.4.bb
> similarity index 100%
> rename from meta-python/recipes-python/python/python-cheetah_2.4.4.bb
> rename to meta-python/recipes-devtools/python/python-cheetah_2.4.4.bb
> diff --git a/meta-python/recipes-python/python/python-cloudeebus_0.6.0.bb
> b/meta-python/recipes-devtools/python/python-cloudeebus_0.6.0.bb
> similarity index 100%
> rename from meta-python/recipes-python/python/python-cloudeebus_0.6.0.bb
> rename to meta-python/recipes-devtools/python/python-cloudeebus_0.6.0.bb
> diff --git a/meta-python/recipes-python/python/python-cython_0.20.2.bb
> b/meta-python/recipes-devtools/python/python-cython_0.20.2.bb
> similarity index 100%
> rename from meta-python/recipes-python/python/python-cython_0.20.2.bb
> rename to meta-python/recipes-devtools/python/python-cython_0.20.2.bb
> diff --git a/meta-python/recipes-python/python/python-dateutil_1.5.bb
> b/meta-python/recipes-devtools/python/python-dateutil_1.5.bb
> similarity index 100%
> rename from meta-python/recipes-python/python/python-dateutil_1.5.bb
> rename to meta-python/recipes-devtools/python/python-dateutil_1.5.bb
> diff --git a/meta-python/recipes-python/python/python-epydoc_3.0.1.bb
> b/meta-python/recipes-devtools/python/python-epydoc_3.0.1.bb
> similarity index 100%
> rename from meta-python/recipes-python/python/python-epydoc_3.0.1.bb
> rename to meta-python/recipes-devtools/python/python-epydoc_3.0.1.bb
> diff --git a/meta-python/recipes-python/python/python-feedparser_5.1.3.bb
> b/meta-python/recipes-devtools/python/python-feedparser_5.1.3.bb
> similarity index 100%
> rename from meta-python/recipes-python/python/python-feedparser_5.1.3.bb
> rename to meta-python/recipes-devtools/python/python-feedparser_5.1.3.bb
> diff --git a/meta-python/recipes-python/python/python-gdata_1.2.4.bb
> b/meta-python/recipes-devtools/python/python-gdata_1.2.4.bb
> similarity index 100%
> rename from meta-python/recipes-python/python/python-gdata_1.2.4.bb
> rename to meta-python/recipes-devtools/python/python-gdata_1.2.4.bb
> diff --git a/meta-python/recipes-python/python/python-gevent_0.13.8.bb
> b/meta-python/recipes-devtools/python/python-gevent_0.13.8.bb
> similarity index 100%
> rename from meta-python/recipes-python/python/python-gevent_0.13.8.bb
> rename to meta-python/recipes-devtools/python/python-gevent_0.13.8.bb
> diff --git a/meta-python/recipes-python/python/python-greenlet_0.4.1.bb
> b/meta-python/recipes-devtools/python/python-greenlet_0.4.1.bb
> similarity index 100%
> rename from meta-python/recipes-python/python/python-greenlet_0.4.1.bb
> rename to meta-python/recipes-devtools/python/python-greenlet_0.4.1.bb
> diff --git a/meta-python/recipes-python/python/python-ldap/setup.cfg.patch
> b/meta-python/recipes-devtools/python/python-ldap/setup.cfg.patch
> similarity index 100%
> rename from meta-python/recipes-python/python/python-ldap/setup.cfg.patch
> rename to meta-python/recipes-devtools/python/python-ldap/setup.cfg.patch
> diff --git a/meta-python/recipes-python/python/python-ldap_2.3.9.bb
> b/meta-python/recipes-devtools/python/python-ldap_2.3.9.bb
> similarity index 100%
> rename from meta-python/recipes-python/python/python-ldap_2.3.9.bb
> rename to meta-python/recipes-devtools/python/python-ldap_2.3.9.bb
> diff --git a/meta-python/recipes-python/python/python-lxml_3.0.2.bb
> b/meta-python/recipes-devtools/python/python-lxml_3.0.2.bb
> similarity index 100%
> rename from meta-python/recipes-python/python/python-lxml_3.0.2.bb
> rename to meta-python/recipes-devtools/python/python-lxml_3.0.2.bb
> diff --git
> a/meta-python/recipes-python/python/python-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch
> b/meta-python/recipes-devtools/python/python-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch
> similarity index 100%
> rename from
> meta-python/recipes-python/python/python-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch
> rename to
> meta-python/recipes-devtools/python/python-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch
> diff --git a/meta-python/recipes-python/python/python-m2crypto_0.21.1.bb
> b/meta-python/recipes-devtools/python/python-m2crypto_0.21.1.bb
> similarity index 100%
> rename from meta-python/recipes-python/python/python-m2crypto_0.21.1.bb
> rename to meta-python/recipes-devtools/python/python-m2crypto_0.21.1.bb
> diff --git
> a/meta-python/recipes-python/python/python-matplotlib/fix_setup.patch
> b/meta-python/recipes-devtools/python/python-matplotlib/fix_setup.patch
> similarity index 100%
> rename from
> meta-python/recipes-python/python/python-matplotlib/fix_setup.patch
> rename to
> meta-python/recipes-devtools/python/python-matplotlib/fix_setup.patch
> diff --git
> a/meta-python/recipes-python/python/python-matplotlib/fix_setupext.patch
> b/meta-python/recipes-devtools/python/python-matplotlib/fix_setupext.patch
> similarity index 100%
> rename from
> meta-python/recipes-python/python/python-matplotlib/fix_setupext.patch
> rename to
> meta-python/recipes-devtools/python/python-matplotlib/fix_setupext.patch
> diff --git a/meta-python/recipes-python/python/python-matplotlib_1.1.0.bb
> b/meta-python/recipes-devtools/python/python-matplotlib_1.1.0.bb
> similarity index 100%
> rename from meta-python/recipes-python/python/python-matplotlib_1.1.0.bb
> rename to meta-python/recipes-devtools/python/python-matplotlib_1.1.0.bb
> diff --git
> a/meta-python/recipes-python/python/python-numeric/no-lapack.patch
> b/meta-python/recipes-devtools/python/python-numeric/no-lapack.patch
> similarity index 100%
> rename from
> meta-python/recipes-python/python/python-numeric/no-lapack.patch
> rename to
> meta-python/recipes-devtools/python/python-numeric/no-lapack.patch
> diff --git a/meta-python/recipes-python/python/python-numeric_24.2.bb
> b/meta-python/recipes-devtools/python/python-numeric_24.2.bb
> similarity index 100%
> rename from meta-python/recipes-python/python/python-numeric_24.2.bb
> rename to meta-python/recipes-devtools/python/python-numeric_24.2.bb
> diff --git a/meta-python/recipes-python/python/python-pexpect_2.3.bb
> b/meta-python/recipes-devtools/python/python-pexpect_2.3.bb
> similarity index 100%
> rename from meta-python/recipes-python/python/python-pexpect_2.3.bb
> rename to meta-python/recipes-devtools/python/python-pexpect_2.3.bb
> diff --git a/meta-python/recipes-python/python/python-pip_1.3.1.bb
> b/meta-python/recipes-devtools/python/python-pip_1.3.1.bb
> similarity index 100%
> rename from meta-python/recipes-python/python/python-pip_1.3.1.bb
> rename to meta-python/recipes-devtools/python/python-pip_1.3.1.bb
> diff --git a/meta-python/recipes-python/python/python-psutil_0.6.1.bb
> b/meta-python/recipes-devtools/python/python-psutil_0.6.1.bb
> similarity index 100%
> rename from meta-python/recipes-python/python/python-psutil_0.6.1.bb
> rename to meta-python/recipes-devtools/python/python-psutil_0.6.1.bb
> diff --git a/meta-python/recipes-python/python/python-pyalsaaudio_0.4.bb
> b/meta-python/recipes-devtools/python/python-pyalsaaudio_0.4.bb
> similarity index 100%
> rename from meta-python/recipes-python/python/python-pyalsaaudio_0.4.bb
> rename to meta-python/recipes-devtools/python/python-pyalsaaudio_0.4.bb
> diff --git a/meta-python/recipes-python/python/python-pyserial_2.4.bb
> b/meta-python/recipes-devtools/python/python-pyserial_2.4.bb
> similarity index 100%
> rename from meta-python/recipes-python/python/python-pyserial_2.4.bb
> rename to meta-python/recipes-devtools/python/python-pyserial_2.4.bb
> diff --git a/meta-python/recipes-python/python/python-pyudev_0.16.1.bb
> b/meta-python/recipes-devtools/python/python-pyudev_0.16.1.bb
> similarity index 100%
> rename from meta-python/recipes-python/python/python-pyudev_0.16.1.bb
> rename to meta-python/recipes-devtools/python/python-pyudev_0.16.1.bb
> diff --git a/meta-python/recipes-python/python/python-pyusb_1.0.0a2.bb
> b/meta-python/recipes-devtools/python/python-pyusb_1.0.0a2.bb
> similarity index 100%
> rename from meta-python/recipes-python/python/python-pyusb_1.0.0a2.bb
> rename to meta-python/recipes-devtools/python/python-pyusb_1.0.0a2.bb
> diff --git a/meta-python/recipes-python/python/python-pyyaml/setup.py
> b/meta-python/recipes-devtools/python/python-pyyaml/setup.py
> similarity index 100%
> rename from meta-python/recipes-python/python/python-pyyaml/setup.py
> rename to meta-python/recipes-devtools/python/python-pyyaml/setup.py
> diff --git a/meta-python/recipes-python/python/python-pyyaml_3.10.bb
> b/meta-python/recipes-devtools/python/python-pyyaml_3.10.bb
> similarity index 100%
> rename from meta-python/recipes-python/python/python-pyyaml_3.10.bb
> rename to meta-python/recipes-devtools/python/python-pyyaml_3.10.bb
> diff --git a/meta-python/recipes-python/python/python-smbus_3.0.3.bb
> b/meta-python/recipes-devtools/python/python-smbus_3.0.3.bb
> similarity index 100%
> rename from meta-python/recipes-python/python/python-smbus_3.0.3.bb
> rename to meta-python/recipes-devtools/python/python-smbus_3.0.3.bb
> diff --git a/meta-python/recipes-python/python/python-sqlalchemy_0.7.9.bb
> b/meta-python/recipes-devtools/python/python-sqlalchemy_0.7.9.bb
> similarity index 100%
> rename from meta-python/recipes-python/python/python-sqlalchemy_0.7.9.bb
> rename to meta-python/recipes-devtools/python/python-sqlalchemy_0.7.9.bb
> diff --git a/meta-python/recipes-python/python/python-twisted_13.2.0.bb
> b/meta-python/recipes-devtools/python/python-twisted_13.2.0.bb
> similarity index 100%
> rename from meta-python/recipes-python/python/python-twisted_13.2.0.bb
> rename to meta-python/recipes-devtools/python/python-twisted_13.2.0.bb
> diff --git a/meta-python/recipes-python/python/python-vobject_0.8.1c.bb
> b/meta-python/recipes-devtools/python/python-vobject_0.8.1c.bb
> similarity index 100%
> rename from meta-python/recipes-python/python/python-vobject_0.8.1c.bb
> rename to meta-python/recipes-devtools/python/python-vobject_0.8.1c.bb
> diff --git a/meta-python/recipes-python/python/python-webdav_0.1.2.bb
> b/meta-python/recipes-devtools/python/python-webdav_0.1.2.bb
> similarity index 100%
> rename from meta-python/recipes-python/python/python-webdav_0.1.2.bb
> rename to meta-python/recipes-devtools/python/python-webdav_0.1.2.bb
> diff --git a/meta-python/recipes-python/python/
> python-zopeinterface_4.1.1.bb b/meta-python/recipes-devtools/python/
> python-zopeinterface_4.1.1.bb
> similarity index 100%
> rename from meta-python/recipes-python/python/
> python-zopeinterface_4.1.1.bb
> rename to meta-python/recipes-devtools/python/
> python-zopeinterface_4.1.1.bb
> --
> 2.0.2
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

