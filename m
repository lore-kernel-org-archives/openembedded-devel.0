Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f181.google.com (mail-ie0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id D3C3B6F8F6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Mar 2014 17:34:55 +0000 (UTC)
Received: by mail-ie0-f181.google.com with SMTP id tp5so1181654ieb.26
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Mar 2014 10:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=mZ064JR0xdULbEyzBxGsDp5x9C+3xjkvI7b2FVQRW7I=;
	b=P4+RPLi41rCVXvhCZeAnXdID0R2Z3O6pkiE7cC/uXzfnDtb2k8TgeUBhKsM18E5bjN
	+v+11Rr8pNQsLRMWhFcuCOixgF25+/j+R16wCpLnG8xCj11+Sl1IpSUeksZUej9sRgJu
	/6f4D8Q5FTJZP20abgMTgs7P/uRux3vObka+7Xw9yhKuwuT4UoP+GjiHmqkbMbW+UnS7
	kfk+h4SkSKF1v5akvLswKuFPhANTleyzykexTqGFoXyXNqZJOTCnLoDitAPYaWdjWEZF
	Yz4s1Wmah/N5YaRy3PkbeFmPIZh7+t98Nx1Kpp78w9S9JzYyvYneZbhg/PgLxrKviHKX
	ym5g==
X-Received: by 10.50.49.76 with SMTP id s12mr22314513ign.2.1395336896187; Thu,
	20 Mar 2014 10:34:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.224.136 with HTTP; Thu, 20 Mar 2014 10:34:26 -0700 (PDT)
In-Reply-To: <1395313904-6600-1-git-send-email-Matthieu.Crapet@ingenico.com>
References: <1395313904-6600-1-git-send-email-Matthieu.Crapet@ingenico.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 20 Mar 2014 10:34:26 -0700
Message-ID: <CAMKF1sqxERqVRbKkSfz1eJ4s_8WiWLbpK10RHpvBdRzfi7e5FQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] terminus-font: add new recipe for version 4.38
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
X-List-Received-Date: Thu, 20 Mar 2014 17:34:58 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Mar 20, 2014 at 4:11 AM, Matthieu Crapet
<Matthieu.Crapet@ingenico.com> wrote:
> +PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"

why use ??= and not ?= here

