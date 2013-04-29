Received: from mail-ob0-f177.google.com ([209.85.214.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nicolas.dechesne@linaro.org>) id 1UWi3F-0002ie-Cl
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Apr 2013 08:59:06 +0200
Received: by mail-ob0-f177.google.com with SMTP id ef5so5075495obb.22
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Apr 2013 23:41:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=o+W9yGLFbYePmZpILB6p2EGKMIPOgX2KADuXgSUUMY8=;
	b=IR0sGjem3CVU3R+ckLeOhdrdm9lf3HCDC9/vr94vTghHKzfuj7ooL1/3b/uiuWVjmg
	3KmdzC4fvBIuByzhpcaf1rXbbnwO0rWsmTNRf0EBD5K+Sg09q+PIukyaEbFYM4levuzb
	MdRJe7AZsUKVT/2KCQLpmpRXwau7wd9o+Ku1PfGixM5Mr1heD7/D9+R4ANbPFSpZZZ7E
	r0+FA09ya4hKDwTe1yEXitnQBz/46+J3F7dPTymgX5Rs7IYPGDGc1MS0CEoII8eiaMEw
	ZPde9PsmAH0AsuiX2FiiapQqbLnji5ohjW76yfyG95UNRAwVCU0jbDXsiO8M6VcMPHuH
	lOng==
X-Received: by 10.60.60.10 with SMTP id d10mr22954179oer.6.1367217675718; Sun,
	28 Apr 2013 23:41:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.76.35.193 with HTTP; Sun, 28 Apr 2013 23:40:55 -0700 (PDT)
In-Reply-To: <1756231.MGNYtfpC2x@helios>
References: <1367008757-18667-1-git-send-email-nicolas.dechesne@linaro.org>
	<68356141.McDxtR3Bre@helios> <517BA9C6.6090707@balister.org>
	<1756231.MGNYtfpC2x@helios>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Mon, 29 Apr 2013 08:40:55 +0200
Message-ID: <CAP71Wjw0rs0-WA=c4a92zsXCkrea8P7+CsbBdCU7HDd20MWCsQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQlaxrOymwufd3CWP+0052btQQcASKP4mA2OlQ3qYo2L8zRhxY4neAQQHHCdcRIGYKdG0ssp
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-oe][PATCH] smartmontools: import from OE classic
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
X-List-Received-Date: Mon, 29 Apr 2013 06:59:19 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Apr 27, 2013 at 1:13 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
>> > On Friday 26 April 2013 23:41:38 Koen Kooi wrote:
>> >> And do you really need a .inc?
>> >
>> > Are we removing inc files if they were present in OE Classic? First I've
>> > heard if we are...
>>
>> If we are trying to reduce the number of versions of recipes we carry,
>> dropping .inc files would seem to be a good idea. I don't have strong
>> feelings, but it seems like something we should consider.
>
> I agree we should try to keep only one version of each recipe in software
> layers, however I figure it makes it easier for people to carry their own
> versions of recipes in distro layers (particularly older, which may be
> required in certain circumstances) if we do keep inc files where they already
> exist.

I put the .inc in this patch, indeed because it was there in OE
Classic. I can update the patch if there is a consensus to remove the
.inc.

also for the INC_PR, I added it, because I thought it makes sense for
.bb with .inc to have that. again, i can update the patch if you
recommend doing this way.

thx


