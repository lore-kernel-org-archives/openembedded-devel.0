Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97868D10379
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 20:36:14 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web11.6072.1729801142938844942
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Oct 2024 13:19:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CK3E6Djx;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6e5b7cd1ef5so13663007b3.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 13:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729801142; x=1730405942; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oLZezAluDyWhlF+UqafCLYvuVRXZX5ddDdl7MWkRr7Q=;
        b=CK3E6DjxeYwjK7OtzEonyzuyZBW9VlN7MSf45WC8EJpNVDKCyv4IKBOZgelSl2kljz
         KXizy5QzV68M7PRPbqyzkOL53W17/lUTf4+zzafG3u1ALaIEAF9ys1iA5GQSIQEB+u0/
         90KwFJfxMFaaKU5w98bLNIIOg/8PwM7ZFM6h9igHaP8VwC1kQpAKxqW7st5JNDHvG/Ig
         6/wWDV8vePUPG/W3/Bn2r2r3daD6sC5N2Q8kffmr9f/jYLBnDjtnDgLdtGMP85srABP9
         sCkNKytMiQ+GNMf25uFo0w1QD87OlRAjkI/Asu9Rvr+BV5ikQ21wXsUyZOFpjbWWtwqF
         v/3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729801142; x=1730405942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oLZezAluDyWhlF+UqafCLYvuVRXZX5ddDdl7MWkRr7Q=;
        b=uO9NQYt7z8dQad1ls+N22jz1df7pAcays46GvFsWLtrTWh9fRbuVGf0gF3g8byWhhn
         umSCu+8Fvm4ez0+hUq3HomM/rxMjreFkULAdUvwS9ct1mdGl+6bZHNYChCdtPHw0jWuV
         lGVwBu7s6yIKjIJHQfMJ1+qae8Gt6mZWkooRcT2XWGgVnzlQU457JEg/+/hwkHIRycmY
         D3cl3Y2MhM+phZlPtmDwIaJom+z1FAWMzb7fET8DPz2r8nTGtoqEYOjIlutSHf5ZL57w
         wiW0gTskzJDmw4L62okw85jwU8eFb27eLhwfau7UsLG044CpI333os/jgbeudkFDHgRr
         gCfg==
X-Gm-Message-State: AOJu0YyXP27pn0leGaPc0jYfBDB45/874RIg8sWSzOh76hO3D79Ozr5f
	M1B8Y+NeucT3QmGpKZLyqdKrRJAUgLSCG6JUAr9up3qVjV8PUWjxgLViAw==
X-Google-Smtp-Source: AGHT+IHvdmmfMym4nJdksQxop3gjXv3alimjI+2Wsuut1weSelJAB+XBdBZII/JyDSH7owDM01e4hQ==
X-Received: by 2002:a05:690c:c18:b0:6d3:f9a6:e29c with SMTP id 00721157ae682-6e8581642c2mr41947797b3.12.1729801141495;
        Thu, 24 Oct 2024 13:19:01 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f59f551csm21484897b3.10.2024.10.24.13.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 13:19:01 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 13/42] libextutils-cppguess-perl: Change references to search.cpan.org to use metacpan.org
Date: Thu, 24 Oct 2024 16:07:32 -0400
Message-ID: <20241024201806.440273-14-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241024201806.440273-1-schonm@gmail.com>
References: <20241024201806.440273-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 20:36:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113191

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../recipes-perl/libextutils/libextutils-cppguess-perl_0.27.bb  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.27.bb b/meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.27.bb
index 45b772650..c7accb317 100644
--- a/meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.27.bb
+++ b/meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.27.bb
@@ -6,7 +6,7 @@ It can generate the necessary options to the Module::Build constructor or \
 to ExtUtils::MakeMaker's WriteMakefile function."
 SECTION = "libs"
 
-HOMEPAGE = "http://search.cpan.org/~smueller/ExtUtils-CppGuess/"
+HOMEPAGE = "https://metacpan.org/pod/ExtUtils::CppGuess"
 
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=81;endline=84;md5=84c0390b90ea8c6702ce659b67bed699"
-- 
2.43.0


