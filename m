Received: from mail-ie0-f176.google.com ([209.85.223.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>)
	id 1TgfX5-0006Ur-NY; Thu, 06 Dec 2012 18:46:48 +0100
Received: by mail-ie0-f176.google.com with SMTP id 13so10157010iea.7
	for <multiple recipients>; Thu, 06 Dec 2012 09:32:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Z+giq+N1+55poa1lSioongwcBCLq8n4pqho65ZYereg=;
	b=u3cDI+7CDlLESOxsfZ6X6W57pR3/zTimKtu/N/vWDuhD4b0/QlZKW8j7hge6wkmbZe
	qyRAtUIuwjxQhcBOi2b/m0Pm7zOtgTU9XFb2G7qRJCa72Q7UTt8aYPNseqr7+bsxtZ8a
	4+Fe2BHbHhuAeGTxtMNG3PeDZ44lDIdap3UsLGHiPh9ZRRgL2/x7gA/jhSr+tV2CbJ+m
	KTDRkJXbvEty96Gl1f5TbELkk+02oNexdVLixTR/sZmEK5deXEbR75ITzIxe7tmGJ/pj
	UIReGwFtpTHtDPQcTKTtm+Go3Uzw1V5gYeXvQuKjyPDaoYf9T5wEgBU4blFCsysaB118
	HnJQ==
MIME-Version: 1.0
Received: by 10.50.237.6 with SMTP id uy6mr6686606igc.31.1354815141412; Thu,
	06 Dec 2012 09:32:21 -0800 (PST)
Received: by 10.64.20.113 with HTTP; Thu, 6 Dec 2012 09:32:21 -0800 (PST)
In-Reply-To: <20121206123443.D67C9103AA@opal>
References: <20121206123443.D67C9103AA@opal>
Date: Thu, 6 Dec 2012 18:32:21 +0100
Message-ID: <CALbNGRRwKq4s9xBsDhHEqnwFRbGBhMtZTW1yKsvF7Nb7GxSU-w@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Chen Qi : ICU: add pkgconfig support
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
X-List-Received-Date: Thu, 06 Dec 2012 17:46:48 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Dec 6, 2012 at 1:34 PM,  <git@git.openembedded.org> wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: a0b553bf00f819c3f0d6744461189179f578a75e
> URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=a0b553bf00f819c3f0d6744461189179f578a75e
>
> Author: Chen Qi <Qi.Chen@windriver.com>
> Date:   Mon Dec  3 18:21:08 2012 +0800
>
> ICU: add pkgconfig support
>
> Add pkgconfig support to ICU.
>
> [YOCTO #2453]
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>
> ---
FYI: This breaks webkit-gtk:

./Source/WebCore/dom/EventListenerMap.h:55:56: error:
'EventListener_3_6' was not declared in this scope
./Source/WebCore/dom/EventListenerMap.h:55:69: error: template
argument 1 is invalid
./Source/WebCore/dom/EventListenerMap.h:56:48: error:
'EventListener_3_6' has not been declared
In file included from ./Source/WebCore/dom/EventTarget.h:35:0,
                 from ./Source/WebCore/dom/Node.h:29,
                 from ./Source/WebCore/editing/VisiblePosition.h:30,
                 from ./Source/WebCore/accessibility/AccessibilityObject.h:35,
                 from ./Source/WebCore/accessibility/AXObjectCache.h:29,
                 from ./Source/WebCore/page/ChromeClient.h:24,
                 from Source/WebKit/gtk/WebCoreSupport/ChromeClientGtk.h:24,
                 from Source/WebKit/gtk/WebCoreSupport/ChromeClientGtk.cpp:26:
./Source/WebCore/dom/EventListenerMap.h:94:5: error:
'EventListener_3_6' does not name a type
In file included from ./Source/WebCore/dom/Node.h:29:0,
                 from ./Source/WebCore/editing/VisiblePosition.h:30,
                 from ./Source/WebCore/accessibility/AccessibilityObject.h:35,
                 from ./Source/WebCore/accessibility/AXObjectCache.h:29,
                 from ./Source/WebCore/page/ChromeClient.h:24,
                 from Source/WebKit/gtk/WebCoreSupport/ChromeClientGtk.h:24,
                 from Source/WebKit/gtk/WebCoreSupport/ChromeClientGtk.cpp:26:
./Source/WebCore/dom/EventTarget.h: In member function 'void
WebCore::EventTarget::visitJSEventListeners(JSC::SlotVisitor&)':
./Source/WebCore/dom/EventTarget.h:190:51: error: 'class
WebCore::EventListenerIterator' has no member named 'nextListener'
./Source/WebCore/dom/EventTarget.h:191:21: error: invalid use of
incomplete type 'class WebCore::EventListener_3_6'
In file included from ./Source/WebCore/dom/Node.h:29:0,
                 from ./Source/WebCore/editing/VisiblePosition.h:30,
                 from ./Source/WebCore/accessibility/AccessibilityObject.h:35,
                 from ./Source/WebCore/accessibility/AXObjectCache.h:29,
                 from ./Source/WebCore/page/ChromeClient.h:24,
                 from Source/WebKit/gtk/WebCoreSupport/ChromeClientGtk.h:24,
                 from Source/WebKit/gtk/WebCoreSupport/ChromeClientGtk.cpp:26:
./Source/WebCore/dom/EventTarget.h:48:11: error: forward declaration
of 'class WebCore::EventListener_3_6'

It seems that webkit-gtk now gets confused by its own unicode renames
(urename.h) extending to 3_2 and the icu headers extending to 3_6.

For now I reverted the patch here to be able to build but it needs to
be fixed at webkit-gtk I think. Anybody working on this?

Andreas


