Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id 989987615E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jul 2015 20:00:18 +0000 (UTC)
Received: by qkfc129 with SMTP id c129so10252994qkf.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jul 2015 13:00:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=yXxvpO19I6mleJqHTTsbDGt1lPVtN9PsXC5Qql0dJ7M=;
	b=BuRcxofyFHaGN7RvS7BvUuI6+/S3ZkWeCjZdzErBUn8ArxDNKbfDCO8AnehEKFUhPH
	Hrkp4B0dWyKTj30hoFoikG8xHQHYDq/7jARVhRCphC2GXDkmwhoEFPVXeGmCcGA8PTxO
	XG37zt36Enp06T+Ge321dMJeUbkP5xHk9vfodk9YGhNGsIvGiXEsLouWZFgdLtyNQ0oF
	61+pb3rVWrEqRQw8AWuhXnMxqZI+5ndtzZQdUeaaeU5qVEPwelKAze18Nu8IE63FUY55
	FadXtTfevDxe35uXv7DcK19bxXqqzJ6zYs0/SSRd0X2e7FQOb5Pun6+eMhz8Y2dR04Vd
	CMjA==
X-Gm-Message-State: ALoCoQlHy56/Rf4vADUuGfgv+R8L9bVTKw11nxO/XutDoHSyUs/JpQ0d3KBjEtp17H/ZXHFXkRwX
X-Received: by 10.55.22.169 with SMTP id 41mr65391946qkw.13.1438200018327;
	Wed, 29 Jul 2015 13:00:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.195 with HTTP; Wed, 29 Jul 2015 12:59:58 -0700 (PDT)
In-Reply-To: <20150729150150.GD12478@jama>
References: <20150720094146.26948504C1@opal.openembedded.org>
	<20150729150150.GD12478@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 29 Jul 2015 20:59:58 +0100
Message-ID: <CAJTo0Lb9JVR=WDFCV+hW0f4ma6FQQk2yod48_sDCEDaag47FCw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [oe-commits] Ross Burton : gamin: remove
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
X-List-Received-Date: Wed, 29 Jul 2015 20:00:26 -0000
Content-Type: text/plain; charset=UTF-8

On 29 July 2015 at 16:01, Martin Jansa <martin.jansa@gmail.com> wrote:

> Someone interested in fixing tracer recipe?
>
> NOTE: Resolving any missing task queue dependencies
> ERROR: Nothing PROVIDES 'gamin' (but
> /home/jenkins/oe/world/shr-core/meta-openembedded/meta-gnome/recipes-support/tracker/
> tracker_0.14.2.bb DEPENDS on or otherwise requires it)
>

That build dependency disappeared in 2008, so you can safely delete it.

Ross

