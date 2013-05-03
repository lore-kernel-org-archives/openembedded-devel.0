Received: from mail-ee0-f42.google.com ([74.125.83.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UYHR5-00061D-1t
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 May 2013 16:58:11 +0200
Received: by mail-ee0-f42.google.com with SMTP id c13so827963eek.29
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 May 2013 07:40:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=G0WpQajBUi8+p1SFeYeyMTLjkNibz5TRBRyCrkYV1c4=;
	b=X72L7EVDwitsAuklu1QXs8A+VleXH2tLFe0BLe2aQZBDcnYxstlncUlzE0/7hJmFUC
	WsiVj3TiuTeOGFXXi3ZpzxKysJXR469mdvY3JeKt6tN3/IOQgNNgWVx/BsGFvsB+UobD
	FzF0HDowFPqvRpR2prAto3ztx57bgz2F/5Sscf81kuxlZ9I/uZ4iqWQXwrP9Rr99Uyzp
	qT6hy9rC5I7RjBMKOVzURCwatB/S/enQUA/abQruk67khC12U0QKv7eWayGNI5VEq6z1
	zTccn7w14wlI26f8+3fcbWFK4F7F96DsQrhls8Mfe2MQRwrSeGCL1AYraRxDcOBqOIeZ
	w6zA==
X-Received: by 10.14.106.200 with SMTP id m48mr32224969eeg.17.1367592016052;
	Fri, 03 May 2013 07:40:16 -0700 (PDT)
Received: from ?IPv6:2001:610:612::dc8:274f:2522:bd85?
	([2001:610:612:0:dc8:274f:2522:bd85])
	by mx.google.com with ESMTPSA id l6sm16269610eem.9.2013.05.03.07.40.12
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 03 May 2013 07:40:13 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <12323341.7tMrSLVFbj@helios>
Date: Fri, 3 May 2013 16:40:13 +0200
Message-Id: <0EBE068C-2C2D-468C-BEB1-85FB799B94D6@dominion.thruhere.net>
References: <1367008757-18667-1-git-send-email-nicolas.dechesne@linaro.org>
	<CAP71Wjw0rs0-WA=c4a92zsXCkrea8P7+CsbBdCU7HDd20MWCsQ@mail.gmail.com>
	<CAP71WjxM+5h436zjUYUAAvO3awMOiyqS1Wo62ibTGQZEmPRiEQ@mail.gmail.com>
	<12323341.7tMrSLVFbj@helios>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQmhKOuzCuoupHSFhGIUunB8Bn4PpyxvtZTfA0zuGh0C0mpwOKz7M9witO8jvywedrAcosg0
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Fri, 03 May 2013 14:58:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 3 mei 2013, om 16:35 heeft Paul Eggleton =
<paul.eggleton@linux.intel.com> het volgende geschreven:

> On Friday 03 May 2013 16:00:13 Nicolas Dechesne wrote:
>> On Mon, Apr 29, 2013 at 8:40 AM, Nicolas Dechesne
>>=20
>> <nicolas.dechesne@linaro.org> wrote:
>>> On Sat, Apr 27, 2013 at 1:13 PM, Paul Eggleton
>>>=20
>>> <paul.eggleton@linux.intel.com> wrote:
>>>>>> On Friday 26 April 2013 23:41:38 Koen Kooi wrote:
>>>>>>> And do you really need a .inc?
>>>>>>=20
>>>>>> Are we removing inc files if they were present in OE Classic? =
First
>>>>>> I've
>>>>>> heard if we are...
>>>>>=20
>>>>> If we are trying to reduce the number of versions of recipes we =
carry,
>>>>> dropping .inc files would seem to be a good idea. I don't have =
strong
>>>>> feelings, but it seems like something we should consider.
>>>>=20
>>>> I agree we should try to keep only one version of each recipe in =
software
>>>> layers, however I figure it makes it easier for people to carry =
their own
>>>> versions of recipes in distro layers (particularly older, which may =
be
>>>> required in certain circumstances) if we do keep inc files where =
they
>>>> already exist.
>>>=20
>>> I put the .inc in this patch, indeed because it was there in OE
>>> Classic. I can update the patch if there is a consensus to remove =
the
>>> .inc.
>>>=20
>>> also for the INC_PR, I added it, because I thought it makes sense =
for
>>> .bb with .inc to have that. again, i can update the patch if you
>>> recommend doing this way.
>>=20
>> hi, can you please let me know what I should do here? i can update =
the
>> patch if needed, but not sure there is a clear consensus on what to
>> do!
>=20
> IMO, let's keep the separate inc file, but drop PR and INC_PR.

I still haven't heard a compelling case why smartmontools needs a .inc =
and all the other recipes in meta-oe don't. So drop the inc and be =
consistent with other recipes.




