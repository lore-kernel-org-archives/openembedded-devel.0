Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f178.google.com (mail-ie0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 41A116EEF5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2014 04:11:32 +0000 (UTC)
Received: by mail-ie0-f178.google.com with SMTP id ar20so1629183iec.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Feb 2014 20:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=7XhE31982Lmy33bEsyPTWaQzWgKmMA3YLH9sQ8R1RWo=;
	b=g54Gs8hHzpdq0NPDvBBVLWU5/8x58jZYNJccaZgFc7DNfWyB+Ahd1sua8YV+FkOcSI
	z8qcoWf/CnpVI+99Rlw+RegiPtua9U4P30loBAKsF6ykFVWqA4jV8BenUSVAiH5/p22T
	zcwgvOOEUo78alyfpAav617Eo0SAlmOAWH3VWQv/ITJjksKYMxyN9HhMGkgzkiCENKjd
	Z67M7fVlwJ4vqVLMHhO3cC4nb93aCkFFHcAuzBSf73L9P+e9QswA9NhhIZFnQwIl2B54
	cXeJR/n59DwQGBwbf4cB3CJN14ZvRXMf7GlHr6E6qwpO5vYJHKqH6FQYy/p69/8hEv/B
	DUZg==
X-Received: by 10.50.43.170 with SMTP id x10mr3749125igl.20.1393474293366;
	Wed, 26 Feb 2014 20:11:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.224.137 with HTTP; Wed, 26 Feb 2014 20:11:03 -0800 (PST)
In-Reply-To: <1393471102-14702-1-git-send-email-net147@gmail.com>
References: <1393471102-14702-1-git-send-email-net147@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 26 Feb 2014 20:11:03 -0800
Message-ID: <CAMKF1soSVSoiqNW=yriY=OwiqpvVBmw9fW6QSJgND=V7_H6s_g@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] xterm: split out resize into a separate package
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
X-List-Received-Date: Thu, 27 Feb 2014 04:11:33 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Feb 26, 2014 at 7:18 PM, Jonathan Liu <net147@gmail.com> wrote:
> -FILES_${PN} += " /usr/lib/X11"
> +PACKAGES =+ "${PN}-resize ${PN}-resize-dbg ${PN}-resize-doc"
> +
> +FILES_${PN} += "${libdir}/X11"

Multilib case needs testing since libdir will change in that case

