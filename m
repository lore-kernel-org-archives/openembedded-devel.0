Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-ob0-f174.google.com (mail-ob0-f174.google.com
	[209.85.214.174])
	by mail.openembedded.org (Postfix) with ESMTP id 7BB92619DE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jun 2013 15:25:23 +0000 (UTC)
Received: by mail-ob0-f174.google.com with SMTP id wd20so7392953obb.33
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jun 2013 08:25:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=DBab/n/6lrWexAc8aa2TX7ZZ/JtQUdqWEYguXogafek=;
	b=N9hrgtGk5uCh+8HR1KKSyWWeVYVw5+26i5cEdrvAPGJpqMX80tgaHgWuBI5Gy4yuX/
	OhzmsXegdW/LwurVxXmqZjObThieD3d1HlZC7IUC4WCrWRPRhZSot8Q3OoKNes1zz1qD
	Y/lLEC18ck/2V5p0GNjukxAQ4pM8a66h88qGS49wM32ttq8R+UZtivyaJaq6JxtfpbnR
	277e7G3A9uvS8QJ5NFUKfNdi26DQlKIRjPLEWy5uSUPHmAWzqUzoDUT8Z67JOaRg3mOE
	YDT01/JsGRZwpJcACXPcfTIOXDjbPI0F0SnP5S3B69egnTYsbJJTXrgzYCECGtjAGw6m
	2pKg==
X-Received: by 10.182.96.37 with SMTP id dp5mr1776074obb.93.1371741924307;
	Thu, 20 Jun 2013 08:25:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.76.27.165 with HTTP; Thu, 20 Jun 2013 08:25:04 -0700 (PDT)
In-Reply-To: <20130620150652.GH14021@jama>
References: <CAP71WjxJxpWwa5UV4PpN=f0rL00UpPJ_VKJ4LmEu=AVBRdVo2A@mail.gmail.com>
	<20130620150652.GH14021@jama>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Thu, 20 Jun 2013 11:25:04 -0400
Message-ID: <CAP71WjyB1i4oeJHA21EUrV4vQzfcTbd6aUHD1iXrFmVo5x=cQA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQl9dHBPunGGqCMEBIdwUTw9kzDYlAzJWETlH2bywVgI6rPa37/wP0P4gw/40VdLnvWKr6Tz
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: Issues with Qt5/mesa and eglfs
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
X-List-Received-Date: Thu, 20 Jun 2013 15:25:23 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jun 20, 2013 at 11:06 AM, Martin Jansa <martin.jansa@gmail.com>wrote:

> You should be able to build qtbase with mesa from dylan if you add
> CFLAGS_append = " -DMESA_EGL_NO_X11_HEADERS"
>

yes, that works too, but that doesn't really fix the original problem in
the dylan branch, which from that perspective is broken, right? how do you
recommend that to be fixed?

btw, i also tried to cherry-pick the new patch from master that i mentioned
earlier, and that worked too.

