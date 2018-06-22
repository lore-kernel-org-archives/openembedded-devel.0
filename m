Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id ED7AC751BF
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jun 2018 20:13:52 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id f79-v6so7217601oib.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jun 2018 13:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=Wh4dpJvBWDnK5ak8fMKycrQ2UV41lxXBrWTTBu5gigU=;
	b=Qfec1BDOTSZVYtkBtzLmsW4Fkm6Qdu34wBiG/fBpAwiDG8q9QFRg9tcca9ILTOl8ux
	wz7/PZcarCnWEiVInMjTifjlx8byIQsfODWdgToYXJZLIefuqRfzu0J3pcFoE0oCZirH
	bx7LR4lcKkmyM1ce6RLDmk9qNoHfIziSwF+qQumj3cqW+4ur/BSBG1QPjRht4AMH9yFm
	2VVBYETWpGFmry4dV0QcywQH8CjXtBLUAWeWMVOyoUNRAptx7yglnjaZ2f0UGAC/lggM
	RqMyHRR7NeLLdYU2iBRtqLIcrr70QaQY0cBb4TAzjSUit/EZafu78amqujZ0e5ZeaRKB
	4GsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=Wh4dpJvBWDnK5ak8fMKycrQ2UV41lxXBrWTTBu5gigU=;
	b=cmHSRJxs/8CHgFhxMAOQEHz6xadcCtSYrcPOK2SrT4tDJyZnf6lSWUOZP4Dl5boqbk
	uhF9NlQiciNr/VkpdpQnoCYgUDhdk/6rAtL3t5vvUfBHUwhW1Kz6eV1U2p6Ta/XDplRx
	bui7xB053JztTtoZ25YXxSQyKMprgx+s6hezu01Ct3C4gi2gITmG+cqdSAYE/ZiRLRZo
	8gVS1DCj240xw5pLKbNdUeK5fsHrO6MNJnrALFCGzy17UYXWYxxXOsSFlp+ZyVzV9h+p
	pZ2eCiTATNuXxHtLXIGeR/L/SasKwP6FL8SIy3xZ4XIc3OAMsHMQTe4ycP9rssO0hLzO
	nmLQ==
X-Gm-Message-State: APt69E2Egb1mW0Nvn0GI+Afc304c+xdoxHTtqWKMqKp8c3mirKPJtfqk
	5MX0QRvbRBXlglsQDIzZ4zjhV6Ao
X-Google-Smtp-Source: AAOMgpd6WaKgTG/JzIXy3LPoKJLnj0vhgf2d5iA9IaLjzCWiyix1SCFZA/8pGuTJ8g9V726WHvJYMw==
X-Received: by 2002:a54:4e10:: with SMTP id
	a16-v6mr1750715oiy.25.1529698433301; 
	Fri, 22 Jun 2018 13:13:53 -0700 (PDT)
Received: from mail-oi0-f46.google.com (mail-oi0-f46.google.com.
	[209.85.218.46]) by smtp.gmail.com with ESMTPSA id
	a76-v6sm7295611oii.37.2018.06.22.13.13.51
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Jun 2018 13:13:52 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f46.google.com with SMTP id l22-v6so7215318oib.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jun 2018 13:13:51 -0700 (PDT)
X-Received: by 2002:aca:3016:: with SMTP id
	w22-v6mr1747310oiw.315.1529698431549; 
	Fri, 22 Jun 2018 13:13:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:58c5:0:0:0:0:0 with HTTP; Fri, 22 Jun 2018 13:13:50
	-0700 (PDT)
In-Reply-To: <20180622185926.GB1842@jama>
References: <20180622183246.6608-1-otavio@ossystems.com.br>
	<20180622185926.GB1842@jama>
Date: Fri, 22 Jun 2018 17:13:50 -0300
X-Gmail-Original-Message-ID: <CAP9ODKp7vvs4AvCgy730+A=eOUv4OESBn9rgNm7euFcPfS0K3w@mail.gmail.com>
Message-ID: <CAP9ODKp7vvs4AvCgy730+A=eOUv4OESBn9rgNm7euFcPfS0K3w@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5 PATCH] README: Rework to start using GitHub for development
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
X-List-Received-Date: Fri, 22 Jun 2018 20:13:53 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 22, 2018 at 3:59 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Fri, Jun 22, 2018 at 03:32:46PM -0300, Otavio Salvador wrote:
>> This changes the content so we start sending people to GitHub and
>> deprecate the OpenEmbedded-Devel mailing list as the place for patch
>> submission.
>>
>> The content has been reworked so it renders better inside GitHub and
>> provide a more structured content.
>
> I'm done with patchwork.
>
> If anyone has some pending changes which I haven't merged to master-next
> last night, then send pings or re-submit them as pull-requests. Pending
> changes from master-next will be merged to master together with 5.11.1
> upgrade soon.
>
> Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

+1

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

