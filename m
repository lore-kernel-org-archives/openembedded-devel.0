Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by mail.openembedded.org (Postfix) with ESMTP id 040CF7FD72
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 26 Jan 2020 20:03:47 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id 203so4751717lfa.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 26 Jan 2020 12:03:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:from:to:cc:references:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=35xupZ2VBB5FbKKwQITP4IfTn8mOdVXZeBlsV7WCmFE=;
	b=XisQi4xo2sMaRgcyLvYPaoj5tedjl9CYpgXVyovT76XMRPvgRZTqMptyWIaLn0D+2p
	uq6/aCM6l9B7wbNJVCURyjr8uhrMZbB/SHJN5+LuzCrDqZjpKQqclkIUdjM34XlLsMTZ
	ijMdxbYlFgCjZeiJ8ZLjO4zIojaGNilkh5e9V6HoC7V/3hRQf+vdlmhl+6b3k9g44rqG
	uIW03TTVVUU22iWYTlNWuNFdcRRJetgZe15e7CVwjSUHcgOIi1ZTQinJ/Ldq9JDAjFZ5
	nprwjE/Q2MZPtKZIsWOBDC5pKyZnA/y0k4w8W8LdL7GQFCiMB9B/HDygdQwBKGcbgQHs
	Ia7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:from:to:cc:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=35xupZ2VBB5FbKKwQITP4IfTn8mOdVXZeBlsV7WCmFE=;
	b=gKkRnAa3UudeOfb4OeL0ovo594ekp3IgmPIdO2wgWsrs7jx7CyzAJkeB0XViyhaJxa
	WjYQVfZzz5+pc8qufat7V8KSNfuwYJqtNs3XQXi5aellCSxlScRXMFPrdewewHEshGK4
	KD9KoIOBJIaVSJxI/mlGE6qajmpTywkUW51AIkAaGIo8Gfi4D553KpWzhUWVwAHgxFkO
	GKvnqgjHbFkmmsqBLspPu3fBdfgJ+F/X7hyBQpj9H5WisrVI1CEWCt0GdIJLMfPVVC3P
	xjE8KKO4BPReycDt2HdIKYcqU/1x0+GNaRQ+GGnAYHG+nq37cLoZDS+n0HS8S52xqwMf
	y5KQ==
X-Gm-Message-State: APjAAAVwWrRnvF9bnl15Eof/tOrPrIATR5qDZ3qWkaHAutOmAUjGTCRL
	K/c9c/Dm11n9BRUma5Rhot7pVR7z
X-Google-Smtp-Source: APXvYqyn9b1QMt4EltlvktAXswQCtazzArvloumaTb3hNZuILW/mGhARZeqj+74mfWCkP9m3Y0Srqg==
X-Received: by 2002:ac2:4945:: with SMTP id o5mr6190687lfi.93.1580069027385;
	Sun, 26 Jan 2020 12:03:47 -0800 (PST)
Received: from localhost.localdomain (37-247-29-68.customers.ownit.se.
	[37.247.29.68])
	by smtp.gmail.com with ESMTPSA id y7sm31440ljy.92.2020.01.26.12.03.45
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Sun, 26 Jan 2020 12:03:46 -0800 (PST)
From: Jacob Kroon <jacob.kroon@gmail.com>
To: Richard Leitner <richard.leitner@skidata.com>
References: <20200126111035.273501-1-jacob.kroon@gmail.com>
	<20200126112146.GB2043417@pcleri>
	<80d30f83-b342-cfb7-9114-86ee61198fd7@gmail.com>
Message-ID: <424d1981-b4f0-de86-f18b-8a216339d3ea@gmail.com>
Date: Sun, 26 Jan 2020 21:03:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <80d30f83-b342-cfb7-9114-86ee61198fd7@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-java][g0hl1n/wip-jdk8u242ga][PATCH] Fix building openjre-8 242
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
X-List-Received-Date: Sun, 26 Jan 2020 20:03:48 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 1/26/20 12:26 PM, Jacob Kroon wrote:
> On 1/26/20 12:21 PM, Richard Leitner wrote:
>> On Sun, Jan 26, 2020 at 12:10:35PM +0100, Jacob Kroon wrote:
>>> Hi Richard,
>>>
>>> I need something like this in order to build on my Fedora 31 host.
>>> I'm using master branches of bitbake, oe-core, meta-openembedded.
>>
>> Ok, then please just ignore the mail I sent some minutes ago ;-)
>>
>>>
>>> Good thing is the crash I reported earlier seems to be fixed.
>>
>> Great!
>>
>> I'll do some tests on my side and give you feedback afterwards.
>>
>> Is it OK for you if i rename the "fix-build.patch" to something more
>> meaningful?
>>
> 
> Yes, feel free to rename/rework anything here to your liking; this was 
> just hacked together to get the build going.
> 
> Cheers,
> Jacob

Btw, as I mentioned my build host is an up2date Fedora 31, x86-64. Any 
idea why these errors aren't showing up on your test builds ?

Cheers,
Jacob

