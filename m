Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web12.48665.1591047934833482548
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jun 2020 14:45:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=utnyBOIm;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id x13so1329657wrv.4
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Jun 2020 14:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=tCJZzzN+u/FflIKn6rNasEZfZWuoqK549dflIBjKaF0=;
        b=utnyBOImRFzfSe7RO5yKxayEqB7VAtJ8ibQNERxrIjFWZsstH1fU5p5ZoKYh2i0FJ4
         IjFkmI44aZZaFAZO7DbsrApS1DiQT8PJbP2lbquzT1MnLVQPfnOmqEdTDtkwi5s80f8n
         qyi96GiOkI96zbgCGwGkVBLvMmgNQDqmtiIsWIL/Uk4Ncxf9MSJyzGrXDgwgx+gfMC06
         30/9KR88QAPm028WyCxYTnOvmyXdNEcynyR+7k0zvjqOkQuWnIPSLaGATBjwhkr6B3mM
         uG9crrVOrhoPizr7NjJklBN67Bbklnnt3BG0ZI8ORcGEGJWu9Gqk1mposF8yQbrgy1yi
         OfSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tCJZzzN+u/FflIKn6rNasEZfZWuoqK549dflIBjKaF0=;
        b=MnVjiSDZIN5qnNig9qGlTuWyk3G8SJXDQGwMtlBe3Cbqcq7riwzn7VtkQqkNITIDr5
         usR6e2mwBZmOwFqZ4SBvv65D+PgXYrw4HMDK8q2Ep0FYyBfpM4L7KpW6MC3T4mnUjEA6
         H0lSM75S/GladzE9s+MdIJOba4uTkqVVjsVd+T1f44V4n1e8dk+G9qN+T/+sU53MlI5K
         YmHma7vpv5dUqA7xGkEu17+FsxzCvFC7mIta2Zect/BlrHrGKz8QCOEOVEwmjHNSwXVR
         qUo3v3d1SCMhV1eqmm1w0RK4+Cg6dboYMeZU77bhZCGsMmYJReazBuxfhfVJ+x1SKm/9
         dCLA==
X-Gm-Message-State: AOAM531nrJGIiD/rhJd6Vu26UaJXBbfQc5jOlA+ssGnUM48RTLaAhnQp
	gNCaJ2eIosPgA8QPHREutoKXLXT+Kxc=
X-Google-Smtp-Source: ABdhPJyMHvuJoc4Uk7U+yPzRWjkSPKtwHNXc7CNIgyOlWJS3hKwGVEDXIASFZT3pEzgptJK0jNmaAQ==
X-Received: by 2002:a05:6000:1c8:: with SMTP id t8mr23338104wrx.200.1591047933203;
        Mon, 01 Jun 2020 14:45:33 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f06ad34da2c69d11ac2eac0.dip0.t-ipconnect.de. [2003:f0:7f06:ad34:da2c:69d1:1ac2:eac0])
        by smtp.gmail.com with ESMTPSA id 40sm1050119wrc.15.2020.06.01.14.45.32
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 14:45:32 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 05/38] dconf-editor: upgrade 3.34.2 -> 3.36.2
Date: Mon,  1 Jun 2020 23:44:43 +0200
Message-Id: <20200601214516.26624-6-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200601214516.26624-1-schnitzeltony@gmail.com>
References: <20200601214516.26624-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

dconf-editor 3.36.2
=====================

Some fixes for the now HC theme.

Translations updated:
  Latvian: RÅ«dolfs Mazurs
  Romanian: Daniel È˜erbÄƒnescu
  Slovak: Peter MrÃ¡z
  Ukrainian: Yuri Chornoivan

dconf-editor 3.36.0
=====================

New stable release! Contains mainly translations updates. Great!

Translations updated (since 3.35.91):
  Danish: Alan Mortensen
  Dutch: Nathan Follens
  German: Tim Sabsch
  Greek: Efstathios Iosifidis
  Italian: Milo Casagrande
  Japanese: sicklylife
  Korean: Changwoo Ryu
  Polish: Piotr DrÄ…g
  Slovenian: Matej UrbanÄiÄ

dconf-editor 3.35.91
=====================

Just a translations release. Note: the announce for 3.35.90 only
credited one translator, while there is a long list of them; not
sure of why it failed. Check the NEWS file for complete credits!

Translations updated:
  Basque: Asier Sarasua Garmendia
  Czech: Marek ÄŒernockÃ½
  Finnish: Jiri GrÃ¶nroos
  French: Claude Paroz
  Galician: Fran Dieguez
  Hungarian: BalÃ¡zs Ãšr
  Lithuanian: Aurimas ÄŒernius
  Serbian: ÐœÐ°Ñ€ÐºÐ¾ ÐšÐ¾ÑÑ‚Ð¸Ñ›
  Turkish: Sabri Ãœnal

dconf-editor 3.35.90
=====================

Hey, that is mostly a translations beta release! Feels good, no.

Translations updated:
  Catalan: Jordi Mas

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../dconf/{dconf-editor_3.34.2.bb => dconf-editor_3.36.2.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/dconf/{dconf-editor_3.34.2.bb => dconf-editor_3.36.2.bb} (67%)

diff --git a/meta-gnome/recipes-gnome/dconf/dconf-editor_3.34.2.bb b/meta-gnome/recipes-gnome/dconf/dconf-editor_3.36.2.bb
similarity index 67%
rename from meta-gnome/recipes-gnome/dconf/dconf-editor_3.34.2.bb
rename to meta-gnome/recipes-gnome/dconf/dconf-editor_3.36.2.bb
index 699511f7a..25f409c41 100644
--- a/meta-gnome/recipes-gnome/dconf/dconf-editor_3.34.2.bb
+++ b/meta-gnome/recipes-gnome/dconf/dconf-editor_3.36.2.bb
@@ -8,8 +8,8 @@ DEPENDS = "dconf gtk+3"
 
 inherit gnomebase vala gettext gsettings bash-completion
 
-SRC_URI[archive.md5sum] = "2907205ad1a0e2774c981932cb7ff25b"
-SRC_URI[archive.sha256sum] = "cecc2a5cb44af68be80e970e83fb9e3e92e2a74df7c90b63324e6da19a929d5f"
+SRC_URI[archive.md5sum] = "78bd905ed3c770a00c850d8cffec88a4"
+SRC_URI[archive.sha256sum] = "edcec8867f018589125f177407760c642bbbb52fe5122daac5905223d6b3e1c7"
 
 FILES_${PN} += " \
     ${datadir}/dbus-1 \
-- 
2.21.3

