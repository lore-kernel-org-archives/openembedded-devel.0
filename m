Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
	[209.85.214.50])
	by mail.openembedded.org (Postfix) with ESMTP id 64D8765C8F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Feb 2017 17:28:13 +0000 (UTC)
Received: by mail-it0-f50.google.com with SMTP id c7so41013334itd.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Feb 2017 09:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=DTn0WRfUFuxobInChPgsarDbV7rUpDd8Wp8mggIR3Lk=;
	b=IeLm8JR+g5LSXy7OXa/HUplNbu4CMP+BFhx2sTHLcrzVkvJNG+mEhUpD2Aazm5oKoe
	2jhUFXVEvyBTqiJ+7rFHlJhxb0E0AbsHaI8rOZ4uKRUXfbfzwEBO6+7qMkORWmuS3CH7
	+8cu5LHbQX41JASIbFdGrssfctmPsRWOS9vSHr2ge1N6BRuhmlXMKl9j6bRYKu+czlqX
	0ow8fxdPyHBZH45BnOsEJuJKgy21Wd9vlpacayOokt5oUAau/pF0dKWA5z95Suced3Id
	CGkQo+82J6vmFHw3l6DzkNnlP4ty0Q5vZ3yYeT/MZAnW0WIXIlcnMVCn6fHhF29XxB3d
	J1XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=DTn0WRfUFuxobInChPgsarDbV7rUpDd8Wp8mggIR3Lk=;
	b=kXVbYlMSUb0dII9YroVXy+UaYYS8juayzDlokpLnBCjVtxCR1l08Pyk1xcRMfYQk9h
	YW5L7kIyxQ1q7Iz6uqd+zrs0Cb2n0ZMu5wZezU3yQien0m16RfP43tzj3eUU6Zk8kYW0
	VRBlQ7TTN2UEpPgUOMfSfkQMticzIaKtuLKD3xLQKtGgjJsNt+VFDY5ZQZ07xEoW0Wu3
	nTJHdupIYsj3IoHZkhzL4VwACrswGY4OPkYZZojFwoLk3ri0n/FOTvsrQsl52Ev1wjie
	lvyunwvHNC9vTzo3RtSTl0CTTeXkKQXdfuMum7yq6RtSEgXiXaRE47mz8x3yB4fJ5tmx
	7w+Q==
X-Gm-Message-State: AMke39nuh69ZeUwd/GI0GT3LIh3Q68gfUk/xm26VEo44lqcG2hmfDN8zWVkAfh9pHevjuNKp
X-Received: by 10.107.198.195 with SMTP id w186mr27567822iof.19.1487093293808; 
	Tue, 14 Feb 2017 09:28:13 -0800 (PST)
Received: from pohly-mobl1 (p5DE8E015.dip0.t-ipconnect.de. [93.232.224.21])
	by smtp.gmail.com with ESMTPSA id
	f188sm1550681itf.9.2017.02.14.09.28.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Feb 2017 09:28:12 -0800 (PST)
Message-ID: <1487093290.13854.355.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 14 Feb 2017 18:28:10 +0100
In-Reply-To: <1487086509.13854.347.camel@intel.com>
References: <20170210082811.GA3021@jama> <1487086509.13854.347.camel@intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: multipath-tools on arm (was: Re: [OE-core] State of bitbake world, Failed tasks 2017-02-08)
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
X-List-Received-Date: Tue, 14 Feb 2017 17:28:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

[dropping OE-core mailing list]

On Tue, 2017-02-14 at 16:35 +0100, Patrick Ohly wrote:
> On Fri, 2017-02-10 at 09:28 +0100, Martin Jansa wrote:
> >     *
> > meta-openembedded/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb:do_compile
> 
> This is http://errors.yoctoproject.org/Errors/Details/130529/ and now
> blacklisted with the comment "Fails to build with RSS
> http://errors.yoctoproject.org/Errors/Details/130529/"
> 
> However, the error isn't about RSS. It looks like an inline-assembler or
> compiler bug:
> 
> {standard input}: Assembler messages:
> {standard input}:80: Error: shifts in CMP/MOV instructions are only supported in unified syntax -- `mov r12,r12,ror#3'
> {standard input}:80: Error: shifts in CMP/MOV instructions are only supported in unified syntax -- `mov r12,r12,ror#13'
> ...
> ../Makefile.inc:66: recipe for target 'debug.o' failed
> make[1]: *** [debug.o] Error 1
> 
> Does anyone know what this could be? I'll also fire up a build in the
> meantime.

I've not been able to reproduce that error based on current Poky
(OE-Core d1109378d73, bitbake 95deecab, meta-openembedded 044e518954),
neither with DISTRO = "poky" nor without it :-/

Martin, can we try reverting this in meta-openembedded to see whether
the problem comes back?

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




