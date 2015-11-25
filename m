Return-Path: <akuster808@gmail.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id 61347605B3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Nov 2015 04:15:35 +0000 (UTC)
Received: by igl9 with SMTP id 9so86801253igl.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Nov 2015 20:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type:content-transfer-encoding;
	bh=k0RS5Mzva0HImudB6pFmtMHxqbhKlFGQTunrjY+sV2s=;
	b=QRwUeMHbj7/wFpvDbvZbRqFpSMkHPT3l4UcwQpUggR24iVJDNxX7sJp77ZDnjjmyez
	6owgBNTuNoQc7w/oSRUx95JjS+vQgpCD18q/sYNoraMh1z3q9iu4Wdw1DzAJSvxfWB5B
	nMVZh6qkB5oB6eYB+FOGQrlIfEfyGO1jEOQGU82WfyZEqPZf90NLD7v9cOWMu7HWzmpF
	cBBMdSDgQNeukYa/a02QWR1xkNOrfwgtP5ZGx3Wa4jMKNZ3GATQf6MzlXG24H/h1Z1mB
	6CfQNMfjD9OPJ6Gyscc9P4TRo/E2YPa9LNmsmzdHaxzKSQPk/8vaBgzbTGL3sozDbGNV
	NvtA==
X-Received: by 10.50.33.74 with SMTP id p10mr2077374igi.47.1448424935699;
	Tue, 24 Nov 2015 20:15:35 -0800 (PST)
Received: from [192.168.1.84] (71-219-195-228.clsp.qwest.net. [71.219.195.228])
	by smtp.googlemail.com with ESMTPSA id
	p79sm8117575ioi.15.2015.11.24.20.15.33
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 24 Nov 2015 20:15:34 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <1448378045-23497-1-git-send-email-akuster808@gmail.com>
	<20151124152802.GG17303@jama>
From: akuster808 <akuster808@gmail.com>
Message-ID: <565535E5.4020100@gmail.com>
Date: Tue, 24 Nov 2015 20:15:33 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <20151124152802.GG17303@jama>
Subject: Re: [meta-networking][PATCH] wireshark: update to version 2.0.0
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
X-List-Received-Date: Wed, 25 Nov 2015 04:15:37 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 11/24/2015 07:28 AM, Martin Jansa wrote:
> On Tue, Nov 24, 2015 at 07:14:05AM -0800, Armin Kuster wrote:
>> the default gui is now QT so wireshark built with gtk
>> is wireshark-gtk.
> 
> But QT is explicitly disabled, right? Maybe worth mentioning in commit
> message.

Correct. QT is disabled explicitly. In 2.0, QT is the preferred GUI so
they now append 'gtk' to the file name 'wireshark' when building with gtk.


Its time to play with QT to get wireshark on that stack.

I will amend the commit message.

thanks,

- armin
> 
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>>  .../wireshark/{wireshark_1.12.8.bb => wireshark_2.0.0.bb}         | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>  rename meta-networking/recipes-support/wireshark/{wireshark_1.12.8.bb => wireshark_2.0.0.bb} (93%)
>>
>> diff --git a/meta-networking/recipes-support/wireshark/wireshark_1.12.8.bb b/meta-networking/recipes-support/wireshark/wireshark_2.0.0.bb
>> similarity index 93%
>> rename from meta-networking/recipes-support/wireshark/wireshark_1.12.8.bb
>> rename to meta-networking/recipes-support/wireshark/wireshark_2.0.0.bb
>> index eee9f30..011c6e1 100644
>> --- a/meta-networking/recipes-support/wireshark/wireshark_1.12.8.bb
>> +++ b/meta-networking/recipes-support/wireshark/wireshark_2.0.0.bb
>> @@ -8,10 +8,8 @@ DEPENDS = "perl-native pcre expat glib-2.0 sbc"
>>  
>>  SRC_URI = "https://2.na.dl.wireshark.org/src/${BP}.tar.bz2"
>>  
>> -PE = "1"
> 
> You cannot drop PE without the overall version going backwards.
> 
>> -
>> -SRC_URI[md5sum] = "988a4595a4a87dafb3c4870ea40e89b5"
>> -SRC_URI[sha256sum] = "357e0a4e49525d80cdc740bb16539fcdb526ad38cc2ed6cabedafc9bdee5c7e7"
>> +SRC_URI[md5sum] = "5909af2a09a9a3023ba61bc62e787ad2"
>> +SRC_URI[sha256sum] = "90026c761a85701d7783c7e2eaa4c1de247dfbadbd53221df355f121e42691dd"
>>  
>>  inherit autotools pkgconfig
>>  
>> @@ -55,3 +53,5 @@ do_configure_prepend() {
>>  
>>  ALLOW_EMPTY_${PN} = "1"
>>  INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
>> +
>> +FILES_${PN} += "${datadir}*"
> 
> You don't need the trailing * unless it installs some files in something
> like /usr/sharefoo
> 
>> -- 
>> 2.3.5
>>
>> -- 
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> 
> 
> 

