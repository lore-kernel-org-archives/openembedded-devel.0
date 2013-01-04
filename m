Received: from mail-ia0-f172.google.com ([209.85.210.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TrAxK-00087u-UN
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Jan 2013 18:21:19 +0100
Received: by mail-ia0-f172.google.com with SMTP id z13so14181845iaz.31
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Jan 2013 09:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=VJHrLaEmvhw8HvymaCRQ8HELKTshIyCynI9uUDdKtcc=;
	b=tyBDWl32BxiEaX3sqh+pcwpKltxJrYEImISGfiUZvmUAEm/CBpCqUNMN7nXDTaLkcg
	Onn3jZ8scHx59065Hx314i3SVrIHxGD9yYv7UqwbCJlAij8ZT5w5890JQv/M3heUfpET
	cIJUtaE/oVxOIOnetyXQs+4xtIS2aSF3KcfzEhKaFHIOw4eR2E1a2xywENDeTaCimtWS
	pccUtVKyQOvGCzvnP6HgSCac1KOoJ9asOjH7r3dblnZrCjbe/8AoCD6GD295/agBxu1y
	oy6jnNPU0V14fV1PDJWcDKUSSN8c4NWcXEpsoW0cPFWMspooEAeEk0i6xDpzh9SZOei2
	r1Yg==
Received: by 10.50.56.232 with SMTP id d8mr41340545igq.112.1357319173148; Fri,
	04 Jan 2013 09:06:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.19.8 with HTTP; Fri, 4 Jan 2013 09:05:42 -0800 (PST)
In-Reply-To: <2775414.uih48Qsd1z@helios>
References: <1357271974-3317-1-git-send-email-raj.khem@gmail.com>
	<1357271974-3317-11-git-send-email-raj.khem@gmail.com>
	<2775414.uih48Qsd1z@helios>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 4 Jan 2013 09:05:42 -0800
Message-ID: <CAMKF1sqHFxAW5CkUdeVRpoosqCULZcn13U1MZMo-f7Pit7pn4g@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH 12/13] ebtables: Forward port recipes from OE-Classic
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
X-List-Received-Date: Fri, 04 Jan 2013 17:21:19 -0000
X-List-Received-Date: Fri, 04 Jan 2013 17:21:19 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jan 4, 2013 at 3:55 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Thursday 03 January 2013 19:59:33 Khem Raj wrote:
>> Update to latest version
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  .../ebtables-2.0.10-4/01debian_defaultconfig.patch |   50 ++++++
>>  .../ebtables/ebtables-2.0.10-4/ebtables.init       |  186
>
> Er, I'm confused - ebtables is already in meta-networking (meta-
> networking/recipes-filter/ebtables) ... ?


hmm recipes-support and recipes-filter meant that my patch applied
without letting me know :)
please discard this patch. I will resend 13/13 patch so that it
applies to existing recipe
in recipes-filter

>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre


