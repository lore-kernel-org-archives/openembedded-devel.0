Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ie0-f169.google.com (mail-ie0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id E67FD6ABF7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Apr 2015 20:40:32 +0000 (UTC)
Received: by iedfl3 with SMTP id fl3so41688893ied.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Apr 2015 13:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=wKr+cCcIMov/3j8IPoWsRff8HW+NTgMcMLnft/dH2Iw=;
	b=ab91sIQS2gmAQyj/SwMUcfhPmF1XVKOjBy4wou0m077H6d9e6rXTRFto3T2Ctnh/uH
	abTh6D1yE6Og5PVRLr/XwvpAnw98HWVtuXlQiikG66URf3yO62OnTSQB/0oYIVBl+x83
	o+XmP3AxjqnUi1gensQgvM/nzWYNh122XOiHnno/CjVNE9zG+xr0QOGRoUV0Lct7buMK
	YyhZyQTyjdbiw4DstO496NUQ78L/NX4TJAE3Vd+OwAUXHZUaVrIbvViXLGyj2rVtUJmJ
	ts9uW6T1g5lnGmg1RtjD0QwtTPvkM3xRvlhD7yXF3kVS15vU4/iZY7fk58916lv2XEtZ
	5S6Q==
MIME-Version: 1.0
X-Received: by 10.50.30.130 with SMTP id s2mr939048igh.11.1429130433215; Wed,
	15 Apr 2015 13:40:33 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.107.23.197 with HTTP; Wed, 15 Apr 2015 13:40:33 -0700 (PDT)
In-Reply-To: <1428525047-18093-1-git-send-email-neena.busireddy@freescale.com>
References: <1428525047-18093-1-git-send-email-neena.busireddy@freescale.com>
Date: Wed, 15 Apr 2015 17:40:33 -0300
X-Google-Sender-Auth: Y2hXSZq-VWmfPTFmptCmZHUapPc
Message-ID: <CAP9ODKoerFB9-9a3aYB5=SBZ76MSEckkSrzj0tGzj=4TYpDBwg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH V2] qt5nmapper: Fix compatibility issue
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
X-List-Received-Date: Wed, 15 Apr 2015 20:40:33 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Apr 8, 2015 at 5:30 PM, Neena Busireddy
<neena.busireddy@freescale.com> wrote:
> qt5nmapper app fails to run with the following error:
>
> file:///usr/share/qt5nmapper-1.0/Qt5_NMapper.qml:34:5: Type Panel unavailable
>          Panel {
>          ^
> file:///usr/share/qt5nmapper-1.0/content/Panel.qml:118:9: Type Switch unavailable
>              Switch {
>              ^
> file:///usr/share/qt5nmapper-1.0/content/Switch.qml:8:21: Cannot assign a value to a signal (expecting a script to be run)
>          property string onText: "On"
>
> This patch changes the string from onText to onTextstring which was introduced with Qt 5.3
>
> Signed-off-by: Neena Busireddy <neena.busireddy@freescale.com>

I applied this but I fixed the "Upstream-Status" field which was
lacking the '-' on it.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

