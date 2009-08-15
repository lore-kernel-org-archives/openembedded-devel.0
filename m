Received: from [81.228.8.164] (helo=pne-smtpout2-sn2.hy.skanova.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1McI3Q-0006Vo-Ph
	for openembedded-devel@lists.openembedded.org;
	Sat, 15 Aug 2009 14:08:12 +0200
Received: from [10.175.196.247] (213.66.88.44) by
	pne-smtpout2-sn2.hy.skanova.net (7.3.140.3) (authenticated as
	u82406562)
	id 4A5BC8BE00289FDF for openembedded-devel@lists.openembedded.org;
	Sat, 15 Aug 2009 13:51:27 +0200
Message-ID: <4A86A13E.6020402@atmel.com>
Date: Sat, 15 Aug 2009 13:51:26 +0200
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Organization: Atmel Nordic AB
User-Agent: Thunderbird 2.0.0.22 (X11/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1242504969-15764-1-git-send-email-ihar.hrachyshka@gmail.com>	<1242507547.4226.1.camel@lenovo.internal.reciva.com>	<4A867CCA.7060609@atmel.com>	<1250329051.4215.167.camel@lenovo.internal.reciva.com>
	<1250330779.4406.9.camel@utx.utx.cz>
In-Reply-To: <1250330779.4406.9.camel@utx.utx.cz>
Subject: Re: xtscal fails + other Xorg init problems.
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
X-List-Received-Date: Sat, 15 Aug 2009 12:08:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Stanislav Brabec skrev:
> Phil Blundell wrote:
>> On Sat, 2009-08-15 at 11:15 +0200, Ulf Samuelsson wrote:
>>> Looks like xtscal in x11-image fails.
>>>
>>> $ DISPLAY=":0.0" xtscal
>>> XCALIBRATE extension missing
>> That error is fairly self-explanatory: your xserver lacks the XCALIBRATE
>> extension.  Xtscal won't work if this is missing.
> 
> Well, there may be a problem in recipes. There is xcalibrate and
> libxcalibrate. Both provide the same library. Some recipes use
> xcalibrate in DEPENDS, some use libxcalibrate. libxcalibrate does not
> compile on images with xserver-kdrive.
> 
> I think that the fix will require complete removal of xcalibrate:
> - xcalibrate_20060312.bb and xcalibrate_cvs.bb seems to be no more used.
> - xcalibrate_git.bb needs to be moved to libxcalibrate_git.bb using its
> version.
> - libxcalibrate probably needs to be moved to model specific directories
> (kdrive images need different version than xorg versions).
> - Update preferred versions for particular image.
> - and finally libxcalibrate should use standard git PV/PR allowing
> future upgrade.
> 
> Alternative solution: Fix the latest libxcalibrate to work with bothe
> Xorg and kdrive.


I have looked through the code.
x11-image uses Xorg and libxcalibrate.

There can be several reasons for this error message:

1) Xmalloc fails
2) There is no extension XCALIBRATE
3) There is an extension, but with different casing
   XCALIBRATE is used by libxcalibrate.
   if another name is used when it is added,
   then there is a problem when queried.
   The library is called libXcalibrate.so.

   How does it get its name?




xtscal contains:

  screen = DefaultScreen (dpy);

  if (XCalibrateQueryExtension (dpy, &event_base, &error_base))
    {
      int r;

      if (flag_debug)
	fprintf (stderr, "Using XCALIBRATE\n");

      r = XCalibrateSetRawMode (dpy, True);
      if (r)
	{
	  fprintf (stderr, "failed to set raw mode: error %d\n", r);
	  exit (1);
	}
    }
  else
    {
      perror ("XCALIBRATE extension missing");
      exit (1);
    }

The error message is printed, if XCalibrateQueryExtension returns false.
-----------------------------------------------------------------

I have found the XCalibrateQueryExtension in libxcalibrate/xcalibrate.c

Bool
XCalibrateQueryExtension (Display *dpy, int *event_basep, int *error_basep)
{
    XExtDisplayInfo *info = XCalibrateFindDisplay (dpy);

    if (XextHasExtension(info))
    {
	*event_basep = info->codes->first_event;
	*error_basep = info->codes->first_error;
	return True;
    }
    else
	return False;
}


XCalibrateQueryExtension returns false
	if XextHasExtension(info) is false
-----------------------------------------------------------------
From extutil.h:
#define XextHasExtension(i) ((i) && ((i)->codes))

=> ((info) && ((info)->codes)) is false

Problem occurs if
	info = XCalibrateFindDisplay (dpy)
results in
	info = NULL
	info->codes = NULL

-----------------------------------------------------------------
XCalibrateFindDisplay

XExtDisplayInfo *
XCalibrateFindDisplay (Display *dpy)
{
    XExtDisplayInfo *dpyinfo;
    XCalibrateInfo	    *xci;

    dpyinfo = XextFindDisplay (&XCalibrateExtensionInfo, dpy);
    if (!dpyinfo)
    {
	dpyinfo = XextAddDisplay (&XCalibrateExtensionInfo, dpy,
				  XCalibrateExtensionName,
				  &xcalibrate_extension_hooks,
				  XCalibrateNumberEvents, 0);
	xci = Xmalloc (sizeof (XCalibrateInfo));
	if (!xci)
	    return 0;
	xci->major_version = -1;
	dpyinfo->data = (char *) xci;
    }
    return dpyinfo;
}


if XextFindDisplay returns a non-NULL result, then this is returned.
	- not a problem

If it returns a NULL result, then
	XextAddDisplay is called.
	If the Xmalloc fails, we return 0	: Possible problem!
	if XextAddDisplay returns 0;		: Possible problem


-----------------------------------------------------------------
XextAddDisplay


If Xmalloc fails, we return 0.
If it does not fail, we set
	dpyinfo->codes = XInitExtension (dpy, ext_name);
	
if dpyinfo->codes == NULL we test
	if(hooks->close_display) ==
	if(&xcalibrate_extension_hooks->close_display) ==
	if(XCalibrateCloseDisplay) which I assume is true

	We then do
		codes = XAddExtension(dpy);
		if codes == non-NULL
			we return NULL 		-- Possible problem

	"XInitExtension()determines if the named extension exists. Then it
allocates storage for maintaining the information about the extension on
the connection, chains this onto the extension list for the connection,
and returns the information the stub implementor will need to access the
extension. If the extension does not exist, XInitExtension() returns 	NULL.
	
	If the extension name is not in the Host Portable Character Encoding
the result is implementation dependent. Case matters; the strings
thing, 	Thing, and thinG are all considered different names. "

	Do we have the right CASE for this name?
	If not we have a problem...

	char XCalibrateExtensionName[] = XCALIBRATE_NAME;

xcalibratewire.h
	#define XCALIBRATE_NAME "XCALIBRATE"

if dpyinfo->codes == non-NULL we return dpyinfo
	-- No problem

-------------------------------------------------------------
static /* const */ XExtensionHooks xcalibrate_extension_hooks = {
    NULL,				/* create_gc */
    NULL,				/* copy_gc */
    NULL,				/* flush_gc */
    NULL,				/* free_gc */
    NULL,				/* create_font */
    NULL,				/* free_font */
    XCalibrateCloseDisplay,		/* close_display */
    XCalibrateWireToEvent,		/* wire_to_event */
    XCalibrateEventToWire,		/* event_to_wire */
    NULL,				/* error */
    NULL,				/* error_string */
};
-------------------------------------------------------------


/*
 * XextAddDisplay - add a display to this extension
 */
XExtDisplayInfo *
XextAddDisplay(XExtensionInfo *extinfo, Display *dpy,
	       char *ext_name, XExtensionHooks *hooks, int nevents,
	       XPointer data)
{
    XExtDisplayInfo *dpyinfo;

    dpyinfo = (XExtDisplayInfo *) Xmalloc (sizeof (XExtDisplayInfo));
    if (!dpyinfo) return NULL;
    dpyinfo->display = dpy;
    dpyinfo->data = data;
    dpyinfo->codes = XInitExtension (dpy, ext_name);

    /*
     * if the server has the extension, then we can initialize the
     * appropriate function vectors
     */
    if (dpyinfo->codes) {
	int i, j;

	for (i = 0, j = dpyinfo->codes->first_event; i < nevents; i++, j++) {
	    XESetWireToEvent (dpy, j, hooks->wire_to_event);
	    XESetEventToWire (dpy, j, hooks->event_to_wire);
	}
	if (hooks->create_gc)
	  XESetCreateGC (dpy, dpyinfo->codes->extension, hooks->create_gc);
	if (hooks->copy_gc)
	  XESetCopyGC (dpy, dpyinfo->codes->extension, hooks->copy_gc);
	if (hooks->flush_gc)
	  XESetFlushGC (dpy, dpyinfo->codes->extension, hooks->flush_gc);
	if (hooks->free_gc)
	  XESetFreeGC (dpy, dpyinfo->codes->extension, hooks->free_gc);
	if (hooks->create_font)
	  XESetCreateFont (dpy, dpyinfo->codes->extension, hooks->create_font);
	if (hooks->free_font)
	  XESetFreeFont (dpy, dpyinfo->codes->extension, hooks->free_font);
	if (hooks->close_display)
	  XESetCloseDisplay (dpy, dpyinfo->codes->extension,
			     hooks->close_display);
	if (hooks->error)
	  XESetError (dpy, dpyinfo->codes->extension, hooks->error);
	if (hooks->error_string)
	  XESetErrorString (dpy, dpyinfo->codes->extension,
			    hooks->error_string);
    } else if (hooks->close_display) {
	/* The server doesn't have this extension.
	 * Use a private Xlib-internal extension to hang the close_display
	 * hook on so that the "cache" (extinfo->cur) is properly cleaned.
	 * (XBUG 7955)
	 */
	XExtCodes *codes = XAddExtension(dpy);
	if (!codes) {
	    XFree(dpyinfo);
	    return NULL;
	}
	XESetCloseDisplay (dpy, codes->extension, hooks->close_display);
    }

    /*
     * now, chain it onto the list
     */
    _XLockMutex(_Xglobal_lock);
    dpyinfo->next = extinfo->head;
    extinfo->head = dpyinfo;
    extinfo->cur = dpyinfo;
    extinfo->ndisplays++;
    _XUnlockMutex(_Xglobal_lock);
    return dpyinfo;
}

-------------------------------------------------------------
XAddExtension

> 
> 
> ________________________________________________________________________
> Stanislav Brabec
> http://www.penguin.cz/~utx/zaurus
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


-- 
Best Regards
Ulf Samuelsson



