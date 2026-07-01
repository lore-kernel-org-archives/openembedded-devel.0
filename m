Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BD98C43458
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 20:24:02 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.54319.1782937435348514723
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Jul 2026 13:23:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=FYKJxWe3;
 spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd93.aul.t-online.de (fwd93.aul.t-online.de [10.223.144.119])
	by mailout03.t-online.de (Postfix) with SMTP id F0F98E2F3
	for <openembedded-devel@lists.openembedded.org>; Wed,  1 Jul 2026 22:23:52 +0200 (CEST)
Received: from fedora.fritz.box ([84.154.163.76]) by fwd93.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wf1TL-28ODsv0; Wed, 1 Jul 2026 22:23:51 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] evolution-data-server: update 3.56.2 -> 3.60.2
Date: Wed,  1 Jul 2026 22:23:44 +0200
Message-ID: <20260701202344.2893602-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1782937431-5F7FC499-1259A01E/0/0 CLEAN NORMAL
X-TOI-MSGID: 2ed3e28c-0480-4925-9992-9074c8d8e0e1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1782937432; i=f_l_k@t-online.de;
	bh=Nyo5KXVftpD1SR8AKbYm0UIH/6pHA7YvJi+n6tNtOi8=;
	h=From:To:Subject:Date;
	b=FYKJxWe3sbLpIBF34aajNOR43BKu/c55Z+4rIrbanbltjEhBmeLH026XSMASlfCvV
	 WoCaM6u4MzapQnSTj5N9JR41dNnIXyJSk+sjRXpXppBEb5uaTof4GGswVYiEDpYr+3
	 +mZYAKmN9sOMucOoXSm9QTGpI06VB/Ser3CYxXB6EDkWGHo039LFI2yNxT+UUrzgRm
	 B4xApA9Kkiw/brU/4hRoObVTOHWBQeEy+e4a5SJoot7GWuJD62qanj8Ijw0McKuwbT
	 hPWuYkYb+dQSULSs8HmLN9rDpVMgO+f3RKrLSOpwUH8cVWX85XM8wofW1neaPzgqW6
	 OxMfw3hVlbmjQ==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Jul 2026 20:24:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127996

This fixes:
error: assignment to 'ICalDuration *' from 'int' makes pointer from integ=
er without a cast [-Wint-conversion]

Evolution-Data-Server 3.60.2 2026-05-22
---------------------------------------

Bug Fixes:
	I#637 - IMAPx: Sent folder reverts to default with iCloud email and Quic=
k Resync
	evo-I#3302 - Truncated file stored in the (mail) cache

Miscellaneous:
	e-ms-oapxbc: Simplify error handling in MS-OAPXBC OIDC extension
	e-ms-oapxbc: Fix error handling of broker response
	e-ms-oapxbc: Align D-Bus parameters with sso-mib (Felix Moessbauer)
	e-ms-oapxbc: Add support for broker versions > 2.0.1 (Felix Moessbauer)
	Do not lock SExp object in data book/cal views start
	e-book-meta-backend: Handle data: URI-s in PHOTO/LOGO
	Calendar: Use icaldurationtype_as_utc_seconds() for libical 4.x (Antonio=
 Rojas)
	OAuth2: Use its own error domain and add camel_util_is_network_error()

Translations:
	Christian Kirbach (de)

Evolution-Data-Server 3.60.1 2026-04-10
---------------------------------------

Bug Fixes:
	I#632 - nntp: Fix GSocket ref leak in stream timeout helpers (Mikhail Ga=
vrilov)

Miscellaneous:
	nntp: Rename nntp_get_stream_socket() to nntp_ref_stream_socket()
	ESoupSession: Correct e_soup_session_get_authentication_requires_credent=
ials()

Evolution-Data-Server 3.60.0 2026-03-13
---------------------------------------

Bug Fixes:
	I#489 - Backends: Do not block views' start by slow connection

Miscellaneous:
	Correct ICalGLib reference in gir when building against version 4
	docs: Update libical-glib online documentation link

Translations:
	Asier Saratsua Garmendia (eu)
	Aurimas Aurimas =C4=8Cernius (lt)
	Bal=C3=A1zs =C3=9Ar (hu)
	Baurzhan Muftakhidinov (kk)
	Bruce Cowan (en_GB)
	Daniel Rusek (cs)

Evolution-Data-Server 3.59.3 2026-02-27
---------------------------------------

Bug Fixes:
	I#444 - Make credential prompt dialog non-modal
	I#625 - camel-sasl-ntlm: Check for integer overflow in ntlm_get_string()
	I#626 - camel-pop3-store: Compute APOP response without string allocatio=
n
	I#627 - Canonicalize path before local cache file removal
	I#628 - e-cal-recur: Check interval intersect always as date-time value
	evo-I#3257 - NNTP: Subscription dialog does not show all groups

Miscellaneous:
	e-collection-backend: Fix possible memory leak
	Use GHashTable's `replace()` instead of `insert()` on some places
	e-name-western: Crash due to double quotes in the name
	camel-network-service: Move static variable to read-only area
	credential-prompters: Add some spacing around widgets in the dialog (gtk=
4)
	camel-store-search: Minimize hold of the folder and folder summary locks
	camel-debug: Include object address in ref/unref backtraces
	Increase default connection timeout to 30 seconds

Translations:
	Alan Mortensen (da)
	Anders Jonsson (sv)
	Christian Kirbach (de)
	Jean-Marc TISSIERES (fr)
	Jordi Mas (ca)
	Milo=C5=A1 Popovi=C4=87 (sr)
	Milo=C5=A1 Popovi=C4=87 (sr@latin)
	Sabri =C3=9Cnal (tr)
	twlvnn kraftwerk (bg)

Evolution-Data-Server 3.59.2 2026-01-30
---------------------------------------

Bug Fixes:
	I#617 - Calendar: Prepare to support build with libical 4.x
	M!206 - docs: Document libical-glib as dependency (Juan Luis Cano Rodr=C3=
=ADguez)

Miscellaneous:
	Correct few developer comments
	Calendar: Correct typo in error message
	Fix a compiler warning in camel-network-service.c
	e-book-utils: Correct read of a certificate from a vCard attribute
	Add ESourceConflictSearch from Evolution

Translations:
	Aurimas Aurimas =C4=8Cernius (lt)
	Ekaterine Papava (ka)
	Juliano de Souza Camargo (pt_BR)
	Martin (sl)
	Yuri Chornoivan (uk)

Evolution-Data-Server 3.59.1 2026-01-02
---------------------------------------

Bug Fixes:
	I#8 - Support vCard v4.0 (RFC 6350)
	I#554 - CalDAV: Provide a date limit for information sync
	I#609 - Camel: Encrypt Recipient Alias Configuration
	I#612 - Calendar: Multiple detached instances cause duplicates
	I#613 - Camel: Message info changes do not propagate sometimes
	I#614 - CamelSearchFolder: Add "not_all" "match-threads" kind
	I#616 - Crash when reading broken multipart/signed
	I#618 - Calendar: Free/busy not exported without set calendar mail
	I#620 - alarm-notify: Snooze "until X minutes before start" wrongly remi=
nds "X min after start"
	I#621 - addressbook-export: Fails with "Invalid query" error
	M!201 - Camel: Remove camel_session_ref_service_by_url (Corentin No=C3=AB=
l)
	M!203 - Remove several migration functions from Evolution Source Registr=
y (Corentin No=C3=ABl)
	evo-I#3157 - Broken multipart/signed shown as raw MIME data

Miscellaneous:
	org.gnome.EvolutionDataServer.Devel.json: Build also gweather-locations
	Lower default connection timeout to 15 seconds
	evolution-source-registry: Remove unused variable (reported by compiler)
	CamelGpgContext: Improve error messages
	WebDAV: Default to no download limit
	CamelStoreDB: Keep 'sqlite_sequence' table during migration
	CamelDB: Correct return value and repeated function call arguments
	CamelStoreSearch: Unlock summary and folder when save or prepare_fetch_a=
ll fails
	IMAPx: Avoid Junk/Trash folder open when saving changes
	ERemindersWidget: Workaround too large gap between action buttons
	CamelFolderSummary: Reload from DB could leak already loaded infos
	Correct developer comment of e_source_webdav_set_limit_download_days()
	addressbook: Prefer vCard "take" functions
	CamelDataCache: Rephrase "Empty cache file" error message
	Camel: Unread count for virtual Trash/Junk folder not updated properly
	CamelStoreSearch: Ignore all errors when a message cannot be opened
	CamelStore: Speed up open folders with virtual Trash or Junk folder
	EContactAddress: Add helper functions to read, write and clear the struc=
ture
	EContact: Add EContactGeo functions to convert to/from string
	EVCard: Add conversion code for GEO attribute
	EVCard: Correct PHOTO/LOGO data: URI conversion
	EContact: Add 'timezone' field
	EVCard: Add conversion code for KEY attribute
	EContactCert: Add helper functions to work with attributes
	ECertificateWidget: Add a function to check whether any certificate data=
 is shown
	flatpak: Add gettext ACLOCAL workaround
	EBookSqlite: Correct mutex unlock in e_book_sqlite_lock()
	EVCard: Add RFC 2739 properties into the list of known vCard 3.0 propert=
ies

Translations:
	Asier Saratsua Garmendia (eu)
	Aurimas =C4=8Cernius (lt)
	Daniel Rusek (cs)
	Ekaterine Papava (ka)
	Emin Tufan =C3=87etin (tr)
	Juliano de Souza Camargo (pt_BR)
	Martin (sl)
	Sabri =C3=9Cnal (tr)
	twlvnn kraftwerk (bg)
	Yuri Chornoivan (uk)

Evolution-Data-Server 3.58.0 2025-09-12
---------------------------------------

Bug Fixes:
	I#607 - test-cal-component-bag: Fails to run with source tree only

Miscellaneous:
	IMAP: Disable PREVIEW fetch on FETCH error

Translations:
	Bal=C3=A1zs =C3=9Ar (hu)
	Daniel Rusek (cs)

Evolution-Data-Server 3.57.3 2025-08-29
---------------------------------------

Bug Fixes:
	I#555 - Calendar: Deleting "This and Future Occurrences" instances can d=
uplicate events
	I#602 - IMAP: Sometimes removes message from local summary in error
	I#604 - CamelGpgContext: Provide information about encrypted content
	I#605 - Camel: MH account busy-loops when reading directory content
	M!188 - EDataServer: Use g_object_notify_by_pspec when possible (Corenti=
n No=C3=ABl)
	M!193 - EBookContacts: Use g_object_notify_by_pspec when possible (Coren=
tin No=C3=ABl)
	M!198 - alarm-notify: Add a systemd service (Adrian Vovk)
	M!198 - data: Conditionalize installation of alarm-notify (Adrian Vovk)
	M!199 - cmake: Specify GLib minimal version to gdbus-codegen (Corentin N=
o=C3=ABl)
	M!200 - data: Set desktop directory outside the condition (Hari Rana)
	M!202 - build: Conditionally install org.gnome.Evolution-alarm-notify.de=
sktop (Georges Basile Stavracas Neto)

Miscellaneous:
	CamelDB: Do not error out on SQLITE_ABORT
	CamelVeeFolder: Fix runtime warning when rebuilding folder content
	CamelVeeSummary: Reference subfolder in the internal hash table

Translations:
	Anders Jonsson (sv)
	Artur S0 (ru)
	Asier Saratsua Garmendia (eu)
	Jordi Mas (ca)
	Juliano de Souza Camargo (pt_BR)
	Piotr Dr=C4=85g (pl)

Evolution-Data-Server 3.57.2 2025-08-01
---------------------------------------

* The libcamel API dropped CamelObject, it was not needed anymore.

Bug Fixes:
	I#449 - alarm-notify: Rework snooze options
	I#591 - alarm-notify: Sometimes uses original reminder time for modified=
 instance
	evo-I#3089 - Camel: App freezes often when performing various threaded t=
asks
	evo-I#3093 - EContact: Consider also FullName as FileAs

Miscellaneous:
	CamelVeeSummary: Fix dub-subfolders annotations (Corentin No=C3=ABl)
	CamelFolder: Add state saving API directly (Corentin No=C3=ABl)
	Camel: Remove CamelObject (Corentin No=C3=ABl)
	Camel: Remove index of deprecated symbols (Corentin No=C3=ABl)
	CamelStoreSearch: Make it possible to search for a hashed message ID
	CamelFolder: Fix a memory leak
	EReminderWatcher: Debug-print what changes had been received from the ca=
lendars
	ERemindersWidget: Change gap around description text view
	CamelNetworkService: Cache the GQuark locally for the private data (Core=
ntin No=C3=ABl)
	Camel: Use g_object_notify_by_pspec when possible (Corentin No=C3=ABl)
	ECal: Use g_object_notify_by_pspec when possible (Corentin No=C3=ABl)
	EDataServerUI: Use g_object_notify_by_pspec when possible (Corentin No=C3=
=ABl)
	EBook: Use g_object_notify_by_pspec when possible (Corentin No=C3=ABl)
	EBackend: Use g_object_notify_by_pspec when possible (Corentin No=C3=ABl=
)
	EDataBook: Use g_object_notify_by_pspec when possible (Corentin No=C3=AB=
l)
	EDataCal: Use g_object_notify_by_pspec when possible (Corentin No=C3=ABl=
)
	Camel: Use GParamSpec consistently to create properties (Corentin No=C3=AB=
l)
	CamelVeeFolder: Fix a runtime warning when rebuilding the folder
	CamelFolderSummary: Notify about flag changes on idle
	ECalClient: Improve performance of generate_instances() function

Translations:
	Martin (sl)
	Yuri Chornoivan (uk)

Evolution-Data-Server 3.57.1 2025-06-27
---------------------------------------

* The libcamel API had been changed in several ways, some deprecated
  symbols had been removed, some API functions renamed and their return
  values changed (mostly from "transfer full" to "transfer container").

Bug Fixes:
	I#592 - Handle changed server pool in WebDAV collection sources
	I#593 - CamelDataWrapper: Correct return value of size calculate functio=
ns (dagosuhn)
	I#597 - GOA EWS: Fallback to likely EWS host URL when autodicovery fails
	M!170 - docs: Update URL to libsoup docs (Simon McVittie)
	M!176 - docs: Add docs_url argument (Corentin No=C3=ABl)
	evo-I#2434 - alarm-notify: Should show a visual notification to accompan=
y notification sounds (John Lorentzson)

Miscellaneous:
	e-data-server-util: Fix a compiler warning about 'const' qualifier disca=
rd
	libecal: Add utility functions to read and convert time to given timezon=
e
	test-cal-utils: Add a simple additional check
	libecal: Add an ECalComponentBag object
	ESourceRegistry: Reject to create an instance when D-Bus service is not =
available
	Misc: Correct developer documentation annotations
	CamelService: Add private construct-only "with-proxy-resolver" property
	Camel: Add CamelStoreDB and CamelStoreSearch and use them
	Camel: Rework Search folders
	CamelFilterDriver: Remove unused "global variables"
	Camel: Rename camel_folder_summary_get_array() to camel_folder_summary_d=
up_uids()
	Camel: Rename camel_folder_get_uids() to camel_folder_dup_uids()
	Camel: Remove camel_folder_get_summary()
	Camel: Rename camel_folder_get_uncached_uids() to camel_folder_dup_uncac=
hed_uids()
	Camel: Rename camel_folder_summary_get_changed() to camel_folder_summary=
_dup_changed()
	Camel: Rename camel_uid_cache_get_new_uids() to camel_uid_cache_dup_new_=
uids()
	Camel: Rename CAMEL_DB_FILE to CAMEL_STORE_DB_FILE
	CamelDB: Remove unneeded public defines
	CamelProvider: Remove autodetect function (Corentin No=C3=ABl)
	lib-camel-test-utils: Reference CamelProvider struct members by name in =
initialization
	Camel: Remove deprecated symbols from CamelStoreSummary (Corentin No=C3=AB=
l)
	Camel: Remove deprecated symbols from CamelOfflineSettings (Corentin No=C3=
=ABl)
	CamelStoreDB: Allow empty folder names
	CamelStoreGetFolderFlags: Remove deprecated and unused flag (Corentin No=
=C3=ABl)
	CamelFolder: Undeprecate get/set_message_flags (Corentin No=C3=ABl)
	CamelFolder: Remove deprecated functions (Corentin No=C3=ABl)
	CamelFolderThread: Use the oldest message as a parent of a leaf-only sub=
thread
	CamelFolder: Add nullable annotation to camel_folder_get_folder_summary =
(Corentin No=C3=ABl)
	CamelFolder: Use g_object_notify_by_pspec when possible (Corentin No=C3=AB=
l)
	CamelFolderSummary: Use g_object_notify_by_pspec when possible (Corentin=
 No=C3=ABl)
	CamelMessageInfo: Use g_object_notify_by_pspec when possible (Corentin N=
o=C3=ABl)
	CamelMimePart: Use g_object_notify_by_pspec when possible (Corentin No=C3=
=ABl)
	CamelIMAPXMessageInfo: Use g_object_notify_by_pspec when possible (Coren=
tin No=C3=ABl)
	CamelFolderThread: Fix a crash caused by the previous commit
	Camel: Remove extra camel_pstring_free() calls
	vala: Fix several warnings thrown by Camel (Corentin No=C3=ABl)
	CamelFolderSummary: Remove prepare-fetch-all signal (Corentin No=C3=ABl)
	alarm-notify: Skip reminders for cancelled components
	CamelURL: Add glib-object to the header (Corentin No=C3=ABl)
	CamelService: Rebase on GObject (Corentin No=C3=ABl)
	CamelVeeStore: Remove unused property (Corentin No=C3=ABl)
	CamelIMAPXCommand: Remove leftover assignation to CamelObject (Corentin =
No=C3=ABl)

Translations:
	Asier Saratsua Garmendia (eu)
	=C3=81lvaro Burns (pt_BR)
	Bal=C3=A1zs Mesk=C3=B3 (hu)
	Boyuan Yang (zh_CN)
	Ekaterine Papava (ka)
	Emin Tufan =C3=87etin (tr)
	Jordi Mas (ca)
	Jose Riha (sk)
	Martin (sl)
	Yuri Chornoivan (uk)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../evolution-data-server/evolution-data-server.inc           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-dat=
a-server.inc b/meta-gnome/recipes-gnome/evolution-data-server/evolution-d=
ata-server.inc
index 54eb593e5f..4e91372c3a 100644
--- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-serve=
r.inc
+++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-serve=
r.inc
@@ -11,5 +11,5 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6a6e689d1925=
5cf0557f3fe7d7068212 \
 GNOMEBASEBUILDCLASS =3D "cmake"
 inherit gnomebase upstream-version-is-even
=20
-SRC_URI[archive.sha256sum] =3D "df4ec29950f29a76eac6fbe0f814c48d2cef7d3f=
db905002a4a883dd761ce93c"
-PV =3D "3.56.2"
+SRC_URI[archive.sha256sum] =3D "2084dbdac396371b365d504c1ff45866ba8dca2f=
1252e5da1d3d9c33abdc1286"
+PV =3D "3.60.2"
--=20
2.54.0


