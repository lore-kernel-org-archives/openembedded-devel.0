Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 935887FF98
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Jan 2020 05:38:32 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id e12so4096994qto.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Jan 2020 21:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=jjH7FpZPi/YG8AN+VzqhEFsFpxPLVFin7lScurm0niI=;
	b=nZnpsVUikLzFZJtVr6YUX5Idp8FjQQIng/x9bYSLIOdO/NUqjAx9r8KAFAeAnd7x+E
	ywdJhLLFVS89+hzbPbpc073d7WNisqjLy49gGqQjL/12eurIpwBQoZzd8sUpfx67vuP2
	oVMhVjbQ85LEryoNzqXAqLxSLppLneY3lNqzT1X4yxMOGG+f3fYxsQKeENnprBkv7J5W
	eLPafUpaVMUBNQFNiItn69G/mpcePkREXar13Iq1jSWVkoUw0TKBGAgfmY9JqRzPcVih
	KfJlo6dXF//iBPNSKOUfRMjQCdWxP9JP/ikNQ14ifn3nvkfgN9BaZ5a0DQ/m05ubmxBr
	XPEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=jjH7FpZPi/YG8AN+VzqhEFsFpxPLVFin7lScurm0niI=;
	b=a3GQ7TRh9W4K8FmP7k2vDZE7oTVG2SCjX/KAjTHJx1IrfqpNUjbRD2u4FnvuvnKJin
	FkP5Jq932x+MkS7SAG7KrMIyAnHqEupNmpvqIVohWK5Bvc8EPikdDOjP5F1HzapafzxA
	VEgy0stg6PkRZvKwY4t/H6dTDH3ZzkCWyXWJS07W1p7SFRiI/Uwc2wLBBfupMYzXtUw0
	mMyFWU4fA2uME3ik6LuMG5NJbf9gifbFJCWTzjhmwJbNDKS5Bc/Lgdgdn3rW0JHhKizz
	t6LOs7DpJxpWbVmyjURo3rdaqQXSzpBH8raR6AannjWJSCQI1P/5IYinRxGr6PL+ZBaw
	xIMA==
X-Gm-Message-State: APjAAAWM+QzsE4mRVN+zGn8t4nYTcRKURoQPU06m7OSPVkY7XqtTrulv
	C2CZO1K9UH32gYfBxdi4DNYhXtN8re+dPFtIiTs=
X-Google-Smtp-Source: APXvYqy+TnNfIWSGo0jGGdm6v6vk+TyD5SjDDUtSjQG45JGLdUPdZxgTMYgkEiSqAkNU94NxJSm2XGbxt8xAJpN+WmQ=
X-Received: by 2002:ac8:4657:: with SMTP id f23mr5667810qto.378.1578721113174; 
	Fri, 10 Jan 2020 21:38:33 -0800 (PST)
MIME-Version: 1.0
References: <20200110100454.20554-1-costamagnagianfranco@yahoo.it>
	<38a434af9cccb7b724f1a4f2f97bf9425e695786.camel@intel.com>
In-Reply-To: <38a434af9cccb7b724f1a4f2f97bf9425e695786.camel@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 10 Jan 2020 21:38:07 -0800
Message-ID: <CAMKF1sqkXhJvs_ajfA606_9BX8=_jFLu8t+GSxR1smO5eCy+nA@mail.gmail.com>
To: "Mittal, Anuj" <anuj.mittal@intel.com>
Cc: "locutusofborg@debian.org" <locutusofborg@debian.org>,
	"costamagna.gianfranco@gmail.com" <costamagna.gianfranco@gmail.com>,
	"costamagnagianfranco@yahoo.it" <costamagnagianfranco@yahoo.it>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] websocketpp: also install examples in a new -examples subpackage
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
X-List-Received-Date: Sat, 11 Jan 2020 05:38:32 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 10, 2020 at 6:20 AM Mittal, Anuj <anuj.mittal@intel.com> wrote:
>
> On Fri, 2020-01-10 at 11:04 +0100, Gianfranco Costamagna wrote:
> > +do_install_append() {
> > +     install -d ${D}${docdir}/${PN}
> > +     cp -R ${S}/examples ${D}${docdir}/${PN}
>
> I think these should be BPN instead of PN so this works with multilib.

right. Since I have merged this patch, perhaps a new patch addressing
this would be good.

