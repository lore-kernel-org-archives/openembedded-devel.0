Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1TQCZU-0000LU-Mo
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Oct 2012 09:37:12 +0200
Received: by mail-ie0-f175.google.com with SMTP id c13so3095443ieb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Oct 2012 00:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=0Xkwb/Zn8VD3TKWOBNaC5S73oMbuj18qA6Gq/y+qeck=;
	b=uavstue0x48KAwGtvLgEJ9LMsuyN7O2S4GQs0qeJexw2qHilo00DUefXKOsT8V3ScA
	S6snE2b/dYkAr9S27CgAV5EZl8pGQE7fE23RjhlFbv4I9gcsAAtypNgkJEXQOFICY3BC
	bwmE/Bo5c53xg5tbfcwPPHSU5I2ziGIGcFfQO6y9LVKh8Qgh6bXx4BpPGq3/FaWqpZTE
	AAd3YRW7mUY8WcMen8MGbkhDlKr7pyxgcUSUIPXI4pr6z6fh/zIpo3vwoozno5s6nAuG
	wpRf14NE6201Bnhc4yh4TZ+73/aeDScplyQ/B4x6wQF7TAddmRzhUN05CVuTNdew+c0d
	Q8RA==
MIME-Version: 1.0
Received: by 10.50.208.106 with SMTP id md10mr8336050igc.5.1350890627622; Mon,
	22 Oct 2012 00:23:47 -0700 (PDT)
Received: by 10.64.24.179 with HTTP; Mon, 22 Oct 2012 00:23:47 -0700 (PDT)
In-Reply-To: <7D46E86EC0A8354091174257B2FED10159272FF7@DLEE12.ent.ti.com>
References: <1345805787-6819-1-git-send-email-s.stirtzel@googlemail.com>
	<1345805787-6819-2-git-send-email-s.stirtzel@googlemail.com>
	<7D46E86EC0A8354091174257B2FED10159272FF7@DLEE12.ent.ti.com>
Date: Mon, 22 Oct 2012 09:23:47 +0200
Message-ID: <CAGiJk9dYkU6SfDD4EgTYkj-NKA1gkQ=CQK39oPU4r=TfN8L-0g@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] libjpeg-turbo: Add RPROVIDES to fix errors when rdepending on jpeg
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
X-List-Received-Date: Mon, 22 Oct 2012 07:37:12 -0000
Content-Type: text/plain; charset=UTF-8

2012/10/20 Maupin, Chase <chase.maupin@ti.com>:
> I did not see any responses to this patch.  I am also seeing this issue and was wondering if there was a reason this patch was not accepted?
>
> If it can be merged can it also be pulled into the denzil branch as well?
>
>> -----Original Message-----
>> From: openembedded-devel-bounces@lists.openembedded.org
>> [mailto:openembedded-devel-bounces@lists.openembedded.org] On
>> Behalf Of Samuel Stirtzel
>> Sent: Friday, August 24, 2012 5:56 AM
>> To: openembedded-devel@lists.openembedded.org
>> Subject: [oe] [meta-oe][PATCH] libjpeg-turbo: Add RPROVIDES to
>> fix errors when rdepending on jpeg
>>
>> This fixes "ERROR: Multiple .bb files are due to be built which
>> each provide jpeg"
>>
>> Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
>> ---
>>  meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb |    1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
>> b/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
>> index dd81606..ec25874 100644
>> --- a/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
>> +++ b/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
>> @@ -15,6 +15,7 @@ S = "${WORKDIR}/trunk"
>>
>>  # Drop-in replacement for jpeg
>>  PROVIDES = "jpeg"
>> +RPROVIDES_${PN} = "jpeg"
>>
>>  inherit autotools pkgconfig
>>
>> --
>> 1.7.9.5
>>
>>

Hi,

this patch lacks the meta-oe prefix and the issue doesn't seem urgent
enough to ignore this.

Since you see an use in this patch I will send a v2.


-- 
Regards
Samuel


