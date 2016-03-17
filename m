Return-Path: <psidhu@gateworks.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 8A08560290
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Mar 2016 22:59:26 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id l68so12027374wml.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Mar 2016 15:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gateworks-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=65eMzTJYMJiOUX8zAp6igDaq+LoLrZebc3Sv/d7yS18=;
	b=BUfkKKlxR3poUE4kJXFLlyTsx7M+Daexo+fA4DaYNL6rTwo0tSaXzIY36Sl95mgSbK
	a3qAZu5Q+QHXIUSfjCr4KAwVJ4VfepZZmP3qtcQfq/g/1/Fb2K3q+SxvgXjZh+Op3NeE
	oSGAPx+5+FHpzURm3xhjH+CQR5fWojD7usv5eXolNdtjaE7+JFlwHemyMJXrZYQzriMO
	VkgHiN31kaKAK8FAnwNowsmrvUAhJO10BU6KJQdmDSXB2vTPeaauVWm/6zdtGNLsAlKA
	0TbXK5iUIlP/NgIaHffpap6GZpt/08y8fCRLUT3Wbha12rDv0wbw0YBPjzu1IHQPuBI2
	52nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=65eMzTJYMJiOUX8zAp6igDaq+LoLrZebc3Sv/d7yS18=;
	b=g48PXqoR85iwYGsRMglosPGJdVYX+DXm3jg7xLIL8LrT8vO/ucbiv0Iq1yTvdLw5sT
	PltYIm5qjzrIeLoZiOO5jaYiIDmDb00I7dCW4DUmA8JMAVk52BTO/2pVRN3LZsjaSEms
	LnkNnb7k1OWVXI7kpmtEi6uM3IdtoTj2SshMsq/Mf2pKKZeBmvlwbP3rUzdvmAHwUGm0
	m8pGMQ32zmH8BoHy1xH6drhEssSSRAvSGq5tl7Y+wqf/vn13n9IQH7Pf0+Bjr0n8TGqm
	X3nM1xbYQTR50WOF49YZpEexxVFCchfThuUJvC74cYPGKTVmqwlsTMDPZiMAOo1V0bdZ
	PHUQ==
X-Gm-Message-State: AD7BkJJXCn+Ocp4fNiGwgW4IhkiinGoBGj4d/eW+JMT6DJZD2ekl7cOmvxJkEYvkGpZ1r7DLFKiQXZC0m7vbAQ==
X-Received: by 10.194.92.107 with SMTP id cl11mr14138860wjb.21.1458255566589; 
	Thu, 17 Mar 2016 15:59:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.234.38 with HTTP; Thu, 17 Mar 2016 15:58:57 -0700 (PDT)
In-Reply-To: <20160317215442.GL2553@jama>
References: <1457543217-11211-1-git-send-email-akuster808@gmail.com>
	<20160309191156.GH2542@jama> <56E07715.8060801@gmail.com>
	<CAD1M062aSMPUfMzCKZ2+8uZcV0q77sm3WHwvQexY2x5uO9hV+g@mail.gmail.com>
	<20160317215442.GL2553@jama>
From: Pushpal Sidhu <psidhu@gateworks.com>
Date: Thu, 17 Mar 2016 15:58:57 -0700
Message-ID: <CAD1M060=ju0KqoCJB4tJkwPFBt7KyKOMjXown-irMqpPKCs=ng@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-python][jethro][PATCH][V2] python-m2crypto: fix SSLv2 symbol issue
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
X-List-Received-Date: Thu, 17 Mar 2016 22:59:26 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Mar 17, 2016 at 2:54 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Mon, Mar 14, 2016 at 03:21:33PM -0700, Pushpal Sidhu wrote:
>> Hi,
>>
>> On Wed, Mar 9, 2016 at 11:18 AM, akuster808 <akuster808@gmail.com> wrote:
>> >
>> >
>> >
>> > On 03/09/2016 11:11 AM, Martin Jansa wrote:
>> > > On Wed, Mar 09, 2016 at 09:06:57AM -0800, Armin Kuster wrote:
>> > >> From: Armin Kuster <akuster@mvista.com>
>> > >>
>> > >> missed using "-D"  for OPENSSL_NO_SSL2 swig_features.
>> > >
>> > > fido version:
>> > > http://patchwork.openembedded.org/patch/117291/
>> > > needed -D as well, right?
>> >
>> > yes.
>> >
>> >
>> > >
>> > > I've pushed both to fido-next and jethro-next
>>
>> When will this be merged into fido/jethro? I've been running into this
>> build breakage for about a week now and if I patch it myself, I'll
>> only run into a conflict again later, causing more build issues.
>
> I'm still seeing multiple issues caused by last openssl upgrade, e.g.
> ruby, pywbem, crda
>
> Are they all supposed to be fixed by this?

Good point, it doesn't seem like they are because these tools haven't
been updated to stop supporting SSLv2. We either need to patch every
broken package or update them (which may or may not fix them). For
example, I bumped the crda package from 3.13 -> 3.18 (fido), but I
still run into this problem.

Another approach we can try is by updating m2crypto as Armin did here:
http://patchwork.openembedded.org/patch/117217/. This would have to be
backported all the way back to fido (unless openssl was updated for
other branches as well). Apparently, this fixes crda, might be a fix
for other packages as well?

- Pushpal

>> > thanks
>> > -armin
>> > >
>> > >>
>> > >> ERROR: Failed to import the "M2Crypto" module: .../usr/lib/python2.7/site-packages/M2Crypto/__m2crypto.so: undefined symbol: SSLv2_method
>> > >>
>> > >> disable using SSLv2_method if not supported in openssl. This is now the case
>> > >> with the advent of CVE-2016-0800
>> > >>
>> > >> Signed-off-by: Armin Kuster <akuster@mvista.com>
>> > >> ---
>> > >>  ...y_build_with_SSLv2_when_it_is_not_available.patch | 20 ++++++++++++++++++++
>> > >>  .../python/python-m2crypto_0.21.1.bb                 |  4 +++-
>> > >>  2 files changed, 23 insertions(+), 1 deletion(-)
>> > >>  create mode 100644 meta-python/recipes-devtools/python/python-m2crypto/dont_try_build_with_SSLv2_when_it_is_not_available.patch
>> > >>
>> > >> diff --git a/meta-python/recipes-devtools/python/python-m2crypto/dont_try_build_with_SSLv2_when_it_is_not_available.patch b/meta-python/recipes-devtools/python/python-m2crypto/dont_try_build_with_SSLv2_when_it_is_not_available.patch
>> > >> new file mode 100644
>> > >> index 0000000..526c23f
>> > >> --- /dev/null
>> > >> +++ b/meta-python/recipes-devtools/python/python-m2crypto/dont_try_build_with_SSLv2_when_it_is_not_available.patch
>> > >> @@ -0,0 +1,20 @@
>> > >> +Upstream-Status: Backport
>> > >> +https://gitlab.com/m2crypto/m2crypto/commit/ac01b38302474920288c1a9eb63fd35fa8d1db5b
>> > >> +
>> > >> +Signed-off-by: Armin Kuster <akuster@mvista.com>
>> > >> +
>> > >> +Index: M2Crypto-0.21.1/SWIG/_ssl.i
>> > >> +===================================================================
>> > >> +--- M2Crypto-0.21.1.orig/SWIG/_ssl.i
>> > >> ++++ M2Crypto-0.21.1/SWIG/_ssl.i
>> > >> +@@ -48,8 +48,10 @@ extern const char *SSL_alert_desc_string
>> > >> + %rename(ssl_get_alert_desc_v) SSL_alert_desc_string_long;
>> > >> + extern const char *SSL_alert_desc_string_long(int);
>> > >> +
>> > >> ++#ifndef OPENSSL_NO_SSL2
>> > >> + %rename(sslv2_method) SSLv2_method;
>> > >> + extern SSL_METHOD *SSLv2_method(void);
>> > >> ++#endif
>> > >> + %rename(sslv3_method) SSLv3_method;
>> > >> + extern SSL_METHOD *SSLv3_method(void);
>> > >> + %rename(sslv23_method) SSLv23_method;
>> > >> diff --git a/meta-python/recipes-devtools/python/python-m2crypto_0.21.1.bb b/meta-python/recipes-devtools/python/python-m2crypto_0.21.1.bb
>> > >> index ff6203f..9daea5e 100644
>> > >> --- a/meta-python/recipes-devtools/python/python-m2crypto_0.21.1.bb
>> > >> +++ b/meta-python/recipes-devtools/python/python-m2crypto_0.21.1.bb
>> > >> @@ -8,7 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=b0e1f0b7d0ce8a62c18b1287b991800e"
>> > >>
>> > >>  SRC_URI = "http://pypi.python.org/packages/source/M/M2Crypto/M2Crypto-${PV}.tar.gz \
>> > >>             file://0001-setup.py-link-in-sysroot-not-in-host-directories.patch \
>> > >> -           file://0001-M2Crypto-Error-fix.patch"
>> > >> +           file://0001-M2Crypto-Error-fix.patch \
>> > >> +           file://dont_try_build_with_SSLv2_when_it_is_not_available.patch"
>> > >>
>> > >>  SRC_URI[md5sum] = "f93d8462ff7646397a9f77a2fe602d17"
>> > >>  SRC_URI[sha256sum] = "25b94498505c2d800ee465db0cc1aff097b1615adc3ac042a1c85ceca264fc0a"
>> > >> @@ -19,6 +20,7 @@ inherit setuptools
>> > >>
>> > >>  SWIG_FEATURES_x86-64 = "-D__x86_64__"
>> > >>  SWIG_FEATURES ?= ""
>> > >> +SWIG_FEATURES += "-DOPENSSL_NO_SSL2"
>> > >>  export SWIG_FEATURES
>> > >>
>> > >>  # Get around a problem with swig, but only if the
>> > >> --
>> > >> 2.3.5
>> > >>
>> > >> --
>> > >> _______________________________________________
>> > >> Openembedded-devel mailing list
>> > >> Openembedded-devel@lists.openembedded.org
>> > >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> > >
>> > --
>> > _______________________________________________
>> > Openembedded-devel mailing list
>> > Openembedded-devel@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

