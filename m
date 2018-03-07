Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id EDE6D78A26
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Mar 2018 19:01:28 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id f23-v6so1860172plr.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Mar 2018 11:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=+4qjkGU8LQ9L8ZvzcSM+YBPKGUQZe/Bvcn95OqE2GpI=;
	b=bg2SxkVZ+JWCpku1qw6uPbIvi6eq42+1yNQXMThIT2oKvrDEXXGFH19liicn6TqPTh
	v1LZpCA1pXH8euz4hWhP3kc81kTcFG2z/Jb5i+qxL8V5xjwV28ZbFbci4Wvr9aDGbags
	UUJbLdxcWi2dhAaOkLCM5GwwMrjB1WVoXfNaoIVlBcuqmDl1nRvr6DwQEM2kGCbEntS8
	6NNCU7H9KD4b8oymIyeRfdjcUkufe1xVaGfFbuUpYKGCu4SLewCbGB4PO49fCRS2XxPh
	cJdUkS52uBbV835CDY08gU77vpZwe7jFu0k09Qbeoe4L6+KYs5ePZQ/bHXbrMctdjn3l
	Hsxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=+4qjkGU8LQ9L8ZvzcSM+YBPKGUQZe/Bvcn95OqE2GpI=;
	b=fIWzdFXo4b5es07Gi0C9dZlWOo7SX/3uue21jwFwZU0gARUzS7OCeb9ur5WMD1BlCd
	Cr3DeZOE4HyJ+NekbXPhYoRJ2X5aR8mhWaJi4zdGY3bm9jmP4T93I3zTDjSIdhEFYrtD
	zvSJC8YdCMp2fWL6vPhHStIla0Ly9R2wgx+AU8MZ55RiulAhRbge63lFDd0AY88CkWdZ
	jvqmbTx+nw3BR9E32XA3Y1sU2R+Q0BofgZmkUaAEG41a2G4zPoFH1BURRELknQZCc4uN
	rAoTfp1/JCTbgIjKXdkaw+PDjBKrEdjoN5Oe/UfoMgsAUv1TOMDTmZ3iMR4+8IWJ4232
	0I6A==
X-Gm-Message-State: AElRT7FVNEyN998cqKOPEzuV1jvQwn61yf7mUJaDxPY1n7oT+m4UJpeG
	w7z42aH7QYs/JChyzwyY5DWIuQ==
X-Google-Smtp-Source: AG47ELsYTSGf3f0pGaw8bWxSp4EkW4dv2oNbNFfuYGj7Y2iAeDo5/T1zx2KrKo/PLQabUBZmn/yD0g==
X-Received: by 2002:a17:902:b713:: with SMTP id
	d19-v6mr17952683pls.91.1520449289659; 
	Wed, 07 Mar 2018 11:01:29 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:6d76:b853:98d2:431c])
	by smtp.gmail.com with ESMTPSA id
	s67sm36835461pfg.104.2018.03.07.11.01.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 07 Mar 2018 11:01:29 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Wed,  7 Mar 2018 11:01:00 -0800
Message-Id: <1520449275-29492-8-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1520449275-29492-1-git-send-email-akuster808@gmail.com>
References: <1520449275-29492-1-git-send-email-akuster808@gmail.com>
Subject: [meta-gnome][PATCH 08/23] libgnomekbd: only include when x11 in DISTRO_FEATURES
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
X-List-Received-Date: Wed, 07 Mar 2018 19:01:29 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-gnome/recipes-gnome/libgnome/libgnomekbd_3.22.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/libgnome/libgnomekbd_3.22.0.bb b/meta-gnome/recipes-gnome/libgnome/libgnomekbd_3.22.0.bb
index 12ed81d..40249fd 100644
--- a/meta-gnome/recipes-gnome/libgnome/libgnomekbd_3.22.0.bb
+++ b/meta-gnome/recipes-gnome/libgnome/libgnomekbd_3.22.0.bb
@@ -6,7 +6,9 @@ SECTION = "x11/gnome/libs"
 
 DEPENDS = "gconf glib-2.0 libxklavier gtk+3 intltool-native"
 
-inherit gnome gobject-introspection gettext
+inherit distro_features_check gnome gobject-introspection gettext
+
+REQUIRED_DISTRO_FEATURES = "x11"
 
 GNOME_COMPRESS_TYPE = "xz"
 
-- 
2.7.4


