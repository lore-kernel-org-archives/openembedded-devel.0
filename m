Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f176.google.com (unknown [209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 88DFA60173
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 May 2014 17:06:51 +0000 (UTC)
Received: by mail-ie0-f176.google.com with SMTP id ar20so1988977iec.35
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 May 2014 10:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=fT9XUJUI8SZbsyau//2/Sc5DgJXXNB0+ZlLSn3B98hw=;
	b=e/lMaDh+UqhomQXufHJX+1gdZZpGktVM5RSkINJi7k/1e2FjpvIcaFq7kkFiB5N7ja
	LYhKd1asCAqmfqjV+SXiSksdzAjUldLox/awIx8bmBUQhI57l0KGm/1//XiqqfI6cOzD
	g5zA0gZarvjfkCvPhoml2FGyL6uZ84Sx/wndGsAuUw+cw6AkxxpH5TMb+LZnYbbaN6v8
	UGSLIpG5miPNoJT4syJ8AVZg9qViGbWRxUDB0Tk5saj7JsZt8PGhc2M7ppp55gTXesNO
	seUFrVUa5HjwbgJb4djesnlLBzF+fwnnwJeeR0QEPsoRe0EApjDvXSl50gN1G8H7QQFY
	VBnA==
X-Received: by 10.50.43.225 with SMTP id z1mr23565474igl.29.1399741612028;
	Sat, 10 May 2014 10:06:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.79.133 with HTTP; Sat, 10 May 2014 10:06:21 -0700 (PDT)
In-Reply-To: <1399463007-14787-1-git-send-email-Matthieu.Crapet@ingenico.com>
References: <1399463007-14787-1-git-send-email-Matthieu.Crapet@ingenico.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 10 May 2014 10:06:21 -0700
Message-ID: <CAMKF1srcr7c8ExfZkmo3b-VUMMPsZKT77N3ygqKVK_HwxXkC+w@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] xdelta3: add optional lzma support
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
X-List-Received-Date: Sat, 10 May 2014 17:06:53 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, May 7, 2014 at 4:43 AM, Matthieu Crapet
<Matthieu.Crapet@ingenico.com> wrote:
> +
> +# Optional secondary compression
> +PACKAGECONFIG ?= ""
> +PACKAGECONFIG[lzma] = ",,xz"

consider when xz comes as indirect dependency via some other package
then this packageconfig will become useless
IMO you have to also fix the package itself to explicitly
enable/disable the lzma support and then adding packageconfig
will be effective.

