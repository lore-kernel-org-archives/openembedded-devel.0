Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id BD0D265D53
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Aug 2014 05:08:43 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id lf10so11240185pab.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Aug 2014 22:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=nl5X/IJtc3JFrM3EGXtstqtsXU6vmmgl2Rur+nWqbBY=;
	b=kM46KSSlhgvppwdPuZEk9wFtDsxy20xeDsVNnL386cX4fpCNFl0fwtKzjnS6vGnnUn
	LxP71+xLpO5nmeNk9Cz/fUiQfnirXYMNsJ3oOL0PfrgcZo5KiAp5RSxrq/w+jvsy3pzm
	Ut3aPbvNynkNPm5tWCnJ5iqozQIiyID+2ZfXHREP2Tl3BCcaOGLV5VVnjBF83QzaP/cJ
	8ncoHXuWJQcIx39aVmOGMVyDHwdRnVxvD8jgn5Be+HPUHt3XIFyCVa5JKU5c+I8FjZOZ
	P8abXpNeD4qQAgn1MKJE7p6EwDw478HAbkF8RrehrsppX6rJzb0URdiBdFeFQB9oqI9X
	AO+A==
X-Received: by 10.70.45.97 with SMTP id l1mr26209968pdm.148.1408511316588;
	Tue, 19 Aug 2014 22:08:36 -0700 (PDT)
Received: from ?IPv6:2601:c:9380:601:c0b3:8589:acf2:da15?
	([2601:c:9380:601:c0b3:8589:acf2:da15])
	by mx.google.com with ESMTPSA id
	fu13sm32192337pdb.81.2014.08.19.22.08.33 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Aug 2014 22:08:35 -0700 (PDT)
Message-ID: <53F42D4E.3090106@gmail.com>
Date: Tue, 19 Aug 2014 22:08:30 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>, 
	openembedded-devel@lists.openembedded.org
References: <cover.1407846175.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1407846175.git.Martin.Jansa@gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [daisy][PATCH 0/5] small build fixes for daisy
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
X-List-Received-Date: Wed, 20 Aug 2014 05:08:47 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 08/12/2014 05:25 AM, Martin Jansa wrote:
> The following changes since commit 9ee63edfd9c6e5c22ce707770955a5796cde2cfc:
>
>    ltrace: add PV and PACKAGECONFIG for libunwind (2014-08-12 14:15:26 +0200)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/meta-openembedded-contrib b90153d5981990ea9910c417a868fb26e7e264a4
>    http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/daisy-backports
>
> Martin Jansa (5):
>    sethdlc: Set MACHINE_ARCH, because of virtual/kernel dependency
>    ktap: Set MACHINE_ARCH because of ktap-module runtime dependency
>    glmark2: Add virtual/libx11 dependency
>    irssi: add --with-ncurses option
>    libgc: add PACKAGECONFIG for libatomic-ops
>
>   meta-networking/recipes-connectivity/sethdlc/sethdlc.bb | 3 ++-
>   meta-oe/recipes-benchmark/glmark2/glmark2_2012.12.bb    | 7 +++++--
>   meta-oe/recipes-connectivity/irssi/irssi_0.8.16-rc1.bb  | 5 +++--
>   meta-oe/recipes-kernel/ktap/ktap_0.4.bb                 | 2 +-
>   meta-oe/recipes-support/libgc/libgc_7.2d.bb             | 4 ++++
>   5 files changed, 15 insertions(+), 6 deletions(-)
>
not sure if I acked already.


Acked-By: Armin Kuster <akuster808@gmail.com>

