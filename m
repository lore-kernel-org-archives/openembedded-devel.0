Return-Path: <martin.jansa@gmail.com>
Received: from mail-yk0-f173.google.com (mail-yk0-f173.google.com
	[209.85.160.173])
	by mail.openembedded.org (Postfix) with ESMTP id B0CCF6C735
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Mar 2014 22:18:09 +0000 (UTC)
Received: by mail-yk0-f173.google.com with SMTP id 10so10894020ykt.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Mar 2014 15:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=nJwm26aeZoQ6zlQPheVFm5bvpNrlq9dHtfjx4Y84nTo=;
	b=IT6ZJGtW4LastabGcoiNg77S1DKLzTyqaPvY9Ec1Csdn+SgyDjN9wSwPNsgv980gV9
	c4wv8AcD7oetyqod7fIZoT56tBGbfAKI5mvxeZw9oi18WdOAM+nLQV0/+u4Fc5DQ2lQ/
	br6/UPMm471dzfiHoVoaesoeb1epjCuSGcfVV3BdPchazR6/FkwLHN0VpAs2G7OAGM/T
	h3F+nc6pCfkMhYRgeQaubjE0dZJe03M9Csfslbs0q62HAk0nvSsmCoN/y8rNmlGKtloj
	kPCNFh8e+TauXUx2CgC2PRLwK+xa+KnftOHtuVAizWp/yGEGVSaDPESh3++0YdHo16ag
	kj7A==
MIME-Version: 1.0
X-Received: by 10.236.42.43 with SMTP id i31mr11203417yhb.31.1394921889992;
	Sat, 15 Mar 2014 15:18:09 -0700 (PDT)
Received: by 10.170.159.197 with HTTP; Sat, 15 Mar 2014 15:18:09 -0700 (PDT)
In-Reply-To: <1394919160-28076-1-git-send-email-raj.khem@gmail.com>
References: <1394919160-28076-1-git-send-email-raj.khem@gmail.com>
Date: Sat, 15 Mar 2014 23:18:09 +0100
Message-ID: <CA+chaQdaNjbJn=a_VWgv-3MXbETzb=JhXbo+9uDw4vxRt-MQ8Q@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-systemd][PATCH] dhcp, util-linux: User wildcard in bbappend names
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
X-List-Received-Date: Sat, 15 Mar 2014 22:18:11 -0000
Content-Type: text/plain; charset=UTF-8

see already merged commits:

http://git.openembedded.org/meta-openembedded/commit/?id=5b8498b53dcdf2ed797cbd2049dd3856ef17e2ff
http://git.openembedded.org/meta-openembedded/commit/?id=c78731c0859d79b115d47e2bfcd977086d25fc64


On Sat, Mar 15, 2014 at 10:32 PM, Khem Raj <raj.khem@gmail.com> wrote:

> These are simple bbappends for systemd compatibility
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../recipes-connectivity/dhcp/{dhcp_4.2.5-P1.bbappend => dhcp_%.bbappend}
> | 0
>  .../util-linux/{util-linux_2.23.2.bbappend => util-linux_%.bbappend}
>  | 0
>  2 files changed, 0 insertions(+), 0 deletions(-)
>  rename
> meta-systemd/oe-core/recipes-connectivity/dhcp/{dhcp_4.2.5-P1.bbappend =>
> dhcp_%.bbappend} (100%)
>  rename
> meta-systemd/oe-core/recipes-core/util-linux/{util-linux_2.23.2.bbappend =>
> util-linux_%.bbappend} (100%)
>
> diff --git
> a/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_4.2.5-P1.bbappend
> b/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_%.bbappend
> similarity index 100%
> rename from
> meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_4.2.5-P1.bbappend
> rename to meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_%.bbappend
> diff --git
> a/meta-systemd/oe-core/recipes-core/util-linux/util-linux_2.23.2.bbappend
> b/meta-systemd/oe-core/recipes-core/util-linux/util-linux_%.bbappend
> similarity index 100%
> rename from
> meta-systemd/oe-core/recipes-core/util-linux/util-linux_2.23.2.bbappend
> rename to
> meta-systemd/oe-core/recipes-core/util-linux/util-linux_%.bbappend
> --
> 1.9.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

