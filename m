Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f177.google.com (mail-we0-f177.google.com
	[74.125.82.177])
	by mail.openembedded.org (Postfix) with ESMTP id A7A2B6D2FD
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2013 12:27:04 +0000 (UTC)
Received: by mail-we0-f177.google.com with SMTP id x55so3696419wes.22
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2013 05:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=Hj8eP8HoVL8UYaxWinYNXBi0XpkbWAOTKo2G+M4MCCM=;
	b=Y+jyWbDOoW6ZK/GK6LHLJsTUgJ7JvKhAn1jq33BM12+oWdniLq2ggP9FY9xljevG7W
	o9yoR+YRqI6cZConx0hzZgRCOGdN2o8GbgTpMIy2s66C/ANr92n2hNCKros6SatlGNnz
	LeRkgbXsgLwwQtlGtTnaQMBJ5mwEP/SKLajGhEneCpr4d1/GWq+66TGK+2QY0hBiNIP0
	wVLqCEG9LXuJI+unBoWw+aqcK4fRBOUYPtXlrjnaWzrBr9sIj6uE133vQx6lGRWUIzVg
	1i44bnTUfRcetRDXJwszz1EZ1M1C/O+yKHicUDrYbvigC/YFgKImVPc7Z0Eyqt9m+wAZ
	3Ieg==
MIME-Version: 1.0
X-Received: by 10.180.160.203 with SMTP id xm11mr2283040wib.17.1382704025233; 
	Fri, 25 Oct 2013 05:27:05 -0700 (PDT)
Received: by 10.194.179.198 with HTTP; Fri, 25 Oct 2013 05:27:05 -0700 (PDT)
In-Reply-To: <1382626867-8287-1-git-send-email-kristofer.hansson-aspman@pelagicore.com>
References: <1382626867-8287-1-git-send-email-kristofer.hansson-aspman@pelagicore.com>
Date: Fri, 25 Oct 2013 14:27:05 +0200
Message-ID: <CA+chaQctmZwgH9FkwMiwp6-X03-aF-Qa_ZJ37A4EKxwH-MO2cg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-qt5][PATCHv2] qtconnectivity: Added recipe.
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
X-List-Received-Date: Fri, 25 Oct 2013 12:27:06 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 24, 2013 at 5:01 PM, Kristofer Hansson Aspman <
kristofer.hansson-aspman@pelagicore.com> wrote:

> diff --git a/recipes-qt/qt5/qtconnectivity.inc
> b/recipes-qt/qt5/qtconnectivity.inc
> new file mode 100644
> index 0000000..50efd46
> --- /dev/null
> +++ b/recipes-qt/qt5/qtconnectivity.inc
> @@ -0,0 +1,4 @@
> +require qt5.inc
> +
> +DEPENDS += "qtbase qtdeclarative"
> +DEPENDS += "${@base_contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '',
> d)}"
>

what happens if someone builds bluez before qtconnectivity even without
bluetooth in DISTRO_FEATURES?

I guess it will behave nondeterministicly, you need to explicitly enable or
disable it based on bluetooth DISTRO_FEATURE, see qtmultimedia.inc and
PACKAGECONFIG.

