Received: from mail-da0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Uce6y-0000ip-4G
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 May 2013 17:59:28 +0200
Received: by mail-da0-f43.google.com with SMTP id u7so1064175dae.16
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 May 2013 08:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=R3ADGNJ4zUMBdajhsoSWWXxFD3894GyDQcbZaM9dcpg=;
	b=mapTFg1bPgxOgTz/fIlFYreFESTmDZwR/TnT8+DmOggnJ1pzeoAsaEDTKJ5EfUweH1
	eFuWH1b0WqJM7DjfuZIyWH/WCrHkeMzofRhLNGG3whP/DOI1FUagKNh2HowzHz9ZYYlW
	zHjXrarBZf5jjcNBoDXoQm88GG1d2cRjhjxDfesKOuuVjKgnWf+kCBac9PcO4RIruraT
	dUuRyhI7daOW3pj8p6u746tWxF7PqYKfpPprhW9+RKpHk39A+VLPprr12v977CAWEmns
	y7e4GNIp65pr3x8+xhVqjpSX+haNBfa55+E5QWtGeSebrAhCdvT46uJfcDJLsIvFBOP9
	3bCQ==
X-Received: by 10.66.21.38 with SMTP id s6mr39368428pae.103.1368632474552;
	Wed, 15 May 2013 08:41:14 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id ay3sm2059113pbd.41.2013.05.15.08.41.13
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 15 May 2013 08:41:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 May 2013 08:39:35 -0700
Message-Id: <1368632376-20808-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-gnome][PATCH] gnome-bluetooth: Fix build erorrs found with gcc 4.8
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
X-List-Received-Date: Wed, 15 May 2013 15:59:29 -0000

Fix errors like below

| bluetooth-input.c:193:4: error: format '%d' expects argument of type
'int', but argument 5 has type 'XID' [-Werror=format=]
|     g_message ("has mouse: %s (id = %d)", device_info[i].name,
device_info[i].id);
|     ^
| bluetooth-input.c:198:4: error: format '%d' expects argument of type
'int', but argument 5 has type 'XID' [-Werror=format=]
|     g_message ("has keyboard: %s (id = %d)", device_info[i].name,
device_info[i].id);
|     ^

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-bluetooth-input-Fix-compile-errors.patch  |  304 ++++++++++++++++++++
 .../gnome-bluetooth/gnome-bluetooth_2.32.0.bb      |    2 +
 2 files changed, 306 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth/0001-bluetooth-input-Fix-compile-errors.patch

diff --git a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth/0001-bluetooth-input-Fix-compile-errors.patch b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth/0001-bluetooth-input-Fix-compile-errors.patch
new file mode 100644
index 0000000..7924c62
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth/0001-bluetooth-input-Fix-compile-errors.patch
@@ -0,0 +1,304 @@
+From 02e461eb57992d818d20d63cdb8688774a4152f6 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 15 May 2013 08:21:14 -0700
+Subject: [PATCH] bluetooth-input: Fix compile errors
+
+XID is unsigned long type so %d will error out with -Wformat
+where format warnings are being treated at errors
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Unknown
+---
+ wizard/bluetooth-input.c |  279 ++++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 279 insertions(+)
+ create mode 100644 wizard/bluetooth-input.c
+
+diff --git a/wizard/bluetooth-input.c b/wizard/bluetooth-input.c
+new file mode 100644
+index 0000000..d17e67c
+--- /dev/null
++++ b/wizard/bluetooth-input.c
+@@ -0,0 +1,279 @@
++/*
++ *
++ *  Copyright (C) 2009 Bastien Nocera <hadess@hadess.net>
++ *
++ *
++ *  This library is free software; you can redistribute it and/or
++ *  modify it under the terms of the GNU Lesser General Public
++ *  License as published by the Free Software Foundation; either
++ *  version 2.1 of the License, or (at your option) any later version.
++ *
++ *  This library is distributed in the hope that it will be useful,
++ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
++ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++ *  Lesser General Public License for more details.
++ *
++ *  You should have received a copy of the GNU Lesser General Public
++ *  License along with this library; if not, write to the Free Software
++ *  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
++ *
++ */
++
++#ifdef HAVE_CONFIG_H
++#include <config.h>
++#endif
++
++#include <string.h>
++#include <glib/gi18n-lib.h>
++#include <gtk/gtk.h>
++#include <gdk/gdkx.h>
++
++#include <X11/extensions/XInput.h>
++#include <X11/extensions/XIproto.h>
++
++#include "bluetooth-input.h"
++
++enum {
++	KEYBOARD_APPEARED,
++	KEYBOARD_DISAPPEARED,
++	MOUSE_APPEARED,
++	MOUSE_DISAPPEARED,
++	LAST_SIGNAL
++};
++
++static int signals[LAST_SIGNAL] = { 0 };
++
++#define BLUETOOTH_INPUT_GET_PRIVATE(obj) (G_TYPE_INSTANCE_GET_PRIVATE((obj), \
++				BLUETOOTH_TYPE_INPUT, BluetoothInputPrivate))
++
++typedef struct _BluetoothInputPrivate BluetoothInputPrivate;
++
++struct _BluetoothInputPrivate {
++	char *foo;
++};
++
++G_DEFINE_TYPE(BluetoothInput, bluetooth_input, G_TYPE_OBJECT)
++
++static void bluetooth_input_finalize(GObject *input)
++{
++	BluetoothInputPrivate *priv = BLUETOOTH_INPUT_GET_PRIVATE(input);
++
++	G_OBJECT_CLASS(bluetooth_input_parent_class)->finalize(input);
++}
++
++static void bluetooth_input_class_init(BluetoothInputClass *klass)
++{
++	GObjectClass *object_class = (GObjectClass *) klass;
++
++	g_type_class_add_private(klass, sizeof(BluetoothInputPrivate));
++
++	object_class->finalize = bluetooth_input_finalize;
++
++	signals[KEYBOARD_APPEARED] = g_signal_new ("keyboard-appeared",
++						   G_TYPE_FROM_CLASS (klass),
++						   G_SIGNAL_RUN_LAST,
++						   G_STRUCT_OFFSET (BluetoothInputClass, keyboard_appeared),
++						   NULL, NULL,
++						   g_cclosure_marshal_VOID__VOID,
++						   G_TYPE_NONE, 0, G_TYPE_NONE);
++	signals[KEYBOARD_DISAPPEARED] = g_signal_new ("keyboard-disappeared",
++						   G_TYPE_FROM_CLASS (klass),
++						   G_SIGNAL_RUN_LAST,
++						   G_STRUCT_OFFSET (BluetoothInputClass, keyboard_disappeared),
++						   NULL, NULL,
++						   g_cclosure_marshal_VOID__VOID,
++						   G_TYPE_NONE, 0, G_TYPE_NONE);
++	signals[MOUSE_APPEARED] = g_signal_new ("mouse-appeared",
++						G_TYPE_FROM_CLASS (klass),
++						G_SIGNAL_RUN_LAST,
++						G_STRUCT_OFFSET (BluetoothInputClass, mouse_appeared),
++						NULL, NULL,
++						g_cclosure_marshal_VOID__VOID,
++						G_TYPE_NONE, 0, G_TYPE_NONE);
++	signals[MOUSE_DISAPPEARED] = g_signal_new ("mouse-disappeared",
++						   G_TYPE_FROM_CLASS (klass),
++						   G_SIGNAL_RUN_LAST,
++						   G_STRUCT_OFFSET (BluetoothInputClass, mouse_disappeared),
++						   NULL, NULL,
++						   g_cclosure_marshal_VOID__VOID,
++						   G_TYPE_NONE, 0, G_TYPE_NONE);
++}
++
++static gboolean
++supports_xinput_devices (void)
++{
++	gint op_code, event, error;
++
++	return XQueryExtension (GDK_DISPLAY_XDISPLAY (gdk_display_get_default ()),
++				"XInputExtension",
++				&op_code,
++				&event,
++				&error);
++}
++
++static gboolean
++bluetooth_input_device_get_type (XDeviceInfo *info,
++				 gboolean *is_mouse,
++				 gboolean *is_keyboard)
++{
++	*is_mouse = FALSE;
++	*is_keyboard = FALSE;
++
++	if (info->num_classes > 0) {
++		XAnyClassPtr any;
++		guint i;
++		any = (XAnyClassPtr) (info->inputclassinfo);
++		for (i = 0; i < info->num_classes; i++) {
++			switch (any->class) {
++			case KeyClass: {
++#if 0
++				XKeyInfoPtr k;
++				k = (XKeyInfoPtr) any;
++				printf("\tNum_keys is %d\n", k->num_keys);
++#endif
++				/* FIXME there should be a better way */
++				if (g_str_has_prefix (info->name, "UVC Camera") == FALSE &&
++				    g_strcmp0 (info->name, "USB Audio") != 0)
++					*is_keyboard = TRUE;
++				break;
++			}
++			case ButtonClass:
++				*is_mouse = TRUE;
++				break;
++			default:
++				;;
++			}
++			any = (XAnyClassPtr) ((char *) any + any->length);
++		}
++	}
++
++	return (*is_mouse || *is_keyboard);
++}
++
++static gboolean
++bluetooth_input_ignore_device (const char *name)
++{
++	guint i;
++	const char const *names[] = {
++		"Virtual core XTEST pointer",
++		"Macintosh mouse button emulation",
++		"Virtual core XTEST keyboard",
++		"Power Button"
++	};
++
++	for (i = 0 ; i < G_N_ELEMENTS (names); i++) {
++		if (g_strcmp0 (name, names[i]) == 0)
++			return TRUE;
++	}
++	return FALSE;
++}
++
++void
++bluetooth_input_check_for_devices (BluetoothInput *input)
++{
++	XDeviceInfo *device_info;
++	gint n_devices;
++	guint i;
++	gboolean has_keyboard, has_mouse;
++
++	has_keyboard = FALSE;
++	has_mouse = FALSE;
++
++	device_info = XListInputDevices (GDK_DISPLAY_XDISPLAY (gdk_display_get_default ()), &n_devices);
++	for (i = 0; i < n_devices; i++) {
++		gboolean is_mouse, is_keyboard;
++		if (device_info[i].use != IsXExtensionKeyboard &&
++		    device_info[i].use != IsXExtensionPointer)
++			continue;
++		if (bluetooth_input_ignore_device (device_info[i].name) != FALSE)
++			continue;
++		if (bluetooth_input_device_get_type (&device_info[i], &is_mouse, &is_keyboard) == FALSE)
++			continue;
++		if (is_mouse != FALSE) {
++			g_message ("has mouse: %s (id = %lu)", device_info[i].name, device_info[i].id);
++			has_mouse = TRUE;
++			//break;
++		}
++		if (is_keyboard != FALSE) {
++			g_message ("has keyboard: %s (id = %lu)", device_info[i].name, device_info[i].id);
++			has_keyboard = TRUE;
++			//break;
++		}
++
++		//List and shit
++	}
++
++	if (device_info != NULL)
++		XFreeDeviceList (device_info);
++}
++
++static GdkFilterReturn
++devicepresence_filter (GdkXEvent *xevent,
++		       GdkEvent  *event,
++		       BluetoothInput *input)
++{
++	XEvent *xev = (XEvent *) xevent;
++	XEventClass class_presence;
++	int xi_presence;
++
++	DevicePresence (gdk_x11_get_default_xdisplay (), xi_presence, class_presence);
++
++	if (xev->type == xi_presence) {
++		XDevicePresenceNotifyEvent *dpn = (XDevicePresenceNotifyEvent *) xev;
++		if (dpn->devchange == DeviceEnabled || dpn->devchange == DeviceDisabled)
++			bluetooth_input_check_for_devices (input);
++	}
++	return GDK_FILTER_CONTINUE;
++}
++
++static void
++set_devicepresence_handler (BluetoothInput *input)
++{
++	Display *display;
++	XEventClass class_presence;
++	int xi_presence;
++
++	display = gdk_x11_get_default_xdisplay ();
++
++	gdk_error_trap_push ();
++	DevicePresence (display, xi_presence, class_presence);
++	XSelectExtensionEvent (display,
++			       RootWindow (display, DefaultScreen (display)),
++			       &class_presence, 1);
++
++	gdk_flush ();
++	if (!gdk_error_trap_pop ())
++		gdk_window_add_filter (NULL, (GdkFilterFunc) devicepresence_filter, input);
++}
++
++static void bluetooth_input_init(BluetoothInput *input)
++{
++	BluetoothInputPrivate *priv = BLUETOOTH_INPUT_GET_PRIVATE(input);
++
++	set_devicepresence_handler (input);
++}
++
++/**
++ * bluetooth_input_new:
++ *
++ * Return value: a reference to the #BluetoothInput singleton or %NULL when XInput is not supported. Unref the object when done.
++ **/
++BluetoothInput *bluetooth_input_new(void)
++{
++	static BluetoothInput *bluetooth_input = NULL;
++
++	if (bluetooth_input != NULL)
++		return g_object_ref (bluetooth_input);
++
++	if (supports_xinput_devices () == FALSE) {
++		g_warning ("XInput not supported, input device helper disabled");
++		return NULL;
++	}
++
++	bluetooth_input = BLUETOOTH_INPUT (g_object_new (BLUETOOTH_TYPE_INPUT, NULL));
++	g_object_add_weak_pointer (G_OBJECT (bluetooth_input),
++				   (gpointer) &bluetooth_input);
++
++	return bluetooth_input;
++}
++
+-- 
+1.7.9.5
+
diff --git a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb
index a2037cf..00ac3f8 100644
--- a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb
@@ -11,6 +11,8 @@ DEPENDS = "obexd gnome-doc-utils-native gnome-doc-utils gconf gtk+ dbus-glib lib
 
 inherit gnome
 
+SRC_URI += "file://0001-bluetooth-input-Fix-compile-errors.patch \
+           "
 SRC_URI[archive.md5sum] = "f129686fe46c4c98eb70a0cc85d59cae"
 SRC_URI[archive.sha256sum] = "57b1f06c96a1b85e1c19ff919d708cc38e95edae658881ed99968c325839a973"
 
-- 
1.7.9.5



