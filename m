Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f41.google.com (mail-vk0-f41.google.com
	[209.85.213.41])
	by mail.openembedded.org (Postfix) with ESMTP id B70376FFCC
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Mar 2016 23:42:43 +0000 (UTC)
Received: by mail-vk0-f41.google.com with SMTP id e6so69746555vkh.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Mar 2016 15:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-transfer-encoding;
	bh=4uJErlrHv0cfeAPAz63YWa8rEo7Hl5aLDbUQzC3MaSA=;
	b=UGiMkE0N63UULC6AHu34YwUZ9FoUg8R5pG2aUS/c/e33LfnTcoewW2clufm8n+RoRR
	9GKADoogwB6NboPDBiiJ80f9QmAG9tAKMrIMDT5LB7kLWYQ8YX2It4tD2Cpj4pGLhDEW
	bp3IT4tW6a/yAa4GqYvd695f/FTG9AL+K0shBmZO0dKiLvIxFbWcAHlmDb3IC+BkEPKb
	WJOeIMb7p62LjlGCsx3yGEOZdFPDuncyCpgGZ5OgQj9VXdDGdGVAGO0+fXzeem13OxPm
	coWlM/UHCp5H7xcMhxN4DDwmCVY6oqcMDrSMgGUiOqUVIGdEReQCPg8l4rbOBuja2sWs
	hgbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-transfer-encoding;
	bh=4uJErlrHv0cfeAPAz63YWa8rEo7Hl5aLDbUQzC3MaSA=;
	b=fwS/DXONYFyGNHkLPqn3uQy1oCnR+JMpkpw+EqVfMS5+dWcYeltCTVoGdJQoR6juth
	Ar5+piklgzErPVQUUIj9ApissyI+gKGXwoAmiYBFaSODXo4T5lkQbihGwGuJSCt9Y0Vd
	xDxn3qkuVKeappxwRocZPJVndjlNYgertfFrRulT9ScqtggJHLHhKbpMXAAqQ1U1+vC6
	nhmyBRIx5UrlWZf4dKSaEYPEV0X76ikQN3XT0GPo5nocnvaG6mR/K8hqR5GqlgKCqzLt
	2vw02tJuHdA6Oe8uGPQpfw+reBSoJrrM9KdSVmQdUb1aDAQ5vUsvA7S4imnngoXy381O
	4lSA==
X-Gm-Message-State: AD7BkJJi8/5NmIqf2VVQcDf+xTlFDmyCQUU/SoIwb5QUUYLY5eNn9o8WX/rj9mMGrRaHd4rvi4wn5hgVqynOjQ==
MIME-Version: 1.0
X-Received: by 10.31.192.78 with SMTP id q75mr8616249vkf.96.1457134963849;
	Fri, 04 Mar 2016 15:42:43 -0800 (PST)
Received: by 10.159.55.167 with HTTP; Fri, 4 Mar 2016 15:42:43 -0800 (PST)
In-Reply-To: <CAMKF1sr_oFNbatzU4_pXnwZ7WU5JjmExeD0NFSYoScQD8YmpZA@mail.gmail.com>
References: <1456266340-30312-1-git-send-email-schnitzeltony@googlemail.com>
	<CAMKF1sr_oFNbatzU4_pXnwZ7WU5JjmExeD0NFSYoScQD8YmpZA@mail.gmail.com>
Date: Sat, 5 Mar 2016 00:42:43 +0100
Message-ID: <CALbNGRSqL0tEnL2wb7BKH0nMbw9PGTdn6pFNyd8v63_HNr=yTw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser][PATCH] firefox: fix install for oe-core master and cleanup packaging
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
X-List-Received-Date: Fri, 04 Mar 2016 23:42:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 5, 2016 at 12:33 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Wed, Feb 24, 2016 at 6:25 AM, Andreas M=C3=BCller
> <schnitzeltony@googlemail.com> wrote:
>> Could build test only due to lack of building image
>>
>
> this is ok to install.
Forgot to mention: meanwhile I have run-on-target-experience without issues

Andreas

