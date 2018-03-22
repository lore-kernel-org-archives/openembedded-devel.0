Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id 233B36074F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Mar 2018 23:47:21 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id w12-v6so6346125plp.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Mar 2018 16:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Y9OkpKJA21oGiRYnW1L3ZUYeE8YRtH7SbrNY0wjJHG4=;
	b=TCMWcw/2UQlvRH3UpNTT3kreQnqyLgNNY95fk7LRXD8zLLptZAmm3gQpZoTGlSXOyD
	aGBTkzedfTsFl0R3alax+CDSa4bK4Da+ydKJQte4ofyqIkD10swL7e8yK9B5mpiwJ6lZ
	1TmGjbvHLcX14VUh5IvoXHtIIW2ZUGVfkbRjZrGC8A0SoFCT2Cz2qhdaGj7UluJwlfk4
	oO8Z43Uyumm1dcOGOZEd7G5V4/bVe4EpjA0FNvr+9IWk+hoCYX6s4lbd/Cd1PPhh+D83
	/AyS/kEwRDQAET72i06gKzRm1eWuR4mLFszoUOTjKuYytQQgfneFNwnwnqBRPRlv8DU3
	eBdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Y9OkpKJA21oGiRYnW1L3ZUYeE8YRtH7SbrNY0wjJHG4=;
	b=WCxZtkNrPmGjaEEr3ZijwOUyVIy5ZzQcqsN6S37fhqpykI0NGw3ZSP9CBjuSxDpgPv
	soH6LXTsmWsT/5er6cXxh2t0OBgVP4+6le+X5Pi7Ceb70J9fClWKBL+ohBTQ5Qzlvs8M
	RnRQZMISsGMTyCKS6b+qx5vVpGFhiy8FJAnxaFMoTLy2HFlCEZ0y6dFR8e0C5qfrmd8F
	sfPFpLeYoola5DGSIl6xqDbV3k1Y8S4GeIODGpf8Mhux8Vq1CA1Ia/F4TIEF4UrHjH6T
	YaHOO+jnk5UOKX47nZFwt7inKyblgwyU0H16pv/sHHKxBpV6xcEpo/UWhTERnEePxa7Y
	7ivA==
X-Gm-Message-State: AElRT7FlJw3QrVhYS9cSZzCYfViECCES4UcfvEt3suFQ23/iPst0fx8Z
	n1nfb7vNDY3ZSuq+KPk614HJ8GlgRamIfVkdbUI=
X-Google-Smtp-Source: AG47ELtl6B00Wxc9z4DWWhGDJpV0fl58QI15g6j+ZEw7o7/tWmnnVoCNMkcFy2B4a8sCuxs+jLHn0SmNcjtyt789eTQ=
X-Received: by 2002:a17:902:8f97:: with SMTP id
	z23-v6mr27125388plo.162.1521762442901; 
	Thu, 22 Mar 2018 16:47:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.241.68 with HTTP; Thu, 22 Mar 2018 16:46:52 -0700 (PDT)
In-Reply-To: <CALbNGRSN2HLPQ50RN9hE7XHGLLF0oLCgx22aT=DOsAGKqd5p4g@mail.gmail.com>
References: <20180322213741.29876-1-schnitzeltony@gmail.com>
	<CALbNGRTpiqyWxrZqwevg5qpbLOLzyAWmTtWbq26n6o1k0QVEag@mail.gmail.com>
	<CAMKF1sq9B04-As85yRQvtrLBoWYZvqsYN989QiGdJ8x8bfe7iQ@mail.gmail.com>
	<CALbNGRSN2HLPQ50RN9hE7XHGLLF0oLCgx22aT=DOsAGKqd5p4g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 22 Mar 2018 16:46:52 -0700
Message-ID: <CAMKF1srfY4X7hhe6TY-=Hm=5hQh_zP_f2a92Fb127Cs3OwoHzg@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 1/4] networkmanager: fix gobject-introspection/musl and cleanup
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Mar 2018 23:47:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 22, 2018 at 4:27 PM, Andreas M=C3=BCller <schnitzeltony@gmail.c=
om> wrote:
> On Thu, Mar 22, 2018 at 10:51 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Thu, Mar 22, 2018 at 2:44 PM, Andreas M=C3=BCller <schnitzeltony@gmai=
l.com> wrote:
>>> On Thu, Mar 22, 2018 at 10:37 PM, Andreas M=C3=BCller
>>> <schnitzeltony@gmail.com> wrote:
>>>> This adresses the comments for recent patch which updated nm to 1.10.6=
 and is a
>>>> follow-up for [1].
>>>>
>>>> * Make gobject-introspection work by skipping creation of gobject-intr=
ospection
>>>>   specific documentation. This fixes networkmanager-applet regression.
>>>> * Cleanup patches: Remove current musl patches completely and re-use t=
hose
>>>>   found in void-linux because they do look much cleaner and don't touc=
h glibc
>>>>   build. One nice side effect: In the future when nm is updated we can=
 steal
>>>>   again and don't need to reenvent here. Usually they are much faster =
than we
>>>>   are (and I know one major contibutor personally from the good old Z8=
0 times..)
>>>> * Fix typo in PACKAGECONFIG
>>>>
>>>> [1] https://patchwork.openembedded.org/patch/149244/
>>>>
>>> Khem: can you give these a musl test? I do not have enough time and
>>> build resources (and am not using musl).
>>
>> I will try it out hopefully by weekend. What you dont use musl !!!! my g=
od :)
>
> Teach me: why should I?
>

over a beer sometime :)

> Andreas

