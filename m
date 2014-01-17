Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-ob0-f182.google.com (mail-ob0-f182.google.com
	[209.85.214.182])
	by mail.openembedded.org (Postfix) with ESMTP id E1FF760CE8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jan 2014 10:47:13 +0000 (UTC)
Received: by mail-ob0-f182.google.com with SMTP id wn1so4169524obc.27
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jan 2014 02:47:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=i1/k9XhAnTvSemo+PqSLAiEH+s3MCFprdXOQyqczKv8=;
	b=RyXi+/AQzDJVaMPukCMuucvzEadizumnLfrtZFilTWLh4oyEgJlEuZbOYtrDpQRRPJ
	LRhGlOiK36Z/zCs3TZDwdB5NPbWdPccNdaMSwWFReFTkNOPNbrY6xgONr2LHY20gScXT
	kcSi92jOUhhRU1G4+ssacPWS9XitBBp37KXZbLZo3j4mFqs7nAxJHWUDt6mAONEiI4TR
	M37UAphNn9eoOz7dB7/bMM/1LUy4Vd71wkXlxs8DlHj/QSwqWLUA7xoSDxVI56csvLpT
	aEKQla/JoDl6oOPZBu+mhJLcGMncHT67KuvRsaJxOIUqgjSiElv9CJ/9Jd2QYAFQj3Eu
	ebfA==
X-Gm-Message-State: ALoCoQm+8zISVdOGIF8btgMsb/gEXXKEJxBxmS75uED/JykRax5Im+DjkK/JhxzNc/MCW9cCfexr
X-Received: by 10.182.150.105 with SMTP id uh9mr707085obb.80.1389955634770;
	Fri, 17 Jan 2014 02:47:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.84.233 with HTTP; Fri, 17 Jan 2014 02:46:54 -0800 (PST)
In-Reply-To: <20140116235245.GK3742@jama>
References: <CAP71WjydArvSEYRdK0NRWs5tTS_KuYBjZena8nas9eE0tHbv6g@mail.gmail.com>
	<20140116235245.GK3742@jama>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Fri, 17 Jan 2014 11:46:54 +0100
Message-ID: <CAP71Wjw=izSkOfwTHpLG_OZpX=4tUHeKgiZboT-2rg3jStNYog@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: qt5 and virtualbox
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
X-List-Received-Date: Fri, 17 Jan 2014 10:47:14 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Jan 17, 2014 at 12:52 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Check .bbappends in
> https://github.com/webos-ports/meta-webos-ports
>
> there is branch also for 5.2.0 and if you check webos-ports wiki you'll
> even find VirtualBox appliance build to test it without building it yourself.

i could run the appliance. this is awesome stuff. pretty much exactly
what i needed. we don't use the wayland QPA, but eglfs, but I don't
see any specific reason why this could be a problem. this stuff is
very nicely designed... a good example of what can be done with OE!

