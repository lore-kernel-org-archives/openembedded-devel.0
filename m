Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f42.google.com (mail-oi0-f42.google.com
	[209.85.218.42])
	by mail.openembedded.org (Postfix) with ESMTP id CB80D78754
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Feb 2018 14:00:28 +0000 (UTC)
Received: by mail-oi0-f42.google.com with SMTP id a207so1155964oii.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Feb 2018 06:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=UvgtYkbMN4O31abceqM0IBvftEzBHRGPIq+e1AkLA98=;
	b=LBCtTK3zogEkp8QoPa7Wn0qY7BGss+4BeSdiyyca4TE4oI/INixgzd8lxaO2GqsN7Q
	LfzflredxutIWkm3yLccAC16u99xfABo1LBHHMKiw7iMcv/fGIg2f/0Rb8NKMAsGl+dO
	xyZsA+DI1Et8BUHMu4N+bOvR0+H2KxFSsZaZ5nM9kbaqW6vCupamTSIGODRqwkRr/Ecw
	J183LBj5pPXUV7e9sxNK93Nx02+82l+LxVubY86Yg0QyWXx4IVu9I9LY/rDbCndFNRiK
	1OaFPDm/9F/VmWiaHcEVuaSGMrVyHsa6vtwTA/H9sQtjMcf7972qG2stNsxkNdKhGdEb
	0O7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=UvgtYkbMN4O31abceqM0IBvftEzBHRGPIq+e1AkLA98=;
	b=d+rSE8M2bVGsqxepP4heK2gRDSVFA9JiVkNy6i+INzztDcPu8+hC/2Sot8pPoSyd0t
	ODscUtz0Je5w9hCakxLIRQaW2AvNC6V2AMNXx4qKt2e0IzGK/BJxO7rDOTpd0w+oMPrQ
	8HNdgbuFA2WhjS/8Y4xquHaluiNfvwLsTnsItWVstClZvBzOSc+wAO8rZy+qYuIbeblp
	n74tLE5wihwXvG2ORv+KT4vYiP8y1XNcmIqddfNL5IKvt0NV0OEFphlMht8BrL8E7hms
	vdbd9Xjr/o7eF7UfO/hYkt4sz0OHWCn9Qck7FZ/kngF42gknS1TFJE8ZK1AByqaPFPdE
	5i3g==
X-Gm-Message-State: APf1xPAmRQqkc9udotz24jZt17afCmK2t7D4hMAQ6owziA4mCX/lPdb3
	LhlllXXsgsYQFmChEOLruukWn+R5
X-Google-Smtp-Source: AH8x227IW9KB7+8xsNczy6asg3DgulodsZEgZHNq60nZ7cWRsaB9dZkcp3DuSlfmUHdqsTk28EAlCw==
X-Received: by 10.202.58.8 with SMTP id h8mr2008468oia.88.1519221629419;
	Wed, 21 Feb 2018 06:00:29 -0800 (PST)
Received: from mail-oi0-f53.google.com (mail-oi0-f53.google.com.
	[209.85.218.53])
	by smtp.gmail.com with ESMTPSA id q4sm4508181oia.35.2018.02.21.06.00.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Feb 2018 06:00:28 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f53.google.com with SMTP id b8so1155802oib.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Feb 2018 06:00:28 -0800 (PST)
X-Received: by 10.202.80.13 with SMTP id e13mr2201675oib.304.1519221627709;
	Wed, 21 Feb 2018 06:00:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.80.129 with HTTP; Wed, 21 Feb 2018 06:00:27 -0800 (PST)
In-Reply-To: <20180221135732.GI4311@bill-the-cat>
References: <CAJTo0LYxqFFmUA9XcCO3_WO32NB4YLYy7pJK5ivyzPQYY5-hvQ@mail.gmail.com>
	<f808dcd5-82b9-b9c7-2c4a-b5b35b21fb42@gmail.com>
	<1519148811.24236.321.camel@linuxfoundation.org>
	<CANx9H-AioXLbdF=aZjuFSU3Ev3d131wFQbF1b-RH1PtMES3-3Q@mail.gmail.com>
	<f16ec80b-f2b9-c154-5262-ac4562da8cba@gmail.com>
	<1519152750.24236.330.camel@linuxfoundation.org>
	<CAP9ODKrxvspWQ9hXd7gWvGmTzTqHUYZyMejL=yVXHqG258ggkA@mail.gmail.com>
	<CAP9ODKo=z65e9_kj0fxpGRugsKTOun6mnTzdfpAbkmekKSKpCA@mail.gmail.com>
	<20180221135732.GI4311@bill-the-cat>
Date: Wed, 21 Feb 2018 11:00:27 -0300
X-Gmail-Original-Message-ID: <CAP9ODKq2CgQj_C1KnmGrN6giJa5SFLrq6jjg-mGQgJwO0QQwhQ@mail.gmail.com>
Message-ID: <CAP9ODKq2CgQj_C1KnmGrN6giJa5SFLrq6jjg-mGQgJwO0QQwhQ@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Otavio Salvador <otavio@ossystems.com.br>
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
X-List-Received-Date: Wed, 21 Feb 2018 14:00:29 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 21, 2018 at 10:57 AM, Tom Rini <trini@konsulko.com> wrote:
> On Tue, Feb 20, 2018 at 09:10:25PM -0300, Otavio Salvador wrote:
>> On Tue, Feb 20, 2018 at 9:07 PM, Otavio Salvador
>> <otavio@ossystems.com.br> wrote:
>> > On Tue, Feb 20, 2018 at 3:52 PM, Richard Purdie
>> > <richard.purdie@linuxfoundation.org> wrote:
>> >> I could combo-layer pieces of meta-oe into poky but I'd imagine that
>> >> would create more problems than it would solve too and given the
>> >> general dislike of combo-layer, I think ultimately better layer tooling
>> >> would be a better answer and more acceptable to everyone.
>> >
>> > Poky creates more problems then it solves
>>
>> ... send was too soon ...
>>
>> Poky creates more problems then it solves.
>>
>>  - it causes confusion
>>  - it avoids the urgency in adopting a setup script
>>  - it does not use the layers as we market as being a good thing
>>
>> So adding more things to it, just makes it worse.
>>
>> The setup script is more urgent to be discussed then splitting meta-oe.
>
> I agree that a setup script of some sort (off the top of my head,
> something that takes layer-names as input, checks vs a list,
> fetches/clones, creates a wrapper around bitbake-layers to always add
> them) should be a high priority.  I don't have a problem telling my
> customers to clone meta-openembedded and then use the layers that are
> needed in that specific project.  But it's painful to have a shell
> for-loop in the docs we provide so they can setup a build.

I think we ought to start a thread about the tooling, but let's focus
on meta-oe split here.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

