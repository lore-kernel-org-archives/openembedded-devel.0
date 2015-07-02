Return-Path: <kergoth@gmail.com>
Received: from mail-qg0-f49.google.com (mail-qg0-f49.google.com
	[209.85.192.49])
	by mail.openembedded.org (Postfix) with ESMTP id 392FC6E5F5
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jul 2015 20:03:00 +0000 (UTC)
Received: by qgeg89 with SMTP id g89so38116019qge.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Jul 2015 13:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:content-type;
	bh=6lSL5OGREaI2KErRQW4Dm6D3/yrFuxkX6cjMG+cSop4=;
	b=tlFHxyJx3WCLXY5aARn2faTPEANhQXIoK1LnpwhMh5ubC2J/k7nwcT6r8zuSoNR33U
	VqbYuf94JNCbDcmEnUJz+i0TY2ElXQzJZVmqDQW/HS1J0nAHRAqAQ3LYociO83l3yUao
	0eOnrgdS5HtEyUD52AU/ZrQUyx6z46nCpPv3o3X7VyuyFBkyw0YWvFncd3cBGv24u1KU
	dxchmyKduy0jro/k/I67ODe2IduiJScVTyhEHU6oizAxzFgRfQ35ljtR/i40W9JhD3Xd
	9vXImbYnqZbQBxiDLFEJjHzKUfW4oHo2qBBD6DtyUwMWtBhgPOa0Z7Sg6Jr1s9cnDYSY
	NYXg==
X-Received: by 10.140.165.150 with SMTP id l144mr46016507qhl.99.1435867380780; 
	Thu, 02 Jul 2015 13:03:00 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.140.108.99 with HTTP; Thu, 2 Jul 2015 13:02:41 -0700 (PDT)
In-Reply-To: <55959734.4010509@balister.org>
References: <55959734.4010509@balister.org>
From: Christopher Larson <clarson@kergoth.com>
Date: Thu, 2 Jul 2015 13:02:41 -0700
X-Google-Sender-Auth: xGlGwgVJYaswQqiEicoLUZagKls
Message-ID: <CABcZANnqS3HfZqNQQuv8mhoPxj7LbKwL7j6w6BMz-cdJYoFstA@mail.gmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: How to create machine/customer specific ntp.conf files
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 02 Jul 2015 20:03:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 2, 2015 at 12:55 PM, Philip Balister <philip@balister.org>
wrote:

> I'm going round and round thinking about creating custom ntp.conf files.
>
> The existing recipe includes an ntp.conf file. My question is what is
> the best way to replace the on from the recipe with a machine specific
> config.
>
> There are a couple of config issues:
>
> 1) hardware may want to sync with an on board gps
> 2) A vendor may want to use their own ntp servers.
>
> Obviously, these need to apply only to specific machines and not all
> builds from the same set of layers.
>
> Any ideas how to do this without making the entire ntp package machine
> specific?
>
> Should we split the conf file into a separate recipe, sort of like gpsd?
>

Afaik that=E2=80=99d be the best way to handle it, iirc that=E2=80=99s how =
connman and the
like handle it too. Also remember to add it
to SIGGEN_EXCLUDERECIPES_ABISAFE in meta/conf/layer.conf if you go that
route, so stuff depending on it doesn=E2=80=99t get unnecessarily rebuilt w=
hen it
changes.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

