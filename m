Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Pwek9-0002X0-6a
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Mar 2011 19:01:17 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Pweie-00026X-MV from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Mar 2011 09:59:44 -0800
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Mon, 7 Mar 2011 09:59:43 -0800
Received: from [172.30.80.238] (147.34.91.1) by svr-orw-fem-05 (147.34.97.43)
	with Microsoft SMTP Server id 14.1.270.1;
	Mon, 7 Mar 2011 09:59:43 -0800
Message-ID: <4D751D09.6000808@mentor.com>
Date: Mon, 7 Mar 2011 10:59:37 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1299515323-2246-1-git-send-email-sledz@dresearch.de>	<1299516187-27151-1-git-send-email-sledz@dresearch.de>
	<1299517044.2132.203.camel@phil-desktop>
In-Reply-To: <1299517044.2132.203.camel@phil-desktop>
X-OriginalArrivalTime: 07 Mar 2011 17:59:43.0627 (UTC)
	FILETIME=[701B7DB0:01CBDCF1]
Subject: Re: [PATCH v2] gupnp_0.13.4/gupnp-av_0.5.9: disable introspection
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
X-List-Received-Date: Mon, 07 Mar 2011 18:01:17 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/07/2011 09:57 AM, Phil Blundell wrote:
> On Mon, 2011-03-07 at 17:43 +0100, Steffen Sledz wrote:
>> --- a/recipes/upnp/gupnp_0.13.4.bb
>> +++ b/recipes/upnp/gupnp_0.13.4.bb
>> @@ -2,13 +2,14 @@ LICENSE = "LGPL"
>>   DEPENDS = "e2fsprogs gssdp libsoup-2.4 libxml2 gtk-doc-native libgee"
>>
>>   require gupnp.inc
>> +PR = "1"

"r1"

>>
>>   SRC_URI[md5sum] = "0d562f5f02534c70c3743b2c514db8ba"
>>   SRC_URI[sha256sum] = "7974953f38a41236c875c3df509abc43e8218b5925fdc18212a73b1ae0d0e7e8"
>>
>>   inherit autotools pkgconfig
>>
>> -EXTRA_OECONF = "--disable-gtk-doc"
>> +EXTRA_OECONF = "--disable-gtk-doc --enable-introspection=no"
>
> I can't help thinking that there must be a better place to put this,
> maybe even autotools.bbclass.  We basically want those options for all
> packages that will take them, right?

Usually this is just in "gnome" stuff and gnome or gnomebase does handle 
this.  But indeed, perhaps this is something that should be more widely 
passed in to avoid semi-random breakage.

-- 
Tom Rini
Mentor Graphics Corporation


