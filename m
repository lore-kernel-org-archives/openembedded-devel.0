Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f178.google.com (mail-qc0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id 0EA5265C7B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Nov 2014 11:12:51 +0000 (UTC)
Received: by mail-qc0-f178.google.com with SMTP id b13so13982574qcw.37
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Nov 2014 03:12:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=BXMoK3j/WPHZLYGlaaOitkH908xat4JSz+uuloQQNKg=;
	b=D4eKMOLJEy6gJ3tKLY8CKJsuWFcJxrQj/xPnth9hryDPqpqgKMbuRF0Plf0/s/nktP
	6ZBNXnxCSZm/s0lCEiX0QbypiuFiVnEbthPJjL3roCpZ52Fu7Bp5mp0uB0WBv419vQpz
	oHIE85HYsg2HeJDFFEvhcxaijc4ixqGPqsNJuU0ngbOCetebU/WOCu8IYAk8rXTYLRjq
	oIkHF24ioz764bwDC6pFWomVudLwIELmelmlxihk+LAxzXsHw5KPInK/zpviUtpiTvKX
	y+kxrq/WNHuGIoPGNh/P3O/Q0Oz/ndKJR72BqlR2VDdGR7VhzHnPmXGNJ9H0VSRMpFbz
	184g==
X-Gm-Message-State: ALoCoQlLE2hXP/Zh40NvYfR2Eba53O4aV9FM0Id6bQ5w/MPjxCwM0JWDLeVgaWIJSgtUsNxr4sBo
X-Received: by 10.140.17.67 with SMTP id 61mr10310444qgc.59.1415963572435;
	Fri, 14 Nov 2014 03:12:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.98.213 with HTTP; Fri, 14 Nov 2014 03:12:32 -0800 (PST)
In-Reply-To: <1415956804-56497-4-git-send-email-biannm@cn.fujitsu.com>
References: <1415956804-56497-1-git-send-email-biannm@cn.fujitsu.com>
	<1415956804-56497-4-git-send-email-biannm@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 14 Nov 2014 11:12:32 +0000
Message-ID: <CAJTo0LaPCD66Du37n2jma+qcg-mFyQYQE7vvwxi=DrpkK59zEg@mail.gmail.com>
To: OE-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH 3/3] Porting eggdbus from openembedded.
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
X-List-Received-Date: Fri, 14 Nov 2014 11:13:06 -0000
Content-Type: text/plain; charset=UTF-8

On 14 November 2014 09:20, Bian Naimeng <biannm@cn.fujitsu.com> wrote:

>  meta-oe/recipes-core/eggdbus/eggdbus_0.6.bb        | 41
> ++++++++++++++++++++++
>

eggdbus hasn't been touched since 2009... what's the rationale for adding
something that's been unmaintained for five years and has had a replacement
in the form of GDBus for four years to meta-oe, instead of your own layer
(or porting to GDBus).

Ross

