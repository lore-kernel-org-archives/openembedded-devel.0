Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id B7F5F72491
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Jun 2015 09:48:12 +0000 (UTC)
Received: by qkx62 with SMTP id 62so37694978qkx.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Jun 2015 02:48:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=uqSUBOFJTXVNR8qPL4nVoKIWkH6jAEMtMo8/wP2wu1E=;
	b=ewJm4cQCc3EReNUToFYNeUSozMNnEAicc9wjZPbELLgQxAZ1lGNdydLtvE/NRVGdIw
	wA0uiLjv1G/LBmfMvJXcs5QErID2yb+MjPRRTdJGW4sGQS7spuh1X0lGKlis0efdmque
	Rzwf+LRuGDlnM4C7RI8a4oBEitUc6VnUqXep4FTGqmB/MYCGgTnko58D84lSWNWT/1Qx
	09R7YLXpfsvLVdlCLoMKKjpkrg8p35JJK8eAd83PgTDp83kRQj+SariCu4Du28TGbOCE
	3V7KJZBKnrzkCA9yj2KA+DKgTCoaO4MW4i4o9irwhXo661rL+IWcXxyPkUG7SCJ54DDX
	koGg==
X-Gm-Message-State: ALoCoQmGd0ZSW9swJ33vq8cpuQKZ0UpmRM9oKzuin+M+q2yzoaHoDDChuvVr10RjESXdnuZ0uBtC
X-Received: by 10.140.133.199 with SMTP id 190mr3092153qhf.17.1433497693428;
	Fri, 05 Jun 2015 02:48:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Fri, 5 Jun 2015 02:47:53 -0700 (PDT)
In-Reply-To: <1433496408-24477-1-git-send-email-jackie.huang@windriver.com>
References: <1433496408-24477-1-git-send-email-jackie.huang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 5 Jun 2015 10:47:53 +0100
Message-ID: <CAJTo0LZLPgpeY+SfvUDAqc4efsRW3L8TS-vROj0FKqWKAz5C=w@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] libcanberra: upgrade and add packageconfig for gstreamer and gtk
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
X-List-Received-Date: Fri, 05 Jun 2015 09:48:13 -0000
Content-Type: text/plain; charset=UTF-8

On 5 June 2015 at 10:26, <jackie.huang@windriver.com> wrote:

> +
>  ${@base_contains('DISTRO_FEATURES','gstreamer','gstreamer','',d)} \
>

Lets not invent distro features for no reason.

Ross

