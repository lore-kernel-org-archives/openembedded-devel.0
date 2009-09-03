Received: from [80.91.229.12] (helo=lo.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MjA6a-0000tI-TT for openembedded-devel@lists.openembedded.org;
	Thu, 03 Sep 2009 13:03:53 +0200
Received: from list by lo.gmane.org with local (Exim 4.50) id 1Mj9oN-0007Un-1V
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Sep 2009 12:45:03 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Sep 2009 12:45:03 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Sep 2009 12:45:03 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 03 Sep 2009 12:41:58 +0200
Message-ID: <h7o6hm$fii$2@ger.gmane.org>
References: <4A9F97B8.1070900@balister.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.3pre) Gecko/20090811 Shredder/3.0b4pre
In-Reply-To: <4A9F97B8.1070900@balister.org>
Sender: news <news@ger.gmane.org>
Subject: Re: [Fwd: Re: [STABLE][PATCH] xscreensaver: fix packaging and QA]
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
X-List-Received-Date: Thu, 03 Sep 2009 11:03:53 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03-09-09 12:17, Philip Balister wrote:
> Didn't patchwork pick this up?

It did, but don't I need another ack?

>
> Philip
>
> -------- Original Message --------
> Subject: Re: [oe] [STABLE][PATCH] xscreensaver: fix packaging and QA
> Date: Tue, 01 Sep 2009 13:04:57 -0400
> From: Philip Balister <philip@balister.org>
> To: openembedded-devel@lists.openembedded.org
> References: <1251813967-16058-1-git-send-email-k.kooi@student.utwente.nl>
>
> Koen Kooi wrote:
>> From: Koen Kooi <koen@openembedded.org>
>>
>>
>> Signed-off-by: Koen Kooi <koen@openembedded.org>
>
> Acked-by: Philip Balister <philip@balister.org>
>
>
>> ---
>> recipes/xscreensaver/xscreensaver.inc | 3 ++-
>> recipes/xscreensaver/xscreensaver_5.07.bb | 2 +-
>> 2 files changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/recipes/xscreensaver/xscreensaver.inc
>> b/recipes/xscreensaver/xscreensaver.inc
>> index a4925ac..5f8cdc0 100644
>> --- a/recipes/xscreensaver/xscreensaver.inc
>> +++ b/recipes/xscreensaver/xscreensaver.inc
>> @@ -10,6 +10,7 @@ DEPENDS = "intltool mesa freeglut virtual/libx11
>> gtk+ libxml2 libglade"
>>
>> # xscreensaver-demo is a glade app
>> LDFLAGS_append = " -Wl,--export-dynamic"
>> +TARGET_CC_ARCH += "${LDFLAGS}"
>>
>> inherit autotools
>>
>> @@ -30,7 +31,7 @@ EXTRA_OECONF=" --with-xml \
>>
>> PACKAGES =+ " xscreensaver-demo xscreensaver-extra"
>>
>> -FILES_${PN}= "${bindir}/xscreensaver ${bindir}/xscreensaver-command
>> ${datadir}/applications \
>> +FILES_${PN}= "${bindir}/xscreensaver ${bindir}/xscreensaver-text
>> ${bindir}/xscreensaver-command ${datadir}/applications \
>> ${libdir}/X11/"
>>
>> FILES_${PN}-dbg += "${libexecdir}/xscreensaver/.debug"
>> diff --git a/recipes/xscreensaver/xscreensaver_5.07.bb
>> b/recipes/xscreensaver/xscreensaver_5.07.bb
>> index 8932b6f..cfe5ccc 100644
>> --- a/recipes/xscreensaver/xscreensaver_5.07.bb
>> +++ b/recipes/xscreensaver/xscreensaver_5.07.bb
>> @@ -1,5 +1,5 @@
>> require xscreensaver.inc
>> -PR = "r2"
>> +PR = "r3"
>>
>> SRC_URI = "http://www.jwz.org/xscreensaver/xscreensaver-${PV}.tar.gz \
>> file://configure.in.patch;patch=1 \
>
> ------------------------------------------------------------------------
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel




