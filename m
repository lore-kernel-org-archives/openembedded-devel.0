Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5F127731C2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Feb 2017 01:51:16 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v1E1pFlu023233
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 13 Feb 2017 17:51:15 -0800
Received: from [128.224.162.160] (128.224.162.160) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 13 Feb 2017 17:51:14 -0800
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1486980186.git.liezhi.yang@windriver.com>
	<20170213173710.GA856@jama>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <c4bac685-65c4-5c6d-07c6-d721c5b9eb73@windriver.com>
Date: Tue, 14 Feb 2017 09:51:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <20170213173710.GA856@jama>
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Tue, 14 Feb 2017 01:51:19 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


Hi Martin,

Thanks, there are 3 patches remaining based on master-next, the postgresql
needs another patch in oe-core to fix build with tcl, I will send it to
oe-core later.

   git://git.openembedded.org/meta-openembedded-contrib rbt/deps
   http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=rbt/deps

Robert Yang (3):
   postgresql: add gettext-native and tcl-native to DEPENDS
   udisks: add dbus-glib-native to DEPENDS
   python-pbr: add python-setuptools-native to DEPENDS

  meta-oe/recipes-support/postgresql/postgresql.inc        | 5 ++---
  meta-oe/recipes-support/udisks/udisks_1.0.5.bb           | 4 +++-
  meta-python/recipes-devtools/python/python-pbr_1.10.0.bb | 1 +
  3 files changed, 6 insertions(+), 4 deletions(-)


// Robert

On 02/14/2017 01:37 AM, Martin Jansa wrote:
> On Mon, Feb 13, 2017 at 02:04:14AM -0800, Robert Yang wrote:
>> The following changes since commit 5ecbf9bab404af0de7d0f058d1620f40dae0d2d8:
>>
>>   poppler: update to 0.51.0 (2017-01-25 16:00:02 +0100)
>>
>> are available in the git repository at:
>>
>>   git://git.openembedded.org/meta-openembedded-contrib rbt/deps
>>   http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=rbt/deps
>
> Please rebase your changes on top of current master-next, because some of
> them duplicated older changes already on ML (and in master-next) and
> send the remaining ones (if there are any still needed).
>
>> Robert Yang (13):
>>   dibbler: fix SRC_URI from ${P} to ${BP}
>>   postgresql: add gettext-native and tcl-native to DEPENDS
>>   udisks: add dbus-glib-native to DEPENDS
>>   udisks2: add libxslt-native to DEPENDS
>>   xfdesktop: add dbus-glib-native to DEPENDS
>>   xfce4-notifyd: add dbus-glib-native to DEPENDS
>>   python-pbr: add python-setuptools-native to DEPENDS
>>   sthttpd: add base-passwd to DEPENDS
>>   nostromo: add base-passwd to DEPENDS
>>   openflow: inherit pkgconfig
>>   openconnect: add gettext-native to DEPENDS
>>   gnome-disk-utility: add dbus-glib-native to DEPENDS
>>   libnet-ssleay-perl: fix EXTRALIBS and LDLOADLIBS
>>
>>  .../recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb    | 5 ++++-
>>  meta-networking/recipes-connectivity/dibbler/dibbler_1.0.1.bb        | 2 +-
>>  meta-networking/recipes-connectivity/openconnect/openconnect_git.bb  | 2 +-
>>  meta-networking/recipes-protocols/openflow/openflow.inc              | 2 +-
>>  meta-oe/recipes-support/postgresql/postgresql.inc                    | 5 ++---
>>  meta-oe/recipes-support/udisks/udisks2_2.1.7.bb                      | 4 +++-
>>  meta-oe/recipes-support/udisks/udisks_1.0.5.bb                       | 4 +++-
>>  meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.65.bb             | 4 ++--
>>  meta-python/recipes-devtools/python/python-pbr_1.10.0.bb             | 1 +
>>  meta-webserver/recipes-httpd/nostromo/nostromo_1.9.6.bb              | 2 +-
>>  meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.0.bb               | 2 ++
>>  meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.3.4.bb          | 4 +++-
>>  meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.12.3.bb                 | 4 +++-
>>  13 files changed, 27 insertions(+), 14 deletions(-)
>>
>> --
>> 2.9.0
>>
>

