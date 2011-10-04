Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RB7Vs-0007s5-9Q
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Oct 2011 18:06:36 +0200
Received: by qyk10 with SMTP id 10so3729834qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Oct 2011 09:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=dqrwje9bwBpVqWH9qN8D+xzA2Z4yO7aMP7bBcwKDAqE=;
	b=glvirnFzHbCAIt4Bd3KYr+3gVjrvHnZIy8ReGknXH8ZFyL05g5wdUCif3QSaIZQkn+
	2tiU7PsvZ1JfqswzVKS6xH9CPpZ5KHhyqfLeJXGdruix67+eqSBv8yOXQxRG2H8Z0k0y
	snQsp+IT6z5YA55QBFf61EyJqihthA8sC2jW4=
Received: by 10.68.38.8 with SMTP id c8mr10590106pbk.42.1317744061779;
	Tue, 04 Oct 2011 09:01:01 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net.
	[99.57.141.118])
	by mx.google.com with ESMTPS id ml4sm66282256pbc.0.2011.10.04.09.00.58
	(version=SSLv3 cipher=OTHER); Tue, 04 Oct 2011 09:00:59 -0700 (PDT)
Message-ID: <4E8B2DB8.5060300@gmail.com>
Date: Tue, 04 Oct 2011 09:00:56 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1317025740-2398-1-git-send-email-eyalr@ti.com>
	<EC51CDB0807A51469E0C9CB8CF72D65F033369C80A@dnce02.ent.ti.com>
In-Reply-To: <EC51CDB0807A51469E0C9CB8CF72D65F033369C80A@dnce02.ent.ti.com>
Cc: Eyal Reizer <eyalreizer@googlemail.com>
Subject: Re: [PATCH] hostapd: update to use a newer commit
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
X-List-Received-Date: Tue, 04 Oct 2011 16:06:36 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/3/2011 11:47 PM, Reizer, Eyal wrote:
> Ping on this patch.

rebase it against oe-core and send to oe-core ml

>
> Best Regards,
> Eyal Reizer
>
>> -----Original Message-----
>> From: Eyal Reizer [mailto:eyalreizer@googlemail.com]
>> Sent: Monday, September 26, 2011 11:29 AM
>> To: openembedded-devel@lists.openembedded.org
>> Cc: Reizer, Eyal
>> Subject: [PATCH] hostapd: update to use a newer commit
>>
>> Signed-off-by: Eyal Reizer<eyalr@ti.com>
>> ---
>>   recipes/hostap/hostap-daemon_git.bb |    2 +-
>>   1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/recipes/hostap/hostap-daemon_git.bb
>> b/recipes/hostap/hostap-daemon_git.bb
>> index cf0e6e9..bdbde1a 100644
>> --- a/recipes/hostap/hostap-daemon_git.bb
>> +++ b/recipes/hostap/hostap-daemon_git.bb
>> @@ -3,7 +3,7 @@ DESCRIPTION = "User space daemon for extended IEEE
>> 802.11 management"
>>   require hostap-daemon-0.7.inc
>>
>>   PR = "r0"
>> -SRCREV = "b8fb017272ed4794339978c9fbc0e74571a44728"
>> +SRCREV = "83fa07226debc2f7082b6ccd62dbb1cd47c30472"
>>   PV = "0.7.3+0.8.0-rc"
>>   PR_append = "gitr${SRCPV}"
>>   FILESPATHPKG =. "hostap-daemon-git:"
>> --
>> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



