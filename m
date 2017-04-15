Return-Path: <sadlife1990@gmail.com>
Received: from mail-ua0-f181.google.com (mail-ua0-f181.google.com
	[209.85.217.181])
	by mail.openembedded.org (Postfix) with ESMTP id 7416177357
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Apr 2017 14:24:04 +0000 (UTC)
Received: by mail-ua0-f181.google.com with SMTP id q26so57306164uaa.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Apr 2017 07:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=8D7BjNr/F86U1kAy94xsdYA+L1jDVz/4V+aMKHzak+s=;
	b=UebAm6lqdcVBIhxAFnYyg5GOfuJe5DMIDX3bE1r/oX4sbrscLUXafpesMF0+zOlnvw
	J0P7CbB86c9qxpeOtxbzgG/NUIzymEjGxfOxFij2gFh4/CTvm0j7TNJ5DCkRi2REvmPw
	PIcw7h4fvSAh+B0f+JWRXoCn9m2m/oIHPMICOjlk68I/xKmfYKxdd/YdzR4yNQF9+T41
	JI9KwENzirEoUZupLQtcNIhI12R9OMV86p7fG+H+sduhJ6T+DoHqA5ULhuRHhXWAdYWN
	hp+i+0UDvsVa2g49epiAmSPHJemc8mPvSfaa6+hmUGoRsC8sEv3fEEE09LWQRjlQ1wHk
	cdgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=8D7BjNr/F86U1kAy94xsdYA+L1jDVz/4V+aMKHzak+s=;
	b=gqW7KGjaC3mX9N7pbXEZ4F5ZmWMsK5iytpKJwguSJST3g6Sqcb3d41Pe4Igdh8O04/
	xn36XHir3g04FZrrCGJQFjaajwG1o3MceNXKUZKStr+yr6QGlb0wOELhKl1NIBUzS/sL
	4LEVVeQx3xvMzK7Rt3C+AuO3rw/j2QCCwBjTEwWkn5A3g1IxWqQDLQhAgGJpSjBi+Umz
	ccEUXmPEqYWyqWZHJa8mrI7vFo7bEK2BEaoFad7RGkFKMsKB+hSYkoAAS+WAIg1jAtDg
	fPiu1QMlrhxRmvP5ROKkr9t/XVuXaRZJmKUiekW8r681PouqxMoXU/n5lraYoqU22NTR
	ogWA==
X-Gm-Message-State: AN3rC/54sptdOOBb4uUNYqGi5G7lBk8Db0CyO6dTCDL15HRaDGPQq9jz
	jq+iA0Cf9l4lAeVXXwXTTvPd12P/Fw==
X-Received: by 10.176.67.97 with SMTP id k88mr6243599uak.5.1492266246088; Sat,
	15 Apr 2017 07:24:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.32.105 with HTTP; Sat, 15 Apr 2017 07:24:05 -0700 (PDT)
From: Life Life <sadlife1990@gmail.com>
Date: Sat, 15 Apr 2017 17:24:05 +0300
Message-ID: <CAAHuHfxQbRCgC6fRJo1R=oM11duYh+zzWTZ=J-NTUQ7W_yhCzg@mail.gmail.com>
To: yocto@yoctoproject.org, openembedded-devel@lists.openembedded.org
Subject: Static Lib build.
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
X-List-Received-Date: Sat, 15 Apr 2017 14:24:06 -0000
Content-Type: text/plain; charset=UTF-8

Hello,

I'm try to build static library for SDK.

Update the build/local.conf file with the following information

SDKIMAGE_FEATURES = "staticdev-pkgs dev-pkgs"

INHERIT += "buildhistory"
BUILDHISTORY_COMMIT = "0"
 BUILDHISTORY_FEATURES = "sdk"

But cannot create static library for SDK.


Thanks.

