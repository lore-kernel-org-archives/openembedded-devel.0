Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f175.google.com (mail-ie0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 5F43B6017E
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Jul 2015 23:43:30 +0000 (UTC)
Received: by ietj16 with SMTP id j16so42796767iet.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Jul 2015 16:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=4Sm47ddvg1Ruy5An+DEhJg8DmjogyEoD/LyzLWepgCo=;
	b=wBEop0hmfgasUeXdnNrU3lPwSVq19deQYPEzaALZcB+OuOv8N1iqWAscxH+WQtZhd9
	KCzR56XURl1guvaaGjN/yPb3jk1Dn5CBjFfF135I1FGmP5cSzSTSvNb8hmlzPhNodSJ2
	9Rc66bJR76QDeYEG7bEacGeZ5fzX7ctxPg6Dv2KUk4Vav35Qd9pux0WhmhxHR486F7gM
	BeIutEijA98a5xBDUYU7OOz03hie8YySnJQdEWLDAKus+XWAsnnnd1EHGaJ7ee5J6ylq
	RKBxOQftO7W/ASf88oEu3ks1oVRrrsQH5lBNMyYnUMLcmccDbA7jQqw9KMyMA+pyZdX9
	yKJQ==
X-Received: by 10.107.157.4 with SMTP id g4mr38923775ioe.66.1436658211051;
	Sat, 11 Jul 2015 16:43:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.20.83 with HTTP; Sat, 11 Jul 2015 16:43:01 -0700 (PDT)
In-Reply-To: <1436520866-18584-1-git-send-email-wenzong.fan@windriver.com>
References: <1436520866-18584-1-git-send-email-wenzong.fan@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 11 Jul 2015 16:43:01 -0700
Message-ID: <CAMKF1srTMRj=YHJWH99AvySmbbEDOdEVzopsu74ry_PFd_jmjg@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-perl] libxml-libxml-perl: update from 2.0116 to 2.0121
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
X-List-Received-Date: Sat, 11 Jul 2015 23:43:34 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jul 10, 2015 at 2:34 AM,  <wenzong.fan@windriver.com> wrote:
> +do_configure_prepend() {
> +       rm -rf ${S}/.pc/*
> +}
> +

why is this needed. And please use -M -C option with git format-patch
in future so git can detect renames.

