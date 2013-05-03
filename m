Received: from mail-oa0-f54.google.com ([209.85.219.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nicolas.dechesne@linaro.org>) id 1UYGof-0001fc-51
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 May 2013 16:18:33 +0200
Received: by mail-oa0-f54.google.com with SMTP id j1so1643513oag.27
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 May 2013 07:00:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=Hv2GI/Xrt2uKhw4t9KRTne+Z74jrIgt7uuDlCYC4Jdg=;
	b=cdR5fmDP3NxJQZRvGRSluwNtNUU4O1Pnh4phjNYcWGrFeFXGLG54fqA6rBXhwpqVfE
	fuDHYBcGiJoWDoW0kX72S2uuUhoqq9y44ukzIqRCvA2NJLWnj4fxoeC3putNidbwlD8a
	I5AgyhmEDb5LeMlgGUNhthOUsp5d0QO5C2GC922ExpKGLWcWb0FT8/QXdwRqgKUPiCVw
	u05SP2XyWGI1ZqQlLzkvp+LNwJPNSz5Ze4Lf0HJ1a3cy99B855d6sjtj9iEHVb/3i8y7
	qa8TLwtTF6WpPtcQezrcUTNSJH6Tu6B8o+Iw1WCb9fMCVCayKlM3RquhJnWUNG1CG17a
	yWlA==
X-Received: by 10.60.60.10 with SMTP id d10mr3000223oer.6.1367589633387; Fri,
	03 May 2013 07:00:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.76.35.193 with HTTP; Fri, 3 May 2013 07:00:13 -0700 (PDT)
In-Reply-To: <CAP71Wjw0rs0-WA=c4a92zsXCkrea8P7+CsbBdCU7HDd20MWCsQ@mail.gmail.com>
References: <1367008757-18667-1-git-send-email-nicolas.dechesne@linaro.org>
	<68356141.McDxtR3Bre@helios> <517BA9C6.6090707@balister.org>
	<1756231.MGNYtfpC2x@helios>
	<CAP71Wjw0rs0-WA=c4a92zsXCkrea8P7+CsbBdCU7HDd20MWCsQ@mail.gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Fri, 3 May 2013 16:00:13 +0200
Message-ID: <CAP71WjxM+5h436zjUYUAAvO3awMOiyqS1Wo62ibTGQZEmPRiEQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQnLZ9gi9m1etS2LXF/su3c8Oy2XBZfx9c9yZAeNREu+uvDDc9coWRwJodMdD0Lwx6pogksw
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
X-List-Received-Date: Fri, 03 May 2013 14:18:43 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Apr 29, 2013 at 8:40 AM, Nicolas Dechesne
<nicolas.dechesne@linaro.org> wrote:
> On Sat, Apr 27, 2013 at 1:13 PM, Paul Eggleton
> <paul.eggleton@linux.intel.com> wrote:
>>> > On Friday 26 April 2013 23:41:38 Koen Kooi wrote:
>>> >> And do you really need a .inc?
>>> >
>>> > Are we removing inc files if they were present in OE Classic? First I've
>>> > heard if we are...
>>>
>>> If we are trying to reduce the number of versions of recipes we carry,
>>> dropping .inc files would seem to be a good idea. I don't have strong
>>> feelings, but it seems like something we should consider.
>>
>> I agree we should try to keep only one version of each recipe in software
>> layers, however I figure it makes it easier for people to carry their own
>> versions of recipes in distro layers (particularly older, which may be
>> required in certain circumstances) if we do keep inc files where they already
>> exist.
>
> I put the .inc in this patch, indeed because it was there in OE
> Classic. I can update the patch if there is a consensus to remove the
> .inc.
>
> also for the INC_PR, I added it, because I thought it makes sense for
> .bb with .inc to have that. again, i can update the patch if you
> recommend doing this way.
>
> thx

hi, can you please let me know what I should do here? i can update the
patch if needed, but not sure there is a clear consensus on what to
do!

nicolas


