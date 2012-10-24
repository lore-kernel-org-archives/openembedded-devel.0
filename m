Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei.adrianx.dinu@intel.com>) id 1TQz4H-0001BR-N2
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Oct 2012 13:24:14 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 24 Oct 2012 04:10:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,639,1344236400"; d="scan'208";a="239444741"
Received: from adinu-vostro-460 (HELO [10.237.105.39]) ([10.237.105.39])
	by fmsmga002.fm.intel.com with ESMTP; 24 Oct 2012 03:40:31 -0700
Message-ID: <5087C5E1.80105@intel.com>
Date: Wed, 24 Oct 2012 13:41:37 +0300
From: Andrei Dinu <andrei.adrianx.dinu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <1351073335-28110-1-git-send-email-andrei.adrianx.dinu@intel.com>
	<20121024101220.GB3269@jama.jama.net>
In-Reply-To: <20121024101220.GB3269@jama.jama.net>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe] gypsy: added gypsy to meta-oe/recipes-connectivity
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
X-List-Received-Date: Wed, 24 Oct 2012 11:24:14 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Should i submit a new patch with the gypsy in recipes-navigation?

I spoke to Ross Burton about the bug/patch and he suggested adding only 
the tarball, that's

why i didn't include the git recipe too.

I'm waiting for your answer.

Thanks,

Andrei Dinu

On 10/24/2012 01:12 PM, Martin Jansa wrote:
> On Wed, Oct 24, 2012 at 01:08:55PM +0300, Andrei Dinu wrote:
>> This patch is related to bug https://bugzilla.yoctoproject.org/show_bug.cgi?id=2797.
> Ah I forgot to mention that recipes-navigation would be better directory
> for this.
>
> And you can add that updated git recipe too.
>
> Cheers,
>
>> Signed-off-by: Andrei Dinu <andrei.adrianx.dinu@intel.com>
>> ---
>>   .../recipes-connectivity/gypsy/files/fixups.patch  |   21 +++++++++++++++++
>>   meta-oe/recipes-connectivity/gypsy/gypsy.inc       |   15 ++++++++++++
>>   meta-oe/recipes-connectivity/gypsy/gypsy_0.9.bb    |   24 ++++++++++++++++++++
>>   3 files changed, 60 insertions(+)
>>   create mode 100644 meta-oe/recipes-connectivity/gypsy/files/fixups.patch
>>   create mode 100644 meta-oe/recipes-connectivity/gypsy/gypsy.inc
>>   create mode 100644 meta-oe/recipes-connectivity/gypsy/gypsy_0.9.bb
>>
>> diff --git a/meta-oe/recipes-connectivity/gypsy/files/fixups.patch b/meta-oe/recipes-connectivity/gypsy/files/fixups.patch
>> new file mode 100644
>> index 0000000..de4d92e
>> --- /dev/null
>> +++ b/meta-oe/recipes-connectivity/gypsy/files/fixups.patch
>> @@ -0,0 +1,21 @@
>> +Upstream-Status: Inappropriate [configuration]
>> +
>> +---
>> + docs/reference/Makefile.am |    2 ++
>> + 1 file changed, 2 insertions(+)
>> +
>> +--- gypsy.orig/docs/reference/Makefile.am
>> ++++ gypsy/docs/reference/Makefile.am
>> +@@ -81,10 +81,12 @@ expand_content_files=
>> + # e.g. GTKDOC_LIBS=$(top_builddir)/gtk/$(gtktargetlib)
>> +
>> + INCLUDES=-I$(top_srcdir) $(GYPSY_CFLAGS)
>> + GTKDOC_LIBS=$(top_builddir)/gypsy/libgypsy.la $(GYPSY_LIBS)
>> +
>> ++EXTRA_DIST =
>> ++CLEANFILES =
>> + # This includes the standard gtk-doc make rules, copied by gtkdocize.
>> + include $(top_srcdir)/gtk-doc.make
>> +
>> + # Other files to distribute
>> + # e.g. EXTRA_DIST += version.xml.in
>> diff --git a/meta-oe/recipes-connectivity/gypsy/gypsy.inc b/meta-oe/recipes-connectivity/gypsy/gypsy.inc
>> new file mode 100644
>> index 0000000..0c1735e
>> --- /dev/null
>> +++ b/meta-oe/recipes-connectivity/gypsy/gypsy.inc
>> @@ -0,0 +1,15 @@
>> +SUMMARY = "GPS Multiplexing Daemon"
>> +DESCRIPTION = "Gypsy is a GPS multiplexing daemon which allows \
>> +multiple clients to access GPS data from multiple GPS sources \
>> +concurrently.  Gypsy also hides the details of parsing NMEA from the \
>> +client applications, passing the data as simple values for the clients \
>> +to use."
>> +LICENSE = "GPLv2.0 & LGPLv2.1"
>> +SECTION = "x11"
>> +DEPENDS = "glib-2.0 dbus bluez4 dbus-glib"
>> +
>> +inherit autotools pkgconfig gtk-doc
>> +
>> +EXTRA_OECONF += "--with-distro=debian"
>> +
>> +FILES_${PN} += "/usr/share/dbus-1/services/"
>> diff --git a/meta-oe/recipes-connectivity/gypsy/gypsy_0.9.bb b/meta-oe/recipes-connectivity/gypsy/gypsy_0.9.bb
>> new file mode 100644
>> index 0000000..51207c9
>> --- /dev/null
>> +++ b/meta-oe/recipes-connectivity/gypsy/gypsy_0.9.bb
>> @@ -0,0 +1,24 @@
>> +SUMMARY = "GPS Multiplexing Daemon"
>> +DESCRIPTION = "Gypsy is a GPS multiplexing daemon which allows \
>> +multiple clients to access GPS data from multiple GPS sources \
>> +concurrently.  Gypsy also hides the details of parsing NMEA from the \
>> +client applications, passing the data as simple values for the clients \
>> +to use."
>> +LICENSE = "GPLv2+ & LGPLv2+"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
>> +                    file://COPYING.lib;md5=7fbc338309ac38fefcd64b04bb903e34 \
>> +                    file://src/main.c;beginline=1;endline=25;md5=3fe64e27e61b289b77383a54a982cbdd \
>> +                    file://gypsy/gypsy-time.h;beginline=1;endline=24;md5=06432ea19a7b6607428d04d9dadc37fd"
>> +
>> +SECTION = "x11"
>> +DEPENDS = "glib-2.0 dbus bluez4 dbus-glib libxslt"
>> +
>> +SRC_URI = "http://gypsy.freedesktop.org/releases/gypsy-${PV}.tar.gz"
>> +PR = "r1"
>> +
>> +inherit autotools pkgconfig
>> +
>> +FILES_${PN} += "/usr/share/dbus-1/system-services/"
>> +
>> +SRC_URI[md5sum] = "e2d186df9c2cc3b70a027043e22acf1a"
>> +SRC_URI[sha256sum] = "14e1cbe17351f408538e033ca370b4bf51ccf9c88744e236ddfb271904f154d6"
>> -- 
>> 1.7.9.5
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



