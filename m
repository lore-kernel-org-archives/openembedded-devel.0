Received: from vms173005pub.verizon.net ([206.46.173.5])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1O2xx6-00075P-Mq
	for openembedded-devel@lists.openembedded.org;
	Sat, 17 Apr 2010 04:40:20 +0200
Received: from gandalf.denix.org ([unknown] [71.251.58.177])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L1000AEU1WMDRY2@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	16 Apr 2010 21:36:31 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id F1F2914AF5F; Fri,
	16 Apr 2010 22:36:21 -0400 (EDT)
Date: Fri, 16 Apr 2010 22:36:03 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <1271471763-28331-1-git-send-email-denis@denix.org>
MIME-version: 1.0
X-Mailer: git-send-email 1.6.3.3
X-SA-Exim-Connect-IP: 206.46.173.5
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] xorg-headers-native: haven't been updated since 2006, do so now
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
X-List-Received-Date: Sat, 17 Apr 2010 02:40:20 -0000
Content-type: TEXT/PLAIN
Content-transfer-encoding: QUOTED-PRINTABLE

Update the combined headers from the following packages:
* xproto-7.0.16
* libx11-1.3.3
* libxau-1.0.5
* libxdmcp-1.0.3
* libxt-1.0.8

For example, GenericEvent is new since xproto-7.0.13 and prevents
libx11-native from building on an X-less host.

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 .../xorg-lib/xorg-headers-native/X11/CallbackI.h   |    4 +
 .../xorg-lib/xorg-headers-native/X11/Composite.h   |    2 +-
 .../xorg-lib/xorg-headers-native/X11/CompositeP.h  |    4 +
 .../xorg-lib/xorg-headers-native/X11/ConstrainP.h  |    4 +
 .../xorg-lib/xorg-headers-native/X11/Constraint.h  |    6 +-
 .../xorg-lib/xorg-headers-native/X11/ConvertI.h    |    3 +
 recipes/xorg-lib/xorg-headers-native/X11/Core.h    |    6 +-
 recipes/xorg-lib/xorg-headers-native/X11/CoreP.h   |    4 +
 recipes/xorg-lib/xorg-headers-native/X11/CreateI.h |    7 +
 .../xorg-lib/xorg-headers-native/X11/DECkeysym.h   |    2 -
 recipes/xorg-lib/xorg-headers-native/X11/EventI.h  |    4 +
 .../xorg-lib/xorg-headers-native/X11/HPkeysym.h    |    1 -
 .../xorg-lib/xorg-headers-native/X11/HookObjI.h    |    4 +
 recipes/xorg-lib/xorg-headers-native/X11/ImUtil.h  |    1 -
 .../xorg-lib/xorg-headers-native/X11/InitialI.h    |    4 +
 .../xorg-lib/xorg-headers-native/X11/IntrinsicI.h  |    4 +
 recipes/xorg-lib/xorg-headers-native/X11/Object.h  |    7 +-
 recipes/xorg-lib/xorg-headers-native/X11/ObjectP.h |    4 +
 .../xorg-lib/xorg-headers-native/X11/PassivGraI.h  |    4 +
 recipes/xorg-lib/xorg-headers-native/X11/RectObj.h |    7 +-
 .../xorg-lib/xorg-headers-native/X11/RectObjP.h    |    4 +
 .../xorg-lib/xorg-headers-native/X11/ResourceI.h   |    3 +
 recipes/xorg-lib/xorg-headers-native/X11/ShellP.h  |    8 +
 .../xorg-lib/xorg-headers-native/X11/Sunkeysym.h   |    2 -
 .../xorg-lib/xorg-headers-native/X11/ThreadsI.h    |   51 ++--
 .../xorg-lib/xorg-headers-native/X11/TranslateI.h  |    3 +
 .../xorg-lib/xorg-headers-native/X11/VarargsI.h    |    4 +
 recipes/xorg-lib/xorg-headers-native/X11/Vendor.h  |    4 +
 recipes/xorg-lib/xorg-headers-native/X11/VendorP.h |   10 +-
 recipes/xorg-lib/xorg-headers-native/X11/X.h       |    8 +-
 .../xorg-lib/xorg-headers-native/X11/XF86keysym.h  |  313 +++++++++-=
------
 recipes/xorg-lib/xorg-headers-native/X11/XKBlib.h  |   28 +-
 recipes/xorg-lib/xorg-headers-native/X11/XWDFile.h |    1 -
 recipes/xorg-lib/xorg-headers-native/X11/Xalloca.h |   36 +--
 recipes/xorg-lib/xorg-headers-native/X11/Xarch.h   |  133 +++----
 recipes/xorg-lib/xorg-headers-native/X11/Xauth.h   |   17 -
 recipes/xorg-lib/xorg-headers-native/X11/Xcms.h    |   10 +-
 recipes/xorg-lib/xorg-headers-native/X11/Xdefs.h   |    2 -
 recipes/xorg-lib/xorg-headers-native/X11/Xdmcp.h   |    2 +-
 .../xorg-lib/xorg-headers-native/X11/Xfuncproto.h  |   24 +-
 recipes/xorg-lib/xorg-headers-native/X11/Xfuncs.h  |   77 ++---
 recipes/xorg-lib/xorg-headers-native/X11/Xlib.h    |  151 ++++----
 .../xorg-lib/xorg-headers-native/X11/XlibConf.h    |    8 +-
 recipes/xorg-lib/xorg-headers-native/X11/Xlibint.h |  126 +++++--
 recipes/xorg-lib/xorg-headers-native/X11/Xlocale.h |    2 -
 recipes/xorg-lib/xorg-headers-native/X11/Xmd.h     |  161 ++++-----
 recipes/xorg-lib/xorg-headers-native/X11/Xos.h     |  280 ++++------=
-----
 recipes/xorg-lib/xorg-headers-native/X11/Xos_r.h   |  105 +----
 recipes/xorg-lib/xorg-headers-native/X11/Xosdefs.h |  192 ++++------
 recipes/xorg-lib/xorg-headers-native/X11/Xpoll.h   |   41 +--
 recipes/xorg-lib/xorg-headers-native/X11/Xproto.h  |   36 ++-
 .../xorg-lib/xorg-headers-native/X11/Xprotostr.h   |    1 -
 recipes/xorg-lib/xorg-headers-native/X11/Xregion.h |   19 +-
 .../xorg-lib/xorg-headers-native/X11/Xresource.h   |   16 +-
 .../xorg-lib/xorg-headers-native/X11/Xthreads.h    |  401 ++++++++++=
----------
 recipes/xorg-lib/xorg-headers-native/X11/Xutil.h   |   30 +-
 .../xorg-lib/xorg-headers-native/X11/Xw32defs.h    |  140 ++++----
 .../xorg-lib/xorg-headers-native/X11/Xwindows.h    |   49 ++-
 .../xorg-lib/xorg-headers-native/X11/Xwinsock.h    |   11 +-
 .../xorg-lib/xorg-headers-native/X11/cursorfont.h  |    6 +-
 recipes/xorg-lib/xorg-headers-native/X11/keysym.h  |    3 -
 .../xorg-lib/xorg-headers-native/X11/keysymdef.h   |   66 +++-
 62 files changed, 1266 insertions(+), 1400 deletions(-)

diff --git a/recipes/xorg-lib/xorg-headers-native/X11/CallbackI.h b/r=
ecipes/xorg-lib/xorg-headers-native/X11/CallbackI.h
index 4ae08ab..64e8152 100644
--- a/recipes/xorg-lib/xorg-headers-native/X11/CallbackI.h
+++ b/recipes/xorg-lib/xorg-headers-native/X11/CallbackI.h
@@ -58,6 +58,8 @@ typedef XrmResource **CallbackTable;
 #define _XtCBCalling 1
 #define _XtCBFreeAfterCalling 2
=20
+_XFUNCPROTOBEGIN
+
 typedef struct internalCallbackRec {
     unsigned short count;
     char=09   is_padded;=09/* contains NULL padding for external for=
m */
@@ -115,3 +117,5 @@ extern void _XtCallConditionalCallbackList(
     XtPointer=09=09=09/* call_data */,
     _XtConditionProc=09=09/* cond_proc */
 );
+
+_XFUNCPROTOEND
diff --git a/recipes/xorg-lib/xorg-headers-native/X11/Composite.h b/r=
ecipes/xorg-lib/xorg-headers-native/X11/Composite.h
index 0a58332..c3c9828 100644
--- a/recipes/xorg-lib/xorg-headers-native/X11/Composite.h
+++ b/recipes/xorg-lib/xorg-headers-native/X11/Composite.h
@@ -97,7 +97,7 @@ extern void XtChangeManagedSet(
=20
 _XFUNCPROTOEND
=20
-#ifndef XT_COMPOSITE
+#ifndef VMS
 externalref WidgetClass compositeWidgetClass;
 #endif
=20
diff --git a/recipes/xorg-lib/xorg-headers-native/X11/CompositeP.h b/=
recipes/xorg-lib/xorg-headers-native/X11/CompositeP.h
index ed055b2..e93275a 100644
--- a/recipes/xorg-lib/xorg-headers-native/X11/CompositeP.h
+++ b/recipes/xorg-lib/xorg-headers-native/X11/CompositeP.h
@@ -52,6 +52,8 @@ SOFTWARE.
=20
 #include <X11/Composite.h>
=20
+_XFUNCPROTOBEGIN
+
 /*******************************************************************=
*****
  *
  * Additional instance fields for widgets of (sub)class 'Composite'=
=20
@@ -101,6 +103,8 @@ typedef struct _CompositeClassRec {
=20
 externalref CompositeClassRec compositeClassRec;
=20
+_XFUNCPROTOEND
+
 #define XtCompositeExtensionVersion 2L
 #define XtInheritGeometryManager ((XtGeometryHandler) _XtInherit)
 #define XtInheritChangeManaged ((XtWidgetProc) _XtInherit)
diff --git a/recipes/xorg-lib/xorg-headers-native/X11/ConstrainP.h b/=
recipes/xorg-lib/xorg-headers-native/X11/ConstrainP.h
index a90d19a..7030a34 100644
--- a/recipes/xorg-lib/xorg-headers-native/X11/ConstrainP.h
+++ b/recipes/xorg-lib/xorg-headers-native/X11/ConstrainP.h
@@ -52,6 +52,8 @@ SOFTWARE.
=20
 #include <X11/Constraint.h>
=20
+_XFUNCPROTOBEGIN
+
 typedef struct _ConstraintPart {
     XtPointer   mumble;=09=09/* No new fields, keep C compiler happy=
 */
 } ConstraintPart;
@@ -88,6 +90,8 @@ typedef struct _ConstraintClassRec {
=20
 externalref ConstraintClassRec constraintClassRec;
=20
+_XFUNCPROTOEND
+
 #define XtConstraintExtensionVersion 1L
=20
 #endif /* _XtConstraintP_h */
diff --git a/recipes/xorg-lib/xorg-headers-native/X11/Constraint.h b/=
recipes/xorg-lib/xorg-headers-native/X11/Constraint.h
index 9bb962e..977e7ee 100644
--- a/recipes/xorg-lib/xorg-headers-native/X11/Constraint.h
+++ b/recipes/xorg-lib/xorg-headers-native/X11/Constraint.h
@@ -50,11 +50,15 @@ SOFTWARE.
 #ifndef _XtConstraint_h
 #define _XtConstraint_h
=20
+_XFUNCPROTOBEGIN
+
 typedef struct _ConstraintClassRec *ConstraintWidgetClass;
=20
-#ifndef CONSTRAINT
+#ifndef VMS
 externalref WidgetClass constraintWidgetClass;
 #endif
=20
+_XFUNCPROTOEND
+
 #endif /* _XtConstraint_h */
 /* DON'T ADD STUFF AFTER THIS #endif */
diff --git a/recipes/xorg-lib/xorg-headers-native/X11/ConvertI.h b/re=
cipes/xorg-lib/xorg-headers-native/X11/ConvertI.h
index 02c0e5c..f3f7fb0 100644
--- a/recipes/xorg-lib/xorg-headers-native/X11/ConvertI.h
+++ b/recipes/xorg-lib/xorg-headers-native/X11/ConvertI.h
@@ -48,6 +48,8 @@ SOFTWARE.
 ******************************************************************/
 /* $XFree86: xc/lib/Xt/ConvertI.h,v 1.3 2001/12/14 19:56:09 dawes Ex=
p $ */
=20
+_XFUNCPROTOBEGIN
+
 /* Representation types */
=20
 extern=09XrmQuark  _XtQString;
@@ -94,3 +96,4 @@ extern Boolean _XtConvert(
=20
 void _XtConvertInitialize(void);
=20
+_XFUNCPROTOEND
diff --git a/recipes/xorg-lib/xorg-headers-native/X11/Core.h b/recipe=
s/xorg-lib/xorg-headers-native/X11/Core.h
index ff6cb75..5127b50 100644
--- a/recipes/xorg-lib/xorg-headers-native/X11/Core.h
+++ b/recipes/xorg-lib/xorg-headers-native/X11/Core.h
@@ -53,14 +53,18 @@ SOFTWARE.
 #ifndef _XtCore_h
 #define _XtCore_h
=20
+_XFUNCPROTOBEGIN
+
 typedef struct _WidgetClassRec *CoreWidgetClass;
 typedef struct _WidgetRec *CoreWidget;
 externalref WidgetClass coreWidgetClass;
=20
-#ifndef _XT_CORE_C
+#ifndef VMS
 externalref WidgetClass widgetClass;
=20
 #endif
=20
+_XFUNCPROTOEND
+
 #endif /* _XtCore_h */
 /* DON'T ADD STUFF AFTER THIS #endif */
diff --git a/recipes/xorg-lib/xorg-headers-native/X11/CoreP.h b/recip=
es/xorg-lib/xorg-headers-native/X11/CoreP.h
index e07f085..57836e6 100644
--- a/recipes/xorg-lib/xorg-headers-native/X11/CoreP.h
+++ b/recipes/xorg-lib/xorg-headers-native/X11/CoreP.h
@@ -55,6 +55,8 @@ SOFTWARE.
=20
 #include <X11/Core.h>
=20
+_XFUNCPROTOBEGIN
+
 externalref int _XtInheritTranslations;
=20
 #define XtInheritTranslations  ((String) &_XtInheritTranslations)
@@ -167,5 +169,7 @@ typedef struct _WidgetClassRec {
 externalref WidgetClassRec widgetClassRec;
 #define coreClassRec widgetClassRec
=20
+_XFUNCPROTOEND
+
 #endif /* _XtCoreP_h */
 /* DON'T ADD STUFF AFTER THIS #endif */
diff --git a/recipes/xorg-lib/xorg-headers-native/X11/CreateI.h b/rec=
ipes/xorg-lib/xorg-headers-native/X11/CreateI.h
index 87abb1d..e0ca9a3 100644
--- a/recipes/xorg-lib/xorg-headers-native/X11/CreateI.h
+++ b/recipes/xorg-lib/xorg-headers-native/X11/CreateI.h
@@ -3,6 +3,8 @@
 #ifndef _XtcreateI_h
 #define _XtcreateI_h
=20
+_XFUNCPROTOBEGIN
+
 extern Widget _XtCreateWidget(String name, WidgetClass widget_class,
 =09=09=09      Widget parent, ArgList args, Cardinal num_args,
 =09=09=09      XtTypedArgList typed_args,
@@ -18,9 +20,12 @@ extern Widget _XtAppCreateShell(String name, Strin=
g class,
 =09=09=09=09Cardinal num_typed_args);
 extern Widget _XtCreateHookObj(Screen *screen);
=20
+_XFUNCPROTOEND
=20
 #include <stdarg.h>
=20
+_XFUNCPROTOBEGIN
+
 /* VarCreate.c */
 extern Widget _XtVaOpenApplication(XtAppContext *app_context_return,
 =09=09=09_Xconst char* application_class,
@@ -34,4 +39,6 @@ extern Widget _XtVaAppInitialize(XtAppContext *app_=
context_return,
 =09=09=09int *argc_in_out, String *argv_in_out,
 =09=09=09String *fallback_resources, va_list var_args);
=20
+_XFUNCPROTOEND
+
 #endif /* _XtcreateI_h */
diff --git a/recipes/xorg-lib/xorg-headers-native/X11/DECkeysym.h b/r=
ecipes/xorg-lib/xorg-headers-native/X11/DECkeysym.h
index 6ab103e..0730716 100644
--- a/recipes/xorg-lib/xorg-headers-native/X11/DECkeysym.h
+++ b/recipes/xorg-lib/xorg-headers-native/X11/DECkeysym.h
@@ -1,5 +1,3 @@
-/* $Xorg: DECkeysym.h,v 1.4 2001/02/09 02:03:22 xorgcvs Exp $ */
-
 /***********************************************************
=20
 Copyright 1988, 1998  The Open Group
diff --git a/recipes/xorg-lib/xorg-headers-native/X11/EventI.h b/reci=
pes/xorg-lib/xorg-headers-native/X11/EventI.h
index 00858e7..d2d1d0f 100644
--- a/recipes/xorg-lib/xorg-headers-native/X11/EventI.h
+++ b/recipes/xorg-lib/xorg-headers-native/X11/EventI.h
@@ -65,6 +65,8 @@ typedef struct _XtGrabRec  *XtGrabList;
=20
 #include "PassivGraI.h"
=20
+_XFUNCPROTOBEGIN
+
 extern void _XtEventInitialize(
     void
 );
@@ -131,4 +133,6 @@ extern void _XtFillAncestorList(Widget **listPtr,=
 int *maxElemsPtr,
 /* NextEvent.c */
 extern Boolean XtAppPeekEvent_SkipTimer;
=20
+_XFUNCPROTOEND
+
 #endif /* _Event_h_ */
diff --git a/recipes/xorg-lib/xorg-headers-native/X11/HPkeysym.h b/re=
cipes/xorg-lib/xorg-headers-native/X11/HPkeysym.h
index 2d09277..ed000b1 100644
--- a/recipes/xorg-lib/xorg-headers-native/X11/HPkeysym.h
+++ b/recipes/xorg-lib/xorg-headers-native/X11/HPkeysym.h
@@ -1,4 +1,3 @@
-/* $Xorg: HPkeysym.h,v 1.5 2001/02/09 02:03:22 xorgcvs Exp $ */
 /*
=20
 Copyright 1987, 1998  The Open Group
diff --git a/recipes/xorg-lib/xorg-headers-native/X11/HookObjI.h b/re=
cipes/xorg-lib/xorg-headers-native/X11/HookObjI.h
index c9a22a2..c0858c2 100644
--- a/recipes/xorg-lib/xorg-headers-native/X11/HookObjI.h
+++ b/recipes/xorg-lib/xorg-headers-native/X11/HookObjI.h
@@ -29,6 +29,8 @@ in this Software without prior written authorizatio=
n from The Open Group.
 #ifndef _XtHookObjI_h
 #define _XtHookObjI_h
=20
+_XFUNCPROTOBEGIN
+
 /* This object is implementation-dependent and private to the librar=
y. */
=20
 typedef struct _HookObjRec *HookObject;
@@ -66,6 +68,8 @@ typedef struct _HookObjClassRec {
=20
 externalref HookObjClassRec hookObjClassRec;
=20
+_XFUNCPROTOEND
+
 #endif /* ifndef _Xt_HookObjI_h */
=20
=20
diff --git a/recipes/xorg-lib/xorg-headers-native/X11/ImUtil.h b/reci=
pes/xorg-lib/xorg-headers-native/X11/ImUtil.h
index 89f0381..5b62571 100644
--- a/recipes/xorg-lib/xorg-headers-native/X11/ImUtil.h
+++ b/recipes/xorg-lib/xorg-headers-native/X11/ImUtil.h
@@ -1,4 +1,3 @@
-/* $XFree86: xc/lib/X11/ImUtil.h,v 1.2 2003/04/15 22:10:07 herrb Exp=
 $ */
=20
 #ifndef _IMUTIL_H_
 #define _IMUTIL_H_
diff --git a/recipes/xorg-lib/xorg-headers-native/X11/InitialI.h b/re=
cipes/xorg-lib/xorg-headers-native/X11/InitialI.h
index c2fe47c..2ae9b74 100644
--- a/recipes/xorg-lib/xorg-headers-native/X11/InitialI.h
+++ b/recipes/xorg-lib/xorg-headers-native/X11/InitialI.h
@@ -84,6 +84,8 @@ SOFTWARE.
 #include <X11/Xos.h>
 #include <X11/Xpoll.h>
=20
+_XFUNCPROTOBEGIN
+
 typedef struct _TimerEventRec {
         struct timeval        te_timer_value;
 =09struct _TimerEventRec *te_next;
@@ -426,4 +428,6 @@ extern XrmDatabase _XtPreparseCommandLine(XrmOpti=
onDescRec *urlist,
 =09=09=09String *applName, String *displayName,
 =09=09=09String *language);
=20
+_XFUNCPROTOEND
+
 #endif /* _XtinitialI_h */
diff --git a/recipes/xorg-lib/xorg-headers-native/X11/IntrinsicI.h b/=
recipes/xorg-lib/xorg-headers-native/X11/IntrinsicI.h
index d749867..d88166f 100644
--- a/recipes/xorg-lib/xorg-headers-native/X11/IntrinsicI.h
+++ b/recipes/xorg-lib/xorg-headers-native/X11/IntrinsicI.h
@@ -194,6 +194,8 @@ SOFTWARE.
 #define ERRORDB "/usr/lib/X11/XtErrorDB"
 #endif
=20
+_XFUNCPROTOBEGIN
+
 extern String XtCXtToolkitError;
=20
 extern void _XtAllocError(
@@ -257,5 +259,7 @@ extern char* __XtCalloc (
 #define __XtCalloc XtCalloc
 #endif
=20
+_XFUNCPROTOEND
+
 #endif /* _XtintrinsicI_h */
 /* DON'T ADD STUFF AFTER THIS #endif */
diff --git a/recipes/xorg-lib/xorg-headers-native/X11/Object.h b/reci=
pes/xorg-lib/xorg-headers-native/X11/Object.h
index 96723b1..5ef65de 100644
--- a/recipes/xorg-lib/xorg-headers-native/X11/Object.h
+++ b/recipes/xorg-lib/xorg-headers-native/X11/Object.h
@@ -50,11 +50,16 @@ SOFTWARE.
 #ifndef _XtObject_h
 #define _XtObject_h
=20
+_XFUNCPROTOBEGIN
+
 typedef struct _ObjectRec *Object;
 typedef struct _ObjectClassRec *ObjectClass;
=20
-#ifndef OBJECT
+#ifndef VMS
 externalref WidgetClass objectClass;
 #endif
+
+_XFUNCPROTOEND
+
 #endif /* _XtObject_h */
 /* DON'T ADD STUFF AFTER THIS #endif */
diff --git a/recipes/xorg-lib/xorg-headers-native/X11/ObjectP.h b/rec=
ipes/xorg-lib/xorg-headers-native/X11/ObjectP.h
index a24564e..0f484d2 100644
--- a/recipes/xorg-lib/xorg-headers-native/X11/ObjectP.h
+++ b/recipes/xorg-lib/xorg-headers-native/X11/ObjectP.h
@@ -52,6 +52,8 @@ SOFTWARE.
=20
 #include <X11/Object.h>
=20
+_XFUNCPROTOBEGIN
+
 /**********************************************************
  * Object Instance Data Structures
  *
@@ -132,6 +134,8 @@ typedef struct _ObjectClassRec {
=20
 externalref ObjectClassRec objectClassRec;
=20
+_XFUNCPROTOEND
+
 #define XtObjectExtensionVersion 1L
 #define XtInheritAllocate ((XtAllocateProc) _XtInherit)
 #define XtInheritDeallocate ((XtDeallocateProc) _XtInherit)
diff --git a/recipes/xorg-lib/xorg-headers-native/X11/PassivGraI.h b/=
recipes/xorg-lib/xorg-headers-native/X11/PassivGraI.h
index 02e2964..10591ac 100644
--- a/recipes/xorg-lib/xorg-headers-native/X11/PassivGraI.h
+++ b/recipes/xorg-lib/xorg-headers-native/X11/PassivGraI.h
@@ -60,6 +60,8 @@ in this Software without prior written authorizatio=
n from The Open Group.
 #define KEYBOARD TRUE
 #define POINTER  FALSE
=20
+_XFUNCPROTOBEGIN
+
 typedef enum {
     XtNoServerGrab,=20
     XtPassiveServerGrab,
@@ -183,4 +185,6 @@ extern void _XtClearAncestorCache(
     Widget=09=09/* widget */
 );
=20
+_XFUNCPROTOEND
+
 #endif /* _PDI_h_ */
diff --git a/recipes/xorg-lib/xorg-headers-native/X11/RectObj.h b/rec=
ipes/xorg-lib/xorg-headers-native/X11/RectObj.h
index 07615fa..81e43a5 100644
--- a/recipes/xorg-lib/xorg-headers-native/X11/RectObj.h
+++ b/recipes/xorg-lib/xorg-headers-native/X11/RectObj.h
@@ -50,11 +50,16 @@ SOFTWARE.
 #ifndef _XtRect_h
 #define _XtRect_h
=20
+_XFUNCPROTOBEGIN
+
 typedef struct _RectObjRec *RectObj;
 typedef struct _RectObjClassRec *RectObjClass;
=20
-#ifndef RECTOBJ
+#ifndef VMS
 externalref WidgetClass rectObjClass;
 #endif
+
+_XFUNCPROTOEND
+
 #endif /* _XtRect_h */
 /* DON'T ADD STUFF AFTER THIS #endif */
diff --git a/recipes/xorg-lib/xorg-headers-native/X11/RectObjP.h b/re=
cipes/xorg-lib/xorg-headers-native/X11/RectObjP.h
index ca3b8ad..d6ffb78 100644
--- a/recipes/xorg-lib/xorg-headers-native/X11/RectObjP.h
+++ b/recipes/xorg-lib/xorg-headers-native/X11/RectObjP.h
@@ -53,6 +53,8 @@ SOFTWARE.
 #include <X11/RectObj.h>
 #include <X11/ObjectP.h>
=20
+_XFUNCPROTOBEGIN
+
 /**********************************************************
  * Rectangle Object Instance Data Structures
  *
@@ -126,4 +128,6 @@ typedef struct _RectObjClassRec {
=20
 externalref RectObjClassRec rectObjClassRec;
=20
+_XFUNCPROTOEND
+
 #endif /*_Xt_RectObjP_h_*/
diff --git a/recipes/xorg-lib/xorg-headers-native/X11/ResourceI.h b/r=
ecipes/xorg-lib/xorg-headers-native/X11/ResourceI.h
index d6ed1df..3db97f8 100644
--- a/recipes/xorg-lib/xorg-headers-native/X11/ResourceI.h
+++ b/recipes/xorg-lib/xorg-headers-native/X11/ResourceI.h
@@ -61,6 +61,8 @@ SOFTWARE.
 #define StringToName(string) XrmStringToName(string)
 #define StringToClass(string) XrmStringToClass(string)
=20
+_XFUNCPROTOBEGIN
+
 extern void _XtDependencies(
     XtResourceList  * /* class_resp */,
     Cardinal=09    * /* class_num_resp */,
@@ -96,5 +98,6 @@ extern XrmResourceList* _XtCreateIndirectionTable(X=
tResourceList resources,
 =09=09=09=09=09=09  Cardinal num_resources);
 extern void _XtResourceListInitialize(void);
=20
+_XFUNCPROTOEND
=20
 #endif /* _XtresourceI_h */
diff --git a/recipes/xorg-lib/xorg-headers-native/X11/ShellP.h b/reci=
pes/xorg-lib/xorg-headers-native/X11/ShellP.h
index 2b08c3f..7297d33 100644
--- a/recipes/xorg-lib/xorg-headers-native/X11/ShellP.h
+++ b/recipes/xorg-lib/xorg-headers-native/X11/ShellP.h
@@ -67,6 +67,8 @@ SOFTWARE.
  * *****
  */
=20
+_XFUNCPROTOBEGIN
+
 /*******************************************************************=
****
  *
  * Shell Widget Private Data
@@ -214,8 +216,12 @@ typedef  struct {
 =09WMShellPart=09wm;
 } WMShellRec, *WMShellWidget;
=20
+_XFUNCPROTOEND
+
 #include <X11/VendorP.h>
=20
+_XFUNCPROTOBEGIN
+
 /*******************************************************************=
****
  *
  * TransientShell Widget Private Data
@@ -425,4 +431,6 @@ typedef  struct {
 =09SessionShellPart session;
 } SessionShellRec, *SessionShellWidget;
=20
+_XFUNCPROTOEND
+
 #endif /* _XtShellPrivate_h */
diff --git a/recipes/xorg-lib/xorg-headers-native/X11/Sunkeysym.h b/r=
ecipes/xorg-lib/xorg-headers-native/X11/Sunkeysym.h
index e723444..be1b21d 100644
--- a/recipes/xorg-lib/xorg-headers-native/X11/Sunkeysym.h
+++ b/recipes/xorg-lib/xorg-headers-native/X11/Sunkeysym.h
@@ -1,5 +1,3 @@
-/* $Xorg: Sunkeysym.h,v 1.4 2001/02/09 02:03:22 xorgcvs Exp $ */
-
 /************************************************************
=20
 Copyright 1991, 1998  The Open Group
diff --git a/recipes/xorg-lib/xorg-headers-native/X11/ThreadsI.h b/re=
cipes/xorg-lib/xorg-headers-native/X11/ThreadsI.h
index 1492d77..b1c51e7 100644
--- a/recipes/xorg-lib/xorg-headers-native/X11/ThreadsI.h
+++ b/recipes/xorg-lib/xorg-headers-native/X11/ThreadsI.h
@@ -1,30 +1,27 @@
 /* $Xorg: ThreadsI.h,v 1.4 2001/02/09 02:03:59 xorgcvs Exp $ */
=20
 /************************************************************
-Copyright 1993 by Sun Microsystems, Inc. Mountain View, CA.
-
-                    All Rights Reserved
-
-Permission  to  use,  copy,  modify,  and  distribute   this
-software  and  its documentation for any purpose and without
-fee is hereby granted, provided that the above copyright no-
-tice  appear  in all copies and that both that copyright no-
-tice and this permission notice appear in  supporting  docu-
-mentation,  and  that the name Sun not be used in advertising=20
-or publicity pertaining to distribution  of  the software =20
-without specific prior written permission. Sun makes no=20
-representations about the suitability of this software for=20
-any purpose. It is provided "as is" without any express or=20
-implied warranty.
-
-SUN DISCLAIMS ALL WARRANTIES WITH REGARD TO  THIS  SOFTWARE,
-INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FIT-
-NESS FOR A PARTICULAR PURPOSE. IN NO EVENT SHALL SUN BE  LI-
-ABLE  FOR  ANY SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR
-ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE,  DATA  OR
-PROFITS,  WHETHER  IN  AN  ACTION OF CONTRACT, NEGLIGENCE OR
-OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION  WITH
-THE USE OR PERFORMANCE OF THIS SOFTWARE.
+
+Copyright 1993 Sun Microsystems, Inc.  All rights reserved.
+
+Permission is hereby granted, free of charge, to any person obtainin=
g a
+copy of this software and associated documentation files (the "Softw=
are"),
+to deal in the Software without restriction, including without limit=
ation
+the rights to use, copy, modify, merge, publish, distribute, sublice=
nse,
+and/or sell copies of the Software, and to permit persons to whom th=
e
+Software is furnished to do so, subject to the following conditions:
+
+The above copyright notice and this permission notice (including the=
 next
+paragraph) shall be included in all copies or substantial portions o=
f the
+Software.
+
+THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPR=
ESS OR
+IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABIL=
ITY,
+FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT S=
HALL
+THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR=
 OTHER
+LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARIS=
ING
+FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+DEALINGS IN THE SOFTWARE.
=20
 ********************************************************/
=20
@@ -81,6 +78,8 @@ typedef void (*ThreadAppRestoreLockProc)(
     Boolean* /* pushed_thread */
 );
=20
+_XFUNCPROTOBEGIN
+
 extern void (*_XtProcessLock)(
     void
 );
@@ -93,6 +92,8 @@ extern void (*_XtInitAppLock)(
     XtAppContext /* app */
 );
=20
+_XFUNCPROTOEND
+
 #define INIT_APP_LOCK(app) if(_XtInitAppLock) (*_XtInitAppLock)(app)
 #define FREE_APP_LOCK(app) if(app && app->free_lock)(*app->free_lock=
)(app)
=20
@@ -111,7 +112,7 @@ extern void (*_XtInitAppLock)(
 =09XtWidgetToApplicationContext(w) : NULL)
=20
 #define DPY_TO_APPCON(d) \
-    XtAppContext app =3D (_XtProcessLock ? XtDisplayToApplicationCon=
text(d): 0)
+    XtAppContext app =3D (_XtProcessLock ? XtDisplayToApplicationCon=
text(d): NULL)
=20
 #else /* defined(XTHREADS) */
=20
diff --git a/recipes/xorg-lib/xorg-headers-native/X11/TranslateI.h b/=
recipes/xorg-lib/xorg-headers-native/X11/TranslateI.h
index 1224875..6cc3099 100644
--- a/recipes/xorg-lib/xorg-headers-native/X11/TranslateI.h
+++ b/recipes/xorg-lib/xorg-headers-native/X11/TranslateI.h
@@ -342,6 +342,8 @@ typedef struct _TMGlobalRec{
 #endif /* TRACE_TM */
 }TMGlobalRec;
=20
+_XFUNCPROTOBEGIN
+
 extern TMGlobalRec _XtGlobalTM;
=20
 #define TM_MOD_SEGMENT_SIZE =0916
@@ -604,3 +606,4 @@ extern void _XtUnmergeTranslations(
 /* TMKey.c */
 extern void _XtAllocTMContext(XtPerDisplay pd);
=20
+_XFUNCPROTOEND
diff --git a/recipes/xorg-lib/xorg-headers-native/X11/VarargsI.h b/re=
cipes/xorg-lib/xorg-headers-native/X11/VarargsI.h
index e15404a..76ce9bc 100644
--- a/recipes/xorg-lib/xorg-headers-native/X11/VarargsI.h
+++ b/recipes/xorg-lib/xorg-headers-native/X11/VarargsI.h
@@ -34,6 +34,8 @@ in this Software without prior written authorizatio=
n from The Open Group.
 =20
 /* private routines */
=20
+_XFUNCPROTOBEGIN
+
 extern void _XtCountVaList(
     va_list /*var*/, int* /*total_count*/, int* /*typed_count*/
 );
@@ -62,4 +64,6 @@ extern void _XtGetSubresources(
     Widget /*w*/, XtPointer /*base*/, const char* /*name*/, const ch=
ar* /*class*/, XtResourceList /*resources*/, Cardinal /*num_resources=
*/, ArgList /*args*/, Cardinal /*num_args*/, XtTypedArgList /*typed_a=
rgs*/, Cardinal /*num_typed_args*/
 );
=20
+_XFUNCPROTOEND
+
 #endif /* _VarargsI_h_ */
diff --git a/recipes/xorg-lib/xorg-headers-native/X11/Vendor.h b/reci=
pes/xorg-lib/xorg-headers-native/X11/Vendor.h
index 65e7c38..633d17a 100644
--- a/recipes/xorg-lib/xorg-headers-native/X11/Vendor.h
+++ b/recipes/xorg-lib/xorg-headers-native/X11/Vendor.h
@@ -65,7 +65,11 @@ SOFTWARE.
=20
 typedef struct _VendorShellClassRec *VendorShellWidgetClass;
=20
+_XFUNCPROTOBEGIN
+
 externalref WidgetClass vendorShellWidgetClass;
=20
+_XFUNCPROTOEND
+
 #endif /* _XtVendor_h */
 /* DON'T ADD STUFF AFTER THIS #endif */
diff --git a/recipes/xorg-lib/xorg-headers-native/X11/VendorP.h b/rec=
ipes/xorg-lib/xorg-headers-native/X11/VendorP.h
index 2e5a975..e60857d 100644
--- a/recipes/xorg-lib/xorg-headers-native/X11/VendorP.h
+++ b/recipes/xorg-lib/xorg-headers-native/X11/VendorP.h
@@ -68,14 +68,12 @@ SOFTWARE.
 #ifndef  _XtVendorPrivate_h
 #define _XtVendorPrivate_h
=20
-#ifdef __cplusplus
-extern "C" {
-#endif
-
 #include <X11/Vendor.h>
=20
 /* New fields for the VendorShell widget class record */
=20
+_XFUNCPROTOBEGIN
+
 typedef struct {
     XtPointer       extension;          /* pointer to extension reco=
rd      */
 } VendorShellClassPart;
@@ -104,8 +102,6 @@ typedef  struct {
 =09VendorShellPart=09vendor;
 } VendorShellRec, *VendorShellWidget;
=20
-#ifdef __cplusplus
-}
-#endif
+_XFUNCPROTOEND
=20
 #endif  /* _XtVendorPrivate_h */
diff --git a/recipes/xorg-lib/xorg-headers-native/X11/X.h b/recipes/x=
org-lib/xorg-headers-native/X11/X.h
index 0a9c501..5cf695d 100644
--- a/recipes/xorg-lib/xorg-headers-native/X11/X.h
+++ b/recipes/xorg-lib/xorg-headers-native/X11/X.h
@@ -1,7 +1,3 @@
-/*
- *=09$Xorg: X.h,v 1.4 2001/02/09 02:03:22 xorgcvs Exp $
- */
-
 /* Definitions for the X window system likely to be used by applicat=
ions */
=20
 #ifndef X_H
@@ -53,7 +49,6 @@ ARISING OUT OF OR IN CONNECTION WITH THE USE OR PER=
FORMANCE OF THIS
 SOFTWARE.
=20
 ******************************************************************/
-/* $XFree86: xc/include/X.h,v 1.6 2003/07/09 15:27:28 tsi Exp $ */
=20
 #define X_PROTOCOL=0911=09=09/* current protocol version */
 #define X_PROTOCOL_REVISION 0=09=09/* current minor version */
@@ -216,7 +211,8 @@ are reserved in the protocol for errors and repli=
es. */
 #define ColormapNotify=09=0932
 #define ClientMessage=09=0933
 #define MappingNotify=09=0934
-#define LASTEvent=09=0935=09/* must be bigger than any event # */
+#define GenericEvent=09=0935
+#define LASTEvent=09=0936=09/* must be bigger than any event # */
=20
=20
 /* Key masks. Used as modifiers to GrabButton and GrabKey, results o=
f QueryPointer,
diff --git a/recipes/xorg-lib/xorg-headers-native/X11/XF86keysym.h b/=
recipes/xorg-lib/xorg-headers-native/X11/XF86keysym.h
index fdb8fd6..96eefdb 100644
--- a/recipes/xorg-lib/xorg-headers-native/X11/XF86keysym.h
+++ b/recipes/xorg-lib/xorg-headers-native/X11/XF86keysym.h
@@ -1,5 +1,3 @@
-/* $XFree86: xc/include/XF86keysym.h,v 1.16 2003/02/11 02:51:10 dawe=
s Exp $ */
-
 /*
  * XFree86 vendor specific keysyms.
  *
@@ -19,7 +17,7 @@
 #define XF86XK_ModeLock=09=090x1008FF01=09/* Mode Switch Lock */
=20
 /*
- * Note, 0x1008FF02 - 0x1008FF0F are free and should be used for mis=
c new
+ * Note, 0x1008FF07 - 0x1008FF0F are free and should be used for mis=
c new
  * keysyms that don't fit into any of the groups below.
  *
  * 0x1008FF64, 0x1008FF6F, 0x1008FF71, 0x1008FF83 are no longer used=
,
@@ -27,147 +25,190 @@
  *
  * Check in keysymdef.h for generic symbols before adding new XFree8=
6-specific
  * symbols here.
+ *
+ * X.Org will not be adding to the XF86 set of keysyms, though they =
have
+ * been adopted and are considered a "standard" part of X keysym def=
initions.
+ * XFree86 never properly commented these keysyms, so we have done o=
ur
+ * best to explain the semantic meaning of these keys.
+ *
+ * XFree86 has removed their mail archives of the period, that might=
 have
+ * shed more light on some of these definitions. Until/unless we res=
urrect
+ * these archives, these are from memory and usage.
  */
=20
=20
+/* Backlight controls. */
+#define XF86XK_MonBrightnessUp   0x1008FF02  /* Monitor/panel bright=
ness */
+#define XF86XK_MonBrightnessDown 0x1008FF03  /* Monitor/panel bright=
ness */
+#define XF86XK_KbdLightOnOff     0x1008FF04  /* Keyboards may be lit=
     */
+#define XF86XK_KbdBrightnessUp   0x1008FF05  /* Keyboards may be lit=
     */
+#define XF86XK_KbdBrightnessDown 0x1008FF06  /* Keyboards may be lit=
     */
+
 /*
  * Keys found on some "Internet" keyboards.
  */
-#define XF86XK_Standby=09=090x1008FF10
-#define XF86XK_AudioLowerVolume=090x1008FF11
-#define XF86XK_AudioMute=090x1008FF12
-#define XF86XK_AudioRaiseVolume=090x1008FF13
-#define XF86XK_AudioPlay=090x1008FF14
-#define XF86XK_AudioStop=090x1008FF15
-#define XF86XK_AudioPrev=090x1008FF16
-#define XF86XK_AudioNext=090x1008FF17
-#define XF86XK_HomePage=09=090x1008FF18
-#define XF86XK_Mail=09=090x1008FF19
-#define XF86XK_Start=09=090x1008FF1A
-#define XF86XK_Search=09=090x1008FF1B
-#define XF86XK_AudioRecord=090x1008FF1C
-
-/* These are sometimes found on PDA's (e.g. Palm, PocketPC or elsewh=
ere) */
-#define XF86XK_Calculator=090x1008FF1D
-#define XF86XK_Memo=09=090x1008FF1E
-#define XF86XK_ToDoList=09=090x1008FF1F
-#define XF86XK_Calendar=09=090x1008FF20
-#define XF86XK_PowerDown=090x1008FF21
-#define XF86XK_ContrastAdjust=090x1008FF22
-#define XF86XK_RockerUp=09=090x1008FF23
-#define XF86XK_RockerDown=090x1008FF24
-#define XF86XK_RockerEnter=090x1008FF25
+#define XF86XK_Standby=09=090x1008FF10   /* System into standby mode=
   */
+#define XF86XK_AudioLowerVolume=090x1008FF11   /* Volume control dow=
n        */
+#define XF86XK_AudioMute=090x1008FF12   /* Mute sound from the syste=
m */
+#define XF86XK_AudioRaiseVolume=090x1008FF13   /* Volume control up =
         */
+#define XF86XK_AudioPlay=090x1008FF14   /* Start playing of audio > =
  */
+#define XF86XK_AudioStop=090x1008FF15   /* Stop playing audio       =
  */
+#define XF86XK_AudioPrev=090x1008FF16   /* Previous track           =
  */
+#define XF86XK_AudioNext=090x1008FF17   /* Next track               =
  */
+#define XF86XK_HomePage=09=090x1008FF18   /* Display user's home pag=
e   */
+#define XF86XK_Mail=09=090x1008FF19   /* Invoke user's mail program =
*/
+#define XF86XK_Start=09=090x1008FF1A   /* Start application         =
 */
+#define XF86XK_Search=09=090x1008FF1B   /* Search                   =
  */
+#define XF86XK_AudioRecord=090x1008FF1C   /* Record audio applicatio=
n   */
+
+/* These are sometimes found on PDA's (e.g. Palm, PocketPC or elsewh=
ere)   */
+#define XF86XK_Calculator=090x1008FF1D   /* Invoke calculator progra=
m  */
+#define XF86XK_Memo=09=090x1008FF1E   /* Invoke Memo taking program =
*/
+#define XF86XK_ToDoList=09=090x1008FF1F   /* Invoke To Do List progr=
am  */
+#define XF86XK_Calendar=09=090x1008FF20   /* Invoke Calendar program=
    */
+#define XF86XK_PowerDown=090x1008FF21   /* Deep sleep the system    =
  */
+#define XF86XK_ContrastAdjust=090x1008FF22   /* Adjust screen contra=
st     */
+#define XF86XK_RockerUp=09=090x1008FF23   /* Rocker switches exist u=
p   */
+#define XF86XK_RockerDown=090x1008FF24   /* and down                =
   */
+#define XF86XK_RockerEnter=090x1008FF25   /* and let you press them =
    */
=20
 /* Some more "Internet" keyboard symbols */
-#define XF86XK_Back=09=090x1008FF26
-#define XF86XK_Forward=09=090x1008FF27
-#define XF86XK_Stop=09=090x1008FF28
-#define XF86XK_Refresh=09=090x1008FF29
-#define XF86XK_PowerOff=09=090x1008FF2A
-#define XF86XK_WakeUp=09=090x1008FF2B
-#define XF86XK_Eject            0x1008FF2C
-#define XF86XK_ScreenSaver      0x1008FF2D
-#define XF86XK_WWW              0x1008FF2E
-#define XF86XK_Sleep            0x1008FF2F
-#define XF86XK_Favorites=090x1008FF30
-#define XF86XK_AudioPause=090x1008FF31
-#define XF86XK_AudioMedia=090x1008FF32
-#define XF86XK_MyComputer=090x1008FF33
-#define XF86XK_VendorHome=090x1008FF34
-#define XF86XK_LightBulb=090x1008FF35
-#define XF86XK_Shop=09=090x1008FF36
-#define XF86XK_History=09=090x1008FF37
-#define XF86XK_OpenURL=09=090x1008FF38
-#define XF86XK_AddFavorite=090x1008FF39
-#define XF86XK_HotLinks=09=090x1008FF3A
-#define XF86XK_BrightnessAdjust=090x1008FF3B
-#define XF86XK_Finance=09=090x1008FF3C
-#define XF86XK_Community=090x1008FF3D
-#define XF86XK_AudioRewind=090x1008FF3E
-#define XF86XK_XF86BackForward=090x1008FF3F
-#define XF86XK_Launch0=09=090x1008FF40
-#define XF86XK_Launch1=09=090x1008FF41
-#define XF86XK_Launch2=09=090x1008FF42
-#define XF86XK_Launch3=09=090x1008FF43
-#define XF86XK_Launch4=09=090x1008FF44
-#define XF86XK_Launch5=09=090x1008FF45
-#define XF86XK_Launch6=09=090x1008FF46
-#define XF86XK_Launch7=09=090x1008FF47
-#define XF86XK_Launch8=09=090x1008FF48
-#define XF86XK_Launch9=09=090x1008FF49
-#define XF86XK_LaunchA=09=090x1008FF4A
-#define XF86XK_LaunchB=09=090x1008FF4B
-#define XF86XK_LaunchC=09=090x1008FF4C
-#define XF86XK_LaunchD=09=090x1008FF4D
-#define XF86XK_LaunchE=09=090x1008FF4E
-#define XF86XK_LaunchF=09=090x1008FF4F
-
-#define XF86XK_ApplicationLeft=090x1008FF50
-#define XF86XK_ApplicationRight=090x1008FF51
-#define XF86XK_Book=09=090x1008FF52
-#define XF86XK_CD=09=090x1008FF53
-#define XF86XK_Calculater=090x1008FF54
-#define XF86XK_Clear=09=090x1008FF55
-#define XF86XK_Close=09=090x1008FF56
-#define XF86XK_Copy=09=090x1008FF57
-#define XF86XK_Cut=09=090x1008FF58
-#define XF86XK_Display=09=090x1008FF59
-#define XF86XK_DOS=09=090x1008FF5A
-#define XF86XK_Documents=090x1008FF5B
-#define XF86XK_Excel=09=090x1008FF5C
-#define XF86XK_Explorer=09=090x1008FF5D
-#define XF86XK_Game=09=090x1008FF5E
-#define XF86XK_Go=09=090x1008FF5F
-#define XF86XK_iTouch=09=090x1008FF60
-#define XF86XK_LogOff=09=090x1008FF61
-#define XF86XK_Market=09=090x1008FF62
-#define XF86XK_Meeting=09=090x1008FF63
-#define XF86XK_MenuKB=09=090x1008FF65
-#define XF86XK_MenuPB=09=090x1008FF66
-#define XF86XK_MySites=09=090x1008FF67
-#define XF86XK_New=09=090x1008FF68
-#define XF86XK_News=09=090x1008FF69
-#define XF86XK_OfficeHome=090x1008FF6A
-#define XF86XK_Open=09=090x1008FF6B
-#define XF86XK_Option=09=090x1008FF6C
-#define XF86XK_Paste=09=090x1008FF6D
-#define XF86XK_Phone=09=090x1008FF6E
-#define XF86XK_Q=09=090x1008FF70
-#define XF86XK_Reply=09=090x1008FF72
-#define XF86XK_Reload=09=090x1008FF73
-#define XF86XK_RotateWindows=090x1008FF74
-#define XF86XK_RotationPB=090x1008FF75
-#define XF86XK_RotationKB=090x1008FF76
-#define XF86XK_Save=09=090x1008FF77
-#define XF86XK_ScrollUp=09=090x1008FF78
-#define XF86XK_ScrollDown=090x1008FF79
-#define XF86XK_ScrollClick=090x1008FF7A
-#define XF86XK_Send=09=090x1008FF7B
-#define XF86XK_Spell=09=090x1008FF7C
-#define XF86XK_SplitScreen=090x1008FF7D
-#define XF86XK_Support=09=090x1008FF7E
-#define XF86XK_TaskPane=09=090x1008FF7F
-#define XF86XK_Terminal=09=090x1008FF80
-#define XF86XK_Tools=09=090x1008FF81
-#define XF86XK_Travel=09=090x1008FF82
-#define XF86XK_UserPB=09=090x1008FF84
-#define XF86XK_User1KB=09=090x1008FF85
-#define XF86XK_User2KB=09=090x1008FF86
-#define XF86XK_Video=09=090x1008FF87
-#define XF86XK_WheelButton=090x1008FF88
-#define XF86XK_Word=09=090x1008FF89
+#define XF86XK_Back=09=090x1008FF26   /* Like back on a browser     =
*/
+#define XF86XK_Forward=09=090x1008FF27   /* Like forward on a browse=
r  */
+#define XF86XK_Stop=09=090x1008FF28   /* Stop current operation     =
*/
+#define XF86XK_Refresh=09=090x1008FF29   /* Refresh the page        =
   */
+#define XF86XK_PowerOff=09=090x1008FF2A   /* Power off system entire=
ly  */
+#define XF86XK_WakeUp=09=090x1008FF2B   /* Wake up system from sleep=
  */
+#define XF86XK_Eject            0x1008FF2C   /* Eject device (e.g. D=
VD)    */
+#define XF86XK_ScreenSaver      0x1008FF2D   /* Invoke screensaver  =
       */
+#define XF86XK_WWW              0x1008FF2E   /* Invoke web browser  =
       */
+#define XF86XK_Sleep            0x1008FF2F   /* Put system to sleep =
       */
+#define XF86XK_Favorites=090x1008FF30   /* Show favorite locations  =
  */
+#define XF86XK_AudioPause=090x1008FF31   /* Pause audio playing     =
   */
+#define XF86XK_AudioMedia=090x1008FF32   /* Launch media collection =
app */
+#define XF86XK_MyComputer=090x1008FF33   /* Display "My Computer" wi=
ndow */
+#define XF86XK_VendorHome=090x1008FF34   /* Display vendor home web =
site */
+#define XF86XK_LightBulb=090x1008FF35   /* Light bulb keys exist    =
   */
+#define XF86XK_Shop=09=090x1008FF36   /* Display shopping web site  =
 */
+#define XF86XK_History=09=090x1008FF37   /* Show history of web surf=
ing */
+#define XF86XK_OpenURL=09=090x1008FF38   /* Open selected URL       =
    */
+#define XF86XK_AddFavorite=090x1008FF39   /* Add URL to favorites li=
st   */
+#define XF86XK_HotLinks=09=090x1008FF3A   /* Show "hot" links       =
     */
+#define XF86XK_BrightnessAdjust=090x1008FF3B   /* Invoke brightness =
adj. UI   */
+#define XF86XK_Finance=09=090x1008FF3C   /* Display financial site  =
    */
+#define XF86XK_Community=090x1008FF3D   /* Display user's community =
   */
+#define XF86XK_AudioRewind=090x1008FF3E   /* "rewind" audio track   =
     */
+#define XF86XK_BackForward=090x1008FF3F   /* ??? */
+#define XF86XK_Launch0=09=090x1008FF40   /* Launch Application      =
    */
+#define XF86XK_Launch1=09=090x1008FF41   /* Launch Application      =
    */
+#define XF86XK_Launch2=09=090x1008FF42   /* Launch Application      =
    */
+#define XF86XK_Launch3=09=090x1008FF43   /* Launch Application      =
    */
+#define XF86XK_Launch4=09=090x1008FF44   /* Launch Application      =
    */
+#define XF86XK_Launch5=09=090x1008FF45   /* Launch Application      =
    */
+#define XF86XK_Launch6=09=090x1008FF46   /* Launch Application      =
    */
+#define XF86XK_Launch7=09=090x1008FF47   /* Launch Application      =
    */
+#define XF86XK_Launch8=09=090x1008FF48   /* Launch Application      =
    */
+#define XF86XK_Launch9=09=090x1008FF49   /* Launch Application      =
    */
+#define XF86XK_LaunchA=09=090x1008FF4A   /* Launch Application      =
    */
+#define XF86XK_LaunchB=09=090x1008FF4B   /* Launch Application      =
    */
+#define XF86XK_LaunchC=09=090x1008FF4C   /* Launch Application      =
    */
+#define XF86XK_LaunchD=09=090x1008FF4D   /* Launch Application      =
    */
+#define XF86XK_LaunchE=09=090x1008FF4E   /* Launch Application      =
    */
+#define XF86XK_LaunchF=09=090x1008FF4F   /* Launch Application      =
    */
+
+#define XF86XK_ApplicationLeft=090x1008FF50   /* switch to applicati=
on, left */
+#define XF86XK_ApplicationRight=090x1008FF51   /* switch to applicat=
ion, right*/
+#define XF86XK_Book=09=090x1008FF52   /* Launch bookreader          =
 */
+#define XF86XK_CD=09=090x1008FF53   /* Launch CD/DVD player        *=
/
+#define XF86XK_Calculater=090x1008FF54   /* Launch Calculater       =
    */
+#define XF86XK_Clear=09=090x1008FF55   /* Clear window, screen      =
  */
+#define XF86XK_Close=09=090x1008FF56   /* Close window              =
  */
+#define XF86XK_Copy=09=090x1008FF57   /* Copy selection             =
 */
+#define XF86XK_Cut=09=090x1008FF58   /* Cut selection               =
*/
+#define XF86XK_Display=09=090x1008FF59   /* Output switch key       =
    */
+#define XF86XK_DOS=09=090x1008FF5A   /* Launch DOS (emulation)      =
*/
+#define XF86XK_Documents=090x1008FF5B   /* Open documents window    =
   */
+#define XF86XK_Excel=09=090x1008FF5C   /* Launch spread sheet       =
  */
+#define XF86XK_Explorer=09=090x1008FF5D   /* Launch file explorer   =
     */
+#define XF86XK_Game=09=090x1008FF5E   /* Launch game                =
 */
+#define XF86XK_Go=09=090x1008FF5F   /* Go to URL                   *=
/
+#define XF86XK_iTouch=09=090x1008FF60   /* Logitch iTouch- don't use=
   */
+#define XF86XK_LogOff=09=090x1008FF61   /* Log off system           =
   */
+#define XF86XK_Market=09=090x1008FF62   /* ??                       =
   */
+#define XF86XK_Meeting=09=090x1008FF63   /* enter meeting in calenda=
r   */
+#define XF86XK_MenuKB=09=090x1008FF65   /* distingush keyboard from =
PB */
+#define XF86XK_MenuPB=09=090x1008FF66   /* distinuish PB from keyboa=
rd */
+#define XF86XK_MySites=09=090x1008FF67   /* Favourites              =
    */
+#define XF86XK_New=09=090x1008FF68   /* New (folder, document...    =
*/
+#define XF86XK_News=09=090x1008FF69   /* News                       =
 */
+#define XF86XK_OfficeHome=090x1008FF6A   /* Office home (old Staroff=
ice)*/
+#define XF86XK_Open=09=090x1008FF6B   /* Open                       =
 */
+#define XF86XK_Option=09=090x1008FF6C   /* ?? */
+#define XF86XK_Paste=09=090x1008FF6D   /* Paste                     =
  */
+#define XF86XK_Phone=09=090x1008FF6E   /* Launch phone; dial number =
  */
+#define XF86XK_Q=09=090x1008FF70   /* Compaq's Q - don't use      */
+#define XF86XK_Reply=09=090x1008FF72   /* Reply e.g., mail          =
  */
+#define XF86XK_Reload=09=090x1008FF73   /* Reload web page, file, et=
c. */
+#define XF86XK_RotateWindows=090x1008FF74   /* Rotate windows e.g. x=
randr  */
+#define XF86XK_RotationPB=090x1008FF75   /* don't use               =
    */
+#define XF86XK_RotationKB=090x1008FF76   /* don't use               =
    */
+#define XF86XK_Save=09=090x1008FF77   /* Save (file, document, state=
 */
+#define XF86XK_ScrollUp=09=090x1008FF78   /* Scroll window/contents =
up   */
+#define XF86XK_ScrollDown=090x1008FF79   /* Scrool window/contentd d=
own */
+#define XF86XK_ScrollClick=090x1008FF7A   /* Use XKB mousekeys inste=
ad   */
+#define XF86XK_Send=09=090x1008FF7B   /* Send mail, file, object    =
 */
+#define XF86XK_Spell=09=090x1008FF7C   /* Spell checker             =
  */
+#define XF86XK_SplitScreen=090x1008FF7D   /* Split window or screen =
     */
+#define XF86XK_Support=09=090x1008FF7E   /* Get support (??)        =
    */
+#define XF86XK_TaskPane=09=090x1008FF7F   /* Show tasks */
+#define XF86XK_Terminal=09=090x1008FF80   /* Launch terminal emulato=
r    */
+#define XF86XK_Tools=09=090x1008FF81   /* toolbox of desktop/app.   =
  */
+#define XF86XK_Travel=09=090x1008FF82   /* ?? */
+#define XF86XK_UserPB=09=090x1008FF84   /* ?? */
+#define XF86XK_User1KB=09=090x1008FF85   /* ?? */
+#define XF86XK_User2KB=09=090x1008FF86   /* ?? */
+#define XF86XK_Video=09=090x1008FF87   /* Launch video player       =
*/
+#define XF86XK_WheelButton=090x1008FF88   /* button from a mouse whe=
el */
+#define XF86XK_Word=09=090x1008FF89   /* Launch word processor     *=
/
 #define XF86XK_Xfer=09=090x1008FF8A
-#define XF86XK_ZoomIn=09=090x1008FF8B
-#define XF86XK_ZoomOut=09=090x1008FF8C
+#define XF86XK_ZoomIn=09=090x1008FF8B   /* zoom in view, map, etc.  =
 */
+#define XF86XK_ZoomOut=09=090x1008FF8C   /* zoom out view, map, etc.=
  */
+
+#define XF86XK_Away=09=090x1008FF8D   /* mark yourself as away     *=
/
+#define XF86XK_Messenger=090x1008FF8E   /* as in instant messaging  =
 */
+#define XF86XK_WebCam=09=090x1008FF8F   /* Launch web camera app.   =
 */
+#define XF86XK_MailForward=090x1008FF90   /* Forward in mail        =
   */
+#define XF86XK_Pictures=09=090x1008FF91   /* Show pictures          =
   */
+#define XF86XK_Music=09=090x1008FF92   /* Launch music application  =
*/
+
+#define XF86XK_Battery=09=090x1008FF93   /* Display battery informat=
ion */
+#define XF86XK_Bluetooth=090x1008FF94   /* Enable/disable Bluetooth =
   */
+#define XF86XK_WLAN=09=090x1008FF95   /* Enable/disable WLAN        =
 */
+#define XF86XK_UWB=09=090x1008FF96   /* Enable/disable UWB=09    */
+
+#define XF86XK_AudioForward=090x1008FF97   /* fast-forward audio tra=
ck    */
+#define XF86XK_AudioRepeat=090x1008FF98   /* toggle repeat mode     =
     */
+#define XF86XK_AudioRandomPlay=090x1008FF99   /* toggle shuffle mode=
         */
+#define XF86XK_Subtitle=09=090x1008FF9A   /* cycle through subtitle =
     */
+#define XF86XK_AudioCycleTrack=090x1008FF9B   /* cycle through audio=
 tracks  */
+#define XF86XK_CycleAngle=090x1008FF9C   /* cycle through angles    =
    */
+#define XF86XK_FrameBack=090x1008FF9D   /* video: go one frame back =
   */
+#define XF86XK_FrameForward=090x1008FF9E   /* video: go one frame fo=
rward */
+#define XF86XK_Time=09=090x1008FF9F   /* display, or shows an entry =
for time seeking */
+#define XF86XK_Select=09=090x1008FFA0   /* Select button on joypads =
and remotes */
+#define XF86XK_View=09=090x1008FFA1   /* Show a view options/propert=
ies */
+#define XF86XK_TopMenu=09=090x1008FFA2   /* Go to a top-level menu i=
n a video */
+
+#define XF86XK_Red=09=090x1008FFA3   /* Red button                  =
*/
+#define XF86XK_Green=09=090x1008FFA4   /* Green button              =
  */
+#define XF86XK_Yellow=09=090x1008FFA5   /* Yellow button            =
   */
+#define XF86XK_Blue             0x1008FFA6   /* Blue button         =
        */
=20
-#define XF86XK_Away=09=090x1008FF8D
-#define XF86XK_Messenger=090x1008FF8E
-#define XF86XK_WebCam=09=090x1008FF8F
-#define XF86XK_MailForward=090x1008FF90
-#define XF86XK_Pictures=09=090x1008FF91
-#define XF86XK_Music=09=090x1008FF92
+#define XF86XK_Suspend=09=090x1008FFA7   /* Sleep to RAM            =
    */
+#define XF86XK_Hibernate=090x1008FFA8   /* Sleep to disk            =
   */
=20
 /* Keys for special action keys (hot keys) */
+/* Virtual terminals on some operating systems */
 #define XF86XK_Switch_VT_1=090x1008FE01
 #define XF86XK_Switch_VT_2=090x1008FE02
 #define XF86XK_Switch_VT_3=090x1008FE03
@@ -181,8 +222,8 @@
 #define XF86XK_Switch_VT_11=090x1008FE0B
 #define XF86XK_Switch_VT_12=090x1008FE0C
=20
-#define XF86XK_Ungrab=09=090x1008FE20
-#define XF86XK_ClearGrab=090x1008FE21
-#define XF86XK_Next_VMode=090x1008FE22
-#define XF86XK_Prev_VMode=090x1008FE23
+#define XF86XK_Ungrab=09=090x1008FE20   /* force ungrab             =
  */
+#define XF86XK_ClearGrab=090x1008FE21   /* kill application with gra=
b */
+#define XF86XK_Next_VMode=090x1008FE22   /* next video mode availabl=
e  */
+#define XF86XK_Prev_VMode=090x1008FE23   /* prev. video mode availab=
le */
=20
diff --git a/recipes/xorg-lib/xorg-headers-native/X11/XKBlib.h b/reci=
pes/xorg-lib/xorg-headers-native/X11/XKBlib.h
index 6a5dc8a..291fc05 100644
--- a/recipes/xorg-lib/xorg-headers-native/X11/XKBlib.h
+++ b/recipes/xorg-lib/xorg-headers-native/X11/XKBlib.h
@@ -1,4 +1,3 @@
-/* $Xorg: XKBlib.h,v 1.6 2000/08/17 19:45:03 cpqbld Exp $ */
 /************************************************************
 Copyright (c) 1993 by Silicon Graphics Computer Systems, Inc.
=20
@@ -7,24 +6,23 @@ software and its documentation for any purpose and =
without
 fee is hereby granted, provided that the above copyright
 notice appear in all copies and that both that copyright
 notice and this permission notice appear in supporting
-documentation, and that the name of Silicon Graphics not be=20
-used in advertising or publicity pertaining to distribution=20
+documentation, and that the name of Silicon Graphics not be
+used in advertising or publicity pertaining to distribution
 of the software without specific prior written permission.
-Silicon Graphics makes no representation about the suitability=20
+Silicon Graphics makes no representation about the suitability
 of this software for any purpose. It is provided "as is"
 without any express or implied warranty.
=20
-SILICON GRAPHICS DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS=20
-SOFTWARE, INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY=20
+SILICON GRAPHICS DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS
+SOFTWARE, INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
 AND FITNESS FOR A PARTICULAR PURPOSE. IN NO EVENT SHALL SILICON
-GRAPHICS BE LIABLE FOR ANY SPECIAL, INDIRECT OR CONSEQUENTIAL=20
-DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE,=20
-DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE=20
+GRAPHICS BE LIABLE FOR ANY SPECIAL, INDIRECT OR CONSEQUENTIAL
+DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE,
+DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE
 OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION  WITH
 THE USE OR PERFORMANCE OF THIS SOFTWARE.
=20
 ********************************************************/
-/* $XFree86: xc/lib/X11/XKBlib.h,v 3.5 2003/04/17 02:06:31 dawes Exp=
 $ */
=20
 #ifndef _XKBLIB_H_
 #define _XKBLIB_H_
@@ -78,7 +76,7 @@ typedef struct _XkbMapNotifyEvent {
 =09KeyCode=09=09first_key_act;
 =09KeyCode=09=09first_key_behavior;
 =09KeyCode=09=09first_key_explicit;
-=09KeyCode=09=09first_modmap_key; =20
+=09KeyCode=09=09first_modmap_key;
 =09KeyCode=09=09first_vmodmap_key;
 =09int=09=09num_key_syms;
 =09int=09=09num_key_acts;
@@ -215,7 +213,7 @@ typedef struct _XkbActionMessage {
 =09Bool =09=09key_event_follows;/* true if key event also generated =
*/
 =09int=09=09group;=09=09/* effective group */
 =09unsigned int=09mods;=09=09/* effective mods */
-=09char =09=09message[XkbActionMessageLength+1];=20
+=09char =09=09message[XkbActionMessageLength+1];
 =09=09=09=09=09/* message -- leave space for NUL */
 } XkbActionMessageEvent;
=20
@@ -241,8 +239,8 @@ typedef struct _XkbExtensionDeviceNotify {
 =09Time =09=09time;=09=09/* milliseconds */
 =09int =09=09xkb_type;=09/* XkbExtensionDeviceNotify */
 =09int=09 =09device;=09=09/* device ID */
-=09unsigned int=09reason;=09=09/* reason for the event */=09
-=09unsigned int=09supported;=09/* mask of supported features */=09
+=09unsigned int=09reason;=09=09/* reason for the event */
+=09unsigned int=09supported;=09/* mask of supported features */
 =09unsigned int=09unsupported;=09/* mask of unsupported features */
 =09=09=09=09=09/* that some app tried to use */
 =09int=09 =09first_btn;=09/* first button that changed */
@@ -531,7 +529,7 @@ extern=09Bool=09 XkbSetIndicatorMap(
 #define=09XkbNoteIndicatorStateChanges(o,n,w)\
 =09=09=09=09((o)->state_changes|=3D((n)->state_changes&(w)))
 #define=09XkbGetIndicatorMapChanges(d,x,c) \
-=09=09=09=09(XkbGetIndicatorMap((d),(c)->map_changes,x)
+=09=09=09=09(XkbGetIndicatorMap((d),(c)->map_changes,x))
 #define=09XkbChangeIndicatorMaps(d,x,c) \
 =09=09=09=09(XkbSetIndicatorMap((d),(c)->map_changes,x))
=20
diff --git a/recipes/xorg-lib/xorg-headers-native/X11/XWDFile.h b/rec=
ipes/xorg-lib/xorg-headers-native/X11/XWDFile.h
index 0ce22e1..50e17df 100644
--- a/recipes/xorg-lib/xorg-headers-native/X11/XWDFile.h
+++ b/recipes/xorg-lib/xorg-headers-native/X11/XWDFile.h
@@ -1,4 +1,3 @@
-/* $Xorg: XWDFile.h,v 1.4 2001/02/09 02:03:22 xorgcvs Exp $ */
 /*
=20
 Copyright 1985, 1986, 1998  The Open Group
diff --git a/recipes/xorg-lib/xorg-headers-native/X11/Xalloca.h b/rec=
ipes/xorg-lib/xorg-headers-native/X11/Xalloca.h
index 67f2671..1919884 100644
--- a/recipes/xorg-lib/xorg-headers-native/X11/Xalloca.h
+++ b/recipes/xorg-lib/xorg-headers-native/X11/Xalloca.h
@@ -1,5 +1,3 @@
-/* $Xorg: Xalloca.h,v 1.4 2001/02/09 02:03:22 xorgcvs Exp $ */
-
 /*
=20
 Copyright 1995, 1998  The Open Group
@@ -27,8 +25,6 @@ other dealings in this Software without prior writt=
en authorization
 from The Open Group.
=20
 */
-/* $XFree86: xc/include/Xalloca.h,v 3.10 2001/12/14 19:53:25 dawes E=
xp $ */
-
 /*
  * The purpose of this header is to define the macros ALLOCATE_LOCAL=
 and
  * DEALLOCATE_LOCAL appropriately for the platform being compiled on=
.
@@ -62,7 +58,8 @@ from The Open Group.
 #define XALLOCA_H 1
=20
 #ifndef INCLUDE_ALLOCA_H
-# if defined(__SUNPRO_C)  /* Need to add more here to match Imake *.=
cf's */
+/* Need to add more here to match Imake *.cf's */
+# if defined(HAVE_ALLOCA_H) || defined(__SUNPRO_C) || defined(__SUNP=
RO_CC)
 #  define INCLUDE_ALLOCA_H
 # endif
 #endif
@@ -77,19 +74,6 @@ from The Open Group.
  * If you want something other than (DE)ALLOCATE_LOCAL_FALLBACK
  * for ALLOCATE/DEALLOCATE_LOCAL then you add that in here.
  */
-#  if defined(__HIGHC__)
-#    ifndef NCR
-       extern char *alloca();
-#      if HCVERSION < 21003
-#        define ALLOCATE_LOCAL(size)=09alloca((int)(size))
-         pragma on(alloca);
-#      else /* HCVERSION >=3D 21003 */
-#        define=09ALLOCATE_LOCAL(size)=09_Alloca((int)(size))
-#      endif /* HCVERSION < 21003 */
-#    else /* NCR */
-#      define ALLOCATE_LOCAL(size)=09alloca(size)
-#    endif
-#  endif /* defined(__HIGHC__) */
=20
=20
 #  ifdef __GNUC__
@@ -104,26 +88,18 @@ from The Open Group.
  * Test is easy, the new one is named __builtin_alloca and comes
  * from alloca.h which #defines alloca.
  */
-#    ifndef NCR
-#      if defined(vax) || defined(sun) || defined(apollo) || defined=
(stellar) || defined(alloca)
+#      if defined(__sun) || defined(alloca)
 /*
  * Some System V boxes extract alloca.o from /lib/libPW.a; if you
  * decide that you don't want to use alloca, you might want to fix i=
t here.
  */
 /* alloca might be a macro taking one arg (hi, Sun!), so give it one=
. */
-#        ifndef __sgi=09=09=09/* IRIX 5/6 has definition */
-#         ifndef __QNX__
+#        if !defined(__cplusplus)
 #          define __Xnullarg=09=09/* as nothing */
-#          ifndef X_NOT_STDC_ENV
-             extern void *alloca(__Xnullarg);
-#          else
-             extern char *alloca(__Xnullarg);
-#          endif
-#         endif /* __QNX__ */
-#        endif /* __sgi */
+           extern void *alloca(__Xnullarg);
+#        endif
 #        define ALLOCATE_LOCAL(size) alloca((int)(size))
 #      endif /* who does alloca */
-#    endif /* NCR */
 #  endif /* __GNUC__ */
=20
 #endif /* NO_ALLOCA */
diff --git a/recipes/xorg-lib/xorg-headers-native/X11/Xarch.h b/recip=
es/xorg-lib/xorg-headers-native/X11/Xarch.h
index 6e04e53..58fb9a5 100644
--- a/recipes/xorg-lib/xorg-headers-native/X11/Xarch.h
+++ b/recipes/xorg-lib/xorg-headers-native/X11/Xarch.h
@@ -1,5 +1,5 @@
 #ifndef _XARCH_H_
-#define _XARCH_H_
+# define _XARCH_H_
=20
 /*
  * Copyright 1997 Metro Link Incorporated
@@ -25,7 +25,6 @@
  * IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, AR=
ISING
  * OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTW=
ARE.
  */
-/* $XFree86: xc/include/Xarch.h,v 1.10tsi Exp $ */
=20
=20
 /*
@@ -33,94 +32,62 @@
  */
=20
 /* See if it is set in the imake config first */
-#ifdef X_BYTE_ORDER
+# ifdef X_BYTE_ORDER
=20
-#define X_BIG_ENDIAN 4321
-#define X_LITTLE_ENDIAN 1234
+#  define X_BIG_ENDIAN 4321
+#  define X_LITTLE_ENDIAN 1234
=20
-#else
+# else
=20
-#ifdef SVR4
-#if defined(NCR) || defined(Mips) || defined(__sgi)
-#include <sys/endian.h>
-#else
-#if !defined(sun)
-#include <sys/byteorder.h>
-#endif
-#endif
-#elif defined(CSRG_BASED)
-#if defined(__NetBSD__) || defined(__OpenBSD__)
-#include <sys/types.h>
-#endif
-#include <machine/endian.h>
-#elif defined(linux)
-#if defined __STRICT_ANSI__
-#undef __STRICT_ANSI__
-#include <endian.h>
-#define __STRICT_ANSI__
-#else
-#include <endian.h>
-#endif
+#  if defined(SVR4) || defined(__SVR4)
+#   include <sys/byteorder.h>
+#  elif defined(CSRG_BASED)
+#   if defined(__NetBSD__) || defined(__OpenBSD__)
+#    include <sys/types.h>
+#   endif
+#   include <machine/endian.h>
+#  elif defined(linux)
+#   if defined __STRICT_ANSI__
+#    undef __STRICT_ANSI__
+#    include <endian.h>
+#    define __STRICT_ANSI__
+#   else
+#    include <endian.h>
+#   endif
 /* 'endian.h' might have been included before 'Xarch.h' */
-#if !defined(LITTLE_ENDIAN) && defined(__LITTLE_ENDIAN)
-#define LITTLE_ENDIAN __LITTLE_ENDIAN
-#endif
-#if !defined(BIG_ENDIAN) && defined(__BIG_ENDIAN)
-#define BIG_ENDIAN __BIG_ENDIAN
-#endif
-#if !defined(PDP_ENDIAN) && defined(__PDP_ENDIAN)
-#define PDP_ENDIAN __PDP_ENDIAN
-#endif
-#if !defined(BYTE_ORDER) && defined(__BYTE_ORDER)
-#define BYTE_ORDER __BYTE_ORDER
-#endif
-#elif defined(Lynx)
-#if 0
-/* LynxOS 2.4.0 has wrong defines in bsd/ip.h */
-#include <bsd/in.h>
-#include <bsd/in_systm.h>
-#include <bsd/ip.h>
-#endif
-#endif
+#   if !defined(LITTLE_ENDIAN) && defined(__LITTLE_ENDIAN)
+#    define LITTLE_ENDIAN __LITTLE_ENDIAN
+#   endif
+#   if !defined(BIG_ENDIAN) && defined(__BIG_ENDIAN)
+#    define BIG_ENDIAN __BIG_ENDIAN
+#   endif
+#   if !defined(PDP_ENDIAN) && defined(__PDP_ENDIAN)
+#    define PDP_ENDIAN __PDP_ENDIAN
+#   endif
+#   if !defined(BYTE_ORDER) && defined(__BYTE_ORDER)
+#    define BYTE_ORDER __BYTE_ORDER
+#   endif
+#  endif
=20
-#ifndef BYTE_ORDER
-#define LITTLE_ENDIAN 1234
-#define BIG_ENDIAN    4321
+#  ifndef BYTE_ORDER
+#   define LITTLE_ENDIAN 1234
+#   define BIG_ENDIAN    4321
=20
-#if defined(__QNX__) && !defined(__QNXNTO__)
-#define BYTE_ORDER LITTLE_ENDIAN
-#endif
+#   if defined(__sun) && defined(__SVR4)
+#    include <sys/isa_defs.h>
+#    ifdef _LITTLE_ENDIAN
+#     define BYTE_ORDER LITTLE_ENDIAN
+#    endif
+#    ifdef _BIG_ENDIAN
+#     define BYTE_ORDER BIG_ENDIAN
+#    endif
+#   endif /* sun */
+#  endif /* BYTE_ORDER */
=20
-#if defined(__QNXNTO__)
-#if defined(i386) || defined(__i386__) || defined(__x86__)
-#define BYTE_ORDER LITTLE_ENDIAN
-#else
-#define BYTE_ORDER BIG_ENDIAN
-#endif
-#endif
+#  define X_BYTE_ORDER BYTE_ORDER
+#  define X_BIG_ENDIAN BIG_ENDIAN
+#  define X_LITTLE_ENDIAN LITTLE_ENDIAN
=20
-#ifdef Lynx
-#if defined(i386) || defined(__i386__) || defined(__x86__)
-#define BYTE_ORDER LITTLE_ENDIAN
-#else
-#define BYTE_ORDER BIG_ENDIAN
-#endif
-#endif
-#if (defined(sun) && defined(SVR4)) && !defined(Lynx)
-#include <sys/isa_defs.h>
-#ifdef _LITTLE_ENDIAN
-#define BYTE_ORDER LITTLE_ENDIAN
-#endif
-#ifdef _BIG_ENDIAN
-#define BYTE_ORDER BIG_ENDIAN
-#endif
-#endif /* sun */
-#endif /* BYTE_ORDER */
-
-#define X_BYTE_ORDER BYTE_ORDER
-#define X_BIG_ENDIAN BIG_ENDIAN
-#define X_LITTLE_ENDIAN LITTLE_ENDIAN
-
-#endif /* not in imake config */
+# endif /* not in imake config */
=20
 #endif /* _XARCH_H_ */
diff --git a/recipes/xorg-lib/xorg-headers-native/X11/Xauth.h b/recip=
es/xorg-lib/xorg-headers-native/X11/Xauth.h
index 181618a..ace975d 100644
--- a/recipes/xorg-lib/xorg-headers-native/X11/Xauth.h
+++ b/recipes/xorg-lib/xorg-headers-native/X11/Xauth.h
@@ -128,23 +128,6 @@ void XauDisposeAuth(
 Xauth*=09=09/* auth */
 );
=20
-#ifdef K5AUTH
-#include <krb5/krb5.h>
-/* 9/93: krb5.h leaks some symbols */
-#undef BITS32
-#undef xfree
-
-int XauKrb5Encode(
-     krb5_principal=09/* princ */,
-     krb5_data *=09/* outbuf */
-);
-
-int XauKrb5Decode(
-     krb5_data=09=09/* inbuf */,
-     krb5_principal *=09/* princ */
-);
-#endif /* K5AUTH */
-
 _XFUNCPROTOEND
=20
 /* Return values from XauLockAuth */
diff --git a/recipes/xorg-lib/xorg-headers-native/X11/Xcms.h b/recipe=
s/xorg-lib/xorg-headers-native/X11/Xcms.h
index 779bc52..cea11ab 100644
--- a/recipes/xorg-lib/xorg-headers-native/X11/Xcms.h
+++ b/recipes/xorg-lib/xorg-headers-native/X11/Xcms.h
@@ -1,9 +1,8 @@
-/* $Xorg: Xcms.h,v 1.6 2000/08/17 19:45:04 cpqbld Exp $ */
=20
 /*
  * Code and supporting documentation (c) Copyright 1990 1991 Tektron=
ix, Inc.
  * =09All Rights Reserved
- *=20
+ *
  * This file is a component of an X Window System-specific implement=
ation
  * of Xcms based on the TekColor Color Management System.  Permissio=
n is
  * hereby granted to use, copy, modify, sell, and otherwise distribu=
te this
@@ -11,10 +10,10 @@
  * that this copyright, permission, and disclaimer notice is reprodu=
ced in
  * all copies of this software and in supporting documentation.  Tek=
Color
  * is a trademark of Tektronix, Inc.
- *=20
+ *
  * Tektronix makes no representation about the suitability of this s=
oftware
  * for any purpose.  It is provided "as is" and with all faults.
- *=20
+ *
  * TEKTRONIX DISCLAIMS ALL WARRANTIES APPLICABLE TO THIS SOFTWARE,
  * INCLUDING THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS F=
OR A
  * PARTICULAR PURPOSE.  IN NO EVENT SHALL TEKTRONIX BE LIABLE FOR AN=
Y
@@ -27,7 +26,6 @@
  *=09DESCRIPTION
  *=09=09Public include file for X Color Management System
  */
-/* $XFree86: xc/lib/X11/Xcms.h,v 1.7 2003/11/03 03:46:26 dawes Exp $=
 */
 #ifndef _XCMS_H_
 #define _XCMS_H_
=20
@@ -252,7 +250,7 @@ typedef void (*XcmsScreenFreeProc)(
  * XXX:  The use of the XcmsConversionProc type is broken.  The
  *       device-independent colour conversion code uses it as:
=20
-typedef Status (*XcmsConversionProc)(XcmsCCC, XcmsColor *, XcmsColor=
 *,=20
+typedef Status (*XcmsConversionProc)(XcmsCCC, XcmsColor *, XcmsColor=
 *,
 =09=09=09=09     unsigned int);
=20
  *       while the device-dependent code uses it as:
diff --git a/recipes/xorg-lib/xorg-headers-native/X11/Xdefs.h b/recip=
es/xorg-lib/xorg-headers-native/X11/Xdefs.h
index 5ee2d89..46ffdad 100644
--- a/recipes/xorg-lib/xorg-headers-native/X11/Xdefs.h
+++ b/recipes/xorg-lib/xorg-headers-native/X11/Xdefs.h
@@ -1,5 +1,3 @@
-/* $XFree86: xc/include/Xdefs.h,v 1.2 1999/08/22 06:21:20 dawes Exp =
$ */
-
 /***********************************************************
=20
 Copyright (c) 1999  The XFree86 Project Inc.
diff --git a/recipes/xorg-lib/xorg-headers-native/X11/Xdmcp.h b/recip=
es/xorg-lib/xorg-headers-native/X11/Xdmcp.h
index 6d7619a..2548485 100644
--- a/recipes/xorg-lib/xorg-headers-native/X11/Xdmcp.h
+++ b/recipes/xorg-lib/xorg-headers-native/X11/Xdmcp.h
@@ -1,4 +1,4 @@
-/* $XdotOrg: lib/Xdmcp/include/X11/Xdmcp.h,v 1.3 2005/07/03 07:00:56=
 daniels Exp $ */
+/* $XdotOrg: xc/lib/Xdmcp/Xdmcp.h,v 1.2 2004/04/23 18:43:41 eich Exp=
 $ */
 /* $Xorg: Xdmcp.h,v 1.7 2001/04/13 14:43:00 steve Exp $ */
 /*
  * Copyright 1989 Network Computing Devices, Inc., Mountain View, Ca=
lifornia.
diff --git a/recipes/xorg-lib/xorg-headers-native/X11/Xfuncproto.h b/=
recipes/xorg-lib/xorg-headers-native/X11/Xfuncproto.h
index 7b2b7ca..22bb799 100644
--- a/recipes/xorg-lib/xorg-headers-native/X11/Xfuncproto.h
+++ b/recipes/xorg-lib/xorg-headers-native/X11/Xfuncproto.h
@@ -1,5 +1,4 @@
-/* Xfuncproto.h.  Generated by configure.  */
-/* $Xorg: Xfuncproto.h,v 1.4 2001/02/09 02:03:22 xorgcvs Exp $ */
+/* Xfuncproto.h.  Generated from Xfuncproto.h.in by configure.  */
 /*
  *
 Copyright 1989, 1991, 1998  The Open Group
@@ -25,7 +24,6 @@ used in advertising or otherwise to promote the sal=
e, use or other dealings
 in this Software without prior written authorization from The Open G=
roup.
  *
  */
-/* $XFree86: xc/include/Xfuncproto.h,v 3.4 2001/12/14 19:53:25 dawes=
 Exp $ */
=20
 /* Definitions to make function prototypes manageable */
=20
@@ -52,7 +50,7 @@ in this Software without prior written authorizatio=
n from The Open Group.
=20
 /* Function prototype configuration (see configure for more info) */
 #ifndef NARROWPROTO
-#define NARROWPROTO=20
+#define NARROWPROTO /**/
 #endif
 #ifndef FUNCPROTO
 #define FUNCPROTO 15
@@ -86,7 +84,7 @@ in this Software without prior written authorizatio=
n from The Open Group.
 # define _X_ATTRIBUTE_PRINTF(x,y)
 #endif /* GNUC >=3D 4 */
=20
-#if defined(__GNUC__) && ((__GNUC__ * 100 + __GNUC_MINOR__) >=3D 303=
)
+#if defined(__GNUC__) && (__GNUC__ >=3D 4)
 # define _X_EXPORT      __attribute__((visibility("default")))
 # define _X_HIDDEN      __attribute__((visibility("hidden")))
 # define _X_INTERNAL    __attribute__((visibility("internal")))
@@ -94,10 +92,24 @@ in this Software without prior written authorizat=
ion from The Open Group.
 # define _X_EXPORT      __global
 # define _X_HIDDEN      __hidden
 # define _X_INTERNAL    __hidden
-#else /* not gcc >=3D 3.3 and not Sun Studio >=3D 8 */
+#else /* not gcc >=3D 4 and not Sun Studio >=3D 8 */
 # define _X_EXPORT
 # define _X_HIDDEN
 # define _X_INTERNAL
+#endif /* GNUC >=3D 4 */
+
+#if defined(__GNUC__) && ((__GNUC__ * 100 + __GNUC_MINOR__) >=3D 303=
)
+# define _X_LIKELY(x)   __builtin_expect(!!(x), 1)
+# define _X_UNLIKELY(x) __builtin_expect(!!(x), 0)
+# define _X_INLINE      inline
+#elif defined(__SUNPRO_C) && (__SUNPRO_C >=3D 0x550)
+# define _X_LIKELY(x)   (x)
+# define _X_UNLIKELY(x) (x)
+# define _X_INLINE      inline
+#else /* not gcc >=3D 3.3 and not Sun Studio >=3D 8 */
+# define _X_LIKELY(x)   (x)
+# define _X_UNLIKELY(x) (x)
+# define _X_INLINE
 #endif
=20
 #if defined(__GNUC__) && ((__GNUC__ * 100 + __GNUC_MINOR__) >=3D 301=
)
diff --git a/recipes/xorg-lib/xorg-headers-native/X11/Xfuncs.h b/reci=
pes/xorg-lib/xorg-headers-native/X11/Xfuncs.h
index ca9d29e..354b663 100644
--- a/recipes/xorg-lib/xorg-headers-native/X11/Xfuncs.h
+++ b/recipes/xorg-lib/xorg-headers-native/X11/Xfuncs.h
@@ -1,7 +1,4 @@
 /*
- * $XdotOrg: proto/X11/Xfuncs.h,v 1.4 2005/11/08 06:33:25 jkj Exp $
- * $Xorg: Xfuncs.h,v 1.4 2001/02/09 02:03:22 xorgcvs Exp $
- *=20
  *=20
 Copyright 1990, 1998  The Open Group
=20
@@ -26,69 +23,47 @@ used in advertising or otherwise to promote the s=
ale, use or other dealings
 in this Software without prior written authorization from The Open G=
roup.
  *
  */
-/* $XFree86: xc/include/Xfuncs.h,v 3.10 2002/05/31 18:45:38 dawes Ex=
p $ */
=20
 #ifndef _XFUNCS_H_
-#define _XFUNCS_H_
+# define _XFUNCS_H_
=20
-#include <X11/Xosdefs.h>
+# include <X11/Xosdefs.h>
=20
 /* the old Xfuncs.h, for pre-R6 */
-#if !(defined(XFree86LOADER) && defined(IN_MODULE))
+# if !(defined(XFree86LOADER) && defined(IN_MODULE))
=20
-#ifdef X_USEBFUNCS
+#  ifdef X_USEBFUNCS
 void bcopy();
 void bzero();
 int bcmp();
-#else
-#if defined(SYSV) && !defined(__SCO__) && !defined(sun) && !defined(=
__UNIXWARE__)
-#include <memory.h>
+#  else
+#   if defined(SYSV) && !defined(__SCO__) && !defined(__sun) && !def=
ined(__UNIXWARE__)
+#    include <memory.h>
 void bcopy();
-#define bzero(b,len) memset(b, 0, len)
-#define bcmp(b1,b2,len) memcmp(b1, b2, len)
-#else
-#include <string.h>
-#if defined(__SCO__) || defined(sun) || defined(__UNIXWARE__)
-#include <strings.h>
-#endif
-#define _XFUNCS_H_INCLUDED_STRING_H
-#if defined(sun)
-#define bcopy(b1,b2,len) memmove(b2, b1, (size_t)(len))
-#define bzero(b,len) memset(b, 0, (size_t)(len))
-#define bcmp(b1,b2,len) memcmp(b1, b2, (size_t)(len))
-#endif
-#endif
-#endif /* X_USEBFUNCS */
+#    define bzero(b,len) memset(b, 0, len)
+#    define bcmp(b1,b2,len) memcmp(b1, b2, len)
+#   else
+#    include <string.h>
+#    if defined(__SCO__) || defined(__sun) || defined(__UNIXWARE__)
+#     include <strings.h>
+#    endif
+#    define _XFUNCS_H_INCLUDED_STRING_H
+#   endif
+#  endif /* X_USEBFUNCS */
=20
 /* the new Xfuncs.h */
=20
-#if !defined(X_NOT_STDC_ENV) && (!defined(sun) || defined(SVR4))
 /* the ANSI C way */
-#ifndef _XFUNCS_H_INCLUDED_STRING_H
-#include <string.h>
-#endif
-#undef bzero
-#define bzero(b,len) memset(b,0,len)
-#else /* else X_NOT_STDC_ENV or SunOS 4 */
-#if defined(SYSV) || defined(luna) || defined(sun) || defined(__sxg_=
_)
-#include <memory.h>
-#define memmove(dst,src,len) bcopy((char *)(src),(char *)(dst),(int)=
(len))
-#if defined(SYSV) && defined(_XBCOPYFUNC)
-#undef memmove
-#define memmove(dst,src,len) _XBCOPYFUNC((char *)(src),(char *)(dst)=
,(int)(len))
-#define _XNEEDBCOPYFUNC
-#endif
-#else /* else vanilla BSD */
-#define memmove(dst,src,len) bcopy((char *)(src),(char *)(dst),(int)=
(len))
-#define memcpy(dst,src,len) bcopy((char *)(src),(char *)(dst),(int)(=
len))
-#define memcmp(b1,b2,len) bcmp((char *)(b1),(char *)(b2),(int)(len))
-#endif /* SYSV else */
-#endif /* ! X_NOT_STDC_ENV else */
+#  ifndef _XFUNCS_H_INCLUDED_STRING_H
+#   include <string.h>
+#  endif
+#  undef bzero
+#  define bzero(b,len) memset(b,0,len)
=20
-#if defined(X_NOT_STDC_ENV) || (defined(sun) && !defined(SVR4))
-#define atexit(f) on_exit(f, 0)
-#endif
+#  if defined WIN32 && defined __MINGW32__
+#   define bcopy(b1,b2,len) memmove(b2, b1, (size_t)(len))
+#  endif
=20
-#endif /* !(defined(XFree86LOADER) && defined(IN_MODULE)) */
+# endif /* !(defined(XFree86LOADER) && defined(IN_MODULE)) */
=20
 #endif /* _XFUNCS_H_ */
diff --git a/recipes/xorg-lib/xorg-headers-native/X11/Xlib.h b/recipe=
s/xorg-lib/xorg-headers-native/X11/Xlib.h
index a26789b..7c8bc51 100644
--- a/recipes/xorg-lib/xorg-headers-native/X11/Xlib.h
+++ b/recipes/xorg-lib/xorg-headers-native/X11/Xlib.h
@@ -1,6 +1,4 @@
-/* $XdotOrg: lib/X11/include/X11/Xlib.h,v 1.6 2005-11-08 06:33:25 jk=
j Exp $ */
-/* $Xorg: Xlib.h,v 1.6 2001/02/09 02:03:38 xorgcvs Exp $ */
-/*=20
+/*
=20
 Copyright 1985, 1986, 1987, 1991, 1998  The Open Group
=20
@@ -25,7 +23,6 @@ used in advertising or otherwise to promote the sal=
e, use or other dealings
 in this Software without prior written authorization from The Open G=
roup.
=20
 */
-/* $XFree86: xc/lib/X11/Xlib.h,v 3.25 2003/11/17 22:20:10 dawes Exp =
$ */
=20
=20
 /*
@@ -38,20 +35,7 @@ in this Software without prior written authorizati=
on from The Open Group.
=20
 #define XlibSpecificationRelease 6
=20
-#ifdef USG
-#ifndef __TYPES__
-#include <sys/types.h>=09=09=09/* forgot to protect it... */
-#define __TYPES__
-#endif /* __TYPES__ */
-#else
-#if defined(_POSIX_SOURCE) && defined(MOTOROLA)
-#undef _POSIX_SOURCE
 #include <sys/types.h>
-#define _POSIX_SOURCE
-#else
-#include <sys/types.h>
-#endif
-#endif /* USG */
=20
 #if defined(__SCO__) || defined(__UNIXWARE__)
 #include <stdint.h>
@@ -64,14 +48,6 @@ in this Software without prior written authorizati=
on from The Open Group.
 #include <X11/Xosdefs.h>
=20
 #ifndef X_WCHAR
-#ifdef X_NOT_STDC_ENV
-#ifndef ISC
-#define X_WCHAR
-#endif
-#endif
-#endif
-
-#ifndef X_WCHAR
 #include <stddef.h>
 #else
 #ifdef __UNIXOS2__
@@ -84,7 +60,7 @@ typedef unsigned long wchar_t;
=20
 #if defined(ISC) && defined(USE_XMBTOWC)
 #define wctomb(a,b)=09_Xwctomb(a,b)
-#define mblen(a,b)=09_Xmblen(a,b)=20
+#define mblen(a,b)=09_Xmblen(a,b)
 #ifndef USE_XWCHAR_STRING
 #define mbtowc(a,b,c)=09_Xmbtowc(a,b,c)
 #endif
@@ -217,10 +193,10 @@ typedef struct {
 =09unsigned long background;/* background pixel */
 =09int line_width;=09=09/* line width */
 =09int line_style;=09 =09/* LineSolid, LineOnOffDash, LineDoubleDash=
 */
-=09int cap_style;=09  =09/* CapNotLast, CapButt,=20
+=09int cap_style;=09  =09/* CapNotLast, CapButt,
 =09=09=09=09   CapRound, CapProjecting */
 =09int join_style;=09 =09/* JoinMiter, JoinRound, JoinBevel */
-=09int fill_style;=09 =09/* FillSolid, FillTiled,=20
+=09int fill_style;=09 =09/* FillSolid, FillTiled,
 =09=09=09=09   FillStippled, FillOpaeueStippled */
 =09int fill_rule;=09  =09/* EvenOddRule, WindingRule */
 =09int arc_mode;=09=09/* ArcChord, ArcPieSlice */
@@ -271,7 +247,7 @@ typedef struct {
=20
 /*
  * Depth structure; contains information for each possible depth.
- */=09
+ */
 typedef struct {
 =09int depth;=09=09/* this depth (Z) of the depth */
 =09int nvisuals;=09=09/* number of Visual types at this depth */
@@ -302,7 +278,7 @@ typedef struct {
 =09unsigned long black_pixel;=09/* White and Black pixel values */
 =09int max_maps, min_maps;=09/* max and min color maps */
 =09int backing_store;=09/* Never, WhenMapped, Always */
-=09Bool save_unders;=09
+=09Bool save_unders;
 =09long root_input_mask;=09/* initial root input mask */
 } Screen;
=20
@@ -425,7 +401,7 @@ typedef struct _XImage {
 =09} f;
 } XImage;
=20
-/*=20
+/*
  * Data structure for XReconfigureWindow
  */
 typedef struct {
@@ -446,7 +422,7 @@ typedef struct {
 =09char pad;
 } XColor;
=20
-/*=20
+/*
  * Data structures for graphics operations.  On most machines, these=
 are
  * congruent with the wire protocol structures, so reformatting the =
data
  * can be avoided on these architectures.
@@ -458,12 +434,12 @@ typedef struct {
 typedef struct {
     short x, y;
 } XPoint;
-   =20
+
 typedef struct {
     short x, y;
     unsigned short width, height;
 } XRectangle;
-   =20
+
 typedef struct {
     short x, y;
     unsigned short width, height;
@@ -522,7 +498,7 @@ typedef struct _XDisplay Display;
 struct _XPrivate;=09=09/* Forward declare before use for C++ */
 struct _XrmHashBucketRec;
=20
-typedef struct=20
+typedef struct
 #ifdef XLIB_ILLEGAL_ACCESS
 _XDisplay
 #endif
@@ -577,7 +553,7 @@ _XDisplay
 =09/* there is more to this structure, but it is private to Xlib */
 }
 #ifdef XLIB_ILLEGAL_ACCESS
-Display,=20
+Display,
 #endif
 *_XPrivDisplay;
=20
@@ -653,7 +629,7 @@ typedef struct {
 =09int mode;=09=09/* NotifyNormal, NotifyGrab, NotifyUngrab */
 =09int detail;
 =09/*
-=09 * NotifyAncestor, NotifyVirtual, NotifyInferior,=20
+=09 * NotifyAncestor, NotifyVirtual, NotifyInferior,
 =09 * NotifyNonlinear,NotifyNonlinearVirtual
 =09 */
 =09Bool same_screen;=09/* same screen flag */
@@ -673,9 +649,9 @@ typedef struct {
 =09=09=09=09   NotifyGrab, NotifyUngrab */
 =09int detail;
 =09/*
-=09 * NotifyAncestor, NotifyVirtual, NotifyInferior,=20
+=09 * NotifyAncestor, NotifyVirtual, NotifyInferior,
 =09 * NotifyNonlinear,NotifyNonlinearVirtual, NotifyPointer,
-=09 * NotifyPointerRoot, NotifyDetailNone=20
+=09 * NotifyPointerRoot, NotifyDetailNone
 =09 */
 } XFocusChangeEvent;
 typedef XFocusChangeEvent XFocusInEvent;
@@ -689,7 +665,7 @@ typedef struct {
 =09Display *display;=09/* Display the event was read from */
 =09Window window;
 =09char key_vector[32];
-} XKeymapEvent;=09
+} XKeymapEvent;
=20
 typedef struct {
 =09int type;
@@ -971,6 +947,33 @@ typedef struct {
 =09Window window;=09/* window on which event was requested in event =
mask */
 } XAnyEvent;
=20
+
+/***************************************************************
+ *
+ * GenericEvent.  This event is the standard event for all newer ext=
ensions.
+ */
+
+typedef struct
+    {
+    int            type;         /* of event. Always GenericEvent */
+    unsigned long  serial;       /* # of last request processed */
+    Bool           send_event;   /* true if from SendEvent request *=
/
+    Display        *display;     /* Display the event was read from =
*/
+    int            extension;    /* major opcode of extension that c=
aused the event */
+    int            evtype;       /* actual event type. */
+    } XGenericEvent;
+
+typedef struct {
+    int            type;         /* of event. Always GenericEvent */
+    unsigned long  serial;       /* # of last request processed */
+    Bool           send_event;   /* true if from SendEvent request *=
/
+    Display        *display;     /* Display the event was read from =
*/
+    int            extension;    /* major opcode of extension that c=
aused the event */
+    int            evtype;       /* actual event type. */
+    unsigned int   cookie;
+    void           *data;
+} XGenericEventCookie;
+
 /*
  * this union is defined so Xlib can always use the same sized
  * event structure internally, to avoid memory fragmentation.
@@ -1008,6 +1011,8 @@ typedef union _XEvent {
 =09XMappingEvent xmapping;
 =09XErrorEvent xerror;
 =09XKeymapEvent xkeymap;
+=09XGenericEvent xgeneric;
+=09XGenericEventCookie xcookie;
 =09long pad[24];
 } XEvent;
 #endif
@@ -1248,7 +1253,7 @@ typedef struct {
 typedef unsigned long XIMFeedback;
=20
 #define XIMReverse=09=091L
-#define XIMUnderline=09=09(1L<<1)=20
+#define XIMUnderline=09=09(1L<<1)
 #define XIMHighlight=09=09(1L<<2)
 #define XIMPrimary=09 =09(1L<<5)
 #define XIMSecondary=09=09(1L<<6)
@@ -1260,11 +1265,11 @@ typedef unsigned long XIMFeedback;
 typedef struct _XIMText {
     unsigned short length;
     XIMFeedback *feedback;
-    Bool encoding_is_wchar;=20
+    Bool encoding_is_wchar;
     union {
 =09char *multi_byte;
 =09wchar_t *wide_char;
-    } string;=20
+    } string;
 } XIMText;
=20
 typedef=09unsigned long=09 XIMPreeditState;
@@ -1294,11 +1299,11 @@ typedef unsigned long XIMStringConversionFeed=
back;
 typedef struct _XIMStringConversionText {
     unsigned short length;
     XIMStringConversionFeedback *feedback;
-    Bool encoding_is_wchar;=20
+    Bool encoding_is_wchar;
     union {
 =09char *mbs;
 =09wchar_t *wcs;
-    } string;=20
+    } string;
 } XIMStringConversionText;
=20
 typedef=09unsigned short=09XIMStringConversionPosition;
@@ -1320,7 +1325,7 @@ typedef enum {
     XIMForwardWord, XIMBackwardWord,
     XIMCaretUp, XIMCaretDown,
     XIMNextLine, XIMPreviousLine,
-    XIMLineStart, XIMLineEnd,=20
+    XIMLineStart, XIMLineEnd,
     XIMAbsolutePosition,
     XIMDontChange
 } XIMCaretDirection;
@@ -1341,7 +1346,7 @@ typedef struct _XIMPreeditDrawCallbackStruct {
 } XIMPreeditDrawCallbackStruct;
=20
 typedef enum {
-    XIMIsInvisible,=09/* Disable caret feedback */=20
+    XIMIsInvisible,=09/* Disable caret feedback */
     XIMIsPrimary,=09/* UI defined caret feedback */
     XIMIsSecondary=09/* UI defined caret feedback */
 } XIMCaretStyle;
@@ -1356,7 +1361,7 @@ typedef enum {
     XIMTextType,
     XIMBitmapType
 } XIMStatusDataType;
-=09
+
 typedef struct _XIMStatusDrawCallbackStruct {
     XIMStatusDataType type;
     union {
@@ -1434,7 +1439,7 @@ extern XModifierKeymap=09*XInsertModifiermapEnt=
ry(
 #else
     KeyCode=09=09/* keycode_entry */,
 #endif
-    int=09=09=09/* modifier */   =20
+    int=09=09=09/* modifier */
 );
=20
 extern XModifierKeymap *XNewModifiermap(
@@ -1480,7 +1485,7 @@ extern XImage *XGetSubImage(
     int=09=09=09/* dest_y */
 );
=20
-/*=20
+/*
  * X function declarations.
  */
 extern Display *XOpenDisplay(
@@ -1513,7 +1518,7 @@ extern Status XGetAtomNames(
 extern char *XGetDefault(
     Display*=09=09/* display */,
     _Xconst char*=09/* program */,
-    _Xconst char*=09/* option */=09=09 =20
+    _Xconst char*=09/* option */
 );
 extern char *XDisplayName(
     _Xconst char*=09/* string */
@@ -1539,7 +1544,7 @@ extern int (*XSetAfterFunction(
 extern Atom XInternAtom(
     Display*=09=09/* display */,
     _Xconst char*=09/* atom_name */,
-    Bool=09=09/* only_if_exists */=09=09=20
+    Bool=09=09/* only_if_exists */
 );
 extern Status XInternAtoms(
     Display*=09=09/* dpy */,
@@ -1556,7 +1561,7 @@ extern Colormap XCreateColormap(
     Display*=09=09/* display */,
     Window=09=09/* w */,
     Visual*=09=09/* visual */,
-    int=09=09=09/* alloc */=09=09=09=20
+    int=09=09=09/* alloc */
 );
 extern Cursor XCreatePixmapCursor(
     Display*=09=09/* display */,
@@ -1565,7 +1570,7 @@ extern Cursor XCreatePixmapCursor(
     XColor*=09=09/* foreground_color */,
     XColor*=09=09/* background_color */,
     unsigned int=09/* x */,
-    unsigned int=09/* y */=09=09=09  =20
+    unsigned int=09/* y */
 );
 extern Cursor XCreateGlyphCursor(
     Display*=09=09/* display */,
@@ -1602,7 +1607,7 @@ extern Pixmap XCreatePixmap(
     Drawable=09=09/* d */,
     unsigned int=09/* width */,
     unsigned int=09/* height */,
-    unsigned int=09/* depth */=09=09       =20
+    unsigned int=09/* depth */
 );
 extern Pixmap XCreateBitmapFromData(
     Display*=09=09/* display */,
@@ -1649,7 +1654,7 @@ extern Window XCreateWindow(
     Visual*=09=09/* visual */,
     unsigned long=09/* valuemask */,
     XSetWindowAttributes*=09/* attributes */
-);=20
+);
 extern Colormap *XListInstalledColormaps(
     Display*=09=09/* display */,
     Window=09=09/* w */,
@@ -1944,7 +1949,7 @@ extern int XAddHost(
 extern int XAddHosts(
     Display*=09=09/* display */,
     XHostAddress*=09/* hosts */,
-    int=09=09=09/* num_hosts */   =20
+    int=09=09=09/* num_hosts */
 );
=20
 extern int XAddToExtensionList(
@@ -2167,7 +2172,7 @@ extern int XConfigureWindow(
     Display*=09=09/* display */,
     Window=09=09/* w */,
     unsigned int=09/* value_mask */,
-    XWindowChanges*=09/* values */=09=09=20
+    XWindowChanges*=09/* values */
 );
=20
 extern int XConnectionNumber(
@@ -2253,7 +2258,7 @@ extern int XDestroySubwindows(
 );
=20
 extern int XDoesBackingStore(
-    Screen*=09=09/* screen */   =20
+    Screen*=09=09/* screen */
 );
=20
 extern Bool XDoesSaveUnders(
@@ -2538,7 +2543,7 @@ extern int XFreeCursor(
 );
=20
 extern int XFreeExtensionList(
-    char**=09=09/* list */   =20
+    char**=09=09/* list */
 );
=20
 extern int XFreeFont(
@@ -2912,7 +2917,7 @@ extern int XPutImage(
     int=09=09=09/* dest_x */,
     int=09=09=09/* dest_y */,
     unsigned int=09/* width */,
-    unsigned int=09/* height */=09 =20
+    unsigned int=09/* height */
 );
=20
 extern int XQLength(
@@ -3002,7 +3007,7 @@ extern int XQueryTextExtents(
     int*=09=09/* direction_return */,
     int*=09=09/* font_ascent_return */,
     int*=09=09/* font_descent_return */,
-    XCharStruct*=09/* overall_return */   =20
+    XCharStruct*=09/* overall_return */
 );
=20
 extern int XQueryTextExtents16(
@@ -3067,7 +3072,7 @@ extern int XRecolorCursor(
 );
=20
 extern int XRefreshKeyboardMapping(
-    XMappingEvent*=09/* event_map */   =20
+    XMappingEvent*=09/* event_map */
 );
=20
 extern int XRemoveFromSaveSet(
@@ -3223,7 +3228,7 @@ extern int XSetFont(
 extern int XSetFontPath(
     Display*=09=09/* display */,
     char**=09=09/* directories */,
-    int=09=09=09/* ndirs */=09    =20
+    int=09=09=09/* ndirs */
 );
=20
 extern int XSetForeground(
@@ -3522,7 +3527,7 @@ extern int XWarpPointer(
     unsigned int=09/* src_width */,
     unsigned int=09/* src_height */,
     int=09=09=09/* dest_x */,
-    int=09=09=09/* dest_y */=09    =20
+    int=09=09=09/* dest_y */
 );
=20
 extern int XWidthMMOfScreen(
@@ -3547,7 +3552,7 @@ extern int XWriteBitmapFile(
     unsigned int=09/* width */,
     unsigned int=09/* height */,
     int=09=09=09/* x_hot */,
-    int=09=09=09/* y_hot */=09=09    =20
+    int=09=09=09/* y_hot */
 );
=20
 extern Bool XSupportsLocale (void);
@@ -3955,7 +3960,7 @@ typedef void (*XConnectionWatchProc)(
     Bool=09=09=09/* opening */,=09 /* open or close flag */
     XPointer*=09=09=09/* watch_data */ /* open sets, close uses */
 );
-   =20
+
=20
 extern Status XInternalConnectionNumbers(
     Display*=09=09=09/* dpy */,
@@ -3982,7 +3987,7 @@ extern void XRemoveConnectionWatch(
=20
 extern void XSetAuthorization(
     char *=09=09=09/* name */,
-    int=09=09=09=09/* namelen */,=20
+    int=09=09=09=09/* namelen */,
     char *=09=09=09/* data */,
     int=09=09=09=09/* datalen */
 );
@@ -4003,6 +4008,16 @@ extern int _Xwctomb(
     wchar_t=09=09=09/* wc */
 );
=20
+extern Bool XGetEventData(
+    Display*=09=09=09/* dpy */,
+    XGenericEventCookie*=09/* cookie*/
+);
+
+extern void XFreeEventData(
+    Display*=09=09=09/* dpy */,
+    XGenericEventCookie*=09/* cookie*/
+);
+
 _XFUNCPROTOEND
=20
 #endif /* _XLIB_H_ */
diff --git a/recipes/xorg-lib/xorg-headers-native/X11/XlibConf.h b/re=
cipes/xorg-lib/xorg-headers-native/X11/XlibConf.h
index c6c180a..9f9b940 100644
--- a/recipes/xorg-lib/xorg-headers-native/X11/XlibConf.h
+++ b/recipes/xorg-lib/xorg-headers-native/X11/XlibConf.h
@@ -1,7 +1,5 @@
-/* include/X11/XlibConf.h.  Generated by configure.  */
+/* include/X11/XlibConf.h.  Generated from XlibConf.h.in by configur=
e.  */
 /*
- * $Id: $
- *
  * Copyright =C2=A9 2005 Keith Packard
  *
  * Permission to use, copy, modify, distribute, and sell this softwa=
re and its
@@ -32,9 +30,9 @@
  */
=20
 /* Threading support? */
-#define XTHREADS=20
+#define XTHREADS 1
=20
 /* Use multi-threaded libc functions? */
-#define XUSE_MTSAFE_API=20
+#define XUSE_MTSAFE_API 1
=20
 #endif /* _XLIBCONF_H_ */
diff --git a/recipes/xorg-lib/xorg-headers-native/X11/Xlibint.h b/rec=
ipes/xorg-lib/xorg-headers-native/X11/Xlibint.h
index 6b1e0c9..767b083 100644
--- a/recipes/xorg-lib/xorg-headers-native/X11/Xlibint.h
+++ b/recipes/xorg-lib/xorg-headers-native/X11/Xlibint.h
@@ -1,4 +1,3 @@
-/* $Xorg: Xlibint.h,v 1.5 2001/02/09 02:03:38 xorgcvs Exp $ */
=20
 /*
=20
@@ -27,7 +26,6 @@ other dealings in this Software without prior writt=
en authorization
 from The Open Group.
=20
 */
-/* $XFree86: xc/lib/X11/Xlibint.h,v 3.27 2003/05/27 22:26:26 tsi Exp=
 $ */
=20
 #ifndef _XLIBINT_H_
 #define _XLIBINT_H_ 1
@@ -108,7 +106,7 @@ struct _XDisplay
 =09int nscreens;=09=09/* number of screens on this server*/
 =09Screen *screens;=09/* pointer to list of screens */
 =09unsigned long motion_buffer;=09/* size of motion buffer */
-=09unsigned long flags;=09   /* internal connection flags */
+=09volatile unsigned long flags;=09   /* internal connection flags *=
/
 =09int min_keycode;=09/* minimum defined keycode */
 =09int max_keycode;=09/* maximum defined keycode */
 =09KeySym *keysyms;=09/* This server's keysyms */
@@ -121,7 +119,7 @@ struct _XDisplay
 =09struct _XExten *ext_procs; /* extensions initialized on this disp=
lay */
 =09/*
 =09 * the following can be fixed size, as the protocol defines how
-=09 * much address space is available.=20
+=09 * much address space is available.
 =09 * While this could be done using the extension vector, there
 =09 * may be MANY events processed, so a search through the extensio=
n
 =09 * list to find the right procedure for each event might be
@@ -184,6 +182,21 @@ struct _XDisplay
 =09int xcmisc_opcode;=09/* major opcode for XC-MISC */
 =09struct _XkbInfoRec *xkb_info; /* XKB info */
 =09struct _XtransConnInfo *trans_conn; /* transport connection objec=
t */
+=09struct _X11XCBPrivate *xcb; /* XCB glue private data */
+
+=09/* Generic event cookie handling */
+=09unsigned int next_cookie; /* next event cookie */
+=09/* vector for wire to generic event, index is (extension - 128) *=
/
+=09Bool (*generic_event_vec[128])(
+=09=09Display *=09/* dpy */,
+=09=09XGenericEventCookie *=09/* Xlib event */,
+=09=09xEvent *=09/* wire event */);
+=09/* vector for event copy, index is (extension - 128) */
+=09Bool (*generic_event_copy_vec[128])(
+=09=09Display *=09/* dpy */,
+=09=09XGenericEventCookie *=09/* in */,
+=09=09XGenericEventCookie *   /* out*/);
+=09void *cookiejar;  /* cookie events returned but not claimed */
 };
=20
 #define XAllocIDs(dpy,ids,n) (*(dpy)->idlist_alloc)(dpy,ids,n)
@@ -416,7 +429,7 @@ extern LockInfoPtr _Xglobal_lock;
=20
 /*
  * GetReq - Get the next available X request packet in the buffer an=
d
- * return it.=20
+ * return it.
  *
  * "name" is the name of the request, e.g. CreatePixmap, OpenFont, e=
tc.
  * "req" is the name of the request pointer.
@@ -473,9 +486,9 @@ extern LockInfoPtr _Xglobal_lock;
=20
=20
 /*
- * GetResReq is for those requests that have a resource ID=20
+ * GetResReq is for those requests that have a resource ID
  * (Window, Pixmap, GContext, etc.) as their single argument.
- * "rid" is the name of the resource.=20
+ * "rid" is the name of the resource.
  */
=20
 #if !defined(UNIXCPP) || defined(ANSICPP)
@@ -504,7 +517,7 @@ extern LockInfoPtr _Xglobal_lock;
=20
 /*
  * GetEmptyReq is for those requests that have no arguments
- * at all.=20
+ * at all.
  */
 #if !defined(UNIXCPP) || defined(ANSICPP)
 #define GetEmptyReq(name, req) \
@@ -610,7 +623,7 @@ extern void _XFlushGCCache(Display *dpy, GC gc);
  * "ptr" is the pointer being assigned to.
  * "n" is the number of bytes to allocate.
  *
- * Example:=20
+ * Example:
  *    xTextElt *elt;
  *    BufAlloc (xTextElt *, elt, nbytes)
  */
@@ -660,7 +673,7 @@ extern void _XRead32(
 =09=09=09     (((cs)->rbearing|(cs)->lbearing| \
 =09=09=09       (cs)->ascent|(cs)->descent) =3D=3D 0))
=20
-/*=20
+/*
  * CI_GET_CHAR_INFO_1D - return the charinfo struct for the indicate=
d 8bit
  * character.  If the character is in the column and exists, then re=
turn the
  * appropriate metrics (note that fonts with common per-character me=
trics will
@@ -686,7 +699,7 @@ extern void _XRead32(
=20
=20
 /*
- * CI_GET_CHAR_INFO_2D - return the charinfo struct for the indicate=
d row and=20
+ * CI_GET_CHAR_INFO_2D - return the charinfo struct for the indicate=
d row and
  * column.  This is used for fonts that have more than row zero.
  */
 #define CI_GET_CHAR_INFO_2D(fs,row,col,def,cs) \
@@ -1004,6 +1017,19 @@ extern Bool _XUnknownWireEvent(
     XEvent*=09/* re */,
     xEvent*=09/* event */
 );
+
+extern Bool _XUnknownWireEventCookie(
+    Display*=09/* dpy */,
+    XGenericEventCookie*=09/* re */,
+    xEvent*=09/* event */
+);
+
+extern Bool _XUnknownCopyEventCookie(
+    Display*=09/* dpy */,
+    XGenericEventCookie*=09/* in */,
+    XGenericEventCookie*=09/* out */
+);
+
 extern Status _XUnknownNativeEvent(
     Display*=09/* dpy */,
     XEvent*=09/* re */,
@@ -1041,7 +1067,7 @@ extern int (*XESetCopyGC(
 =09      Display*=09=09=09/* display */,
               GC=09=09=09/* gc */,
               XExtCodes*=09=09/* codes */
-            )=09=09/* proc */=09     =20
+            )=09=09/* proc */
 ))(
     Display*, GC, XExtCodes*
 );
@@ -1053,7 +1079,7 @@ extern int (*XESetFlushGC(
 =09      Display*=09=09=09/* display */,
               GC=09=09=09/* gc */,
               XExtCodes*=09=09/* codes */
-            )=09=09/* proc */=09    =20
+            )=09=09/* proc */
 ))(
     Display*, GC, XExtCodes*
 );
@@ -1065,7 +1091,7 @@ extern int (*XESetFreeGC(
 =09      Display*=09=09=09/* display */,
               GC=09=09=09/* gc */,
               XExtCodes*=09=09/* codes */
-            )=09=09/* proc */=09    =20
+            )=09=09/* proc */
 ))(
     Display*, GC, XExtCodes*
 );
@@ -1077,7 +1103,7 @@ extern int (*XESetCreateFont(
 =09      Display*=09=09=09/* display */,
               XFontStruct*=09=09/* fs */,
               XExtCodes*=09=09/* codes */
-            )=09=09/* proc */   =20
+            )=09=09/* proc */
 ))(
     Display*, XFontStruct*, XExtCodes*
 );
@@ -1089,10 +1115,10 @@ extern int (*XESetFreeFont(
 =09      Display*=09=09=09/* display */,
               XFontStruct*=09=09/* fs */,
               XExtCodes*=09=09/* codes */
-            )=09=09/* proc */   =20
+            )=09=09/* proc */
 ))(
     Display*, XFontStruct*, XExtCodes*
-);=20
+);
=20
 extern int (*XESetCloseDisplay(
     Display*=09=09/* display */,
@@ -1100,7 +1126,7 @@ extern int (*XESetCloseDisplay(
     int (*) (
 =09      Display*=09=09=09/* display */,
               XExtCodes*=09=09/* codes */
-            )=09=09/* proc */   =20
+            )=09=09/* proc */
 ))(
     Display*, XExtCodes*
 );
@@ -1113,7 +1139,7 @@ extern int (*XESetError(
               xError*=09=09=09/* err */,
               XExtCodes*=09=09/* codes */,
               int*=09=09=09/* ret_code */
-            )=09=09/* proc */   =20
+            )=09=09/* proc */
 ))(
     Display*, xError*, XExtCodes*, int*
 );
@@ -1127,7 +1153,7 @@ extern char* (*XESetErrorString(
                 XExtCodes*=09=09/* codes */,
                 char*=09=09=09/* buffer */,
                 int=09=09=09/* nbytes */
-              )=09=09/* proc */=09      =20
+              )=09=09/* proc */
 ))(
     Display*, int, XExtCodes*, char*, int
 );
@@ -1151,11 +1177,36 @@ extern Bool (*XESetWireToEvent(
 =09       Display*=09=09=09/* display */,
                XEvent*=09=09=09/* re */,
                xEvent*=09=09=09/* event */
-             )=09=09/* proc */   =20
+             )=09=09/* proc */
 ))(
     Display*, XEvent*, xEvent*
 );
=20
+extern Bool (*XESetWireToEventCookie(
+    Display*=09=09/* display */,
+    int=09=09=09/* extension */,
+    Bool (*) (
+=09       Display*=09=09=09/* display */,
+               XGenericEventCookie*=09/* re */,
+               xEvent*=09=09=09/* event */
+             )=09=09/* proc */
+))(
+    Display*, XGenericEventCookie*, xEvent*
+);
+
+extern Bool (*XESetCopyEventCookie(
+    Display*=09=09/* display */,
+    int=09=09=09/* extension */,
+    Bool (*) (
+=09       Display*=09=09=09/* display */,
+               XGenericEventCookie*=09/* in */,
+               XGenericEventCookie*=09/* out */
+             )=09=09/* proc */
+))(
+    Display*, XGenericEventCookie*, XGenericEventCookie*
+);
+
+
 extern Status (*XESetEventToWire(
     Display*=09=09/* display */,
     int=09=09=09/* event_number */,
@@ -1163,7 +1214,7 @@ extern Status (*XESetEventToWire(
 =09      Display*=09=09=09/* display */,
               XEvent*=09=09=09/* re */,
               xEvent*=09=09=09/* event */
-            )=09=09/* proc */  =20
+            )=09=09/* proc */
 ))(
     Display*, XEvent*, xEvent*
 );
@@ -1175,7 +1226,7 @@ extern Bool (*XESetWireToError(
 =09       Display*=09=09=09/* display */,
 =09       XErrorEvent*=09=09/* he */,
 =09       xError*=09=09=09/* we */
-            )=09=09/* proc */  =20
+            )=09=09/* proc */
 ))(
     Display*, XErrorEvent*, xError*
 );
@@ -1188,7 +1239,7 @@ extern void (*XESetBeforeFlush(
 =09       XExtCodes*=09=09/* codes */,
 =09       _Xconst char*=09=09/* data */,
 =09       long=09=09=09/* len */
-            )=09=09/* proc */  =20
+            )=09=09/* proc */
 ))(
     Display*, XExtCodes*, _Xconst char*, long
 );
@@ -1214,6 +1265,11 @@ extern void _XUnregisterInternalConnection(
     int=09=09=09=09/* fd */
 );
=20
+extern void _XProcessInternalConnection(
+    Display*=09=09=09/* dpy */,
+    struct _XConnectionInfo*=09/* conn_info */
+);
+
 /* Display structure has pointers to these */
=20
 struct _XConnectionInfo {=09/* info from _XRegisterInternalConnectio=
n */
@@ -1312,9 +1368,29 @@ Status _XGetWindowAttributes(
     XWindowAttributes *attr);
=20
 int _XPutBackEvent (
-    register Display *dpy,=20
+    register Display *dpy,
     register XEvent *event);
=20
+extern Bool _XIsEventCookie(
+        Display *dpy,
+        XEvent *ev);
+
+extern void _XFreeEventCookies(
+        Display *dpy);
+
+extern void _XStoreEventCookie(
+        Display *dpy,
+        XEvent *ev);
+
+extern Bool _XFetchEventCookie(
+        Display *dpy,
+        XGenericEventCookie *ev);
+
+extern Bool _XCopyEventCookie(
+        Display *dpy,
+        XGenericEventCookie *in,
+        XGenericEventCookie *out);
+
 _XFUNCPROTOEND
=20
 #endif /* _XLIBINT_H_ */
diff --git a/recipes/xorg-lib/xorg-headers-native/X11/Xlocale.h b/rec=
ipes/xorg-lib/xorg-headers-native/X11/Xlocale.h
index 61d2f7a..baa1335 100644
--- a/recipes/xorg-lib/xorg-headers-native/X11/Xlocale.h
+++ b/recipes/xorg-lib/xorg-headers-native/X11/Xlocale.h
@@ -1,4 +1,3 @@
-/* $Xorg: Xlocale.h,v 1.4 2001/02/09 02:03:38 xorgcvs Exp $ */
 /*
=20
 Copyright 1991, 1998  The Open Group
@@ -26,7 +25,6 @@ other dealings in this Software without prior writt=
en authorization
 from The Open Group.
=20
 */
-/* $XFree86: xc/lib/X11/Xlocale.h,v 1.4 2001/12/14 19:54:09 dawes Ex=
p $ */
=20
 #ifndef _XLOCALE_H_
 #define _XLOCALE_H_
diff --git a/recipes/xorg-lib/xorg-headers-native/X11/Xmd.h b/recipes=
/xorg-lib/xorg-headers-native/X11/Xmd.h
index 06fd2bf..f3868b3 100644
--- a/recipes/xorg-lib/xorg-headers-native/X11/Xmd.h
+++ b/recipes/xorg-lib/xorg-headers-native/X11/Xmd.h
@@ -1,5 +1,3 @@
-/* $XdotOrg: proto/X11/Xmd.h,v 1.4 2006/04/20 01:24:25 alanc Exp $ *=
/
-/* $XFree86: xc/include/Xmd.h,v 3.18tsi Exp $ */
 /***********************************************************
=20
 Copyright 1987, 1998  The Open Group
@@ -47,8 +45,7 @@ SOFTWARE.
=20
 ******************************************************************/
 #ifndef XMD_H
-#define XMD_H 1
-/* $Xorg: Xmd.h,v 1.4 2001/02/09 02:03:22 xorgcvs Exp $ */
+# define XMD_H 1
 /*
  *  Xmd.h: MACHINE DEPENDENT DECLARATIONS.
  */
@@ -56,32 +53,27 @@ SOFTWARE.
 /*
  * Special per-machine configuration flags.
  */
-#if defined(sun) && defined(__SVR4)
-# include <sys/isa_defs.h> /* Solaris: defines _LP64 if necessary */
-#endif
-
-#ifdef CRAY
-#define WORD64=09=09=09=09/* 64-bit architecture */
-#endif
-#if defined (_LP64) || \
-    defined(__alpha) || defined(__alpha__) || \
-    defined(__ia64__) || defined(ia64) || \
-    defined(__sparc64__) || \
-    defined(__s390x__) || \
-    (defined(__hppa__) && defined(__LP64__)) || \
-    defined(__amd64__) || defined(amd64) || \
-    defined(__powerpc64__) || \
-    (defined(sgi) && (_MIPS_SZLONG =3D=3D 64))
-#define LONG64=09=09=09=09/* 32/64-bit architecture */
-#endif
+# if defined(__sun) && defined(__SVR4)
+#  include <sys/isa_defs.h> /* Solaris: defines _LP64 if necessary *=
/
+# endif
+
+# if defined (_LP64) || defined(__LP64__) || \
+     defined(__alpha) || defined(__alpha__) || \
+     defined(__ia64__) || defined(ia64) || \
+     defined(__sparc64__) || \
+     defined(__s390x__) || \
+     defined(__amd64__) || defined(amd64) || \
+     defined(__powerpc64__)
+#  define LONG64=09=09=09=09/* 32/64-bit architecture */
+# endif
=20
 /*
  * Stuff to handle large architecture machines; the constants were g=
enerated
  * on a 32-bit machine and must correspond to the protocol.
  */
-#ifdef WORD64
-#define MUSTCOPY
-#endif /* WORD64 */
+# ifdef WORD64
+#  define MUSTCOPY
+# endif /* WORD64 */
=20
=20
 /*
@@ -95,114 +87,99 @@ SOFTWARE.
  * symbols are no more than 32 characters long (which causes problem=
s for some
  * compilers and preprocessors).
  *
- * The extra indirection in the __STDC__ case is to get macro argume=
nts to
- * expand correctly before the concatenation, rather than afterward.
+ * The extra indirection is to get macro arguments to expand correct=
ly before
+ * the concatenation, rather than afterward.
  */
-#if ((defined(__STDC__) || defined(__cplusplus) || defined(c_plusplu=
s)) && !defined(UNIXCPP)) || defined(ANSICPP)
-#define _SIZEOF(x) sz_##x
-#define SIZEOF(x) _SIZEOF(x)
-#else
-#define SIZEOF(x) sz_/**/x
-#endif /* if ANSI C compiler else not */
+# define _SIZEOF(x) sz_##x
+# define SIZEOF(x) _SIZEOF(x)
=20
 /*
  * Bitfield suffixes for the protocol structure elements, if you
  * need them.  Note that bitfields are not guaranteed to be signed
  * (or even unsigned) according to ANSI C.
  */
-#ifdef WORD64
+# ifdef WORD64
 typedef long INT64;
 typedef unsigned long CARD64;
-#define B32 :32
-#define B16 :16
-#ifdef UNSIGNEDBITFIELDS
+#  define B32 :32
+#  define B16 :16
+#  ifdef UNSIGNEDBITFIELDS
 typedef unsigned int INT32;
 typedef unsigned int INT16;
-#else
-#ifdef __STDC__
+#  else
 typedef signed int INT32;
 typedef signed int INT16;
-#else
-typedef int INT32;
-typedef int INT16;
-#endif
-#endif
-#else
-#define B32
-#define B16
-#ifdef LONG64
+#  endif
+# else
+#  define B32
+#  define B16
+#  ifdef LONG64
 typedef long INT64;
 typedef int INT32;
-#else
+#  else
 typedef long INT32;
-#endif
+#  endif
 typedef short INT16;
-#endif
+# endif
=20
-#if defined(__STDC__) || defined(sgi) || defined(AIXV3)
 typedef signed char    INT8;
-#else
-typedef char           INT8;
-#endif
=20
-#ifdef LONG64
+# ifdef LONG64
 typedef unsigned long CARD64;
 typedef unsigned int CARD32;
-#else
+# else
 typedef unsigned long CARD32;
-#endif
+# endif
+# if !defined(WORD64) && !defined(LONG64)
+typedef unsigned long long CARD64;
+# endif
 typedef unsigned short CARD16;
 typedef unsigned char  CARD8;
=20
 typedef CARD32=09=09BITS32;
 typedef CARD16=09=09BITS16;
=20
-#ifndef I_NEED_OS2_H
 typedef CARD8=09=09BYTE;
 typedef CARD8=09=09BOOL;
-#else
-#define BYTE=09CARD8
-#define BOOL=09CARD8
-#endif
=20
 /*
  * definitions for sign-extending bitfields on 64-bit architectures
  */
-#if defined(WORD64) && defined(UNSIGNEDBITFIELDS)
-#define cvtINT8toInt(val)   (((val) & 0x00000080) ? ((val) | 0xfffff=
fffffffff00) : (val))
-#define cvtINT16toInt(val)  (((val) & 0x00008000) ? ((val) | 0xfffff=
fffffff0000) : (val))
-#define cvtINT32toInt(val)  (((val) & 0x80000000) ? ((val) | 0xfffff=
fff00000000) : (val))
-#define cvtINT8toShort(val)  cvtINT8toInt(val)
-#define cvtINT16toShort(val) cvtINT16toInt(val)
-#define cvtINT32toShort(val) cvtINT32toInt(val)
-#define cvtINT8toLong(val)  cvtINT8toInt(val)
-#define cvtINT16toLong(val) cvtINT16toInt(val)
-#define cvtINT32toLong(val) cvtINT32toInt(val)
-#else
-#define cvtINT8toInt(val) (val)
-#define cvtINT16toInt(val) (val)
-#define cvtINT32toInt(val) (val)
-#define cvtINT8toShort(val) (val)
-#define cvtINT16toShort(val) (val)
-#define cvtINT32toShort(val) (val)
-#define cvtINT8toLong(val) (val)
-#define cvtINT16toLong(val) (val)
-#define cvtINT32toLong(val) (val)
-#endif /* WORD64 and UNSIGNEDBITFIELDS */
-
-
-
-#ifdef MUSTCOPY
+# if defined(WORD64) && defined(UNSIGNEDBITFIELDS)
+#  define cvtINT8toInt(val)   (((val) & 0x00000080) ? ((val) | 0xfff=
fffffffffff00) : (val))
+#  define cvtINT16toInt(val)  (((val) & 0x00008000) ? ((val) | 0xfff=
fffffffff0000) : (val))
+#  define cvtINT32toInt(val)  (((val) & 0x80000000) ? ((val) | 0xfff=
fffff00000000) : (val))
+#  define cvtINT8toShort(val)  cvtINT8toInt(val)
+#  define cvtINT16toShort(val) cvtINT16toInt(val)
+#  define cvtINT32toShort(val) cvtINT32toInt(val)
+#  define cvtINT8toLong(val)  cvtINT8toInt(val)
+#  define cvtINT16toLong(val) cvtINT16toInt(val)
+#  define cvtINT32toLong(val) cvtINT32toInt(val)
+# else
+#  define cvtINT8toInt(val) (val)
+#  define cvtINT16toInt(val) (val)
+#  define cvtINT32toInt(val) (val)
+#  define cvtINT8toShort(val) (val)
+#  define cvtINT16toShort(val) (val)
+#  define cvtINT32toShort(val) (val)
+#  define cvtINT8toLong(val) (val)
+#  define cvtINT16toLong(val) (val)
+#  define cvtINT32toLong(val) (val)
+# endif /* WORD64 and UNSIGNEDBITFIELDS */
+
+
+
+# ifdef MUSTCOPY
 /*
  * This macro must not cast or else pointers will get aligned and be=
 wrong
  */
-#define NEXTPTR(p,t)  (((char *) p) + SIZEOF(t))
-#else /* else not MUSTCOPY, this is used for 32-bit machines */
+#  define NEXTPTR(p,t)  (((char *) p) + SIZEOF(t))
+# else /* else not MUSTCOPY, this is used for 32-bit machines */
 /*
  * this version should leave result of type (t *), but that should o=
nly be
  * used when not in MUSTCOPY
  */
-#define NEXTPTR(p,t) (((t *)(p)) + 1)
-#endif /* MUSTCOPY - used machines whose C structs don't line up wit=
h proto */
+#  define NEXTPTR(p,t) (((t *)(p)) + 1)
+# endif /* MUSTCOPY - used machines whose C structs don't line up wi=
th proto */
=20
 #endif /* XMD_H */
diff --git a/recipes/xorg-lib/xorg-headers-native/X11/Xos.h b/recipes=
/xorg-lib/xorg-headers-native/X11/Xos.h
index 83be4c6..646716b 100644
--- a/recipes/xorg-lib/xorg-headers-native/X11/Xos.h
+++ b/recipes/xorg-lib/xorg-headers-native/X11/Xos.h
@@ -1,8 +1,5 @@
 /*
- * $XdotOrg: proto/X11/Xos.h,v 1.9 2006/04/20 01:24:25 alanc Exp $
- * $Xorg: Xos.h,v 1.6 2001/02/09 02:03:22 xorgcvs Exp $
- *=20
- *=20
+ *
 Copyright 1987, 1998  The Open Group
=20
 Permission to use, copy, modify, distribute, and sell this software =
and its
@@ -28,53 +25,26 @@ in this Software without prior written authorizat=
ion from The Open Group.
  * The X Window System is a Trademark of The Open Group.
  *
  */
-/* $XFree86: xc/include/Xos.h,v 3.41tsi Exp $ */
=20
 /* This is a collection of things to try and minimize system depende=
ncies
  * in a "significant" number of source files.
  */
=20
 #ifndef _XOS_H_
-#define _XOS_H_
+# define _XOS_H_
=20
-#include <X11/Xosdefs.h>
+# include <X11/Xosdefs.h>
=20
 /*
  * Get major data types (esp. caddr_t)
  */
=20
-#ifdef USG
-#ifndef __TYPES__
-#ifdef CRAY
-#define word word_t
-#endif /* CRAY */
-#include <sys/types.h>=09=09=09/* forgot to protect it... */
-#define __TYPES__
-#endif /* __TYPES__ */
-#else /* USG */
-#if defined(_POSIX_SOURCE) && defined(MOTOROLA)
-#undef _POSIX_SOURCE
-#include <sys/types.h>
-#define _POSIX_SOURCE
-#else
 # include <sys/types.h>
-#endif
-#endif /* USG */
=20
-#ifndef sgi
-#if defined(__SCO__) || defined(__UNIXWARE__)
-#include <stdint.h>
-#endif
-#endif
+# if defined(__SCO__) || defined(__UNIXWARE__)
+#  include <stdint.h>
+# endif
=20
-#ifdef _SEQUENT_
-/*
- * in_systm.h compatibility between SysV and BSD types u_char u_shor=
t u_long
- * select.h  for typedef of args to select, fd_set, may use SVR4 lat=
er
- */
-#include <netinet/in_systm.h>
-#include <sys/select.h>
-#endif /* _SEQUENT_ */
=20
 /*
  * Just about everyone needs the strings routines.  We provide both =
forms here,
@@ -89,208 +59,90 @@ in this Software without prior written authoriza=
tion from The Open Group.
  * which can be really inconvenient. :-(
  */
=20
-#ifndef X_NOT_STDC_ENV
-
-#include <string.h>
-#if defined(__SCO__) || defined(__UNIXWARE__)
-#include <strings.h>
-#else
-#if (defined(sun) && defined(__SVR4))
-#include <strings.h>
-#endif
-#ifdef __STDC__
-#ifndef index
-#define index(s,c) (strchr((s),(c)))
-#endif
-#ifndef rindex
-#define rindex(s,c) (strrchr((s),(c)))
-#endif
-#else
-#ifndef index
-#define index strchr
-#endif
-#ifndef rindex
-#define rindex strrchr
-#endif
-#endif
-#endif
-
-#else
-
-#ifdef SYSV
-#if defined(clipper) || defined(__clipper__)
-#include <malloc.h>
-#endif
-#include <string.h>
-#define index strchr
-#define rindex strrchr
-#else
-#include <strings.h>
-#define strchr index
-#define strrchr rindex
-#endif
-
-#endif /* X_NOT_STDC_ENV */
-
-/*
- * strerror()
- */
-#if (defined(X_NOT_STDC_ENV) || (defined(sun) && !defined(SVR4)) || =
defined(macII)) && !defined(__GLIBC__)
-#ifndef strerror
-extern char *sys_errlist[];
-extern int sys_nerr;
-#define strerror(n) \
-    (((n) >=3D 0 && (n) < sys_nerr) ? sys_errlist[n] : "unknown erro=
r")
-#endif
-#endif
+# include <string.h>
+# if defined(__SCO__) || defined(__UNIXWARE__) || defined(__sun)
+#  include <strings.h>
+# else
+#  ifndef index
+#   define index(s,c) (strchr((s),(c)))
+#  endif
+#  ifndef rindex
+#   define rindex(s,c) (strrchr((s),(c)))
+#  endif
+# endif
=20
 /*
  * Get open(2) constants
  */
-#if defined(X_NOT_POSIX)
-#include <fcntl.h>
-#if defined(USL) || defined(CRAY) || defined(MOTOROLA) || (defined(i=
386) && (defined(SYSV) || defined(SVR4))) || defined(__sxg__)
-#include <unistd.h>
-#endif
-#ifdef WIN32
-#include <X11/Xw32defs.h>
-#else
-#include <sys/file.h>
-#endif
-#else /* X_NOT_POSIX */
-#if !defined(_POSIX_SOURCE) && defined(macII)
-#define _POSIX_SOURCE
-#include <fcntl.h>
-#include <unistd.h>
-#undef _POSIX_SOURCE
-#else
-#include <fcntl.h>
-#include <unistd.h>
-#endif
-#endif /* X_NOT_POSIX else */
+# if defined(X_NOT_POSIX)
+#  include <fcntl.h>
+#  if defined(USL) || defined(__i386__) && (defined(SYSV) || defined=
(SVR4))
+#   include <unistd.h>
+#  endif
+#  ifdef WIN32
+#   include <X11/Xw32defs.h>
+#  else
+#   include <sys/file.h>
+#  endif
+# else /* X_NOT_POSIX */
+#  include <fcntl.h>
+#  include <unistd.h>
+# endif /* X_NOT_POSIX else */
=20
 /*
  * Get struct timeval and struct tm
  */
=20
-#if defined(SYSV) && !defined(_SEQUENT_)
-
-#ifndef USL
-#include <sys/time.h>
-#endif
-#include <time.h>
-#ifdef CRAY
-#undef word
-#endif /* CRAY */
-#if defined(USG) && !defined(CRAY) && !defined(MOTOROLA) && !defined=
(uniosu) && !defined(__sxg__) && !defined(clipper) && !defined(__clip=
per__)
-struct timeval {
-    long tv_sec;
-    long tv_usec;
-};
-#ifndef USL_SHARELIB
-struct timezone {
-    int tz_minuteswest;
-    int tz_dsttime;
-};
-#endif /* USL_SHARELIB */
-#endif /* USG */
-
-#ifdef _SEQUENT_
-struct timezone {
-    int tz_minuteswest;
-    int tz_dsttime;
-};
-#endif /* _SEQUENT_ */
-
-#else /* not SYSV */
-
-#if defined(_POSIX_SOURCE) && defined(SVR4)
+# if defined(_POSIX_SOURCE) && defined(SVR4)
 /* need to omit _POSIX_SOURCE in order to get what we want in SVR4 *=
/
-#undef _POSIX_SOURCE
-#include <sys/time.h>
-#define _POSIX_SOURCE
-#elif defined(WIN32)
-#include <time.h>
-#if !defined(_WINSOCKAPI_) && !defined(_WILLWINSOCK_) && !defined(_T=
IMEVAL_DEFINED) && !defined(_STRUCT_TIMEVAL)
+#  undef _POSIX_SOURCE
+#  include <sys/time.h>
+#  define _POSIX_SOURCE
+# elif defined(WIN32)
+#  include <time.h>
+#  if !defined(_WINSOCKAPI_) && !defined(_WILLWINSOCK_) && !defined(=
_TIMEVAL_DEFINED) && !defined(_STRUCT_TIMEVAL)
 struct timeval {
     long    tv_sec;         /* seconds */
     long    tv_usec;        /* and microseconds */
 };
-#define _TIMEVAL_DEFINED
-#endif
-#include <sys/timeb.h>
-#define gettimeofday(t) \
+#   define _TIMEVAL_DEFINED
+#  endif
+#  include <sys/timeb.h>
+#  define gettimeofday(t) \
 { \
     struct _timeb _gtodtmp; \
     _ftime (&_gtodtmp); \
     (t)->tv_sec =3D _gtodtmp.time; \
     (t)->tv_usec =3D _gtodtmp.millitm * 1000; \
 }
-#elif defined(_SEQUENT_) || defined(Lynx)
-#include <time.h>
-#elif defined (__QNX__)
-typedef unsigned long fd_mask;
-/* Make sure we get 256 bit select masks */
-#define FD_SETSIZE 256
-#include <sys/select.h>
-#include <sys/time.h>
-#include <time.h>
-#else
-#include <sys/time.h>
-#include <time.h>
-#endif /* defined(_POSIX_SOURCE) && defined(SVR4) */
-
-#endif /* SYSV */
+# else
+#  include <sys/time.h>
+#  include <time.h>
+# endif /* defined(_POSIX_SOURCE) && defined(SVR4) */
=20
 /* define X_GETTIMEOFDAY macro, a portable gettimeofday() */
-#if defined(_XOPEN_XPG4) || defined(_XOPEN_UNIX) /* _XOPEN_UNIX is X=
PG4.2 */
-#define X_GETTIMEOFDAY(t) gettimeofday(t, (struct timezone*)0)
-#else
-#if defined(SVR4) || defined(VMS) || defined(WIN32)
-#define X_GETTIMEOFDAY(t) gettimeofday(t)
-#else
-#define X_GETTIMEOFDAY(t) gettimeofday(t, (struct timezone*)0)
-#endif
-#endif /* XPG4 else */
-
-#ifdef __UNIXOS2__
-typedef unsigned long fd_mask;
-#include <limits.h>
-#define MAX_PATH _POSIX_PATH_MAX
-#endif
-
-#ifdef __GNU__
-#define PATH_MAX 4096
-#define MAXPATHLEN 4096
-#define OPEN_MAX 256 /* We define a reasonable limit.  */
-#endif
+# if defined(_XOPEN_XPG4) || defined(_XOPEN_UNIX) /* _XOPEN_UNIX is =
XPG4.2 */
+#  define X_GETTIMEOFDAY(t) gettimeofday(t, (struct timezone*)0)
+# else
+#  if defined(SVR4) || defined(__SVR4) || defined(WIN32)
+#   define X_GETTIMEOFDAY(t) gettimeofday(t)
+#  else
+#   define X_GETTIMEOFDAY(t) gettimeofday(t, (struct timezone*)0)
+#  endif
+# endif /* XPG4 else */
+
+
+# ifdef __GNU__
+#  define PATH_MAX 4096
+#  define MAXPATHLEN 4096
+#  define OPEN_MAX 256 /* We define a reasonable limit.  */
+# endif
=20
 /* use POSIX name for signal */
-#if defined(X_NOT_POSIX) && defined(SYSV) && !defined(SIGCHLD) && !d=
efined(ISC)
-#define SIGCHLD SIGCLD
-#endif
-
-#ifdef ISC
-#include <sys/bsdtypes.h>
-#include <sys/limits.h>
-#define NGROUPS 16
-#endif
-
-#if defined(ISC) || defined(__UNIXOS2__) || \
-    (defined(__linux__) && !defined(__GLIBC__)) || \
-    (defined(__QNX__) && !defined(UNIXCONN))
-/*
- *=09Some OS's may not have this
- */
-
-#define X_NO_SYS_UN 1
-
-struct sockaddr_un {
-=09short=09sun_family;
-=09char=09sun_path[108];
-};
-#endif
+# if defined(X_NOT_POSIX) && defined(SYSV) && !defined(SIGCHLD)
+#  define SIGCHLD SIGCLD
+# endif
=20
-#include <X11/Xarch.h>
+# include <X11/Xarch.h>
=20
 #endif /* _XOS_H_ */
diff --git a/recipes/xorg-lib/xorg-headers-native/X11/Xos_r.h b/recip=
es/xorg-lib/xorg-headers-native/X11/Xos_r.h
index 694f7a0..f963b64 100644
--- a/recipes/xorg-lib/xorg-headers-native/X11/Xos_r.h
+++ b/recipes/xorg-lib/xorg-headers-native/X11/Xos_r.h
@@ -1,5 +1,3 @@
-/* $Xorg: Xos_r.h,v 1.4 2001/02/09 02:03:22 xorgcvs Exp $ */
-/* $XdotOrg: proto/X11/Xos_r.h,v 1.6 2006/04/20 01:24:25 alanc Exp $=
 */
 /*
 Copyright 1996, 1998  The Open Group
=20
@@ -23,7 +21,6 @@ Except as contained in this notice, the name of The=
 Open Group shall not be
 used in advertising or otherwise to promote the sale, use or other d=
ealings
 in this Software without prior written authorization from The Open G=
roup.
 */
-/* $XFree86: xc/include/Xos_r.h,v 1.18tsi Exp $ */
=20
 /*
  * Various and sundry Thread-Safe functions used by X11, Motif, and =
CDE.
@@ -40,13 +37,13 @@ in this Software without prior written authorizat=
ion from The Open Group.
  *
  * If you are on a platform that defines XTHREADS but does not have
  * MT-safe system API (e.g. UnixWare) you must define _Xos_processLo=
ck
- * and _Xos_processUnlock macros before including this header.  If
- * you are on OSF/1 V3.2 and plan to use readdir(), you must also de=
fine
- * _Xos_isThreadInitialized.  For convenience XOS_USE_XLIB_LOCKING o=
r
- * XOS_USE_XT_LOCKING may be defined to obtain either Xlib-only or
- * Xt-based versions of these macros.  These macros won't result in
- * truly thread-safe calls, but they are better than nothing.  If yo=
u
- * do not want locking in this situation define XOS_USE_NO_LOCKING.
+ * and _Xos_processUnlock macros before including this header.
+ *
+ * For convenience XOS_USE_XLIB_LOCKING or XOS_USE_XT_LOCKING may be=
 defined
+ * to obtain either Xlib-only or Xt-based versions of these macros. =
 These
+ * macros won't result in truly thread-safe calls, but they are bett=
er than
+ * nothing.  If you do not want locking in this situation define
+ * XOS_USE_NO_LOCKING.
  *
  * NOTE: On systems lacking appropriate _r functions Gethostbyname()=
,
  *=09Gethostbyaddr(), and Getservbyname() do NOT copy the host or
@@ -195,20 +192,11 @@ extern void XtProcessUnlock(
  * uses the older SVR4 thread-safe functions unless the POSIX ones
  * are specifically requested.  Fix the feature test macro.
  */
-#if defined(sun) && defined(_POSIX_THREAD_SAFE_FUNCTIONS) && \
+#if defined(__sun) && defined(_POSIX_THREAD_SAFE_FUNCTIONS) && \
 =09(_POSIX_C_SOURCE - 0 < 199506L) && !defined(_POSIX_PTHREAD_SEMANT=
ICS)
 # undef _POSIX_THREAD_SAFE_FUNCTIONS
 #endif
=20
-/*
- * LynxOS 3.1 defines _POSIX_THREAD_SAFE_FUNCTIONS but
- * getpwuid_r has different semantics than defined by POSIX
- */
-#if defined(Lynx) && defined(_POSIX_THREAD_SAFE_FUNCTIONS)
-# undef _POSIX_THREAD_SAFE_FUNCTIONS
-#endif
-
-
 /***** <pwd.h> wrappers *****/
=20
 /*
@@ -237,7 +225,7 @@ extern void XtProcessUnlock(
=20
 #elif !defined(XTHREADS) && !defined(X_FORCE_USE_MTSAFE_API)
 /* Use regular, unsafe API. */
-# if defined(X_NOT_POSIX) && !defined(i386) && !defined(SYSV)
+# if defined(X_NOT_POSIX) && !defined(__i386__) && !defined(SYSV)
 extern struct passwd *getpwuid(), *getpwnam();
 # endif
 typedef int _Xgetpwparams;=09/* dummy */
@@ -331,24 +319,16 @@ static __inline__ void _Xpw_copyPasswd(_Xgetpwp=
arams p)
   (p).pwp )
=20
 #elif !defined(_POSIX_THREAD_SAFE_FUNCTIONS) && !defined(__APPLE__)
-/* SVR4 threads, AIX 4.2.0 and earlier and OSF/1 3.2 and earlier pth=
reads */
 # define X_NEEDS_PWPARAMS
 typedef struct {
   struct passwd pws;
   char pwbuf[X_LINE_MAX];
 } _Xgetpwparams;
-# if defined(_POSIX_REENTRANT_FUNCTIONS) || !defined(SVR4) || define=
d(Lynx)
-#  ifndef Lynx
+# if defined(_POSIX_REENTRANT_FUNCTIONS) || !defined(SVR4)
 #   define _XGetpwuid(u,p) \
 ((getpwuid_r((u),&(p).pws,(p).pwbuf,sizeof((p).pwbuf)) =3D=3D -1) ? =
NULL : &(p).pws)
 #   define _XGetpwnam(u,p) \
 ((getpwnam_r((u),&(p).pws,(p).pwbuf,sizeof((p).pwbuf)) =3D=3D -1) ? =
NULL : &(p).pws)
-#  else /* Lynx */
-#   define _XGetpwuid(u,p) \
-((getpwuid_r(&(p).pws,(u),(p).pwbuf,sizeof((p).pwbuf)) =3D=3D -1) ? =
NULL : &(p).pws)
-#   define _XGetpwnam(u,p) \
-((getpwnam_r(&(p).pws,(u),(p).pwbuf,sizeof((p).pwbuf)) =3D=3D -1) ? =
NULL : &(p).pws)
-#  endif
 # else /* SVR4 */
 #  define _XGetpwuid(u,p) \
 ((getpwuid_r((u),&(p).pws,(p).pwbuf,sizeof((p).pwbuf)) =3D=3D NULL) =
? NULL : &(p).pws)
@@ -357,12 +337,6 @@ typedef struct {
 # endif /* SVR4 */
=20
 #else /* _POSIX_THREAD_SAFE_FUNCTIONS */
-/* Digital UNIX 4.0, but not (beta) T4.0-1 */
-# if defined(__osf__)
-/* OSF/1 V4.0 <pwd.h> doesn't declare the _P routines, breaking unde=
r C++. */
-extern int _Pgetpwuid_r(uid_t, struct passwd *, char *, size_t, stru=
ct passwd **);
-extern int _Pgetpwnam_r(const char *, struct passwd *, char *, size_=
t, struct passwd **);
-# endif
 # define X_NEEDS_PWPARAMS
 typedef struct {
   struct passwd pws;
@@ -427,7 +401,6 @@ typedef int _Xgetservbynameparams; /* dummy */
 # define _XGetservbyname(s,p,sp)=09getservbyname((s),(p))
=20
 #elif !defined(XOS_USE_MTSAFE_NETDBAPI) || defined(XNO_MTSAFE_NETDBA=
PI)
-/* UnixWare 2.0, or other systems with thread support but no _r API.=
 */
 /* WARNING:  The h_addr_list and s_aliases values are *not* copied! =
*/
=20
 #if defined(__NetBSD__) || defined(__FreeBSD__) || defined(__DragonF=
ly__)
@@ -485,9 +458,6 @@ typedef struct {
  */
 # ifdef _POSIX_REENTRANT_FUNCTIONS
 #  ifndef _POSIX_THREAD_SAFE_FUNCTIONS
-#   if defined(AIXV3) || defined(AIXV4) || defined(__osf__)
-#    define X_POSIX_THREAD_SAFE_FUNCTIONS 1
-#   endif
 #  endif
 # endif
 # ifdef _POSIX_THREAD_SAFE_FUNCTIONS
@@ -565,7 +535,7 @@ typedef int _Xgetservbynameparams; /* dummy */
=20
 #if defined(X_INCLUDE_DIRENT_H) && !defined(_XOS_INCLUDED_DIRENT_H)
 # include <sys/types.h>
-# if !defined(X_NOT_POSIX) || defined(SYSV) || defined(USG)
+# if !defined(X_NOT_POSIX) || defined(SYSV)
 #  include <dirent.h>
 # else
 #  include <sys/dir.h>
@@ -622,32 +592,10 @@ typedef struct {
 # endif
 } _Xreaddirparams;
=20
-# if defined(_POSIX_THREAD_SAFE_FUNCTIONS) || defined(AIXV3) || \
-     defined(AIXV4) || defined(__APPLE__)
-/* AIX defines the draft POSIX symbol, but uses the final API. */
+# if defined(_POSIX_THREAD_SAFE_FUNCTIONS) || defined(__APPLE__)
 /* POSIX final API, returns (int)0 on success. */
-#  if defined(__osf__)
-/* OSF/1 V4.0 <dirent.h> doesn't declare _Preaddir_r, breaking under=
 C++. */
-extern int _Preaddir_r(DIR *, struct dirent *, struct dirent **);
-#  endif
 #  define _XReaddir(d,p)=09=09=09=09=09=09\
     (readdir_r((d), &((p).dir_entry), &((p).result)) ? NULL : (p).re=
sult)
-# elif defined(_POSIX_REENTRANT_FUNCTIONS) && defined(__osf__)
-/*
- * OSF/1 V3.2 readdir_r() will SEGV if the main program is not
- * explicitly linked with -lc_r.  The library REQUIREDLIBS don't hel=
p.
- * Assume that if threads have been initialized we're linked properl=
y.
- */
-#  define _XReaddir(d,p)=09=09=09=09=09=09\
- ( (_Xos_isThreadInitialized) ?=09=09=09=09=09=09\
-   (readdir_r((d), &((p).dir_entry)) ? NULL : &((p).dir_entry)) :=
=09\
-   ((_Xos_processLock),=09=09=09=09=09=09=09\
-    (((p).result =3D readdir((d))) ?=09=09=09=09=09\
-     (memcpy(&((p).dir_entry), (p).result, (p).result->d_reclen),=
=09\
-      ((p).result =3D &(p).dir_entry), 0) :=09=09=09=09\
-     0),=09=09=09=09=09=09=09=09\
-    (_Xos_processUnlock),=09=09=09=09=09=09\
-    (p).result) )
 # elif defined(_POSIX_REENTRANT_FUNCTIONS)
 /* POSIX draft API, returns (int)0 on success. */
 #  define _XReaddir(d,p)=09\
@@ -945,8 +893,8 @@ typedef struct {
    (_Xos_processUnlock), \
    (p).result )
=20
-#elif !defined(_POSIX_THREAD_SAFE_FUNCTIONS) && (defined(__osf__) ||=
 defined(hpV4))
-/* Returns (int)0 on success.  OSF/1 v3.2, HP/UX 10
+#elif !defined(_POSIX_THREAD_SAFE_FUNCTIONS) &&  defined(hpV4)
+/* Returns (int)0 on success.
  *
  * extern int asctime_r(const struct tm *timeptr, char *buffer, int =
buflen);
  * extern int ctime_r(const time_t *timer, char *buffer, int buflen)=
;
@@ -967,7 +915,7 @@ typedef struct tm _Xltimeparams;
 # define _XGmtime(t,p)=09=09(gmtime_r((t),&(p)) ? NULL : &(p))
 # define _XLocaltime(t,p)=09(localtime_r((t),&(p)) ? NULL : &(p))
=20
-#elif !defined(_POSIX_THREAD_SAFE_FUNCTIONS) && defined(sun)
+#elif !defined(_POSIX_THREAD_SAFE_FUNCTIONS) && defined(__sun)
 /* Returns NULL on failure.  Solaris 2.5
  *
  * extern char *asctime_r(const struct tm *tm,char *buf, int buflen)=
;
@@ -990,19 +938,12 @@ typedef struct tm _Xltimeparams;
 # define _XLocaltime(t,p)=09localtime_r((t),&(p))
=20
 #else /* defined(_POSIX_THREAD_SAFE_FUNCTIONS) */
-/* POSIX final API.  OSF/1 v4.0, AIX, etc.
- *
+/* POSIX final API.
  * extern char *asctime_r(const struct tm *timeptr, char *buffer);
  * extern char *ctime_r(const time_t *timer, char *buffer);
  * extern struct tm *gmtime_r(const time_t *timer, struct tm *result=
);
  * extern struct tm *localtime_r(const time_t *timer, struct tm *res=
ult);
  */
-# if defined(__osf__)
-/* OSF/1 V4.0 <time.h> doesn't declare the _P routines, breaking und=
er C++. */
-extern char *_Pasctime_r(const struct tm *, char *);
-extern char *_Pctime_r(const time_t *, char *);
-extern struct tm *_Plocaltime_r(const time_t *, struct tm *);
-# endif
 # ifdef TIMELEN
 typedef char _Xatimeparams[TIMELEN];
 typedef char _Xctimeparams[TIMELEN];
@@ -1097,8 +1038,8 @@ typedef struct {
    (_Xos_processUnlock), \
    (p).pgrp )
=20
-#elif !defined(_POSIX_THREAD_SAFE_FUNCTIONS) && (defined(sun) || def=
ined(__osf__))
-/* Non-POSIX API.  Solaris, DEC v3.2.
+#elif !defined(_POSIX_THREAD_SAFE_FUNCTIONS) && defined(__sun)
+/* Non-POSIX API.  Solaris.
  *
  * extern struct group *getgrgid_r(gid_t, struct group *, char *, in=
t);
  * extern struct group *getgrnam_r(const char *, struct group *, cha=
r *, int);
@@ -1111,8 +1052,7 @@ typedef struct {
 #define _XGetgrnam(n,p)=09getgrnam_r((n), &(p).grp, (p).buf, sizeof(=
(p).buf))
=20
 #elif !defined(_POSIX_THREAD_SAFE_FUNCTIONS)
-/* Non-POSIX API.  HP/UX 10, AIX 4.
- *
+/* Non-POSIX API.
  * extern int getgrgid_r(gid_t, struct group *, char *, int);
  * extern int getgrnam_r(const char *, struct group *, char *, int);
  */
@@ -1126,16 +1066,11 @@ typedef struct {
  ((getgrnam_r((n), &(p).grp, (p).buf, sizeof((p).buf)) ? NULL : &(p)=
.grp))
=20
 #else
-/* POSIX final API.  DEC v4.0, IRIX 6.2.
+/* POSIX final API.
  *
  * int getgrgid_r(gid_t, struct group *, char *, size_t, struct grou=
p **);
  * int getgrnam_r(const char *, struct group *, char *, size_t, stru=
ct group **);
  */
-# if defined(__osf__)
-/* OSF/1 V4.0 <grp.h> doesn't declare the _P routines, breaking unde=
r C++. */
-extern int _Pgetgrgid_r(gid_t, struct group *, char *, size_t, struc=
t group **);
-extern int _Pgetgrnam_r(const char *, struct group *, char *, size_t=
, struct group **);
-# endif
 typedef struct {
   struct group grp;
   char buf[X_LINE_MAX];=09/* Should be sysconf(_SC_GETGR_R_SIZE_MAX)=
? */
diff --git a/recipes/xorg-lib/xorg-headers-native/X11/Xosdefs.h b/rec=
ipes/xorg-lib/xorg-headers-native/X11/Xosdefs.h
index d6c7682..33eaee4 100644
--- a/recipes/xorg-lib/xorg-headers-native/X11/Xosdefs.h
+++ b/recipes/xorg-lib/xorg-headers-native/X11/Xosdefs.h
@@ -1,9 +1,6 @@
 /*
  * O/S-dependent (mis)feature macro definitions
  *
- * $XdotOrg: proto/X11/Xosdefs.h,v 1.7 2005/11/08 06:33:25 jkj Exp $
- * $Xorg: Xosdefs.h,v 1.5 2001/02/09 02:03:23 xorgcvs Exp $
- *
 Copyright 1991, 1998  The Open Group
=20
 Permission to use, copy, modify, distribute, and sell this software =
and its
@@ -26,141 +23,94 @@ Except as contained in this notice, the name of =
The Open Group shall not be
 used in advertising or otherwise to promote the sale, use or other d=
ealings
 in this Software without prior written authorization from The Open G=
roup.
  */
-/* $XFree86: xc/include/Xosdefs.h,v 3.20 2002/05/31 18:45:39 dawes E=
xp $ */
=20
 #ifndef _XOSDEFS_H_
-#define _XOSDEFS_H_
+# define _XOSDEFS_H_
=20
 /*
- * X_NOT_STDC_ENV means does not have ANSI C header files.  Lack of =
this
- * symbol does NOT mean that the system has stdarg.h.
- *
  * X_NOT_POSIX means does not have POSIX header files.  Lack of this
  * symbol does NOT mean that the POSIX environment is the default.
  * You may still have to define _POSIX_SOURCE to get it.
  */
=20
-#ifdef NOSTDHDRS
-#define X_NOT_POSIX
-#define X_NOT_STDC_ENV
-#endif
-
-#ifdef sony
-#if !defined(SYSTYPE_SYSV) && !defined(_SYSTYPE_SYSV)
-#define X_NOT_POSIX
-#endif
-#endif
-
-#ifdef UTEK
-#define X_NOT_POSIX
-#define X_NOT_STDC_ENV
-#endif
-
-#ifdef vax
-#ifndef ultrix=09=09=09/* assume vanilla BSD */
-#define X_NOT_POSIX
-#define X_NOT_STDC_ENV
-#endif
-#endif
-
-#ifdef luna
-#define X_NOT_POSIX
-#define X_NOT_STDC_ENV
-#endif
-
-#ifdef Mips
-#define X_NOT_POSIX
-#define X_NOT_STDC_ENV
-#endif
- =20
-#ifdef USL
-#ifdef SYSV /* (release 3.2) */
-#define X_NOT_POSIX
-#define X_NOT_STDC_ENV
-#endif
-#endif
-
-#ifdef _SCO_DS
-#ifndef __SCO__
-#define __SCO__
-#endif
-#endif
-
-#ifdef i386
-#ifdef SYSV
-#if !defined(ISC) && !defined(__SCO__) && !defined(_SEQUENT_) && \
-=09!defined(__UNIXWARE__) && !defined(sun)
-#if !defined(_POSIX_SOURCE)
-#define X_NOT_POSIX
-#endif
-#define X_NOT_STDC_ENV
-#endif
-#endif
-#endif
-
-#ifdef MOTOROLA
-#ifdef SYSV
-#define X_NOT_STDC_ENV
-#endif
-#endif
-
-#ifdef sun
+
+# ifdef _SCO_DS
+#  ifndef __SCO__
+#   define __SCO__
+#  endif
+# endif
+
+# ifdef __i386__
+#  ifdef SYSV
+#   if !defined(__SCO__) && \
+=09!defined(__UNIXWARE__) && !defined(__sun)
+#    if !defined(_POSIX_SOURCE)
+#     define X_NOT_POSIX
+#    endif
+#   endif
+#  endif
+# endif
+
+# ifdef __sun
 /* Imake configs define SVR4 on Solaris, but cc & gcc only define __=
SVR4
  * This check allows non-Imake configured programs to build correctl=
y.
  */
-#if defined(__SVR4) && !defined(SVR4)
-#define SVR4 1
-#endif
-#ifdef SVR4
+#  if defined(__SVR4) && !defined(SVR4)
+#   define SVR4 1
+#  endif
+#  ifdef SVR4
 /* define this to whatever it needs to be */
-#define X_POSIX_C_SOURCE 199300L
-#endif
-#endif
-
-#ifdef WIN32
-#ifndef _POSIX_
-#define X_NOT_POSIX
-#endif
-#endif
-
-#if defined(nec_ews_svr2) || defined(SX) || defined(PC_UX)
-#define X_NOT_POSIX
-#define X_NOT_STDC_ENV
-#endif
-
-#ifdef __UNIXOS2__
-#define USGISH
-#define NULL_NOT_ZERO
-#endif
-
-#ifdef __DARWIN__
-#define NULL_NOT_ZERO
-#endif
-
-#ifdef __GNU__
-#ifndef PATH_MAX
-#define PATH_MAX 4096
-#endif
-#ifndef MAXPATHLEN
-#define MAXPATHLEN 4096
-#endif
-#endif
-
-#if defined(__SCO__) || defined(__UNIXWARE__)
-# ifndef PATH_MAX
-#  define PATH_MAX=091024
+#   define X_POSIX_C_SOURCE 199300L
+#  endif
+# endif
+
+# ifdef WIN32
+#  ifndef _POSIX_
+#   define X_NOT_POSIX
+#  endif
 # endif
-# ifndef MAXPATHLEN
-#  define MAXPATHLEN=091024
+
+
+# ifdef __APPLE__
+#  define NULL_NOT_ZERO
+
+/* Defining any of these will sanitize the namespace to JUST want is=
 defined by
+ * that particular standard.  If that happens, we don't get some exp=
ected
+ * prototypes, typedefs, etc (like fd_mask).  We can define _DARWIN_=
C_SOURCE to
+ * loosen our belts a tad.
+ */
+#  if defined(_XOPEN_SOURCE) || defined(_POSIX_SOURCE) || defined(_P=
OSIX_C_SOURCE)
+#   ifndef _DARWIN_C_SOURCE
+#    define _DARWIN_C_SOURCE
+#   endif
+#  endif
+
+# endif
+
+# ifdef __GNU__
+#  ifndef PATH_MAX
+#   define PATH_MAX 4096
+#  endif
+#  ifndef MAXPATHLEN
+#   define MAXPATHLEN 4096
+#  endif
+# endif
+
+# if defined(__SCO__) || defined(__UNIXWARE__)
+#  ifndef PATH_MAX
+#   define PATH_MAX=091024
+#  endif
+#  ifndef MAXPATHLEN
+#   define MAXPATHLEN=091024
+#  endif
 # endif
-#endif
=20
-#if defined(__OpenBSD__) || defined(__NetBSD__) || defined(__FreeBSD=
__) \
-=09|| defined(__Darwin__) || defined(__DragonFly__)
-# ifndef CSRG_BASED
-#  define CSRG_BASED
+# if defined(__OpenBSD__) || defined(__NetBSD__) || defined(__FreeBS=
D__) \
+=09|| defined(__APPLE__) || defined(__DragonFly__)
+#  ifndef CSRG_BASED
+#   define CSRG_BASED
+#  endif
 # endif
-#endif
=20
 #endif /* _XOSDEFS_H_ */
=20
diff --git a/recipes/xorg-lib/xorg-headers-native/X11/Xpoll.h b/recip=
es/xorg-lib/xorg-headers-native/X11/Xpoll.h
index e483c21..e96ea12 100644
--- a/recipes/xorg-lib/xorg-headers-native/X11/Xpoll.h
+++ b/recipes/xorg-lib/xorg-headers-native/X11/Xpoll.h
@@ -1,5 +1,3 @@
-/* $Xorg: Xpoll.h,v 1.4 2001/02/09 02:03:23 xorgcvs Exp $ */
-
 /*
=20
 Copyright 1994, 1998  The Open Group
@@ -49,8 +47,6 @@ from The Open Group.
  * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 */
=20
-/* $XFree86: xc/include/Xpoll.h,v 3.8 2001/01/17 17:53:11 dawes Exp =
$ */
-
 #ifndef _XPOLL_H_
 #define _XPOLL_H_
=20
@@ -60,32 +56,7 @@ from The Open Group.
=20
 #include <X11/Xos.h>
=20
-/* Below is the monster branch from hell.  Basically, most systems w=
ill drop to
- * 'the branch below is the fallthrough for halfway modern systems',=
 and include
- * <sys/select.h>, so we get the FD_* macros. */
-#if !defined(DGUX)
-# if (defined(SVR4) || defined(CRAY) || defined(AIXV3)) && !defined(=
FD_SETSIZE)
-#  include <sys/select.h>
-#  ifdef luna
-#   include <sysent.h>
-#  endif
-# else /* not SVR4/CRAY/AIXv3 */
-#  if defined(AIXV4) /* AIX 4.2 fubar-ed <sys/select.h>, so try real=
ly hard. */
-#   if !defined(NFDBITS)
-#    include <sys/select.h>
-#   endif
-#  else /* the branch below is the fallthrough for halfway modern sy=
stems */
-#   ifdef __QNX__  /* Make sure we get 256 bit select masks */
-#    define FD_SETSIZE 256
-#   endif
-#   include <sys/select.h>
-#  endif
-# endif
-#else /* DGUX  -- No sys/select in Intel DG/ux */
-# include <sys/time.h>=20
-# include <sys/types.h>
-# include <unistd.h>
-#endif
+#include <sys/select.h>  /* Get the FD_* macros. */
=20
 #include <X11/Xmd.h>
=20
@@ -114,21 +85,13 @@ typedef long fd_mask;
 #define howmany(x,y)=09(((x)+((y)-1))/(y))
 #endif
=20
-#if defined(BSD) && BSD < 198911 && !defined(luna)
+#if defined(BSD) && BSD < 198911=20
 typedef struct fd_set {
 =09fd_mask fds_bits[howmany(FD_SETSIZE, NFDBITS)];
 } fd_set;
 #endif
=20
-#ifndef hpux /* and perhaps old BSD ??? */
 # define Select(n,r,w,e,t) select(n,(fd_set*)r,(fd_set*)w,(fd_set*)e=
,(struct timeval*)t)
-#else
-# ifndef _XPG4_EXTENDED /* HPUX 9.x and earlier */
-#  define Select(n,r,w,e,t) select(n,(int*)r,(int*)w,(int*)e,(struct=
 timeval*)t)
-# else
-#  define Select(n,r,w,e,t) select(n,(fd_set*)r,(fd_set*)w,(fd_set*)=
e,(struct timeval*)t)
-# endif
-#endif
=20
 #define __X_FDS_BITS __fds_bits
=20
diff --git a/recipes/xorg-lib/xorg-headers-native/X11/Xproto.h b/reci=
pes/xorg-lib/xorg-headers-native/X11/Xproto.h
index e5bba70..495d441 100644
--- a/recipes/xorg-lib/xorg-headers-native/X11/Xproto.h
+++ b/recipes/xorg-lib/xorg-headers-native/X11/Xproto.h
@@ -1,7 +1,3 @@
-/*
- *=09$Xorg: Xproto.h,v 1.4 2001/02/09 02:03:23 xorgcvs Exp $
- */
-
 /* Definitions for the X window system used by server and c bindings=
 */
=20
 /*
@@ -1212,6 +1208,38 @@ typedef struct _xEvent {
     } u;
 } xEvent;
=20
+/*********************************************************
+ *
+ * Generic event
+ *=20
+ * Those events are not part of the core protocol spec and can be us=
ed by
+ * various extensions.
+ * type is always GenericEvent
+ * extension is the minor opcode of the extension the event belongs =
to.
+ * evtype is the actual event type, unique __per extension__.=20
+ *
+ * GenericEvents can be longer than 32 bytes, with the length field
+ * specifying the number of 4 byte blocks after the first 32 bytes.=
=20
+ *
+ *
+ */
+typedef struct=20
+{
+    BYTE    type;
+    CARD8   extension;
+    CARD16  sequenceNumber B16;
+    CARD32  length B32;
+    CARD16  evtype B16;
+    CARD16  pad2 B16;
+    CARD32  pad3 B32;
+    CARD32  pad4 B32;
+    CARD32  pad5 B32;
+    CARD32  pad6 B32;
+    CARD32  pad7 B32;
+} xGenericEvent;
+
+
+
 /* KeymapNotify events are not included in the above union because t=
hey
    are different from all other events: they do not have a "detail"
    or "sequenceNumber", so there is room for a 248-bit key mask. */
diff --git a/recipes/xorg-lib/xorg-headers-native/X11/Xprotostr.h b/r=
ecipes/xorg-lib/xorg-headers-native/X11/Xprotostr.h
index f343d98..a9e854d 100644
--- a/recipes/xorg-lib/xorg-headers-native/X11/Xprotostr.h
+++ b/recipes/xorg-lib/xorg-headers-native/X11/Xprotostr.h
@@ -1,4 +1,3 @@
-/* $Xorg: Xprotostr.h,v 1.4 2001/02/09 02:03:23 xorgcvs Exp $ */
 #ifndef XPROTOSTRUCTS_H
 #define XPROTOSTRUCTS_H
=20
diff --git a/recipes/xorg-lib/xorg-headers-native/X11/Xregion.h b/rec=
ipes/xorg-lib/xorg-headers-native/X11/Xregion.h
index 2ddf12c..7b376e5 100644
--- a/recipes/xorg-lib/xorg-headers-native/X11/Xregion.h
+++ b/recipes/xorg-lib/xorg-headers-native/X11/Xregion.h
@@ -1,4 +1,3 @@
-/* $Xorg: region.h,v 1.4 2001/02/09 02:03:40 xorgcvs Exp $ */
 /*******************************************************************=
*****
=20
 Copyright 1987, 1998  The Open Group
@@ -28,13 +27,13 @@ Copyright 1987 by Digital Equipment Corporation, =
Maynard, Massachusetts.
=20
                         All Rights Reserved
=20
-Permission to use, copy, modify, and distribute this software and it=
s=20
-documentation for any purpose and without fee is hereby granted,=
=20
+Permission to use, copy, modify, and distribute this software and it=
s
+documentation for any purpose and without fee is hereby granted,
 provided that the above copyright notice appear in all copies and th=
at
-both that copyright notice and this permission notice appear in=20
+both that copyright notice and this permission notice appear in
 supporting documentation, and that the name of Digital not be
 used in advertising or publicity pertaining to distribution of the
-software without specific, written prior permission. =20
+software without specific, written prior permission.
=20
 DIGITAL DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE, INCLU=
DING
 ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO EVENT S=
HALL
@@ -69,7 +68,7 @@ typedef struct {
 #endif
=20
=20
-/*=20
+/*
  *   clip region
  */
=20
@@ -80,13 +79,13 @@ typedef struct _XRegion {
     BOX extents;
 } REGION;
=20
-/* Xutil.h contains the declaration:=20
- * typedef struct _XRegion *Region;=20
- */  =20
+/* Xutil.h contains the declaration:
+ * typedef struct _XRegion *Region;
+ */
=20
 /*  1 if two BOXs overlap.
  *  0 if two BOXs do not overlap.
- *  Remember, x2 and y2 are not in the region=20
+ *  Remember, x2 and y2 are not in the region
  */
 #define EXTENTCHECK(r1, r2) \
 =09((r1)->x2 > (r2)->x1 && \
diff --git a/recipes/xorg-lib/xorg-headers-native/X11/Xresource.h b/r=
ecipes/xorg-lib/xorg-headers-native/X11/Xresource.h
index ce12137..dbb144c 100644
--- a/recipes/xorg-lib/xorg-headers-native/X11/Xresource.h
+++ b/recipes/xorg-lib/xorg-headers-native/X11/Xresource.h
@@ -1,4 +1,3 @@
-/* $Xorg: Xresource.h,v 1.7 2001/02/09 02:03:39 xorgcvs Exp $ */
=20
 /***********************************************************
=20
@@ -29,13 +28,13 @@ Copyright 1987, 1988 by Digital Equipment Corpora=
tion, Maynard, Massachusetts.
=20
                         All Rights Reserved
=20
-Permission to use, copy, modify, and distribute this software and it=
s=20
-documentation for any purpose and without fee is hereby granted,=
=20
+Permission to use, copy, modify, and distribute this software and it=
s
+documentation for any purpose and without fee is hereby granted,
 provided that the above copyright notice appear in all copies and th=
at
-both that copyright notice and this permission notice appear in=20
+both that copyright notice and this permission notice appear in
 supporting documentation, and that the name of Digital not be
 used in advertising or publicity pertaining to distribution of the
-software without specific, written prior permission. =20
+software without specific, written prior permission.
=20
 DIGITAL DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE, INCLU=
DING
 ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO EVENT S=
HALL
@@ -46,7 +45,6 @@ ARISING OUT OF OR IN CONNECTION WITH THE USE OR PER=
FORMANCE OF THIS
 SOFTWARE.
=20
 ******************************************************************/
-/* $XFree86: xc/lib/X11/Xresource.h,v 3.8 2001/12/14 19:54:10 dawes =
Exp $ */
=20
 #ifndef _XRESOURCE_H_
 #define _XRESOURCE_H_
@@ -178,7 +176,7 @@ typedef struct _XrmHashBucketRec *XrmDatabase;
=20
=20
 extern void XrmDestroyDatabase(
-    XrmDatabase=09=09/* database */   =20
+    XrmDatabase=09=09/* database */
 );
=20
 extern void XrmQPutResource(
@@ -333,7 +331,7 @@ typedef enum {
     XrmoptionResArg,=09/* Resource and value in next argument in arg=
v      */
     XrmoptionSkipArg,   /* Ignore this option and the next argument =
in argv */
     XrmoptionSkipLine,  /* Ignore this option and the rest of argv=
=09    */
-    XrmoptionSkipNArgs=09/* Ignore this option and the next=20
+    XrmoptionSkipNArgs=09/* Ignore this option and the next
 =09=09=09   OptionDescRes.value arguments in argv */
 } XrmOptionKind;
=20
@@ -351,7 +349,7 @@ extern void XrmParseCommand(
     int=09=09=09/* table_count */,
     _Xconst char*=09/* name */,
     int*=09=09/* argc_in_out */,
-    char**=09=09/* argv_in_out */=09=09    =20
+    char**=09=09/* argv_in_out */
 );
=20
 _XFUNCPROTOEND
diff --git a/recipes/xorg-lib/xorg-headers-native/X11/Xthreads.h b/re=
cipes/xorg-lib/xorg-headers-native/X11/Xthreads.h
index 54b5440..3d44208 100644
--- a/recipes/xorg-lib/xorg-headers-native/X11/Xthreads.h
+++ b/recipes/xorg-lib/xorg-headers-native/X11/Xthreads.h
@@ -1,7 +1,5 @@
 /*
- * $Xorg: Xthreads.h,v 1.5 2001/02/09 02:03:23 xorgcvs Exp $
  *
- *=20
 Copyright 1993, 1998  The Open Group
=20
 Permission to use, copy, modify, distribute, and sell this software =
and its
@@ -25,80 +23,79 @@ used in advertising or otherwise to promote the s=
ale, use or other dealings
 in this Software without prior written authorization from The Open G=
roup.
  * *
  */
-/* $XFree86: Xthreads.h,v 3.10 2001/12/14 19:53:26 dawes Exp $ */
=20
 #ifndef _XTHREADS_H_
-#define _XTHREADS_H_
+# define _XTHREADS_H_
=20
 /* Redefine these to XtMalloc/XtFree or whatever you want before inc=
luding
  * this header file.
  */
-#ifndef xmalloc
-#define xmalloc malloc
-#endif
-#ifndef xfree
-#define xfree free
-#endif
+# ifndef xmalloc
+#  define xmalloc malloc
+# endif
+# ifndef xfree
+#  define xfree free
+# endif
=20
-#ifdef CTHREADS
-#include <cthreads.h>
+# ifdef CTHREADS
+#  include <cthreads.h>
 typedef cthread_t xthread_t;
 typedef struct condition xcondition_rec;
 typedef struct mutex xmutex_rec;
-#define xthread_init() cthread_init()
-#define xthread_self cthread_self
-#define xthread_fork(func,closure) cthread_fork(func,closure)
-#define xthread_yield() cthread_yield()
-#define xthread_exit(v) cthread_exit(v)
-#define xthread_set_name(t,str) cthread_set_name(t,str)
-#define xmutex_init(m) mutex_init(m)
-#define xmutex_clear(m) mutex_clear(m)
-#define xmutex_lock(m) mutex_lock(m)
-#define xmutex_unlock(m) mutex_unlock(m)
-#define xmutex_set_name(m,str) mutex_set_name(m,str)
-#define xcondition_init(cv) condition_init(cv)
-#define xcondition_clear(cv) condition_clear(cv)
-#define xcondition_wait(cv,m) condition_wait(cv,m)
-#define xcondition_signal(cv) condition_signal(cv)
-#define xcondition_broadcast(cv) condition_broadcast(cv)
-#define xcondition_set_name(cv,str) condition_set_name(cv,str)
-#else /* !CTHREADS */
-#if defined(SVR4) && !defined(__sgi) && !defined(_SEQUENT_)
-#include <thread.h>
-#include <synch.h>
+#  define xthread_init() cthread_init()
+#  define xthread_self cthread_self
+#  define xthread_fork(func,closure) cthread_fork(func,closure)
+#  define xthread_yield() cthread_yield()
+#  define xthread_exit(v) cthread_exit(v)
+#  define xthread_set_name(t,str) cthread_set_name(t,str)
+#  define xmutex_init(m) mutex_init(m)
+#  define xmutex_clear(m) mutex_clear(m)
+#  define xmutex_lock(m) mutex_lock(m)
+#  define xmutex_unlock(m) mutex_unlock(m)
+#  define xmutex_set_name(m,str) mutex_set_name(m,str)
+#  define xcondition_init(cv) condition_init(cv)
+#  define xcondition_clear(cv) condition_clear(cv)
+#  define xcondition_wait(cv,m) condition_wait(cv,m)
+#  define xcondition_signal(cv) condition_signal(cv)
+#  define xcondition_broadcast(cv) condition_broadcast(cv)
+#  define xcondition_set_name(cv,str) condition_set_name(cv,str)
+# else /* !CTHREADS */
+#  if defined(SVR4)
+#   include <thread.h>
+#   include <synch.h>
 typedef thread_t xthread_t;
 typedef thread_key_t xthread_key_t;
 typedef cond_t xcondition_rec;
 typedef mutex_t xmutex_rec;
-#if defined(__UNIXWARE__)
+#   if defined(__UNIXWARE__)
 extern xthread_t (*_x11_thr_self)();
-#define xthread_self  (_x11_thr_self)
-#else
-#define xthread_self thr_self
-#endif
-#define xthread_fork(func,closure) thr_create(NULL,0,func,closure,TH=
R_NEW_LWP|THR_DETACHED,NULL)
-#define xthread_yield() thr_yield()
-#define xthread_exit(v) thr_exit(v)
-#define xthread_key_create(kp,d) thr_keycreate(kp,d)
-#ifdef sun
-#define xthread_key_delete(k) 0
-#else
-#define xthread_key_delete(k) thr_keydelete(k)
-#endif
-#define xthread_set_specific(k,v) thr_setspecific(k,v)
-#define xthread_get_specific(k,vp) thr_getspecific(k,vp)
-#define xmutex_init(m) mutex_init(m,USYNC_THREAD,0)
-#define xmutex_clear(m) mutex_destroy(m)
-#define xmutex_lock(m) mutex_lock(m)
-#define xmutex_unlock(m) mutex_unlock(m)
-#define xcondition_init(cv) cond_init(cv,USYNC_THREAD,0)
-#define xcondition_clear(cv) cond_destroy(cv)
-#define xcondition_wait(cv,m) cond_wait(cv,m)
-#define xcondition_signal(cv) cond_signal(cv)
-#define xcondition_broadcast(cv) cond_broadcast(cv)
-#else /* !SVR4 */
-#ifdef WIN32
-#include <X11/Xwindows.h>
+#    define xthread_self  (_x11_thr_self)
+#   else
+#    define xthread_self thr_self
+#   endif
+#   define xthread_fork(func,closure) thr_create(NULL,0,func,closure=
,THR_NEW_LWP|THR_DETACHED,NULL)
+#   define xthread_yield() thr_yield()
+#   define xthread_exit(v) thr_exit(v)
+#   define xthread_key_create(kp,d) thr_keycreate(kp,d)
+#   ifdef __sun
+#    define xthread_key_delete(k) 0
+#   else
+#    define xthread_key_delete(k) thr_keydelete(k)
+#   endif
+#   define xthread_set_specific(k,v) thr_setspecific(k,v)
+#   define xthread_get_specific(k,vp) thr_getspecific(k,vp)
+#   define xmutex_init(m) mutex_init(m,USYNC_THREAD,0)
+#   define xmutex_clear(m) mutex_destroy(m)
+#   define xmutex_lock(m) mutex_lock(m)
+#   define xmutex_unlock(m) mutex_unlock(m)
+#   define xcondition_init(cv) cond_init(cv,USYNC_THREAD,0)
+#   define xcondition_clear(cv) cond_destroy(cv)
+#   define xcondition_wait(cv,m) cond_wait(cv,m)
+#   define xcondition_signal(cv) cond_signal(cv)
+#   define xcondition_broadcast(cv) cond_broadcast(cv)
+#  else /* !SVR4 */
+#   ifdef WIN32
+#    include <X11/Xwindows.h>
 typedef DWORD xthread_t;
 typedef DWORD xthread_key_t;
 struct _xthread_waiter {
@@ -110,31 +107,31 @@ typedef struct {
     struct _xthread_waiter *waiters;
 } xcondition_rec;
 typedef CRITICAL_SECTION xmutex_rec;
-#define xthread_init() _Xthread_init()
-#define xthread_self GetCurrentThreadId
-#define xthread_fork(func,closure) { \
+#    define xthread_init() _Xthread_init()
+#    define xthread_self GetCurrentThreadId
+#    define xthread_fork(func,closure) { \
     DWORD _tmptid; \
     CreateThread(NULL, 0, (LPTHREAD_START_ROUTINE)func, (LPVOID)clos=
ure, 0, \
 =09=09 &_tmptid); \
 }
-#define xthread_yield() Sleep(0)
-#define xthread_exit(v) ExitThread((DWORD)(v))
-#define xthread_key_create(kp,d) *(kp) =3D TlsAlloc()
-#define xthread_key_delete(k) TlsFree(k)
-#define xthread_set_specific(k,v) TlsSetValue(k,v)
-#define xthread_get_specific(k,vp) TlsGetValue(k)
-#define xmutex_init(m) InitializeCriticalSection(m)
-#define xmutex_clear(m) DeleteCriticalSection(m)
-#define _XMUTEX_NESTS
-#define xmutex_lock(m) EnterCriticalSection(m)
-#define xmutex_unlock(m) LeaveCriticalSection(m)
-#define xcondition_init(cv) { \
+#    define xthread_yield() Sleep(0)
+#    define xthread_exit(v) ExitThread((DWORD)(v))
+#    define xthread_key_create(kp,d) *(kp) =3D TlsAlloc()
+#    define xthread_key_delete(k) TlsFree(k)
+#    define xthread_set_specific(k,v) TlsSetValue(k,v)
+#    define xthread_get_specific(k,vp) TlsGetValue(k)
+#    define xmutex_init(m) InitializeCriticalSection(m)
+#    define xmutex_clear(m) DeleteCriticalSection(m)
+#    define _XMUTEX_NESTS
+#    define xmutex_lock(m) EnterCriticalSection(m)
+#    define xmutex_unlock(m) LeaveCriticalSection(m)
+#    define xcondition_init(cv) { \
     InitializeCriticalSection(&(cv)->cs); \
     (cv)->waiters =3D NULL; \
 }
-#define xcondition_clear(cv) DeleteCriticalSection(&(cv)->cs)
+#    define xcondition_clear(cv) DeleteCriticalSection(&(cv)->cs)
 extern struct _xthread_waiter *_Xthread_waiter();
-#define xcondition_wait(cv,m) { \
+#    define xcondition_wait(cv,m) { \
     struct _xthread_waiter *_tmpthr =3D _Xthread_waiter(); \
     EnterCriticalSection(&(cv)->cs); \
     _tmpthr->next =3D (cv)->waiters; \
@@ -144,7 +141,7 @@ extern struct _xthread_waiter *_Xthread_waiter();
     WaitForSingleObject(_tmpthr->sem, INFINITE); \
     EnterCriticalSection(m); \
 }
-#define xcondition_signal(cv) { \
+#    define xcondition_signal(cv) { \
     EnterCriticalSection(&(cv)->cs); \
     if ((cv)->waiters) { \
         ReleaseSemaphore((cv)->waiters->sem, 1, NULL); \
@@ -152,7 +149,7 @@ extern struct _xthread_waiter *_Xthread_waiter();
     } \
     LeaveCriticalSection(&(cv)->cs); \
 }
-#define xcondition_broadcast(cv) { \
+#    define xcondition_broadcast(cv) { \
     struct _xthread_waiter *_tmpthr; \
     EnterCriticalSection(&(cv)->cs); \
     for (_tmpthr =3D (cv)->waiters; _tmpthr; _tmpthr =3D _tmpthr->ne=
xt) \
@@ -160,157 +157,157 @@ extern struct _xthread_waiter *_Xthread_waite=
r();
     (cv)->waiters =3D NULL; \
     LeaveCriticalSection(&(cv)->cs); \
 }
-#else /* !WIN32 */
-#ifdef USE_TIS_SUPPORT
+#   else /* !WIN32 */
+#    ifdef USE_TIS_SUPPORT
 /*
  * TIS support is intended for thread safe libraries.
  * This should not be used for general client programming.
  */
-#include <tis.h>
+#     include <tis.h>
 typedef pthread_t xthread_t;
 typedef pthread_key_t xthread_key_t;
 typedef pthread_cond_t xcondition_rec;
 typedef pthread_mutex_t xmutex_rec;
-#define xthread_self tis_self
-#define xthread_fork(func,closure) { pthread_t _tmpxthr; \
+#     define xthread_self tis_self
+#     define xthread_fork(func,closure) { pthread_t _tmpxthr; \
         pthread_create(&_tmpxthr,NULL,func,closure); }
-#define xthread_yield() pthread_yield_np()
-#define xthread_exit(v) pthread_exit(v)
-#define xthread_key_create(kp,d) tis_key_create(kp,d)
-#define xthread_key_delete(k) tis_key_delete(k)
-#define xthread_set_specific(k,v) tis_setspecific(k,v)
-#define xthread_get_specific(k,vp) *(vp) =3D tis_getspecific(k)
-#define XMUTEX_INITIALIZER PTHREAD_MUTEX_INITIALIZER
-#define xmutex_init(m) tis_mutex_init(m)
-#define xmutex_clear(m) tis_mutex_destroy(m)
-#define xmutex_lock(m) tis_mutex_lock(m)
-#define xmutex_unlock(m) tis_mutex_unlock(m)
-#define xcondition_init(c) tis_cond_init(c)
-#define xcondition_clear(c) tis_cond_destroy(c)
-#define xcondition_wait(c,m) tis_cond_wait(c,m)
-#define xcondition_signal(c) tis_cond_signal(c)
-#define xcondition_broadcast(c) tis_cond_broadcast(c)
-#else
-#ifdef USE_NBSD_THREADLIB
+#     define xthread_yield() pthread_yield_np()
+#     define xthread_exit(v) pthread_exit(v)
+#     define xthread_key_create(kp,d) tis_key_create(kp,d)
+#     define xthread_key_delete(k) tis_key_delete(k)
+#     define xthread_set_specific(k,v) tis_setspecific(k,v)
+#     define xthread_get_specific(k,vp) *(vp) =3D tis_getspecific(k)
+#     define XMUTEX_INITIALIZER PTHREAD_MUTEX_INITIALIZER
+#     define xmutex_init(m) tis_mutex_init(m)
+#     define xmutex_clear(m) tis_mutex_destroy(m)
+#     define xmutex_lock(m) tis_mutex_lock(m)
+#     define xmutex_unlock(m) tis_mutex_unlock(m)
+#     define xcondition_init(c) tis_cond_init(c)
+#     define xcondition_clear(c) tis_cond_destroy(c)
+#     define xcondition_wait(c,m) tis_cond_wait(c,m)
+#     define xcondition_signal(c) tis_cond_signal(c)
+#     define xcondition_broadcast(c) tis_cond_broadcast(c)
+#    else
+#     ifdef USE_NBSD_THREADLIB
 /*
  * NetBSD threadlib support is intended for thread safe libraries.
  * This should not be used for general client programming.
  */
-#include <threadlib.h>
+#      include <threadlib.h>
 typedef thr_t xthread_t;
 typedef thread_key_t xthread_key_t;
 typedef cond_t xcondition_rec;
 typedef mutex_t xmutex_rec;
-#define xthread_self thr_self
-#define xthread_fork(func,closure) { thr_t _tmpxthr; \
+#      define xthread_self thr_self
+#      define xthread_fork(func,closure) { thr_t _tmpxthr; \
 =09/* XXX Create it detached?  --thorpej */ \
 =09thr_create(&_tmpxthr,NULL,func,closure); }
-#define xthread_yield() thr_yield()
-#define xthread_exit(v) thr_exit(v)
-#define xthread_key_create(kp,d) thr_keycreate(kp,d)
-#define xthread_key_delete(k) thr_keydelete(k)
-#define xthread_set_specific(k,v) thr_setspecific(k,v)
-#define xthread_get_specific(k,vp) *(vp) =3D thr_getspecific(k)
-#define XMUTEX_INITIALIZER MUTEX_INITIALIZER
-#define xmutex_init(m) mutex_init(m, 0)
-#define xmutex_clear(m) mutex_destroy(m)
-#define xmutex_lock(m) mutex_lock(m)
-#define xmutex_unlock(m) mutex_unlock(m)
-#define xcondition_init(c) cond_init(c, 0, 0)
-#define xcondition_clear(c) cond_destroy(c)
-#define xcondition_wait(c,m) cond_wait(c,m)
-#define xcondition_signal(c) cond_signal(c)
-#define xcondition_broadcast(c) cond_broadcast(c)
-#else
-#include <pthread.h>
+#      define xthread_yield() thr_yield()
+#      define xthread_exit(v) thr_exit(v)
+#      define xthread_key_create(kp,d) thr_keycreate(kp,d)
+#      define xthread_key_delete(k) thr_keydelete(k)
+#      define xthread_set_specific(k,v) thr_setspecific(k,v)
+#      define xthread_get_specific(k,vp) *(vp) =3D thr_getspecific(k=
)
+#      define XMUTEX_INITIALIZER MUTEX_INITIALIZER
+#      define xmutex_init(m) mutex_init(m, 0)
+#      define xmutex_clear(m) mutex_destroy(m)
+#      define xmutex_lock(m) mutex_lock(m)
+#      define xmutex_unlock(m) mutex_unlock(m)
+#      define xcondition_init(c) cond_init(c, 0, 0)
+#      define xcondition_clear(c) cond_destroy(c)
+#      define xcondition_wait(c,m) cond_wait(c,m)
+#      define xcondition_signal(c) cond_signal(c)
+#      define xcondition_broadcast(c) cond_broadcast(c)
+#     else
+#      include <pthread.h>
 typedef pthread_t xthread_t;
 typedef pthread_key_t xthread_key_t;
 typedef pthread_cond_t xcondition_rec;
 typedef pthread_mutex_t xmutex_rec;
-#define xthread_self pthread_self
-#define xthread_yield() pthread_yield()
-#define xthread_exit(v) pthread_exit(v)
-#define xthread_set_specific(k,v) pthread_setspecific(k,v)
-#define xmutex_clear(m) pthread_mutex_destroy(m)
-#define xmutex_lock(m) pthread_mutex_lock(m)
-#define xmutex_unlock(m) pthread_mutex_unlock(m)
-#ifndef XPRE_STANDARD_API
-#define xthread_key_create(kp,d) pthread_key_create(kp,d)
-#define xthread_key_delete(k) pthread_key_delete(k)
-#define xthread_get_specific(k,vp) *(vp) =3D pthread_getspecific(k)
-#define xthread_fork(func,closure) { pthread_t _tmpxthr; \
+#      define xthread_self pthread_self
+#      define xthread_yield() pthread_yield()
+#      define xthread_exit(v) pthread_exit(v)
+#      define xthread_set_specific(k,v) pthread_setspecific(k,v)
+#      define xmutex_clear(m) pthread_mutex_destroy(m)
+#      define xmutex_lock(m) pthread_mutex_lock(m)
+#      define xmutex_unlock(m) pthread_mutex_unlock(m)
+#      ifndef XPRE_STANDARD_API
+#       define xthread_key_create(kp,d) pthread_key_create(kp,d)
+#       define xthread_key_delete(k) pthread_key_delete(k)
+#       define xthread_get_specific(k,vp) *(vp) =3D pthread_getspeci=
fic(k)
+#       define xthread_fork(func,closure) { pthread_t _tmpxthr; \
 =09pthread_create(&_tmpxthr,NULL,func,closure); }
-#define XMUTEX_INITIALIZER PTHREAD_MUTEX_INITIALIZER
-#define xmutex_init(m) pthread_mutex_init(m, NULL)
-#define xcondition_init(c) pthread_cond_init(c, NULL)
-#else /* XPRE_STANDARD_API */
-#define xthread_key_create(kp,d) pthread_keycreate(kp,d)
-#define xthread_key_delete(k) 0
-#define xthread_get_specific(k,vp) pthread_getspecific(k,vp)
-#define xthread_fork(func,closure) { pthread_t _tmpxthr; \
+#       define XMUTEX_INITIALIZER PTHREAD_MUTEX_INITIALIZER
+#       define xmutex_init(m) pthread_mutex_init(m, NULL)
+#       define xcondition_init(c) pthread_cond_init(c, NULL)
+#      else /* XPRE_STANDARD_API */
+#       define xthread_key_create(kp,d) pthread_keycreate(kp,d)
+#       define xthread_key_delete(k) 0
+#       define xthread_get_specific(k,vp) pthread_getspecific(k,vp)
+#       define xthread_fork(func,closure) { pthread_t _tmpxthr; \
 =09pthread_create(&_tmpxthr,pthread_attr_default,func,closure); }
-#define xmutex_init(m) pthread_mutex_init(m, pthread_mutexattr_defau=
lt)
-#define xcondition_init(c) pthread_cond_init(c, pthread_condattr_def=
ault)
-#endif /* XPRE_STANDARD_API */
-#define xcondition_clear(c) pthread_cond_destroy(c)
-#define xcondition_wait(c,m) pthread_cond_wait(c,m)
-#define xcondition_signal(c) pthread_cond_signal(c)
-#define xcondition_broadcast(c) pthread_cond_broadcast(c)
-#if defined(_DECTHREADS_)
+#       define xmutex_init(m) pthread_mutex_init(m, pthread_mutexatt=
r_default)
+#       define xcondition_init(c) pthread_cond_init(c, pthread_conda=
ttr_default)
+#      endif /* XPRE_STANDARD_API */
+#      define xcondition_clear(c) pthread_cond_destroy(c)
+#      define xcondition_wait(c,m) pthread_cond_wait(c,m)
+#      define xcondition_signal(c) pthread_cond_signal(c)
+#      define xcondition_broadcast(c) pthread_cond_broadcast(c)
+#      if defined(_DECTHREADS_)
 static xthread_t _X_no_thread_id;
-#define xthread_have_id(id) !pthread_equal(id, _X_no_thread_id)
-#define xthread_clear_id(id) id =3D _X_no_thread_id
-#define xthread_equal(id1,id2) pthread_equal(id1, id2)
-#endif /* _DECTHREADS_ */
-#if defined(__linux__)
-#define xthread_have_id(id) !pthread_equal(id, 0)
-#define xthread_clear_id(id) id =3D 0
-#define xthread_equal(id1,id2) pthread_equal(id1, id2)
-#endif /* linux */
-#if defined(_CMA_VENDOR_) && defined(_CMA__IBM) && (_CMA_VENDOR_ =
=3D=3D _CMA__IBM)
-#ifdef DEBUG=09=09=09/* too much of a hack to enable normally */
+#       define xthread_have_id(id) !pthread_equal(id, _X_no_thread_i=
d)
+#       define xthread_clear_id(id) id =3D _X_no_thread_id
+#       define xthread_equal(id1,id2) pthread_equal(id1, id2)
+#      endif /* _DECTHREADS_ */
+#      if defined(__linux__)
+#       define xthread_have_id(id) !pthread_equal(id, 0)
+#       define xthread_clear_id(id) id =3D 0
+#       define xthread_equal(id1,id2) pthread_equal(id1, id2)
+#      endif /* linux */
+#      if defined(_CMA_VENDOR_) && defined(_CMA__IBM) && (_CMA_VENDO=
R_ =3D=3D _CMA__IBM)
+#       ifdef DEBUG=09=09/* too much of a hack to enable normally */
 /* see also cma__obj_set_name() */
-#define xmutex_set_name(m,str) ((char**)(m)->field1)[5] =3D (str)
-#define xcondition_set_name(cv,str) ((char**)(cv)->field1)[5] =3D (s=
tr)
-#endif /* DEBUG */
-#endif /* _CMA_VENDOR_ =3D=3D _CMA__IBM */
-#endif /* USE_NBSD_THREADLIB */
-#endif /* USE_TIS_SUPPORT */
-#endif /* WIN32 */
-#endif /* SVR4 */
-#endif /* CTHREADS */
+#        define xmutex_set_name(m,str) ((char**)(m)->field1)[5] =
=3D (str)
+#        define xcondition_set_name(cv,str) ((char**)(cv)->field1)[5=
] =3D (str)
+#       endif /* DEBUG */
+#      endif /* _CMA_VENDOR_ =3D=3D _CMA__IBM */
+#     endif /* USE_NBSD_THREADLIB */
+#    endif /* USE_TIS_SUPPORT */
+#   endif /* WIN32 */
+#  endif /* SVR4 */
+# endif /* CTHREADS */
 typedef xcondition_rec *xcondition_t;
 typedef xmutex_rec *xmutex_t;
-#ifndef xcondition_malloc
-#define xcondition_malloc() (xcondition_t)xmalloc(sizeof(xcondition_=
rec))
-#endif
-#ifndef xcondition_free
-#define xcondition_free(c) xfree((char *)c)
-#endif
-#ifndef xmutex_malloc
-#define xmutex_malloc() (xmutex_t)xmalloc(sizeof(xmutex_rec))
-#endif
-#ifndef xmutex_free
-#define xmutex_free(m) xfree((char *)m)
-#endif
-#ifndef xthread_have_id
-#define xthread_have_id(id) id
-#endif
-#ifndef xthread_clear_id
-#define xthread_clear_id(id) id =3D 0
-#endif
-#ifndef xthread_equal
-#define xthread_equal(id1,id2) ((id1) =3D=3D (id2))
-#endif
+# ifndef xcondition_malloc
+#  define xcondition_malloc() (xcondition_t)xmalloc(sizeof(xconditio=
n_rec))
+# endif
+# ifndef xcondition_free
+#  define xcondition_free(c) xfree((char *)c)
+# endif
+# ifndef xmutex_malloc
+#  define xmutex_malloc() (xmutex_t)xmalloc(sizeof(xmutex_rec))
+# endif
+# ifndef xmutex_free
+#  define xmutex_free(m) xfree((char *)m)
+# endif
+# ifndef xthread_have_id
+#  define xthread_have_id(id) id
+# endif
+# ifndef xthread_clear_id
+#  define xthread_clear_id(id) id =3D 0
+# endif
+# ifndef xthread_equal
+#  define xthread_equal(id1,id2) ((id1) =3D=3D (id2))
+# endif
 /* aids understood by some debuggers */
-#ifndef xthread_set_name
-#define xthread_set_name(t,str)
-#endif
-#ifndef xmutex_set_name
-#define xmutex_set_name(m,str)
-#endif
-#ifndef xcondition_set_name
-#define xcondition_set_name(cv,str)
-#endif
+# ifndef xthread_set_name
+#  define xthread_set_name(t,str)
+# endif
+# ifndef xmutex_set_name
+#  define xmutex_set_name(m,str)
+# endif
+# ifndef xcondition_set_name
+#  define xcondition_set_name(cv,str)
+# endif
=20
 #endif /* _XTHREADS_H_ */
diff --git a/recipes/xorg-lib/xorg-headers-native/X11/Xutil.h b/recip=
es/xorg-lib/xorg-headers-native/X11/Xutil.h
index 9f2ef63..8ff34d9 100644
--- a/recipes/xorg-lib/xorg-headers-native/X11/Xutil.h
+++ b/recipes/xorg-lib/xorg-headers-native/X11/Xutil.h
@@ -1,4 +1,3 @@
-/* $Xorg: Xutil.h,v 1.8 2001/02/09 02:03:39 xorgcvs Exp $ */
=20
 /***********************************************************
=20
@@ -29,13 +28,13 @@ Copyright 1987 by Digital Equipment Corporation, =
Maynard, Massachusetts.
=20
                         All Rights Reserved
=20
-Permission to use, copy, modify, and distribute this software and it=
s=20
-documentation for any purpose and without fee is hereby granted,=
=20
+Permission to use, copy, modify, and distribute this software and it=
s
+documentation for any purpose and without fee is hereby granted,
 provided that the above copyright notice appear in all copies and th=
at
-both that copyright notice and this permission notice appear in=20
+both that copyright notice and this permission notice appear in
 supporting documentation, and that the name of Digital not be
 used in advertising or publicity pertaining to distribution of the
-software without specific, written prior permission. =20
+software without specific, written prior permission.
=20
 DIGITAL DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE, INCLU=
DING
 ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO EVENT S=
HALL
@@ -46,7 +45,6 @@ ARISING OUT OF OR IN CONNECTION WITH THE USE OR PER=
FORMANCE OF THIS
 SOFTWARE.
=20
 ******************************************************************/
-/* $XFree86: xc/lib/X11/Xutil.h,v 3.6 2003/04/13 19:22:20 dawes Exp =
$ */
=20
 #ifndef _XUTIL_H_
 #define _XUTIL_H_
@@ -55,7 +53,7 @@ SOFTWARE.
 #include <X11/Xlib.h>
 #include <X11/keysym.h>
=20
-/*=20
+/*
  * Bitmask returned by XParseGeometry().  Each bit tells if the corr=
esponding
  * value (x, y, width, height) was found in the parsed string.
  */
@@ -151,7 +149,7 @@ IconPositionHint|IconMaskHint|WindowGroupHint)
=20
=20
 /*
- * new structure for manipulating TEXT properties; used with WM_NAME=
,=20
+ * new structure for manipulating TEXT properties; used with WM_NAME=
,
  * WM_ICON_NAME, WM_CLIENT_MACHINE, and WM_COMMAND.
  */
 typedef struct {
@@ -262,16 +260,16 @@ typedef struct _XComposeStatus {
    || ((KeySym)(keysym) =3D=3D XK_Num_Lock))
 #endif
 /*
- * opaque reference to Region data type=20
+ * opaque reference to Region data type
  */
-typedef struct _XRegion *Region;=20
+typedef struct _XRegion *Region;
=20
 /* Return values from XRectInRegion() */
-=20
+
 #define RectangleOut 0
 #define RectangleIn  1
 #define RectanglePart 2
-=20
+
=20
 /*
  * Information used by the visual utility routines to find desired v=
isual
@@ -452,7 +450,7 @@ extern Status XGetStandardColormap(
     Display*=09=09/* display */,
     Window=09=09/* w */,
     XStandardColormap*=09/* colormap_return */,
-    Atom=09=09/* property */=09=09=09   =20
+    Atom=09=09/* property */
 );
=20
 extern Status XGetTextProperty(
@@ -477,7 +475,7 @@ extern Status XGetWMClientMachine(
=20
 extern XWMHints *XGetWMHints(
     Display*=09=09/* display */,
-    Window=09=09/* w */=09=09     =20
+    Window=09=09/* w */
 );
=20
 extern Status XGetWMIconName(
@@ -496,7 +494,7 @@ extern Status XGetWMNormalHints(
     Display*=09=09/* display */,
     Window=09=09/* w */,
     XSizeHints*=09=09/* hints_return */,
-    long*=09=09/* supplied_return */=20
+    long*=09=09/* supplied_return */
 );
=20
 extern Status XGetWMSizeHints(
@@ -584,7 +582,7 @@ extern int XSetIconSizes(
     Display*=09=09/* display */,
     Window=09=09/* w */,
     XIconSize*=09=09/* size_list */,
-    int=09=09=09/* count */   =20
+    int=09=09=09/* count */
 );
=20
 extern int XSetNormalHints(
diff --git a/recipes/xorg-lib/xorg-headers-native/X11/Xw32defs.h b/re=
cipes/xorg-lib/xorg-headers-native/X11/Xw32defs.h
index 07624fe..b2e4b33 100644
--- a/recipes/xorg-lib/xorg-headers-native/X11/Xw32defs.h
+++ b/recipes/xorg-lib/xorg-headers-native/X11/Xw32defs.h
@@ -1,81 +1,79 @@
-/* $Xorg: Xw32defs.h,v 1.3 2000/08/18 04:05:44 coskrey Exp $ */
-
 #ifndef _XW32DEFS_H
-#define  _XW32DEFS_H
+# define  _XW32DEFS_H
=20
-#ifdef __GNUC__ /* mingw is more close to unix than msvc */
-#if !defined(__daddr_t_defined)=20
+# ifdef __GNUC__ /* mingw is more close to unix than msvc */
+#  if !defined(__daddr_t_defined)=20
 typedef char *caddr_t;
-#endif
-#define lstat stat
+#  endif
+#  define lstat stat
=20
-#else
+# else
 typedef char *caddr_t;
=20
-#define access=09   _access
-#define alloca=09   _alloca
-#define chdir=09_chdir
-#define chmod=09   _chmod
-#define close=09   _close
-#define creat=09   _creat
-#define dup=09   _dup
-#define dup2=09   _dup2
-#define environ     _environ
-#define execl=09 _execl
-#define execle=09 _execle
-#define execlp=09 _execlp
-#define execlpe  _execlpe
-#define execv=09 _execv
-#define execve=09 _execve
-#define execvp=09 _execvp
-#define execvpe  _execvpe
-#define fdopen=09  _fdopen
-#define fileno=09  _fileno
-#define fstat=09 _fstat
-#define getcwd=09_getcwd
-#define getpid=09 _getpid
-#define hypot=09=09_hypot
-#define isascii __isascii
-#define isatty=09   _isatty
-#define lseek=09   _lseek
-#define mkdir=09_mkdir
-#define mktemp=09   _mktemp
-#define open=09   _open
-#define putenv=09    _putenv
-#define read=09   _read
-#define rmdir=09_rmdir
-#define sleep(x) _sleep((x) * 1000)
-#define stat=09 _stat
-#define sys_errlist _sys_errlist
-#define sys_nerr    _sys_nerr
-#define umask=09   _umask
-#define unlink=09   _unlink
-#define write=09   _write
-#define random   rand
-#define srandom  srand
+#  define access=09   _access
+#  define alloca=09   _alloca
+#  define chdir=09_chdir
+#  define chmod=09   _chmod
+#  define close=09   _close
+#  define creat=09   _creat
+#  define dup=09   _dup
+#  define dup2=09   _dup2
+#  define environ     _environ
+#  define execl=09 _execl
+#  define execle=09 _execle
+#  define execlp=09 _execlp
+#  define execlpe  _execlpe
+#  define execv=09 _execv
+#  define execve=09 _execve
+#  define execvp=09 _execvp
+#  define execvpe  _execvpe
+#  define fdopen=09  _fdopen
+#  define fileno=09  _fileno
+#  define fstat=09 _fstat
+#  define getcwd=09_getcwd
+#  define getpid=09 _getpid
+#  define hypot=09=09_hypot
+#  define isascii __isascii
+#  define isatty=09   _isatty
+#  define lseek=09   _lseek
+#  define mkdir=09_mkdir
+#  define mktemp=09   _mktemp
+#  define open=09   _open
+#  define putenv=09    _putenv
+#  define read=09   _read
+#  define rmdir=09_rmdir
+#  define sleep(x) Sleep((x) * 1000)
+#  define stat=09 _stat
+#  define sys_errlist _sys_errlist
+#  define sys_nerr    _sys_nerr
+#  define umask=09   _umask
+#  define unlink=09   _unlink
+#  define write=09   _write
+#  define random   rand
+#  define srandom  srand
=20
-#define O_RDONLY    _O_RDONLY
-#define O_WRONLY    _O_WRONLY
-#define O_RDWR=09    _O_RDWR
-#define O_APPEND    _O_APPEND
-#define O_CREAT     _O_CREAT
-#define O_TRUNC     _O_TRUNC
-#define O_EXCL=09    _O_EXCL
-#define O_TEXT=09    _O_TEXT
-#define O_BINARY    _O_BINARY
-#define O_RAW=09    _O_BINARY
+#  define O_RDONLY    _O_RDONLY
+#  define O_WRONLY    _O_WRONLY
+#  define O_RDWR=09    _O_RDWR
+#  define O_APPEND    _O_APPEND
+#  define O_CREAT     _O_CREAT
+#  define O_TRUNC     _O_TRUNC
+#  define O_EXCL=09    _O_EXCL
+#  define O_TEXT=09    _O_TEXT
+#  define O_BINARY    _O_BINARY
+#  define O_RAW=09    _O_BINARY
=20
-#define S_IFMT=09 _S_IFMT
-#define S_IFDIR  _S_IFDIR
-#define S_IFCHR  _S_IFCHR
-#define S_IFREG  _S_IFREG
-#define S_IREAD  _S_IREAD
-#define S_IWRITE _S_IWRITE
-#define S_IEXEC  _S_IEXEC
+#  define S_IFMT=09 _S_IFMT
+#  define S_IFDIR  _S_IFDIR
+#  define S_IFCHR  _S_IFCHR
+#  define S_IFREG  _S_IFREG
+#  define S_IREAD  _S_IREAD
+#  define S_IWRITE _S_IWRITE
+#  define S_IEXEC  _S_IEXEC
=20
-#define=09F_OK=090
-#define=09X_OK=091
-#define=09W_OK=092
-#define=09R_OK=094
-#endif /* __GNUC__ */
+#  define=09F_OK=090
+#  define=09X_OK=091
+#  define=09W_OK=092
+#  define=09R_OK=094
+# endif /* __GNUC__ */
 #endif
diff --git a/recipes/xorg-lib/xorg-headers-native/X11/Xwindows.h b/re=
cipes/xorg-lib/xorg-headers-native/X11/Xwindows.h
index 7fb9840..6318155 100644
--- a/recipes/xorg-lib/xorg-headers-native/X11/Xwindows.h
+++ b/recipes/xorg-lib/xorg-headers-native/X11/Xwindows.h
@@ -1,4 +1,3 @@
-/* $Xorg$ */
 /*
=20
 Copyright 1996, 1998  The Open Group
@@ -28,18 +27,29 @@ The Open Group.
 */
=20
 /*
- * This header file has for sole purpose to allow to include windows=
.h
- * without getting any name conflicts with our code.
- * Conflicts come from the fact that including windows.h actually pu=
lls
- * in the whole Windows API...
+ * This header file has the sole purpose of allowing the inclusion o=
f
+ * windows.h without getting any name conflicts with X headers code,=
 by
+ * renaming the conflicting definitions from windows.h
+ *
+ * Some (non-Microsoft) versions of the Windows API headers actually=
 avoid
+ * making the conflicting definitions if XFree86Server is defined, s=
o we
+ * need to remember if that was defined and undefine it during inclu=
ding
+ * windows.h (so the conflicting definitions get wrapped correctly),=
 and
+ * then redefine it afterwards...
+ *
+ * There doesn't seem to be a good way to wrap the min/max macros fr=
om
+ * windows.h, so we simply avoid defining them completely, allowing =
any
+ * pre-existing definition to stand.
+ *
  */
=20
 #undef _XFree86Server
-#ifdef XFree86Server=20
-#define _XFree86Server
-#undef XFree86Server
+#ifdef XFree86Server
+# define _XFree86Server
+# undef XFree86Server
 #endif
=20
+#define NOMINMAX
 #define BOOL wBOOL
 #define INT32 wINT32
 #undef Status
@@ -48,6 +58,7 @@ The Open Group.
 #define BYTE wBYTE
 #define FreeResource wFreeResource
 #include <windows.h>
+#undef NOMINMAX
 #undef Status
 #define Status int
 #undef BYTE
@@ -56,25 +67,25 @@ The Open Group.
 #undef ATOM
 #undef FreeResource
 #undef CreateWindowA
-#undef min
-#undef max
=20
 #ifdef RESOURCE_H
-#undef RT_FONT
-#undef RT_CURSOR
-#define RT_FONT         ((RESTYPE)4)
-#define RT_CURSOR       ((RESTYPE)5)
+# undef RT_FONT
+# undef RT_CURSOR
+# define RT_FONT         ((RESTYPE)4)
+# define RT_CURSOR       ((RESTYPE)5)
 #endif
=20
-#define sleep(x) Sleep(1000*x)
+#ifndef __CYGWIN__
+#define sleep(x) Sleep((x) * 1000)
+#endif
=20
 #if defined(WIN32) && (!defined(PATH_MAX) || PATH_MAX < 1024)
-#undef PATH_MAX
-#define PATH_MAX 1024
+# undef PATH_MAX
+# define PATH_MAX 1024
 #endif
=20
 #ifdef _XFree86Server
-#define XFree86Server
-#undef _XFree86Server
+# define XFree86Server
+# undef _XFree86Server
 #endif
=20
diff --git a/recipes/xorg-lib/xorg-headers-native/X11/Xwinsock.h b/re=
cipes/xorg-lib/xorg-headers-native/X11/Xwinsock.h
index 0278c09..e6ca7b5 100644
--- a/recipes/xorg-lib/xorg-headers-native/X11/Xwinsock.h
+++ b/recipes/xorg-lib/xorg-headers-native/X11/Xwinsock.h
@@ -1,4 +1,3 @@
-/* $Xorg: Xwinsock.h,v 1.4 2001/02/09 02:03:23 xorgcvs Exp $ */
 /*
=20
 Copyright 1996, 1998  The Open Group
@@ -36,8 +35,8 @@ The Open Group.
=20
 #undef _XFree86Server
 #ifdef XFree86Server=20
-#define _XFree86Server
-#undef XFree86Server
+# define _XFree86Server
+# undef XFree86Server
 #endif
=20
 #define BOOL wBOOL
@@ -47,7 +46,7 @@ The Open Group.
 #define ATOM wATOM
 #define BYTE wBYTE
 #define FreeResource wFreeResource
-#include <winsock.h>
+#include <winsock2.h>
 #undef Status
 #define Status int
 #undef BYTE
@@ -60,7 +59,7 @@ The Open Group.
 #undef RT_CURSOR
=20
 #ifdef _XFree86Server
-#define XFree86Server
-#undef _XFree86Server
+# define XFree86Server
+# undef _XFree86Server
 #endif
=20
diff --git a/recipes/xorg-lib/xorg-headers-native/X11/cursorfont.h b/=
recipes/xorg-lib/xorg-headers-native/X11/cursorfont.h
index c6204f1..70d7125 100644
--- a/recipes/xorg-lib/xorg-headers-native/X11/cursorfont.h
+++ b/recipes/xorg-lib/xorg-headers-native/X11/cursorfont.h
@@ -1,4 +1,3 @@
-/* $Xorg: cursorfont.h,v 1.4 2001/02/09 02:03:39 xorgcvs Exp $ */
 /*
=20
 Copyright 1987, 1998  The Open Group
@@ -27,6 +26,9 @@ from The Open Group.
=20
 */
=20
+#ifndef _cursorfont_h_
+#define _cursorfont_h_
+
 #define XC_num_glyphs 154
 #define XC_X_cursor 0
 #define XC_arrow 2
@@ -105,3 +107,5 @@ from The Open Group.
 #define XC_ur_angle 148
 #define XC_watch 150
 #define XC_xterm 152
+
+#endif /* _cursorfont_h_ */
diff --git a/recipes/xorg-lib/xorg-headers-native/X11/keysym.h b/reci=
pes/xorg-lib/xorg-headers-native/X11/keysym.h
index 04e2956..641b25b 100644
--- a/recipes/xorg-lib/xorg-headers-native/X11/keysym.h
+++ b/recipes/xorg-lib/xorg-headers-native/X11/keysym.h
@@ -1,5 +1,3 @@
-/* $Xorg: keysym.h,v 1.4 2001/02/09 02:03:23 xorgcvs Exp $ */
-
 /***********************************************************
=20
 Copyright 1987, 1998  The Open Group
@@ -46,7 +44,6 @@ ARISING OUT OF OR IN CONNECTION WITH THE USE OR PER=
FORMANCE OF THIS
 SOFTWARE.
=20
 ******************************************************************/
-/* $XFree86: xc/include/keysym.h,v 1.3 2001/01/17 17:53:12 dawes Exp=
 $ */
=20
 /* default keysyms */
 #define XK_MISCELLANY
diff --git a/recipes/xorg-lib/xorg-headers-native/X11/keysymdef.h b/r=
ecipes/xorg-lib/xorg-headers-native/X11/keysymdef.h
index dd9fbd9..ec125a6 100644
--- a/recipes/xorg-lib/xorg-headers-native/X11/keysymdef.h
+++ b/recipes/xorg-lib/xorg-headers-native/X11/keysymdef.h
@@ -1,5 +1,3 @@
-/* $Xorg: keysymdef.h,v 1.4 2001/02/09 02:03:23 $ */
-
 /***********************************************************
 Copyright 1987, 1994, 1998  The Open Group
=20
@@ -47,7 +45,6 @@ ARISING OUT OF OR IN CONNECTION WITH THE USE OR PER=
FORMANCE OF THIS
 SOFTWARE.
=20
 ******************************************************************/
-/* $XFree86: $ */
=20
 /*
  * The "X11 Window System Protocol" standard defines in Appendix A t=
he
@@ -56,7 +53,7 @@ SOFTWARE.
  * engraving) of a keyboard layout. This file assigns mnemonic macro
  * names for these keysyms.
  *
- * This file is also compiled (by xc/lib/X11/util/makekeys.c) into
+ * This file is also compiled (by src/util/makekeys.c in libX11) int=
o
  * hash tables that can be accessed with X11 library functions such =
as
  * XStringToKeysym() and XKeysymToString().
  *
@@ -93,9 +90,26 @@ SOFTWARE.
  *    /^\#define XK_([a-zA-Z_0-9]+)\s+0x([0-9a-f]+)\s*\/\*\(U+([0-9A=
-F]{4,6}) (.*)\)\*\/\s*$/
  *    /^\#define XK_([a-zA-Z_0-9]+)\s+0x([0-9a-f]+)\s*(\/\*\s*(.*)\s=
*\*\/)?\s*$/
  *
+ * Before adding new keysyms, please do consider the following: In
+ * addition to the keysym names defined in this file, the
+ * XStringToKeysym() and XKeysymToString() functions will also handl=
e
+ * any keysym string of the form "U0020" to "U007E" and "U00A0" to
+ * "U10FFFF" for all possible Unicode characters. In other words,
+ * every possible Unicode character has already a keysym string
+ * defined algorithmically, even if it is not listed here. Therefore=
,
+ * defining an additional keysym macro is only necessary where a
+ * non-hexadecimal mnemonic name is needed, or where the new keysym
+ * does not represent any existing Unicode character.
+ *
  * When adding new keysyms to this file, do not forget to also updat=
e the
- * mappings in xc/lib/X11/KeyBind.c and the protocol specification i=
n
- * xc/doc/specs/XProtocol/X11.keysyms.
+ * following:
+ *
+ *   - the mappings in src/KeyBind.c in the repo
+ *     git://anongit.freedesktop.org/xorg/lib/libX11
+ *
+ *   - the protocol specification in specs/XProtocol/X11.keysyms
+ *     in the repo git://anongit.freedesktop.org/xorg/doc/xorg-docs
+ *
  */
=20
 #define XK_VoidSymbol                  0xffffff  /* Void symbol */
@@ -327,6 +341,9 @@ SOFTWARE.
 #define XK_ISO_Level3_Shift              0xfe03
 #define XK_ISO_Level3_Latch              0xfe04
 #define XK_ISO_Level3_Lock               0xfe05
+#define XK_ISO_Level5_Shift              0xfe11
+#define XK_ISO_Level5_Latch              0xfe12
+#define XK_ISO_Level5_Lock               0xfe13
 #define XK_ISO_Group_Shift               0xff7e  /* Alias for mode_s=
witch */
 #define XK_ISO_Group_Latch               0xfe06
 #define XK_ISO_Group_Lock                0xfe07
@@ -365,6 +382,7 @@ SOFTWARE.
 #define XK_dead_acute                    0xfe51
 #define XK_dead_circumflex               0xfe52
 #define XK_dead_tilde                    0xfe53
+#define XK_dead_perispomeni              0xfe53  /* alias for dead_t=
ilde */
 #define XK_dead_macron                   0xfe54
 #define XK_dead_breve                    0xfe55
 #define XK_dead_abovedot                 0xfe56
@@ -381,6 +399,34 @@ SOFTWARE.
 #define XK_dead_hook                     0xfe61
 #define XK_dead_horn                     0xfe62
 #define XK_dead_stroke                   0xfe63
+#define XK_dead_abovecomma               0xfe64
+#define XK_dead_psili                    0xfe64  /* alias for dead_a=
bovecomma */
+#define XK_dead_abovereversedcomma       0xfe65
+#define XK_dead_dasia                    0xfe65  /* alias for dead_a=
bovereversedcomma */
+#define XK_dead_doublegrave              0xfe66
+#define XK_dead_belowring                0xfe67
+#define XK_dead_belowmacron              0xfe68
+#define XK_dead_belowcircumflex          0xfe69
+#define XK_dead_belowtilde               0xfe6a
+#define XK_dead_belowbreve               0xfe6b
+#define XK_dead_belowdiaeresis           0xfe6c
+#define XK_dead_invertedbreve            0xfe6d
+#define XK_dead_belowcomma               0xfe6e
+#define XK_dead_currency                 0xfe6f
+
+/* dead vowels for universal syllable entry */
+#define XK_dead_a                        0xfe80
+#define XK_dead_A                        0xfe81
+#define XK_dead_e                        0xfe82
+#define XK_dead_E                        0xfe83
+#define XK_dead_i                        0xfe84
+#define XK_dead_I                        0xfe85
+#define XK_dead_o                        0xfe86
+#define XK_dead_O                        0xfe87
+#define XK_dead_u                        0xfe88
+#define XK_dead_U                        0xfe89
+#define XK_dead_small_schwa              0xfe8a
+#define XK_dead_capital_schwa            0xfe8b
=20
 #define XK_First_Virtual_Screen          0xfed0
 #define XK_Prev_Virtual_Screen           0xfed1
@@ -1465,20 +1511,20 @@ SOFTWARE.
 #define XK_downcaret                     0x0ba8  /*(U+2228 LOGICAL O=
R)*/
 #define XK_upcaret                       0x0ba9  /*(U+2227 LOGICAL A=
ND)*/
 #define XK_overbar                       0x0bc0  /*(U+00AF MACRON)*/
-#define XK_downtack                      0x0bc2  /* U+22A5 UP TACK *=
/
+#define XK_downtack                      0x0bc2  /* U+22A4 DOWN TACK=
 */
 #define XK_upshoe                        0x0bc3  /*(U+2229 INTERSECT=
ION)*/
 #define XK_downstile                     0x0bc4  /* U+230A LEFT FLOO=
R */
 #define XK_underbar                      0x0bc6  /*(U+005F LOW LINE)=
*/
 #define XK_jot                           0x0bca  /* U+2218 RING OPER=
ATOR */
 #define XK_quad                          0x0bcc  /* U+2395 APL FUNCT=
IONAL SYMBOL QUAD */
-#define XK_uptack                        0x0bce  /* U+22A4 DOWN TACK=
 */
+#define XK_uptack                        0x0bce  /* U+22A5 UP TACK *=
/
 #define XK_circle                        0x0bcf  /* U+25CB WHITE CIR=
CLE */
 #define XK_upstile                       0x0bd3  /* U+2308 LEFT CEIL=
ING */
 #define XK_downshoe                      0x0bd6  /*(U+222A UNION)*/
 #define XK_rightshoe                     0x0bd8  /*(U+2283 SUPERSET =
OF)*/
 #define XK_leftshoe                      0x0bda  /*(U+2282 SUBSET OF=
)*/
-#define XK_lefttack                      0x0bdc  /* U+22A2 RIGHT TAC=
K */
-#define XK_righttack                     0x0bfc  /* U+22A3 LEFT TACK=
 */
+#define XK_lefttack                      0x0bdc  /* U+22A3 LEFT TACK=
 */
+#define XK_righttack                     0x0bfc  /* U+22A2 RIGHT TAC=
K */
 #endif /* XK_APL */
=20
 /*
--=20
1.6.3.3




