Received: from 64.mail-out.ovh.net ([91.121.185.65])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1PY1xB-0003z4-ID
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Dec 2010 20:44:57 +0100
Received: (qmail 14473 invoked by uid 503); 29 Dec 2010 19:27:19 -0000
Received: from b6.ovh.net (HELO mail32.ha.ovh.net) (213.186.33.56)
	by 64.mail-out.ovh.net with SMTP; 29 Dec 2010 19:27:19 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 29 Dec 2010 21:44:42 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.2.15?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 29 Dec 2010 21:44:41 +0200
Message-ID: <4D1B8FA8.2040400@eukrea.com>
Date: Wed, 29 Dec 2010 20:44:40 +0100
From: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Lightning/1.0b3pre Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1293644563.4238.7.camel@mattotaupa>	<1293645497-22323-1-git-send-email-Martin.Jansa@gmail.com>
	<AANLkTimF8brtuRiXYU-kNRQQdur8FpM9=Xo4cGdJxyAG@mail.gmail.com>
In-Reply-To: <AANLkTimF8brtuRiXYU-kNRQQdur8FpM9=Xo4cGdJxyAG@mail.gmail.com>
X-Ovh-Tracer-Id: 10351805218561109321
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: Re: [PATCH 1/2] glib-2.0, dbus: drop dbus's dependency on glib and add dbus dependency to glib-2.0_2.26.1
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
X-List-Received-Date: Wed, 29 Dec 2010 19:44:57 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/12/2010 19:58, Khem Raj wrote:
> On Wed, Dec 29, 2010 at 9:58 AM, Martin Jansa<martin.jansa@gmail.com>  wrote:
>> Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
>
> Acked-by: Khem Raj<raj.khem@gmail.com>
>
>> ---
>>   recipes/dbus/dbus.inc               |    2 +-
>>   recipes/glib-2.0/glib-2.0_2.26.1.bb |    4 ++--
>>   2 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/recipes/dbus/dbus.inc b/recipes/dbus/dbus.inc
>> index 73fc426..c235f74 100644
>> --- a/recipes/dbus/dbus.inc
>> +++ b/recipes/dbus/dbus.inc
>> @@ -2,7 +2,7 @@ DESCRIPTION = "A message bus system for inter-process communication"
>>   HOMEPAGE = "http://dbus.freedesktop.org"
>>   SECTION = "base"
>>   LICENSE = "GPLv2+ AFLv2.1"
>> -DEPENDS = "expat glib-2.0 virtual/libintl libsm libice virtual/libx11"
>> +DEPENDS = "expat virtual/libintl libsm libice virtual/libx11"
>>
>>   INC_PR = "r19"
>>
>> diff --git a/recipes/glib-2.0/glib-2.0_2.26.1.bb b/recipes/glib-2.0/glib-2.0_2.26.1.bb
>> index d95f894..5f7dbce 100644
>> --- a/recipes/glib-2.0/glib-2.0_2.26.1.bb
>> +++ b/recipes/glib-2.0/glib-2.0_2.26.1.bb
>> @@ -6,9 +6,9 @@ UNIX-like platforms, Windows, OS/2 and BeOS."
>>   LICENSE = "LGPLv2+"
>>   SECTION = "libs"
>>   PRIORITY = "optional"
>> -DEPENDS = "glib-2.0-native gtk-doc zlib"
>> +DEPENDS = "glib-2.0-native gtk-doc zlib dbus"
>>   DEPENDS_virtclass-native = "gettext-native gtk-doc-native \
>> -                            pkgconfig-native"
>> +                            pkgconfig-native dbus-native"
>>

dbus dependency is not needed for glib-2.26.1. Compilation fails only on one 
test program (in gio/test) which is enabled because configure calls pkgconfig 
to detect dbus and OE's pkgconfig detects dbus-1.pc which was installed by 
dbus-native because PKG_CONFIG_PATH contains both native and non native 
directories.

A patch to workaround this in glib will come in a few minutes.

Eric


