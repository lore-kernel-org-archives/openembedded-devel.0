Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MSbu5-0007go-M6
	for openembedded-devel@openembedded.org; Sun, 19 Jul 2009 21:18:33 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MSbgd-0001gY-9e
	for openembedded-devel@openembedded.org; Sun, 19 Jul 2009 19:04:39 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sun, 19 Jul 2009 19:04:39 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sun, 19 Jul 2009 19:04:39 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 19 Jul 2009 21:04:26 +0200
Message-ID: <h3vqnq$m9n$1@ger.gmane.org>
References: <E1MRnPa-00054l-4v@melo.openembedded.org>
	<20090719145606.GA7131@rhein.zuhause.netz>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1.1pre) Gecko/20090712 Shredder/3.0b3pre
In-Reply-To: <20090719145606.GA7131@rhein.zuhause.netz>
Sender: news <news@ger.gmane.org>
Subject: Re: [oe-commits] Koen Kooi : schroedinger: fix packaging
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
X-List-Received-Date: Sun, 19 Jul 2009 19:18:33 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19-07-09 16:56, Henning Heinold wrote:
> On Fri, Jul 17, 2009 at 01:23:42PM +0000, git version control wrote:
>> Module: openembedded.git
>> Branch: org.openembedded.dev
>> Commit: 852d21c0369f8b499931098fdc55eea59116402f
>> URL:    http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=852d21c0369f8b499931098fdc55eea59116402f
>>
>> Author: Koen Kooi<koen@openembedded.org>
>> Date:   Fri Jul 17 13:53:28 2009 +0200
>>
>> schroedinger: fix packaging
>>
>> ---
>>
>>   recipes/schroedinger/schroedinger_1.0.5.bb |    6 +++++-
>>   1 files changed, 5 insertions(+), 1 deletions(-)
>>
>> diff --git a/recipes/schroedinger/schroedinger_1.0.5.bb b/recipes/schroedinger/schroedinger_1.0.5.bb
>> index 66d24c1..476c296 100644
>> --- a/recipes/schroedinger/schroedinger_1.0.5.bb
>> +++ b/recipes/schroedinger/schroedinger_1.0.5.bb
>> @@ -1,8 +1,12 @@
>>   require schroedinger.inc
>>
>> -PR = "r2"
>> +PR = "r3"
>>
>>   inherit autotools_stage
>>
>>   AUTOTOOLS_STAGE_PKGCONFIG = "1"
>>
>> +PACKAGES =+ "gst-plugin-schroedinger-dbg gst-plugin-schroedinger-dev gst-plugin-schroedinger"
>> +FILES_gst-plugin-schroedinger = "${libdir}/gstreamer-0.10/*.so"
>> +FILES_gst-plugin-schroedinger-dbg = "${libdir}/gstreamer-0.10/.debug"
>> +FILES_gst-plugin-schroedinger-dev = "${libdir}/gstreamer-0.10/*.*a"
>
> Hi,
>
> why you are switching this stuff back?

The files were left unpackaged, so I packaged them. And in this day and 
ago of quad core build machines I see no real reason to go out and 
actively split out recipes to save 5 seconds of build time when it 
generated an extra hour of QA work.

regards,

Koen



