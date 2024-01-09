Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B9D9C46CD2
	for <webhook@archiver.kernel.org>; Tue,  9 Jan 2024 15:50:21 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.19858.1704815415741275890
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jan 2024 07:50:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=E29VEf2P;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-50e5a9bcec9so3829484e87.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Jan 2024 07:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704815414; x=1705420214; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cv0VcvoQd1WwkeN2mzywuqAMh/2iVHmC0gsTZ76xhgw=;
        b=E29VEf2PkatvnOI7KxKoIs9N0mJxCpDKezZx+MwxLmhQktFCkR4N/d+OJrkpQIDqy1
         SxtYzVZ4t4GziYJMYYEYHrgT3SdPR+dBKQfMnEDFQyCbrLfhspl4Z85EBnsLaiJR4CBA
         9PYGhjqY+RZiQYBY8nNkPrOd3Hs2Vnz+gxtGuDpx+Bh4djh2j+70n0N9B36K+vvH0ugK
         xjc6hjl2tBIKBG0c9EeKFN+P1epcYI6dxhRD+AU0tfhdtqhvnIQwcEAx03ZBr53uWryv
         J42f22ZU3/5ax4f+b4j9N5mF8UZF0FVsDCIhjvgtbhYVk37Y41+gtgQ2HAAFjJ7U9vDg
         5DgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704815414; x=1705420214;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cv0VcvoQd1WwkeN2mzywuqAMh/2iVHmC0gsTZ76xhgw=;
        b=rgmX7h2bxqRBcYAA47QMRRhlQuypGC8w3wYbxEBuh6VEvoHjp7/o4zqzTebBjEUtIW
         7I14O1upRb7owkUjagRFy1uJPeGs3QR1TGXS1KKTY66nenrwUE8OnCBcTKcWjuseXUWy
         c73w2A4nHig6VYFQQD00/koITk9/NfrtJhPfyxE5SDysQgWQjMan2aVAbwlSzE1AvV4T
         9njQ58XoLVHcdJT7VJcFjVd3TiVdGc8C3GrafcxFm1nTnvcydDP8z6siD0NZXZndUiPl
         EG7SWfWHlziUg6HH2M2ocSoXFEmFayVpnRMxWwuHSUP7GJpY+opaA51uvrqi0zgh2S1D
         bW9g==
X-Gm-Message-State: AOJu0YyRYmcuu8NIf5VMY40Am+BaFcK5sWxPqa9y/YAGHtCI/hM9LzkU
	FO34YsTJUP4Fzrwcdao5a0IZRkoNw2nR4tv+bzI=
X-Google-Smtp-Source: AGHT+IEp1sD44Ncef+I1aSWDmd3AmwgOZAznANEuzd+iOgTAw4l65L5MwDtTGrgDOdukOaomLDi3vpx8j4kS111AICA=
X-Received: by 2002:a05:6512:280d:b0:50e:6549:a980 with SMTP id
 cf13-20020a056512280d00b0050e6549a980mr3062629lfb.77.1704815413685; Tue, 09
 Jan 2024 07:50:13 -0800 (PST)
MIME-Version: 1.0
References: <20240105133611.3018041-1-alex@linutronix.de> <20240105133611.3018041-2-alex@linutronix.de>
 <CAMKF1srDmU9h8xP2JGX=6otiRGqVPKr4ZNX00bicU-R=C9ipmQ@mail.gmail.com>
 <CANNYZj8kkMN-dzw2YzXEQ1dTFo3d+Bg5jxSe9VCLDyF=DNFVPg@mail.gmail.com>
 <CAMKF1sq4Da2ESxyO5vdrqiGfeCYptebHaYU4N0XA5m18wAkPWg@mail.gmail.com> <CAMKF1soqdtZKAXsSuZV4gOXTcxtoLBT5iLUXO7cJVG7ijiRLUg@mail.gmail.com>
In-Reply-To: <CAMKF1soqdtZKAXsSuZV4gOXTcxtoLBT5iLUXO7cJVG7ijiRLUg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 9 Jan 2024 16:50:02 +0100
Message-ID: <CANNYZj8zkbkw9ukN+FEN8ADwdpuNQWX4RnOvX-CV55eue2bGqA@mail.gmail.com>
Subject: Re: [oe] [PATCH 2/2] python3-kivy: update 2.2.1 -> 2.3.0
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jan 2024 15:50:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108201

On Tue, 9 Jan 2024 at 16:02, Khem Raj <raj.khem@gmail.com> wrote:
>
> btw, do we need to switch branch stable -> master ?
> there is patch from Leon which has descriptive commit message. [1]
>
> [1] https://patchwork.yoctoproject.org/project/oe/patch/20240109135121.3460927-3-leon.anavi@konsulko.com/

When I sent mine, stable wasn't yet updated I think. So can be either way.

Alex

