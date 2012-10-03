Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1TJOxZ-0001BB-5A
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Oct 2012 15:25:57 +0200
Received: by wgbdq11 with SMTP id dq11so4920924wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Oct 2012 06:12:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=K8X0AeKX1/BHbCGwUDJYK9nWVdHkdlVd+1inC+rWPSg=;
	b=KikrCUaMPAO19KrwbSkPAuSA2M0A3lnhsv+1EQp8WMuxrUADCc6oZQRUtUkEkL5Y9j
	XXMFcZTptvgUjBkV42wE2llqLgssyK+AZhjOkV/CPKAxtFhwsJ3fsylIWTwFzK2e3GAO
	Ah28CS2AcsOh9ZSc5K8KAdvHE5j6JH2pK+cP+meC4O8Ugd72sdVr9q/6QF8fl9egYoVB
	/jGyMKLG/cx05zKGqP52lLnMwcEhAT0s7DlFgCAbktolyHNe17pZvgDjezWVgPmbhoaf
	Ub+EwE6LjNmPz4htDrJPWEi0PcjY1zoy2xhxBktSrbqXv4a2dXS6iK7n/71aFSQFtwc1
	0+kg==
Received: by 10.180.106.130 with SMTP id gu2mr4894605wib.20.1349269977502;
	Wed, 03 Oct 2012 06:12:57 -0700 (PDT)
Received: from [172.20.0.10] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id cn6sm8401999wib.9.2012.10.03.06.12.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 03 Oct 2012 06:12:56 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.1 \(1498\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1396458.ob1fernpZs@helios>
Date: Wed, 3 Oct 2012 15:12:55 +0200
Message-Id: <74B58CA1-2332-42D6-9652-4226D9484259@dominion.thruhere.net>
References: <cover.1349107616.git.paul.eggleton@linux.intel.com>
	<2386446.3zWsEst4ZG@helios>
	<DDBB0A17-7234-45BC-9D2E-E9C0ED7C4086@dominion.thruhere.net>
	<1396458.ob1fernpZs@helios>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1498)
X-Gm-Message-State: ALoCoQnXkIzrIAHkcHpldLfPBlNKN1cLtGFtYlzX9wfXFOzEykDDTBwC60KehKrGdrekhjS6pADK
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-webserver][PATCH 0/6] Add meta-webserver
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
X-List-Received-Date: Wed, 03 Oct 2012 13:25:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 3 okt. 2012, om 14:23 heeft Paul Eggleton =
<paul.eggleton@linux.intel.com> het volgende geschreven:

> On Wednesday 03 October 2012 13:43:30 Koen Kooi wrote:
>> Op 3 okt. 2012, om 13:29 heeft Paul Eggleton =
<paul.eggleton@linux.intel.com>=20
> het volgende geschreven:
>>> On Wednesday 03 October 2012 13:27:41 Koen Kooi wrote:
>>>> Op 3 okt. 2012 om 12:43 heeft Paul Eggleton
>>>> <paul.eggleton@linux.intel.com>
>>>=20
>>> het volgende geschreven:
>>>>> On Wednesday 03 October 2012 12:24:19 Koen Kooi wrote:
>>>>>> Squash those "import" with the "fix" commits, no sense in having =
a
>>>>>> broken
>>>>>> recipe in there.
>>>>>=20
>>>>> I'd rather not - there is sense in being clear about the changes,
>>>>> because
>>>>> there are a large number of them in this case.
>>>>=20
>>>> The broken recipes are still available in OE classic if people want =
to
>>>> compare them. I still don't get why you want to have broken recipes =
in
>>>> the
>>>> tree at multiple points in your series.
>>>=20
>>> Because I want to easily see in "git blame" where particular lines =
came
>>> from - did I add them, or have they been around for ages?
>>=20
>> Does oe-core have the same flow for new recipes?
>=20
> You already know the answer to this.

No I don't, actually.=


