Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id CDA7160111
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jun 2017 06:01:14 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id i7so77383694ioe.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Jun 2017 23:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=g/ounFnED+SjL2vYJiUFGxcWB4iNiJUMfQauYiivEGE=;
	b=Q56/e6mL1gBPrzgHhykxME4u9kykEbd9sn3hQww9sV9kVcMo7no5O2UB3kBfswXT36
	VzY1bg7o5AtF4u1dd7g9XORt6c3yCaoo3WXaoeV8yODxUXpmFrm8PcwrjD3+OkrHywKJ
	r+JVQYwpjjL0N8eKNqUIHyf7mP5nKOnwoyoF4OyuxaKbRxAbIZp2OMN4StYf+F2aAlFL
	1Lnxy7rM083wNVP/aWd9x/SGnCeE0ZLhDhTU4K6fC5zCE6fLucQ83fpjCDn/z84pH+9J
	gOQvWzSiRax3mOoVmTjoJxGKJuxPBxcdsWvU7fWRkP4X5M26XbcXbs0h6fgTyhSnIiOM
	uu0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=g/ounFnED+SjL2vYJiUFGxcWB4iNiJUMfQauYiivEGE=;
	b=PIVOOOicw+VEA2giqAAIumOqqSbL+3sktzmbcV3SA/1H5tCMI6jluujPhOK4wua5oL
	7qZsk/0mWls4wL4auxtpBLBbKVOXHGriHwDZJXW5yvCgebim0V6unaxlfZuf/XTuNXIz
	sOMy+Zi5chzxbtBAcRW33Q0jmFidQMRnHDIJi+GUEN7DrFcS4chMEL2xN+PABIpDm5Ui
	9JKXMtQn97GyaemAxhaI3SLiX1j0XfQ9xHSzmu8C062/LuiWiY9M7UiF27sNUXuXweHc
	KrkhG8YrTvMCXAZtn/lRWeZpdW6KM73edRo2THm928oYNmhtDGcuoOvdr6Mn5fIkyl9Z
	OZRw==
X-Gm-Message-State: AKS2vOyB3h8rZXo1EfBArMsWM9hhC6P5E5n/Hd7L6CypYcmgGSvV7Lzv
	1+kcYQG/GvbEitwsdFs=
X-Received: by 10.107.20.150 with SMTP id 144mr24579699iou.25.1497938475371;
	Mon, 19 Jun 2017 23:01:15 -0700 (PDT)
Received: from linux-uys3 ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id i6sm7921966iti.20.2017.06.19.23.01.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Jun 2017 23:01:11 -0700 (PDT)
Date: Tue, 20 Jun 2017 02:01:09 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20170620060109.GA12744@linux-uys3>
References: <CA+chaQdyLDc38rC-geZay6JO_QcsUZn0ZUJPVzqWXcO-wxP2ww@mail.gmail.com>
	<20170618120909.3499-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20170618120909.3499-1-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.6.0 (2016-04-01)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-browser][PATCHv3 1/2] chromium(-wayland): Fix build with gcc7
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
X-List-Received-Date: Tue, 20 Jun 2017 06:01:15 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Awesome!! I've build- and run- -tested this with x11 on:
- minnow (x86-64)
- qemux86
- rpi3 (32-bit)
- dragonboard-410c

nice find

