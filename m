Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f181.google.com (mail-pf0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 94E3671AC2
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Dec 2016 03:42:19 +0000 (UTC)
Received: by mail-pf0-f181.google.com with SMTP id c4so43179775pfb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2016 19:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-transfer-encoding:mime-version:subject:date:references
	:to:in-reply-to:message-id;
	bh=7R3hekcPec54C26Jk7CLN4xYcsSJ8ft3e6MgNOpeA2Y=;
	b=OdxIPPOjg6tmyDlv1YuxpK9I+fM8Z/ihniJt2QLd7eGY+QroLNvUV7x13zpOyGNdTb
	eTITgYsQnaPICER/eXsUz/L5tU5NAZZeLbCvw8cM6xDaTH195sf68JC7JciTu//GKDie
	+QzQBz+9O63MTtw4ZPTWwcvYZQLv/NflSKg/0B87d9rKuiKHuEEzep32PTfJuDzLUjlg
	xySSJR/SZBY1NSYe6OIwZH3MO0Y4F6DVtweI8axijIcEG4kxLqFeMxavFLIhBakj0tUM
	c8YLCz86kOmbVjHc42g0OqVS8cxsKDn6tk72gEO9zBVml/DKPrjfwgZJDrJ0/rCIsdYa
	0Y0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:content-transfer-encoding:mime-version
	:subject:date:references:to:in-reply-to:message-id;
	bh=7R3hekcPec54C26Jk7CLN4xYcsSJ8ft3e6MgNOpeA2Y=;
	b=AtMnADpjHQ16hvJdFPD19WEqxwRN09BMdPAkGQszb1w+E37asSpW8LFqoyUWVuwugi
	br+nJlXczJmtKUdM3OZP5fmyGoOCfpkweWz9+d/ZVcc+GlA6MZFx+CM1BT3O16ERNKGT
	dpRVMuMSvw0/VM7WpwQE1YmI7eT9jhMLmrbKib8ZRZ1GBnJXrVi4piVclN4DZRZWutdu
	RPRZUq88s36EeaUY3wFq3HRcZCxh9xK/1y0DKeqMuT8wxBV5kBdXfsV+ikxkrIVU7tAt
	SJiWAIwM/ywuKcfxsCiZeFmfoNxuPBdlylhEed0FAdteZH3HuUmTLlAZJqcWwA0FXd0I
	rNug==
X-Gm-Message-State: AKaTC00LuEQmOU7PxigK3MPknZBR0uIldru9mNm2bk0i875V+Fs8GNN/AfWio0DyR9rmPQ==
X-Received: by 10.84.134.3 with SMTP id 3mr79107144plg.90.1480563740695;
	Wed, 30 Nov 2016 19:42:20 -0800 (PST)
Received: from [192.168.0.130] (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	c2sm106000070pfl.66.2016.11.30.19.42.19
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Nov 2016 19:42:20 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 10.1 \(3251\))
Date: Wed, 30 Nov 2016 19:42:18 -0800
References: <20161128225759.9756-1-raj.khem@gmail.com>
	<CAJTo0LZ+2+MhZ4TepH1dDzC3LyG7gz70TNEzoDjXgaBTjvHOsg@mail.gmail.com>
	<o1jct4$pvp$1@blaine.gmane.org>
	<CAJTo0LYLgFFR+6d3SDkso6X28N00tVAnUGuJg4sPG-msMKWU6A@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <CAJTo0LYLgFFR+6d3SDkso6X28N00tVAnUGuJg4sPG-msMKWU6A@mail.gmail.com>
Message-Id: <8632C69E-1C6B-482D-AF15-965F55F0AF88@gmail.com>
X-Mailer: Apple Mail (2.3251)
Subject: Re: [meta-oe][PATCH] libva: Import from meta-intel and update to 1.7.3
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
X-List-Received-Date: Thu, 01 Dec 2016 03:42:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


> On Nov 29, 2016, at 9:14 AM, Burton, Ross <ross.burton@intel.com> wrote:
> 
> On 29 November 2016 at 08:06, Koen Kooi <koen@dominion.thruhere.net> wrote:
> 
>> If libva goes in, can we get libva-intel-driver in as well? Those go
>> hand-in-glove currently.
>> 
> 
> Khem, does the AMD BSP use that?  I'd have thought that bit was actually
> meta-intel specific.

its intel BSPs specific

> 
> Ross
> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


