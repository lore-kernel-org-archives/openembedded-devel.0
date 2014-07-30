Return-Path: <ticotimo@gmail.com>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 9138D70612
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jul 2014 13:15:51 +0000 (UTC)
Received: by mail-pd0-f180.google.com with SMTP id y13so1434242pdi.25
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jul 2014 06:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:references:mime-version:in-reply-to:content-type
	:content-transfer-encoding:message-id:cc:subject:date:to;
	bh=p8zvobaK/8P1P25Rp5AQfcGYVzpK4W8tPENyjlupT7g=;
	b=KgXg48UUi3ZE81ax1cp9Ug5M8vX1jVZbB59LbS5XnYImvSC14e9BPPZN8HEzQpfHCu
	Vqxz4wOX0M3cOOfS0eV+NpenZzhxQpgF2bc8Z7+uSTMEZH/PmogXGtSdMFnl+2RnS6xq
	P15OkTRsa0C0IhxrL0u3VB4BRs+CCqfUmvz6mWWSKU7GL5AxPs0oqFxjeLnwGeM56cFB
	2VdqpLyEzzNnhEefH1OMlVU6Qgo04C7B9WIKLcHj61qL3LhzIM5+vpTYYMLvUNVjvbX5
	1ksgMSfNoth6/GEZrOon93VwY0PnW6SZSiyUA4qQBL8eNsWHlL15z53WvqSfabSe828H
	c42w==
X-Received: by 10.70.138.102 with SMTP id qp6mr4574818pdb.132.1406726153242;
	Wed, 30 Jul 2014 06:15:53 -0700 (PDT)
Received: from [192.168.1.133] (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150])
	by mx.google.com with ESMTPSA id e14sm3461094pdm.86.2014.07.30.06.15.51
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 30 Jul 2014 06:15:51 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <TicoTimo@gmail.com>
References: <1406053708-24207-1-git-send-email-TicoTimo@gmail.com>
	<CANx9H-AuCdp4dnFKmA7Ygq0J=2nNR_E2c-LN-1_1OaZF2LLSPg@mail.gmail.com>
	<20140730081205.GI16445@jama>
	<3193777.KGUVVojpmr@peggleto-mobl5.ger.corp.intel.com>
Mime-Version: 1.0 (1.0)
In-Reply-To: <3193777.KGUVVojpmr@peggleto-mobl5.ger.corp.intel.com>
Message-Id: <BBCC2527-4E83-4BA8-A9E4-FFD2B884B1E4@gmail.com>
X-Mailer: iPad Mail (11D257)
Date: Wed, 30 Jul 2014 06:15:51 -0700
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH] meta-python: fix conf/layer.conf, follow typical structure
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
X-List-Received-Date: Wed, 30 Jul 2014 13:15:54 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Jul 30, 2014, at 3:30 AM, Paul Eggleton <paul.eggleton@linux.intel.com>=
 wrote:
>=20
>> On Wednesday 30 July 2014 10:12:05 Martin Jansa wrote:
>>> On Sat, Jul 26, 2014 at 10:34:35AM -0700, Tim Orling wrote:
>>> Ping.
>>> I haven't seen any comment on this patch at all.
>>=20
>> I don't have strong opinion on this, but I don't like much the structure
>> with 1 recipe per directory, so I prefer single python directory with
>> all python modules together.
>>=20
That is why I originally had meta-python/recipes-python/*.bb, to keep them a=
ll together...but we seem to always use one more sub-directory (e.g., meta-*=
/recipes-*/python/*.bb). I guess it's the extra subdir that bugs me, but tha=
t's just a minor annoyance. Having them all in one directory is ultimately p=
referred over one recipe per directory ;)

>> Also using the original structure from meta-oe has the advantage that
>> additional layers which were using include or require of some file from
>> python directory don't need any adaptation after meta-python was
>> separated (I've noticed it in one of our layers and that's why I've
>> submitted recipes-python -> recipes-devtools change).
>=20
> Good point - I hadn't thought of this. FWIW I'm happy to have the meta-oe=20=

> directory structure retained in meta-python if it makes this easier.
>=20
I had no idea that such collateral damage might occur. Now it makes sense wh=
y you reverted the structure.

Drop this patch in the dust bin.

--Tim=

