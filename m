Return-Path: <samuli.piippo@gmail.com>
Received: from mail-wj0-f195.google.com (mail-wj0-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id B86CB772DD
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Dec 2016 14:49:55 +0000 (UTC)
Received: by mail-wj0-f195.google.com with SMTP id kp2so10161300wjc.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Dec 2016 06:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=dZyphNSH8EF0VoC29cYXBxo1svnXZTjA3+oV9gaiJs0=;
	b=pNVh7zqUAtoF6htoLuo0wZxiSrO9DCRjLxN0fWoBpfmamnmSEdfS2toklw7RmsRat4
	QTltRJ3eAvgEtKPR3K+CrArrySt5//O3koEhrBodbJYsnRy0A4Fok6EUlpy1TYE7CdKa
	f4NSFK+zlflDANyZ3XeXwhZTELSDb3u58ggWcDSWtSYMrdtNTUJOKZBpC7KZVAMAtSJt
	ppk0Vr36HaSzXxaBLdoc3eAh4xx6s0xmFMLqJvHrona+oX5G0n7MuJbLJfiP7zYWJtgE
	8IsjYAOvEi/L7ZEUt5kmMOOCiYUKl949K0X48HEtOyUgFshgIlzRcqxkt2IryTpJK5vF
	U2oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=dZyphNSH8EF0VoC29cYXBxo1svnXZTjA3+oV9gaiJs0=;
	b=YSTyHM/VsNmeoruPdlt7ZcCuYdEXNYsJWdrwRIAdjpRHoKfGz2AxRyCUL+VPVRYMjk
	nXqcfEdZh90kJagSahsR16S/1TyH97nwVD3HNwAfvF5XDpiMeGcbgzfKT2y+tIIYivtw
	9QPDeNNK0FiyXsgVdbAt+COMVqLRAgCq6e6rkwIPXFmkFTF6W6r5WBtaYRDOUURmtK5H
	X4/rPUMeMxYttvfwa9+qAj2PNT8TxXBJXXXdQ0iGcJMFFsP9knEkrpJHZviWOKGssSQ3
	6HmgYEcDReh8chv5m5P9tm67qbSGRP8d/4G2UVlpBYYZeQx7EoLhB+AZcavK8ik9M+nu
	FpoA==
X-Gm-Message-State: AKaTC00reM6sE7qWmBwx20ym/Brf7VRL/0Pvx2piCczqAKp09brYkW9m3IsLdPgyGtBxXA==
X-Received: by 10.25.152.142 with SMTP id a136mr558377lfe.113.1481813396798;
	Thu, 15 Dec 2016 06:49:56 -0800 (PST)
Received: from [10.9.21.21] ([192.89.120.53])
	by smtp.googlemail.com with ESMTPSA id
	a79sm510193lfe.48.2016.12.15.06.49.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Dec 2016 06:49:55 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <1481809716-24451-1-git-send-email-samuli.piippo@qt.io>
From: Samuli Piippo <samuli.piippo@gmail.com>
Message-ID: <d4453d09-2112-0a1e-2812-0c63c932ca6a@gmail.com>
Date: Thu, 15 Dec 2016 16:49:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <1481809716-24451-1-git-send-email-samuli.piippo@qt.io>
Subject: Re: [meta-qt5][PATCH v4] Upgrade to Qt 5.8
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
X-List-Received-Date: Thu, 15 Dec 2016 14:49:58 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Changes from v3 patch:
- sha1s updated to expected RC content
- fixed the qt3d assimp build-deps issue
- the new Qt configuration system taken into use where applicable

webengine build problem with x86_64 host and x86 target is still there.

-samuli

On 15.12.2016 15:48, Samuli Piippo wrote:
> The linux-oe-g++ mkspec is changed to use $$(...) operator to obtain
> the contents of an environment value when qmake is run instead of when
> Makefile is processed. All OE_QMAKE_xxx variables need to be exported
> for qmake to find them. configure's setBootstrapVariable function needs
> to change $$(..) to normal $(...) operator to work with qmake's Makefile.
>
> qt.conf generation for qtbase recipes is not needed, as configure will
> generate its own version based on configure arguments. Skip running
> qmake, since configure is now automatically invoked when it's run in
> qtbase's root folder.
>
> Update PACKAGECONFIGs for qtbase to match current configure options.
>
> The new Qt configuration system [1] can be used with a new variable
> EXTRA_QMAKEVARS_CONFIGURE, which takes both command line and feature
> arguments.
>
> Merge the two qtwayland recipes to one that supports all three targets
> (target, native, nativesdk) without need for additional patch.
>
> [1] https://www.mail-archive.com/development@qt-project.org/msg25257.html
>

