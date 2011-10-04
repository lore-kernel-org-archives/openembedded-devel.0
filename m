Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RB7UT-0007mh-Pe
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Oct 2011 18:05:10 +0200
Received: by pzd13 with SMTP id 13so1814958pzd.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Oct 2011 08:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=9O7YYKmnZROc+jKoQ8t55MWPVPO0NR3AC8YIegtzNJI=;
	b=h+RDDaKgRtv085Co5Il6IWTiGWFsqN71k4SCBr0K/xbc6q/iQflLOmfCgSWAN1K772
	tTHfm72tnLN2Fhl9qX+PwxqM7FC95H/KhFqpmNfX6K7VgEdhcZNwBkAfQTWXCBJ0X55Y
	B9Do/7fn1fQn7usHF+fP9KuZC4PspAQ5noKaA=
Received: by 10.68.19.40 with SMTP id b8mr10960392pbe.17.1317743974594;
	Tue, 04 Oct 2011 08:59:34 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net.
	[99.57.141.118])
	by mx.google.com with ESMTPS id i3sm66193608pbg.10.2011.10.04.08.59.21
	(version=SSLv3 cipher=OTHER); Tue, 04 Oct 2011 08:59:22 -0700 (PDT)
Message-ID: <4E8B2D57.6060004@gmail.com>
Date: Tue, 04 Oct 2011 08:59:19 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1317025776-2433-1-git-send-email-eyalr@ti.com>
	<EC51CDB0807A51469E0C9CB8CF72D65F033369C809@dnce02.ent.ti.com>
In-Reply-To: <EC51CDB0807A51469E0C9CB8CF72D65F033369C809@dnce02.ent.ti.com>
Subject: Re: [PATCH] wpa_supplicant update to use a newer commit
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
X-List-Received-Date: Tue, 04 Oct 2011 16:05:10 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/3/2011 11:47 PM, Reizer, Eyal wrote:
> Ping on this patch.
>

I would suggest to rebase this patch against openembedded-core
and resubmit

> Best Regards,
> Eyal Reizer
>
>> -----Original Message-----
>> From: Eyal Reizer [mailto:eyalreizer@googlemail.com]
>> Sent: Monday, September 26, 2011 11:30 AM
>> To: openembedded-devel@lists.openembedded.org
>> Cc: Reizer, Eyal
>> Subject: [PATCH] wpa_supplicant update to use a newer commit
>>
>> Signed-off-by: Eyal Reizer<eyalr@ti.com>
>> ---
>>   recipes/wpa-supplicant/wpa-supplicant_git.bb |    2 +-
>>   1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/recipes/wpa-supplicant/wpa-supplicant_git.bb
>> b/recipes/wpa-supplicant/wpa-supplicant_git.bb
>> index 8f6971e..7408808 100644
>> --- a/recipes/wpa-supplicant/wpa-supplicant_git.bb
>> +++ b/recipes/wpa-supplicant/wpa-supplicant_git.bb
>> @@ -1,6 +1,6 @@
>>   require wpa-supplicant-0.7.inc
>>
>> -SRCREV = "b8fb017272ed4794339978c9fbc0e74571a44728"
>> +SRCREV = "83fa07226debc2f7082b6ccd62dbb1cd47c30472"
>>   PR = "r0"
>>   PV = "0.7.3+0.8.0-rc"
>>   PR_append = "+gitr${SRCPV}"
>> --
>> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



