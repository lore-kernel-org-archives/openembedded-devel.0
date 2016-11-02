Return-Path: <Kai.Iskratsch@zenotrack.com>
Received: from zenotrack.com (zenotrack.com [213.164.30.194])
	by mail.openembedded.org (Postfix) with ESMTP id CFD4C71BDF
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Nov 2016 07:00:06 +0000 (UTC)
Received: from linux-k058.site (192.168.2.82) by VSVR02.ZenoTrack.local
	(192.168.2.242) with Microsoft SMTP Server (TLS) id 14.3.319.2;
	Wed, 2 Nov 2016 07:59:32 +0100
X-ZyXEL-AS-Log: ZW110-zt-zywall-1-MailContent-VirusOutbreak-DNSBL
X-ZyXEL-AS-DLog: eClass[1]-eVirusThreatLevel[0]-RefId[str=0001.0A0C0203.58198EF9.0120,
	ss=1, re=0.000, recu=0.000, reip=0]     
To: <openembedded-devel@lists.openembedded.org>
References: <20161028112529.28464-1-kai.iskratsch@zenotrack.com>
	<82cf8d34-0c55-f3ea-ebfa-b184a7c1c478@zenotrack.com>
	<20161101180631.GD2985@jama>
From: Kai Iskratsch <kai.iskratsch@zenotrack.com>
Message-ID: <6c1d94fb-0d97-974c-9119-2b21086eb102@zenotrack.com>
Date: Wed, 2 Nov 2016 08:00:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20161101180631.GD2985@jama>
X-Originating-IP: [192.168.2.82]
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-gnome, jethro][PATCH] fix zenity build, and remove blacklist
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
X-List-Received-Date: Wed, 02 Nov 2016 07:00:07 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

At work we only use a jethro based system, when we tried updating to 
krogoth we were getting lots of build errors so company decission was to 
stay with jethro. So i doubt i will get time allocated for testing the 
patch with master or krogoth. So all i can do is send patches for jethro 
or no patches at all.

The zenity receipe is unchanged in master so the patch should apply in 
master too, so its likely it works there too, but build could fail on 
new problems and I don't want to send it in for master without testing.



On 2016-11-01 19:06, Martin Jansa wrote:
> On Fri, Oct 28, 2016 at 04:17:47PM +0200, Kai Iskratsch wrote:
>> Zenity was blacklisted in meta-gnome, but it seems the fixes for the
>> problem listed in blacklist reason were rather minimal,
>>
>> additionally the newer version of libnotify no longer has the notify_notification_new_with_status_icon function, so this
>> had to be replaced with notify_notification_new to get the build to complete
> Is this already fixed in krogoth, morty and master?
>
> I don't think so, so it needs to be fixed in master first and then it
> might be backported into older releases.
>
>> ---
>>    .../0002-fix-build-with-newer-libnotify.patch      | 28 ++++++++++++++++++++++
>>    meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb   | 12 ++++++----
>>    2 files changed, 35 insertions(+), 5 deletions(-)
>>    create mode 100644 meta-gnome/recipes-gnome/zenity/files/0002-fix-build-with-newer-libnotify.patch
>>
>> diff --git a/meta-gnome/recipes-gnome/zenity/files/0002-fix-build-with-newer-libnotify.patch b/meta-gnome/recipes-gnome/zenity/files/0002-fix-build-with-newer-libnotify.patch
>> new file mode 100644
>> index 0000000..67501c8
>> --- /dev/null
>> +++ b/meta-gnome/recipes-gnome/zenity/files/0002-fix-build-with-newer-libnotify.patch
>> @@ -0,0 +1,28 @@
>> +From 87f5f2acbf4f2cad50a0d1ea389d7170fe325b4e Mon Sep 17 00:00:00 2001
>> +From: Kai Iskratsch <kai.iskratsch@zenotrack.com>
>> +Date: Thu, 27 Oct 2016 13:08:40 +0200
>> +Subject: [PATCH] fix build with newer libnotify
>> +
>> +---
>> + src/notification.c | 4 ++--
>> + 1 file changed, 2 insertions(+), 2 deletions(-)
>> +
>> +diff --git a/src/notification.c b/src/notification.c
>> +index 99a2e36..3e5b320 100644
>> +--- a/src/notification.c
>> ++++ b/src/notification.c
>> +@@ -184,10 +184,10 @@ zenity_notification_handle_stdin (GIOChannel *channel,
>> +             icon = freeme = g_filename_to_uri (icon_file, NULL, NULL);
>> +           }
>> +
>> +-          notif = notify_notification_new_with_status_icon (
>> ++          notif = notify_notification_new (
>> +                               message[0] /* title */,
>> +                               message[1] /* summary */,
>> +-                              icon, status_icon);
>> ++                              gtk_status_icon_get_icon_name( status_icon));
>> +
>> +           g_strfreev (message);
>> +           g_free (freeme);
>> +--
>> +2.10.1
>> diff --git a/meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb b/meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb
>> index 4e01c5c..bc6c9c4 100644
>> --- a/meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb
>> +++ b/meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb
>> @@ -4,18 +4,20 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
>>    
>>    PR = "r2"
>>    
>> -PNBLACKLIST[zenity] ?= "BROKEN: doesn't build with B!=S"
>> -
>> -DEPENDS = "gtk+ glib-2.0 libnotify gnome-doc-utils"
>> +GNOME_COMPRESS_TYPE = "bz2"
>> +DEPENDS = "gtk+ glib-2.0 libnotify gnome-doc-utils intltool-native"
>> +RDEPENDS_${PN} += "perl"
>>    
>>    inherit gnomebase
>> -SRC_URI += "file://0001-Makefile.am-don-t-build-help.patch"
>> +SRC_URI += "file://0001-Makefile.am-don-t-build-help.patch \
>> +            file://0002-fix-build-with-newer-libnotify.patch \
>> +            "
>>    SRC_URI[archive.md5sum] = "aa66ec35451b16e424519b4973082170"
>>    SRC_URI[archive.sha256sum] = "8838be041a07364b62a4281c971392e4a09bb01bb3237a836ec0457ec0ea18ac"
>>    
>>    EXTRA_OECONF += "--disable-scrollkeeper"
>>    # remove -I/usr/include from zenity_CPPFLAGS
>>    do_configure_prepend() {
>> -    sed -i -e '/-I$(includedir)/d' src/Makefile.am
>> +    sed -i -e '/-I$(includedir)/d' ${S}/src/Makefile.am
>>    }
>>    
>> -- 
>> 2.10.1
>>
>> -- 
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>


