Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DE11C982EE
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 12:05:02 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47342.1789992300699109612
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Sep 2026 05:05:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=L0KBXElY;
 spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd94.aul.t-online.de (fwd94.aul.t-online.de [10.223.144.120])
	by mailout03.t-online.de (Postfix) with SMTP id D239FDF24
	for <openembedded-devel@lists.openembedded.org>; Mon, 21 Sep 2026 14:04:58 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.35.133]) by fwd94.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x8clQ-1X5LWb0; Mon, 21 Sep 2026 14:04:52 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [qmeta-gnome][PATCH 2/2] gnome-keyring: fix the use-after-free in the secret service
Date: Mon, 21 Sep 2026 14:04:43 +0200
Message-ID: <20260921120443.57180-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921120443.57180-1-f_l_k@t-online.de>
References: <20260921120443.57180-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1789992292-B6FFA9A7-096F82A0/0/0 CLEAN NORMAL
X-TOI-MSGID: d7ce3918-65f4-4bed-8bdf-0d2995d70c9e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1789992298; i=f_l_k@t-online.de;
	bh=O1AXMiXsAh+tEzP5NhnbV0gBp9dAdi7LPqHbeKZcBBg=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=L0KBXElYiX53mNEM4FbHcBmgfFCVLvtjyzoItNeCOm5RRUajcCeTBgVs+6BBw5vEZ
	 5Cm+dDHOEDriN54EaZBxeA1gCt3ukPW4JDyAiowIva2foxVH439+8gKLi07kcldK4+
	 diTOGUaYaFx6ItmoGtOpGcoJmEF2es+YiRLRG4/tGpFGzXMINH8b2rToWJapI3m9nW
	 mhculr2o/zn03+XwwI5J6lxVj91uywGnHNivv+9D68Qlm18HeBeT2/0RxoaRKH9iyT
	 Z+45lceSjm3SMoCO5K9bNFjLNz6PRBnoOgXv3lFLTzXRxWDcqBRaNmoOiaXqes16z7
	 FjAPdT6yolu7Q==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Sep 2026 12:05:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130160

Unlocking a keyring from a client that disconnects afterwards crashed
gnome-keyring-daemon: free_client() drops the PKCS#11 session before the
dispatch table that still owns GkdSecretSession objects referencing it,
gkd_secret_unlock used the service after dispose, and the session held
one reference too few on its GckSession. Three patches address the three
places; debug-mode is turned off so the daemon does not keep the
allocator poisoning enabled.

AI-Generated: Uses Claude Code (Claude Opus 5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...ce-destroy-the-dispatch-table-before.patch |  76 +++++++++++
 ...k-do-not-use-the-service-after-dispo.patch | 122 ++++++++++++++++++
 ...ion-drop-the-duplicate-session-unref.patch |  58 +++++++++
 .../gnome-keyring/gnome-keyring_51.0.bb       |   7 +-
 4 files changed, 262 insertions(+), 1 deletion(-)
 create mode 100644 meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring/=
0002-gkd-secret-service-destroy-the-dispatch-table-before.patch
 create mode 100644 meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring/=
0003-gkd-secret-unlock-do-not-use-the-service-after-dispo.patch
 create mode 100644 meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring/=
0004-gkd-secret-session-drop-the-duplicate-session-unref.patch

diff --git a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring/0002-gk=
d-secret-service-destroy-the-dispatch-table-before.patch b/meta-gnome/rec=
ipes-gnome/gnome-keyring/gnome-keyring/0002-gkd-secret-service-destroy-th=
e-dispatch-table-before.patch
new file mode 100644
index 0000000000..84660d3dc3
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring/0002-gkd-secre=
t-service-destroy-the-dispatch-table-before.patch
@@ -0,0 +1,76 @@
+From b105e7f122805aceef8c3674b04f5d6b7865ad17 Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Tue, 15 Sep 2026 18:24:00 +0200
+Subject: [PATCH 2/3] gkd-secret-service: destroy the dispatch table befo=
re the
+ PKCS#11 session
+
+free_client() drops its reference to client->pkcs11_session before it
+destroys client->dispatch. The dispatch table still holds the client's
+GkdSecretSession objects, whose GckObject keeps a pointer to that very
+GckSession and unrefs it from gck_object_finalize(), so tearing the
+session down first leaves a dangling pointer behind.
+
+Measured on a running system with a breakpoint in free_client():
+
+    =3D=3D=3D before unref of pkcs11_session =3D=3D=3D
+    pkcs11_session =3D 0x55b347f29040  refcount =3D 1
+    dispatch size =3D 1
+    =3D=3D=3D after unref, before destroying dispatch =3D=3D=3D
+    pkcs11_session =3D 0x55b347f29040  refcount =3D 2863311530   (0xAAAA=
AAAA)
+    =3D=3D=3D session_dispose: unref self->key =3D=3D=3D
+    key->pv->session =3D 0x55b347f29040                        (already =
freed)
+
+The resulting use after free kills the daemon:
+
+    g_object_unref
+    gck_object_finalize                gck/gck-object.c:135
+    gkd_secret_session_dispose         daemon/dbus/gkd-secret-session.c:=
357
+    dispose_and_unref                  daemon/dbus/gkd-secret-service.c:=
245
+    g_hash_table_destroy
+    free_client                        daemon/dbus/gkd-secret-service.c:=
269
+
+Any client that opens a session, reads a secret and then leaves the bus
+triggers this - an ordinary "secret-tool lookup" is enough. systemd
+socket activation restarts the daemon, but the new instance no longer
+holds the login password, so the keyring stays locked from then on and
+every further access needs an unlock prompt, which crashes it again.
+
+Destroy the dispatch table first, then release the session. Holding an
+extra reference across free_client() under gdb has the same effect and
+lets the daemon survive repeated client cycles.
+
+Upstream-Status: Pending
+
+AI-Generated: Uses Claude Code (Claude Opus 5)
+---
+ daemon/dbus/gkd-secret-service.c | 10 +++++++---
+ 1 file changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/daemon/dbus/gkd-secret-service.c b/daemon/dbus/gkd-secret-s=
ervice.c
+index 72b3110..391c445 100644
+--- a/daemon/dbus/gkd-secret-service.c
++++ b/daemon/dbus/gkd-secret-service.c
+@@ -257,6 +257,13 @@ free_client (gpointer data)
+ 	/* Info about our client */
+ 	g_free (client->caller_peer);
+=20
++	/*
++	 * The sessions and prompts the client has open. These have to go
++	 * first: a GkdSecretSession holds a GckObject whose GckSession is
++	 * the pkcs11_session below, and it unrefs it when it is finalized.
++	 */
++	g_hash_table_destroy (client->dispatch);
++
+ 	/* The session we use for accessing as our client */
+ 	if (client->pkcs11_session) {
+ #if 0
+@@ -265,9 +272,6 @@ free_client (gpointer data)
+ 		g_object_unref (client->pkcs11_session);
+ 	}
+=20
+-	/* The sessions and prompts the client has open */
+-	g_hash_table_destroy (client->dispatch);
+-
+ 	g_free (client);
+ }
+=20
diff --git a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring/0003-gk=
d-secret-unlock-do-not-use-the-service-after-dispo.patch b/meta-gnome/rec=
ipes-gnome/gnome-keyring/gnome-keyring/0003-gkd-secret-unlock-do-not-use-=
the-service-after-dispo.patch
new file mode 100644
index 0000000000..638f5834cf
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring/0003-gkd-secre=
t-unlock-do-not-use-the-service-after-dispo.patch
@@ -0,0 +1,122 @@
+From 65693eab7baa49aff81f7534dd3d687fecbc4900 Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Tue, 15 Sep 2026 18:24:30 +0200
+Subject: [PATCH 3/3] gkd-secret-unlock: do not use the service after dis=
pose
+
+When the calling client goes away while an unlock is in flight,
+free_client() runs g_object_run_dispose() on the GkdSecretUnlock.
+gkd_secret_unlock_dispose() clears skeleton and service but never
+cancels self->cancellable - g_cancellable_cancel() is only called from
+the dismiss handler. The gck_session_create_object_async() in flight
+holds its own reference and keeps running, and its callback then works
+on the gutted object:
+
+    gkd_secret_service_get_objects: assertion 'GKD_SECRET_IS_SERVICE (se=
lf)' failed
+    gkd_secret_objects_lookup_collection: assertion 'GKD_SECRET_IS_OBJEC=
TS (self)' failed
+    g_dbus_interface_skeleton_get_object_path: assertion 'G_IS_DBUS_INTE=
RFACE_SKELETON (interface_)' failed
+    g_dbus_connection_emit_signal: assertion 'G_IS_DBUS_CONNECTION (conn=
ection)' failed
+
+GkdSecretPrompt guards against this with g_return_val_if_fail
+(self->pv->service) in gkd_secret_prompt_get_objects(), but
+GkdSecretUnlock derives straight from GObject and dereferences
+self->service unchecked.
+
+Cancel the pending operation from dispose and check for the disposed
+state before touching service or skeleton. The unlock queue is still
+handed on to the next waiting prompt in that case.
+
+Upstream-Status: Pending
+
+AI-Generated: Uses Claude Code (Claude Opus 5)
+---
+ daemon/dbus/gkd-secret-unlock.c | 42 ++++++++++++++++++++++++++++++++-
+ 1 file changed, 41 insertions(+), 1 deletion(-)
+
+diff --git a/daemon/dbus/gkd-secret-unlock.c b/daemon/dbus/gkd-secret-un=
lock.c
+index b04689f..55322c8 100644
+--- a/daemon/dbus/gkd-secret-unlock.c
++++ b/daemon/dbus/gkd-secret-unlock.c
+@@ -93,7 +93,13 @@ EGG_SECURE_DECLARE (secret_unlock);
+ static GckObject*
+ lookup_collection (GkdSecretUnlock *self, const gchar *path)
+ {
+-	GkdSecretObjects *objects =3D gkd_secret_service_get_objects (self->se=
rvice);
++	GkdSecretObjects *objects;
++
++	/* Already disposed, e.g. because the calling client went away */
++	if (self->service =3D=3D NULL)
++		return NULL;
++
++	objects =3D gkd_secret_service_get_objects (self->service);
+ 	return gkd_secret_objects_lookup_collection (objects, self->caller, pa=
th);
+ }
+=20
+@@ -104,6 +110,10 @@ emit_collection_unlocked (GkdSecretUnlock *self,
+ 	GkdSecretObjects *objects;
+ 	GckObject *collection;
+=20
++	/* Already disposed, e.g. because the calling client went away */
++	if (self->service =3D=3D NULL)
++		return;
++
+ 	objects =3D gkd_secret_service_get_objects (self->service);
+ 	collection =3D gkd_secret_objects_lookup_collection (objects, self->ca=
ller, path);
+ 	if (collection !=3D NULL) {
+@@ -158,6 +168,14 @@ mark_as_complete (GkdSecretUnlock *self, gboolean d=
ismissed)
+ 	g_free (self->current);
+ 	self->current =3D NULL;
+=20
++	/*
++	 * If we have already been disposed there is no skeleton left to emit
++	 * the signal from, and no client left that would care. Still hand the
++	 * queue on to the next waiting prompt below.
++	 */
++	if (self->skeleton =3D=3D NULL)
++		goto next_in_queue;
++
+ 	g_variant_builder_init (&builder, G_VARIANT_TYPE ("ao"));
+ 	for (i =3D 0; i < self->results->len; ++i) {
+ 		value =3D g_array_index (self->results, gchar*, i);
+@@ -173,6 +191,7 @@ mark_as_complete (GkdSecretUnlock *self, gboolean di=
smissed)
+ 				       g_variant_new ("(b@v)", dismissed, variant),
+ 				       NULL);
+=20
++next_in_queue:
+ 	/* Fire off the next item in the unlock prompt queue */
+ 	other =3D g_queue_pop_head (&unlock_prompt_queue);
+ 	if (other !=3D NULL) {
+@@ -198,6 +217,20 @@ on_unlock_complete (GObject *object, GAsyncResult *=
res, gpointer user_data)
+ 	else
+ 		g_warning ("unlock prompt queue is out of sync with prompts");
+=20
++	/*
++	 * We were disposed while this call was in flight, because the calling
++	 * client went away. There is nobody left to report to, but the global
++	 * unlock queue still has to be handed on to the next waiting prompt.
++	 */
++	if (self->skeleton =3D=3D NULL) {
++		cred =3D gck_session_create_object_finish (GCK_SESSION (object), res,=
 &error);
++		g_clear_object (&cred);
++		g_clear_error (&error);
++		mark_as_complete (self, TRUE);
++		g_object_unref (self);
++		return;
++	}
++
+ 	/* Now process the results */
+ 	cred =3D gck_session_create_object_finish (GCK_SESSION (object), res, =
&error);
+=20
+@@ -402,6 +435,13 @@ gkd_secret_unlock_dispose (GObject *obj)
+ {
+ 	GkdSecretUnlock *self =3D GKD_SECRET_UNLOCK (obj);
+=20
++	/*
++	 * Abort any PKCS#11 call that is still in flight. It holds its own
++	 * reference on us, and its callback would otherwise run against the
++	 * state we are about to tear down.
++	 */
++	g_cancellable_cancel (self->cancellable);
++
+ 	if (self->skeleton) {
+ 		g_dbus_interface_skeleton_unexport (G_DBUS_INTERFACE_SKELETON (self->=
skeleton));
+ 		g_clear_object (&self->skeleton);
diff --git a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring/0004-gk=
d-secret-session-drop-the-duplicate-session-unref.patch b/meta-gnome/reci=
pes-gnome/gnome-keyring/gnome-keyring/0004-gkd-secret-session-drop-the-du=
plicate-session-unref.patch
new file mode 100644
index 0000000000..707a8b1a1c
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring/0004-gkd-secre=
t-session-drop-the-duplicate-session-unref.patch
@@ -0,0 +1,58 @@
+From 011d89df54d0f441d17c449513ae0ef8aa21c4cd Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Tue, 15 Sep 2026 19:22:41 +0200
+Subject: [PATCH] gkd-secret-session: drop the duplicate session unref
+
+gkd_secret_session_get_item_secret() unrefs the session returned by
+gck_object_get_session() twice: once right after
+gck_session_wrap_key_full(), and once more below with a comment claiming
+the reference would otherwise leak. gck_object_get_session() hands out a
+single new reference, so the second unref drops one reference too many
+on every GetSecret call.
+
+The GckSession is freed while client->pkcs11_session and the GckObject
+of the session key still point at it. The daemon dies when the client
+leaves the bus and its dispatch table is torn down:
+
+    service_name_owner_changed         daemon/dbus/gkd-secret-service.c:=
944
+    free_client                        daemon/dbus/gkd-secret-service.c:=
264
+    dispose_and_unref                  daemon/dbus/gkd-secret-service.c:=
245
+    gkd_secret_session_dispose         daemon/dbus/gkd-secret-session.c:=
357
+    gck_object_finalize                gck/gck-object.c:135
+    g_object_unref                     -> SIGSEGV, rax =3D 0xaaaaaaaaaaa=
aaaaa
+
+Reproduced on a running system with a single "secret-tool lookup",
+symbolized against /usr/src/debug. The older crashes reported as
+"segfault at f00dface in libgck-1.so" are the same use after free caught
+at an earlier point.
+
+gkd-secret-lock.c:49 and gkd-secret-unlock.c:726 do it correctly, with
+exactly one unref per gck_object_get_session().
+
+Upstream-Status: Pending
+
+Still present in gnome-keyring main as of 2026-09-15.
+
+AI-Generated: Uses Claude Code (Claude Opus 5)
+---
+ daemon/dbus/gkd-secret-session.c | 7 -------
+ 1 file changed, 7 deletions(-)
+
+diff --git a/daemon/dbus/gkd-secret-session.c b/daemon/dbus/gkd-secret-s=
ession.c
+index 16bb368..6799b4c 100644
+--- a/daemon/dbus/gkd-secret-session.c
++++ b/daemon/dbus/gkd-secret-session.c
+@@ -609,13 +609,6 @@ gkd_secret_session_get_item_secret (GkdSecretSessio=
n *self, GckObject *item,
+ 					   NULL, &error);
+ 	g_object_unref (session);
+=20
+-	/*
+-	 * gck_object_get_session() returns a new reference, so drop it again.
+-	 * Not doing so leaks a GckSession on every GetSecret call, which in t=
urn
+-	 * keeps the client's PKCS#11 session alive after the client is gone.
+-	 */
+-	g_object_unref (session);
+-
+ 	if (error !=3D NULL) {
+ 		if (g_error_matches (error, GCK_ERROR, CKR_USER_NOT_LOGGED_IN)) {
+ 			g_set_error_literal (error_out, GKD_SECRET_ERROR,
diff --git a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_51.0.bb=
 b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_51.0.bb
index 14945145dd..12576f2eb4 100644
--- a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_51.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_51.0.bb
@@ -21,7 +21,11 @@ DEPENDS =3D " \
 inherit gnomebase gsettings gettext
=20
 SRC_URI[archive.sha256sum] =3D "2aebaa2d474cc31507c87a7bbbdb3e16dbe26b1c=
fef9f206457f3f9df43558b0"
-SRC_URI +=3D "file://0001-meson-allow-setting-the-paths-to-ssh-agent-and=
-ssh-add-by-option.patch"
+SRC_URI +=3D "file://0001-meson-allow-setting-the-paths-to-ssh-agent-and=
-ssh-add-by-option.patch \
+            file://0002-gkd-secret-service-destroy-the-dispatch-table-be=
fore.patch \
+            file://0003-gkd-secret-unlock-do-not-use-the-service-after-d=
ispo.patch \
+            file://0004-gkd-secret-session-drop-the-duplicate-session-un=
ref.patch \
+            "
=20
 PACKAGECONFIG ??=3D " \
     libcap-ng \
@@ -35,6 +39,7 @@ PACKAGECONFIG[ssh-agent] =3D "-Dssh-agent=3Dtrue -Dssh-=
agent-path=3D${bindir}/ssh-agen
 PACKAGECONFIG[systemd] =3D "-Dsystemd=3Denabled,-Dsystemd=3Ddisabled,sys=
temd"
=20
 EXTRA_OEMESON =3D " \
+    -Ddebug-mode=3Dfalse \
     -Dmanpage=3Dfalse \
     -Dpkcs11-config=3D${datadir}/p11-kit/modules \
     -Dpkcs11-modules=3D${libdir}/pkcs11 \
--=20
2.55.0


