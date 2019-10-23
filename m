Return-Path: <misla011@fiu.edu>
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
	[209.85.222.180])
	by mail.openembedded.org (Postfix) with ESMTP id E7B887F8A6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 21:00:57 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id a194so17159789qkg.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 14:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=fiu-edu.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to;
	bh=Luhzf8iGeWCF6DTbh3aPHFC+yV7uP4E/8+E2sXlO4SI=;
	b=ILYM7fzTKeuoT2urbgTuxeo1fSkM5gWk4ZOQ2Ff0XHNhHpzAwBDIx5BCSfNk2crE2o
	VlznhjKQLn/PUOCBCX3BcPHQ32FFyuS8G5HE3RwT3Oduv1oN10KaOqX674sxrQFj9sAG
	GvRtztrQKrqyPOjoULP+1VrCr8rq/pugAc/sXYOjSaLgMxwcPEnlkMlJ4Sf52pMGplYA
	4dz6cSqDovS7FKwoxFk04h4Pxr0heBmqsxt8zq2Et+jKSKk6e44bLY6fLr8N6qkkFkMx
	KDQdX+15AuT1bWwpBfQ4e3LXmC3HWAQ9Tm8q4dxtR8uf6gWZ0KQNWcwu7W5ilQkSz7Ce
	lfuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=Luhzf8iGeWCF6DTbh3aPHFC+yV7uP4E/8+E2sXlO4SI=;
	b=mnX7IiIgYy5Edr8UkcFdh8gl8Pjurnq7f0SRzvDBUXzridAKNSbJuZy5XThVKYM96t
	WDrBNNozD3Vw3ksGKtv3LcVI1IdUiuIhXrxSEXd2aetQRkkpQGhoB9QQ8tWy8GCWlYsq
	DlvOchAz/iWGHY0jz8snDgH+4hwnkHcQKI7/YAt72KxWXiUFasZj2xz/04RG2KFC8poU
	Vh7dttx3okpykOFgKlV/4FpDkJVrm0Exe0VVK73DVqO/UL6Y6kMQq58Tqv2NtbQLFLQE
	x6UL8fj7MvI479l87Bh12rLuFMzrd0NKUFzJM2ruXihS8qnEfx2qhpjyQazhw6UJOFzc
	gIYA==
X-Gm-Message-State: APjAAAVABN5e2pXDokKRNKzqd0qbeK+OvhmMg0TleIF9ZE4hZwQgnWsm
	zng4TGEKJxLYuwATQfFMTXrnTucQRraXysILXIeY+MGI5BI=
X-Google-Smtp-Source: APXvYqzqy3mpWGtmIbBHr0WJS3BbaXkYzpNYYF+MU6HW0xhc0CrJCbvSr2GgVSKXYwlfSlgTY/v2gJ3iObcijxOEIlY=
X-Received: by 2002:a37:85c5:: with SMTP id
	h188mr10407275qkd.191.1571864458227; 
	Wed, 23 Oct 2019 14:00:58 -0700 (PDT)
MIME-Version: 1.0
From: Muminul Russell <misla011@fiu.edu>
Date: Wed, 23 Oct 2019 14:00:47 -0700
Message-ID: <CAK=B8ybAAncCAZ_EAGiH6+u5-cYYKPAwfJhxTi0Gj6Q8JfeZrA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Build info in the spec file
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
X-List-Received-Date: Wed, 23 Oct 2019 21:00:58 -0000
Content-Type: text/plain; charset="UTF-8"

Hello Developers,

Yocto can generate spec file for rpm packaging. But that spec file
does not have %build and %install macro. Is there any work done
already to include those 2 macros? Or could you give me hints how can
I do that?

Thanks in advance,
Russell

