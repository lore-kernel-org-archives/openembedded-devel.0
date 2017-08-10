Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f48.google.com (mail-oi0-f48.google.com
	[209.85.218.48])
	by mail.openembedded.org (Postfix) with ESMTP id 7A1CB719C8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Aug 2017 14:08:52 +0000 (UTC)
Received: by mail-oi0-f48.google.com with SMTP id f11so7684135oic.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Aug 2017 07:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=dJNR5SjhM7fq6bjyw7A9P1sIW/AY4izWGM4AtPKmPuQ=;
	b=k14MD7/tM62eai377s/xAFHCmfHsIYstzVauPMl2vCFMm7cNlHGF2BeA7eiA4u1dS8
	w0jAbKl577dZXPvmrvuOK6z1Wl1OdLSmWkEM5lErEulCA/PktUHtBomTAmw5B2EnvA87
	I/1p5vmhEnCx+4MAcJ6kiOTQo333XgQsRiuiTpr7WXtfNHl7fpXdmGb9qR+j98FM0agB
	9WYRc3iSd5kWaoxN4tMsyduSc/SMitW0MvRrAPtS7/xHVFoRconO0RXr2YD08hcDNJ4L
	Obrk0Be60Ww98FS+nOlaJR+hT4nqFlC1lf0BoMQqY+VfYYK4+a+JRl+0sBjfJT+EaT8n
	SDVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=dJNR5SjhM7fq6bjyw7A9P1sIW/AY4izWGM4AtPKmPuQ=;
	b=HXtU2U4J9d19mujoe/TMYNR8E0JoqN0vkUJGZJHUCQqM8jRqIpUzI3SubLL7krbzC/
	eLdc0R96ps9s+7N0AaRloIWmTYaXcMQsPmsp5ls3Bti0RZe1EoYYyXYRLFx34jw0nfYS
	erSTnr3B+Iuav9IoXUUNyKCqF+0eI11GXssD7DcUUlEmqOvVlM/SksdK0UX6SeDJ8csF
	N5v2QfQu0tAN9GEtb+TaK4WOBtW+B6zJDCdiIAGD+wvWo0ZiVnQYc7m0SLuNyBs4Bfu5
	BAd9HtnSogsnPoL5z30bKNbqh5/MhT2aUkzaszXg59Y3v7a1RAA44XvVoaL5O9CBAsh7
	O6Zw==
X-Gm-Message-State: AHYfb5iTdQ6RhJmFeawpOo5d+4OUKcizvNIF5v56qvUVsF5D+Dci3p39
	ow9DQ/QHIYG/83kMLpA=
X-Received: by 10.202.104.105 with SMTP id d102mr14680884oic.58.1502374133038; 
	Thu, 10 Aug 2017 07:08:53 -0700 (PDT)
Received: from mail-oi0-f54.google.com (mail-oi0-f54.google.com.
	[209.85.218.54]) by smtp.gmail.com with ESMTPSA id
	l206sm6146498oia.46.2017.08.10.07.08.51
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Aug 2017 07:08:52 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f54.google.com with SMTP id f11so7683164oic.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Aug 2017 07:08:51 -0700 (PDT)
X-Received: by 10.202.198.199 with SMTP id w190mr12353364oif.93.1502374131368; 
	Thu, 10 Aug 2017 07:08:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.247.10 with HTTP; Thu, 10 Aug 2017 07:08:50 -0700 (PDT)
In-Reply-To: <b1028086-be63-069e-5a83-4e65321062c2@pseudoterminal.org>
References: <1502311573-14071-1-git-send-email-dv@pseudoterminal.org>
	<b1028086-be63-069e-5a83-4e65321062c2@pseudoterminal.org>
Date: Thu, 10 Aug 2017 11:08:50 -0300
X-Gmail-Original-Message-ID: <CAP9ODKq3Loqh-_drbh8CiejqR5_hf6BVr7KAVaQqcOt=qSHnpQ@mail.gmail.com>
Message-ID: <CAP9ODKq3Loqh-_drbh8CiejqR5_hf6BVr7KAVaQqcOt=qSHnpQ@mail.gmail.com>
To: Carlos Rafael Giani <dv@pseudoterminal.org>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] gstreamer1.0-plugins-bad: add qt5 packageconfig
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
X-List-Received-Date: Thu, 10 Aug 2017 14:08:52 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 9, 2017 at 5:58 PM, Carlos Rafael Giani
<dv@pseudoterminal.org> wrote:
> Note: This is only a draft, since there are two unanswered questions:
>
> 1) If the qt5 packageconfig is enabled, OpenGL (or GLES2) is needed. So if
> qt5 is added to the PACKAGECONFIG variable, then PACKAGECONFIG_GL would also
> have to be added to PACKAGECONFIG if no OpenGL/GLES packageconfig isn't
> already in the PACKAGECONFIG variable. I have no idea how do that. Perhaps
> in a python () { } function ?

bb.utils.filter might help?

> 2) I think it would make sense to add the qt5 packageconfig to the list of
> default packageconfigs here. The idea being that if you add meta-qt5, then
> gst-plugins-bad's QML plugin is automatically enabled. But I do not know how
> to append, since the PACKAGECONFIG is assigned with the "=??" operator ...
> but what would then the right operator for appending? _append ? += ? Isn't
> "_append" "stronger" than "=??" ?

Adding things behind the scenes is something we try to avoid; I know
people do that but it is not a good practice. Instead, this could be
added to the recipe as a comment and mention it must be enabled to
expose the QML plugin.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

