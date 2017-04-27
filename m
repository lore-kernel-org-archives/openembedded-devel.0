Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 350C9773C0
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 27 Apr 2017 13:06:11 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id r16so22104540ioi.2
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 27 Apr 2017 06:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=8KIYmbY1ZFVNNXr1aP8Q69fwb8UjPqHVquw26mhciHk=;
	b=c/iOoUJMBQ1nGKdtpiMyL8VOwxKFH/inVlyttMJaUk3QyB2SxZKgDMf3R2i6qkOyER
	je4aL85ZZfZfTrIJpRLWuAIXmW1mUIhgaaNxYOcs7rIsO/3PAykkU7oeeaRBC3rqkMHp
	ku8IuD8POmNBmb5dU5fmauBGJuPtuaLQWFbr2S5+zV4/M06o3FJ3+oDBpP2dFhZW+Gw9
	dU4IzUHyxth/eZv5Gx+vWqQxR2L02rGurO23kWsZbKuEmdyv7/bAgsW5MCldEbLf51ji
	bTEwC+G+zGwpAszO5j4Yh2Bhmu1Pif6HGi4TduhEzrrA75Ig53SFwW6eWwkLtFIvNvkb
	MGAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=8KIYmbY1ZFVNNXr1aP8Q69fwb8UjPqHVquw26mhciHk=;
	b=CxOwKu7DnHXLqBvfXJqBDElRz0tpEG6cbHG4PgKNmpYMP2/9XESBNBzhIvndB6mPr/
	zX7c01VhKaFlnG7b3BcDP23fqV1mB2UPGN34/zpPsw5r/9tJpe8/iH7p8UbaRhv9BoZJ
	6E+w7Z84PpvButXhp5jwb/u9RSDIXdSi4X/Hr1wl7DOaRPx/YRWbR5ZEn70BaAZfnbD3
	FVj9wY7YLGkmCWnbD7Uwv1URvgod3VJg9tX9cQ1Nd1BKAbdeyQrBZ/8LJnAGG/0Dpsap
	acyongCSrb0ocowxq1Inqr18aSTG+RNxSMChw9vgefxS/6xIntZSn0gTqOKCavt81/En
	Oktw==
X-Gm-Message-State: AN3rC/7xDuyixI9buaHQgcgypJCU34Ir23PDS/h8RykApi+kn5L2sB8E
	6VnMv2qhQDtrIj9yCdg=
X-Received: by 10.107.159.74 with SMTP id i71mr4513844ioe.143.1493298372983;
	Thu, 27 Apr 2017 06:06:12 -0700 (PDT)
Received: from linux-uys3 ([206.248.190.95]) by smtp.gmail.com with ESMTPSA id
	v23sm1009542ioi.61.2017.04.27.06.06.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Apr 2017 06:06:12 -0700 (PDT)
Date: Thu, 27 Apr 2017 09:06:09 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: cshored@cshore.thecshore.com
Message-ID: <20170427130608.GA15538@linux-uys3>
References: <093b01d2bf21$fdcb22a0$f96167e0$@cshore.thecshore.com>
MIME-Version: 1.0
In-Reply-To: <093b01d2bf21$fdcb22a0$f96167e0$@cshore.thecshore.com>
User-Agent: Mutt/1.6.0 (2016-04-01)
Cc: Openembedded-devel@lists.openembedded.org
Subject: Re: Some experimental layers and conclusions
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
X-List-Received-Date: Thu, 27 Apr 2017 13:06:12 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Daniel,

Very interesting report, thanks for the info!

On Thu 2017-04-27 @ 02:46:24 AM, cshored@cshore.thecshore.com wrote:
> * OE doesn't have good *router* networking support (i.e. nothing like
> OpenWrt/LEDE's netifd and friends for a headless system, that one can
> configure by editing a text file, or by using a WebUI for handling multiple
> interfaces and VLANs and bridged (or not) wireless and wired networks, with
> easy firewall configuration).

I wonder Khem's if meta-openwrt could have helped here? It looks like it has a
recipe for netifd and friends:

	https://layers.openembedded.org/layerindex/branch/master/layer/meta-openwrt/

Out of curiosity, did you try using musl? You don't mention which C library
you're using. I'd be curious to know if musl can help with size reduction.

Is toybox mature enough to be used in these situations?

	http://layers.openembedded.org/layerindex/recipe/28902/

Best regards,
	Trevor

