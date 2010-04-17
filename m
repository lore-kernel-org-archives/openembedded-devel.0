Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1O32Vw-0001ej-4H for openembedded-devel@lists.openembedded.org;
	Sat, 17 Apr 2010 09:32:34 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1O32SX-000712-VL for openembedded-devel@lists.openembedded.org;
	Sat, 17 Apr 2010 09:28:57 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Apr 2010 09:28:57 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Apr 2010 09:28:57 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
connect(): No such file or directory
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 17 Apr 2010 09:28:42 +0200
Message-ID: <hqbnva$nnu$1@dough.gmane.org>
References: <1271471763-28331-1-git-send-email-denis@denix.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.9) Gecko/20100406 Shredder/3.0.5pre
In-Reply-To: <1271471763-28331-1-git-send-email-denis@denix.org>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] xorg-headers-native: haven't been updated since 2006, do so now
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
X-List-Received-Date: Sat, 17 Apr 2010 07:32:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 17-04-10 04:36, Denys Dmytriyenko wrote:
> Update the combined headers from the following packages:
> * xproto-7.0.16
> * libx11-1.3.3
> * libxau-1.0.5
> * libxdmcp-1.0.3
> * libxt-1.0.8

You forgot to bump PR on the affected recipes.

regards,

Koen

> 
> For example, GenericEvent is new since xproto-7.0.13 and prevents
> libx11-native from building on an X-less host.
> 
> Signed-off-by: Denys Dmytriyenko <denis@denix.org>
> ---
>  .../xorg-lib/xorg-headers-native/X11/CallbackI.h   |    4 +
>  .../xorg-lib/xorg-headers-native/X11/Composite.h   |    2 +-
>  .../xorg-lib/xorg-headers-native/X11/CompositeP.h  |    4 +
>  .../xorg-lib/xorg-headers-native/X11/ConstrainP.h  |    4 +
>  .../xorg-lib/xorg-headers-native/X11/Constraint.h  |    6 +-
>  .../xorg-lib/xorg-headers-native/X11/ConvertI.h    |    3 +
>  recipes/xorg-lib/xorg-headers-native/X11/Core.h    |    6 +-
>  recipes/xorg-lib/xorg-headers-native/X11/CoreP.h   |    4 +
>  recipes/xorg-lib/xorg-headers-native/X11/CreateI.h |    7 +
>  .../xorg-lib/xorg-headers-native/X11/DECkeysym.h   |    2 -
>  recipes/xorg-lib/xorg-headers-native/X11/EventI.h  |    4 +
>  .../xorg-lib/xorg-headers-native/X11/HPkeysym.h    |    1 -
>  .../xorg-lib/xorg-headers-native/X11/HookObjI.h    |    4 +
>  recipes/xorg-lib/xorg-headers-native/X11/ImUtil.h  |    1 -
>  .../xorg-lib/xorg-headers-native/X11/InitialI.h    |    4 +
>  .../xorg-lib/xorg-headers-native/X11/IntrinsicI.h  |    4 +
>  recipes/xorg-lib/xorg-headers-native/X11/Object.h  |    7 +-
>  recipes/xorg-lib/xorg-headers-native/X11/ObjectP.h |    4 +
>  .../xorg-lib/xorg-headers-native/X11/PassivGraI.h  |    4 +
>  recipes/xorg-lib/xorg-headers-native/X11/RectObj.h |    7 +-
>  .../xorg-lib/xorg-headers-native/X11/RectObjP.h    |    4 +
>  .../xorg-lib/xorg-headers-native/X11/ResourceI.h   |    3 +
>  recipes/xorg-lib/xorg-headers-native/X11/ShellP.h  |    8 +
>  .../xorg-lib/xorg-headers-native/X11/Sunkeysym.h   |    2 -
>  .../xorg-lib/xorg-headers-native/X11/ThreadsI.h    |   51 ++--
>  .../xorg-lib/xorg-headers-native/X11/TranslateI.h  |    3 +
>  .../xorg-lib/xorg-headers-native/X11/VarargsI.h    |    4 +
>  recipes/xorg-lib/xorg-headers-native/X11/Vendor.h  |    4 +
>  recipes/xorg-lib/xorg-headers-native/X11/VendorP.h |   10 +-
>  recipes/xorg-lib/xorg-headers-native/X11/X.h       |    8 +-
>  .../xorg-lib/xorg-headers-native/X11/XF86keysym.h  |  313 +++++++++-------
>  recipes/xorg-lib/xorg-headers-native/X11/XKBlib.h  |   28 +-
>  recipes/xorg-lib/xorg-headers-native/X11/XWDFile.h |    1 -
>  recipes/xorg-lib/xorg-headers-native/X11/Xalloca.h |   36 +--
>  recipes/xorg-lib/xorg-headers-native/X11/Xarch.h   |  133 +++----
>  recipes/xorg-lib/xorg-headers-native/X11/Xauth.h   |   17 -
>  recipes/xorg-lib/xorg-headers-native/X11/Xcms.h    |   10 +-
>  recipes/xorg-lib/xorg-headers-native/X11/Xdefs.h   |    2 -
>  recipes/xorg-lib/xorg-headers-native/X11/Xdmcp.h   |    2 +-
>  .../xorg-lib/xorg-headers-native/X11/Xfuncproto.h  |   24 +-
>  recipes/xorg-lib/xorg-headers-native/X11/Xfuncs.h  |   77 ++---
>  recipes/xorg-lib/xorg-headers-native/X11/Xlib.h    |  151 ++++----
>  .../xorg-lib/xorg-headers-native/X11/XlibConf.h    |    8 +-
>  recipes/xorg-lib/xorg-headers-native/X11/Xlibint.h |  126 +++++--
>  recipes/xorg-lib/xorg-headers-native/X11/Xlocale.h |    2 -
>  recipes/xorg-lib/xorg-headers-native/X11/Xmd.h     |  161 ++++-----
>  recipes/xorg-lib/xorg-headers-native/X11/Xos.h     |  280 ++++-----------
>  recipes/xorg-lib/xorg-headers-native/X11/Xos_r.h   |  105 +----
>  recipes/xorg-lib/xorg-headers-native/X11/Xosdefs.h |  192 ++++------
>  recipes/xorg-lib/xorg-headers-native/X11/Xpoll.h   |   41 +--
>  recipes/xorg-lib/xorg-headers-native/X11/Xproto.h  |   36 ++-
>  .../xorg-lib/xorg-headers-native/X11/Xprotostr.h   |    1 -
>  recipes/xorg-lib/xorg-headers-native/X11/Xregion.h |   19 +-
>  .../xorg-lib/xorg-headers-native/X11/Xresource.h   |   16 +-
>  .../xorg-lib/xorg-headers-native/X11/Xthreads.h    |  401 ++++++++++----------
>  recipes/xorg-lib/xorg-headers-native/X11/Xutil.h   |   30 +-
>  .../xorg-lib/xorg-headers-native/X11/Xw32defs.h    |  140 ++++----
>  .../xorg-lib/xorg-headers-native/X11/Xwindows.h    |   49 ++-
>  .../xorg-lib/xorg-headers-native/X11/Xwinsock.h    |   11 +-
>  .../xorg-lib/xorg-headers-native/X11/cursorfont.h  |    6 +-
>  recipes/xorg-lib/xorg-headers-native/X11/keysym.h  |    3 -
>  .../xorg-lib/xorg-headers-native/X11/keysymdef.h   |   66 +++-
>  62 files changed, 1266 insertions(+), 1400 deletions(-)
> 
> diff --git a/recipes/xorg-lib/xorg-headers-native/X11/CallbackI.h b/recipes/xorg-lib/xorg-headers-native/X11/CallbackI.h
> index 4ae08ab..64e8152 100644
> --- a/recipes/xorg-lib/xorg-headers-native/X11/CallbackI.h
> +++ b/recipes/xorg-lib/xorg-headers-native/X11/CallbackI.h
> @@ -58,6 +58,8 @@ typedef XrmResource **CallbackTable;
>  #define _XtCBCalling 1
>  #define _XtCBFreeAfterCalling 2
>  
> +_XFUNCPROTOBEGIN
> +
>  typedef struct internalCallbackRec {
>      unsigned short count;
>      char	   is_padded;	/* contains NULL padding for external form */
> @@ -115,3 +117,5 @@ extern void _XtCallConditionalCallbackList(
>      XtPointer			/* call_data */,
>      _XtConditionProc		/* cond_proc */
>  );
> +
> +_XFUNCPROTOEND
> diff --git a/recipes/xorg-lib/xorg-headers-native/X11/Composite.h b/recipes/xorg-lib/xorg-headers-native/X11/Composite.h
> index 0a58332..c3c9828 100644
> --- a/recipes/xorg-lib/xorg-headers-native/X11/Composite.h
> +++ b/recipes/xorg-lib/xorg-headers-native/X11/Composite.h
> @@ -97,7 +97,7 @@ extern void XtChangeManagedSet(
>  
>  _XFUNCPROTOEND
>  
> -#ifndef XT_COMPOSITE
> +#ifndef VMS
>  externalref WidgetClass compositeWidgetClass;
>  #endif
>  
> diff --git a/recipes/xorg-lib/xorg-headers-native/X11/CompositeP.h b/recipes/xorg-lib/xorg-headers-native/X11/CompositeP.h
> index ed055b2..e93275a 100644
> --- a/recipes/xorg-lib/xorg-headers-native/X11/CompositeP.h
> +++ b/recipes/xorg-lib/xorg-headers-native/X11/CompositeP.h
> @@ -52,6 +52,8 @@ SOFTWARE.
>  
>  #include <X11/Composite.h>
>  
> +_XFUNCPROTOBEGIN
> +
>  /************************************************************************
>   *
>   * Additional instance fields for widgets of (sub)class 'Composite' 
> @@ -101,6 +103,8 @@ typedef struct _CompositeClassRec {
>  
>  externalref CompositeClassRec compositeClassRec;
>  
> +_XFUNCPROTOEND
> +
>  #define XtCompositeExtensionVersion 2L
>  #define XtInheritGeometryManager ((XtGeometryHandler) _XtInherit)
>  #define XtInheritChangeManaged ((XtWidgetProc) _XtInherit)
> diff --git a/recipes/xorg-lib/xorg-headers-native/X11/ConstrainP.h b/recipes/xorg-lib/xorg-headers-native/X11/ConstrainP.h
> index a90d19a..7030a34 100644
> --- a/recipes/xorg-lib/xorg-headers-native/X11/ConstrainP.h
> +++ b/recipes/xorg-lib/xorg-headers-native/X11/ConstrainP.h
> @@ -52,6 +52,8 @@ SOFTWARE.
>  
>  #include <X11/Constraint.h>
>  
> +_XFUNCPROTOBEGIN
> +
>  typedef struct _ConstraintPart {
>      XtPointer   mumble;		/* No new fields, keep C compiler happy */
>  } ConstraintPart;
> @@ -88,6 +90,8 @@ typedef struct _ConstraintClassRec {
>  
>  externalref ConstraintClassRec constraintClassRec;
>  
> +_XFUNCPROTOEND
> +
>  #define XtConstraintExtensionVersion 1L
>  
>  #endif /* _XtConstraintP_h */
> diff --git a/recipes/xorg-lib/xorg-headers-native/X11/Constraint.h b/recipes/xorg-lib/xorg-headers-native/X11/Constraint.h
> index 9bb962e..977e7ee 100644
> --- a/recipes/xorg-lib/xorg-headers-native/X11/Constraint.h
> +++ b/recipes/xorg-lib/xorg-headers-native/X11/Constraint.h
> @@ -50,11 +50,15 @@ SOFTWARE.
>  #ifndef _XtConstraint_h
>  #define _XtConstraint_h
>  
> +_XFUNCPROTOBEGIN
> +
>  typedef struct _ConstraintClassRec *ConstraintWidgetClass;
>  
> -#ifndef CONSTRAINT
> +#ifndef VMS
>  externalref WidgetClass constraintWidgetClass;
>  #endif
>  
> +_XFUNCPROTOEND
> +
>  #endif /* _XtConstraint_h */
>  /* DON'T ADD STUFF AFTER THIS #endif */
> diff --git a/recipes/xorg-lib/xorg-headers-native/X11/ConvertI.h b/recipes/xorg-lib/xorg-headers-native/X11/ConvertI.h
> index 02c0e5c..f3f7fb0 100644
> --- a/recipes/xorg-lib/xorg-headers-native/X11/ConvertI.h
> +++ b/recipes/xorg-lib/xorg-headers-native/X11/ConvertI.h
> @@ -48,6 +48,8 @@ SOFTWARE.
>  ******************************************************************/
>  /* $XFree86: xc/lib/Xt/ConvertI.h,v 1.3 2001/12/14 19:56:09 dawes Exp $ */
>  
> +_XFUNCPROTOBEGIN
> +
>  /* Representation types */
>  
>  extern	XrmQuark  _XtQString;
> @@ -94,3 +96,4 @@ extern Boolean _XtConvert(
>  
>  void _XtConvertInitialize(void);
>  
> +_XFUNCPROTOEND
> diff --git a/recipes/xorg-lib/xorg-headers-native/X11/Core.h b/recipes/xorg-lib/xorg-headers-native/X11/Core.h
> index ff6cb75..5127b50 100644
> --- a/recipes/xorg-lib/xorg-headers-native/X11/Core.h
> +++ b/recipes/xorg-lib/xorg-headers-native/X11/Core.h
> @@ -53,14 +53,18 @@ SOFTWARE.
>  #ifndef _XtCore_h
>  #define _XtCore_h
>  
> +_XFUNCPROTOBEGIN
> +
>  typedef struct _WidgetClassRec *CoreWidgetClass;
>  typedef struct _WidgetRec *CoreWidget;
>  externalref WidgetClass coreWidgetClass;
>  
> -#ifndef _XT_CORE_C
> +#ifndef VMS
>  externalref WidgetClass widgetClass;
>  
>  #endif
>  
> +_XFUNCPROTOEND
> +
>  #endif /* _XtCore_h */
>  /* DON'T ADD STUFF AFTER THIS #endif */
> diff --git a/recipes/xorg-lib/xorg-headers-native/X11/CoreP.h b/recipes/xorg-lib/xorg-headers-native/X11/CoreP.h
> index e07f085..57836e6 100644
> --- a/recipes/xorg-lib/xorg-headers-native/X11/CoreP.h
> +++ b/recipes/xorg-lib/xorg-headers-native/X11/CoreP.h
> @@ -55,6 +55,8 @@ SOFTWARE.
>  
>  #include <X11/Core.h>
>  
> +_XFUNCPROTOBEGIN
> +
>  externalref int _XtInheritTranslations;
>  
>  #define XtInheritTranslations  ((String) &_XtInheritTranslations)
> @@ -167,5 +169,7 @@ typedef struct _WidgetClassRec {
>  externalref WidgetClassRec widgetClassRec;
>  #define coreClassRec widgetClassRec
>  
> +_XFUNCPROTOEND
> +
>  #endif /* _XtCoreP_h */
>  /* DON'T ADD STUFF AFTER THIS #endif */
> diff --git a/recipes/xorg-lib/xorg-headers-native/X11/CreateI.h b/recipes/xorg-lib/xorg-headers-native/X11/CreateI.h
> index 87abb1d..e0ca9a3 100644
> --- a/recipes/xorg-lib/xorg-headers-native/X11/CreateI.h
> +++ b/recipes/xorg-lib/xorg-headers-native/X11/CreateI.h
> @@ -3,6 +3,8 @@
>  #ifndef _XtcreateI_h
>  #define _XtcreateI_h
>  
> +_XFUNCPROTOBEGIN
> +
>  extern Widget _XtCreateWidget(String name, WidgetClass widget_class,
>  			      Widget parent, ArgList args, Cardinal num_args,
>  			      XtTypedArgList typed_args,
> @@ -18,9 +20,12 @@ extern Widget _XtAppCreateShell(String name, String class,
>  				Cardinal num_typed_args);
>  extern Widget _XtCreateHookObj(Screen *screen);
>  
> +_XFUNCPROTOEND
>  
>  #include <stdarg.h>
>  
> +_XFUNCPROTOBEGIN
> +
>  /* VarCreate.c */
>  extern Widget _XtVaOpenApplication(XtAppContext *app_context_return,
>  			_Xconst char* application_class,
> @@ -34,4 +39,6 @@ extern Widget _XtVaAppInitialize(XtAppContext *app_context_return,
>  			int *argc_in_out, String *argv_in_out,
>  			String *fallback_resources, va_list var_args);
>  
> +_XFUNCPROTOEND
> +
>  #endif /* _XtcreateI_h */
> diff --git a/recipes/xorg-lib/xorg-headers-native/X11/DECkeysym.h b/recipes/xorg-lib/xorg-headers-native/X11/DECkeysym.h
> index 6ab103e..0730716 100644
> --- a/recipes/xorg-lib/xorg-headers-native/X11/DECkeysym.h
> +++ b/recipes/xorg-lib/xorg-headers-native/X11/DECkeysym.h
> @@ -1,5 +1,3 @@
> -/* $Xorg: DECkeysym.h,v 1.4 2001/02/09 02:03:22 xorgcvs Exp $ */
> -
>  /***********************************************************
>  
>  Copyright 1988, 1998  The Open Group
> diff --git a/recipes/xorg-lib/xorg-headers-native/X11/EventI.h b/recipes/xorg-lib/xorg-headers-native/X11/EventI.h
> index 00858e7..d2d1d0f 100644
> --- a/recipes/xorg-lib/xorg-headers-native/X11/EventI.h
> +++ b/recipes/xorg-lib/xorg-headers-native/X11/EventI.h
> @@ -65,6 +65,8 @@ typedef struct _XtGrabRec  *XtGrabList;
>  
>  #include "PassivGraI.h"
>  
> +_XFUNCPROTOBEGIN
> +
>  extern void _XtEventInitialize(
>      void
>  );
> @@ -131,4 +133,6 @@ extern void _XtFillAncestorList(Widget **listPtr, int *maxElemsPtr,
>  /* NextEvent.c */
>  extern Boolean XtAppPeekEvent_SkipTimer;
>  
> +_XFUNCPROTOEND
> +
>  #endif /* _Event_h_ */
> diff --git a/recipes/xorg-lib/xorg-headers-native/X11/HPkeysym.h b/recipes/xorg-lib/xorg-headers-native/X11/HPkeysym.h
> index 2d09277..ed000b1 100644
> --- a/recipes/xorg-lib/xorg-headers-native/X11/HPkeysym.h
> +++ b/recipes/xorg-lib/xorg-headers-native/X11/HPkeysym.h
> @@ -1,4 +1,3 @@
> -/* $Xorg: HPkeysym.h,v 1.5 2001/02/09 02:03:22 xorgcvs Exp $ */
>  /*
>  
>  Copyright 1987, 1998  The Open Group
> diff --git a/recipes/xorg-lib/xorg-headers-native/X11/HookObjI.h b/recipes/xorg-lib/xorg-headers-native/X11/HookObjI.h
> index c9a22a2..c0858c2 100644
> --- a/recipes/xorg-lib/xorg-headers-native/X11/HookObjI.h
> +++ b/recipes/xorg-lib/xorg-headers-native/X11/HookObjI.h
> @@ -29,6 +29,8 @@ in this Software without prior written authorization from The Open Group.
>  #ifndef _XtHookObjI_h
>  #define _XtHookObjI_h
>  
> +_XFUNCPROTOBEGIN
> +
>  /* This object is implementation-dependent and private to the library. */
>  
>  typedef struct _HookObjRec *HookObject;
> @@ -66,6 +68,8 @@ typedef struct _HookObjClassRec {
>  
>  externalref HookObjClassRec hookObjClassRec;
>  
> +_XFUNCPROTOEND
> +
>  #endif /* ifndef _Xt_HookObjI_h */
>  
>  
> diff --git a/recipes/xorg-lib/xorg-headers-native/X11/ImUtil.h b/recipes/xorg-lib/xorg-headers-native/X11/ImUtil.h
> index 89f0381..5b62571 100644
> --- a/recipes/xorg-lib/xorg-headers-native/X11/ImUtil.h
> +++ b/recipes/xorg-lib/xorg-headers-native/X11/ImUtil.h
> @@ -1,4 +1,3 @@
> -/* $XFree86: xc/lib/X11/ImUtil.h,v 1.2 2003/04/15 22:10:07 herrb Exp $ */
>  
>  #ifndef _IMUTIL_H_
>  #define _IMUTIL_H_
> diff --git a/recipes/xorg-lib/xorg-headers-native/X11/InitialI.h b/recipes/xorg-lib/xorg-headers-native/X11/InitialI.h
> index c2fe47c..2ae9b74 100644
> --- a/recipes/xorg-lib/xorg-headers-native/X11/InitialI.h
> +++ b/recipes/xorg-lib/xorg-headers-native/X11/InitialI.h
> @@ -84,6 +84,8 @@ SOFTWARE.
>  #include <X11/Xos.h>
>  #include <X11/Xpoll.h>
>  
> +_XFUNCPROTOBEGIN
> +
>  typedef struct _TimerEventRec {
>          struct timeval        te_timer_value;
>  	struct _TimerEventRec *te_next;
> @@ -426,4 +428,6 @@ extern XrmDatabase _XtPreparseCommandLine(XrmOptionDescRec *urlist,
>  			String *applName, String *displayName,
>  			String *language);
>  
> +_XFUNCPROTOEND
> +
>  #endif /* _XtinitialI_h */
> diff --git a/recipes/xorg-lib/xorg-headers-native/X11/IntrinsicI.h b/recipes/xorg-lib/xorg-headers-native/X11/IntrinsicI.h
> index d749867..d88166f 100644
> --- a/recipes/xorg-lib/xorg-headers-native/X11/IntrinsicI.h
> +++ b/recipes/xorg-lib/xorg-headers-native/X11/IntrinsicI.h
> @@ -194,6 +194,8 @@ SOFTWARE.
>  #define ERRORDB "/usr/lib/X11/XtErrorDB"
>  #endif
>  
> +_XFUNCPROTOBEGIN
> +
>  extern String XtCXtToolkitError;
>  
>  extern void _XtAllocError(
> @@ -257,5 +259,7 @@ extern char* __XtCalloc (
>  #define __XtCalloc XtCalloc
>  #endif
>  
> +_XFUNCPROTOEND
> +
>  #endif /* _XtintrinsicI_h */
>  /* DON'T ADD STUFF AFTER THIS #endif */
> diff --git a/recipes/xorg-lib/xorg-headers-native/X11/Object.h b/recipes/xorg-lib/xorg-headers-native/X11/Object.h
> index 96723b1..5ef65de 100644
> --- a/recipes/xorg-lib/xorg-headers-native/X11/Object.h
> +++ b/recipes/xorg-lib/xorg-headers-native/X11/Object.h
> @@ -50,11 +50,16 @@ SOFTWARE.
>  #ifndef _XtObject_h
>  #define _XtObject_h
>  
> +_XFUNCPROTOBEGIN
> +
>  typedef struct _ObjectRec *Object;
>  typedef struct _ObjectClassRec *ObjectClass;
>  
> -#ifndef OBJECT
> +#ifndef VMS
>  externalref WidgetClass objectClass;
>  #endif
> +
> +_XFUNCPROTOEND
> +
>  #endif /* _XtObject_h */
>  /* DON'T ADD STUFF AFTER THIS #endif */
> diff --git a/recipes/xorg-lib/xorg-headers-native/X11/ObjectP.h b/recipes/xorg-lib/xorg-headers-native/X11/ObjectP.h
> index a24564e..0f484d2 100644
> --- a/recipes/xorg-lib/xorg-headers-native/X11/ObjectP.h
> +++ b/recipes/xorg-lib/xorg-headers-native/X11/ObjectP.h
> @@ -52,6 +52,8 @@ SOFTWARE.
>  
>  #include <X11/Object.h>
>  
> +_XFUNCPROTOBEGIN
> +
>  /**********************************************************
>   * Object Instance Data Structures
>   *
> @@ -132,6 +134,8 @@ typedef struct _ObjectClassRec {
>  
>  externalref ObjectClassRec objectClassRec;
>  
> +_XFUNCPROTOEND
> +
>  #define XtObjectExtensionVersion 1L
>  #define XtInheritAllocate ((XtAllocateProc) _XtInherit)
>  #define XtInheritDeallocate ((XtDeallocateProc) _XtInherit)
> diff --git a/recipes/xorg-lib/xorg-headers-native/X11/PassivGraI.h b/recipes/xorg-lib/xorg-headers-native/X11/PassivGraI.h
> index 02e2964..10591ac 100644
> --- a/recipes/xorg-lib/xorg-headers-native/X11/PassivGraI.h
> +++ b/recipes/xorg-lib/xorg-headers-native/X11/PassivGraI.h
> @@ -60,6 +60,8 @@ in this Software without prior written authorization from The Open Group.
>  #define KEYBOARD TRUE
>  #define POINTER  FALSE
>  
> +_XFUNCPROTOBEGIN
> +
>  typedef enum {
>      XtNoServerGrab, 
>      XtPassiveServerGrab,
> @@ -183,4 +185,6 @@ extern void _XtClearAncestorCache(
>      Widget		/* widget */
>  );
>  
> +_XFUNCPROTOEND
> +
>  #endif /* _PDI_h_ */
> diff --git a/recipes/xorg-lib/xorg-headers-native/X11/RectObj.h b/recipes/xorg-lib/xorg-headers-native/X11/RectObj.h
> index 07615fa..81e43a5 100644
> --- a/recipes/xorg-lib/xorg-headers-native/X11/RectObj.h
> +++ b/recipes/xorg-lib/xorg-headers-native/X11/RectObj.h
> @@ -50,11 +50,16 @@ SOFTWARE.
>  #ifndef _XtRect_h
>  #define _XtRect_h
>  
> +_XFUNCPROTOBEGIN
> +
>  typedef struct _RectObjRec *RectObj;
>  typedef struct _RectObjClassRec *RectObjClass;
>  
> -#ifndef RECTOBJ
> +#ifndef VMS
>  externalref WidgetClass rectObjClass;
>  #endif
> +
> +_XFUNCPROTOEND
> +
>  #endif /* _XtRect_h */
>  /* DON'T ADD STUFF AFTER THIS #endif */
> diff --git a/recipes/xorg-lib/xorg-headers-native/X11/RectObjP.h b/recipes/xorg-lib/xorg-headers-native/X11/RectObjP.h
> index ca3b8ad..d6ffb78 100644
> --- a/recipes/xorg-lib/xorg-headers-native/X11/RectObjP.h
> +++ b/recipes/xorg-lib/xorg-headers-native/X11/RectObjP.h
> @@ -53,6 +53,8 @@ SOFTWARE.
>  #include <X11/RectObj.h>
>  #include <X11/ObjectP.h>
>  
> +_XFUNCPROTOBEGIN
> +
>  /**********************************************************
>   * Rectangle Object Instance Data Structures
>   *
> @@ -126,4 +128,6 @@ typedef struct _RectObjClassRec {
>  
>  externalref RectObjClassRec rectObjClassRec;
>  
> +_XFUNCPROTOEND
> +
>  #endif /*_Xt_RectObjP_h_*/
> diff --git a/recipes/xorg-lib/xorg-headers-native/X11/ResourceI.h b/recipes/xorg-lib/xorg-headers-native/X11/ResourceI.h
> index d6ed1df..3db97f8 100644
> --- a/recipes/xorg-lib/xorg-headers-native/X11/ResourceI.h
> +++ b/recipes/xorg-lib/xorg-headers-native/X11/ResourceI.h
> @@ -61,6 +61,8 @@ SOFTWARE.
>  #define StringToName(string) XrmStringToName(string)
>  #define StringToClass(string) XrmStringToClass(string)
>  
> +_XFUNCPROTOBEGIN
> +
>  extern void _XtDependencies(
>      XtResourceList  * /* class_resp */,
>      Cardinal	    * /* class_num_resp */,
> @@ -96,5 +98,6 @@ extern XrmResourceList* _XtCreateIndirectionTable(XtResourceList resources,
>  						  Cardinal num_resources);
>  extern void _XtResourceListInitialize(void);
>  
> +_XFUNCPROTOEND
>  
>  #endif /* _XtresourceI_h */
> diff --git a/recipes/xorg-lib/xorg-headers-native/X11/ShellP.h b/recipes/xorg-lib/xorg-headers-native/X11/ShellP.h
> index 2b08c3f..7297d33 100644
> --- a/recipes/xorg-lib/xorg-headers-native/X11/ShellP.h
> +++ b/recipes/xorg-lib/xorg-headers-native/X11/ShellP.h
> @@ -67,6 +67,8 @@ SOFTWARE.
>   * *****
>   */
>  
> +_XFUNCPROTOBEGIN
> +
>  /***********************************************************************
>   *
>   * Shell Widget Private Data
> @@ -214,8 +216,12 @@ typedef  struct {
>  	WMShellPart	wm;
>  } WMShellRec, *WMShellWidget;
>  
> +_XFUNCPROTOEND
> +
>  #include <X11/VendorP.h>
>  
> +_XFUNCPROTOBEGIN
> +
>  /***********************************************************************
>   *
>   * TransientShell Widget Private Data
> @@ -425,4 +431,6 @@ typedef  struct {
>  	SessionShellPart session;
>  } SessionShellRec, *SessionShellWidget;
>  
> +_XFUNCPROTOEND
> +
>  #endif /* _XtShellPrivate_h */
> diff --git a/recipes/xorg-lib/xorg-headers-native/X11/Sunkeysym.h b/recipes/xorg-lib/xorg-headers-native/X11/Sunkeysym.h
> index e723444..be1b21d 100644
> --- a/recipes/xorg-lib/xorg-headers-native/X11/Sunkeysym.h
> +++ b/recipes/xorg-lib/xorg-headers-native/X11/Sunkeysym.h
> @@ -1,5 +1,3 @@
> -/* $Xorg: Sunkeysym.h,v 1.4 2001/02/09 02:03:22 xorgcvs Exp $ */
> -
>  /************************************************************
>  
>  Copyright 1991, 1998  The Open Group
> diff --git a/recipes/xorg-lib/xorg-headers-native/X11/ThreadsI.h b/recipes/xorg-lib/xorg-headers-native/X11/ThreadsI.h
> index 1492d77..b1c51e7 100644
> --- a/recipes/xorg-lib/xorg-headers-native/X11/ThreadsI.h
> +++ b/recipes/xorg-lib/xorg-headers-native/X11/ThreadsI.h
> @@ -1,30 +1,27 @@
>  /* $Xorg: ThreadsI.h,v 1.4 2001/02/09 02:03:59 xorgcvs Exp $ */
>  
>  /************************************************************
> -Copyright 1993 by Sun Microsystems, Inc. Mountain View, CA.
> -
> -                    All Rights Reserved
> -
> -Permission  to  use,  copy,  modify,  and  distribute   this
> -software  and  its documentation for any purpose and without
> -fee is hereby granted, provided that the above copyright no-
> -tice  appear  in all copies and that both that copyright no-
> -tice and this permission notice appear in  supporting  docu-
> -mentation,  and  that the name Sun not be used in advertising 
> -or publicity pertaining to distribution  of  the software  
> -without specific prior written permission. Sun makes no 
> -representations about the suitability of this software for 
> -any purpose. It is provided "as is" without any express or 
> -implied warranty.
> -
> -SUN DISCLAIMS ALL WARRANTIES WITH REGARD TO  THIS  SOFTWARE,
> -INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FIT-
> -NESS FOR A PARTICULAR PURPOSE. IN NO EVENT SHALL SUN BE  LI-
> -ABLE  FOR  ANY SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR
> -ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE,  DATA  OR
> -PROFITS,  WHETHER  IN  AN  ACTION OF CONTRACT, NEGLIGENCE OR
> -OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION  WITH
> -THE USE OR PERFORMANCE OF THIS SOFTWARE.
> +
> +Copyright 1993 Sun Microsystems, Inc.  All rights reserved.
> +
> +Permission is hereby granted, free of charge, to any person obtaining a
> +copy of this software and associated documentation files (the "Software"),
> +to deal in the Software without restriction, including without limitation
> +the rights to use, copy, modify, merge, publish, distribute, sublicense,
> +and/or sell copies of the Software, and to permit persons to whom the
> +Software is furnished to do so, subject to the following conditions:
> +
> +The above copyright notice and this permission notice (including the next
> +paragraph) shall be included in all copies or substantial portions of the
> +Software.
> +
> +THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> +IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> +FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> +THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> +LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> +FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> +DEALINGS IN THE SOFTWARE.
>  
>  ********************************************************/
>  
> @@ -81,6 +78,8 @@ typedef void (*ThreadAppRestoreLockProc)(
>      Boolean* /* pushed_thread */
>  );
>  
> +_XFUNCPROTOBEGIN
> +
>  extern void (*_XtProcessLock)(
>      void
>  );
> @@ -93,6 +92,8 @@ extern void (*_XtInitAppLock)(
>      XtAppContext /* app */
>  );
>  
> +_XFUNCPROTOEND
> +
>  #define INIT_APP_LOCK(app) if(_XtInitAppLock) (*_XtInitAppLock)(app)
>  #define FREE_APP_LOCK(app) if(app && app->free_lock)(*app->free_lock)(app)
>  
> @@ -111,7 +112,7 @@ extern void (*_XtInitAppLock)(
>  	XtWidgetToApplicationContext(w) : NULL)
>  
>  #define DPY_TO_APPCON(d) \
> -    XtAppContext app = (_XtProcessLock ? XtDisplayToApplicationContext(d): 0)
> +    XtAppContext app = (_XtProcessLock ? XtDisplayToApplicationContext(d): NULL)
>  
>  #else /* defined(XTHREADS) */
>  
> diff --git a/recipes/xorg-lib/xorg-headers-native/X11/TranslateI.h b/recipes/xorg-lib/xorg-headers-native/X11/TranslateI.h
> index 1224875..6cc3099 100644
> --- a/recipes/xorg-lib/xorg-headers-native/X11/TranslateI.h
> +++ b/recipes/xorg-lib/xorg-headers-native/X11/TranslateI.h
> @@ -342,6 +342,8 @@ typedef struct _TMGlobalRec{
>  #endif /* TRACE_TM */
>  }TMGlobalRec;
>  
> +_XFUNCPROTOBEGIN
> +
>  extern TMGlobalRec _XtGlobalTM;
>  
>  #define TM_MOD_SEGMENT_SIZE 	16
> @@ -604,3 +606,4 @@ extern void _XtUnmergeTranslations(
>  /* TMKey.c */
>  extern void _XtAllocTMContext(XtPerDisplay pd);
>  
> +_XFUNCPROTOEND
> diff --git a/recipes/xorg-lib/xorg-headers-native/X11/VarargsI.h b/recipes/xorg-lib/xorg-headers-native/X11/VarargsI.h
> index e15404a..76ce9bc 100644
> --- a/recipes/xorg-lib/xorg-headers-native/X11/VarargsI.h
> +++ b/recipes/xorg-lib/xorg-headers-native/X11/VarargsI.h
> @@ -34,6 +34,8 @@ in this Software without prior written authorization from The Open Group.
>   
>  /* private routines */
>  
> +_XFUNCPROTOBEGIN
> +
>  extern void _XtCountVaList(
>      va_list /*var*/, int* /*total_count*/, int* /*typed_count*/
>  );
> @@ -62,4 +64,6 @@ extern void _XtGetSubresources(
>      Widget /*w*/, XtPointer /*base*/, const char* /*name*/, const char* /*class*/, XtResourceList /*resources*/, Cardinal /*num_resources*/, ArgList /*args*/, Cardinal /*num_args*/, XtTypedArgList /*typed_args*/, Cardinal /*num_typed_args*/
>  );
>  
> +_XFUNCPROTOEND
> +
>  #endif /* _VarargsI_h_ */
> diff --git a/recipes/xorg-lib/xorg-headers-native/X11/Vendor.h b/recipes/xorg-lib/xorg-headers-native/X11/Vendor.h
> index 65e7c38..633d17a 100644
> --- a/recipes/xorg-lib/xorg-headers-native/X11/Vendor.h
> +++ b/recipes/xorg-lib/xorg-headers-native/X11/Vendor.h
> @@ -65,7 +65,11 @@ SOFTWARE.
>  
>  typedef struct _VendorShellClassRec *VendorShellWidgetClass;
>  
> +_XFUNCPROTOBEGIN
> +
>  externalref WidgetClass vendorShellWidgetClass;
>  
> +_XFUNCPROTOEND
> +
>  #endif /* _XtVendor_h */
>  /* DON'T ADD STUFF AFTER THIS #endif */
> diff --git a/recipes/xorg-lib/xorg-headers-native/X11/VendorP.h b/recipes/xorg-lib/xorg-headers-native/X11/VendorP.h
> index 2e5a975..e60857d 100644
> --- a/recipes/xorg-lib/xorg-headers-native/X11/VendorP.h
> +++ b/recipes/xorg-lib/xorg-headers-native/X11/VendorP.h
> @@ -68,14 +68,12 @@ SOFTWARE.
>  #ifndef  _XtVendorPrivate_h
>  #define _XtVendorPrivate_h
>  
> -#ifdef __cplusplus
> -extern "C" {
> -#endif
> -
>  #include <X11/Vendor.h>
>  
>  /* New fields for the VendorShell widget class record */
>  
> +_XFUNCPROTOBEGIN
> +
>  typedef struct {
>      XtPointer       extension;          /* pointer to extension record      */
>  } VendorShellClassPart;
> @@ -104,8 +102,6 @@ typedef  struct {
>  	VendorShellPart	vendor;
>  } VendorShellRec, *VendorShellWidget;
>  
> -#ifdef __cplusplus
> -}
> -#endif
> +_XFUNCPROTOEND
>  
>  #endif  /* _XtVendorPrivate_h */
> diff --git a/recipes/xorg-lib/xorg-headers-native/X11/X.h b/recipes/xorg-lib/xorg-headers-native/X11/X.h
> index 0a9c501..5cf695d 100644
> --- a/recipes/xorg-lib/xorg-headers-native/X11/X.h
> +++ b/recipes/xorg-lib/xorg-headers-native/X11/X.h
> @@ -1,7 +1,3 @@
> -/*
> - *	$Xorg: X.h,v 1.4 2001/02/09 02:03:22 xorgcvs Exp $
> - */
> -
>  /* Definitions for the X window system likely to be used by applications */
>  
>  #ifndef X_H
> @@ -53,7 +49,6 @@ ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS
>  SOFTWARE.
>  
>  ******************************************************************/
> -/* $XFree86: xc/include/X.h,v 1.6 2003/07/09 15:27:28 tsi Exp $ */
>  
>  #define X_PROTOCOL	11		/* current protocol version */
>  #define X_PROTOCOL_REVISION 0		/* current minor version */
> @@ -216,7 +211,8 @@ are reserved in the protocol for errors and replies. */
>  #define ColormapNotify		32
>  #define ClientMessage		33
>  #define MappingNotify		34
> -#define LASTEvent		35	/* must be bigger than any event # */
> +#define GenericEvent		35
> +#define LASTEvent		36	/* must be bigger than any event # */
>  
>  
>  /* Key masks. Used as modifiers to GrabButton and GrabKey, results of QueryPointer,
> diff --git a/recipes/xorg-lib/xorg-headers-native/X11/XF86keysym.h b/recipes/xorg-lib/xorg-headers-native/X11/XF86keysym.h
> index fdb8fd6..96eefdb 100644
> --- a/recipes/xorg-lib/xorg-headers-native/X11/XF86keysym.h
> +++ b/recipes/xorg-lib/xorg-headers-native/X11/XF86keysym.h
> @@ -1,5 +1,3 @@
> -/* $XFree86: xc/include/XF86keysym.h,v 1.16 2003/02/11 02:51:10 dawes Exp $ */
> -
>  /*
>   * XFree86 vendor specific keysyms.
>   *
> @@ -19,7 +17,7 @@
>  #define XF86XK_ModeLock		0x1008FF01	/* Mode Switch Lock */
>  
>  /*
> - * Note, 0x1008FF02 - 0x1008FF0F are free and should be used for misc new
> + * Note, 0x1008FF07 - 0x1008FF0F are free and should be used for misc new
>   * keysyms that don't fit into any of the groups below.
>   *
>   * 0x1008FF64, 0x1008FF6F, 0x1008FF71, 0x1008FF83 are no longer used,
> @@ -27,147 +25,190 @@
>   *
>   * Check in keysymdef.h for generic symbols before adding new XFree86-specific
>   * symbols here.
> + *
> + * X.Org will not be adding to the XF86 set of keysyms, though they have
> + * been adopted and are considered a "standard" part of X keysym definitions.
> + * XFree86 never properly commented these keysyms, so we have done our
> + * best to explain the semantic meaning of these keys.
> + *
> + * XFree86 has removed their mail archives of the period, that might have
> + * shed more light on some of these definitions. Until/unless we resurrect
> + * these archives, these are from memory and usage.
>   */
>  
>  
> +/* Backlight controls. */
> +#define XF86XK_MonBrightnessUp   0x1008FF02  /* Monitor/panel brightness */
> +#define XF86XK_MonBrightnessDown 0x1008FF03  /* Monitor/panel brightness */
> +#define XF86XK_KbdLightOnOff     0x1008FF04  /* Keyboards may be lit     */
> +#define XF86XK_KbdBrightnessUp   0x1008FF05  /* Keyboards may be lit     */
> +#define XF86XK_KbdBrightnessDown 0x1008FF06  /* Keyboards may be lit     */
> +
>  /*
>   * Keys found on some "Internet" keyboards.
>   */
> -#define XF86XK_Standby		0x1008FF10
> -#define XF86XK_AudioLowerVolume	0x1008FF11
> -#define XF86XK_AudioMute	0x1008FF12
> -#define XF86XK_AudioRaiseVolume	0x1008FF13
> -#define XF86XK_AudioPlay	0x1008FF14
> -#define XF86XK_AudioStop	0x1008FF15
> -#define XF86XK_AudioPrev	0x1008FF16
> -#define XF86XK_AudioNext	0x1008FF17
> -#define XF86XK_HomePage		0x1008FF18
> -#define XF86XK_Mail		0x1008FF19
> -#define XF86XK_Start		0x1008FF1A
> -#define XF86XK_Search		0x1008FF1B
> -#define XF86XK_AudioRecord	0x1008FF1C
> -
> -/* These are sometimes found on PDA's (e.g. Palm, PocketPC or elsewhere) */
> -#define XF86XK_Calculator	0x1008FF1D
> -#define XF86XK_Memo		0x1008FF1E
> -#define XF86XK_ToDoList		0x1008FF1F
> -#define XF86XK_Calendar		0x1008FF20
> -#define XF86XK_PowerDown	0x1008FF21
> -#define XF86XK_ContrastAdjust	0x1008FF22
> -#define XF86XK_RockerUp		0x1008FF23
> -#define XF86XK_RockerDown	0x1008FF24
> -#define XF86XK_RockerEnter	0x1008FF25
> +#define XF86XK_Standby		0x1008FF10   /* System into standby mode   */
> +#define XF86XK_AudioLowerVolume	0x1008FF11   /* Volume control down        */
> +#define XF86XK_AudioMute	0x1008FF12   /* Mute sound from the system */
> +#define XF86XK_AudioRaiseVolume	0x1008FF13   /* Volume control up          */
> +#define XF86XK_AudioPlay	0x1008FF14   /* Start playing of audio >   */
> +#define XF86XK_AudioStop	0x1008FF15   /* Stop playing audio         */
> +#define XF86XK_AudioPrev	0x1008FF16   /* Previous track             */
> +#define XF86XK_AudioNext	0x1008FF17   /* Next track                 */
> +#define XF86XK_HomePage		0x1008FF18   /* Display user's home page   */
> +#define XF86XK_Mail		0x1008FF19   /* Invoke user's mail program */
> +#define XF86XK_Start		0x1008FF1A   /* Start application          */
> +#define XF86XK_Search		0x1008FF1B   /* Search                     */
> +#define XF86XK_AudioRecord	0x1008FF1C   /* Record audio application   */
> +
> +/* These are sometimes found on PDA's (e.g. Palm, PocketPC or elsewhere)   */
> +#define XF86XK_Calculator	0x1008FF1D   /* Invoke calculator program  */
> +#define XF86XK_Memo		0x1008FF1E   /* Invoke Memo taking program */
> +#define XF86XK_ToDoList		0x1008FF1F   /* Invoke To Do List program  */
> +#define XF86XK_Calendar		0x1008FF20   /* Invoke Calendar program    */
> +#define XF86XK_PowerDown	0x1008FF21   /* Deep sleep the system      */
> +#define XF86XK_ContrastAdjust	0x1008FF22   /* Adjust screen contrast     */
> +#define XF86XK_RockerUp		0x1008FF23   /* Rocker switches exist up   */
> +#define XF86XK_RockerDown	0x1008FF24   /* and down                   */
> +#define XF86XK_RockerEnter	0x1008FF25   /* and let you press them     */
>  
>  /* Some more "Internet" keyboard symbols */
> -#define XF86XK_Back		0x1008FF26
> -#define XF86XK_Forward		0x1008FF27
> -#define XF86XK_Stop		0x1008FF28
> -#define XF86XK_Refresh		0x1008FF29
> -#define XF86XK_PowerOff		0x1008FF2A
> -#define XF86XK_WakeUp		0x1008FF2B
> -#define XF86XK_Eject            0x1008FF2C
> -#define XF86XK_ScreenSaver      0x1008FF2D
> -#define XF86XK_WWW              0x1008FF2E
> -#define XF86XK_Sleep            0x1008FF2F
> -#define XF86XK_Favorites	0x1008FF30
> -#define XF86XK_AudioPause	0x1008FF31
> -#define XF86XK_AudioMedia	0x1008FF32
> -#define XF86XK_MyComputer	0x1008FF33
> -#define XF86XK_VendorHome	0x1008FF34
> -#define XF86XK_LightBulb	0x1008FF35
> -#define XF86XK_Shop		0x1008FF36
> -#define XF86XK_History		0x1008FF37
> -#define XF86XK_OpenURL		0x1008FF38
> -#define XF86XK_AddFavorite	0x1008FF39
> -#define XF86XK_HotLinks		0x1008FF3A
> -#define XF86XK_BrightnessAdjust	0x1008FF3B
> -#define XF86XK_Finance		0x1008FF3C
> -#define XF86XK_Community	0x1008FF3D
> -#define XF86XK_AudioRewind	0x1008FF3E
> -#define XF86XK_XF86BackForward	0x1008FF3F
> -#define XF86XK_Launch0		0x1008FF40
> -#define XF86XK_Launch1		0x1008FF41
> -#define XF86XK_Launch2		0x1008FF42
> -#define XF86XK_Launch3		0x1008FF43
> -#define XF86XK_Launch4		0x1008FF44
> -#define XF86XK_Launch5		0x1008FF45
> -#define XF86XK_Launch6		0x1008FF46
> -#define XF86XK_Launch7		0x1008FF47
> -#define XF86XK_Launch8		0x1008FF48
> -#define XF86XK_Launch9		0x1008FF49
> -#define XF86XK_LaunchA		0x1008FF4A
> -#define XF86XK_LaunchB		0x1008FF4B
> -#define XF86XK_LaunchC		0x1008FF4C
> -#define XF86XK_LaunchD		0x1008FF4D
> -#define XF86XK_LaunchE		0x1008FF4E
> -#define XF86XK_LaunchF		0x1008FF4F
> -
> -#define XF86XK_ApplicationLeft	0x1008FF50
> -#define XF86XK_ApplicationRight	0x1008FF51
> -#define XF86XK_Book		0x1008FF52
> -#define XF86XK_CD		0x1008FF53
> -#define XF86XK_Calculater	0x1008FF54
> -#define XF86XK_Clear		0x1008FF55
> -#define XF86XK_Close		0x1008FF56
> -#define XF86XK_Copy		0x1008FF57
> -#define XF86XK_Cut		0x1008FF58
> -#define XF86XK_Display		0x1008FF59
> -#define XF86XK_DOS		0x1008FF5A
> -#define XF86XK_Documents	0x1008FF5B
> -#define XF86XK_Excel		0x1008FF5C
> -#define XF86XK_Explorer		0x1008FF5D
> -#define XF86XK_Game		0x1008FF5E
> -#define XF86XK_Go		0x1008FF5F
> -#define XF86XK_iTouch		0x1008FF60
> -#define XF86XK_LogOff		0x1008FF61
> -#define XF86XK_Market		0x1008FF62
> -#define XF86XK_Meeting		0x1008FF63
> -#define XF86XK_MenuKB		0x1008FF65
> -#define XF86XK_MenuPB		0x1008FF66
> -#define XF86XK_MySites		0x1008FF67
> -#define XF86XK_New		0x1008FF68
> -#define XF86XK_News		0x1008FF69
> -#define XF86XK_OfficeHome	0x1008FF6A
> -#define XF86XK_Open		0x1008FF6B
> -#define XF86XK_Option		0x1008FF6C
> -#define XF86XK_Paste		0x1008FF6D
> -#define XF86XK_Phone		0x1008FF6E
> -#define XF86XK_Q		0x1008FF70
> -#define XF86XK_Reply		0x1008FF72
> -#define XF86XK_Reload		0x1008FF73
> -#define XF86XK_RotateWindows	0x1008FF74
> -#define XF86XK_RotationPB	0x1008FF75
> -#define XF86XK_RotationKB	0x1008FF76
> -#define XF86XK_Save		0x1008FF77
> -#define XF86XK_ScrollUp		0x1008FF78
> -#define XF86XK_ScrollDown	0x1008FF79
> -#define XF86XK_ScrollClick	0x1008FF7A
> -#define XF86XK_Send		0x1008FF7B
> -#define XF86XK_Spell		0x1008FF7C
> -#define XF86XK_SplitScreen	0x1008FF7D
> -#define XF86XK_Support		0x1008FF7E
> -#define XF86XK_TaskPane		0x1008FF7F
> -#define XF86XK_Terminal		0x1008FF80
> -#define XF86XK_Tools		0x1008FF81
> -#define XF86XK_Travel		0x1008FF82
> -#define XF86XK_UserPB		0x1008FF84
> -#define XF86XK_User1KB		0x1008FF85
> -#define XF86XK_User2KB		0x1008FF86
> -#define XF86XK_Video		0x1008FF87
> -#define XF86XK_WheelButton	0x1008FF88
> -#define XF86XK_Word		0x1008FF89
> +#define XF86XK_Back		0x1008FF26   /* Like back on a browser     */
> +#define XF86XK_Forward		0x1008FF27   /* Like forward on a browser  */
> +#define XF86XK_Stop		0x1008FF28   /* Stop current operation     */
> +#define XF86XK_Refresh		0x1008FF29   /* Refresh the page           */
> +#define XF86XK_PowerOff		0x1008FF2A   /* Power off system entirely  */
> +#define XF86XK_WakeUp		0x1008FF2B   /* Wake up system from sleep  */
> +#define XF86XK_Eject            0x1008FF2C   /* Eject device (e.g. DVD)    */
> +#define XF86XK_ScreenSaver      0x1008FF2D   /* Invoke screensaver         */
> +#define XF86XK_WWW              0x1008FF2E   /* Invoke web browser         */
> +#define XF86XK_Sleep            0x1008FF2F   /* Put system to sleep        */
> +#define XF86XK_Favorites	0x1008FF30   /* Show favorite locations    */
> +#define XF86XK_AudioPause	0x1008FF31   /* Pause audio playing        */
> +#define XF86XK_AudioMedia	0x1008FF32   /* Launch media collection app */
> +#define XF86XK_MyComputer	0x1008FF33   /* Display "My Computer" window */
> +#define XF86XK_VendorHome	0x1008FF34   /* Display vendor home web site */
> +#define XF86XK_LightBulb	0x1008FF35   /* Light bulb keys exist       */
> +#define XF86XK_Shop		0x1008FF36   /* Display shopping web site   */
> +#define XF86XK_History		0x1008FF37   /* Show history of web surfing */
> +#define XF86XK_OpenURL		0x1008FF38   /* Open selected URL           */
> +#define XF86XK_AddFavorite	0x1008FF39   /* Add URL to favorites list   */
> +#define XF86XK_HotLinks		0x1008FF3A   /* Show "hot" links            */
> +#define XF86XK_BrightnessAdjust	0x1008FF3B   /* Invoke brightness adj. UI   */
> +#define XF86XK_Finance		0x1008FF3C   /* Display financial site      */
> +#define XF86XK_Community	0x1008FF3D   /* Display user's community    */
> +#define XF86XK_AudioRewind	0x1008FF3E   /* "rewind" audio track        */
> +#define XF86XK_BackForward	0x1008FF3F   /* ??? */
> +#define XF86XK_Launch0		0x1008FF40   /* Launch Application          */
> +#define XF86XK_Launch1		0x1008FF41   /* Launch Application          */
> +#define XF86XK_Launch2		0x1008FF42   /* Launch Application          */
> +#define XF86XK_Launch3		0x1008FF43   /* Launch Application          */
> +#define XF86XK_Launch4		0x1008FF44   /* Launch Application          */
> +#define XF86XK_Launch5		0x1008FF45   /* Launch Application          */
> +#define XF86XK_Launch6		0x1008FF46   /* Launch Application          */
> +#define XF86XK_Launch7		0x1008FF47   /* Launch Application          */
> +#define XF86XK_Launch8		0x1008FF48   /* Launch Application          */
> +#define XF86XK_Launch9		0x1008FF49   /* Launch Application          */
> +#define XF86XK_LaunchA		0x1008FF4A   /* Launch Application          */
> +#define XF86XK_LaunchB		0x1008FF4B   /* Launch Application          */
> +#define XF86XK_LaunchC		0x1008FF4C   /* Launch Application          */
> +#define XF86XK_LaunchD		0x1008FF4D   /* Launch Application          */
> +#define XF86XK_LaunchE		0x1008FF4E   /* Launch Application          */
> +#define XF86XK_LaunchF		0x1008FF4F   /* Launch Application          */
> +
> +#define XF86XK_ApplicationLeft	0x1008FF50   /* switch to application, left */
> +#define XF86XK_ApplicationRight	0x1008FF51   /* switch to application, right*/
> +#define XF86XK_Book		0x1008FF52   /* Launch bookreader           */
> +#define XF86XK_CD		0x1008FF53   /* Launch CD/DVD player        */
> +#define XF86XK_Calculater	0x1008FF54   /* Launch Calculater           */
> +#define XF86XK_Clear		0x1008FF55   /* Clear window, screen        */
> +#define XF86XK_Close		0x1008FF56   /* Close window                */
> +#define XF86XK_Copy		0x1008FF57   /* Copy selection              */
> +#define XF86XK_Cut		0x1008FF58   /* Cut selection               */
> +#define XF86XK_Display		0x1008FF59   /* Output switch key           */
> +#define XF86XK_DOS		0x1008FF5A   /* Launch DOS (emulation)      */
> +#define XF86XK_Documents	0x1008FF5B   /* Open documents window       */
> +#define XF86XK_Excel		0x1008FF5C   /* Launch spread sheet         */
> +#define XF86XK_Explorer		0x1008FF5D   /* Launch file explorer        */
> +#define XF86XK_Game		0x1008FF5E   /* Launch game                 */
> +#define XF86XK_Go		0x1008FF5F   /* Go to URL                   */
> +#define XF86XK_iTouch		0x1008FF60   /* Logitch iTouch- don't use   */
> +#define XF86XK_LogOff		0x1008FF61   /* Log off system              */
> +#define XF86XK_Market		0x1008FF62   /* ??                          */
> +#define XF86XK_Meeting		0x1008FF63   /* enter meeting in calendar   */
> +#define XF86XK_MenuKB		0x1008FF65   /* distingush keyboard from PB */
> +#define XF86XK_MenuPB		0x1008FF66   /* distinuish PB from keyboard */
> +#define XF86XK_MySites		0x1008FF67   /* Favourites                  */
> +#define XF86XK_New		0x1008FF68   /* New (folder, document...    */
> +#define XF86XK_News		0x1008FF69   /* News                        */
> +#define XF86XK_OfficeHome	0x1008FF6A   /* Office home (old Staroffice)*/
> +#define XF86XK_Open		0x1008FF6B   /* Open                        */
> +#define XF86XK_Option		0x1008FF6C   /* ?? */
> +#define XF86XK_Paste		0x1008FF6D   /* Paste                       */
> +#define XF86XK_Phone		0x1008FF6E   /* Launch phone; dial number   */
> +#define XF86XK_Q		0x1008FF70   /* Compaq's Q - don't use      */
> +#define XF86XK_Reply		0x1008FF72   /* Reply e.g., mail            */
> +#define XF86XK_Reload		0x1008FF73   /* Reload web page, file, etc. */
> +#define XF86XK_RotateWindows	0x1008FF74   /* Rotate windows e.g. xrandr  */
> +#define XF86XK_RotationPB	0x1008FF75   /* don't use                   */
> +#define XF86XK_RotationKB	0x1008FF76   /* don't use                   */
> +#define XF86XK_Save		0x1008FF77   /* Save (file, document, state */
> +#define XF86XK_ScrollUp		0x1008FF78   /* Scroll window/contents up   */
> +#define XF86XK_ScrollDown	0x1008FF79   /* Scrool window/contentd down */
> +#define XF86XK_ScrollClick	0x1008FF7A   /* Use XKB mousekeys instead   */
> +#define XF86XK_Send		0x1008FF7B   /* Send mail, file, object     */
> +#define XF86XK_Spell		0x1008FF7C   /* Spell checker               */
> +#define XF86XK_SplitScreen	0x1008FF7D   /* Split window or screen      */
> +#define XF86XK_Support		0x1008FF7E   /* Get support (??)            */
> +#define XF86XK_TaskPane		0x1008FF7F   /* Show tasks */
> +#define XF86XK_Terminal		0x1008FF80   /* Launch terminal emulator    */
> +#define XF86XK_Tools		0x1008FF81   /* toolbox of desktop/app.     */
> +#define XF86XK_Travel		0x1008FF82   /* ?? */
> +#define XF86XK_UserPB		0x1008FF84   /* ?? */
> +#define XF86XK_User1KB		0x1008FF85   /* ?? */
> +#define XF86XK_User2KB		0x1008FF86   /* ?? */
> +#define XF86XK_Video		0x1008FF87   /* Launch video player       */
> +#define XF86XK_WheelButton	0x1008FF88   /* button from a mouse wheel */
> +#define XF86XK_Word		0x1008FF89   /* Launch word processor     */
>  #define XF86XK_Xfer		0x1008FF8A
> -#define XF86XK_ZoomIn		0x1008FF8B
> -#define XF86XK_ZoomOut		0x1008FF8C
> +#define XF86XK_ZoomIn		0x1008FF8B   /* zoom in view, map, etc.   */
> +#define XF86XK_ZoomOut		0x1008FF8C   /* zoom out view, map, etc.  */
> +
> +#define XF86XK_Away		0x1008FF8D   /* mark yourself as away     */
> +#define XF86XK_Messenger	0x1008FF8E   /* as in instant messaging   */
> +#define XF86XK_WebCam		0x1008FF8F   /* Launch web camera app.    */
> +#define XF86XK_MailForward	0x1008FF90   /* Forward in mail           */
> +#define XF86XK_Pictures		0x1008FF91   /* Show pictures             */
> +#define XF86XK_Music		0x1008FF92   /* Launch music application  */
> +
> +#define XF86XK_Battery		0x1008FF93   /* Display battery information */
> +#define XF86XK_Bluetooth	0x1008FF94   /* Enable/disable Bluetooth    */
> +#define XF86XK_WLAN		0x1008FF95   /* Enable/disable WLAN         */
> +#define XF86XK_UWB		0x1008FF96   /* Enable/disable UWB	    */
> +
> +#define XF86XK_AudioForward	0x1008FF97   /* fast-forward audio track    */
> +#define XF86XK_AudioRepeat	0x1008FF98   /* toggle repeat mode          */
> +#define XF86XK_AudioRandomPlay	0x1008FF99   /* toggle shuffle mode         */
> +#define XF86XK_Subtitle		0x1008FF9A   /* cycle through subtitle      */
> +#define XF86XK_AudioCycleTrack	0x1008FF9B   /* cycle through audio tracks  */
> +#define XF86XK_CycleAngle	0x1008FF9C   /* cycle through angles        */
> +#define XF86XK_FrameBack	0x1008FF9D   /* video: go one frame back    */
> +#define XF86XK_FrameForward	0x1008FF9E   /* video: go one frame forward */
> +#define XF86XK_Time		0x1008FF9F   /* display, or shows an entry for time seeking */
> +#define XF86XK_Select		0x1008FFA0   /* Select button on joypads and remotes */
> +#define XF86XK_View		0x1008FFA1   /* Show a view options/properties */
> +#define XF86XK_TopMenu		0x1008FFA2   /* Go to a top-level menu in a video */
> +
> +#define XF86XK_Red		0x1008FFA3   /* Red button                  */
> +#define XF86XK_Green		0x1008FFA4   /* Green button                */
> +#define XF86XK_Yellow		0x1008FFA5   /* Yellow button               */
> +#define XF86XK_Blue             0x1008FFA6   /* Blue button                 */
>  
> -#define XF86XK_Away		0x1008FF8D
> -#define XF86XK_Messenger	0x1008FF8E
> -#define XF86XK_WebCam		0x1008FF8F
> -#define XF86XK_MailForward	0x1008FF90
> -#define XF86XK_Pictures		0x1008FF91
> -#define XF86XK_Music		0x1008FF92
> +#define XF86XK_Suspend		0x1008FFA7   /* Sleep to RAM                */
> +#define XF86XK_Hibernate	0x1008FFA8   /* Sleep to disk               */
>  
>  /* Keys for special action keys (hot keys) */
> +/* Virtual terminals on some operating systems */
>  #define XF86XK_Switch_VT_1	0x1008FE01
>  #define XF86XK_Switch_VT_2	0x1008FE02
>  #define XF86XK_Switch_VT_3	0x1008FE03
> @@ -181,8 +222,8 @@
>  #define XF86XK_Switch_VT_11	0x1008FE0B
>  #define XF86XK_Switch_VT_12	0x1008FE0C
>  
> -#define XF86XK_Ungrab		0x1008FE20
> -#define XF86XK_ClearGrab	0x1008FE21
> -#define XF86XK_Next_VMode	0x1008FE22
> -#define XF86XK_Prev_VMode	0x1008FE23
> +#define XF86XK_Ungrab		0x1008FE20   /* force ungrab               */
> +#define XF86XK_ClearGrab	0x1008FE21   /* kill application with grab */
> +#define XF86XK_Next_VMode	0x1008FE22   /* next video mode available  */
> +#define XF86XK_Prev_VMode	0x1008FE23   /* prev. video mode available */
>  
> diff --git a/recipes/xorg-lib/xorg-headers-native/X11/XKBlib.h b/recipes/xorg-lib/xorg-headers-native/X11/XKBlib.h
> index 6a5dc8a..291fc05 100644
> --- a/recipes/xorg-lib/xorg-headers-native/X11/XKBlib.h
> +++ b/recipes/xorg-lib/xorg-headers-native/X11/XKBlib.h
> @@ -1,4 +1,3 @@
> -/* $Xorg: XKBlib.h,v 1.6 2000/08/17 19:45:03 cpqbld Exp $ */
>  /************************************************************
>  Copyright (c) 1993 by Silicon Graphics Computer Systems, Inc.
>  
> @@ -7,24 +6,23 @@ software and its documentation for any purpose and without
>  fee is hereby granted, provided that the above copyright
>  notice appear in all copies and that both that copyright
>  notice and this permission notice appear in supporting
> -documentation, and that the name of Silicon Graphics not be 
> -used in advertising or publicity pertaining to distribution 
> +documentation, and that the name of Silicon Graphics not be
> +used in advertising or publicity pertaining to distribution
>  of the software without specific prior written permission.
> -Silicon Graphics makes no representation about the suitability 
> +Silicon Graphics makes no representation about the suitability
>  of this software for any purpose. It is provided "as is"
>  without any express or implied warranty.
>  
> -SILICON GRAPHICS DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS 
> -SOFTWARE, INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY 
> +SILICON GRAPHICS DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS
> +SOFTWARE, INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
>  AND FITNESS FOR A PARTICULAR PURPOSE. IN NO EVENT SHALL SILICON
> -GRAPHICS BE LIABLE FOR ANY SPECIAL, INDIRECT OR CONSEQUENTIAL 
> -DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, 
> -DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE 
> +GRAPHICS BE LIABLE FOR ANY SPECIAL, INDIRECT OR CONSEQUENTIAL
> +DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE,
> +DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE
>  OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION  WITH
>  THE USE OR PERFORMANCE OF THIS SOFTWARE.
>  
>  ********************************************************/
> -/* $XFree86: xc/lib/X11/XKBlib.h,v 3.5 2003/04/17 02:06:31 dawes Exp $ */
>  
>  #ifndef _XKBLIB_H_
>  #define _XKBLIB_H_
> @@ -78,7 +76,7 @@ typedef struct _XkbMapNotifyEvent {
>  	KeyCode		first_key_act;
>  	KeyCode		first_key_behavior;
>  	KeyCode		first_key_explicit;
> -	KeyCode		first_modmap_key;  
> +	KeyCode		first_modmap_key;
>  	KeyCode		first_vmodmap_key;
>  	int		num_key_syms;
>  	int		num_key_acts;
> @@ -215,7 +213,7 @@ typedef struct _XkbActionMessage {
>  	Bool 		key_event_follows;/* true if key event also generated */
>  	int		group;		/* effective group */
>  	unsigned int	mods;		/* effective mods */
> -	char 		message[XkbActionMessageLength+1]; 
> +	char 		message[XkbActionMessageLength+1];
>  					/* message -- leave space for NUL */
>  } XkbActionMessageEvent;
>  
> @@ -241,8 +239,8 @@ typedef struct _XkbExtensionDeviceNotify {
>  	Time 		time;		/* milliseconds */
>  	int 		xkb_type;	/* XkbExtensionDeviceNotify */
>  	int	 	device;		/* device ID */
> -	unsigned int	reason;		/* reason for the event */	
> -	unsigned int	supported;	/* mask of supported features */	
> +	unsigned int	reason;		/* reason for the event */
> +	unsigned int	supported;	/* mask of supported features */
>  	unsigned int	unsupported;	/* mask of unsupported features */
>  					/* that some app tried to use */
>  	int	 	first_btn;	/* first button that changed */
> @@ -531,7 +529,7 @@ extern	Bool	 XkbSetIndicatorMap(
>  #define	XkbNoteIndicatorStateChanges(o,n,w)\
>  				((o)->state_changes|=((n)->state_changes&(w)))
>  #define	XkbGetIndicatorMapChanges(d,x,c) \
> -				(XkbGetIndicatorMap((d),(c)->map_changes,x)
> +				(XkbGetIndicatorMap((d),(c)->map_changes,x))
>  #define	XkbChangeIndicatorMaps(d,x,c) \
>  				(XkbSetIndicatorMap((d),(c)->map_changes,x))
>  
> diff --git a/recipes/xorg-lib/xorg-headers-native/X11/XWDFile.h b/recipes/xorg-lib/xorg-headers-native/X11/XWDFile.h
> index 0ce22e1..50e17df 100644
> --- a/recipes/xorg-lib/xorg-headers-native/X11/XWDFile.h
> +++ b/recipes/xorg-lib/xorg-headers-native/X11/XWDFile.h
> @@ -1,4 +1,3 @@
> -/* $Xorg: XWDFile.h,v 1.4 2001/02/09 02:03:22 xorgcvs Exp $ */
>  /*
>  
>  Copyright 1985, 1986, 1998  The Open Group
> diff --git a/recipes/xorg-lib/xorg-headers-native/X11/Xalloca.h b/recipes/xorg-lib/xorg-headers-native/X11/Xalloca.h
> index 67f2671..1919884 100644
> --- a/recipes/xorg-lib/xorg-headers-native/X11/Xalloca.h
> +++ b/recipes/xorg-lib/xorg-headers-native/X11/Xalloca.h
> @@ -1,5 +1,3 @@
> -/* $Xorg: Xalloca.h,v 1.4 2001/02/09 02:03:22 xorgcvs Exp $ */
> -
>  /*
>  
>  Copyright 1995, 1998  The Open Group
> @@ -27,8 +25,6 @@ other dealings in this Software without prior written authorization
>  from The Open Group.
>  
>  */
> -/* $XFree86: xc/include/Xalloca.h,v 3.10 2001/12/14 19:53:25 dawes Exp $ */
> -
>  /*
>   * The purpose of this header is to define the macros ALLOCATE_LOCAL and
>   * DEALLOCATE_LOCAL appropriately for the platform being compiled on.
> @@ -62,7 +58,8 @@ from The Open Group.
>  #define XALLOCA_H 1
>  
>  #ifndef INCLUDE_ALLOCA_H
> -# if defined(__SUNPRO_C)  /* Need to add more here to match Imake *.cf's */
> +/* Need to add more here to match Imake *.cf's */
> +# if defined(HAVE_ALLOCA_H) || defined(__SUNPRO_C) || defined(__SUNPRO_CC)
>  #  define INCLUDE_ALLOCA_H
>  # endif
>  #endif
> @@ -77,19 +74,6 @@ from The Open Group.
>   * If you want something other than (DE)ALLOCATE_LOCAL_FALLBACK
>   * for ALLOCATE/DEALLOCATE_LOCAL then you add that in here.
>   */
> -#  if defined(__HIGHC__)
> -#    ifndef NCR
> -       extern char *alloca();
> -#      if HCVERSION < 21003
> -#        define ALLOCATE_LOCAL(size)	alloca((int)(size))
> -         pragma on(alloca);
> -#      else /* HCVERSION >= 21003 */
> -#        define	ALLOCATE_LOCAL(size)	_Alloca((int)(size))
> -#      endif /* HCVERSION < 21003 */
> -#    else /* NCR */
> -#      define ALLOCATE_LOCAL(size)	alloca(size)
> -#    endif
> -#  endif /* defined(__HIGHC__) */
>  
>  
>  #  ifdef __GNUC__
> @@ -104,26 +88,18 @@ from The Open Group.
>   * Test is easy, the new one is named __builtin_alloca and comes
>   * from alloca.h which #defines alloca.
>   */
> -#    ifndef NCR
> -#      if defined(vax) || defined(sun) || defined(apollo) || defined(stellar) || defined(alloca)
> +#      if defined(__sun) || defined(alloca)
>  /*
>   * Some System V boxes extract alloca.o from /lib/libPW.a; if you
>   * decide that you don't want to use alloca, you might want to fix it here.
>   */
>  /* alloca might be a macro taking one arg (hi, Sun!), so give it one. */
> -#        ifndef __sgi			/* IRIX 5/6 has definition */
> -#         ifndef __QNX__
> +#        if !defined(__cplusplus)
>  #          define __Xnullarg		/* as nothing */
> -#          ifndef X_NOT_STDC_ENV
> -             extern void *alloca(__Xnullarg);
> -#          else
> -             extern char *alloca(__Xnullarg);
> -#          endif
> -#         endif /* __QNX__ */
> -#        endif /* __sgi */
> +           extern void *alloca(__Xnullarg);
> +#        endif
>  #        define ALLOCATE_LOCAL(size) alloca((int)(size))
>  #      endif /* who does alloca */
> -#    endif /* NCR */
>  #  endif /* __GNUC__ */
>  
>  #endif /* NO_ALLOCA */
> diff --git a/recipes/xorg-lib/xorg-headers-native/X11/Xarch.h b/recipes/xorg-lib/xorg-headers-native/X11/Xarch.h
> index 6e04e53..58fb9a5 100644
> --- a/recipes/xorg-lib/xorg-headers-native/X11/Xarch.h
> +++ b/recipes/xorg-lib/xorg-headers-native/X11/Xarch.h
> @@ -1,5 +1,5 @@
>  #ifndef _XARCH_H_
> -#define _XARCH_H_
> +# define _XARCH_H_
>  
>  /*
>   * Copyright 1997 Metro Link Incorporated
> @@ -25,7 +25,6 @@
>   * IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING
>   * OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
>   */
> -/* $XFree86: xc/include/Xarch.h,v 1.10tsi Exp $ */
>  
>  
>  /*
> @@ -33,94 +32,62 @@
>   */
>  
>  /* See if it is set in the imake config first */
> -#ifdef X_BYTE_ORDER
> +# ifdef X_BYTE_ORDER
>  
> -#define X_BIG_ENDIAN 4321
> -#define X_LITTLE_ENDIAN 1234
> +#  define X_BIG_ENDIAN 4321
> +#  define X_LITTLE_ENDIAN 1234
>  
> -#else
> +# else
>  
> -#ifdef SVR4
> -#if defined(NCR) || defined(Mips) || defined(__sgi)
> -#include <sys/endian.h>
> -#else
> -#if !defined(sun)
> -#include <sys/byteorder.h>
> -#endif
> -#endif
> -#elif defined(CSRG_BASED)
> -#if defined(__NetBSD__) || defined(__OpenBSD__)
> -#include <sys/types.h>
> -#endif
> -#include <machine/endian.h>
> -#elif defined(linux)
> -#if defined __STRICT_ANSI__
> -#undef __STRICT_ANSI__
> -#include <endian.h>
> -#define __STRICT_ANSI__
> -#else
> -#include <endian.h>
> -#endif
> +#  if defined(SVR4) || defined(__SVR4)
> +#   include <sys/byteorder.h>
> +#  elif defined(CSRG_BASED)
> +#   if defined(__NetBSD__) || defined(__OpenBSD__)
> +#    include <sys/types.h>
> +#   endif
> +#   include <machine/endian.h>
> +#  elif defined(linux)
> +#   if defined __STRICT_ANSI__
> +#    undef __STRICT_ANSI__
> +#    include <endian.h>
> +#    define __STRICT_ANSI__
> +#   else
> +#    include <endian.h>
> +#   endif
>  /* 'endian.h' might have been included before 'Xarch.h' */
> -#if !defined(LITTLE_ENDIAN) && defined(__LITTLE_ENDIAN)
> -#define LITTLE_ENDIAN __LITTLE_ENDIAN
> -#endif
> -#if !defined(BIG_ENDIAN) && defined(__BIG_ENDIAN)
> -#define BIG_ENDIAN __BIG_ENDIAN
> -#endif
> -#if !defined(PDP_ENDIAN) && defined(__PDP_ENDIAN)
> -#define PDP_ENDIAN __PDP_ENDIAN
> -#endif
> -#if !defined(BYTE_ORDER) && defined(__BYTE_ORDER)
> -#define BYTE_ORDER __BYTE_ORDER
> -#endif
> -#elif defined(Lynx)
> -#if 0
> -/* LynxOS 2.4.0 has wrong defines in bsd/ip.h */
> -#include <bsd/in.h>
> -#include <bsd/in_systm.h>
> -#include <bsd/ip.h>
> -#endif
> -#endif
> +#   if !defined(LITTLE_ENDIAN) && defined(__LITTLE_ENDIAN)
> +#    define LITTLE_ENDIAN __LITTLE_ENDIAN
> +#   endif
> +#   if !defined(BIG_ENDIAN) && defined(__BIG_ENDIAN)
> +#    define BIG_ENDIAN __BIG_ENDIAN
> +#   endif
> +#   if !defined(PDP_ENDIAN) && defined(__PDP_ENDIAN)
> +#    define PDP_ENDIAN __PDP_ENDIAN
> +#   endif
> +#   if !defined(BYTE_ORDER) && defined(__BYTE_ORDER)
> +#    define BYTE_ORDER __BYTE_ORDER
> +#   endif
> +#  endif
>  
> -#ifndef BYTE_ORDER
> -#define LITTLE_ENDIAN 1234
> -#define BIG_ENDIAN    4321
> +#  ifndef BYTE_ORDER
> +#   define LITTLE_ENDIAN 1234
> +#   define BIG_ENDIAN    4321
>  
> -#if defined(__QNX__) && !defined(__QNXNTO__)
> -#define BYTE_ORDER LITTLE_ENDIAN
> -#endif
> +#   if defined(__sun) && defined(__SVR4)
> +#    include <sys/isa_defs.h>
> +#    ifdef _LITTLE_ENDIAN
> +#     define BYTE_ORDER LITTLE_ENDIAN
> +#    endif
> +#    ifdef _BIG_ENDIAN
> +#     define BYTE_ORDER BIG_ENDIAN
> +#    endif
> +#   endif /* sun */
> +#  endif /* BYTE_ORDER */
>  
> -#if defined(__QNXNTO__)
> -#if defined(i386) || defined(__i386__) || defined(__x86__)
> -#define BYTE_ORDER LITTLE_ENDIAN
> -#else
> -#define BYTE_ORDER BIG_ENDIAN
> -#endif
> -#endif
> +#  define X_BYTE_ORDER BYTE_ORDER
> +#  define X_BIG_ENDIAN BIG_ENDIAN
> +#  define X_LITTLE_ENDIAN LITTLE_ENDIAN
>  
> -#ifdef Lynx
> -#if defined(i386) || defined(__i386__) || defined(__x86__)
> -#define BYTE_ORDER LITTLE_ENDIAN
> -#else
> -#define BYTE_ORDER BIG_ENDIAN
> -#endif
> -#endif
> -#if (defined(sun) && defined(SVR4)) && !defined(Lynx)
> -#include <sys/isa_defs.h>
> -#ifdef _LITTLE_ENDIAN
> -#define BYTE_ORDER LITTLE_ENDIAN
> -#endif
> -#ifdef _BIG_ENDIAN
> -#define BYTE_ORDER BIG_ENDIAN
> -#endif
> -#endif /* sun */
> -#endif /* BYTE_ORDER */
> -
> -#define X_BYTE_ORDER BYTE_ORDER
> -#define X_BIG_ENDIAN BIG_ENDIAN
> -#define X_LITTLE_ENDIAN LITTLE_ENDIAN
> -
> -#endif /* not in imake config */
> +# endif /* not in imake config */
>  
>  #endif /* _XARCH_H_ */
> diff --git a/recipes/xorg-lib/xorg-headers-native/X11/Xauth.h b/recipes/xorg-lib/xorg-headers-native/X11/Xauth.h
> index 181618a..ace975d 100644
> --- a/recipes/xorg-lib/xorg-headers-native/X11/Xauth.h
> +++ b/recipes/xorg-lib/xorg-headers-native/X11/Xauth.h
> @@ -128,23 +128,6 @@ void XauDisposeAuth(
>  Xauth*		/* auth */
>  );
>  
> -#ifdef K5AUTH
> -#include <krb5/krb5.h>
> -/* 9/93: krb5.h leaks some symbols */
> -#undef BITS32
> -#undef xfree
> -
> -int XauKrb5Encode(
> -     krb5_principal	/* princ */,
> -     krb5_data *	/* outbuf */
> -);
> -
> -int XauKrb5Decode(
> -     krb5_data		/* inbuf */,
> -     krb5_principal *	/* princ */
> -);
> -#endif /* K5AUTH */
> -
>  _XFUNCPROTOEND
>  
>  /* Return values from XauLockAuth */
> diff --git a/recipes/xorg-lib/xorg-headers-native/X11/Xcms.h b/recipes/xorg-lib/xorg-headers-native/X11/Xcms.h
> index 779bc52..cea11ab 100644
> --- a/recipes/xorg-lib/xorg-headers-native/X11/Xcms.h
> +++ b/recipes/xorg-lib/xorg-headers-native/X11/Xcms.h
> @@ -1,9 +1,8 @@
> -/* $Xorg: Xcms.h,v 1.6 2000/08/17 19:45:04 cpqbld Exp $ */
>  
>  /*
>   * Code and supporting documentation (c) Copyright 1990 1991 Tektronix, Inc.
>   * 	All Rights Reserved
> - * 
> + *
>   * This file is a component of an X Window System-specific implementation
>   * of Xcms based on the TekColor Color Management System.  Permission is
>   * hereby granted to use, copy, modify, sell, and otherwise distribute this
> @@ -11,10 +10,10 @@
>   * that this copyright, permission, and disclaimer notice is reproduced in
>   * all copies of this software and in supporting documentation.  TekColor
>   * is a trademark of Tektronix, Inc.
> - * 
> + *
>   * Tektronix makes no representation about the suitability of this software
>   * for any purpose.  It is provided "as is" and with all faults.
> - * 
> + *
>   * TEKTRONIX DISCLAIMS ALL WARRANTIES APPLICABLE TO THIS SOFTWARE,
>   * INCLUDING THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
>   * PARTICULAR PURPOSE.  IN NO EVENT SHALL TEKTRONIX BE LIABLE FOR ANY
> @@ -27,7 +26,6 @@
>   *	DESCRIPTION
>   *		Public include file for X Color Management System
>   */
> -/* $XFree86: xc/lib/X11/Xcms.h,v 1.7 2003/11/03 03:46:26 dawes Exp $ */
>  #ifndef _XCMS_H_
>  #define _XCMS_H_
>  
> @@ -252,7 +250,7 @@ typedef void (*XcmsScreenFreeProc)(
>   * XXX:  The use of the XcmsConversionProc type is broken.  The
>   *       device-independent colour conversion code uses it as:
>  
> -typedef Status (*XcmsConversionProc)(XcmsCCC, XcmsColor *, XcmsColor *, 
> +typedef Status (*XcmsConversionProc)(XcmsCCC, XcmsColor *, XcmsColor *,
>  				     unsigned int);
>  
>   *       while the device-dependent code uses it as:
> diff --git a/recipes/xorg-lib/xorg-headers-native/X11/Xdefs.h b/recipes/xorg-lib/xorg-headers-native/X11/Xdefs.h
> index 5ee2d89..46ffdad 100644
> --- a/recipes/xorg-lib/xorg-headers-native/X11/Xdefs.h
> +++ b/recipes/xorg-lib/xorg-headers-native/X11/Xdefs.h
> @@ -1,5 +1,3 @@
> -/* $XFree86: xc/include/Xdefs.h,v 1.2 1999/08/22 06:21:20 dawes Exp $ */
> -
>  /***********************************************************
>  
>  Copyright (c) 1999  The XFree86 Project Inc.
> diff --git a/recipes/xorg-lib/xorg-headers-native/X11/Xdmcp.h b/recipes/xorg-lib/xorg-headers-native/X11/Xdmcp.h
> index 6d7619a..2548485 100644
> --- a/recipes/xorg-lib/xorg-headers-native/X11/Xdmcp.h
> +++ b/recipes/xorg-lib/xorg-headers-native/X11/Xdmcp.h
> @@ -1,4 +1,4 @@
> -/* $XdotOrg: lib/Xdmcp/include/X11/Xdmcp.h,v 1.3 2005/07/03 07:00:56 daniels Exp $ */
> +/* $XdotOrg: xc/lib/Xdmcp/Xdmcp.h,v 1.2 2004/04/23 18:43:41 eich Exp $ */
>  /* $Xorg: Xdmcp.h,v 1.7 2001/04/13 14:43:00 steve Exp $ */
>  /*
>   * Copyright 1989 Network Computing Devices, Inc., Mountain View, California.
> diff --git a/recipes/xorg-lib/xorg-headers-native/X11/Xfuncproto.h b/recipes/xorg-lib/xorg-headers-native/X11/Xfuncproto.h
> index 7b2b7ca..22bb799 100644
> --- a/recipes/xorg-lib/xorg-headers-native/X11/Xfuncproto.h
> +++ b/recipes/xorg-lib/xorg-headers-native/X11/Xfuncproto.h
> @@ -1,5 +1,4 @@
> -/* Xfuncproto.h.  Generated by configure.  */
> -/* $Xorg: Xfuncproto.h,v 1.4 2001/02/09 02:03:22 xorgcvs Exp $ */
> +/* Xfuncproto.h.  Generated from Xfuncproto.h.in by configure.  */
>  /*
>   *
>  Copyright 1989, 1991, 1998  The Open Group
> @@ -25,7 +24,6 @@ used in advertising or otherwise to promote the sale, use or other dealings
>  in this Software without prior written authorization from The Open Group.
>   *
>   */
> -/* $XFree86: xc/include/Xfuncproto.h,v 3.4 2001/12/14 19:53:25 dawes Exp $ */
>  
>  /* Definitions to make function prototypes manageable */
>  
> @@ -52,7 +50,7 @@ in this Software without prior written authorization from The Open Group.
>  
>  /* Function prototype configuration (see configure for more info) */
>  #ifndef NARROWPROTO
> -#define NARROWPROTO 
> +#define NARROWPROTO /**/
>  #endif
>  #ifndef FUNCPROTO
>  #define FUNCPROTO 15
> @@ -86,7 +84,7 @@ in this Software without prior written authorization from The Open Group.
>  # define _X_ATTRIBUTE_PRINTF(x,y)
>  #endif /* GNUC >= 4 */
>  
> -#if defined(__GNUC__) && ((__GNUC__ * 100 + __GNUC_MINOR__) >= 303)
> +#if defined(__GNUC__) && (__GNUC__ >= 4)
>  # define _X_EXPORT      __attribute__((visibility("default")))
>  # define _X_HIDDEN      __attribute__((visibility("hidden")))
>  # define _X_INTERNAL    __attribute__((visibility("internal")))
> @@ -94,10 +92,24 @@ in this Software without prior written authorization from The Open Group.
>  # define _X_EXPORT      __global
>  # define _X_HIDDEN      __hidden
>  # define _X_INTERNAL    __hidden
> -#else /* not gcc >= 3.3 and not Sun Studio >= 8 */
> +#else /* not gcc >= 4 and not Sun Studio >= 8 */
>  # define _X_EXPORT
>  # define _X_HIDDEN
>  # define _X_INTERNAL
> +#endif /* GNUC >= 4 */
> +
> +#if defined(__GNUC__) && ((__GNUC__ * 100 + __GNUC_MINOR__) >= 303)
> +# define _X_LIKELY(x)   __builtin_expect(!!(x), 1)
> +# define _X_UNLIKELY(x) __builtin_expect(!!(x), 0)
> +# define _X_INLINE      inline
> +#elif defined(__SUNPRO_C) && (__SUNPRO_C >= 0x550)
> +# define _X_LIKELY(x)   (x)
> +# define _X_UNLIKELY(x) (x)
> +# define _X_INLINE      inline
> +#else /* not gcc >= 3.3 and not Sun Studio >= 8 */
> +# define _X_LIKELY(x)   (x)
> +# define _X_UNLIKELY(x) (x)
> +# define _X_INLINE
>  #endif
>  
>  #if defined(__GNUC__) && ((__GNUC__ * 100 + __GNUC_MINOR__) >= 301)
> diff --git a/recipes/xorg-lib/xorg-headers-native/X11/Xfuncs.h b/recipes/xorg-lib/xorg-headers-native/X11/Xfuncs.h
> index ca9d29e..354b663 100644
> --- a/recipes/xorg-lib/xorg-headers-native/X11/Xfuncs.h
> +++ b/recipes/xorg-lib/xorg-headers-native/X11/Xfuncs.h
> @@ -1,7 +1,4 @@
>  /*
> - * $XdotOrg: proto/X11/Xfuncs.h,v 1.4 2005/11/08 06:33:25 jkj Exp $
> - * $Xorg: Xfuncs.h,v 1.4 2001/02/09 02:03:22 xorgcvs Exp $
> - * 
>   * 
>  Copyright 1990, 1998  The Open Group
>  
> @@ -26,69 +23,47 @@ used in advertising or otherwise to promote the sale, use or other dealings
>  in this Software without prior written authorization from The Open Group.
>   *
>   */
> -/* $XFree86: xc/include/Xfuncs.h,v 3.10 2002/05/31 18:45:38 dawes Exp $ */
>  
>  #ifndef _XFUNCS_H_
> -#define _XFUNCS_H_
> +# define _XFUNCS_H_
>  
> -#include <X11/Xosdefs.h>
> +# include <X11/Xosdefs.h>
>  
>  /* the old Xfuncs.h, for pre-R6 */
> -#if !(defined(XFree86LOADER) && defined(IN_MODULE))
> +# if !(defined(XFree86LOADER) && defined(IN_MODULE))
>  
> -#ifdef X_USEBFUNCS
> +#  ifdef X_USEBFUNCS
>  void bcopy();
>  void bzero();
>  int bcmp();
> -#else
> -#if defined(SYSV) && !defined(__SCO__) && !defined(sun) && !defined(__UNIXWARE__)
> -#include <memory.h>
> +#  else
> +#   if defined(SYSV) && !defined(__SCO__) && !defined(__sun) && !defined(__UNIXWARE__)
> +#    include <memory.h>
>  void bcopy();
> -#define bzero(b,len) memset(b, 0, len)
> -#define bcmp(b1,b2,len) memcmp(b1, b2, len)
> -#else
> -#include <string.h>
> -#if defined(__SCO__) || defined(sun) || defined(__UNIXWARE__)
> -#include <strings.h>
> -#endif
> -#define _XFUNCS_H_INCLUDED_STRING_H
> -#if defined(sun)
> -#define bcopy(b1,b2,len) memmove(b2, b1, (size_t)(len))
> -#define bzero(b,len) memset(b, 0, (size_t)(len))
> -#define bcmp(b1,b2,len) memcmp(b1, b2, (size_t)(len))
> -#endif
> -#endif
> -#endif /* X_USEBFUNCS */
> +#    define bzero(b,len) memset(b, 0, len)
> +#    define bcmp(b1,b2,len) memcmp(b1, b2, len)
> +#   else
> +#    include <string.h>
> +#    if defined(__SCO__) || defined(__sun) || defined(__UNIXWARE__)
> +#     include <strings.h>
> +#    endif
> +#    define _XFUNCS_H_INCLUDED_STRING_H
> +#   endif
> +#  endif /* X_USEBFUNCS */
>  
>  /* the new Xfuncs.h */
>  
> -#if !defined(X_NOT_STDC_ENV) && (!defined(sun) || defined(SVR4))
>  /* the ANSI C way */
> -#ifndef _XFUNCS_H_INCLUDED_STRING_H
> -#include <string.h>
> -#endif
> -#undef bzero
> -#define bzero(b,len) memset(b,0,len)
> -#else /* else X_NOT_STDC_ENV or SunOS 4 */
> -#if defined(SYSV) || defined(luna) || defined(sun) || defined(__sxg__)
> -#include <memory.h>
> -#define memmove(dst,src,len) bcopy((char *)(src),(char *)(dst),(int)(len))
> -#if defined(SYSV) && defined(_XBCOPYFUNC)
> -#undef memmove
> -#define memmove(dst,src,len) _XBCOPYFUNC((char *)(src),(char *)(dst),(int)(len))
> -#define _XNEEDBCOPYFUNC
> -#endif
> -#else /* else vanilla BSD */
> -#define memmove(dst,src,len) bcopy((char *)(src),(char *)(dst),(int)(len))
> -#define memcpy(dst,src,len) bcopy((char *)(src),(char *)(dst),(int)(len))
> -#define memcmp(b1,b2,len) bcmp((char *)(b1),(char *)(b2),(int)(len))
> -#endif /* SYSV else */
> -#endif /* ! X_NOT_STDC_ENV else */
> +#  ifndef _XFUNCS_H_INCLUDED_STRING_H
> +#   include <string.h>
> +#  endif
> +#  undef bzero
> +#  define bzero(b,len) memset(b,0,len)
>  
> -#if defined(X_NOT_STDC_ENV) || (defined(sun) && !defined(SVR4))
> -#define atexit(f) on_exit(f, 0)
> -#endif
> +#  if defined WIN32 && defined __MINGW32__
> +#   define bcopy(b1,b2,len) memmove(b2, b1, (size_t)(len))
> +#  endif
>  
> -#endif /* !(defined(XFree86LOADER) && defined(IN_MODULE)) */
> +# endif /* !(defined(XFree86LOADER) && defined(IN_MODULE)) */
>  
>  #endif /* _XFUNCS_H_ */
> diff --git a/recipes/xorg-lib/xorg-headers-native/X11/Xlib.h b/recipes/xorg-lib/xorg-headers-native/X11/Xlib.h
> index a26789b..7c8bc51 100644
> --- a/recipes/xorg-lib/xorg-headers-native/X11/Xlib.h
> +++ b/recipes/xorg-lib/xorg-headers-native/X11/Xlib.h
> @@ -1,6 +1,4 @@
> -/* $XdotOrg: lib/X11/include/X11/Xlib.h,v 1.6 2005-11-08 06:33:25 jkj Exp $ */
> -/* $Xorg: Xlib.h,v 1.6 2001/02/09 02:03:38 xorgcvs Exp $ */
> -/* 
> +/*
>  
>  Copyright 1985, 1986, 1987, 1991, 1998  The Open Group
>  
> @@ -25,7 +23,6 @@ used in advertising or otherwise to promote the sale, use or other dealings
>  in this Software without prior written authorization from The Open Group.
>  
>  */
> -/* $XFree86: xc/lib/X11/Xlib.h,v 3.25 2003/11/17 22:20:10 dawes Exp $ */
>  
>  
>  /*
> @@ -38,20 +35,7 @@ in this Software without prior written authorization from The Open Group.
>  
>  #define XlibSpecificationRelease 6
>  
> -#ifdef USG
> -#ifndef __TYPES__
> -#include <sys/types.h>			/* forgot to protect it... */
> -#define __TYPES__
> -#endif /* __TYPES__ */
> -#else
> -#if defined(_POSIX_SOURCE) && defined(MOTOROLA)
> -#undef _POSIX_SOURCE
>  #include <sys/types.h>
> -#define _POSIX_SOURCE
> -#else
> -#include <sys/types.h>
> -#endif
> -#endif /* USG */
>  
>  #if defined(__SCO__) || defined(__UNIXWARE__)
>  #include <stdint.h>
> @@ -64,14 +48,6 @@ in this Software without prior written authorization from The Open Group.
>  #include <X11/Xosdefs.h>
>  
>  #ifndef X_WCHAR
> -#ifdef X_NOT_STDC_ENV
> -#ifndef ISC
> -#define X_WCHAR
> -#endif
> -#endif
> -#endif
> -
> -#ifndef X_WCHAR
>  #include <stddef.h>
>  #else
>  #ifdef __UNIXOS2__
> @@ -84,7 +60,7 @@ typedef unsigned long wchar_t;
>  
>  #if defined(ISC) && defined(USE_XMBTOWC)
>  #define wctomb(a,b)	_Xwctomb(a,b)
> -#define mblen(a,b)	_Xmblen(a,b) 
> +#define mblen(a,b)	_Xmblen(a,b)
>  #ifndef USE_XWCHAR_STRING
>  #define mbtowc(a,b,c)	_Xmbtowc(a,b,c)
>  #endif
> @@ -217,10 +193,10 @@ typedef struct {
>  	unsigned long background;/* background pixel */
>  	int line_width;		/* line width */
>  	int line_style;	 	/* LineSolid, LineOnOffDash, LineDoubleDash */
> -	int cap_style;	  	/* CapNotLast, CapButt, 
> +	int cap_style;	  	/* CapNotLast, CapButt,
>  				   CapRound, CapProjecting */
>  	int join_style;	 	/* JoinMiter, JoinRound, JoinBevel */
> -	int fill_style;	 	/* FillSolid, FillTiled, 
> +	int fill_style;	 	/* FillSolid, FillTiled,
>  				   FillStippled, FillOpaeueStippled */
>  	int fill_rule;	  	/* EvenOddRule, WindingRule */
>  	int arc_mode;		/* ArcChord, ArcPieSlice */
> @@ -271,7 +247,7 @@ typedef struct {
>  
>  /*
>   * Depth structure; contains information for each possible depth.
> - */	
> + */
>  typedef struct {
>  	int depth;		/* this depth (Z) of the depth */
>  	int nvisuals;		/* number of Visual types at this depth */
> @@ -302,7 +278,7 @@ typedef struct {
>  	unsigned long black_pixel;	/* White and Black pixel values */
>  	int max_maps, min_maps;	/* max and min color maps */
>  	int backing_store;	/* Never, WhenMapped, Always */
> -	Bool save_unders;	
> +	Bool save_unders;
>  	long root_input_mask;	/* initial root input mask */
>  } Screen;
>  
> @@ -425,7 +401,7 @@ typedef struct _XImage {
>  	} f;
>  } XImage;
>  
> -/* 
> +/*
>   * Data structure for XReconfigureWindow
>   */
>  typedef struct {
> @@ -446,7 +422,7 @@ typedef struct {
>  	char pad;
>  } XColor;
>  
> -/* 
> +/*
>   * Data structures for graphics operations.  On most machines, these are
>   * congruent with the wire protocol structures, so reformatting the data
>   * can be avoided on these architectures.
> @@ -458,12 +434,12 @@ typedef struct {
>  typedef struct {
>      short x, y;
>  } XPoint;
> -    
> +
>  typedef struct {
>      short x, y;
>      unsigned short width, height;
>  } XRectangle;
> -    
> +
>  typedef struct {
>      short x, y;
>      unsigned short width, height;
> @@ -522,7 +498,7 @@ typedef struct _XDisplay Display;
>  struct _XPrivate;		/* Forward declare before use for C++ */
>  struct _XrmHashBucketRec;
>  
> -typedef struct 
> +typedef struct
>  #ifdef XLIB_ILLEGAL_ACCESS
>  _XDisplay
>  #endif
> @@ -577,7 +553,7 @@ _XDisplay
>  	/* there is more to this structure, but it is private to Xlib */
>  }
>  #ifdef XLIB_ILLEGAL_ACCESS
> -Display, 
> +Display,
>  #endif
>  *_XPrivDisplay;
>  
> @@ -653,7 +629,7 @@ typedef struct {
>  	int mode;		/* NotifyNormal, NotifyGrab, NotifyUngrab */
>  	int detail;
>  	/*
> -	 * NotifyAncestor, NotifyVirtual, NotifyInferior, 
> +	 * NotifyAncestor, NotifyVirtual, NotifyInferior,
>  	 * NotifyNonlinear,NotifyNonlinearVirtual
>  	 */
>  	Bool same_screen;	/* same screen flag */
> @@ -673,9 +649,9 @@ typedef struct {
>  				   NotifyGrab, NotifyUngrab */
>  	int detail;
>  	/*
> -	 * NotifyAncestor, NotifyVirtual, NotifyInferior, 
> +	 * NotifyAncestor, NotifyVirtual, NotifyInferior,
>  	 * NotifyNonlinear,NotifyNonlinearVirtual, NotifyPointer,
> -	 * NotifyPointerRoot, NotifyDetailNone 
> +	 * NotifyPointerRoot, NotifyDetailNone
>  	 */
>  } XFocusChangeEvent;
>  typedef XFocusChangeEvent XFocusInEvent;
> @@ -689,7 +665,7 @@ typedef struct {
>  	Display *display;	/* Display the event was read from */
>  	Window window;
>  	char key_vector[32];
> -} XKeymapEvent;	
> +} XKeymapEvent;
>  
>  typedef struct {
>  	int type;
> @@ -971,6 +947,33 @@ typedef struct {
>  	Window window;	/* window on which event was requested in event mask */
>  } XAnyEvent;
>  
> +
> +/***************************************************************
> + *
> + * GenericEvent.  This event is the standard event for all newer extensions.
> + */
> +
> +typedef struct
> +    {
> +    int            type;         /* of event. Always GenericEvent */
> +    unsigned long  serial;       /* # of last request processed */
> +    Bool           send_event;   /* true if from SendEvent request */
> +    Display        *display;     /* Display the event was read from */
> +    int            extension;    /* major opcode of extension that caused the event */
> +    int            evtype;       /* actual event type. */
> +    } XGenericEvent;
> +
> +typedef struct {
> +    int            type;         /* of event. Always GenericEvent */
> +    unsigned long  serial;       /* # of last request processed */
> +    Bool           send_event;   /* true if from SendEvent request */
> +    Display        *display;     /* Display the event was read from */
> +    int            extension;    /* major opcode of extension that caused the event */
> +    int            evtype;       /* actual event type. */
> +    unsigned int   cookie;
> +    void           *data;
> +} XGenericEventCookie;
> +
>  /*
>   * this union is defined so Xlib can always use the same sized
>   * event structure internally, to avoid memory fragmentation.
> @@ -1008,6 +1011,8 @@ typedef union _XEvent {
>  	XMappingEvent xmapping;
>  	XErrorEvent xerror;
>  	XKeymapEvent xkeymap;
> +	XGenericEvent xgeneric;
> +	XGenericEventCookie xcookie;
>  	long pad[24];
>  } XEvent;
>  #endif
> @@ -1248,7 +1253,7 @@ typedef struct {
>  typedef unsigned long XIMFeedback;
>  
>  #define XIMReverse		1L
> -#define XIMUnderline		(1L<<1) 
> +#define XIMUnderline		(1L<<1)
>  #define XIMHighlight		(1L<<2)
>  #define XIMPrimary	 	(1L<<5)
>  #define XIMSecondary		(1L<<6)
> @@ -1260,11 +1265,11 @@ typedef unsigned long XIMFeedback;
>  typedef struct _XIMText {
>      unsigned short length;
>      XIMFeedback *feedback;
> -    Bool encoding_is_wchar; 
> +    Bool encoding_is_wchar;
>      union {
>  	char *multi_byte;
>  	wchar_t *wide_char;
> -    } string; 
> +    } string;
>  } XIMText;
>  
>  typedef	unsigned long	 XIMPreeditState;
> @@ -1294,11 +1299,11 @@ typedef unsigned long XIMStringConversionFeedback;
>  typedef struct _XIMStringConversionText {
>      unsigned short length;
>      XIMStringConversionFeedback *feedback;
> -    Bool encoding_is_wchar; 
> +    Bool encoding_is_wchar;
>      union {
>  	char *mbs;
>  	wchar_t *wcs;
> -    } string; 
> +    } string;
>  } XIMStringConversionText;
>  
>  typedef	unsigned short	XIMStringConversionPosition;
> @@ -1320,7 +1325,7 @@ typedef enum {
>      XIMForwardWord, XIMBackwardWord,
>      XIMCaretUp, XIMCaretDown,
>      XIMNextLine, XIMPreviousLine,
> -    XIMLineStart, XIMLineEnd, 
> +    XIMLineStart, XIMLineEnd,
>      XIMAbsolutePosition,
>      XIMDontChange
>  } XIMCaretDirection;
> @@ -1341,7 +1346,7 @@ typedef struct _XIMPreeditDrawCallbackStruct {
>  } XIMPreeditDrawCallbackStruct;
>  
>  typedef enum {
> -    XIMIsInvisible,	/* Disable caret feedback */ 
> +    XIMIsInvisible,	/* Disable caret feedback */
>      XIMIsPrimary,	/* UI defined caret feedback */
>      XIMIsSecondary	/* UI defined caret feedback */
>  } XIMCaretStyle;
> @@ -1356,7 +1361,7 @@ typedef enum {
>      XIMTextType,
>      XIMBitmapType
>  } XIMStatusDataType;
> -	
> +
>  typedef struct _XIMStatusDrawCallbackStruct {
>      XIMStatusDataType type;
>      union {
> @@ -1434,7 +1439,7 @@ extern XModifierKeymap	*XInsertModifiermapEntry(
>  #else
>      KeyCode		/* keycode_entry */,
>  #endif
> -    int			/* modifier */    
> +    int			/* modifier */
>  );
>  
>  extern XModifierKeymap *XNewModifiermap(
> @@ -1480,7 +1485,7 @@ extern XImage *XGetSubImage(
>      int			/* dest_y */
>  );
>  
> -/* 
> +/*
>   * X function declarations.
>   */
>  extern Display *XOpenDisplay(
> @@ -1513,7 +1518,7 @@ extern Status XGetAtomNames(
>  extern char *XGetDefault(
>      Display*		/* display */,
>      _Xconst char*	/* program */,
> -    _Xconst char*	/* option */		  
> +    _Xconst char*	/* option */
>  );
>  extern char *XDisplayName(
>      _Xconst char*	/* string */
> @@ -1539,7 +1544,7 @@ extern int (*XSetAfterFunction(
>  extern Atom XInternAtom(
>      Display*		/* display */,
>      _Xconst char*	/* atom_name */,
> -    Bool		/* only_if_exists */		 
> +    Bool		/* only_if_exists */
>  );
>  extern Status XInternAtoms(
>      Display*		/* dpy */,
> @@ -1556,7 +1561,7 @@ extern Colormap XCreateColormap(
>      Display*		/* display */,
>      Window		/* w */,
>      Visual*		/* visual */,
> -    int			/* alloc */			 
> +    int			/* alloc */
>  );
>  extern Cursor XCreatePixmapCursor(
>      Display*		/* display */,
> @@ -1565,7 +1570,7 @@ extern Cursor XCreatePixmapCursor(
>      XColor*		/* foreground_color */,
>      XColor*		/* background_color */,
>      unsigned int	/* x */,
> -    unsigned int	/* y */			   
> +    unsigned int	/* y */
>  );
>  extern Cursor XCreateGlyphCursor(
>      Display*		/* display */,
> @@ -1602,7 +1607,7 @@ extern Pixmap XCreatePixmap(
>      Drawable		/* d */,
>      unsigned int	/* width */,
>      unsigned int	/* height */,
> -    unsigned int	/* depth */		        
> +    unsigned int	/* depth */
>  );
>  extern Pixmap XCreateBitmapFromData(
>      Display*		/* display */,
> @@ -1649,7 +1654,7 @@ extern Window XCreateWindow(
>      Visual*		/* visual */,
>      unsigned long	/* valuemask */,
>      XSetWindowAttributes*	/* attributes */
> -); 
> +);
>  extern Colormap *XListInstalledColormaps(
>      Display*		/* display */,
>      Window		/* w */,
> @@ -1944,7 +1949,7 @@ extern int XAddHost(
>  extern int XAddHosts(
>      Display*		/* display */,
>      XHostAddress*	/* hosts */,
> -    int			/* num_hosts */    
> +    int			/* num_hosts */
>  );
>  
>  extern int XAddToExtensionList(
> @@ -2167,7 +2172,7 @@ extern int XConfigureWindow(
>      Display*		/* display */,
>      Window		/* w */,
>      unsigned int	/* value_mask */,
> -    XWindowChanges*	/* values */		 
> +    XWindowChanges*	/* values */
>  );
>  
>  extern int XConnectionNumber(
> @@ -2253,7 +2258,7 @@ extern int XDestroySubwindows(
>  );
>  
>  extern int XDoesBackingStore(
> -    Screen*		/* screen */    
> +    Screen*		/* screen */
>  );
>  
>  extern Bool XDoesSaveUnders(
> @@ -2538,7 +2543,7 @@ extern int XFreeCursor(
>  );
>  
>  extern int XFreeExtensionList(
> -    char**		/* list */    
> +    char**		/* list */
>  );
>  
>  extern int XFreeFont(
> @@ -2912,7 +2917,7 @@ extern int XPutImage(
>      int			/* dest_x */,
>      int			/* dest_y */,
>      unsigned int	/* width */,
> -    unsigned int	/* height */	  
> +    unsigned int	/* height */
>  );
>  
>  extern int XQLength(
> @@ -3002,7 +3007,7 @@ extern int XQueryTextExtents(
>      int*		/* direction_return */,
>      int*		/* font_ascent_return */,
>      int*		/* font_descent_return */,
> -    XCharStruct*	/* overall_return */    
> +    XCharStruct*	/* overall_return */
>  );
>  
>  extern int XQueryTextExtents16(
> @@ -3067,7 +3072,7 @@ extern int XRecolorCursor(
>  );
>  
>  extern int XRefreshKeyboardMapping(
> -    XMappingEvent*	/* event_map */    
> +    XMappingEvent*	/* event_map */
>  );
>  
>  extern int XRemoveFromSaveSet(
> @@ -3223,7 +3228,7 @@ extern int XSetFont(
>  extern int XSetFontPath(
>      Display*		/* display */,
>      char**		/* directories */,
> -    int			/* ndirs */	     
> +    int			/* ndirs */
>  );
>  
>  extern int XSetForeground(
> @@ -3522,7 +3527,7 @@ extern int XWarpPointer(
>      unsigned int	/* src_width */,
>      unsigned int	/* src_height */,
>      int			/* dest_x */,
> -    int			/* dest_y */	     
> +    int			/* dest_y */
>  );
>  
>  extern int XWidthMMOfScreen(
> @@ -3547,7 +3552,7 @@ extern int XWriteBitmapFile(
>      unsigned int	/* width */,
>      unsigned int	/* height */,
>      int			/* x_hot */,
> -    int			/* y_hot */		     
> +    int			/* y_hot */
>  );
>  
>  extern Bool XSupportsLocale (void);
> @@ -3955,7 +3960,7 @@ typedef void (*XConnectionWatchProc)(
>      Bool			/* opening */,	 /* open or close flag */
>      XPointer*			/* watch_data */ /* open sets, close uses */
>  );
> -    
> +
>  
>  extern Status XInternalConnectionNumbers(
>      Display*			/* dpy */,
> @@ -3982,7 +3987,7 @@ extern void XRemoveConnectionWatch(
>  
>  extern void XSetAuthorization(
>      char *			/* name */,
> -    int				/* namelen */, 
> +    int				/* namelen */,
>      char *			/* data */,
>      int				/* datalen */
>  );
> @@ -4003,6 +4008,16 @@ extern int _Xwctomb(
>      wchar_t			/* wc */
>  );
>  
> +extern Bool XGetEventData(
> +    Display*			/* dpy */,
> +    XGenericEventCookie*	/* cookie*/
> +);
> +
> +extern void XFreeEventData(
> +    Display*			/* dpy */,
> +    XGenericEventCookie*	/* cookie*/
> +);
> +
>  _XFUNCPROTOEND
>  
>  #endif /* _XLIB_H_ */
> diff --git a/recipes/xorg-lib/xorg-headers-native/X11/XlibConf.h b/recipes/xorg-lib/xorg-headers-native/X11/XlibConf.h
> index c6c180a..9f9b940 100644
> --- a/recipes/xorg-lib/xorg-headers-native/X11/XlibConf.h
> +++ b/recipes/xorg-lib/xorg-headers-native/X11/XlibConf.h
> @@ -1,7 +1,5 @@
> -/* include/X11/XlibConf.h.  Generated by configure.  */
> +/* include/X11/XlibConf.h.  Generated from XlibConf.h.in by configure.  */
>  /*
> - * $Id: $
> - *
>   * Copyright © 2005 Keith Packard
>   *
>   * Permission to use, copy, modify, distribute, and sell this software and its
> @@ -32,9 +30,9 @@
>   */
>  
>  /* Threading support? */
> -#define XTHREADS 
> +#define XTHREADS 1
>  
>  /* Use multi-threaded libc functions? */
> -#define XUSE_MTSAFE_API 
> +#define XUSE_MTSAFE_API 1
>  
>  #endif /* _XLIBCONF_H_ */
> diff --git a/recipes/xorg-lib/xorg-headers-native/X11/Xlibint.h b/recipes/xorg-lib/xorg-headers-native/X11/Xlibint.h
> index 6b1e0c9..767b083 100644
> --- a/recipes/xorg-lib/xorg-headers-native/X11/Xlibint.h
> +++ b/recipes/xorg-lib/xorg-headers-native/X11/Xlibint.h
> @@ -1,4 +1,3 @@
> -/* $Xorg: Xlibint.h,v 1.5 2001/02/09 02:03:38 xorgcvs Exp $ */
>  
>  /*
>  
> @@ -27,7 +26,6 @@ other dealings in this Software without prior written authorization
>  from The Open Group.
>  
>  */
> -/* $XFree86: xc/lib/X11/Xlibint.h,v 3.27 2003/05/27 22:26:26 tsi Exp $ */
>  
>  #ifndef _XLIBINT_H_
>  #define _XLIBINT_H_ 1
> @@ -108,7 +106,7 @@ struct _XDisplay
>  	int nscreens;		/* number of screens on this server*/
>  	Screen *screens;	/* pointer to list of screens */
>  	unsigned long motion_buffer;	/* size of motion buffer */
> -	unsigned long flags;	   /* internal connection flags */
> +	volatile unsigned long flags;	   /* internal connection flags */
>  	int min_keycode;	/* minimum defined keycode */
>  	int max_keycode;	/* maximum defined keycode */
>  	KeySym *keysyms;	/* This server's keysyms */
> @@ -121,7 +119,7 @@ struct _XDisplay
>  	struct _XExten *ext_procs; /* extensions initialized on this display */
>  	/*
>  	 * the following can be fixed size, as the protocol defines how
> -	 * much address space is available. 
> +	 * much address space is available.
>  	 * While this could be done using the extension vector, there
>  	 * may be MANY events processed, so a search through the extension
>  	 * list to find the right procedure for each event might be
> @@ -184,6 +182,21 @@ struct _XDisplay
>  	int xcmisc_opcode;	/* major opcode for XC-MISC */
>  	struct _XkbInfoRec *xkb_info; /* XKB info */
>  	struct _XtransConnInfo *trans_conn; /* transport connection object */
> +	struct _X11XCBPrivate *xcb; /* XCB glue private data */
> +
> +	/* Generic event cookie handling */
> +	unsigned int next_cookie; /* next event cookie */
> +	/* vector for wire to generic event, index is (extension - 128) */
> +	Bool (*generic_event_vec[128])(
> +		Display *	/* dpy */,
> +		XGenericEventCookie *	/* Xlib event */,
> +		xEvent *	/* wire event */);
> +	/* vector for event copy, index is (extension - 128) */
> +	Bool (*generic_event_copy_vec[128])(
> +		Display *	/* dpy */,
> +		XGenericEventCookie *	/* in */,
> +		XGenericEventCookie *   /* out*/);
> +	void *cookiejar;  /* cookie events returned but not claimed */
>  };
>  
>  #define XAllocIDs(dpy,ids,n) (*(dpy)->idlist_alloc)(dpy,ids,n)
> @@ -416,7 +429,7 @@ extern LockInfoPtr _Xglobal_lock;
>  
>  /*
>   * GetReq - Get the next available X request packet in the buffer and
> - * return it. 
> + * return it.
>   *
>   * "name" is the name of the request, e.g. CreatePixmap, OpenFont, etc.
>   * "req" is the name of the request pointer.
> @@ -473,9 +486,9 @@ extern LockInfoPtr _Xglobal_lock;
>  
>  
>  /*
> - * GetResReq is for those requests that have a resource ID 
> + * GetResReq is for those requests that have a resource ID
>   * (Window, Pixmap, GContext, etc.) as their single argument.
> - * "rid" is the name of the resource. 
> + * "rid" is the name of the resource.
>   */
>  
>  #if !defined(UNIXCPP) || defined(ANSICPP)
> @@ -504,7 +517,7 @@ extern LockInfoPtr _Xglobal_lock;
>  
>  /*
>   * GetEmptyReq is for those requests that have no arguments
> - * at all. 
> + * at all.
>   */
>  #if !defined(UNIXCPP) || defined(ANSICPP)
>  #define GetEmptyReq(name, req) \
> @@ -610,7 +623,7 @@ extern void _XFlushGCCache(Display *dpy, GC gc);
>   * "ptr" is the pointer being assigned to.
>   * "n" is the number of bytes to allocate.
>   *
> - * Example: 
> + * Example:
>   *    xTextElt *elt;
>   *    BufAlloc (xTextElt *, elt, nbytes)
>   */
> @@ -660,7 +673,7 @@ extern void _XRead32(
>  			     (((cs)->rbearing|(cs)->lbearing| \
>  			       (cs)->ascent|(cs)->descent) == 0))
>  
> -/* 
> +/*
>   * CI_GET_CHAR_INFO_1D - return the charinfo struct for the indicated 8bit
>   * character.  If the character is in the column and exists, then return the
>   * appropriate metrics (note that fonts with common per-character metrics will
> @@ -686,7 +699,7 @@ extern void _XRead32(
>  
>  
>  /*
> - * CI_GET_CHAR_INFO_2D - return the charinfo struct for the indicated row and 
> + * CI_GET_CHAR_INFO_2D - return the charinfo struct for the indicated row and
>   * column.  This is used for fonts that have more than row zero.
>   */
>  #define CI_GET_CHAR_INFO_2D(fs,row,col,def,cs) \
> @@ -1004,6 +1017,19 @@ extern Bool _XUnknownWireEvent(
>      XEvent*	/* re */,
>      xEvent*	/* event */
>  );
> +
> +extern Bool _XUnknownWireEventCookie(
> +    Display*	/* dpy */,
> +    XGenericEventCookie*	/* re */,
> +    xEvent*	/* event */
> +);
> +
> +extern Bool _XUnknownCopyEventCookie(
> +    Display*	/* dpy */,
> +    XGenericEventCookie*	/* in */,
> +    XGenericEventCookie*	/* out */
> +);
> +
>  extern Status _XUnknownNativeEvent(
>      Display*	/* dpy */,
>      XEvent*	/* re */,
> @@ -1041,7 +1067,7 @@ extern int (*XESetCopyGC(
>  	      Display*			/* display */,
>                GC			/* gc */,
>                XExtCodes*		/* codes */
> -            )		/* proc */	      
> +            )		/* proc */
>  ))(
>      Display*, GC, XExtCodes*
>  );
> @@ -1053,7 +1079,7 @@ extern int (*XESetFlushGC(
>  	      Display*			/* display */,
>                GC			/* gc */,
>                XExtCodes*		/* codes */
> -            )		/* proc */	     
> +            )		/* proc */
>  ))(
>      Display*, GC, XExtCodes*
>  );
> @@ -1065,7 +1091,7 @@ extern int (*XESetFreeGC(
>  	      Display*			/* display */,
>                GC			/* gc */,
>                XExtCodes*		/* codes */
> -            )		/* proc */	     
> +            )		/* proc */
>  ))(
>      Display*, GC, XExtCodes*
>  );
> @@ -1077,7 +1103,7 @@ extern int (*XESetCreateFont(
>  	      Display*			/* display */,
>                XFontStruct*		/* fs */,
>                XExtCodes*		/* codes */
> -            )		/* proc */    
> +            )		/* proc */
>  ))(
>      Display*, XFontStruct*, XExtCodes*
>  );
> @@ -1089,10 +1115,10 @@ extern int (*XESetFreeFont(
>  	      Display*			/* display */,
>                XFontStruct*		/* fs */,
>                XExtCodes*		/* codes */
> -            )		/* proc */    
> +            )		/* proc */
>  ))(
>      Display*, XFontStruct*, XExtCodes*
> -); 
> +);
>  
>  extern int (*XESetCloseDisplay(
>      Display*		/* display */,
> @@ -1100,7 +1126,7 @@ extern int (*XESetCloseDisplay(
>      int (*) (
>  	      Display*			/* display */,
>                XExtCodes*		/* codes */
> -            )		/* proc */    
> +            )		/* proc */
>  ))(
>      Display*, XExtCodes*
>  );
> @@ -1113,7 +1139,7 @@ extern int (*XESetError(
>                xError*			/* err */,
>                XExtCodes*		/* codes */,
>                int*			/* ret_code */
> -            )		/* proc */    
> +            )		/* proc */
>  ))(
>      Display*, xError*, XExtCodes*, int*
>  );
> @@ -1127,7 +1153,7 @@ extern char* (*XESetErrorString(
>                  XExtCodes*		/* codes */,
>                  char*			/* buffer */,
>                  int			/* nbytes */
> -              )		/* proc */	       
> +              )		/* proc */
>  ))(
>      Display*, int, XExtCodes*, char*, int
>  );
> @@ -1151,11 +1177,36 @@ extern Bool (*XESetWireToEvent(
>  	       Display*			/* display */,
>                 XEvent*			/* re */,
>                 xEvent*			/* event */
> -             )		/* proc */    
> +             )		/* proc */
>  ))(
>      Display*, XEvent*, xEvent*
>  );
>  
> +extern Bool (*XESetWireToEventCookie(
> +    Display*		/* display */,
> +    int			/* extension */,
> +    Bool (*) (
> +	       Display*			/* display */,
> +               XGenericEventCookie*	/* re */,
> +               xEvent*			/* event */
> +             )		/* proc */
> +))(
> +    Display*, XGenericEventCookie*, xEvent*
> +);
> +
> +extern Bool (*XESetCopyEventCookie(
> +    Display*		/* display */,
> +    int			/* extension */,
> +    Bool (*) (
> +	       Display*			/* display */,
> +               XGenericEventCookie*	/* in */,
> +               XGenericEventCookie*	/* out */
> +             )		/* proc */
> +))(
> +    Display*, XGenericEventCookie*, XGenericEventCookie*
> +);
> +
> +
>  extern Status (*XESetEventToWire(
>      Display*		/* display */,
>      int			/* event_number */,
> @@ -1163,7 +1214,7 @@ extern Status (*XESetEventToWire(
>  	      Display*			/* display */,
>                XEvent*			/* re */,
>                xEvent*			/* event */
> -            )		/* proc */   
> +            )		/* proc */
>  ))(
>      Display*, XEvent*, xEvent*
>  );
> @@ -1175,7 +1226,7 @@ extern Bool (*XESetWireToError(
>  	       Display*			/* display */,
>  	       XErrorEvent*		/* he */,
>  	       xError*			/* we */
> -            )		/* proc */   
> +            )		/* proc */
>  ))(
>      Display*, XErrorEvent*, xError*
>  );
> @@ -1188,7 +1239,7 @@ extern void (*XESetBeforeFlush(
>  	       XExtCodes*		/* codes */,
>  	       _Xconst char*		/* data */,
>  	       long			/* len */
> -            )		/* proc */   
> +            )		/* proc */
>  ))(
>      Display*, XExtCodes*, _Xconst char*, long
>  );
> @@ -1214,6 +1265,11 @@ extern void _XUnregisterInternalConnection(
>      int				/* fd */
>  );
>  
> +extern void _XProcessInternalConnection(
> +    Display*			/* dpy */,
> +    struct _XConnectionInfo*	/* conn_info */
> +);
> +
>  /* Display structure has pointers to these */
>  
>  struct _XConnectionInfo {	/* info from _XRegisterInternalConnection */
> @@ -1312,9 +1368,29 @@ Status _XGetWindowAttributes(
>      XWindowAttributes *attr);
>  
>  int _XPutBackEvent (
> -    register Display *dpy, 
> +    register Display *dpy,
>      register XEvent *event);
>  
> +extern Bool _XIsEventCookie(
> +        Display *dpy,
> +        XEvent *ev);
> +
> +extern void _XFreeEventCookies(
> +        Display *dpy);
> +
> +extern void _XStoreEventCookie(
> +        Display *dpy,
> +        XEvent *ev);
> +
> +extern Bool _XFetchEventCookie(
> +        Display *dpy,
> +        XGenericEventCookie *ev);
> +
> +extern Bool _XCopyEventCookie(
> +        Display *dpy,
> +        XGenericEventCookie *in,
> +        XGenericEventCookie *out);
> +
>  _XFUNCPROTOEND
>  
>  #endif /* _XLIBINT_H_ */
> diff --git a/recipes/xorg-lib/xorg-headers-native/X11/Xlocale.h b/recipes/xorg-lib/xorg-headers-native/X11/Xlocale.h
> index 61d2f7a..baa1335 100644
> --- a/recipes/xorg-lib/xorg-headers-native/X11/Xlocale.h
> +++ b/recipes/xorg-lib/xorg-headers-native/X11/Xlocale.h
> @@ -1,4 +1,3 @@
> -/* $Xorg: Xlocale.h,v 1.4 2001/02/09 02:03:38 xorgcvs Exp $ */
>  /*
>  
>  Copyright 1991, 1998  The Open Group
> @@ -26,7 +25,6 @@ other dealings in this Software without prior written authorization
>  from The Open Group.
>  
>  */
> -/* $XFree86: xc/lib/X11/Xlocale.h,v 1.4 2001/12/14 19:54:09 dawes Exp $ */
>  
>  #ifndef _XLOCALE_H_
>  #define _XLOCALE_H_
> diff --git a/recipes/xorg-lib/xorg-headers-native/X11/Xmd.h b/recipes/xorg-lib/xorg-headers-native/X11/Xmd.h
> index 06fd2bf..f3868b3 100644
> --- a/recipes/xorg-lib/xorg-headers-native/X11/Xmd.h
> +++ b/recipes/xorg-lib/xorg-headers-native/X11/Xmd.h
> @@ -1,5 +1,3 @@
> -/* $XdotOrg: proto/X11/Xmd.h,v 1.4 2006/04/20 01:24:25 alanc Exp $ */
> -/* $XFree86: xc/include/Xmd.h,v 3.18tsi Exp $ */
>  /***********************************************************
>  
>  Copyright 1987, 1998  The Open Group
> @@ -47,8 +45,7 @@ SOFTWARE.
>  
>  ******************************************************************/
>  #ifndef XMD_H
> -#define XMD_H 1
> -/* $Xorg: Xmd.h,v 1.4 2001/02/09 02:03:22 xorgcvs Exp $ */
> +# define XMD_H 1
>  /*
>   *  Xmd.h: MACHINE DEPENDENT DECLARATIONS.
>   */
> @@ -56,32 +53,27 @@ SOFTWARE.
>  /*
>   * Special per-machine configuration flags.
>   */
> -#if defined(sun) && defined(__SVR4)
> -# include <sys/isa_defs.h> /* Solaris: defines _LP64 if necessary */
> -#endif
> -
> -#ifdef CRAY
> -#define WORD64				/* 64-bit architecture */
> -#endif
> -#if defined (_LP64) || \
> -    defined(__alpha) || defined(__alpha__) || \
> -    defined(__ia64__) || defined(ia64) || \
> -    defined(__sparc64__) || \
> -    defined(__s390x__) || \
> -    (defined(__hppa__) && defined(__LP64__)) || \
> -    defined(__amd64__) || defined(amd64) || \
> -    defined(__powerpc64__) || \
> -    (defined(sgi) && (_MIPS_SZLONG == 64))
> -#define LONG64				/* 32/64-bit architecture */
> -#endif
> +# if defined(__sun) && defined(__SVR4)
> +#  include <sys/isa_defs.h> /* Solaris: defines _LP64 if necessary */
> +# endif
> +
> +# if defined (_LP64) || defined(__LP64__) || \
> +     defined(__alpha) || defined(__alpha__) || \
> +     defined(__ia64__) || defined(ia64) || \
> +     defined(__sparc64__) || \
> +     defined(__s390x__) || \
> +     defined(__amd64__) || defined(amd64) || \
> +     defined(__powerpc64__)
> +#  define LONG64				/* 32/64-bit architecture */
> +# endif
>  
>  /*
>   * Stuff to handle large architecture machines; the constants were generated
>   * on a 32-bit machine and must correspond to the protocol.
>   */
> -#ifdef WORD64
> -#define MUSTCOPY
> -#endif /* WORD64 */
> +# ifdef WORD64
> +#  define MUSTCOPY
> +# endif /* WORD64 */
>  
>  
>  /*
> @@ -95,114 +87,99 @@ SOFTWARE.
>   * symbols are no more than 32 characters long (which causes problems for some
>   * compilers and preprocessors).
>   *
> - * The extra indirection in the __STDC__ case is to get macro arguments to
> - * expand correctly before the concatenation, rather than afterward.
> + * The extra indirection is to get macro arguments to expand correctly before
> + * the concatenation, rather than afterward.
>   */
> -#if ((defined(__STDC__) || defined(__cplusplus) || defined(c_plusplus)) && !defined(UNIXCPP)) || defined(ANSICPP)
> -#define _SIZEOF(x) sz_##x
> -#define SIZEOF(x) _SIZEOF(x)
> -#else
> -#define SIZEOF(x) sz_/**/x
> -#endif /* if ANSI C compiler else not */
> +# define _SIZEOF(x) sz_##x
> +# define SIZEOF(x) _SIZEOF(x)
>  
>  /*
>   * Bitfield suffixes for the protocol structure elements, if you
>   * need them.  Note that bitfields are not guaranteed to be signed
>   * (or even unsigned) according to ANSI C.
>   */
> -#ifdef WORD64
> +# ifdef WORD64
>  typedef long INT64;
>  typedef unsigned long CARD64;
> -#define B32 :32
> -#define B16 :16
> -#ifdef UNSIGNEDBITFIELDS
> +#  define B32 :32
> +#  define B16 :16
> +#  ifdef UNSIGNEDBITFIELDS
>  typedef unsigned int INT32;
>  typedef unsigned int INT16;
> -#else
> -#ifdef __STDC__
> +#  else
>  typedef signed int INT32;
>  typedef signed int INT16;
> -#else
> -typedef int INT32;
> -typedef int INT16;
> -#endif
> -#endif
> -#else
> -#define B32
> -#define B16
> -#ifdef LONG64
> +#  endif
> +# else
> +#  define B32
> +#  define B16
> +#  ifdef LONG64
>  typedef long INT64;
>  typedef int INT32;
> -#else
> +#  else
>  typedef long INT32;
> -#endif
> +#  endif
>  typedef short INT16;
> -#endif
> +# endif
>  
> -#if defined(__STDC__) || defined(sgi) || defined(AIXV3)
>  typedef signed char    INT8;
> -#else
> -typedef char           INT8;
> -#endif
>  
> -#ifdef LONG64
> +# ifdef LONG64
>  typedef unsigned long CARD64;
>  typedef unsigned int CARD32;
> -#else
> +# else
>  typedef unsigned long CARD32;
> -#endif
> +# endif
> +# if !defined(WORD64) && !defined(LONG64)
> +typedef unsigned long long CARD64;
> +# endif
>  typedef unsigned short CARD16;
>  typedef unsigned char  CARD8;
>  
>  typedef CARD32		BITS32;
>  typedef CARD16		BITS16;
>  
> -#ifndef I_NEED_OS2_H
>  typedef CARD8		BYTE;
>  typedef CARD8		BOOL;
> -#else
> -#define BYTE	CARD8
> -#define BOOL	CARD8
> -#endif
>  
>  /*
>   * definitions for sign-extending bitfields on 64-bit architectures
>   */
> -#if defined(WORD64) && defined(UNSIGNEDBITFIELDS)
> -#define cvtINT8toInt(val)   (((val) & 0x00000080) ? ((val) | 0xffffffffffffff00) : (val))
> -#define cvtINT16toInt(val)  (((val) & 0x00008000) ? ((val) | 0xffffffffffff0000) : (val))
> -#define cvtINT32toInt(val)  (((val) & 0x80000000) ? ((val) | 0xffffffff00000000) : (val))
> -#define cvtINT8toShort(val)  cvtINT8toInt(val)
> -#define cvtINT16toShort(val) cvtINT16toInt(val)
> -#define cvtINT32toShort(val) cvtINT32toInt(val)
> -#define cvtINT8toLong(val)  cvtINT8toInt(val)
> -#define cvtINT16toLong(val) cvtINT16toInt(val)
> -#define cvtINT32toLong(val) cvtINT32toInt(val)
> -#else
> -#define cvtINT8toInt(val) (val)
> -#define cvtINT16toInt(val) (val)
> -#define cvtINT32toInt(val) (val)
> -#define cvtINT8toShort(val) (val)
> -#define cvtINT16toShort(val) (val)
> -#define cvtINT32toShort(val) (val)
> -#define cvtINT8toLong(val) (val)
> -#define cvtINT16toLong(val) (val)
> -#define cvtINT32toLong(val) (val)
> -#endif /* WORD64 and UNSIGNEDBITFIELDS */
> -
> -
> -
> -#ifdef MUSTCOPY
> +# if defined(WORD64) && defined(UNSIGNEDBITFIELDS)
> +#  define cvtINT8toInt(val)   (((val) & 0x00000080) ? ((val) | 0xffffffffffffff00) : (val))
> +#  define cvtINT16toInt(val)  (((val) & 0x00008000) ? ((val) | 0xffffffffffff0000) : (val))
> +#  define cvtINT32toInt(val)  (((val) & 0x80000000) ? ((val) | 0xffffffff00000000) : (val))
> +#  define cvtINT8toShort(val)  cvtINT8toInt(val)
> +#  define cvtINT16toShort(val) cvtINT16toInt(val)
> +#  define cvtINT32toShort(val) cvtINT32toInt(val)
> +#  define cvtINT8toLong(val)  cvtINT8toInt(val)
> +#  define cvtINT16toLong(val) cvtINT16toInt(val)
> +#  define cvtINT32toLong(val) cvtINT32toInt(val)
> +# else
> +#  define cvtINT8toInt(val) (val)
> +#  define cvtINT16toInt(val) (val)
> +#  define cvtINT32toInt(val) (val)
> +#  define cvtINT8toShort(val) (val)
> +#  define cvtINT16toShort(val) (val)
> +#  define cvtINT32toShort(val) (val)
> +#  define cvtINT8toLong(val) (val)
> +#  define cvtINT16toLong(val) (val)
> +#  define cvtINT32toLong(val) (val)
> +# endif /* WORD64 and UNSIGNEDBITFIELDS */
> +
> +
> +
> +# ifdef MUSTCOPY
>  /*
>   * This macro must not cast or else pointers will get aligned and be wrong
>   */
> -#define NEXTPTR(p,t)  (((char *) p) + SIZEOF(t))
> -#else /* else not MUSTCOPY, this is used for 32-bit machines */
> +#  define NEXTPTR(p,t)  (((char *) p) + SIZEOF(t))
> +# else /* else not MUSTCOPY, this is used for 32-bit machines */
>  /*
>   * this version should leave result of type (t *), but that should only be
>   * used when not in MUSTCOPY
>   */
> -#define NEXTPTR(p,t) (((t *)(p)) + 1)
> -#endif /* MUSTCOPY - used machines whose C structs don't line up with proto */
> +#  define NEXTPTR(p,t) (((t *)(p)) + 1)
> +# endif /* MUSTCOPY - used machines whose C structs don't line up with proto */
>  
>  #endif /* XMD_H */
> diff --git a/recipes/xorg-lib/xorg-headers-native/X11/Xos.h b/recipes/xorg-lib/xorg-headers-native/X11/Xos.h
> index 83be4c6..646716b 100644
> --- a/recipes/xorg-lib/xorg-headers-native/X11/Xos.h
> +++ b/recipes/xorg-lib/xorg-headers-native/X11/Xos.h
> @@ -1,8 +1,5 @@
>  /*
> - * $XdotOrg: proto/X11/Xos.h,v 1.9 2006/04/20 01:24:25 alanc Exp $
> - * $Xorg: Xos.h,v 1.6 2001/02/09 02:03:22 xorgcvs Exp $
> - * 
> - * 
> + *
>  Copyright 1987, 1998  The Open Group
>  
>  Permission to use, copy, modify, distribute, and sell this software and its
> @@ -28,53 +25,26 @@ in this Software without prior written authorization from The Open Group.
>   * The X Window System is a Trademark of The Open Group.
>   *
>   */
> -/* $XFree86: xc/include/Xos.h,v 3.41tsi Exp $ */
>  
>  /* This is a collection of things to try and minimize system dependencies
>   * in a "significant" number of source files.
>   */
>  
>  #ifndef _XOS_H_
> -#define _XOS_H_
> +# define _XOS_H_
>  
> -#include <X11/Xosdefs.h>
> +# include <X11/Xosdefs.h>
>  
>  /*
>   * Get major data types (esp. caddr_t)
>   */
>  
> -#ifdef USG
> -#ifndef __TYPES__
> -#ifdef CRAY
> -#define word word_t
> -#endif /* CRAY */
> -#include <sys/types.h>			/* forgot to protect it... */
> -#define __TYPES__
> -#endif /* __TYPES__ */
> -#else /* USG */
> -#if defined(_POSIX_SOURCE) && defined(MOTOROLA)
> -#undef _POSIX_SOURCE
> -#include <sys/types.h>
> -#define _POSIX_SOURCE
> -#else
>  # include <sys/types.h>
> -#endif
> -#endif /* USG */
>  
> -#ifndef sgi
> -#if defined(__SCO__) || defined(__UNIXWARE__)
> -#include <stdint.h>
> -#endif
> -#endif
> +# if defined(__SCO__) || defined(__UNIXWARE__)
> +#  include <stdint.h>
> +# endif
>  
> -#ifdef _SEQUENT_
> -/*
> - * in_systm.h compatibility between SysV and BSD types u_char u_short u_long
> - * select.h  for typedef of args to select, fd_set, may use SVR4 later
> - */
> -#include <netinet/in_systm.h>
> -#include <sys/select.h>
> -#endif /* _SEQUENT_ */
>  
>  /*
>   * Just about everyone needs the strings routines.  We provide both forms here,
> @@ -89,208 +59,90 @@ in this Software without prior written authorization from The Open Group.
>   * which can be really inconvenient. :-(
>   */
>  
> -#ifndef X_NOT_STDC_ENV
> -
> -#include <string.h>
> -#if defined(__SCO__) || defined(__UNIXWARE__)
> -#include <strings.h>
> -#else
> -#if (defined(sun) && defined(__SVR4))
> -#include <strings.h>
> -#endif
> -#ifdef __STDC__
> -#ifndef index
> -#define index(s,c) (strchr((s),(c)))
> -#endif
> -#ifndef rindex
> -#define rindex(s,c) (strrchr((s),(c)))
> -#endif
> -#else
> -#ifndef index
> -#define index strchr
> -#endif
> -#ifndef rindex
> -#define rindex strrchr
> -#endif
> -#endif
> -#endif
> -
> -#else
> -
> -#ifdef SYSV
> -#if defined(clipper) || defined(__clipper__)
> -#include <malloc.h>
> -#endif
> -#include <string.h>
> -#define index strchr
> -#define rindex strrchr
> -#else
> -#include <strings.h>
> -#define strchr index
> -#define strrchr rindex
> -#endif
> -
> -#endif /* X_NOT_STDC_ENV */
> -
> -/*
> - * strerror()
> - */
> -#if (defined(X_NOT_STDC_ENV) || (defined(sun) && !defined(SVR4)) || defined(macII)) && !defined(__GLIBC__)
> -#ifndef strerror
> -extern char *sys_errlist[];
> -extern int sys_nerr;
> -#define strerror(n) \
> -    (((n) >= 0 && (n) < sys_nerr) ? sys_errlist[n] : "unknown error")
> -#endif
> -#endif
> +# include <string.h>
> +# if defined(__SCO__) || defined(__UNIXWARE__) || defined(__sun)
> +#  include <strings.h>
> +# else
> +#  ifndef index
> +#   define index(s,c) (strchr((s),(c)))
> +#  endif
> +#  ifndef rindex
> +#   define rindex(s,c) (strrchr((s),(c)))
> +#  endif
> +# endif
>  
>  /*
>   * Get open(2) constants
>   */
> -#if defined(X_NOT_POSIX)
> -#include <fcntl.h>
> -#if defined(USL) || defined(CRAY) || defined(MOTOROLA) || (defined(i386) && (defined(SYSV) || defined(SVR4))) || defined(__sxg__)
> -#include <unistd.h>
> -#endif
> -#ifdef WIN32
> -#include <X11/Xw32defs.h>
> -#else
> -#include <sys/file.h>
> -#endif
> -#else /* X_NOT_POSIX */
> -#if !defined(_POSIX_SOURCE) && defined(macII)
> -#define _POSIX_SOURCE
> -#include <fcntl.h>
> -#include <unistd.h>
> -#undef _POSIX_SOURCE
> -#else
> -#include <fcntl.h>
> -#include <unistd.h>
> -#endif
> -#endif /* X_NOT_POSIX else */
> +# if defined(X_NOT_POSIX)
> +#  include <fcntl.h>
> +#  if defined(USL) || defined(__i386__) && (defined(SYSV) || defined(SVR4))
> +#   include <unistd.h>
> +#  endif
> +#  ifdef WIN32
> +#   include <X11/Xw32defs.h>
> +#  else
> +#   include <sys/file.h>
> +#  endif
> +# else /* X_NOT_POSIX */
> +#  include <fcntl.h>
> +#  include <unistd.h>
> +# endif /* X_NOT_POSIX else */
>  
>  /*
>   * Get struct timeval and struct tm
>   */
>  
> -#if defined(SYSV) && !defined(_SEQUENT_)
> -
> -#ifndef USL
> -#include <sys/time.h>
> -#endif
> -#include <time.h>
> -#ifdef CRAY
> -#undef word
> -#endif /* CRAY */
> -#if defined(USG) && !defined(CRAY) && !defined(MOTOROLA) && !defined(uniosu) && !defined(__sxg__) && !defined(clipper) && !defined(__clipper__)
> -struct timeval {
> -    long tv_sec;
> -    long tv_usec;
> -};
> -#ifndef USL_SHARELIB
> -struct timezone {
> -    int tz_minuteswest;
> -    int tz_dsttime;
> -};
> -#endif /* USL_SHARELIB */
> -#endif /* USG */
> -
> -#ifdef _SEQUENT_
> -struct timezone {
> -    int tz_minuteswest;
> -    int tz_dsttime;
> -};
> -#endif /* _SEQUENT_ */
> -
> -#else /* not SYSV */
> -
> -#if defined(_POSIX_SOURCE) && defined(SVR4)
> +# if defined(_POSIX_SOURCE) && defined(SVR4)
>  /* need to omit _POSIX_SOURCE in order to get what we want in SVR4 */
> -#undef _POSIX_SOURCE
> -#include <sys/time.h>
> -#define _POSIX_SOURCE
> -#elif defined(WIN32)
> -#include <time.h>
> -#if !defined(_WINSOCKAPI_) && !defined(_WILLWINSOCK_) && !defined(_TIMEVAL_DEFINED) && !defined(_STRUCT_TIMEVAL)
> +#  undef _POSIX_SOURCE
> +#  include <sys/time.h>
> +#  define _POSIX_SOURCE
> +# elif defined(WIN32)
> +#  include <time.h>
> +#  if !defined(_WINSOCKAPI_) && !defined(_WILLWINSOCK_) && !defined(_TIMEVAL_DEFINED) && !defined(_STRUCT_TIMEVAL)
>  struct timeval {
>      long    tv_sec;         /* seconds */
>      long    tv_usec;        /* and microseconds */
>  };
> -#define _TIMEVAL_DEFINED
> -#endif
> -#include <sys/timeb.h>
> -#define gettimeofday(t) \
> +#   define _TIMEVAL_DEFINED
> +#  endif
> +#  include <sys/timeb.h>
> +#  define gettimeofday(t) \
>  { \
>      struct _timeb _gtodtmp; \
>      _ftime (&_gtodtmp); \
>      (t)->tv_sec = _gtodtmp.time; \
>      (t)->tv_usec = _gtodtmp.millitm * 1000; \
>  }
> -#elif defined(_SEQUENT_) || defined(Lynx)
> -#include <time.h>
> -#elif defined (__QNX__)
> -typedef unsigned long fd_mask;
> -/* Make sure we get 256 bit select masks */
> -#define FD_SETSIZE 256
> -#include <sys/select.h>
> -#include <sys/time.h>
> -#include <time.h>
> -#else
> -#include <sys/time.h>
> -#include <time.h>
> -#endif /* defined(_POSIX_SOURCE) && defined(SVR4) */
> -
> -#endif /* SYSV */
> +# else
> +#  include <sys/time.h>
> +#  include <time.h>
> +# endif /* defined(_POSIX_SOURCE) && defined(SVR4) */
>  
>  /* define X_GETTIMEOFDAY macro, a portable gettimeofday() */
> -#if defined(_XOPEN_XPG4) || defined(_XOPEN_UNIX) /* _XOPEN_UNIX is XPG4.2 */
> -#define X_GETTIMEOFDAY(t) gettimeofday(t, (struct timezone*)0)
> -#else
> -#if defined(SVR4) || defined(VMS) || defined(WIN32)
> -#define X_GETTIMEOFDAY(t) gettimeofday(t)
> -#else
> -#define X_GETTIMEOFDAY(t) gettimeofday(t, (struct timezone*)0)
> -#endif
> -#endif /* XPG4 else */
> -
> -#ifdef __UNIXOS2__
> -typedef unsigned long fd_mask;
> -#include <limits.h>
> -#define MAX_PATH _POSIX_PATH_MAX
> -#endif
> -
> -#ifdef __GNU__
> -#define PATH_MAX 4096
> -#define MAXPATHLEN 4096
> -#define OPEN_MAX 256 /* We define a reasonable limit.  */
> -#endif
> +# if defined(_XOPEN_XPG4) || defined(_XOPEN_UNIX) /* _XOPEN_UNIX is XPG4.2 */
> +#  define X_GETTIMEOFDAY(t) gettimeofday(t, (struct timezone*)0)
> +# else
> +#  if defined(SVR4) || defined(__SVR4) || defined(WIN32)
> +#   define X_GETTIMEOFDAY(t) gettimeofday(t)
> +#  else
> +#   define X_GETTIMEOFDAY(t) gettimeofday(t, (struct timezone*)0)
> +#  endif
> +# endif /* XPG4 else */
> +
> +
> +# ifdef __GNU__
> +#  define PATH_MAX 4096
> +#  define MAXPATHLEN 4096
> +#  define OPEN_MAX 256 /* We define a reasonable limit.  */
> +# endif
>  
>  /* use POSIX name for signal */
> -#if defined(X_NOT_POSIX) && defined(SYSV) && !defined(SIGCHLD) && !defined(ISC)
> -#define SIGCHLD SIGCLD
> -#endif
> -
> -#ifdef ISC
> -#include <sys/bsdtypes.h>
> -#include <sys/limits.h>
> -#define NGROUPS 16
> -#endif
> -
> -#if defined(ISC) || defined(__UNIXOS2__) || \
> -    (defined(__linux__) && !defined(__GLIBC__)) || \
> -    (defined(__QNX__) && !defined(UNIXCONN))
> -/*
> - *	Some OS's may not have this
> - */
> -
> -#define X_NO_SYS_UN 1
> -
> -struct sockaddr_un {
> -	short	sun_family;
> -	char	sun_path[108];
> -};
> -#endif
> +# if defined(X_NOT_POSIX) && defined(SYSV) && !defined(SIGCHLD)
> +#  define SIGCHLD SIGCLD
> +# endif
>  
> -#include <X11/Xarch.h>
> +# include <X11/Xarch.h>
>  
>  #endif /* _XOS_H_ */
> diff --git a/recipes/xorg-lib/xorg-headers-native/X11/Xos_r.h b/recipes/xorg-lib/xorg-headers-native/X11/Xos_r.h
> index 694f7a0..f963b64 100644
> --- a/recipes/xorg-lib/xorg-headers-native/X11/Xos_r.h
> +++ b/recipes/xorg-lib/xorg-headers-native/X11/Xos_r.h
> @@ -1,5 +1,3 @@
> -/* $Xorg: Xos_r.h,v 1.4 2001/02/09 02:03:22 xorgcvs Exp $ */
> -/* $XdotOrg: proto/X11/Xos_r.h,v 1.6 2006/04/20 01:24:25 alanc Exp $ */
>  /*
>  Copyright 1996, 1998  The Open Group
>  
> @@ -23,7 +21,6 @@ Except as contained in this notice, the name of The Open Group shall not be
>  used in advertising or otherwise to promote the sale, use or other dealings
>  in this Software without prior written authorization from The Open Group.
>  */
> -/* $XFree86: xc/include/Xos_r.h,v 1.18tsi Exp $ */
>  
>  /*
>   * Various and sundry Thread-Safe functions used by X11, Motif, and CDE.
> @@ -40,13 +37,13 @@ in this Software without prior written authorization from The Open Group.
>   *
>   * If you are on a platform that defines XTHREADS but does not have
>   * MT-safe system API (e.g. UnixWare) you must define _Xos_processLock
> - * and _Xos_processUnlock macros before including this header.  If
> - * you are on OSF/1 V3.2 and plan to use readdir(), you must also define
> - * _Xos_isThreadInitialized.  For convenience XOS_USE_XLIB_LOCKING or
> - * XOS_USE_XT_LOCKING may be defined to obtain either Xlib-only or
> - * Xt-based versions of these macros.  These macros won't result in
> - * truly thread-safe calls, but they are better than nothing.  If you
> - * do not want locking in this situation define XOS_USE_NO_LOCKING.
> + * and _Xos_processUnlock macros before including this header.
> + *
> + * For convenience XOS_USE_XLIB_LOCKING or XOS_USE_XT_LOCKING may be defined
> + * to obtain either Xlib-only or Xt-based versions of these macros.  These
> + * macros won't result in truly thread-safe calls, but they are better than
> + * nothing.  If you do not want locking in this situation define
> + * XOS_USE_NO_LOCKING.
>   *
>   * NOTE: On systems lacking appropriate _r functions Gethostbyname(),
>   *	Gethostbyaddr(), and Getservbyname() do NOT copy the host or
> @@ -195,20 +192,11 @@ extern void XtProcessUnlock(
>   * uses the older SVR4 thread-safe functions unless the POSIX ones
>   * are specifically requested.  Fix the feature test macro.
>   */
> -#if defined(sun) && defined(_POSIX_THREAD_SAFE_FUNCTIONS) && \
> +#if defined(__sun) && defined(_POSIX_THREAD_SAFE_FUNCTIONS) && \
>  	(_POSIX_C_SOURCE - 0 < 199506L) && !defined(_POSIX_PTHREAD_SEMANTICS)
>  # undef _POSIX_THREAD_SAFE_FUNCTIONS
>  #endif
>  
> -/*
> - * LynxOS 3.1 defines _POSIX_THREAD_SAFE_FUNCTIONS but
> - * getpwuid_r has different semantics than defined by POSIX
> - */
> -#if defined(Lynx) && defined(_POSIX_THREAD_SAFE_FUNCTIONS)
> -# undef _POSIX_THREAD_SAFE_FUNCTIONS
> -#endif
> -
> -
>  /***** <pwd.h> wrappers *****/
>  
>  /*
> @@ -237,7 +225,7 @@ extern void XtProcessUnlock(
>  
>  #elif !defined(XTHREADS) && !defined(X_FORCE_USE_MTSAFE_API)
>  /* Use regular, unsafe API. */
> -# if defined(X_NOT_POSIX) && !defined(i386) && !defined(SYSV)
> +# if defined(X_NOT_POSIX) && !defined(__i386__) && !defined(SYSV)
>  extern struct passwd *getpwuid(), *getpwnam();
>  # endif
>  typedef int _Xgetpwparams;	/* dummy */
> @@ -331,24 +319,16 @@ static __inline__ void _Xpw_copyPasswd(_Xgetpwparams p)
>    (p).pwp )
>  
>  #elif !defined(_POSIX_THREAD_SAFE_FUNCTIONS) && !defined(__APPLE__)
> -/* SVR4 threads, AIX 4.2.0 and earlier and OSF/1 3.2 and earlier pthreads */
>  # define X_NEEDS_PWPARAMS
>  typedef struct {
>    struct passwd pws;
>    char pwbuf[X_LINE_MAX];
>  } _Xgetpwparams;
> -# if defined(_POSIX_REENTRANT_FUNCTIONS) || !defined(SVR4) || defined(Lynx)
> -#  ifndef Lynx
> +# if defined(_POSIX_REENTRANT_FUNCTIONS) || !defined(SVR4)
>  #   define _XGetpwuid(u,p) \
>  ((getpwuid_r((u),&(p).pws,(p).pwbuf,sizeof((p).pwbuf)) == -1) ? NULL : &(p).pws)
>  #   define _XGetpwnam(u,p) \
>  ((getpwnam_r((u),&(p).pws,(p).pwbuf,sizeof((p).pwbuf)) == -1) ? NULL : &(p).pws)
> -#  else /* Lynx */
> -#   define _XGetpwuid(u,p) \
> -((getpwuid_r(&(p).pws,(u),(p).pwbuf,sizeof((p).pwbuf)) == -1) ? NULL : &(p).pws)
> -#   define _XGetpwnam(u,p) \
> -((getpwnam_r(&(p).pws,(u),(p).pwbuf,sizeof((p).pwbuf)) == -1) ? NULL : &(p).pws)
> -#  endif
>  # else /* SVR4 */
>  #  define _XGetpwuid(u,p) \
>  ((getpwuid_r((u),&(p).pws,(p).pwbuf,sizeof((p).pwbuf)) == NULL) ? NULL : &(p).pws)
> @@ -357,12 +337,6 @@ typedef struct {
>  # endif /* SVR4 */
>  
>  #else /* _POSIX_THREAD_SAFE_FUNCTIONS */
> -/* Digital UNIX 4.0, but not (beta) T4.0-1 */
> -# if defined(__osf__)
> -/* OSF/1 V4.0 <pwd.h> doesn't declare the _P routines, breaking under C++. */
> -extern int _Pgetpwuid_r(uid_t, struct passwd *, char *, size_t, struct passwd **);
> -extern int _Pgetpwnam_r(const char *, struct passwd *, char *, size_t, struct passwd **);
> -# endif
>  # define X_NEEDS_PWPARAMS
>  typedef struct {
>    struct passwd pws;
> @@ -427,7 +401,6 @@ typedef int _Xgetservbynameparams; /* dummy */
>  # define _XGetservbyname(s,p,sp)	getservbyname((s),(p))
>  
>  #elif !defined(XOS_USE_MTSAFE_NETDBAPI) || defined(XNO_MTSAFE_NETDBAPI)
> -/* UnixWare 2.0, or other systems with thread support but no _r API. */
>  /* WARNING:  The h_addr_list and s_aliases values are *not* copied! */
>  
>  #if defined(__NetBSD__) || defined(__FreeBSD__) || defined(__DragonFly__)
> @@ -485,9 +458,6 @@ typedef struct {
>   */
>  # ifdef _POSIX_REENTRANT_FUNCTIONS
>  #  ifndef _POSIX_THREAD_SAFE_FUNCTIONS
> -#   if defined(AIXV3) || defined(AIXV4) || defined(__osf__)
> -#    define X_POSIX_THREAD_SAFE_FUNCTIONS 1
> -#   endif
>  #  endif
>  # endif
>  # ifdef _POSIX_THREAD_SAFE_FUNCTIONS
> @@ -565,7 +535,7 @@ typedef int _Xgetservbynameparams; /* dummy */
>  
>  #if defined(X_INCLUDE_DIRENT_H) && !defined(_XOS_INCLUDED_DIRENT_H)
>  # include <sys/types.h>
> -# if !defined(X_NOT_POSIX) || defined(SYSV) || defined(USG)
> +# if !defined(X_NOT_POSIX) || defined(SYSV)
>  #  include <dirent.h>
>  # else
>  #  include <sys/dir.h>
> @@ -622,32 +592,10 @@ typedef struct {
>  # endif
>  } _Xreaddirparams;
>  
> -# if defined(_POSIX_THREAD_SAFE_FUNCTIONS) || defined(AIXV3) || \
> -     defined(AIXV4) || defined(__APPLE__)
> -/* AIX defines the draft POSIX symbol, but uses the final API. */
> +# if defined(_POSIX_THREAD_SAFE_FUNCTIONS) || defined(__APPLE__)
>  /* POSIX final API, returns (int)0 on success. */
> -#  if defined(__osf__)
> -/* OSF/1 V4.0 <dirent.h> doesn't declare _Preaddir_r, breaking under C++. */
> -extern int _Preaddir_r(DIR *, struct dirent *, struct dirent **);
> -#  endif
>  #  define _XReaddir(d,p)						\
>      (readdir_r((d), &((p).dir_entry), &((p).result)) ? NULL : (p).result)
> -# elif defined(_POSIX_REENTRANT_FUNCTIONS) && defined(__osf__)
> -/*
> - * OSF/1 V3.2 readdir_r() will SEGV if the main program is not
> - * explicitly linked with -lc_r.  The library REQUIREDLIBS don't help.
> - * Assume that if threads have been initialized we're linked properly.
> - */
> -#  define _XReaddir(d,p)						\
> - ( (_Xos_isThreadInitialized) ?						\
> -   (readdir_r((d), &((p).dir_entry)) ? NULL : &((p).dir_entry)) :	\
> -   ((_Xos_processLock),							\
> -    (((p).result = readdir((d))) ?					\
> -     (memcpy(&((p).dir_entry), (p).result, (p).result->d_reclen),	\
> -      ((p).result = &(p).dir_entry), 0) :				\
> -     0),								\
> -    (_Xos_processUnlock),						\
> -    (p).result) )
>  # elif defined(_POSIX_REENTRANT_FUNCTIONS)
>  /* POSIX draft API, returns (int)0 on success. */
>  #  define _XReaddir(d,p)	\
> @@ -945,8 +893,8 @@ typedef struct {
>     (_Xos_processUnlock), \
>     (p).result )
>  
> -#elif !defined(_POSIX_THREAD_SAFE_FUNCTIONS) && (defined(__osf__) || defined(hpV4))
> -/* Returns (int)0 on success.  OSF/1 v3.2, HP/UX 10
> +#elif !defined(_POSIX_THREAD_SAFE_FUNCTIONS) &&  defined(hpV4)
> +/* Returns (int)0 on success.
>   *
>   * extern int asctime_r(const struct tm *timeptr, char *buffer, int buflen);
>   * extern int ctime_r(const time_t *timer, char *buffer, int buflen);
> @@ -967,7 +915,7 @@ typedef struct tm _Xltimeparams;
>  # define _XGmtime(t,p)		(gmtime_r((t),&(p)) ? NULL : &(p))
>  # define _XLocaltime(t,p)	(localtime_r((t),&(p)) ? NULL : &(p))
>  
> -#elif !defined(_POSIX_THREAD_SAFE_FUNCTIONS) && defined(sun)
> +#elif !defined(_POSIX_THREAD_SAFE_FUNCTIONS) && defined(__sun)
>  /* Returns NULL on failure.  Solaris 2.5
>   *
>   * extern char *asctime_r(const struct tm *tm,char *buf, int buflen);
> @@ -990,19 +938,12 @@ typedef struct tm _Xltimeparams;
>  # define _XLocaltime(t,p)	localtime_r((t),&(p))
>  
>  #else /* defined(_POSIX_THREAD_SAFE_FUNCTIONS) */
> -/* POSIX final API.  OSF/1 v4.0, AIX, etc.
> - *
> +/* POSIX final API.
>   * extern char *asctime_r(const struct tm *timeptr, char *buffer);
>   * extern char *ctime_r(const time_t *timer, char *buffer);
>   * extern struct tm *gmtime_r(const time_t *timer, struct tm *result);
>   * extern struct tm *localtime_r(const time_t *timer, struct tm *result);
>   */
> -# if defined(__osf__)
> -/* OSF/1 V4.0 <time.h> doesn't declare the _P routines, breaking under C++. */
> -extern char *_Pasctime_r(const struct tm *, char *);
> -extern char *_Pctime_r(const time_t *, char *);
> -extern struct tm *_Plocaltime_r(const time_t *, struct tm *);
> -# endif
>  # ifdef TIMELEN
>  typedef char _Xatimeparams[TIMELEN];
>  typedef char _Xctimeparams[TIMELEN];
> @@ -1097,8 +1038,8 @@ typedef struct {
>     (_Xos_processUnlock), \
>     (p).pgrp )
>  
> -#elif !defined(_POSIX_THREAD_SAFE_FUNCTIONS) && (defined(sun) || defined(__osf__))
> -/* Non-POSIX API.  Solaris, DEC v3.2.
> +#elif !defined(_POSIX_THREAD_SAFE_FUNCTIONS) && defined(__sun)
> +/* Non-POSIX API.  Solaris.
>   *
>   * extern struct group *getgrgid_r(gid_t, struct group *, char *, int);
>   * extern struct group *getgrnam_r(const char *, struct group *, char *, int);
> @@ -1111,8 +1052,7 @@ typedef struct {
>  #define _XGetgrnam(n,p)	getgrnam_r((n), &(p).grp, (p).buf, sizeof((p).buf))
>  
>  #elif !defined(_POSIX_THREAD_SAFE_FUNCTIONS)
> -/* Non-POSIX API.  HP/UX 10, AIX 4.
> - *
> +/* Non-POSIX API.
>   * extern int getgrgid_r(gid_t, struct group *, char *, int);
>   * extern int getgrnam_r(const char *, struct group *, char *, int);
>   */
> @@ -1126,16 +1066,11 @@ typedef struct {
>   ((getgrnam_r((n), &(p).grp, (p).buf, sizeof((p).buf)) ? NULL : &(p).grp))
>  
>  #else
> -/* POSIX final API.  DEC v4.0, IRIX 6.2.
> +/* POSIX final API.
>   *
>   * int getgrgid_r(gid_t, struct group *, char *, size_t, struct group **);
>   * int getgrnam_r(const char *, struct group *, char *, size_t, struct group **);
>   */
> -# if defined(__osf__)
> -/* OSF/1 V4.0 <grp.h> doesn't declare the _P routines, breaking under C++. */
> -extern int _Pgetgrgid_r(gid_t, struct group *, char *, size_t, struct group **);
> -extern int _Pgetgrnam_r(const char *, struct group *, char *, size_t, struct group **);
> -# endif
>  typedef struct {
>    struct group grp;
>    char buf[X_LINE_MAX];	/* Should be sysconf(_SC_GETGR_R_SIZE_MAX)? */
> diff --git a/recipes/xorg-lib/xorg-headers-native/X11/Xosdefs.h b/recipes/xorg-lib/xorg-headers-native/X11/Xosdefs.h
> index d6c7682..33eaee4 100644
> --- a/recipes/xorg-lib/xorg-headers-native/X11/Xosdefs.h
> +++ b/recipes/xorg-lib/xorg-headers-native/X11/Xosdefs.h
> @@ -1,9 +1,6 @@
>  /*
>   * O/S-dependent (mis)feature macro definitions
>   *
> - * $XdotOrg: proto/X11/Xosdefs.h,v 1.7 2005/11/08 06:33:25 jkj Exp $
> - * $Xorg: Xosdefs.h,v 1.5 2001/02/09 02:03:23 xorgcvs Exp $
> - *
>  Copyright 1991, 1998  The Open Group
>  
>  Permission to use, copy, modify, distribute, and sell this software and its
> @@ -26,141 +23,94 @@ Except as contained in this notice, the name of The Open Group shall not be
>  used in advertising or otherwise to promote the sale, use or other dealings
>  in this Software without prior written authorization from The Open Group.
>   */
> -/* $XFree86: xc/include/Xosdefs.h,v 3.20 2002/05/31 18:45:39 dawes Exp $ */
>  
>  #ifndef _XOSDEFS_H_
> -#define _XOSDEFS_H_
> +# define _XOSDEFS_H_
>  
>  /*
> - * X_NOT_STDC_ENV means does not have ANSI C header files.  Lack of this
> - * symbol does NOT mean that the system has stdarg.h.
> - *
>   * X_NOT_POSIX means does not have POSIX header files.  Lack of this
>   * symbol does NOT mean that the POSIX environment is the default.
>   * You may still have to define _POSIX_SOURCE to get it.
>   */
>  
> -#ifdef NOSTDHDRS
> -#define X_NOT_POSIX
> -#define X_NOT_STDC_ENV
> -#endif
> -
> -#ifdef sony
> -#if !defined(SYSTYPE_SYSV) && !defined(_SYSTYPE_SYSV)
> -#define X_NOT_POSIX
> -#endif
> -#endif
> -
> -#ifdef UTEK
> -#define X_NOT_POSIX
> -#define X_NOT_STDC_ENV
> -#endif
> -
> -#ifdef vax
> -#ifndef ultrix			/* assume vanilla BSD */
> -#define X_NOT_POSIX
> -#define X_NOT_STDC_ENV
> -#endif
> -#endif
> -
> -#ifdef luna
> -#define X_NOT_POSIX
> -#define X_NOT_STDC_ENV
> -#endif
> -
> -#ifdef Mips
> -#define X_NOT_POSIX
> -#define X_NOT_STDC_ENV
> -#endif
> -  
> -#ifdef USL
> -#ifdef SYSV /* (release 3.2) */
> -#define X_NOT_POSIX
> -#define X_NOT_STDC_ENV
> -#endif
> -#endif
> -
> -#ifdef _SCO_DS
> -#ifndef __SCO__
> -#define __SCO__
> -#endif
> -#endif
> -
> -#ifdef i386
> -#ifdef SYSV
> -#if !defined(ISC) && !defined(__SCO__) && !defined(_SEQUENT_) && \
> -	!defined(__UNIXWARE__) && !defined(sun)
> -#if !defined(_POSIX_SOURCE)
> -#define X_NOT_POSIX
> -#endif
> -#define X_NOT_STDC_ENV
> -#endif
> -#endif
> -#endif
> -
> -#ifdef MOTOROLA
> -#ifdef SYSV
> -#define X_NOT_STDC_ENV
> -#endif
> -#endif
> -
> -#ifdef sun
> +
> +# ifdef _SCO_DS
> +#  ifndef __SCO__
> +#   define __SCO__
> +#  endif
> +# endif
> +
> +# ifdef __i386__
> +#  ifdef SYSV
> +#   if !defined(__SCO__) && \
> +	!defined(__UNIXWARE__) && !defined(__sun)
> +#    if !defined(_POSIX_SOURCE)
> +#     define X_NOT_POSIX
> +#    endif
> +#   endif
> +#  endif
> +# endif
> +
> +# ifdef __sun
>  /* Imake configs define SVR4 on Solaris, but cc & gcc only define __SVR4
>   * This check allows non-Imake configured programs to build correctly.
>   */
> -#if defined(__SVR4) && !defined(SVR4)
> -#define SVR4 1
> -#endif
> -#ifdef SVR4
> +#  if defined(__SVR4) && !defined(SVR4)
> +#   define SVR4 1
> +#  endif
> +#  ifdef SVR4
>  /* define this to whatever it needs to be */
> -#define X_POSIX_C_SOURCE 199300L
> -#endif
> -#endif
> -
> -#ifdef WIN32
> -#ifndef _POSIX_
> -#define X_NOT_POSIX
> -#endif
> -#endif
> -
> -#if defined(nec_ews_svr2) || defined(SX) || defined(PC_UX)
> -#define X_NOT_POSIX
> -#define X_NOT_STDC_ENV
> -#endif
> -
> -#ifdef __UNIXOS2__
> -#define USGISH
> -#define NULL_NOT_ZERO
> -#endif
> -
> -#ifdef __DARWIN__
> -#define NULL_NOT_ZERO
> -#endif
> -
> -#ifdef __GNU__
> -#ifndef PATH_MAX
> -#define PATH_MAX 4096
> -#endif
> -#ifndef MAXPATHLEN
> -#define MAXPATHLEN 4096
> -#endif
> -#endif
> -
> -#if defined(__SCO__) || defined(__UNIXWARE__)
> -# ifndef PATH_MAX
> -#  define PATH_MAX	1024
> +#   define X_POSIX_C_SOURCE 199300L
> +#  endif
> +# endif
> +
> +# ifdef WIN32
> +#  ifndef _POSIX_
> +#   define X_NOT_POSIX
> +#  endif
>  # endif
> -# ifndef MAXPATHLEN
> -#  define MAXPATHLEN	1024
> +
> +
> +# ifdef __APPLE__
> +#  define NULL_NOT_ZERO
> +
> +/* Defining any of these will sanitize the namespace to JUST want is defined by
> + * that particular standard.  If that happens, we don't get some expected
> + * prototypes, typedefs, etc (like fd_mask).  We can define _DARWIN_C_SOURCE to
> + * loosen our belts a tad.
> + */
> +#  if defined(_XOPEN_SOURCE) || defined(_POSIX_SOURCE) || defined(_POSIX_C_SOURCE)
> +#   ifndef _DARWIN_C_SOURCE
> +#    define _DARWIN_C_SOURCE
> +#   endif
> +#  endif
> +
> +# endif
> +
> +# ifdef __GNU__
> +#  ifndef PATH_MAX
> +#   define PATH_MAX 4096
> +#  endif
> +#  ifndef MAXPATHLEN
> +#   define MAXPATHLEN 4096
> +#  endif
> +# endif
> +
> +# if defined(__SCO__) || defined(__UNIXWARE__)
> +#  ifndef PATH_MAX
> +#   define PATH_MAX	1024
> +#  endif
> +#  ifndef MAXPATHLEN
> +#   define MAXPATHLEN	1024
> +#  endif
>  # endif
> -#endif
>  
> -#if defined(__OpenBSD__) || defined(__NetBSD__) || defined(__FreeBSD__) \
> -	|| defined(__Darwin__) || defined(__DragonFly__)
> -# ifndef CSRG_BASED
> -#  define CSRG_BASED
> +# if defined(__OpenBSD__) || defined(__NetBSD__) || defined(__FreeBSD__) \
> +	|| defined(__APPLE__) || defined(__DragonFly__)
> +#  ifndef CSRG_BASED
> +#   define CSRG_BASED
> +#  endif
>  # endif
> -#endif
>  
>  #endif /* _XOSDEFS_H_ */
>  
> diff --git a/recipes/xorg-lib/xorg-headers-native/X11/Xpoll.h b/recipes/xorg-lib/xorg-headers-native/X11/Xpoll.h
> index e483c21..e96ea12 100644
> --- a/recipes/xorg-lib/xorg-headers-native/X11/Xpoll.h
> +++ b/recipes/xorg-lib/xorg-headers-native/X11/Xpoll.h
> @@ -1,5 +1,3 @@
> -/* $Xorg: Xpoll.h,v 1.4 2001/02/09 02:03:23 xorgcvs Exp $ */
> -
>  /*
>  
>  Copyright 1994, 1998  The Open Group
> @@ -49,8 +47,6 @@ from The Open Group.
>   * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
>  */
>  
> -/* $XFree86: xc/include/Xpoll.h,v 3.8 2001/01/17 17:53:11 dawes Exp $ */
> -
>  #ifndef _XPOLL_H_
>  #define _XPOLL_H_
>  
> @@ -60,32 +56,7 @@ from The Open Group.
>  
>  #include <X11/Xos.h>
>  
> -/* Below is the monster branch from hell.  Basically, most systems will drop to
> - * 'the branch below is the fallthrough for halfway modern systems', and include
> - * <sys/select.h>, so we get the FD_* macros. */
> -#if !defined(DGUX)
> -# if (defined(SVR4) || defined(CRAY) || defined(AIXV3)) && !defined(FD_SETSIZE)
> -#  include <sys/select.h>
> -#  ifdef luna
> -#   include <sysent.h>
> -#  endif
> -# else /* not SVR4/CRAY/AIXv3 */
> -#  if defined(AIXV4) /* AIX 4.2 fubar-ed <sys/select.h>, so try really hard. */
> -#   if !defined(NFDBITS)
> -#    include <sys/select.h>
> -#   endif
> -#  else /* the branch below is the fallthrough for halfway modern systems */
> -#   ifdef __QNX__  /* Make sure we get 256 bit select masks */
> -#    define FD_SETSIZE 256
> -#   endif
> -#   include <sys/select.h>
> -#  endif
> -# endif
> -#else /* DGUX  -- No sys/select in Intel DG/ux */
> -# include <sys/time.h> 
> -# include <sys/types.h>
> -# include <unistd.h>
> -#endif
> +#include <sys/select.h>  /* Get the FD_* macros. */
>  
>  #include <X11/Xmd.h>
>  
> @@ -114,21 +85,13 @@ typedef long fd_mask;
>  #define howmany(x,y)	(((x)+((y)-1))/(y))
>  #endif
>  
> -#if defined(BSD) && BSD < 198911 && !defined(luna)
> +#if defined(BSD) && BSD < 198911 
>  typedef struct fd_set {
>  	fd_mask fds_bits[howmany(FD_SETSIZE, NFDBITS)];
>  } fd_set;
>  #endif
>  
> -#ifndef hpux /* and perhaps old BSD ??? */
>  # define Select(n,r,w,e,t) select(n,(fd_set*)r,(fd_set*)w,(fd_set*)e,(struct timeval*)t)
> -#else
> -# ifndef _XPG4_EXTENDED /* HPUX 9.x and earlier */
> -#  define Select(n,r,w,e,t) select(n,(int*)r,(int*)w,(int*)e,(struct timeval*)t)
> -# else
> -#  define Select(n,r,w,e,t) select(n,(fd_set*)r,(fd_set*)w,(fd_set*)e,(struct timeval*)t)
> -# endif
> -#endif
>  
>  #define __X_FDS_BITS __fds_bits
>  
> diff --git a/recipes/xorg-lib/xorg-headers-native/X11/Xproto.h b/recipes/xorg-lib/xorg-headers-native/X11/Xproto.h
> index e5bba70..495d441 100644
> --- a/recipes/xorg-lib/xorg-headers-native/X11/Xproto.h
> +++ b/recipes/xorg-lib/xorg-headers-native/X11/Xproto.h
> @@ -1,7 +1,3 @@
> -/*
> - *	$Xorg: Xproto.h,v 1.4 2001/02/09 02:03:23 xorgcvs Exp $
> - */
> -
>  /* Definitions for the X window system used by server and c bindings */
>  
>  /*
> @@ -1212,6 +1208,38 @@ typedef struct _xEvent {
>      } u;
>  } xEvent;
>  
> +/*********************************************************
> + *
> + * Generic event
> + * 
> + * Those events are not part of the core protocol spec and can be used by
> + * various extensions.
> + * type is always GenericEvent
> + * extension is the minor opcode of the extension the event belongs to.
> + * evtype is the actual event type, unique __per extension__. 
> + *
> + * GenericEvents can be longer than 32 bytes, with the length field
> + * specifying the number of 4 byte blocks after the first 32 bytes. 
> + *
> + *
> + */
> +typedef struct 
> +{
> +    BYTE    type;
> +    CARD8   extension;
> +    CARD16  sequenceNumber B16;
> +    CARD32  length B32;
> +    CARD16  evtype B16;
> +    CARD16  pad2 B16;
> +    CARD32  pad3 B32;
> +    CARD32  pad4 B32;
> +    CARD32  pad5 B32;
> +    CARD32  pad6 B32;
> +    CARD32  pad7 B32;
> +} xGenericEvent;
> +
> +
> +
>  /* KeymapNotify events are not included in the above union because they
>     are different from all other events: they do not have a "detail"
>     or "sequenceNumber", so there is room for a 248-bit key mask. */
> diff --git a/recipes/xorg-lib/xorg-headers-native/X11/Xprotostr.h b/recipes/xorg-lib/xorg-headers-native/X11/Xprotostr.h
> index f343d98..a9e854d 100644
> --- a/recipes/xorg-lib/xorg-headers-native/X11/Xprotostr.h
> +++ b/recipes/xorg-lib/xorg-headers-native/X11/Xprotostr.h
> @@ -1,4 +1,3 @@
> -/* $Xorg: Xprotostr.h,v 1.4 2001/02/09 02:03:23 xorgcvs Exp $ */
>  #ifndef XPROTOSTRUCTS_H
>  #define XPROTOSTRUCTS_H
>  
> diff --git a/recipes/xorg-lib/xorg-headers-native/X11/Xregion.h b/recipes/xorg-lib/xorg-headers-native/X11/Xregion.h
> index 2ddf12c..7b376e5 100644
> --- a/recipes/xorg-lib/xorg-headers-native/X11/Xregion.h
> +++ b/recipes/xorg-lib/xorg-headers-native/X11/Xregion.h
> @@ -1,4 +1,3 @@
> -/* $Xorg: region.h,v 1.4 2001/02/09 02:03:40 xorgcvs Exp $ */
>  /************************************************************************
>  
>  Copyright 1987, 1998  The Open Group
> @@ -28,13 +27,13 @@ Copyright 1987 by Digital Equipment Corporation, Maynard, Massachusetts.
>  
>                          All Rights Reserved
>  
> -Permission to use, copy, modify, and distribute this software and its 
> -documentation for any purpose and without fee is hereby granted, 
> +Permission to use, copy, modify, and distribute this software and its
> +documentation for any purpose and without fee is hereby granted,
>  provided that the above copyright notice appear in all copies and that
> -both that copyright notice and this permission notice appear in 
> +both that copyright notice and this permission notice appear in
>  supporting documentation, and that the name of Digital not be
>  used in advertising or publicity pertaining to distribution of the
> -software without specific, written prior permission.  
> +software without specific, written prior permission.
>  
>  DIGITAL DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE, INCLUDING
>  ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO EVENT SHALL
> @@ -69,7 +68,7 @@ typedef struct {
>  #endif
>  
>  
> -/* 
> +/*
>   *   clip region
>   */
>  
> @@ -80,13 +79,13 @@ typedef struct _XRegion {
>      BOX extents;
>  } REGION;
>  
> -/* Xutil.h contains the declaration: 
> - * typedef struct _XRegion *Region; 
> - */   
> +/* Xutil.h contains the declaration:
> + * typedef struct _XRegion *Region;
> + */
>  
>  /*  1 if two BOXs overlap.
>   *  0 if two BOXs do not overlap.
> - *  Remember, x2 and y2 are not in the region 
> + *  Remember, x2 and y2 are not in the region
>   */
>  #define EXTENTCHECK(r1, r2) \
>  	((r1)->x2 > (r2)->x1 && \
> diff --git a/recipes/xorg-lib/xorg-headers-native/X11/Xresource.h b/recipes/xorg-lib/xorg-headers-native/X11/Xresource.h
> index ce12137..dbb144c 100644
> --- a/recipes/xorg-lib/xorg-headers-native/X11/Xresource.h
> +++ b/recipes/xorg-lib/xorg-headers-native/X11/Xresource.h
> @@ -1,4 +1,3 @@
> -/* $Xorg: Xresource.h,v 1.7 2001/02/09 02:03:39 xorgcvs Exp $ */
>  
>  /***********************************************************
>  
> @@ -29,13 +28,13 @@ Copyright 1987, 1988 by Digital Equipment Corporation, Maynard, Massachusetts.
>  
>                          All Rights Reserved
>  
> -Permission to use, copy, modify, and distribute this software and its 
> -documentation for any purpose and without fee is hereby granted, 
> +Permission to use, copy, modify, and distribute this software and its
> +documentation for any purpose and without fee is hereby granted,
>  provided that the above copyright notice appear in all copies and that
> -both that copyright notice and this permission notice appear in 
> +both that copyright notice and this permission notice appear in
>  supporting documentation, and that the name of Digital not be
>  used in advertising or publicity pertaining to distribution of the
> -software without specific, written prior permission.  
> +software without specific, written prior permission.
>  
>  DIGITAL DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE, INCLUDING
>  ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO EVENT SHALL
> @@ -46,7 +45,6 @@ ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS
>  SOFTWARE.
>  
>  ******************************************************************/
> -/* $XFree86: xc/lib/X11/Xresource.h,v 3.8 2001/12/14 19:54:10 dawes Exp $ */
>  
>  #ifndef _XRESOURCE_H_
>  #define _XRESOURCE_H_
> @@ -178,7 +176,7 @@ typedef struct _XrmHashBucketRec *XrmDatabase;
>  
>  
>  extern void XrmDestroyDatabase(
> -    XrmDatabase		/* database */    
> +    XrmDatabase		/* database */
>  );
>  
>  extern void XrmQPutResource(
> @@ -333,7 +331,7 @@ typedef enum {
>      XrmoptionResArg,	/* Resource and value in next argument in argv      */
>      XrmoptionSkipArg,   /* Ignore this option and the next argument in argv */
>      XrmoptionSkipLine,  /* Ignore this option and the rest of argv	    */
> -    XrmoptionSkipNArgs	/* Ignore this option and the next 
> +    XrmoptionSkipNArgs	/* Ignore this option and the next
>  			   OptionDescRes.value arguments in argv */
>  } XrmOptionKind;
>  
> @@ -351,7 +349,7 @@ extern void XrmParseCommand(
>      int			/* table_count */,
>      _Xconst char*	/* name */,
>      int*		/* argc_in_out */,
> -    char**		/* argv_in_out */		     
> +    char**		/* argv_in_out */
>  );
>  
>  _XFUNCPROTOEND
> diff --git a/recipes/xorg-lib/xorg-headers-native/X11/Xthreads.h b/recipes/xorg-lib/xorg-headers-native/X11/Xthreads.h
> index 54b5440..3d44208 100644
> --- a/recipes/xorg-lib/xorg-headers-native/X11/Xthreads.h
> +++ b/recipes/xorg-lib/xorg-headers-native/X11/Xthreads.h
> @@ -1,7 +1,5 @@
>  /*
> - * $Xorg: Xthreads.h,v 1.5 2001/02/09 02:03:23 xorgcvs Exp $
>   *
> - * 
>  Copyright 1993, 1998  The Open Group
>  
>  Permission to use, copy, modify, distribute, and sell this software and its
> @@ -25,80 +23,79 @@ used in advertising or otherwise to promote the sale, use or other dealings
>  in this Software without prior written authorization from The Open Group.
>   * *
>   */
> -/* $XFree86: Xthreads.h,v 3.10 2001/12/14 19:53:26 dawes Exp $ */
>  
>  #ifndef _XTHREADS_H_
> -#define _XTHREADS_H_
> +# define _XTHREADS_H_
>  
>  /* Redefine these to XtMalloc/XtFree or whatever you want before including
>   * this header file.
>   */
> -#ifndef xmalloc
> -#define xmalloc malloc
> -#endif
> -#ifndef xfree
> -#define xfree free
> -#endif
> +# ifndef xmalloc
> +#  define xmalloc malloc
> +# endif
> +# ifndef xfree
> +#  define xfree free
> +# endif
>  
> -#ifdef CTHREADS
> -#include <cthreads.h>
> +# ifdef CTHREADS
> +#  include <cthreads.h>
>  typedef cthread_t xthread_t;
>  typedef struct condition xcondition_rec;
>  typedef struct mutex xmutex_rec;
> -#define xthread_init() cthread_init()
> -#define xthread_self cthread_self
> -#define xthread_fork(func,closure) cthread_fork(func,closure)
> -#define xthread_yield() cthread_yield()
> -#define xthread_exit(v) cthread_exit(v)
> -#define xthread_set_name(t,str) cthread_set_name(t,str)
> -#define xmutex_init(m) mutex_init(m)
> -#define xmutex_clear(m) mutex_clear(m)
> -#define xmutex_lock(m) mutex_lock(m)
> -#define xmutex_unlock(m) mutex_unlock(m)
> -#define xmutex_set_name(m,str) mutex_set_name(m,str)
> -#define xcondition_init(cv) condition_init(cv)
> -#define xcondition_clear(cv) condition_clear(cv)
> -#define xcondition_wait(cv,m) condition_wait(cv,m)
> -#define xcondition_signal(cv) condition_signal(cv)
> -#define xcondition_broadcast(cv) condition_broadcast(cv)
> -#define xcondition_set_name(cv,str) condition_set_name(cv,str)
> -#else /* !CTHREADS */
> -#if defined(SVR4) && !defined(__sgi) && !defined(_SEQUENT_)
> -#include <thread.h>
> -#include <synch.h>
> +#  define xthread_init() cthread_init()
> +#  define xthread_self cthread_self
> +#  define xthread_fork(func,closure) cthread_fork(func,closure)
> +#  define xthread_yield() cthread_yield()
> +#  define xthread_exit(v) cthread_exit(v)
> +#  define xthread_set_name(t,str) cthread_set_name(t,str)
> +#  define xmutex_init(m) mutex_init(m)
> +#  define xmutex_clear(m) mutex_clear(m)
> +#  define xmutex_lock(m) mutex_lock(m)
> +#  define xmutex_unlock(m) mutex_unlock(m)
> +#  define xmutex_set_name(m,str) mutex_set_name(m,str)
> +#  define xcondition_init(cv) condition_init(cv)
> +#  define xcondition_clear(cv) condition_clear(cv)
> +#  define xcondition_wait(cv,m) condition_wait(cv,m)
> +#  define xcondition_signal(cv) condition_signal(cv)
> +#  define xcondition_broadcast(cv) condition_broadcast(cv)
> +#  define xcondition_set_name(cv,str) condition_set_name(cv,str)
> +# else /* !CTHREADS */
> +#  if defined(SVR4)
> +#   include <thread.h>
> +#   include <synch.h>
>  typedef thread_t xthread_t;
>  typedef thread_key_t xthread_key_t;
>  typedef cond_t xcondition_rec;
>  typedef mutex_t xmutex_rec;
> -#if defined(__UNIXWARE__)
> +#   if defined(__UNIXWARE__)
>  extern xthread_t (*_x11_thr_self)();
> -#define xthread_self  (_x11_thr_self)
> -#else
> -#define xthread_self thr_self
> -#endif
> -#define xthread_fork(func,closure) thr_create(NULL,0,func,closure,THR_NEW_LWP|THR_DETACHED,NULL)
> -#define xthread_yield() thr_yield()
> -#define xthread_exit(v) thr_exit(v)
> -#define xthread_key_create(kp,d) thr_keycreate(kp,d)
> -#ifdef sun
> -#define xthread_key_delete(k) 0
> -#else
> -#define xthread_key_delete(k) thr_keydelete(k)
> -#endif
> -#define xthread_set_specific(k,v) thr_setspecific(k,v)
> -#define xthread_get_specific(k,vp) thr_getspecific(k,vp)
> -#define xmutex_init(m) mutex_init(m,USYNC_THREAD,0)
> -#define xmutex_clear(m) mutex_destroy(m)
> -#define xmutex_lock(m) mutex_lock(m)
> -#define xmutex_unlock(m) mutex_unlock(m)
> -#define xcondition_init(cv) cond_init(cv,USYNC_THREAD,0)
> -#define xcondition_clear(cv) cond_destroy(cv)
> -#define xcondition_wait(cv,m) cond_wait(cv,m)
> -#define xcondition_signal(cv) cond_signal(cv)
> -#define xcondition_broadcast(cv) cond_broadcast(cv)
> -#else /* !SVR4 */
> -#ifdef WIN32
> -#include <X11/Xwindows.h>
> +#    define xthread_self  (_x11_thr_self)
> +#   else
> +#    define xthread_self thr_self
> +#   endif
> +#   define xthread_fork(func,closure) thr_create(NULL,0,func,closure,THR_NEW_LWP|THR_DETACHED,NULL)
> +#   define xthread_yield() thr_yield()
> +#   define xthread_exit(v) thr_exit(v)
> +#   define xthread_key_create(kp,d) thr_keycreate(kp,d)
> +#   ifdef __sun
> +#    define xthread_key_delete(k) 0
> +#   else
> +#    define xthread_key_delete(k) thr_keydelete(k)
> +#   endif
> +#   define xthread_set_specific(k,v) thr_setspecific(k,v)
> +#   define xthread_get_specific(k,vp) thr_getspecific(k,vp)
> +#   define xmutex_init(m) mutex_init(m,USYNC_THREAD,0)
> +#   define xmutex_clear(m) mutex_destroy(m)
> +#   define xmutex_lock(m) mutex_lock(m)
> +#   define xmutex_unlock(m) mutex_unlock(m)
> +#   define xcondition_init(cv) cond_init(cv,USYNC_THREAD,0)
> +#   define xcondition_clear(cv) cond_destroy(cv)
> +#   define xcondition_wait(cv,m) cond_wait(cv,m)
> +#   define xcondition_signal(cv) cond_signal(cv)
> +#   define xcondition_broadcast(cv) cond_broadcast(cv)
> +#  else /* !SVR4 */
> +#   ifdef WIN32
> +#    include <X11/Xwindows.h>
>  typedef DWORD xthread_t;
>  typedef DWORD xthread_key_t;
>  struct _xthread_waiter {
> @@ -110,31 +107,31 @@ typedef struct {
>      struct _xthread_waiter *waiters;
>  } xcondition_rec;
>  typedef CRITICAL_SECTION xmutex_rec;
> -#define xthread_init() _Xthread_init()
> -#define xthread_self GetCurrentThreadId
> -#define xthread_fork(func,closure) { \
> +#    define xthread_init() _Xthread_init()
> +#    define xthread_self GetCurrentThreadId
> +#    define xthread_fork(func,closure) { \
>      DWORD _tmptid; \
>      CreateThread(NULL, 0, (LPTHREAD_START_ROUTINE)func, (LPVOID)closure, 0, \
>  		 &_tmptid); \
>  }
> -#define xthread_yield() Sleep(0)
> -#define xthread_exit(v) ExitThread((DWORD)(v))
> -#define xthread_key_create(kp,d) *(kp) = TlsAlloc()
> -#define xthread_key_delete(k) TlsFree(k)
> -#define xthread_set_specific(k,v) TlsSetValue(k,v)
> -#define xthread_get_specific(k,vp) TlsGetValue(k)
> -#define xmutex_init(m) InitializeCriticalSection(m)
> -#define xmutex_clear(m) DeleteCriticalSection(m)
> -#define _XMUTEX_NESTS
> -#define xmutex_lock(m) EnterCriticalSection(m)
> -#define xmutex_unlock(m) LeaveCriticalSection(m)
> -#define xcondition_init(cv) { \
> +#    define xthread_yield() Sleep(0)
> +#    define xthread_exit(v) ExitThread((DWORD)(v))
> +#    define xthread_key_create(kp,d) *(kp) = TlsAlloc()
> +#    define xthread_key_delete(k) TlsFree(k)
> +#    define xthread_set_specific(k,v) TlsSetValue(k,v)
> +#    define xthread_get_specific(k,vp) TlsGetValue(k)
> +#    define xmutex_init(m) InitializeCriticalSection(m)
> +#    define xmutex_clear(m) DeleteCriticalSection(m)
> +#    define _XMUTEX_NESTS
> +#    define xmutex_lock(m) EnterCriticalSection(m)
> +#    define xmutex_unlock(m) LeaveCriticalSection(m)
> +#    define xcondition_init(cv) { \
>      InitializeCriticalSection(&(cv)->cs); \
>      (cv)->waiters = NULL; \
>  }
> -#define xcondition_clear(cv) DeleteCriticalSection(&(cv)->cs)
> +#    define xcondition_clear(cv) DeleteCriticalSection(&(cv)->cs)
>  extern struct _xthread_waiter *_Xthread_waiter();
> -#define xcondition_wait(cv,m) { \
> +#    define xcondition_wait(cv,m) { \
>      struct _xthread_waiter *_tmpthr = _Xthread_waiter(); \
>      EnterCriticalSection(&(cv)->cs); \
>      _tmpthr->next = (cv)->waiters; \
> @@ -144,7 +141,7 @@ extern struct _xthread_waiter *_Xthread_waiter();
>      WaitForSingleObject(_tmpthr->sem, INFINITE); \
>      EnterCriticalSection(m); \
>  }
> -#define xcondition_signal(cv) { \
> +#    define xcondition_signal(cv) { \
>      EnterCriticalSection(&(cv)->cs); \
>      if ((cv)->waiters) { \
>          ReleaseSemaphore((cv)->waiters->sem, 1, NULL); \
> @@ -152,7 +149,7 @@ extern struct _xthread_waiter *_Xthread_waiter();
>      } \
>      LeaveCriticalSection(&(cv)->cs); \
>  }
> -#define xcondition_broadcast(cv) { \
> +#    define xcondition_broadcast(cv) { \
>      struct _xthread_waiter *_tmpthr; \
>      EnterCriticalSection(&(cv)->cs); \
>      for (_tmpthr = (cv)->waiters; _tmpthr; _tmpthr = _tmpthr->next) \
> @@ -160,157 +157,157 @@ extern struct _xthread_waiter *_Xthread_waiter();
>      (cv)->waiters = NULL; \
>      LeaveCriticalSection(&(cv)->cs); \
>  }
> -#else /* !WIN32 */
> -#ifdef USE_TIS_SUPPORT
> +#   else /* !WIN32 */
> +#    ifdef USE_TIS_SUPPORT
>  /*
>   * TIS support is intended for thread safe libraries.
>   * This should not be used for general client programming.
>   */
> -#include <tis.h>
> +#     include <tis.h>
>  typedef pthread_t xthread_t;
>  typedef pthread_key_t xthread_key_t;
>  typedef pthread_cond_t xcondition_rec;
>  typedef pthread_mutex_t xmutex_rec;
> -#define xthread_self tis_self
> -#define xthread_fork(func,closure) { pthread_t _tmpxthr; \
> +#     define xthread_self tis_self
> +#     define xthread_fork(func,closure) { pthread_t _tmpxthr; \
>          pthread_create(&_tmpxthr,NULL,func,closure); }
> -#define xthread_yield() pthread_yield_np()
> -#define xthread_exit(v) pthread_exit(v)
> -#define xthread_key_create(kp,d) tis_key_create(kp,d)
> -#define xthread_key_delete(k) tis_key_delete(k)
> -#define xthread_set_specific(k,v) tis_setspecific(k,v)
> -#define xthread_get_specific(k,vp) *(vp) = tis_getspecific(k)
> -#define XMUTEX_INITIALIZER PTHREAD_MUTEX_INITIALIZER
> -#define xmutex_init(m) tis_mutex_init(m)
> -#define xmutex_clear(m) tis_mutex_destroy(m)
> -#define xmutex_lock(m) tis_mutex_lock(m)
> -#define xmutex_unlock(m) tis_mutex_unlock(m)
> -#define xcondition_init(c) tis_cond_init(c)
> -#define xcondition_clear(c) tis_cond_destroy(c)
> -#define xcondition_wait(c,m) tis_cond_wait(c,m)
> -#define xcondition_signal(c) tis_cond_signal(c)
> -#define xcondition_broadcast(c) tis_cond_broadcast(c)
> -#else
> -#ifdef USE_NBSD_THREADLIB
> +#     define xthread_yield() pthread_yield_np()
> +#     define xthread_exit(v) pthread_exit(v)
> +#     define xthread_key_create(kp,d) tis_key_create(kp,d)
> +#     define xthread_key_delete(k) tis_key_delete(k)
> +#     define xthread_set_specific(k,v) tis_setspecific(k,v)
> +#     define xthread_get_specific(k,vp) *(vp) = tis_getspecific(k)
> +#     define XMUTEX_INITIALIZER PTHREAD_MUTEX_INITIALIZER
> +#     define xmutex_init(m) tis_mutex_init(m)
> +#     define xmutex_clear(m) tis_mutex_destroy(m)
> +#     define xmutex_lock(m) tis_mutex_lock(m)
> +#     define xmutex_unlock(m) tis_mutex_unlock(m)
> +#     define xcondition_init(c) tis_cond_init(c)
> +#     define xcondition_clear(c) tis_cond_destroy(c)
> +#     define xcondition_wait(c,m) tis_cond_wait(c,m)
> +#     define xcondition_signal(c) tis_cond_signal(c)
> +#     define xcondition_broadcast(c) tis_cond_broadcast(c)
> +#    else
> +#     ifdef USE_NBSD_THREADLIB
>  /*
>   * NetBSD threadlib support is intended for thread safe libraries.
>   * This should not be used for general client programming.
>   */
> -#include <threadlib.h>
> +#      include <threadlib.h>
>  typedef thr_t xthread_t;
>  typedef thread_key_t xthread_key_t;
>  typedef cond_t xcondition_rec;
>  typedef mutex_t xmutex_rec;
> -#define xthread_self thr_self
> -#define xthread_fork(func,closure) { thr_t _tmpxthr; \
> +#      define xthread_self thr_self
> +#      define xthread_fork(func,closure) { thr_t _tmpxthr; \
>  	/* XXX Create it detached?  --thorpej */ \
>  	thr_create(&_tmpxthr,NULL,func,closure); }
> -#define xthread_yield() thr_yield()
> -#define xthread_exit(v) thr_exit(v)
> -#define xthread_key_create(kp,d) thr_keycreate(kp,d)
> -#define xthread_key_delete(k) thr_keydelete(k)
> -#define xthread_set_specific(k,v) thr_setspecific(k,v)
> -#define xthread_get_specific(k,vp) *(vp) = thr_getspecific(k)
> -#define XMUTEX_INITIALIZER MUTEX_INITIALIZER
> -#define xmutex_init(m) mutex_init(m, 0)
> -#define xmutex_clear(m) mutex_destroy(m)
> -#define xmutex_lock(m) mutex_lock(m)
> -#define xmutex_unlock(m) mutex_unlock(m)
> -#define xcondition_init(c) cond_init(c, 0, 0)
> -#define xcondition_clear(c) cond_destroy(c)
> -#define xcondition_wait(c,m) cond_wait(c,m)
> -#define xcondition_signal(c) cond_signal(c)
> -#define xcondition_broadcast(c) cond_broadcast(c)
> -#else
> -#include <pthread.h>
> +#      define xthread_yield() thr_yield()
> +#      define xthread_exit(v) thr_exit(v)
> +#      define xthread_key_create(kp,d) thr_keycreate(kp,d)
> +#      define xthread_key_delete(k) thr_keydelete(k)
> +#      define xthread_set_specific(k,v) thr_setspecific(k,v)
> +#      define xthread_get_specific(k,vp) *(vp) = thr_getspecific(k)
> +#      define XMUTEX_INITIALIZER MUTEX_INITIALIZER
> +#      define xmutex_init(m) mutex_init(m, 0)
> +#      define xmutex_clear(m) mutex_destroy(m)
> +#      define xmutex_lock(m) mutex_lock(m)
> +#      define xmutex_unlock(m) mutex_unlock(m)
> +#      define xcondition_init(c) cond_init(c, 0, 0)
> +#      define xcondition_clear(c) cond_destroy(c)
> +#      define xcondition_wait(c,m) cond_wait(c,m)
> +#      define xcondition_signal(c) cond_signal(c)
> +#      define xcondition_broadcast(c) cond_broadcast(c)
> +#     else
> +#      include <pthread.h>
>  typedef pthread_t xthread_t;
>  typedef pthread_key_t xthread_key_t;
>  typedef pthread_cond_t xcondition_rec;
>  typedef pthread_mutex_t xmutex_rec;
> -#define xthread_self pthread_self
> -#define xthread_yield() pthread_yield()
> -#define xthread_exit(v) pthread_exit(v)
> -#define xthread_set_specific(k,v) pthread_setspecific(k,v)
> -#define xmutex_clear(m) pthread_mutex_destroy(m)
> -#define xmutex_lock(m) pthread_mutex_lock(m)
> -#define xmutex_unlock(m) pthread_mutex_unlock(m)
> -#ifndef XPRE_STANDARD_API
> -#define xthread_key_create(kp,d) pthread_key_create(kp,d)
> -#define xthread_key_delete(k) pthread_key_delete(k)
> -#define xthread_get_specific(k,vp) *(vp) = pthread_getspecific(k)
> -#define xthread_fork(func,closure) { pthread_t _tmpxthr; \
> +#      define xthread_self pthread_self
> +#      define xthread_yield() pthread_yield()
> +#      define xthread_exit(v) pthread_exit(v)
> +#      define xthread_set_specific(k,v) pthread_setspecific(k,v)
> +#      define xmutex_clear(m) pthread_mutex_destroy(m)
> +#      define xmutex_lock(m) pthread_mutex_lock(m)
> +#      define xmutex_unlock(m) pthread_mutex_unlock(m)
> +#      ifndef XPRE_STANDARD_API
> +#       define xthread_key_create(kp,d) pthread_key_create(kp,d)
> +#       define xthread_key_delete(k) pthread_key_delete(k)
> +#       define xthread_get_specific(k,vp) *(vp) = pthread_getspecific(k)
> +#       define xthread_fork(func,closure) { pthread_t _tmpxthr; \
>  	pthread_create(&_tmpxthr,NULL,func,closure); }
> -#define XMUTEX_INITIALIZER PTHREAD_MUTEX_INITIALIZER
> -#define xmutex_init(m) pthread_mutex_init(m, NULL)
> -#define xcondition_init(c) pthread_cond_init(c, NULL)
> -#else /* XPRE_STANDARD_API */
> -#define xthread_key_create(kp,d) pthread_keycreate(kp,d)
> -#define xthread_key_delete(k) 0
> -#define xthread_get_specific(k,vp) pthread_getspecific(k,vp)
> -#define xthread_fork(func,closure) { pthread_t _tmpxthr; \
> +#       define XMUTEX_INITIALIZER PTHREAD_MUTEX_INITIALIZER
> +#       define xmutex_init(m) pthread_mutex_init(m, NULL)
> +#       define xcondition_init(c) pthread_cond_init(c, NULL)
> +#      else /* XPRE_STANDARD_API */
> +#       define xthread_key_create(kp,d) pthread_keycreate(kp,d)
> +#       define xthread_key_delete(k) 0
> +#       define xthread_get_specific(k,vp) pthread_getspecific(k,vp)
> +#       define xthread_fork(func,closure) { pthread_t _tmpxthr; \
>  	pthread_create(&_tmpxthr,pthread_attr_default,func,closure); }
> -#define xmutex_init(m) pthread_mutex_init(m, pthread_mutexattr_default)
> -#define xcondition_init(c) pthread_cond_init(c, pthread_condattr_default)
> -#endif /* XPRE_STANDARD_API */
> -#define xcondition_clear(c) pthread_cond_destroy(c)
> -#define xcondition_wait(c,m) pthread_cond_wait(c,m)
> -#define xcondition_signal(c) pthread_cond_signal(c)
> -#define xcondition_broadcast(c) pthread_cond_broadcast(c)
> -#if defined(_DECTHREADS_)
> +#       define xmutex_init(m) pthread_mutex_init(m, pthread_mutexattr_default)
> +#       define xcondition_init(c) pthread_cond_init(c, pthread_condattr_default)
> +#      endif /* XPRE_STANDARD_API */
> +#      define xcondition_clear(c) pthread_cond_destroy(c)
> +#      define xcondition_wait(c,m) pthread_cond_wait(c,m)
> +#      define xcondition_signal(c) pthread_cond_signal(c)
> +#      define xcondition_broadcast(c) pthread_cond_broadcast(c)
> +#      if defined(_DECTHREADS_)
>  static xthread_t _X_no_thread_id;
> -#define xthread_have_id(id) !pthread_equal(id, _X_no_thread_id)
> -#define xthread_clear_id(id) id = _X_no_thread_id
> -#define xthread_equal(id1,id2) pthread_equal(id1, id2)
> -#endif /* _DECTHREADS_ */
> -#if defined(__linux__)
> -#define xthread_have_id(id) !pthread_equal(id, 0)
> -#define xthread_clear_id(id) id = 0
> -#define xthread_equal(id1,id2) pthread_equal(id1, id2)
> -#endif /* linux */
> -#if defined(_CMA_VENDOR_) && defined(_CMA__IBM) && (_CMA_VENDOR_ == _CMA__IBM)
> -#ifdef DEBUG			/* too much of a hack to enable normally */
> +#       define xthread_have_id(id) !pthread_equal(id, _X_no_thread_id)
> +#       define xthread_clear_id(id) id = _X_no_thread_id
> +#       define xthread_equal(id1,id2) pthread_equal(id1, id2)
> +#      endif /* _DECTHREADS_ */
> +#      if defined(__linux__)
> +#       define xthread_have_id(id) !pthread_equal(id, 0)
> +#       define xthread_clear_id(id) id = 0
> +#       define xthread_equal(id1,id2) pthread_equal(id1, id2)
> +#      endif /* linux */
> +#      if defined(_CMA_VENDOR_) && defined(_CMA__IBM) && (_CMA_VENDOR_ == _CMA__IBM)
> +#       ifdef DEBUG		/* too much of a hack to enable normally */
>  /* see also cma__obj_set_name() */
> -#define xmutex_set_name(m,str) ((char**)(m)->field1)[5] = (str)
> -#define xcondition_set_name(cv,str) ((char**)(cv)->field1)[5] = (str)
> -#endif /* DEBUG */
> -#endif /* _CMA_VENDOR_ == _CMA__IBM */
> -#endif /* USE_NBSD_THREADLIB */
> -#endif /* USE_TIS_SUPPORT */
> -#endif /* WIN32 */
> -#endif /* SVR4 */
> -#endif /* CTHREADS */
> +#        define xmutex_set_name(m,str) ((char**)(m)->field1)[5] = (str)
> +#        define xcondition_set_name(cv,str) ((char**)(cv)->field1)[5] = (str)
> +#       endif /* DEBUG */
> +#      endif /* _CMA_VENDOR_ == _CMA__IBM */
> +#     endif /* USE_NBSD_THREADLIB */
> +#    endif /* USE_TIS_SUPPORT */
> +#   endif /* WIN32 */
> +#  endif /* SVR4 */
> +# endif /* CTHREADS */
>  typedef xcondition_rec *xcondition_t;
>  typedef xmutex_rec *xmutex_t;
> -#ifndef xcondition_malloc
> -#define xcondition_malloc() (xcondition_t)xmalloc(sizeof(xcondition_rec))
> -#endif
> -#ifndef xcondition_free
> -#define xcondition_free(c) xfree((char *)c)
> -#endif
> -#ifndef xmutex_malloc
> -#define xmutex_malloc() (xmutex_t)xmalloc(sizeof(xmutex_rec))
> -#endif
> -#ifndef xmutex_free
> -#define xmutex_free(m) xfree((char *)m)
> -#endif
> -#ifndef xthread_have_id
> -#define xthread_have_id(id) id
> -#endif
> -#ifndef xthread_clear_id
> -#define xthread_clear_id(id) id = 0
> -#endif
> -#ifndef xthread_equal
> -#define xthread_equal(id1,id2) ((id1) == (id2))
> -#endif
> +# ifndef xcondition_malloc
> +#  define xcondition_malloc() (xcondition_t)xmalloc(sizeof(xcondition_rec))
> +# endif
> +# ifndef xcondition_free
> +#  define xcondition_free(c) xfree((char *)c)
> +# endif
> +# ifndef xmutex_malloc
> +#  define xmutex_malloc() (xmutex_t)xmalloc(sizeof(xmutex_rec))
> +# endif
> +# ifndef xmutex_free
> +#  define xmutex_free(m) xfree((char *)m)
> +# endif
> +# ifndef xthread_have_id
> +#  define xthread_have_id(id) id
> +# endif
> +# ifndef xthread_clear_id
> +#  define xthread_clear_id(id) id = 0
> +# endif
> +# ifndef xthread_equal
> +#  define xthread_equal(id1,id2) ((id1) == (id2))
> +# endif
>  /* aids understood by some debuggers */
> -#ifndef xthread_set_name
> -#define xthread_set_name(t,str)
> -#endif
> -#ifndef xmutex_set_name
> -#define xmutex_set_name(m,str)
> -#endif
> -#ifndef xcondition_set_name
> -#define xcondition_set_name(cv,str)
> -#endif
> +# ifndef xthread_set_name
> +#  define xthread_set_name(t,str)
> +# endif
> +# ifndef xmutex_set_name
> +#  define xmutex_set_name(m,str)
> +# endif
> +# ifndef xcondition_set_name
> +#  define xcondition_set_name(cv,str)
> +# endif
>  
>  #endif /* _XTHREADS_H_ */
> diff --git a/recipes/xorg-lib/xorg-headers-native/X11/Xutil.h b/recipes/xorg-lib/xorg-headers-native/X11/Xutil.h
> index 9f2ef63..8ff34d9 100644
> --- a/recipes/xorg-lib/xorg-headers-native/X11/Xutil.h
> +++ b/recipes/xorg-lib/xorg-headers-native/X11/Xutil.h
> @@ -1,4 +1,3 @@
> -/* $Xorg: Xutil.h,v 1.8 2001/02/09 02:03:39 xorgcvs Exp $ */
>  
>  /***********************************************************
>  
> @@ -29,13 +28,13 @@ Copyright 1987 by Digital Equipment Corporation, Maynard, Massachusetts.
>  
>                          All Rights Reserved
>  
> -Permission to use, copy, modify, and distribute this software and its 
> -documentation for any purpose and without fee is hereby granted, 
> +Permission to use, copy, modify, and distribute this software and its
> +documentation for any purpose and without fee is hereby granted,
>  provided that the above copyright notice appear in all copies and that
> -both that copyright notice and this permission notice appear in 
> +both that copyright notice and this permission notice appear in
>  supporting documentation, and that the name of Digital not be
>  used in advertising or publicity pertaining to distribution of the
> -software without specific, written prior permission.  
> +software without specific, written prior permission.
>  
>  DIGITAL DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE, INCLUDING
>  ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO EVENT SHALL
> @@ -46,7 +45,6 @@ ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS
>  SOFTWARE.
>  
>  ******************************************************************/
> -/* $XFree86: xc/lib/X11/Xutil.h,v 3.6 2003/04/13 19:22:20 dawes Exp $ */
>  
>  #ifndef _XUTIL_H_
>  #define _XUTIL_H_
> @@ -55,7 +53,7 @@ SOFTWARE.
>  #include <X11/Xlib.h>
>  #include <X11/keysym.h>
>  
> -/* 
> +/*
>   * Bitmask returned by XParseGeometry().  Each bit tells if the corresponding
>   * value (x, y, width, height) was found in the parsed string.
>   */
> @@ -151,7 +149,7 @@ IconPositionHint|IconMaskHint|WindowGroupHint)
>  
>  
>  /*
> - * new structure for manipulating TEXT properties; used with WM_NAME, 
> + * new structure for manipulating TEXT properties; used with WM_NAME,
>   * WM_ICON_NAME, WM_CLIENT_MACHINE, and WM_COMMAND.
>   */
>  typedef struct {
> @@ -262,16 +260,16 @@ typedef struct _XComposeStatus {
>     || ((KeySym)(keysym) == XK_Num_Lock))
>  #endif
>  /*
> - * opaque reference to Region data type 
> + * opaque reference to Region data type
>   */
> -typedef struct _XRegion *Region; 
> +typedef struct _XRegion *Region;
>  
>  /* Return values from XRectInRegion() */
> - 
> +
>  #define RectangleOut 0
>  #define RectangleIn  1
>  #define RectanglePart 2
> - 
> +
>  
>  /*
>   * Information used by the visual utility routines to find desired visual
> @@ -452,7 +450,7 @@ extern Status XGetStandardColormap(
>      Display*		/* display */,
>      Window		/* w */,
>      XStandardColormap*	/* colormap_return */,
> -    Atom		/* property */			    
> +    Atom		/* property */
>  );
>  
>  extern Status XGetTextProperty(
> @@ -477,7 +475,7 @@ extern Status XGetWMClientMachine(
>  
>  extern XWMHints *XGetWMHints(
>      Display*		/* display */,
> -    Window		/* w */		      
> +    Window		/* w */
>  );
>  
>  extern Status XGetWMIconName(
> @@ -496,7 +494,7 @@ extern Status XGetWMNormalHints(
>      Display*		/* display */,
>      Window		/* w */,
>      XSizeHints*		/* hints_return */,
> -    long*		/* supplied_return */ 
> +    long*		/* supplied_return */
>  );
>  
>  extern Status XGetWMSizeHints(
> @@ -584,7 +582,7 @@ extern int XSetIconSizes(
>      Display*		/* display */,
>      Window		/* w */,
>      XIconSize*		/* size_list */,
> -    int			/* count */    
> +    int			/* count */
>  );
>  
>  extern int XSetNormalHints(
> diff --git a/recipes/xorg-lib/xorg-headers-native/X11/Xw32defs.h b/recipes/xorg-lib/xorg-headers-native/X11/Xw32defs.h
> index 07624fe..b2e4b33 100644
> --- a/recipes/xorg-lib/xorg-headers-native/X11/Xw32defs.h
> +++ b/recipes/xorg-lib/xorg-headers-native/X11/Xw32defs.h
> @@ -1,81 +1,79 @@
> -/* $Xorg: Xw32defs.h,v 1.3 2000/08/18 04:05:44 coskrey Exp $ */
> -
>  #ifndef _XW32DEFS_H
> -#define  _XW32DEFS_H
> +# define  _XW32DEFS_H
>  
> -#ifdef __GNUC__ /* mingw is more close to unix than msvc */
> -#if !defined(__daddr_t_defined) 
> +# ifdef __GNUC__ /* mingw is more close to unix than msvc */
> +#  if !defined(__daddr_t_defined) 
>  typedef char *caddr_t;
> -#endif
> -#define lstat stat
> +#  endif
> +#  define lstat stat
>  
> -#else
> +# else
>  typedef char *caddr_t;
>  
> -#define access	   _access
> -#define alloca	   _alloca
> -#define chdir	_chdir
> -#define chmod	   _chmod
> -#define close	   _close
> -#define creat	   _creat
> -#define dup	   _dup
> -#define dup2	   _dup2
> -#define environ     _environ
> -#define execl	 _execl
> -#define execle	 _execle
> -#define execlp	 _execlp
> -#define execlpe  _execlpe
> -#define execv	 _execv
> -#define execve	 _execve
> -#define execvp	 _execvp
> -#define execvpe  _execvpe
> -#define fdopen	  _fdopen
> -#define fileno	  _fileno
> -#define fstat	 _fstat
> -#define getcwd	_getcwd
> -#define getpid	 _getpid
> -#define hypot		_hypot
> -#define isascii __isascii
> -#define isatty	   _isatty
> -#define lseek	   _lseek
> -#define mkdir	_mkdir
> -#define mktemp	   _mktemp
> -#define open	   _open
> -#define putenv	    _putenv
> -#define read	   _read
> -#define rmdir	_rmdir
> -#define sleep(x) _sleep((x) * 1000)
> -#define stat	 _stat
> -#define sys_errlist _sys_errlist
> -#define sys_nerr    _sys_nerr
> -#define umask	   _umask
> -#define unlink	   _unlink
> -#define write	   _write
> -#define random   rand
> -#define srandom  srand
> +#  define access	   _access
> +#  define alloca	   _alloca
> +#  define chdir	_chdir
> +#  define chmod	   _chmod
> +#  define close	   _close
> +#  define creat	   _creat
> +#  define dup	   _dup
> +#  define dup2	   _dup2
> +#  define environ     _environ
> +#  define execl	 _execl
> +#  define execle	 _execle
> +#  define execlp	 _execlp
> +#  define execlpe  _execlpe
> +#  define execv	 _execv
> +#  define execve	 _execve
> +#  define execvp	 _execvp
> +#  define execvpe  _execvpe
> +#  define fdopen	  _fdopen
> +#  define fileno	  _fileno
> +#  define fstat	 _fstat
> +#  define getcwd	_getcwd
> +#  define getpid	 _getpid
> +#  define hypot		_hypot
> +#  define isascii __isascii
> +#  define isatty	   _isatty
> +#  define lseek	   _lseek
> +#  define mkdir	_mkdir
> +#  define mktemp	   _mktemp
> +#  define open	   _open
> +#  define putenv	    _putenv
> +#  define read	   _read
> +#  define rmdir	_rmdir
> +#  define sleep(x) Sleep((x) * 1000)
> +#  define stat	 _stat
> +#  define sys_errlist _sys_errlist
> +#  define sys_nerr    _sys_nerr
> +#  define umask	   _umask
> +#  define unlink	   _unlink
> +#  define write	   _write
> +#  define random   rand
> +#  define srandom  srand
>  
> -#define O_RDONLY    _O_RDONLY
> -#define O_WRONLY    _O_WRONLY
> -#define O_RDWR	    _O_RDWR
> -#define O_APPEND    _O_APPEND
> -#define O_CREAT     _O_CREAT
> -#define O_TRUNC     _O_TRUNC
> -#define O_EXCL	    _O_EXCL
> -#define O_TEXT	    _O_TEXT
> -#define O_BINARY    _O_BINARY
> -#define O_RAW	    _O_BINARY
> +#  define O_RDONLY    _O_RDONLY
> +#  define O_WRONLY    _O_WRONLY
> +#  define O_RDWR	    _O_RDWR
> +#  define O_APPEND    _O_APPEND
> +#  define O_CREAT     _O_CREAT
> +#  define O_TRUNC     _O_TRUNC
> +#  define O_EXCL	    _O_EXCL
> +#  define O_TEXT	    _O_TEXT
> +#  define O_BINARY    _O_BINARY
> +#  define O_RAW	    _O_BINARY
>  
> -#define S_IFMT	 _S_IFMT
> -#define S_IFDIR  _S_IFDIR
> -#define S_IFCHR  _S_IFCHR
> -#define S_IFREG  _S_IFREG
> -#define S_IREAD  _S_IREAD
> -#define S_IWRITE _S_IWRITE
> -#define S_IEXEC  _S_IEXEC
> +#  define S_IFMT	 _S_IFMT
> +#  define S_IFDIR  _S_IFDIR
> +#  define S_IFCHR  _S_IFCHR
> +#  define S_IFREG  _S_IFREG
> +#  define S_IREAD  _S_IREAD
> +#  define S_IWRITE _S_IWRITE
> +#  define S_IEXEC  _S_IEXEC
>  
> -#define	F_OK	0
> -#define	X_OK	1
> -#define	W_OK	2
> -#define	R_OK	4
> -#endif /* __GNUC__ */
> +#  define	F_OK	0
> +#  define	X_OK	1
> +#  define	W_OK	2
> +#  define	R_OK	4
> +# endif /* __GNUC__ */
>  #endif
> diff --git a/recipes/xorg-lib/xorg-headers-native/X11/Xwindows.h b/recipes/xorg-lib/xorg-headers-native/X11/Xwindows.h
> index 7fb9840..6318155 100644
> --- a/recipes/xorg-lib/xorg-headers-native/X11/Xwindows.h
> +++ b/recipes/xorg-lib/xorg-headers-native/X11/Xwindows.h
> @@ -1,4 +1,3 @@
> -/* $Xorg$ */
>  /*
>  
>  Copyright 1996, 1998  The Open Group
> @@ -28,18 +27,29 @@ The Open Group.
>  */
>  
>  /*
> - * This header file has for sole purpose to allow to include windows.h
> - * without getting any name conflicts with our code.
> - * Conflicts come from the fact that including windows.h actually pulls
> - * in the whole Windows API...
> + * This header file has the sole purpose of allowing the inclusion of
> + * windows.h without getting any name conflicts with X headers code, by
> + * renaming the conflicting definitions from windows.h
> + *
> + * Some (non-Microsoft) versions of the Windows API headers actually avoid
> + * making the conflicting definitions if XFree86Server is defined, so we
> + * need to remember if that was defined and undefine it during including
> + * windows.h (so the conflicting definitions get wrapped correctly), and
> + * then redefine it afterwards...
> + *
> + * There doesn't seem to be a good way to wrap the min/max macros from
> + * windows.h, so we simply avoid defining them completely, allowing any
> + * pre-existing definition to stand.
> + *
>   */
>  
>  #undef _XFree86Server
> -#ifdef XFree86Server 
> -#define _XFree86Server
> -#undef XFree86Server
> +#ifdef XFree86Server
> +# define _XFree86Server
> +# undef XFree86Server
>  #endif
>  
> +#define NOMINMAX
>  #define BOOL wBOOL
>  #define INT32 wINT32
>  #undef Status
> @@ -48,6 +58,7 @@ The Open Group.
>  #define BYTE wBYTE
>  #define FreeResource wFreeResource
>  #include <windows.h>
> +#undef NOMINMAX
>  #undef Status
>  #define Status int
>  #undef BYTE
> @@ -56,25 +67,25 @@ The Open Group.
>  #undef ATOM
>  #undef FreeResource
>  #undef CreateWindowA
> -#undef min
> -#undef max
>  
>  #ifdef RESOURCE_H
> -#undef RT_FONT
> -#undef RT_CURSOR
> -#define RT_FONT         ((RESTYPE)4)
> -#define RT_CURSOR       ((RESTYPE)5)
> +# undef RT_FONT
> +# undef RT_CURSOR
> +# define RT_FONT         ((RESTYPE)4)
> +# define RT_CURSOR       ((RESTYPE)5)
>  #endif
>  
> -#define sleep(x) Sleep(1000*x)
> +#ifndef __CYGWIN__
> +#define sleep(x) Sleep((x) * 1000)
> +#endif
>  
>  #if defined(WIN32) && (!defined(PATH_MAX) || PATH_MAX < 1024)
> -#undef PATH_MAX
> -#define PATH_MAX 1024
> +# undef PATH_MAX
> +# define PATH_MAX 1024
>  #endif
>  
>  #ifdef _XFree86Server
> -#define XFree86Server
> -#undef _XFree86Server
> +# define XFree86Server
> +# undef _XFree86Server
>  #endif
>  
> diff --git a/recipes/xorg-lib/xorg-headers-native/X11/Xwinsock.h b/recipes/xorg-lib/xorg-headers-native/X11/Xwinsock.h
> index 0278c09..e6ca7b5 100644
> --- a/recipes/xorg-lib/xorg-headers-native/X11/Xwinsock.h
> +++ b/recipes/xorg-lib/xorg-headers-native/X11/Xwinsock.h
> @@ -1,4 +1,3 @@
> -/* $Xorg: Xwinsock.h,v 1.4 2001/02/09 02:03:23 xorgcvs Exp $ */
>  /*
>  
>  Copyright 1996, 1998  The Open Group
> @@ -36,8 +35,8 @@ The Open Group.
>  
>  #undef _XFree86Server
>  #ifdef XFree86Server 
> -#define _XFree86Server
> -#undef XFree86Server
> +# define _XFree86Server
> +# undef XFree86Server
>  #endif
>  
>  #define BOOL wBOOL
> @@ -47,7 +46,7 @@ The Open Group.
>  #define ATOM wATOM
>  #define BYTE wBYTE
>  #define FreeResource wFreeResource
> -#include <winsock.h>
> +#include <winsock2.h>
>  #undef Status
>  #define Status int
>  #undef BYTE
> @@ -60,7 +59,7 @@ The Open Group.
>  #undef RT_CURSOR
>  
>  #ifdef _XFree86Server
> -#define XFree86Server
> -#undef _XFree86Server
> +# define XFree86Server
> +# undef _XFree86Server
>  #endif
>  
> diff --git a/recipes/xorg-lib/xorg-headers-native/X11/cursorfont.h b/recipes/xorg-lib/xorg-headers-native/X11/cursorfont.h
> index c6204f1..70d7125 100644
> --- a/recipes/xorg-lib/xorg-headers-native/X11/cursorfont.h
> +++ b/recipes/xorg-lib/xorg-headers-native/X11/cursorfont.h
> @@ -1,4 +1,3 @@
> -/* $Xorg: cursorfont.h,v 1.4 2001/02/09 02:03:39 xorgcvs Exp $ */
>  /*
>  
>  Copyright 1987, 1998  The Open Group
> @@ -27,6 +26,9 @@ from The Open Group.
>  
>  */
>  
> +#ifndef _cursorfont_h_
> +#define _cursorfont_h_
> +
>  #define XC_num_glyphs 154
>  #define XC_X_cursor 0
>  #define XC_arrow 2
> @@ -105,3 +107,5 @@ from The Open Group.
>  #define XC_ur_angle 148
>  #define XC_watch 150
>  #define XC_xterm 152
> +
> +#endif /* _cursorfont_h_ */
> diff --git a/recipes/xorg-lib/xorg-headers-native/X11/keysym.h b/recipes/xorg-lib/xorg-headers-native/X11/keysym.h
> index 04e2956..641b25b 100644
> --- a/recipes/xorg-lib/xorg-headers-native/X11/keysym.h
> +++ b/recipes/xorg-lib/xorg-headers-native/X11/keysym.h
> @@ -1,5 +1,3 @@
> -/* $Xorg: keysym.h,v 1.4 2001/02/09 02:03:23 xorgcvs Exp $ */
> -
>  /***********************************************************
>  
>  Copyright 1987, 1998  The Open Group
> @@ -46,7 +44,6 @@ ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS
>  SOFTWARE.
>  
>  ******************************************************************/
> -/* $XFree86: xc/include/keysym.h,v 1.3 2001/01/17 17:53:12 dawes Exp $ */
>  
>  /* default keysyms */
>  #define XK_MISCELLANY
> diff --git a/recipes/xorg-lib/xorg-headers-native/X11/keysymdef.h b/recipes/xorg-lib/xorg-headers-native/X11/keysymdef.h
> index dd9fbd9..ec125a6 100644
> --- a/recipes/xorg-lib/xorg-headers-native/X11/keysymdef.h
> +++ b/recipes/xorg-lib/xorg-headers-native/X11/keysymdef.h
> @@ -1,5 +1,3 @@
> -/* $Xorg: keysymdef.h,v 1.4 2001/02/09 02:03:23 $ */
> -
>  /***********************************************************
>  Copyright 1987, 1994, 1998  The Open Group
>  
> @@ -47,7 +45,6 @@ ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS
>  SOFTWARE.
>  
>  ******************************************************************/
> -/* $XFree86: $ */
>  
>  /*
>   * The "X11 Window System Protocol" standard defines in Appendix A the
> @@ -56,7 +53,7 @@ SOFTWARE.
>   * engraving) of a keyboard layout. This file assigns mnemonic macro
>   * names for these keysyms.
>   *
> - * This file is also compiled (by xc/lib/X11/util/makekeys.c) into
> + * This file is also compiled (by src/util/makekeys.c in libX11) into
>   * hash tables that can be accessed with X11 library functions such as
>   * XStringToKeysym() and XKeysymToString().
>   *
> @@ -93,9 +90,26 @@ SOFTWARE.
>   *    /^\#define XK_([a-zA-Z_0-9]+)\s+0x([0-9a-f]+)\s*\/\*\(U+([0-9A-F]{4,6}) (.*)\)\*\/\s*$/
>   *    /^\#define XK_([a-zA-Z_0-9]+)\s+0x([0-9a-f]+)\s*(\/\*\s*(.*)\s*\*\/)?\s*$/
>   *
> + * Before adding new keysyms, please do consider the following: In
> + * addition to the keysym names defined in this file, the
> + * XStringToKeysym() and XKeysymToString() functions will also handle
> + * any keysym string of the form "U0020" to "U007E" and "U00A0" to
> + * "U10FFFF" for all possible Unicode characters. In other words,
> + * every possible Unicode character has already a keysym string
> + * defined algorithmically, even if it is not listed here. Therefore,
> + * defining an additional keysym macro is only necessary where a
> + * non-hexadecimal mnemonic name is needed, or where the new keysym
> + * does not represent any existing Unicode character.
> + *
>   * When adding new keysyms to this file, do not forget to also update the
> - * mappings in xc/lib/X11/KeyBind.c and the protocol specification in
> - * xc/doc/specs/XProtocol/X11.keysyms.
> + * following:
> + *
> + *   - the mappings in src/KeyBind.c in the repo
> + *     git://anongit.freedesktop.org/xorg/lib/libX11
> + *
> + *   - the protocol specification in specs/XProtocol/X11.keysyms
> + *     in the repo git://anongit.freedesktop.org/xorg/doc/xorg-docs
> + *
>   */
>  
>  #define XK_VoidSymbol                  0xffffff  /* Void symbol */
> @@ -327,6 +341,9 @@ SOFTWARE.
>  #define XK_ISO_Level3_Shift              0xfe03
>  #define XK_ISO_Level3_Latch              0xfe04
>  #define XK_ISO_Level3_Lock               0xfe05
> +#define XK_ISO_Level5_Shift              0xfe11
> +#define XK_ISO_Level5_Latch              0xfe12
> +#define XK_ISO_Level5_Lock               0xfe13
>  #define XK_ISO_Group_Shift               0xff7e  /* Alias for mode_switch */
>  #define XK_ISO_Group_Latch               0xfe06
>  #define XK_ISO_Group_Lock                0xfe07
> @@ -365,6 +382,7 @@ SOFTWARE.
>  #define XK_dead_acute                    0xfe51
>  #define XK_dead_circumflex               0xfe52
>  #define XK_dead_tilde                    0xfe53
> +#define XK_dead_perispomeni              0xfe53  /* alias for dead_tilde */
>  #define XK_dead_macron                   0xfe54
>  #define XK_dead_breve                    0xfe55
>  #define XK_dead_abovedot                 0xfe56
> @@ -381,6 +399,34 @@ SOFTWARE.
>  #define XK_dead_hook                     0xfe61
>  #define XK_dead_horn                     0xfe62
>  #define XK_dead_stroke                   0xfe63
> +#define XK_dead_abovecomma               0xfe64
> +#define XK_dead_psili                    0xfe64  /* alias for dead_abovecomma */
> +#define XK_dead_abovereversedcomma       0xfe65
> +#define XK_dead_dasia                    0xfe65  /* alias for dead_abovereversedcomma */
> +#define XK_dead_doublegrave              0xfe66
> +#define XK_dead_belowring                0xfe67
> +#define XK_dead_belowmacron              0xfe68
> +#define XK_dead_belowcircumflex          0xfe69
> +#define XK_dead_belowtilde               0xfe6a
> +#define XK_dead_belowbreve               0xfe6b
> +#define XK_dead_belowdiaeresis           0xfe6c
> +#define XK_dead_invertedbreve            0xfe6d
> +#define XK_dead_belowcomma               0xfe6e
> +#define XK_dead_currency                 0xfe6f
> +
> +/* dead vowels for universal syllable entry */
> +#define XK_dead_a                        0xfe80
> +#define XK_dead_A                        0xfe81
> +#define XK_dead_e                        0xfe82
> +#define XK_dead_E                        0xfe83
> +#define XK_dead_i                        0xfe84
> +#define XK_dead_I                        0xfe85
> +#define XK_dead_o                        0xfe86
> +#define XK_dead_O                        0xfe87
> +#define XK_dead_u                        0xfe88
> +#define XK_dead_U                        0xfe89
> +#define XK_dead_small_schwa              0xfe8a
> +#define XK_dead_capital_schwa            0xfe8b
>  
>  #define XK_First_Virtual_Screen          0xfed0
>  #define XK_Prev_Virtual_Screen           0xfed1
> @@ -1465,20 +1511,20 @@ SOFTWARE.
>  #define XK_downcaret                     0x0ba8  /*(U+2228 LOGICAL OR)*/
>  #define XK_upcaret                       0x0ba9  /*(U+2227 LOGICAL AND)*/
>  #define XK_overbar                       0x0bc0  /*(U+00AF MACRON)*/
> -#define XK_downtack                      0x0bc2  /* U+22A5 UP TACK */
> +#define XK_downtack                      0x0bc2  /* U+22A4 DOWN TACK */
>  #define XK_upshoe                        0x0bc3  /*(U+2229 INTERSECTION)*/
>  #define XK_downstile                     0x0bc4  /* U+230A LEFT FLOOR */
>  #define XK_underbar                      0x0bc6  /*(U+005F LOW LINE)*/
>  #define XK_jot                           0x0bca  /* U+2218 RING OPERATOR */
>  #define XK_quad                          0x0bcc  /* U+2395 APL FUNCTIONAL SYMBOL QUAD */
> -#define XK_uptack                        0x0bce  /* U+22A4 DOWN TACK */
> +#define XK_uptack                        0x0bce  /* U+22A5 UP TACK */
>  #define XK_circle                        0x0bcf  /* U+25CB WHITE CIRCLE */
>  #define XK_upstile                       0x0bd3  /* U+2308 LEFT CEILING */
>  #define XK_downshoe                      0x0bd6  /*(U+222A UNION)*/
>  #define XK_rightshoe                     0x0bd8  /*(U+2283 SUPERSET OF)*/
>  #define XK_leftshoe                      0x0bda  /*(U+2282 SUBSET OF)*/
> -#define XK_lefttack                      0x0bdc  /* U+22A2 RIGHT TACK */
> -#define XK_righttack                     0x0bfc  /* U+22A3 LEFT TACK */
> +#define XK_lefttack                      0x0bdc  /* U+22A3 LEFT TACK */
> +#define XK_righttack                     0x0bfc  /* U+22A2 RIGHT TACK */
>  #endif /* XK_APL */
>  
>  /*
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLyWMoMkyGM64RGpERAqIpAJ4kSfHj8ui9eOZRewNSG5hrmm+P7gCgrxaQ
YqWpU/pFHX/OyxxNXy8JNaY=
=US2O
-----END PGP SIGNATURE-----



