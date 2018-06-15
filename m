Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot0-f193.google.com (mail-ot0-f193.google.com
	[74.125.82.193])
	by mail.openembedded.org (Postfix) with ESMTP id 9377C74D0B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jun 2018 12:49:46 +0000 (UTC)
Received: by mail-ot0-f193.google.com with SMTP id 101-v6so10853857oth.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jun 2018 05:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=GY5hJHX8AHmw+O0KnRYYSH7o1SIk9Jiwb7PXaYyJ1Wo=;
	b=1oEyAv8r/IrylXgZoqQ1v2RQKcVupU6PPl8GkSHHsBqG4O2jzcRAVj8cy/Bv5Iia7s
	J035cAXIC8un8E5MeEL4xuX+hJMvZLMcm/avnS0mjlaNj3o2DU1K16xJk+NMjADj4Rrd
	/yoN9k6X424KpW7uz82jONKmz1HH0jsiyoW854i2prnsSsczffmy06wcSOz4DaZayTxP
	KauL92ScM+/NwCoEHl0PnKgCfPKCsxCw4KaR9pA/A1w+WCFaS5MKeRDBbw8VDPyan2y+
	NAxOlA9ij0Ef1OYv7ETcYPKTJ8buW9MByBV9hZ1vbRjT6vzKmNgHXXpEFShTbj3NC4iU
	5egQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=GY5hJHX8AHmw+O0KnRYYSH7o1SIk9Jiwb7PXaYyJ1Wo=;
	b=Qd/oeILSZv0+2fiyyQMgaxcFRFxPokC4EXJhnosRdfjm3jxbnGDnN1KhfvGRa1hRsZ
	winb7V72Kx0N4i4JWbovI2W/3M7MwFjMmdaVkCTaz/MUblwkrnKFsNc3hFArXJ+FuZHS
	N539BgmVDvFup47pkRJM506RTfXrtCl+4vvFGoOIoh5dNxWplpGBpKMWpUUGeJLFvccb
	ZczomnbYWGn8ij0qcDBoWGkOvWVSgi7Wy7KhQ73ukrwsfcAGlyZWmF0r/bhSYLqjGj4A
	jEp56dG28GFkn0F+pKZON34tahijFjtOJOu2uDgTsBjV6fr0X7LIJ2/Ela4gZP4sJC/H
	5i+g==
X-Gm-Message-State: APt69E0ie8EJpA1T3F+y94uVsG7bu0zjFDHxdIPmp+d5dQ6zB3jINCwW
	d8GjPjQJg0GUnwekZBbbSeU8gACl
X-Google-Smtp-Source: ADUXVKJvJjYxqi4bRHwNta1ZvcP6/U4MxQ1Q6vpFboV6j9tOj7Xx7gSgG6+OcPh7Ph/T/Zxrmb9qGw==
X-Received: by 2002:a9d:4788:: with SMTP id b8-v6mr849431otf.158.1529066987095;
	Fri, 15 Jun 2018 05:49:47 -0700 (PDT)
Received: from mail-oi0-f42.google.com (mail-oi0-f42.google.com.
	[209.85.218.42]) by smtp.gmail.com with ESMTPSA id
	v8-v6sm8650230oti.35.2018.06.15.05.49.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Jun 2018 05:49:45 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f42.google.com with SMTP id t133-v6so8675956oif.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jun 2018 05:49:45 -0700 (PDT)
X-Received: by 2002:aca:f594:: with SMTP id
	t142-v6mr866650oih.56.1529066985270; 
	Fri, 15 Jun 2018 05:49:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:58c5:0:0:0:0:0 with HTTP; Fri, 15 Jun 2018 05:49:44
	-0700 (PDT)
In-Reply-To: <20180615092149.GA21861@mail.itconsulting-heinold.de>
References: <3463e929-53ce-df98-355c-11de357fc5ae@skidata.com>
	<69df7e62-bd10-ba0e-7441-1bb4f76940f3@skidata.com>
	<20180615085854.GA35551@mbabyjoh-desk.ger.corp.intel.com>
	<20180615092149.GA21861@mail.itconsulting-heinold.de>
Date: Fri, 15 Jun 2018 09:49:44 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqWv0ciWOsRWgMWjcpdxVosuJ0EaB0Vph8rfkq6xnN1aw@mail.gmail.com>
Message-ID: <CAP9ODKqWv0ciWOsRWgMWjcpdxVosuJ0EaB0Vph8rfkq6xnN1aw@mail.gmail.com>
To: Henning Heinold <henning@itconsulting-heinold.de>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [yocto] [meta-java][PATCH 3/3] openjdk-8: use ca-certificates-java
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
X-List-Received-Date: Fri, 15 Jun 2018 12:49:46 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 15, 2018 at 6:21 AM, Henning Heinold
<henning@itconsulting-heinold.de> wrote:
> On Fri, Jun 15, 2018 at 11:58:55AM +0300, Maxin B. John wrote:
>> Hi Richard,
>>
>> On Fri, Jun 15, 2018 at 10:19:06AM +0200, prvs=6977bbb5e=Richard.Leitner@skidata.com wrote:
>> > fyi, as this was posted on yocto@yoctoproject.org
>> >
>> > @Otavio/Maxin/Henning: is it OK to just force-push to>> > master-next without this commit? Or should I push a
>> > "revert" commit?
>>
>> I think it is ok to force-push to the master-next branch
>> (obviously not ok to force push to other branches).
>>
>> > regards;Richard.L
>>
>> Best Regards,
>> Maxin
>
> Hi,
>
> I am fine with push-force in this case too.
>
> Bye Henning



-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

