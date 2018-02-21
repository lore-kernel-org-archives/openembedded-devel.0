Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot0-f171.google.com (mail-ot0-f171.google.com
	[74.125.82.171])
	by mail.openembedded.org (Postfix) with ESMTP id 966CC71BA6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Feb 2018 13:59:22 +0000 (UTC)
Received: by mail-ot0-f171.google.com with SMTP id n74so1255003ota.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Feb 2018 05:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=j1vtpaaLGxoeInL54gnjCDRd2w3wSm2G9V5qz7fmzbc=;
	b=wkllseJ5YGp/mk8ZxAgbJHscq4lUu84OGbWYYZBNVD930vjurJJWL6MRr/s66Z/WEq
	+f1ubI6gumn6jCh2TVsffaJYQ7om49Mczrqyq1Hw5d+8emulx8XAtih03vD9N6iSuT6J
	QQ2aj27+jwpySSmQNkcP11ZtdvWafpAn7RRA+ib+KUUNyJeo5rdqUrJrjKxQlYUx/D9y
	Mz+a3bz8S6RNRaojzCVy4qvZ5ht9a5JJJKfuFwoLKxBDdr5ZMIP3FxTlBoYzjukaWNrT
	Q/slMq421ZmBXSgpVWXDjRxIfLCBCIg4Th5OSljUqhY0LUh3vhJg7mT5xwXLQOrVatl+
	ejEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=j1vtpaaLGxoeInL54gnjCDRd2w3wSm2G9V5qz7fmzbc=;
	b=ELjB24ftr8HeYxcl+n+bZSIi3D5S/wna1E8L/hMyGzXfu8c0kydySNZNBAM9mCI4oW
	CLAiMMQYeQPVAlGT+rOasGIfA8bQXgJ5KnofwJmrsJ3LFbDx5nnZIT0XN0GajRogszRH
	Pf8/bwwJXoWLGSEIsw1616DdceNG0f6BmOdtfyohdXZo3yDBELVOz/w/ckZFZ3XzLmYa
	BMveFaSyl7AeG4hp+v59rZA88YP89imSiFxywtVkrsmJM/vuKKss/UX3E1wG7IZn9Oc4
	aM/RnDyupYGArSFElYZ19NfOMElWCTki5k6l+6yCdwYBDui5BO6OYllhxsDIYeo3SxlA
	oY7Q==
X-Gm-Message-State: APf1xPDme82fkZqZLtkrermEHhWIx5c8atl+GGzsZMbfa/ctz9UDHChN
	Gno/43JIQTieW2vJ/fFxvl9VMj0t
X-Google-Smtp-Source: AG47ELsXa2J9+ihkvn2PXxP4HIpkhkQdKGWO3MMy1FEEZYy6cri0tTx8mxej929SV50p2ka7IN+zhw==
X-Received: by 10.157.35.99 with SMTP id k32mr2466453otd.154.1519221563200;
	Wed, 21 Feb 2018 05:59:23 -0800 (PST)
Received: from mail-ot0-f179.google.com (mail-ot0-f179.google.com.
	[74.125.82.179])
	by smtp.gmail.com with ESMTPSA id 9sm4882401otd.2.2018.02.21.05.59.21
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Feb 2018 05:59:22 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot0-f179.google.com with SMTP id p8so1463175otf.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Feb 2018 05:59:21 -0800 (PST)
X-Received: by 10.157.63.102 with SMTP id m93mr2523586otc.327.1519221561428;
	Wed, 21 Feb 2018 05:59:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.80.129 with HTTP; Wed, 21 Feb 2018 05:59:20 -0800 (PST)
In-Reply-To: <CADkTA4OUy=njCwt5OwsSvRrnDQbF+m2bY+iF=Oj8OEA156Fraw@mail.gmail.com>
References: <CAJTo0LYxqFFmUA9XcCO3_WO32NB4YLYy7pJK5ivyzPQYY5-hvQ@mail.gmail.com>
	<f808dcd5-82b9-b9c7-2c4a-b5b35b21fb42@gmail.com>
	<CADkTA4MdQgigdN+hSsyZjk=1nfDB3M2799Pf-jy4WYt=6PdXyA@mail.gmail.com>
	<8d5be4e4-3fd9-a0f2-c5cf-b967cf428416@gmail.com>
	<CADkTA4P46zCdHEUeAdsC7Ej+N3gp7-6Rxx=UTTYN7U91fL3Z1w@mail.gmail.com>
	<CA+chaQd=LFUw8wV0h6O2O_RvH2R9APE=X3Mn+DarPSwxefs6bg@mail.gmail.com>
	<20180221134509.wheeephzdzqytopy@mentor.com>
	<CADkTA4OUy=njCwt5OwsSvRrnDQbF+m2bY+iF=Oj8OEA156Fraw@mail.gmail.com>
Date: Wed, 21 Feb 2018 10:59:20 -0300
X-Gmail-Original-Message-ID: <CAP9ODKo08YgHUtnr4TrQ5V0C7BbXRc2UEj=-pnGAo+TMxB1H5g@mail.gmail.com>
Message-ID: <CAP9ODKo08YgHUtnr4TrQ5V0C7BbXRc2UEj=-pnGAo+TMxB1H5g@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: Splitting meta-oe?
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
X-List-Received-Date: Wed, 21 Feb 2018 13:59:22 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 21, 2018 at 10:55 AM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
> On Wed, Feb 21, 2018 at 8:45 AM, Joe MacDonald <Joe_MacDonald@mentor.com> wrote:
>> [Re: [oe] Splitting meta-oe?] On 18.02.21 (Wed 09:49) Martin Jansa wrote:
>>
>>> > I need an updated python-<foo> package for an unrelated package
>>>
>>> And how far will you go?
>>>
>>> If you want just newer python-<foo> and nothing else, will you take other
>>> changes to other python-* recipes from meta-python layer? There is a lot of
>>> recipes there, if you're so picky about updates, then you shouldn't update
>>> whole oe-core as well.
>>
>> It seems like this part is already settled, but it would seem to me that
>> this scenario, if I understand it correctly, is "I'm using oe-core and
>> see up-stream meta-oe/meta-somethingorother has an updated or new recipe
>> for something I want in my image but I don't want to do a pull on all of
>> meta-oe and potentially cause a huge rebuild of stuff I don't really
>> care about".
>>
>> That sounds like a problem better solved with 'git branch', 'git fetch'
>> and 'git cherry-pick' on the developer's side than breaking up meta-oe
>> across existing meta-boundaries.
>
> Agreed. I was just probing to see if anyone had ideas on how that could
> be managed by infrastructure, versus me mucking about.
>
> Maybe RP's thoughts on layer tooling or setup possibilities would help,
> but either way, I'll keep chugging along :D

I think this is a valid thing to discuss but not in this thread (as
well as for tooling and etc.).

Here I think we ought to focus in:

 Should we split meta-oe?

My vote is no! Yocto Project as a whole would benefit of people inside
of Yocto Project QA sending fixes for parse errors introduced by their
changes in OE-Core  and so I'd prefer to keep it as is.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

