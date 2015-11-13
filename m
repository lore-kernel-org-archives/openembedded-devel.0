Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 31295772CA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Nov 2015 10:13:39 +0000 (UTC)
Received: by iofh3 with SMTP id h3so93092118iof.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Nov 2015 02:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=dJesgqBAPykGUAKO5GwQv3DCJbhZLQEmLSulR4q7ok4=;
	b=uff8FTI2T2W3n0WSFNPtKKxD2xi1xYMKmNc0NGltCFLnc7E62/aQ6meD0qa+sD6THZ
	7dYia/o1rvdekFjgp35KggoDbCRnBcIgsBnNE0dhxUCkTnW/nqdP2fktGqZ9agWogjV2
	lKacl0UFCJSW/fLyvT0L7uHzH5TSIRIcWgF+/gJtTOFFwfWAKhUSUhvRlfkGIMVwMbe5
	L4e1oxp97/3WM703Kaf6E7D5g/C7RXwN4cb2ZF1DWE+NcdK54O5VHIjgsHn9wBn4699/
	5KQn4S1LzSRTyidDuaRKlaXJsARp/1R0UwPBlyoBtT8OKnWtGw92rQcHKWWm3ra23YRK
	X8pw==
MIME-Version: 1.0
X-Received: by 10.107.130.155 with SMTP id m27mr21653198ioi.133.1447409619864; 
	Fri, 13 Nov 2015 02:13:39 -0800 (PST)
Received: by 10.36.31.131 with HTTP; Fri, 13 Nov 2015 02:13:39 -0800 (PST)
In-Reply-To: <1447409052-30874-1-git-send-email-hongxu.jia@windriver.com>
References: <1447409052-30874-1-git-send-email-hongxu.jia@windriver.com>
Date: Fri, 13 Nov 2015 11:13:39 +0100
Message-ID: <CALbNGRQuQcD54T7raCZdhM3-fTpiiH2Xa2C=0svMq8w+HMrnkg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-xfce][PATCH] meta-xfce/layer: explicitly set networkmanager to NETWORK_MANAGER
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
X-List-Received-Date: Fri, 13 Nov 2015 10:13:40 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Nov 13, 2015 at 11:04 AM, Hongxu Jia <hongxu.jia@windriver.com> wrote:
> The NETWORK_MANAGER is connman-gnome in oe-core by default,
> which conflicts with networkmanager. And networkmanager is
> required by xfce4-power-manager in meta-xfce. So we explicitly
> set networkmanager to NETWORK_MANAGER for meta-xfce.
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta-xfce/conf/layer.conf | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta-xfce/conf/layer.conf b/meta-xfce/conf/layer.conf
> index 55bcef6..e38d85d 100644
> --- a/meta-xfce/conf/layer.conf
> +++ b/meta-xfce/conf/layer.conf
> @@ -17,3 +17,6 @@ LAYERDEPENDS_xfce-layer += "openembedded-layer"
>  LAYERDEPENDS_xfce-layer += "gnome-layer"
>  LAYERDEPENDS_xfce-layer += "openembedded-layer"
>  LAYERDEPENDS_xfce-layer += "meta-python"
> +
> +# It is required by xfce4-power-manager
> +NETWORK_MANAGER = "networkmanager"
> --
I was wondering why I never needed such kind of patch and checked: In
my layers It is only used in packagegroup-core-x11-sato.

So I am fine with this patch but could you mention
packagegroup-core-x11-sato in the commit message please.

Andreas

