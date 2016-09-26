Return-Path: <samuli.piippo@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id A0B2660796
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Sep 2016 05:54:16 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id l132so12303807wmf.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Sep 2016 22:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=0hg8tSD7DT6IS8BoLajR8etmMCJT2e06Hk+UIilQEBc=;
	b=BETt1ydvieMr7foczjVpIfA2G7Vg26hwrz3S+Qjlrw29NqOmJhNT3QVNWs/iH0EpS8
	ebTtJdGjIZAxHkpnwBdnK/h7POjGOilGIxXYzNoFxWbnd9Hn3vZli1TUn/ArtHV19Cqh
	KwsM63LdTAR1hndRvcCuFe8MRz6NXsZOE/qcqjYrIGXx2esLmQkaQoDTN0cMd493Vq6x
	NZkqluVN5Eva0nLhnOqdQiqFmjVLmhrNd0FK5H4qdb1omT8LyO1+wpE/lQyIbG+1UWnD
	giffxOMrJz6jgJVSTLtJSMLJHusFQ3Iu5l3XpsxVSET8Z6UezAeiRNag55nFHULV+Fkq
	430A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=0hg8tSD7DT6IS8BoLajR8etmMCJT2e06Hk+UIilQEBc=;
	b=jRdpaPJKsHOLuKbqCe/ATPr4hUBQmgFAT1oQfrH22lMmH4XZkSx1WSc1xYvogj5u0O
	CwoPyMXvK+eqBVFg+63Md69zrY+egg1AesnC7N0WoVxkKhTPg3ru4z4RCnebbTrxfja2
	8QKPDXEqYl65FCSscEvAdeEY/y8nyXzxdxw+xe5B6abi7e3neZWn5fiYcLk/VxHgLB7c
	gaYGGfC6JWq2/EfQpTbjqXralekmb0cIxxfKjzW0hixHAIeWRIO6DEN5KM1MJlkfXJDm
	vLpnXg6LF0ZGtr/9MVwaXpt7eKW5SLup0AkOqO6NerkEq80Lu8/bHX4D/I2zS2GFsDaC
	nQ7w==
X-Gm-Message-State: AA6/9RmWnGHiT7IzfGlsynKAkWYKQ3mabnnxzPZddaJCHg+z6kH7n9QuLnVJ8nTU/Ndv7A==
X-Received: by 10.28.50.199 with SMTP id y190mr13183638wmy.61.1474869256892;
	Sun, 25 Sep 2016 22:54:16 -0700 (PDT)
Received: from [10.9.21.51] ([192.89.120.53])
	by smtp.googlemail.com with ESMTPSA id
	bl3sm20375785wjc.26.2016.09.25.22.54.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 25 Sep 2016 22:54:15 -0700 (PDT)
To: openembedded-devel@lists.openembedded.org
References: <1474790089-17176-1-git-send-email-dachaac@gmail.com>
	<8b791747-fcdb-93e4-2941-f020722f03ef@gmail.com>
From: Samuli Piippo <samuli.piippo@gmail.com>
Message-ID: <e6052030-7344-9698-7f0c-6e1b9293c7af@gmail.com>
Date: Mon, 26 Sep 2016 08:54:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <8b791747-fcdb-93e4-2941-f020722f03ef@gmail.com>
Subject: Re: [meta-qt5][krogoth][PATCH] qtwayland: Fix building of QWaylandIntegration if some Qt5 features are disabled.
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
X-List-Received-Date: Mon, 26 Sep 2016 05:54:16 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 25.09.2016 12:37, Vesa Jääskeläinen wrote:
> On 25/09/2016 10.54, Vesa Jääskeläinen wrote:
>> QPlatformIntegration's interface methods are disabled based on
>> QT_NO_OPENGL,
>> QT_NO_CLIPBOARD, QT_NO_DRAGANDDROP, QT_NO_ACCESSIBILITY and
>> QT_NO_SESSIONMANAGER, these has to be taken into account when compiling
>> QtWayland.
>>
>> Signed-off-by: Vesa Jääskeläinen <dachaac@gmail.com>
>> ---
>>   recipes-qt/qt5/qtwayland-native_git.bb             |   1 +
>>   ...g-of-QWaylandIntegration-if-some-Qt5-feat.patch | 156
>> +++++++++++++++++++++
>>   recipes-qt/qt5/qtwayland_git.bb                    |   1 +
>>   3 files changed, 158 insertions(+)
>>   create mode 100644
>> recipes-qt/qt5/qtwayland/0001-Fix-building-of-QWaylandIntegration-if-some-Qt5-feat.patch
>>
>>
> FYI: I have sent upstream PR but no response within a week:
> https://github.com/qt/qtwayland/pull/1
>
>

FYI: All commits to Qt modules must go through Qt Gerrit 
(codereview.qt-project.org), github is used only as a mirror.

