Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1TQI8m-0001Od-II
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Oct 2012 15:34:00 +0200
Received: by mail-ob0-f175.google.com with SMTP id eq6so2349567obc.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Oct 2012 06:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=IEwFlUsgbmNlL5DkFN9YaurYbVKStFC+Zs4Rv2u/5js=;
	b=j4jwqtCmmpv1LCz7+wY1eZrfPFgewRYaM9i5PDVgcOHheB/sEZojm5O5UHGtRgYuch
	OIZ2EJwkSrqzvNzjK1b3fdKYKlpJHYZYckk/LarN4G7XmGvY4gAcOqw5qKMLZFSlfheF
	Ou6G9B6CrSOPzMfSMBdWd8TLlpL93FLndNNbOOdLDMn2Lf3zLT92N4ua7Rn+uImQi37j
	3aC5kfoVgQmh9x3LfFybv3rb8zIP+ws9Wc7BflS4biFFj5eO1IYXnPTIKf/UQhfOu9jf
	2LPH1sXGV/4sSGi/wxWSWR4bqGocEn/rLPTn5yqFjoBaFwoNuYscOIvbye5J2HZxBKud
	mGQQ==
MIME-Version: 1.0
Received: by 10.60.31.177 with SMTP id b17mr7888432oei.77.1350912035256; Mon,
	22 Oct 2012 06:20:35 -0700 (PDT)
Received: by 10.76.25.227 with HTTP; Mon, 22 Oct 2012 06:20:35 -0700 (PDT)
In-Reply-To: <7D46E86EC0A8354091174257B2FED10159275020@DLEE12.ent.ti.com>
References: <1350899940-2274-1-git-send-email-s.stirtzel@googlemail.com>
	<7D46E86EC0A8354091174257B2FED10159275020@DLEE12.ent.ti.com>
Date: Mon, 22 Oct 2012 15:20:35 +0200
Message-ID: <CAGiJk9e0xzegmQ32NAkKFdvY+TcyP5ZtnvyUBk59cz0Tc1sQeQ@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v2] libjpeg-turbo: Add RPROVIDES to fix errors when rdepending on jpeg
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
X-List-Received-Date: Mon, 22 Oct 2012 13:34:00 -0000
Content-Type: text/plain; charset=UTF-8

2012/10/22 Maupin, Chase <chase.maupin@ti.com>:
>> -----Original Message-----
>> From: openembedded-devel-bounces@lists.openembedded.org
>> [mailto:openembedded-devel-bounces@lists.openembedded.org] On
>> Behalf Of Samuel Stirtzel
>> Sent: Monday, October 22, 2012 4:59 AM
>> To: openembedded-devel@lists.openembedded.org
>> Subject: [oe] [meta-oe][PATCH v2] libjpeg-turbo: Add RPROVIDES to
>> fix errors when rdepending on jpeg
>>
>> This fixes "ERROR: Multiple .bb files are due to be built which
>> each provide jpeg"
>>
>> Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
>> ---
>>  meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb |    3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
>> b/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
>> index 2aefe1f..303bbae 100644
>> --- a/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
>> +++ b/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
>> @@ -15,6 +15,9 @@ S = "${WORKDIR}/trunk"
>>
>>  # Drop-in replacement for jpeg
>>  PROVIDES = "jpeg"
>> +RPROVIDES_${PN} += "jpeg"
>> +RREPLACES_${PN} += "jpeg"
>> +RCONFLICTS_${PN} += "jpeg"
>
> Does this need a PR bump?  Aside from that this has my ack.
>

The error message disappeared without PR bumps or rebuilding.
Hopefully it doesn't need one, as that would trigger a rebuild of many
recipes (like Qt, gtk+, gtk+3)


-- 
Regards
Samuel


