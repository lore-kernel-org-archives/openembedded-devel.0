Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48494.1795411801056798468
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:30:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=qrIKJEih;
 spf=pass (domain: gmail.com, ip: 74.125.82.177, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-38190551625so6113770eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:30:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411800; x=1796016600; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5OVZB1GOhTrGdE700weTStT5CYiFfdgl04n1lnm4q9o=;
        b=qrIKJEihGZjV5DsoQzJvUW+awwi/E9PIvz7R6BzMNM3YJp4acFXXNa4wBehZxzz4Dt
         qgIehhGLKROESZpE8PrRXLUezsQ4IOIvmeVA/qnKxAf4QdJXxNCIV7hOudXbC3pSdolw
         QoDnMsgPtH72q4kphVzxLN8lG0gEoQ3M0xkVYByPLNHFT2a+F8yPDGSZdgXdW37++65F
         gOHeO1Y20Ctdftuwvf0mHP0X2dPSxDQYmezxQAWiaIQCMCPzOQ7Fru4VuIu6OJr48sH6
         nuQhxqR7xwd5HibChmxsGAzToYtD4DV2OLT8a/5j978BxkCC35EbA5UPeLAhNJ1qCDXD
         r3kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411800; x=1796016600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5OVZB1GOhTrGdE700weTStT5CYiFfdgl04n1lnm4q9o=;
        b=oq4Ogcx9QTwB2j0PEJNJuhmvXeZg8bOl3x+uAXavqORELcR38ixpOtujxBdpjIzr1+
         m4BHjE0HJsUtBKnJ3TV9vyF/Ijfp0dS2Ee0rJdawyGUKGWwvvfluF/lfqmjOTZUQBEfz
         Dm8ILITXFFfBa8fI/7y75aN9oisP3dUHIx1KKE4U2iDXiabNWkLR1059fWY/k40U9Mue
         rYxNigd0CmTzWSt3B4PlkJ90MaZtvuyoasSOjDF1xj/JKA3ImceF0RuLOaiVerVL1JvR
         vzPwjXF6RqK3GkJc5vvyapSvCGN1ABLNV7GupYJVBUuyvNSFWaT5XaJaj7PENz2r3vxF
         SqqQ==
X-Gm-Message-State: APuU4Z+sX3IQHbCbBgg+BYEB14QmrMexrLZmUCZXJSv+BglDj9rjJHcO
	BkvlMMvDpCF5ZXBj7FrVRNd5I1vkwj7lpjwndZZ+tVfZfAUq3JZRIq8xpGX1Sgq7eeY=
X-Gm-Gg: AZFdTZcCxFlKqc6H4vMKo5UnYOeIRoNj6wmlalem5OVkf+/zHHsLkp51klu7Gad0cLg
	y+to0dAf01XRBEBx06l4PSjaKhGeJXUKwbqbX8fZiw5F5amOEkrQ+yITSshpTF4vxeVMe6gqmpT
	kviisxpQvmQG2Vwd2iWj40Drzl1LHQyKVj5u6H3kTd0QTojuX0ANw/bsP6vibSfVY50Av1qtUWQ
	Yd1oDh7ujxrYesyUgLzfH9C0uaai4t2bXTQOtSVwDwXFhk2rJNPO9cbal1ohKnv69C4nt9cmQmj
	rajbY3XJi2EkviBWYiv6fe/YxZsm1Yst9Xg2mPHCsgwBGADdInvtNZ5fxnfJjR9TzdlKAR1jMs0
	uAIgi20XsKh6fnHWLZUBpSCXex5jUYu9StP69UNVEAZF5KqXQtRBzZvkjU43Xm6ThhOATVC+m3F
	0fUUWkXghi80Jb/6Wq2822TH9fGZwk+hwAWj41QRoU/15zxtoJVuS6wJMONX1tv/oHCnPpGbftR
	Mn9ItBFKLOeic2qhQ/bNKEF6IGDeAJFMKBMAb3JJIPeV4S5a1VP4E+2Gt8qPMhZQ7vOzPRSJS55
	FFFw4Kmnh2wT6QLfBV5xY5bcXpywmzeXKwM8nX/0MrzdxjxPZ9aTvW5ypf5VG6bhjFv5wzSoeRv
	eBrYJp9QnlpWzmaI/0/ZH1NW4rVCa4EPVHWlss1JhP+XK/U1xkIs5TfOExaX+Wi0HoAdFgnWs+h
	XMMjI0avhqaxto67RifRPH23+73SmVNUC6GdoX/B6ZdoQ1kS2brSwxg3rrbT2JBXh2z3lUi9QJm
	IWiCA59CRjUv+18UC2up5TOivkayNAFl5rQbhcJdtDsBJC8qt0D/mFqmfWf0gilmhjE5fHZK+67
	PIo3
X-Received: by 2002:a05:693c:8042:b0:379:8df3:d2c9 with SMTP id 5a478bee46e88-3856f14ca78mr11827703eec.13.1795411800291;
        Sun, 22 Nov 2026 21:30:00 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:29:59 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-gnome][PATCH 0/5] Recipe upgrades
Date: Sun, 22 Nov 2026 21:28:20 -0800
Message-ID: <20261123052953.3658549-4-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:30:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132791
Content-Type: text/plain; charset="utf-8"

Upgrade convey, evince, gnome-online-accounts-gtk, gthumb and libgtop.

Tested in Yoe CI with world builds for qemuarm64, qemuriscv64 and qemux86-64 and
ptest images for qemuarm64 and qemux86-64, each with glibc/systemd and musl/sysvinit.

Khem Raj (5):
  convey: upgrade 50.2 -> 51.0
  evince: upgrade 48.4 -> 48.5
  gnome-online-accounts-gtk: upgrade 3.50.11 -> 3.50.12
  gthumb: upgrade 4.0.2 -> 4.0.3
  libgtop: upgrade 2.41.3 -> 2.41.4

 .../convey/{convey_50.2.bb => convey_51.0.bb}                 | 4 ++--
 ...ts-gtk_3.50.11.bb => gnome-online-accounts-gtk_3.50.12.bb} | 2 +-
 .../recipes-gnome/evince/{evince_48.4.bb => evince_48.5.bb}   | 2 +-
 .../recipes-gnome/gthumb/{gthumb_4.0.2.bb => gthumb_4.0.3.bb} | 2 +-
 .../libgtop/{libgtop_2.41.3.bb => libgtop_2.41.4.bb}          | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)
 rename meta-gnome/recipes-connectivity/convey/{convey_50.2.bb => convey_51.0.bb} (95%)
 rename meta-gnome/recipes-extended/gnome-online-accounts-gtk/{gnome-online-accounts-gtk_3.50.11.bb => gnome-online-accounts-gtk_3.50.12.bb} (94%)
 rename meta-gnome/recipes-gnome/evince/{evince_48.4.bb => evince_48.5.bb} (95%)
 rename meta-gnome/recipes-gnome/gthumb/{gthumb_4.0.2.bb => gthumb_4.0.3.bb} (92%)
 rename meta-gnome/recipes-gnome/libgtop/{libgtop_2.41.3.bb => libgtop_2.41.4.bb} (85%)

