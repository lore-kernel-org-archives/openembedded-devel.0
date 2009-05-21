Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1M7AYs-0008Sr-ED
	for openembedded-devel@openembedded.org; Thu, 21 May 2009 17:52:05 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1M7ARV-0006J7-2f
	for openembedded-devel@openembedded.org; Thu, 21 May 2009 15:44:25 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 21 May 2009 15:44:25 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 21 May 2009 15:44:25 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 21 May 2009 17:44:13 +0200
Message-ID: <gv3sse$qs0$1@ger.gmane.org>
References: <gv3n7s$1gg$1@ger.gmane.org>	<1242917441-29996-1-git-send-email-ihar.hrachyshka@gmail.com>
	<fce2a370905210837w24570b90u33ee641630dfe19@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b5pre) Gecko/20090515 Shredder/3.0b3pre
In-Reply-To: <fce2a370905210837w24570b90u33ee641630dfe19@mail.gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH] gst-plugins: fixed pattern for meta package dependencies.
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
X-List-Received-Date: Thu, 21 May 2009 15:52:09 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21-05-09 17:37, Ihar Hrachyshka wrote:
> I just got that locale packages _don't_ end with 'locale'. Resending
> reworked patch.

*facepalm* I just realized the same *after* applying the patch. Oops...

>
> On Thu, May 21, 2009 at 5:50 PM, Ihar Hrachyshka
> <ihar.hrachyshka@gmail.com>  wrote:
>> This fixes package name matching so that gst-plugins-*-meta
>> packages include all the plugin ones. The current matching
>> implementation doesn't make meta packages depend on gst-plugins
>> with 'locale' and 'dev' in their names (f.e. gstfbdevsink).
>> Also use INC_PR for gstremer-plugins as requested on ML.
>>
>> Signed-off-by: Ihar Hrachyshka<ihar.hrachyshka@gmail.com>
>> ---
>>   recipes/gstreamer/gst-plugins-bad_0.10.11.bb     |    2 ++
>>   recipes/gstreamer/gst-plugins-bad_0.10.6.bb      |    3 ++-
>>   recipes/gstreamer/gst-plugins-base_0.10.17.bb    |    2 ++
>>   recipes/gstreamer/gst-plugins-base_0.10.22.bb    |    2 ++
>>   recipes/gstreamer/gst-plugins-base_0.10.23.bb    |    2 ++
>>   recipes/gstreamer/gst-plugins-good_0.10.13.bb    |    2 +-
>>   recipes/gstreamer/gst-plugins-good_0.10.14.bb    |    2 ++
>>   recipes/gstreamer/gst-plugins-ugly-sid_0.10.7.bb |    3 ++-
>>   recipes/gstreamer/gst-plugins-ugly_0.10.10.bb    |    2 +-
>>   recipes/gstreamer/gst-plugins-ugly_0.10.11.bb    |    2 ++
>>   recipes/gstreamer/gst-plugins.inc                |    4 +++-
>>   11 files changed, 21 insertions(+), 5 deletions(-)
>>
>> diff --git a/recipes/gstreamer/gst-plugins-bad_0.10.11.bb b/recipes/gstreamer/gst-plugins-bad_0.10.11.bb
>> index dbfe6a9..a90b88e 100644
>> --- a/recipes/gstreamer/gst-plugins-bad_0.10.11.bb
>> +++ b/recipes/gstreamer/gst-plugins-bad_0.10.11.bb
>> @@ -1,5 +1,7 @@
>>   require gst-plugins.inc
>>
>> +PR = "${INC_PR}.1"
>> +
>>   SRC_URI += "file://vorbisenc.h file://vorbisdec.h \
>>              file://ivorbis-thumb.patch;patch=1"
>>   DEPENDS += "gst-plugins-base directfb"
>> diff --git a/recipes/gstreamer/gst-plugins-bad_0.10.6.bb b/recipes/gstreamer/gst-plugins-bad_0.10.6.bb
>> index df7bf75..bfc7217 100644
>> --- a/recipes/gstreamer/gst-plugins-bad_0.10.6.bb
>> +++ b/recipes/gstreamer/gst-plugins-bad_0.10.6.bb
>> @@ -1,5 +1,6 @@
>>   require gst-plugins.inc
>> -PR = "r2"
>> +
>> +PR = "${INC_PR}.1"
>>
>>   SRC_URI += "file://vorbisenc.h file://vorbisdec.h \
>>              file://gst-plugins-directfb-fix.patch;patch=1;pnum=2 \
>> diff --git a/recipes/gstreamer/gst-plugins-base_0.10.17.bb b/recipes/gstreamer/gst-plugins-base_0.10.17.bb
>> index 0a1f17f..3b07668 100644
>> --- a/recipes/gstreamer/gst-plugins-base_0.10.17.bb
>> +++ b/recipes/gstreamer/gst-plugins-base_0.10.17.bb
>> @@ -1,5 +1,7 @@
>>   require gst-plugins.inc
>>
>> +PR = "${INC_PR}.1"
>> +
>>   PROVIDES += "gst-plugins"
>>
>>   # gst-plugins-base only builds the alsa plugin
>> diff --git a/recipes/gstreamer/gst-plugins-base_0.10.22.bb b/recipes/gstreamer/gst-plugins-base_0.10.22.bb
>> index 3086d93..bcbfd68 100644
>> --- a/recipes/gstreamer/gst-plugins-base_0.10.22.bb
>> +++ b/recipes/gstreamer/gst-plugins-base_0.10.22.bb
>> @@ -1,5 +1,7 @@
>>   require gst-plugins.inc
>>
>> +PR = "${INC_PR}.1"
>> +
>>   PROVIDES += "gst-plugins"
>>
>>   PR = "r2"
>> diff --git a/recipes/gstreamer/gst-plugins-base_0.10.23.bb b/recipes/gstreamer/gst-plugins-base_0.10.23.bb
>> index d3bfb6c..26dcfe3 100644
>> --- a/recipes/gstreamer/gst-plugins-base_0.10.23.bb
>> +++ b/recipes/gstreamer/gst-plugins-base_0.10.23.bb
>> @@ -1,5 +1,7 @@
>>   require gst-plugins.inc
>>
>> +PR = "${INC_PR}.1"
>> +
>>   PROVIDES += "gst-plugins"
>>
>>   # gst-plugins-base only builds the alsa plugin
>> diff --git a/recipes/gstreamer/gst-plugins-good_0.10.13.bb b/recipes/gstreamer/gst-plugins-good_0.10.13.bb
>> index b77d1fc..d077d06 100644
>> --- a/recipes/gstreamer/gst-plugins-good_0.10.13.bb
>> +++ b/recipes/gstreamer/gst-plugins-good_0.10.13.bb
>> @@ -1,6 +1,6 @@
>>   require gst-plugins.inc
>>
>> -PR = "r1"
>> +PR = "${INC_PR}.1"
>>
>>   inherit gconf
>>
>> diff --git a/recipes/gstreamer/gst-plugins-good_0.10.14.bb b/recipes/gstreamer/gst-plugins-good_0.10.14.bb
>> index d9f0349..d077d06 100644
>> --- a/recipes/gstreamer/gst-plugins-good_0.10.14.bb
>> +++ b/recipes/gstreamer/gst-plugins-good_0.10.14.bb
>> @@ -1,5 +1,7 @@
>>   require gst-plugins.inc
>>
>> +PR = "${INC_PR}.1"
>> +
>>   inherit gconf
>>
>>   EXTRA_OECONF += " --enable-experimental  --enable-gst_v4l2 --enable-gconftool  --enable-external --with-check=no"
>> diff --git a/recipes/gstreamer/gst-plugins-ugly-sid_0.10.7.bb b/recipes/gstreamer/gst-plugins-ugly-sid_0.10.7.bb
>> index 77c4184..40a4eb2 100644
>> --- a/recipes/gstreamer/gst-plugins-ugly-sid_0.10.7.bb
>> +++ b/recipes/gstreamer/gst-plugins-ugly-sid_0.10.7.bb
>> @@ -1,7 +1,8 @@
>>   require gst-plugins.inc
>>   DEPENDS += "gst-plugins-base libsidplay"
>>   PROVIDES += "gst-plugin-sid"
>> -PR = "r5"
>> +
>> +PR = "${INC_PR}.1"
>>
>>   SRC_URI = "\
>>    http://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.bz2 \
>> diff --git a/recipes/gstreamer/gst-plugins-ugly_0.10.10.bb b/recipes/gstreamer/gst-plugins-ugly_0.10.10.bb
>> index 0678e22..9c28d20 100644
>> --- a/recipes/gstreamer/gst-plugins-ugly_0.10.10.bb
>> +++ b/recipes/gstreamer/gst-plugins-ugly_0.10.10.bb
>> @@ -1,6 +1,6 @@
>>   require gst-plugins.inc
>>
>> -PR = "r1"
>> +PR = "${INC_PR}.1"
>>
>>   DEPENDS += "gst-plugins-base mpeg2dec libsidplay"
>>
>> diff --git a/recipes/gstreamer/gst-plugins-ugly_0.10.11.bb b/recipes/gstreamer/gst-plugins-ugly_0.10.11.bb
>> index 0624041..9c28d20 100644
>> --- a/recipes/gstreamer/gst-plugins-ugly_0.10.11.bb
>> +++ b/recipes/gstreamer/gst-plugins-ugly_0.10.11.bb
>> @@ -1,5 +1,7 @@
>>   require gst-plugins.inc
>>
>> +PR = "${INC_PR}.1"
>> +
>>   DEPENDS += "gst-plugins-base mpeg2dec libsidplay"
>>
>>   SRC_URI += "\
>> diff --git a/recipes/gstreamer/gst-plugins.inc b/recipes/gstreamer/gst-plugins.inc
>> index bcb3e39..536555c 100644
>> --- a/recipes/gstreamer/gst-plugins.inc
>> +++ b/recipes/gstreamer/gst-plugins.inc
>> @@ -3,6 +3,8 @@ DESCRIPTION = "Plugins for GStreamer"
>>   DEPENDS = "gstreamer libmikmod liboil libogg tremor libvorbis"
>>   DEPENDS += "${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'libmad libid3tag', d)}"
>>
>> +INC_PR = "r5"
>> +
>>   PACKAGES_DYNAMIC = "gst-plugin-*"
>>
>>   SRC_URI = "http://gstreamer.freedesktop.org/src/${PN}/${PN}-${PV}.tar.bz2"
>> @@ -33,7 +35,7 @@ python populate_packages_prepend () {
>>         metapkg_rdepends = []
>>         packages = bb.data.getVar('PACKAGES', d, 1).split()
>>         for pkg in packages[1:]:
>> -               if not pkg in blacklist and not pkg in metapkg_rdepends and not pkg.count('dev') and not pkg.count( 'locale' ):
>> +               if not pkg in blacklist and not pkg in metapkg_rdepends and not pkg.endswith('-dev') and not pkg.endswith('-locale'):
>>                         metapkg_rdepends.append(pkg)
>>         bb.data.setVar('RDEPENDS_' + metapkg, ' '.join(metapkg_rdepends), d)
>>         bb.data.setVar('DESCRIPTION_' + metapkg, pn + ' meta package', d)
>> --
>> 1.6.3.1
>>
>>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel




