Return-Path: <freesilicon@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 774D877A0C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Apr 2017 07:45:15 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id y10so2698509wmh.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Apr 2017 00:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=7Nl91RDYlpdh4VeEZmVfQPVn9JOZ2H/jWi0dL5PbZBk=;
	b=ITdYC2qxkpG/+munKholCTyzTQQTR+JDx/wbulDzINKr/RRtGW//vvdxTkv/zvP25j
	ZafndT6QxxUfMEdjKlGM7O7H2Nh53JaFGdal6MXwai6NBlUkKm8r5DQxWAyh7DtlZepF
	brNfXtW8vhQYy/LEMdaQfQYVW0YoDiFW1B2vpLofHwe7dFX2CsPrA9WRaqHfPXaxUh0a
	Xq/H8wHKFMqriJrKtdG38QDN1nZiFY+bYoK/Fxsa/AZbbZ1FHcS8UdJ0KaW1tzfS6m0u
	0comEkwDFPaZxHOqNt1b29yR6QswKEqB0EntDQ7zHqH1x2vbcZ70ObziZdXkrB87ISCg
	vlmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=7Nl91RDYlpdh4VeEZmVfQPVn9JOZ2H/jWi0dL5PbZBk=;
	b=Jpho01sRsNz6Su/3vwxZ+u8zOVYlfaFTPUCpu+LjLKLgdFRWQJs1DNfkFhUhVeDR8j
	68Qz7YAdgqIWDBBy8N7EL4KEaNbNlSditKgKuC9ssxCjlp8ZpSLE9Xpku/fJjYCvgAx7
	J0+BZbHa4fyF+aXXyQtA6SGYeDxJ6i5LCe28MLKA71kLouJhcs9uhXFN72En8fxqpsgj
	J48nWCqaGXhaDwyw2nZRIWFoi95KVRexcbakRTq7tbaAjznm9me2fXdSVLbNaY14BeYJ
	ilLKOwK+AKskjjA7Kjg0B4Chc5NOzkuuqf/tGYkdZjH7nmZ+uiZEdQShxcXqFF7yg6H6
	SkXA==
X-Gm-Message-State: AN3rC/5idXtFbvS2qxtYCeAvHU96Wcyx/o1Zq555P9orKlpfiqOrX3jc
	f8On6+qpR5laPw==
X-Received: by 10.28.142.4 with SMTP id q4mr487553wmd.112.1493279116125;
	Thu, 27 Apr 2017 00:45:16 -0700 (PDT)
Received: from crde-port-20.cahors.local ([185.47.80.46])
	by smtp.gmail.com with ESMTPSA id
	d25sm2795668wrd.54.2017.04.27.00.45.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Apr 2017 00:45:15 -0700 (PDT)
From: David Vincent <freesilicon@gmail.com>
To: Joe MacDonald <Joe_MacDonald@mentor.com>
Date: Thu, 27 Apr 2017 09:45:12 +0200
Message-ID: <2744086.6XG6jR0gtt@crde-port-20.cahors.local>
In-Reply-To: <20170426145729.GF11025@mentor.com>
References: <20170420135735.25958-1-freesilicon@gmail.com>
	<CA+chaQcHQvssOS6gjeTWfKF2o0h+6gvxxrDEEk-N2jh7AYJoCA@mail.gmail.com>
	<20170426145729.GF11025@mentor.com>
MIME-Version: 1.0
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] strongswan: Split plugins
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
X-List-Received-Date: Thu, 27 Apr 2017 07:45:15 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"

Sorry for the late reply, I've seen the patch has been merged into master-next 
but I let this thread unanswered. Here are some thoughts to explain it.

On mercredi 26 avril 2017 16:57:29 CEST Joe MacDonald wrote:
> [Re: [oe] [meta-networking][PATCH] strongswan: Split plugins] On 17.04.20 
(Thu 16:36) Martin Jansa wrote:
> > I think currently the preferred way is only one -dev/-dbg/-staticdev
> > package per recipe.
OK, I didn't know about this rule but I can send a v2 to remove the -dev/-
dbg/-staticdev split if it is preferred.
> > 
> > Why not set RDEPENDS_${PN} based on plugins packaged in first
> > do_split_packages call?
> > 
> > Just my 2c - I'm not using strongswan and Joe has last word for
> > meta-networking.
> 
> Yeah, I've been giving this some thought and I'm inclined to agree.  The
> RDEPENDS_${PN} being set with a canned list that doesn't reflect what
> was configured for the build seems non-intuitive.
The list comes from strongswan default configuration. I agree the RDEPENDS 
seems to come out of nowhere and for now it just looks like the same list as 
the result of the first do_split_packages call.

My main reasoning was to not break compatibility with existing use cases while 
still offering the possibility to refine it in the near future if some plugins 
are not required.
There is also the possibility to enable the compilation of all plugins with 
'--enable-all' and only install the default set. Therefore, it will be up to 
the user to select its own set through IMAGE_INSTALL (or like perl does)
One last possibility will be to use PACKAGECONFIGs for all plugins and build 
the RDEPENDS list automatically.
> 
> As for not breaking compatibility with the current configuration, if
> RDEPENDS_${PN} is set based on the build, won't that come essentially
> for free?
> 
> -J.
> 
Please, let me know if modifications are required.

--
David

