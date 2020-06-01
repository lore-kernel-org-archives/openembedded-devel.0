Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.48681.1591047938288337482
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jun 2020 14:45:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NDI0wvPQ;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id x14so1334842wrp.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Jun 2020 14:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=vmEG7jwWx3URrzXLkSQ86oj3xcFcHRhSaHBka6vMe9A=;
        b=NDI0wvPQ59s9NyptrDQ9n6sFxY6tVtrwgx3cnjPnGe0Kx5dgsTPZ2ECT/d4sIpyDbO
         vI674tRMhsfHegbG2lvl3A+EZ021SzVezEtbamZ9y3L4o6GtUhuihOf3GDJXB7zW8sYt
         09Evp1zK3PomrbqR2ZE0EXlkF+Ql6Zp73yXMiTjtI9VCOiyDOM2NEwanu0V+78QKt0Cj
         qTp7YJZceQ1094XL78yWYY/91gRjZN2RyjHxwm6Nidc7Om2K5v8ExxeyLL4CR786b87D
         FBPdIqDM7eLnJEEPPk5Kxuk5N73mVJAagR2SDyq79oF0PZ2WA5UCenvGgWD0BL7i4xjl
         fxvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vmEG7jwWx3URrzXLkSQ86oj3xcFcHRhSaHBka6vMe9A=;
        b=hSmlbaalTPbc4M3D0XUe9fwCxv29UiF9qapGui3OKiXBk5XGKE3JW5Nw+e0iXoylKx
         Et/k5fVeVw3fItC9qyXVLIfRJW5cTNSW6p9TtbBumoT4zPbeASYQxuD8iv7aWcRWm1DB
         HrJnbTpT6IkGZi7/h81djceXg+GcfAYo1BG9yTo+2WRoO5p1cMWvVNKqcKYTFgs5EVyD
         2fx7p9MGUMbKFoqeadg5KXKc3Dewp0CTWW0LTwoGkr1d1JYq91HQZrCbYRdUpeqPKYro
         Y9t42bj61VFKbYaX/nhQj819hm8QEkoFZYtePYREAkfiAdsYYsUj+F749HlTR7fe7Hjw
         s9uw==
X-Gm-Message-State: AOAM533VKiT81ovyocR5h2bQ3dg7MKRmQH/5BZDa+cYtH3xqj+fPhDFC
	7/pDsQM9ClXZZcTnBAn7ja72ZUpCJmw=
X-Google-Smtp-Source: ABdhPJzejWsPOaNC2Hi5do16jckK/BZA1pAosbcYdY38ZXqxAHCLxsk6oa27ZfJYZ9jzyTWs012itw==
X-Received: by 2002:adf:dccc:: with SMTP id x12mr23050144wrm.72.1591047935906;
        Mon, 01 Jun 2020 14:45:35 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f06ad34da2c69d11ac2eac0.dip0.t-ipconnect.de. [2003:f0:7f06:ad34:da2c:69d1:1ac2:eac0])
        by smtp.gmail.com with ESMTPSA id 40sm1050119wrc.15.2020.06.01.14.45.34
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 14:45:35 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 08/38] evolution-data-server: upgrade 3.34.4 -> 3.36.3
Date: Mon,  1 Jun 2020 23:44:46 +0200
Message-Id: <20200601214516.26624-9-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200601214516.26624-1-schnitzeltony@gmail.com>
References: <20200601214516.26624-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Evolution-Data-Server 3.36.3 2020-05-29
---------------------------------------

Bug Fixes:
	I#101 - DAV backends: Limit server requests after getting online (Milan Crha)
	I#210 - Global buffer overflow in e_contact_check_attr_type_value_used() (Milan Crha)
	I#211 - IMAPx: No IDLE after extraneous connection reset (Milan Crha)
	I#212 - EWebDAVSession: Ignore text/plain server responses on success (Milan Crha)
	I#213 - camel_mime_filter_backup() calls memcpy(null, ...) (Milan Crha)
	I#219 - Search folder content rebuilt after a change in it (Milan Crha)
	evo-I#915 - Fix some issues reported by Clang's ubsan sanitizer (Milan Crha)

Miscellaneous:
	CamelFilterDriver: do_shell: NULL-terminate the arguments array (Milan Crha)
	ECollectionBackend: Limit how often checks for new child sources (Milan Crha)

Evolution-Data-Server 3.36.2 2020-04-24
---------------------------------------

Bug Fixes:
	I#203 - Google book: Do not use progress callbacks in libgdata sync API (Milan Crha)
	I#204 - GOA-configured Nextcloud account not appearing (Milan Crha)
	I#206 - LDAP: Incorrectly converts SExp to LDAP query (Milan Crha)

Miscellaneous:
	ESourceRegistryWatcher: The 'filter' signal listener should not be required (Milan Crha)

Translations:
	Goran VidoviÄ‡ (hr)
	Fabio Tomat (fur)

Evolution-Data-Server 3.36.1 2020-03-27
---------------------------------------

Bug Fixes:
	I#199 - ESoupAuthBearer: Is not thread safe (Milan Crha)
	evo-I#831 - Free/Busy times are not in UTC (Milan Crha)
	ews-I#87 - Meta backends not moved back online after connect failure (Milan Crha)

Translations:
	Goran VidoviÄ‡ (hr)
	Daniel Korostil (uk)
	Daniel È˜erbÄƒnescu (ro)

Evolution-Data-Server 3.36.0 2020-03-06
---------------------------------------

Bug Fixes:
	I#198 - goa: Doesn't set ESourceAuthentication::is-external properly (Milan Crha)

Translations:
	Alan Mortensen (da)
	Nathan Follens (nl)
	Matej UrbanÄiÄ (sl)
	Jiri GrÃ¶nroos (fi)
	Gianvito Cavasoli (it)
	Tim Sabsch (de)

Evolution-Data-Server 3.35.92 2020-02-28
----------------------------------------

Bug Fixes:
	I#166 - Remembers last connection error for too long (Milan Crha)
	I#167 - IMAPx: Can claim existing folders as gone (Milan Crha)
	I#192 - Collection accounts: Do not suddenly enable disabled sub-sources (Milan Crha)
	I#193 - EWebDAVDiscover: Can skip lookup for books with /.well-known/carddav address (Milan Crha)
	I#194 - e-cal-recur: Incorrect timezone used for DTEND from DURATION (Milan Crha)

Miscellaneous:
	EWebDAVCollectionBackend: Require credentials only if user name is set (Milan Crha)
	CalDAV/CardDAV: Fix 'local_error' variable usage in connect_sync() (Milan Crha)
	CalDAV/CardDAV: Remove unused variable declaration (Milan Crha)
	CalDAV: Claim not found objects during refresh as removed (Milan Crha)

Translations:
	Fran Dieguez (gl)
	Piotr DrÄ…g (pl)
	Asier Sarasua Garmendia (eu)
	Charles Monzat (fr)
	Marek ÄŒernockÃ½ (cs)
	Changwoo Ryu (ko)

Evolution-Data-Server 3.35.91 2020-02-14
----------------------------------------

Bug Fixes:
	I#168 - Camel: Can fail to connect when password contains non-ASCII letters (Milan Crha)
	I#178 - Implement RFC 6856 - POP3 support for UTF-8 (Milan Crha)
	I#187 - camel-sasl-gssapi: Fails to build without KRB5 (Milan Crha)
	I#189 - Crash on malformed server response with minimal capabilities (Milan Crha)

Miscellaneous:
	Remove outdated and unused devel-docs files from camel (Milan Crha)
	EWebDAVDiscover: Returns address books when asked for calendars only (Milan Crha)

Translations:
	Aurimas ÄŒernius (lt)
	Daniel Mustieles (es)
	Anders Jonsson (sv)
	Rafael Fontenelle (pt_BR)
	Sabri Ãœnal (tr)
	Kukuh Syafaat (id)
	BalÃ¡zs Ãšr (hu)

Evolution-Data-Server 3.35.90 2020-01-31
----------------------------------------

Bug Fixes:
	I#154 - Replace deprecated gdk_beep() usage in the code (Milan Crha)
	I#179 - Calendar: Handle errors in file backend's refresh thread gracefully (Milan Crha)
	I#184 - WebDAV: Privilege with multiple child elements not handled properly (Milan Crha)
	I#186 - Allow override of PHONENUMBER_DEFINITIONS (Milan Crha)
	M!34 - Use G_PARAM_STATIC_STRINGS (Niels De Graef)
	M!35 - CamelMessageContentInfo: Define CamelProviderAutoDetectFunc (Corentin NoÃ«l)
	M!36 - EBookSqlite: Make the signal definition for before-*-contact more specific (Corentin NoÃ«l)
	M!37 - CamelFolderSummary: Explicitely map the virtual methods to their callers (Corentin NoÃ«l)
	evo-I#686 - Broken search folder that includes all mails from other search folders (Milan Crha)

Miscellaneous:
	EDBusServer: Delay new module load (Milan Crha)
	alarm-notify: Double-free with certain types of the reminder (Milan Crha)
	ESourceCollection: Add 'allow-sources-rename' property (Milan Crha)
	camel: Document the GHashTable type in CamelProviderAutoDetectFunc and camel_provider_auto_detect (Corentin NoÃ«l)
	Speed-up e_contact_get_attributes_set() (Milan Crha)
	Prefer GSlice over heap allocation for short-lived structures (Milan Crha)
	EBookSqlite: Address runtime warnings from remove_leading_zeros() in unit tests (Milan Crha)
	CamelMessageInfo: Cache common strings in the string pool (Milan Crha)
	ECalCache: Be more specific regarding the signal definition and fix documentation (Corentin NoÃ«l)
	CamelHeaderParam: Specify the transfer annotation for camel_header_param (Corentin NoÃ«l)
	Vala: Add more .metadata fixes (Corentin NoÃ«l)
	Bump libical-glib dependency to 3.0.7 and benefit from its behavior (Milan Crha)

Translations:
	Rafael Fontenelle (pt_BR)
	Sucipto (id)
	DuÅ¡an Kazik (sk)
	Anders Jonsson (sv)
	Umarzuki Bin Mochlis Moktar (ms)

Evolution-Data-Server 3.35.3 2020-01-03
---------------------------------------

Bug Fixes:
	I#177 - DAV: Ignore 404 responses on content refresh (Milan Crha)

Translations:
	Yi-Jyun Pan (zh_TW)
	Jordi Mas (ca)
	Fabio Tomat (fur)
	Fran Dieguez (gl)

Evolution-Data-Server 3.35.2 2019-11-22
---------------------------------------

Bug Fixes:
	I#156 - EBook/CalMetaBackend: Automatic refresh not always setup ][ (Milan Crha)
	I#157 - IMAPx: Does not respect LOGINDISABLED (Milan Crha)
	I#159 - LDAP: Fails to read userCertificate from the server (Milan Crha)
	I#162 - e-cal-recur: Ignores recurrence exceptions (Milan Crha)
	I#164 - HSTS (RFC 6797) support for "On The Web" calendars (Milan Crha)
	I#169 - Detached instances shown as with floating time (Milan Crha)
	I#173 - ESoupSession: Accept also compressed responses (Milan Crha)

Miscellaneous:
	EWeatherSource: Use g_signal_connect_object() in e_weather_source_parse() (Milan Crha)
	Correct runtime warning from camel_network_service_can_reach() (Milan Crha)
	ESoupSession: Do not presend credentials on insecure connections (Milan Crha)
	EBackend: Slightly enhance g_warning() messages with an ESource identification (Milan Crha)
	ESource: Required signals not connected after EDBusObject is replaced (Milan Crha)
	LDAP: Change how LDAP query is constructed (Milan Crha)

Translations:
	Daniel Mustieles (es)
	Jordi Mas (ca)

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../evolution-data-server/evolution-data-server.inc         | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
index 4da3f8259..6150df167 100644
--- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
+++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6a6e689d19255cf0557f3fe7d7068212 \
 
 inherit gnomebase upstream-version-is-even
 
-SRC_URI[archive.md5sum] = "23293554e9d92c6c0c78b5568b286efd"
-SRC_URI[archive.sha256sum] = "985c4b4b613c50c999a4ca5e9d52478acbea85e1e99bab3a8b6e57ba7eace8f3"
-PV = "3.34.4"
+SRC_URI[archive.md5sum] = "4990dbdbf5850cbbfc46727367776058"
+SRC_URI[archive.sha256sum] = "1f5f48173d0f288219d73d4f193cb921ae631932ba84030f05751c42bb003db2"
+PV = "3.36.3"
 
-- 
2.21.3

