Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id EF022608CD
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jun 2013 16:42:00 +0000 (UTC)
Received: by mail-pa0-f42.google.com with SMTP id rl6so5356339pac.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jun 2013 09:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=rV9EA58l/MbKHtAGB1VXOAm/I8Ur//NjHhy7FL//kOw=;
	b=dhfBvxOvt7Tv/mAVWS7BEKn0/Y5HwcIlie5CP5dt1W0hnVGntNKNDn4dsfcP+gCUWA
	eUHpfC5bZlJbeBo3UJkdwYVThGr4m4eEdeasa8lYIBX1c1Au4CymcJcsomV4tduOYJw8
	dXyIF7S3aAPrpYzKmgtHoe+QAjwNQFM5x70Wrv/AWMecz1UtwlgxTXo3/YYbR1X8Rj7L
	hVzcJjzw+yUA/smkyjvcD9D7gGs2dPaAcAG/iuTe1qC699qrCzULH9t/qrMf8Y1yLGJQ
	QEeAw7EBE0xyIxslfRd2yr75tfYWnb0CnK6KHaq5GOQnmWskf5EvqesEsndfw3THcY0o
	qmKw==
X-Received: by 10.66.245.110 with SMTP id xn14mr7503715pac.130.1371660122020; 
	Wed, 19 Jun 2013 09:42:02 -0700 (PDT)
Received: from bjupudi-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36]) by mx.google.com with ESMTPSA id
	ig4sm23795214pbc.18.2013.06.19.09.42.00 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 19 Jun 2013 09:42:00 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJTo0LY4nFf_K6BSwp4acRQYubKgPUGHCQN5am=CeZ1YLHVMTw@mail.gmail.com>
Date: Wed, 19 Jun 2013 09:42:01 -0700
Message-Id: <D76D4BAB-5FE3-4E5E-9417-AFA7E4986724@gmail.com>
References: <1721274.vjFAy2UInG@helios>
	<CAJTo0LY4nFf_K6BSwp4acRQYubKgPUGHCQN5am=CeZ1YLHVMTw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1508)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Patchwork access
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
X-List-Received-Date: Wed, 19 Jun 2013 16:42:01 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Jun 19, 2013, at 4:40 AM, "Burton, Ross" <ross.burton@intel.com> =
wrote:

> On 19 June 2013 10:09, Paul Eggleton <paul.eggleton@linux.intel.com> =
wrote:
>> A few people have been asking for access to patchwork recently, and =
it seems
>> like it isn't possible to create an account at the moment. Can we =
come up with
>> a plan to solve this?

The patchwork has same issue as wiki w.r.t to spam and phony account =
creations,
disabling the register page from active links reduces it tremendously. I =
will put interactions
on wiki on how to still use it after register link is not shown. The =
functionality is still there
but it can be seen on website.

>=20
> It's also sad that the oe-core patchwork isn't really usable as it's
> not detecting patches that have been merged.  Who's the right person
> to investigate this?

its a heuristic and best effort approach its not totally automatic. e.g. =
if V2 of a patch is send
and V1 is still there then it might close V1 if hashes are same. OE-Core =
patchwork is mainly
for reference as it was decided for cherry picking patches etc. for =
local use its not the patch
management solution for OE-Core as much as it is for other layers in =
there.

>=20
> Ross


