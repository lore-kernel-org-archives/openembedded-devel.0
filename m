Return-Path: <paul.betafive@gmail.com>
Received: from mail-vb0-f44.google.com (mail-vb0-f44.google.com
	[209.85.212.44])
	by mail.openembedded.org (Postfix) with ESMTP id A40D76A413
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Jun 2013 10:23:10 +0000 (UTC)
Received: by mail-vb0-f44.google.com with SMTP id e15so6808698vbg.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Jun 2013 03:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=VaCK0JxUD1Fp1QYA6b4qZkM35Wy0GpJ0jQ7csHOGEwE=;
	b=xdhWIxErZYdc/tPcDySS/6HuuxXW44ERXkeEHeIKz0JKf3ADJag8ow51GASJdtXGa8
	m9NCmFrIk3z0THw7QOg0UUde1IN/StOW1yH/6LzRsojoORUsMxBUz/LgKAcCwgIcOT8K
	38LQKzQbU/VV3GN7SF/FklvliYn2a7M37NYBIClSMNmcXzNsFAJNExQhIP+/rA4oA563
	/qM5APf6u8X0qG5CyFTWk5nt3CZzAqQYhhK5CrlnmaPUIJdEMYk4k2nIUdCQb7Ik5XFE
	kjSoYyWCGehV0nDL3k9rLMtq0g6QfDAuWQ0lnLXkW5+g4/+w3CmZqQHMroRKaLLHg/ot
	MsMg==
X-Received: by 10.52.18.171 with SMTP id x11mr6464312vdd.92.1371896591111;
	Sat, 22 Jun 2013 03:23:11 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.195.201 with HTTP; Sat, 22 Jun 2013 03:22:31 -0700 (PDT)
In-Reply-To: <51C30F28.2090607@balister.org>
References: <1371564585-12373-1-git-send-email-philip@balister.org>
	<CANyK_8cBxFzaRDi16ZZHiUsLERzoSUj_WfzQSVNQhH1h27iLLg@mail.gmail.com>
	<51C30F28.2090607@balister.org>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Sat, 22 Jun 2013 11:22:31 +0100
X-Google-Sender-Auth: n0XCtxHC08ikoGv6hTd5tYkABSk
Message-ID: <CANyK_8fHp0oWHz4R2PgzZH+dn90x1j0pLS3F8n4UAB=4rQxAvw@mail.gmail.com>
To: Philip Balister <philip@balister.org>
Cc: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] gnuradio : Update to 3.6.5. Also fix for docs, packaging, and grc RDEPENDS.
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
X-List-Received-Date: Sat, 22 Jun 2013 10:23:10 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 20 June 2013 15:18, Philip Balister <philip@balister.org> wrote:
> On 06/20/2013 08:29 AM, Paul Barker wrote:
>>
>> Just tried building gnuradio with this patch applied. The system
>> topped out at 5GB RAM and 4GB swap used (everything on the system)
>> then:
>
> Compiling the c++ output of swig is known to consume loads of ram.
>

I tried this again with PARALLEL_MAKE = "" rather than "-j 4" and it
worked fine. Before this gnuradio do_compile failed pretty early when
trying to build documentation so this patch does fix that build error.

--
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

