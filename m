Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
 by mx.groups.io with SMTP id smtpd.web09.666.1616452291400267100
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Mar 2021 15:31:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aj.id.au header.s=fm2 header.b=vmUOBO9J;
 spf=pass (domain: aj.id.au, ip: 64.147.123.21, mailfrom: andrew@aj.id.au)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 090C38E1;
	Mon, 22 Mar 2021 18:31:27 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
  by compute3.internal (MEProxy); Mon, 22 Mar 2021 18:31:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
	mime-version:message-id:in-reply-to:references:date:from:to
	:subject:content-type; s=fm2; bh=6qJmfmDR6hvbWW4+YOoXVW+jYOkZTwM
	kgZHYjmXCye4=; b=vmUOBO9J8qzFt6+1kTU1zHkP2+YCBYZc3fSw+F/MzMkXfPt
	nDknsGWEoTcIGds+4i+QjuO40CAPGHfAPeNGhvjmvKhALv0uvv33x4z+elJNPL5n
	eqEzVwmK3cJ46jumksO2C4akYF8D0LXsG+Tct5WASeSRNiCr/WcUUFPBbYZJfI0J
	hJMisoPftlZAWpn1qSXloKi6d7fBGV0yUIZb8Mb+cTy8BhTMRcBWJHC0IUOwDuH+
	KvN6QgnKXFg6pwQmDC1gOEyl3tMQrqvQpyRRqQnflj9AIdHkvM1v6vQfQwcUimeo
	FMmz2sTDYeWdz5mC5yyAosZt8jmOV680GMMpaPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=6qJmfm
	DR6hvbWW4+YOoXVW+jYOkZTwMkgZHYjmXCye4=; b=DuY37ORsJvZYOsF4aqaO4N
	Dphe5DtViTs8SuzuAhUOK773w8FfNMc+KDr0/fV66RGkR7WaM18GoAGyYzNT0Xsa
	RJUhXn0uDoHVjW/Lud0lHy8gFMqAMzFeV13VpNx5NcBjl3VYCWujm6kD0d0EsWRK
	5zR6KCBICSeAykYZcHHVGMjKGlpdDdzk95xtGXqPHTHErpdQhS7xblJrfayP8DJy
	/DI/RYubJbc3IYkkPjzj22mrXZGYbiCrwMBXQ6BGAeY/YAgo1lhgEhhKIIEjFp4Z
	9Vv8lGT+GcyjRoaNiUOXdGMZMpAvTCinQKhjB+8qk6DBhtEIRvXbWlzQ71MxRDvQ
	==
X-ME-Sender: <xms:vhpZYHsH6C5zImpvOEZ3lDCLxCyZ5hE2gRe22qPulIBxeireTPtQIA>
    <xme:vhpZYIfN3UbsaEtO1t1Uby_SKjpPbf9_paLwj-sIzBnwIXGubHeJJkUU32szMb6e5
    4UqXwaZLX1Xsq7T6Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudeggedgudeivdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehn
    ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
    frrghtthgvrhhnpedutddtkeeugeegvddttdeukeeiuddtgfeuuddtfeeiueetfeeileet
    tedvtdfhieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:vhpZYKwk7PSVbVs_UEnIZnC0eJ_MpeM8WD9XhAm7pWU_11TqYPR9HQ>
    <xmx:vhpZYGOR8azV3WaCCzasZoqf99JNz0zI7IaXiHt7FE20SojCikzM2A>
    <xmx:vhpZYH-dAclVca8imfrvpF580HyuPd23oaGIUaXeEsSaKSLCcGWbDA>
    <xmx:vxpZYEKKheL_cC1iO8MqWk8pn7ibGCm9ad24sSNzJET2O_m9s-KLhw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id D553CA00073; Mon, 22 Mar 2021 18:31:26 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-271-g88286cf463-fm-20210318.001-g88286cf4
Mime-Version: 1.0
Message-Id: <63d1bd63-9190-44fe-9348-d8e66d928eab@www.fastmail.com>
In-Reply-To: <20210322222209.3952420-1-raj.khem@gmail.com>
References: <20210322222209.3952420-1-raj.khem@gmail.com>
Date: Tue, 23 Mar 2021 09:01:06 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Khem Raj" <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
Subject: Re: [meta-python][PATCH] python3-hexdump: Move cleanup_hexfile into install_append
Content-Type: text/plain



On Tue, 23 Mar 2021, at 08:52, Khem Raj wrote:
> This fixes error seen during staging phase
> run.sysroot_stage_all.902827: line 182: cd: 
> TOPDIR/build/tmpfs/work/core2-32-yoe-linux-musl/python3-hexdump/3.3-r0/image/usr/share: No such file or directory
> 
> this happens because D is being altered outside pseudo's context, and
> alterning D is done after do_install ends so its likely going to race as
> well with subsequent functions and change pseudo context too
> 
> Fixes occasionally seen build failures on autobuilders
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Andrew Jeffery <andrew@aj.id.au>

Ah, interesting.

Thanks Khem.

Acked-by: Andrew Jeffery <andrew@aj.id.au>
