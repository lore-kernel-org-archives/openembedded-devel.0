Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 37D7C731C2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Feb 2017 02:02:53 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id r18so1188258wmd.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Feb 2017 18:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6wAqZ/4qO909m+vDmYs5cgabwTHqtvU28GDXRR7tzzs=;
	b=QcMy2yvPooxJVHq7FcU+FyuMZYN3lo3GDAa0Wwjqt3Fzm4BNtu235d1Z9XZz+khNWH
	jow6LeSwsCIddwnQGOuy5d9Xk7QHTCECrwr7XWemTDzb9rAtx+hITBhzohd9HND74R2b
	LGychqhZbVcK3m24EHrxUEBXOFc0GkuAf5wuA2ph4DNgHkmt7iJuA4g3+mE8qaWSteRc
	5z0u15s5W8DqMyY0bJiOvB28zgcEsabPGMCNnXgvKyxwKmjkTgV88HbZ85Poh3y1Z1iG
	5CxvgAg/BpSCPFPUfBQIsLtNrE7w8BIMD+4TVfYdIU/vwZl4H1fx8mU5Bg0RMXmHGQAI
	rV4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6wAqZ/4qO909m+vDmYs5cgabwTHqtvU28GDXRR7tzzs=;
	b=N0+htN84+yuPNMnFddXOQIaQBrI0YailDbtKHk7EWKLye05Y8Hsk1Urv3scE4r44D9
	QZpBMZMTVTLsV4JOUJy6JPxRHqIezRuliOU5qzLnEA5ymeY1N5HcNYY+tfPoXmaO6Opp
	CZU3jCOmUinp/hcHC7b3v89JawGfxx5A3DbQSmU/1tJcS0DZPjsicO/UMF3JhW9+LLBu
	7hFhMLwjRBCSKVrnJwp3wwLTvk77G3awSZfve35bwN+Z/lAM4bbABolEfIx25lahD/Tw
	aj6O3Xa8IQ7ZJt9NNhy2bZLf9N+Bb6QSuu19I93mNd59tdM7v5R4Y9S3me1UVF/yD5g6
	9k4Q==
X-Gm-Message-State: AMke39mna0rgx2WSNf+Vbet7fmceToCMhu9a+ZLAtDO8aExuNfog+hPmX4OsmCDwYf9Too5P+koxNjjKOu3adA==
X-Received: by 10.223.136.109 with SMTP id e42mr22630342wre.14.1487037773889; 
	Mon, 13 Feb 2017 18:02:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.148.174 with HTTP; Mon, 13 Feb 2017 18:02:53 -0800 (PST)
In-Reply-To: <c4bac685-65c4-5c6d-07c6-d721c5b9eb73@windriver.com>
References: <cover.1486980186.git.liezhi.yang@windriver.com>
	<20170213173710.GA856@jama>
	<c4bac685-65c4-5c6d-07c6-d721c5b9eb73@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 14 Feb 2017 03:02:53 +0100
Message-ID: <CA+chaQe0XP-NcddCF5k7rmkoqjY0VP+fxbkRPC-AknmwpR83jg@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 00/13] fix for dependencies issues
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
X-List-Received-Date: Tue, 14 Feb 2017 02:02:57 -0000
Content-Type: text/plain; charset=UTF-8

Hi Robert,

thanks for update, can you update them also to remove PNBLACKLIST in those
recipes which should be fixed by this?

The python-pbr one looks strange, why should ${PN} rdepend on -native? Does
it work in rungime? Doesn't inherit setuptools do better job with this
dependency?

On Tue, Feb 14, 2017 at 2:51 AM, Robert Yang <liezhi.yang@windriver.com>
wrote:

>
> Hi Martin,
>
> Thanks, there are 3 patches remaining based on master-next, the postgresql
> needs another patch in oe-core to fix build with tcl, I will send it to
> oe-core later.
>
>   git://git.openembedded.org/meta-openembedded-contrib rbt/deps
>   http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=rbt/deps
>
> Robert Yang (3):
>   postgresql: add gettext-native and tcl-native to DEPENDS
>   udisks: add dbus-glib-native to DEPENDS
>   python-pbr: add python-setuptools-native to DEPENDS
>
>  meta-oe/recipes-support/postgresql/postgresql.inc        | 5 ++---
>  meta-oe/recipes-support/udisks/udisks_1.0.5.bb           | 4 +++-
>  meta-python/recipes-devtools/python/python-pbr_1.10.0.bb | 1 +
>  3 files changed, 6 insertions(+), 4 deletions(-)
>
>
> // Robert
>
>
> On 02/14/2017 01:37 AM, Martin Jansa wrote:
>
>> On Mon, Feb 13, 2017 at 02:04:14AM -0800, Robert Yang wrote:
>>
>>> The following changes since commit 5ecbf9bab404af0de7d0f058d1620f
>>> 40dae0d2d8:
>>>
>>>   poppler: update to 0.51.0 (2017-01-25 16:00:02 +0100)
>>>
>>> are available in the git repository at:
>>>
>>>   git://git.openembedded.org/meta-openembedded-contrib rbt/deps
>>>   http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=rbt/deps
>>>
>>
>> Please rebase your changes on top of current master-next, because some of
>> them duplicated older changes already on ML (and in master-next) and
>> send the remaining ones (if there are any still needed).
>>
>> Robert Yang (13):
>>>   dibbler: fix SRC_URI from ${P} to ${BP}
>>>   postgresql: add gettext-native and tcl-native to DEPENDS
>>>   udisks: add dbus-glib-native to DEPENDS
>>>   udisks2: add libxslt-native to DEPENDS
>>>   xfdesktop: add dbus-glib-native to DEPENDS
>>>   xfce4-notifyd: add dbus-glib-native to DEPENDS
>>>   python-pbr: add python-setuptools-native to DEPENDS
>>>   sthttpd: add base-passwd to DEPENDS
>>>   nostromo: add base-passwd to DEPENDS
>>>   openflow: inherit pkgconfig
>>>   openconnect: add gettext-native to DEPENDS
>>>   gnome-disk-utility: add dbus-glib-native to DEPENDS
>>>   libnet-ssleay-perl: fix EXTRALIBS and LDLOADLIBS
>>>
>>>  .../recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb    |
>>> 5 ++++-
>>>  meta-networking/recipes-connectivity/dibbler/dibbler_1.0.1.bb        |
>>> 2 +-
>>>  meta-networking/recipes-connectivity/openconnect/openconnect_git.bb  |
>>> 2 +-
>>>  meta-networking/recipes-protocols/openflow/openflow.inc              |
>>> 2 +-
>>>  meta-oe/recipes-support/postgresql/postgresql.inc                    |
>>> 5 ++---
>>>  meta-oe/recipes-support/udisks/udisks2_2.1.7.bb                      |
>>> 4 +++-
>>>  meta-oe/recipes-support/udisks/udisks_1.0.5.bb                       |
>>> 4 +++-
>>>  meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.65.bb             |
>>> 4 ++--
>>>  meta-python/recipes-devtools/python/python-pbr_1.10.0.bb             |
>>> 1 +
>>>  meta-webserver/recipes-httpd/nostromo/nostromo_1.9.6.bb              |
>>> 2 +-
>>>  meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.0.bb               |
>>> 2 ++
>>>  meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.3.4.bb          |
>>> 4 +++-
>>>  meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.12.3.bb                 |
>>> 4 +++-
>>>  13 files changed, 27 insertions(+), 14 deletions(-)
>>>
>>> --
>>> 2.9.0
>>>
>>>
>>

