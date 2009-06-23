Received: from [206.46.173.11] (helo=vms173011pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1MIvcW-0003Ds-Gj
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Jun 2009 04:20:27 +0200
Received: from gandalf.denix.org ([71.251.63.232]) by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KLO005FM5Z1MV32@vms173011.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	22 Jun 2009 21:09:01 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id ECD5A14AF5F; Mon,
	22 Jun 2009 22:09:00 -0400 (EDT)
Date: Mon, 22 Jun 2009 22:09:00 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090623020900.GN14716@denix.org>
References: <200906041838.05838.marcin@juszkiewicz.com.pl>
	<1245664435-30183-11-git-send-email-marcin@juszkiewicz.com.pl>
	<h1nofq$af4$2@ger.gmane.org>
MIME-version: 1.0
In-reply-to: <h1nofq$af4$2@ger.gmane.org>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [STABLE][PATCH 034/125] fixes wrong license value usage	for GPLv2
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
X-List-Received-Date: Tue, 23 Jun 2009 02:20:34 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Jun 22, 2009 at 01:04:26PM +0200, Koen Kooi wrote:
> On 22-06-09 11:53, Marcin Juszkiewicz wrote:
>> From: Otavio Salvador<otavio@ossystems.com.br>
>>
>> Signed-off-by: Otavio Salvador<otavio@ossystems.com.br>
>> Signed-off-by: Marcin Juszkiewicz<marcin@juszkiewicz.com.pl>
>
> Acked-by: Koen Kooi <koen@openembedded.org>

Acked-by: Denys Dmytriyenko <denis@denix.org>

>> ---
>>   classes/xfce.bbclass                  |    2 +-
>>   recipes/gnash/gnash-minimal.inc       |    2 +-
>>   recipes/gnash/gnash.inc               |    2 +-
>>   recipes/linphone/linphone_1.3.99.8.bb |    2 +-
>>   4 files changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/classes/xfce.bbclass b/classes/xfce.bbclass
>> index 48e012e..b18313f 100644
>> --- a/classes/xfce.bbclass
>> +++ b/classes/xfce.bbclass
>> @@ -5,7 +5,7 @@
>>   # Global class to make it easier to maintain XFCE packages
>>
>>   HOMEPAGE = "http://www.xfce.org"
>> -LICENSE = "LGPL-2"
>> +LICENSE = "LGPLv2"
>>   DEPENDS += "startup-notification"
>>
>>   XFCE_VERSION = ${PV}
>> diff --git a/recipes/gnash/gnash-minimal.inc 
>> b/recipes/gnash/gnash-minimal.inc
>> index a8e5229..5a8a91e 100644
>> --- a/recipes/gnash/gnash-minimal.inc
>> +++ b/recipes/gnash/gnash-minimal.inc
>> @@ -1,6 +1,6 @@
>>   DESCRIPTION = "Gnash is a GNU Flash movie player that supports many SWF 
>> v7 features"
>>   HOMEPAGE = "http://www.gnu.org/software/gnash"
>> -LICENSE = "GPL-2"
>> +LICENSE = "GPLv2"
>>
>>   DEPENDS = "virtual/libiconv virtual/libintl libtool agg libxml2 zlib 
>> boost jpeg pango curl freetype \
>>              ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'ffmpeg 
>> libmad', d)}"
>> diff --git a/recipes/gnash/gnash.inc b/recipes/gnash/gnash.inc
>> index 3602f6f..ea20524 100644
>> --- a/recipes/gnash/gnash.inc
>> +++ b/recipes/gnash/gnash.inc
>> @@ -1,6 +1,6 @@
>>   DESCRIPTION = "Gnash is a GNU Flash movie player that supports many SWF 
>> v7 features"
>>   HOMEPAGE = "http://www.gnu.org/software/gnash"
>> -LICENSE = "GPL-2"
>> +LICENSE = "GPLv2"
>>   DEPENDS = "giflib libtool gtk+ cairo libxml2 libsdl-mixer zlib boost 
>> jpeg pango curl freetype \
>>              ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'ffmpeg 
>> libmad', d)}"
>>
>> diff --git a/recipes/linphone/linphone_1.3.99.8.bb 
>> b/recipes/linphone/linphone_1.3.99.8.bb
>> index f96bd66..4e9b130 100644
>> --- a/recipes/linphone/linphone_1.3.99.8.bb
>> +++ b/recipes/linphone/linphone_1.3.99.8.bb
>> @@ -1,6 +1,6 @@
>>   DESCRIPTION = "SIP-based IP phone (Console edition)"
>>   HOMEPAGE = "http://www.linphone.org/?lang=us"
>> -LICENSE = "GPL-2"
>> +LICENSE = "GPLv2"
>>   DEPENDS = "libosip2 speex libogg alsa-lib readline"
>>   PR = "r0"
>>
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


