Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8868CCFA1E
	for <webhook@archiver.kernel.org>; Sun,  9 Nov 2025 16:00:26 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27284.1762704023479760922
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Nov 2025 08:00:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Hh4L3krS;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-429c7e438a8so1990199f8f.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 09 Nov 2025 08:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762704022; x=1763308822; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FdXr+C3Pl4iSE5EEUrMbSkAYvdYGEWzuYV5OAfT/vj0=;
        b=Hh4L3krSSVSV/lYe8tIlobsMqdWhYciNkvUL9YgcKXbc39GvLbpqqiKLMS99IBIY5j
         dp7VenPEdojc4BLGuAw40tR4P1PX5Ynt7y0CR6VPeDokeE4pzAFdmEjAzlF0XMpqY85b
         FAfegjxT3ceBIate7yuNEKKk0RWmVDQKtSVb1z3lZb2aaba/etREHo+5H0UYm+4VX8N9
         NxF88jHr1JDFP6x6ADsHvHwdRJMwyyJAIoLiLp8uxzAU2cw8pHFPNu7BNjB9Uwk5KphD
         m6WW78Ec/9UnLurjASDmPTQ/c0QeyGEfvSXwOtuwbDNl2NWDKieeFZK2RCjAjAby7wB6
         joCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762704022; x=1763308822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FdXr+C3Pl4iSE5EEUrMbSkAYvdYGEWzuYV5OAfT/vj0=;
        b=XHDJT8DzztEg9m72JkwTbKuNodKu/jp9ZT/n9Z8+nCz2t1vgJ+10sRqpoEh2Sy4ipk
         wxxy1tVFL7vACwrh2EBzvU5CBMY3Kqls9B4/n8Ds6x7mZU7B9/QaxgYXeCZj8xImF184
         Hp86xfoaDfb30k4ImjvWzcDDcyjxpUqr/dyLtwONi1VxnocKS6kKO9WSGkE5HeSn7PTN
         t4j2hoE+23o5oDqtXl9OlS73QbFn5QNOo/XrjAz8Ufpx/3szljHDr+886BXlc7OnUOkl
         gLAY2PhKLyMgG3owcZe6ZLb4Xw686eeMs9fKGflNRunHNBDXMFOq07TQP/T0ne2jRWoB
         eZCA==
X-Gm-Message-State: AOJu0Yy/jm7lKkcv9yK/B+lLmGH+oQxsCPk/LR+YHxm0+q+qmQDztkfY
	WodJFHIZGJsn91cTm2Uhl2IujgvmDDxJWUueli99ZbAZFOpkdJVJ9mPr35VZSbXW
X-Gm-Gg: ASbGnctsosTynFNc5EqHXwI5iWmTLay2XWRuWEmjtsZ9Zkk642VSIje7IJL0DSz9cRJ
	e4YCYTT4NcqqB8vI6hdX+JExW6QtE6pzRL2qtxkSNHAV9AzH+lbj72Wx6wcBgIHOYoaW41opp89
	+zUIwx3LcXZ34Wk5GBJ4phizR8lV3Y1dHnfPF+AihaUUpwq8EgIYt/mn7NeXVTo3+wivKkpbLWK
	6Umz7pq8L0J/x2g09nKuJM7G9M+fmB3l4lJB65mh0DWoilDZ41yugGjIs3B4f8CN5wUUyc832ls
	tEj1qVuBXM6rTINQFDag50u5xcUm1CKWIxW60eZMy+RRf6/PWZDTBg4DgBswRYM/6ydbKmtVLG+
	9PEbbkffr8XnfEVYFkzsYsYP4dTbDel6AA6KKevzcoU0dQlCAvEFsWIiRHRmXNpr0XPw0kUrrOL
	vGF9I4KoZWl78kle/dnGY=
X-Google-Smtp-Source: AGHT+IFR5qZ9f2S1SXoM39dZktqSEm8cKGosBMSBT/2GxW2uDbUT4RHFy9aJjCCPF5o9EVJknxVlLQ==
X-Received: by 2002:a05:6000:2083:b0:42b:3ab7:b8b9 with SMTP id ffacd0b85a97d-42b3ab7bb9fmr696442f8f.20.1762704021775;
        Sun, 09 Nov 2025 08:00:21 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42abe63e131sm17406445f8f.20.2025.11.09.08.00.21
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 08:00:21 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 02/27] libvdpau: update SRC_URI
Date: Sun,  9 Nov 2025 16:59:54 +0100
Message-ID: <20251109160020.2522353-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251109160020.2522353-1-skandigraun@gmail.com>
References: <20251109160020.2522353-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 09 Nov 2025 16:00:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121418

The old repository was moved to a new freedesktop gitlab instance,
causing fetching faulres.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-graphics/vdpau/libvdpau_1.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/vdpau/libvdpau_1.5.bb b/meta-oe/recipes-graphics/vdpau/libvdpau_1.5.bb
index db3c045588..3ee56b0a23 100644
--- a/meta-oe/recipes-graphics/vdpau/libvdpau_1.5.bb
+++ b/meta-oe/recipes-graphics/vdpau/libvdpau_1.5.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=83af8811a28727a13f04132cc33b7f58"
 DEPENDS = "virtual/libx11 libxext xorgproto"
 
 SRCREV = "79f1506a3307d3275b0fdfb2e110c173f68e6f78"
-SRC_URI = "git://anongit.freedesktop.org/vdpau/libvdpau;branch=master"
+SRC_URI = "git://gitlab.freedesktop.org/vdpau/libvdpau.git;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
 

