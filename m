Return-Path: <twoerner@gmail.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id 2A80373F84
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 May 2015 00:41:09 +0000 (UTC)
Received: by igbpi8 with SMTP id pi8so21510656igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 May 2015 17:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=jM848z7JnWvB3A170d+iIaM2PZhYjM/S3rFNBBx04ag=;
	b=tXg1coYM1g5KsYoJs9NwCOhggkQfUf3lkNydOYOgacBNazx9aC3+PuhNUUNpA9c/sc
	vY2DiX5fol0/ir7Qj4MpjmOFB3u24zLtGABOM2XV7tzqdrfM1UXvwB+v6hy3qEFQm4ZQ
	474qeJZMPN2VwClZrzgBk8hOf582Ch7f9fYUQ/WZqMstkqJxqlrU1/iMRJAkWpI9YcvP
	JewpI25CSTesz8SoKiecvGo5A06gYqjJOk7f9SnHQ8+g6GW3BNRmmmoMp+accJbaOMVE
	pU892C0JNiXtjYrNAsPdWLDAFYwwUDBkleDlfz08+MiIHR6nbnygd/FhyZlqC+n59oMO
	id0Q==
X-Received: by 10.43.96.10 with SMTP id ce10mr1328650icc.59.1431045670421;
	Thu, 07 May 2015 17:41:10 -0700 (PDT)
Received: from [192.168.141.83] (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by mx.google.com with ESMTPSA id
	69sm2422579ioz.10.2015.05.07.17.41.09
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 May 2015 17:41:10 -0700 (PDT)
Message-ID: <554C0625.9000304@gmail.com>
Date: Thu, 07 May 2015 20:41:09 -0400
From: Trevor Woerner <twoerner@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org, 
	"yocto@yoctoproject.org" <yocto@yoctoproject.org>
References: <55483F50.5020803@gmail.com>
	<554A76F1.8050407@gmail.com>	<554A7893.3060701@gmail.com>
	<554A8A7A.6030404@gmail.com>
	<CAALGJZaMCx0-daBCjkP_NrmnheTJQYLW2hU2bSpTW1ij0pMb8w@mail.gmail.com>
In-Reply-To: <CAALGJZaMCx0-daBCjkP_NrmnheTJQYLW2hU2bSpTW1ij0pMb8w@mail.gmail.com>
Subject: Re: Odroid-xu3 support
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
X-List-Received-Date: Fri, 08 May 2015 00:41:10 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 15-05-07 02:56 AM, Christian Ege wrote:
>  From the ODROID family I do only own a ODROID-C1. If there will be a
> combined Layer for all odroid devices I will  port my recipes to this
> and can help on supporting it.
> I am mostly interested in Multimedia stuff and I do plan to setup a
> separate layer for Kodi/XBMC on amlogic based devices.
>
> So how should we proceed with the layer jungle?

Ideally meta-amlogic provides things specific to the chip itself (vendor 
kernel? vendor u-boot?) and meta-odroid contains things related to the 
various boards themselves (tweaks specific to each board).

Maybe the beaglebone provides a good example to follow? (meta-ti, 
meta-beagleboard) Although I'm not sure how clean the separation is in 
those layers.

