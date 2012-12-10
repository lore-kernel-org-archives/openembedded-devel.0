Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1Ti1BW-0003b6-Sa
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Dec 2012 12:06:07 +0100
Received: by mail-vb0-f47.google.com with SMTP id e21so2268220vbm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Dec 2012 02:51:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=nrCMOVRQPxSUKoAJkCs0iETOb81/La6jOrmStgOfqrU=;
	b=PeqjNA+hGi1bQ47qHKCPnGzg9OcoYVs+5fOHndq/FwoQnIizQbtHg6M+ZW+kCQTKmC
	9v3aepQkQYLOgIrVhCCR4AHjtKjBqLoNJ2vo/Zc5KJJK+p7yoeOjk8cvUldilShOBem5
	S4mfzQdsQmEQ2Kj8yN3k4LmTUJjLGDR3xxv1P+oHRtGeHxbdHyq3FTd6njOdktoKfX7f
	6FIYLM1dKA3XVxxY/26jhrDEtr+pnfy0gfMO2UnsLV3vpAT8iPUOqZOmCCycWzCWoUPk
	KBXy/4RCccl4miOOXsPD87KmHASBGmUYnV2nE6+/MNpkZbVj4Xe2SZyHPDkerecCAPJR
	6UPQ==
Received: by 10.52.36.100 with SMTP id p4mr7959693vdj.16.1355136695836; Mon,
	10 Dec 2012 02:51:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.102.132 with HTTP; Mon, 10 Dec 2012 02:51:15 -0800 (PST)
X-Originating-IP: [89.121.200.106]
In-Reply-To: <20121210105047.B3BC61033D@opal>
References: <20121210105047.B3BC61033D@opal>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Mon, 10 Dec 2012 12:51:15 +0200
Message-ID: <CAK18fxE0L2riJGvnK9LkZPF=Q7JUxPkKykKFZXwbsm0mnD_G2Q@mail.gmail.com>
To: openembedded <openembedded-devel@lists.openembedded.org>
X-Gm-Message-State: ALoCoQn30WwlLfCKSLBHN+a+Sy2mvvYhNn+awxUTtqgTVdfZ+hgZwzdI1lsrJjEgVRbBzjCQaCeC
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Koen Kooi : Revert "qt4: rename bbappends to match new 4.8. 4 version from oe-core"
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Dec 2012 11:06:07 -0000
Content-Type: text/plain; charset=ISO-8859-1

Any chance to have this merged soon?



*Andrei Gherzan*
mobile +40.744.478.414  fax +40.31.816.28.12
Email: andrei@gherzan.ro
Email: andrei.gherzan@windriver.com
Romania



On Mon, Dec 10, 2012 at 12:50 PM, <git@git.openembedded.org> wrote:

> Module: meta-openembedded.git
> Branch: master
> Commit: 9c2eee256d52e7ee40163542381d8d2691bd5bfe
> URL:
> http://git.openembedded.org/?p=meta-openembedded.git&a=commit;h=9c2eee256d52e7ee40163542381d8d2691bd5bfe
>
> Author: Koen Kooi <koen@dominion.thruhere.net>
> Date:   Mon Dec 10 11:47:42 2012 +0100
>
> Revert "qt4: rename bbappends to match new 4.8.4 version from oe-core"
>
> The recipes aren't in OE-core yet
>
> This reverts commit 421a73c9c3bea13e029cd0505711ef02753949bb.
>
> ---
>
>  ..._4.8.4.bbappend => qt4-embedded_4.8.3.bbappend} |    0
>  ..._4.8.4.bbappend => qt4-x11-free_4.8.3.bbappend} |    0
>  2 files changed, 0 insertions(+), 0 deletions(-)
>
> diff --git a/meta-oe/recipes-qt/qt4/qt4-embedded_4.8.4.bbappend
> b/meta-oe/recipes-qt/qt4/qt4-embedded_4.8.3.bbappend
> similarity index 100%
> rename from meta-oe/recipes-qt/qt4/qt4-embedded_4.8.4.bbappend
> rename to meta-oe/recipes-qt/qt4/qt4-embedded_4.8.3.bbappend
> diff --git a/meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.4.bbappend
> b/meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.3.bbappend
> similarity index 100%
> rename from meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.4.bbappend
> rename to meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.3.bbappend
>
>
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits
>

