Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tworaz666@gmail.com>) id 1RshtW-00078U-2N
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Feb 2012 22:39:10 +0100
Received: by eekd41 with SMTP id d41so413111eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Feb 2012 13:31:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type;
	bh=ypDWDxegncmHmsfws5j7cXrm+ldkow0+hnpSPWS3GFU=;
	b=kcUf800gLNIhNlwXdPW/chQvIfKLsan1oADQ13nDMOWo1UHJqOZpoiwBlliKhngXr+
	uv0l7qFTXB0sjVBxaQebX4DbmkEx6KCdtWDFCO2F/A3ipkL+QSHJe+ZgbdZrb0o4fiTe
	uvResJRPLuDBymujlF+UNaYELW+3gJHdfPdf4=
Received: by 10.14.17.91 with SMTP id i67mr71489eei.10.1328131874649;
	Wed, 01 Feb 2012 13:31:14 -0800 (PST)
Received: from [192.168.0.10] (89-77-50-243.dynamic.chello.pl. [89.77.50.243])
	by mx.google.com with ESMTPS id e12sm1005789eea.5.2012.02.01.13.31.13
	(version=SSLv3 cipher=OTHER); Wed, 01 Feb 2012 13:31:14 -0800 (PST)
Message-ID: <4F29AEA9.1030400@gmail.com>
Date: Wed, 01 Feb 2012 22:29:13 +0100
From: Peter Tworek <tworaz666@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20120112 Thunderbird/9.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1328039657-3070-1-git-send-email-tworaz666@gmail.com>
	<1328087681.4185.3.camel@mattotaupa> <4F298E4B.3060706@gmail.com>
	<1328129225.14469.4.camel@mattotaupa>
In-Reply-To: <1328129225.14469.4.camel@mattotaupa>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: Paul Menzel <paulepanter@users.sourceforge.net>
Subject: Re: [meta-xfce][PATCH v2] Add recipe for xarchiver 0.5.2.
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
X-List-Received-Date: Wed, 01 Feb 2012 21:39:10 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 02/01/2012 09:47 PM, Paul Menzel wrote:
> Am Mittwoch, den 01.02.2012, 20:11 +0100 schrieb Peter Tworek:
>> On 02/01/2012 10:14 AM, Paul Menzel wrote:
>>> Am Dienstag, den 31.01.2012, 20:54 +0100 schrieb Peter Tworek:
>>>
>>> Please remember that the commit summary follows a certain pattern [1].
>>>
>>> xarchiver: Add 0.5.2 (initial recipe)
>> Thanks for the tip, I didn't know about that.
>>>> Signed-off-by: Peter Tworek<tworaz666@gmail.com>
>>>> ---
>>>>    .../recipes-apps/xarchiver/xarchiver_0.5.2.bb      |   16 ++++++++++++++++
>>>>    1 files changed, 16 insertions(+), 0 deletions(-)
>>>>    create mode 100644 meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.2.bb
>>>>
>>>> diff --git a/meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.2.bb b/meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.2.bb
>>>> new file mode 100644
>>>> index 0000000..66e9273
>>>> --- /dev/null
>>>> +++ b/meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.2.bb
>>>> @@ -0,0 +1,16 @@
>>>> +DESCRIPTION = "Lightweight, desktop independent GTK+ archive manager"
>>>> +HOMEPAGE = "http://xarchiver.sourceforge.net"
>>> Does a »/« need to be added at the end?
>> I'm not sure I follow. What do you mean by »/?
> I am not sure if a slash is required for a valid URL.
>
>      HOMEPAGE = "http://xarchiver.sourceforge.net/"
>
> Please note the added slash / at the end.
Slash is not required for a valid URL and as far as I can see my patch 
does not contain one. Anyway time for v3 :)
>
>>>> +SECTION = "x11"
>>>> +
>>>> +LICENSE = "GPLv2"
>>> Looking at the FAQ Xarchive is distributed under GPLv2+ [2].
>> I wasn't aware that GPLv2+ is a valid license value. Thanks I'll fix it
>> in v3.
>>
>>>> +LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
>>>> +
>>>> +DEPENDS = "gtk+ glib-2.0 xfce4-dev-tools-native"
>>>> +
>>>> +SRC_URI = "${SOURCEFORGE_MIRROR}/${PN}/${P}.tar.bz2"
>>>> +SRC_URI[md5sum] = "2bc7f06403cc6582dd4a8029ec9d038d"
>>>> +SRC_URI[sha256sum] = "cea932ff9d505969201fd502470bbebbc5726ab3d6765e142fc8295aa677ad2a"
>>>> +
>>>> +inherit gettext pkgconfig autotools gtk-icon-cache
>>>> +
>>>> +RRECOMMENDS_${PN} = "lzop zip tar"
>>> With these changes this patch is
>>>
>>> Acked-by: Paul Menzel<paulepanter@users.sourceforge.net>
>
> Thanks,
>
> Paul
>
>
>>> [1] http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
>>> [2] http://xarchiver.sourceforge.net/doc/ch01s03.html
>>>
>>>
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


