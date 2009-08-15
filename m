Received: from [81.228.8.164] (helo=pne-smtpout2-sn2.hy.skanova.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1McJIr-0003zD-7O
	for openembedded-devel@lists.openembedded.org;
	Sat, 15 Aug 2009 15:28:13 +0200
Received: from [10.175.196.247] (213.66.88.44) by
	pne-smtpout2-sn2.hy.skanova.net (7.3.140.3) (authenticated as
	u82406562)
	id 4A5BC8BE0028ADD3 for openembedded-devel@lists.openembedded.org;
	Sat, 15 Aug 2009 15:11:27 +0200
Message-ID: <4A86B3FE.4080002@atmel.com>
Date: Sat, 15 Aug 2009 15:11:26 +0200
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Organization: Atmel Nordic AB
User-Agent: Thunderbird 2.0.0.22 (X11/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4A8516BF.9080405@atmel.com>	<h63h7v$8pk$1@ger.gmane.org>	<4A8581D9.9010205@atmel.com>	<1250264545.12282.1271.camel@mill.internal.reciva.com>	<4A85C292.9030605@atmel.com>	<4A85C7E9.7030402@xora.org.uk>	<4A85FFD7.7090302@atmel.com>
	<h665ts$ms3$1@ger.gmane.org> <4A86A5D7.6070904@atmel.com>
In-Reply-To: <4A86A5D7.6070904@atmel.com>
Subject: Re: No graphic when loading "x11-gpe-image" - Now mostly working!
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
X-List-Received-Date: Sat, 15 Aug 2009 13:28:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Ulf Samuelsson skrev:
> Rolf Leggewie skrev:
>> Ulf Samuelsson wrote:
>>> I have progressed a little further, so I have managed to get
>>> the Xserver to start, but the xorg.conf I did fails to
>>> support the mouse. The touchscreen is also nonfunctional but
>>> A USB keyboard work...
>> That sounds similar to the problems I'm experiencing with X11 and Opie
>> in qemu images.  Poky images work, but I wasn't sure where the magic
>> difference between Poky and .dev could be.
>>
>>
> The problem was localized to the SAM9263.
> Xorg was called with "-rgba bgr" and "-screen 240x320"
> 
> -rgba is not a known switch.
> 
> openembedded provides an empty xorg.conf, so the screen "240x320"
> was not found.
> 
> By removing the -screen 240x320 from the Xorg startup,
> the X11 server could be started, but no touchscreen.
> 
> By default, the AllowEmptyInput is on, so the input drivers
> are not loaded, and this needs to be set to "off"
> 
> my xorg.conf, now only contains:
> Section "ServerFlags"
> 	Option "AllowEmptyInput" "off"
> EndSection
> 
> The touchscreen now works, but it does not calibrate,
> and it is not coordinated with the movements.
> I suspect FRAMEBUFFER_CONSOLE_ROTATION beeing set
> might have something to do with it, but I am not sure.
> When I move the pen in X direction, the cursor moves in Y direction
> 
> Also, my USB keyboard gets three events per press,
> resulting in three characters.
> 
> 
> Anyone got a fully working xorg.conf ?
> 


This xorg.conf looks promising
Stops loading a keyboard and a mouse.
The characters are now one at a time,
and I have a touch functionality (but no cursor).
Unfortunately, the calibration is broken.


Section "ServerLayout"
	Identifier      "Atmel SAM9 Layout"
	Screen  	"240x320"
	InputDevice	"Touchscreen"	"CorePointer"
	InputDevice	"Keyboard"	"CoreKeyboard"
	InputDevice	"dummy"
EndSection

Section "ServerFlags"
	Option	"AllowEmptyInput" "off"
EndSection

Section "Module"
	Load    "extmod"
	Load    "dbe"
EndSection

Section "Monitor"
        Identifier      "HITACHI LCD"
EndSection

Section "Device"
        Identifier      "FrameBuffer"
        Driver		"fbdev"
EndSection

Section "Screen"
        Identifier      "240x320"
        Device  "FrameBuffer"
        Monitor "HITACHI LCD"
EndSection

Section "InputDevice"
	Identifier	"Touchscreen"
	Driver		"evdev"
	Option		"Device" "/dev/input/touchscreen0"
	Option		"DeviceName" "Touchscreen"
	Option		"MinX" "98"
	Option		"MaxX" "940"
	Option		"MinY" "43"
	Option		"MaxY" "925"
	Option		"ReportingMode" "Raw"
	Option		"Emulate3Buttons"
	Option		"Emulate3Timeout" "50"
#	Option		"CorePointer"
	Option		"SendCoreEvents" "on"
EndSection

Section "InputDevice"
	Identifier	"Keyboard"
	Driver		"dummy"
	Option		"Device" "/dev/input/event2"
EndSection


Section "InputDevice"
	Identifier	"dummy"
	Driver		"void"
	Option		"Device" "/dev/input/mice"
EndSection

----------------------------------------------------------


X.Org X Server 1.6.1
Release Date: 2009-4-14
X Protocol Version 11, Revision 0
Build Operating System: Linux 2.6.27.25-0.1-default x86_64
Current Operating System: Linux at91sam9263dfc 2.6.30.2 #1 PREEMPT Fri
Aug 14 18:07:09 CEST 2009 armv5tejl
Build Date: 14 August 2009  01:57:46AM

	Before reporting problems, check http://wiki.x.org
	to make sure that you have the latest version.
Markers: (--) probed, (**) from config file, (==) default setting,
	(++) from command line, (!!) notice, (II) informational,
	(WW) warning, (EE) error, (NI) not implemented, (??) unknown.
(==) Log file: "/var/log/Xorg.0.log", Time: Sat Aug 15 14:03:02 2009
(==) Using config file: "/etc/X11/xorg.conf"
(==) ServerLayout "Atmel SAM9 Layout"
(**) |-->Screen "240x320" (0)
(**) |   |-->Monitor "HITACHI LCD"
(**) |   |-->Device "FrameBuffer"
(**) |-->Input Device "Touchscreen"
(**) |-->Input Device "Keyboard"
(**) |-->Input Device "dummy"
(**) Option "AllowEmptyInput" "off"
(==) Automatically adding devices
(==) Automatically enabling devices
(==) FontPath set to:
	/usr/share/fonts/X11/misc,
	built-ins
(==) ModulePath set to "/usr/lib/xorg/modules"
(II) Loader magic: 0xfa84
(II) Module ABI versions:
	X.Org ANSI C Emulation: 0.4
	X.Org Video Driver: 5.0
	X.Org XInput driver : 4.0
	X.Org Server Extension : 2.0
(II) Loader running on linux
(--) using VT number 2

(II) System resource ranges:
(II) "extmod" will be loaded. This was enabled by default and also
specified in the config file.
(II) "dbe" will be loaded. This was enabled by default and also
specified in the config file.
(II) "glx" will be loaded by default.
(II) "dri" will be loaded by default.
(II) "dri2" will be loaded by default.
(II) LoadModule: "extmod"
(II) Loading /usr/lib/xorg/modules/extensions//libextmod.so
(II) Module extmod: vendor="X.Org Foundation"
	compiled for 1.6.1, module version = 1.0.0
	Module class: X.Org Server Extension
	ABI class: X.Org Server Extension, version 2.0
(II) Loading extension MIT-SCREEN-SAVER
(II) Loading extension XFree86-VidModeExtension
(II) Loading extension XFree86-DGA
(II) Loading extension DPMS
(II) Loading extension XVideo
(II) Loading extension XVideo-MotionCompensation
(II) Loading extension X-Resource
(II) LoadModule: "dbe"
(II) Loading /usr/lib/xorg/modules/extensions//libdbe.so
(II) Module dbe: vendor="X.Org Foundation"
	compiled for 1.6.1, module version = 1.0.0
	Module class: X.Org Server Extension
	ABI class: X.Org Server Extension, version 2.0
(II) Loading extension DOUBLE-BUFFER
(II) LoadModule: "glx"
(II) Loading /usr/lib/xorg/modules/extensions//libglx.so
(II) Module glx: vendor="X.Org Foundation"
	compiled for 1.6.1, module version = 1.0.0
	ABI class: X.Org Server Extension, version 2.0
(==) AIGLX enabled
(II) Loading extension GLX
(II) LoadModule: "dri"
(II) Loading /usr/lib/xorg/modules/extensions//libdri.so
(II) Module dri: vendor="X.Org Foundation"
	compiled for 1.6.1, module version = 1.0.0
	ABI class: X.Org Server Extension, version 2.0
(II) Loading extension XFree86-DRI
(II) LoadModule: "dri2"
(II) Loading /usr/lib/xorg/modules/extensions//libdri2.so
(II) Module dri2: vendor="X.Org Foundation"
	compiled for 1.6.1, module version = 1.0.0
	ABI class: X.Org Server Extension, version 2.0
(II) Loading extension DRI2
(II) LoadModule: "fbdev"
(II) Loading /usr/lib/xorg/modules/drivers//fbdev_drv.so
(II) Module fbdev: vendor="X.Org Foundation"
	compiled for 1.6.1, module version = 0.4.0
	ABI class: X.Org Video Driver, version 5.0
(II) LoadModule: "evdev"
(II) Loading /usr/lib/xorg/modules/input//evdev_drv.so
(II) Module evdev: vendor="X.Org Foundation"
	compiled for 1.6.1, module version = 2.2.2
	Module class: X.Org XInput Driver
	ABI class: X.Org XInput driver, version 4.0
(II) LoadModule: "dummy"
(WW) Warning, couldn't open module dummy
(II) UnloadModule: "dummy"
(EE) Failed to load module "dummy" (module does not exist, 0)
(II) LoadModule: "void"
(WW) Warning, couldn't open module void
(II) UnloadModule: "void"
(EE) Failed to load module "void" (module does not exist, 0)
(II) FBDEV: driver for framebuffer: fbdev
(WW) Falling back to old probe method for fbdev
(II) Loading sub module "fbdevhw"
(II) LoadModule: "fbdevhw"
(II) Loading /usr/lib/xorg/modules/linux//libfbdevhw.so
(II) Module fbdevhw: vendor="X.Org Foundation"
	compiled for 1.6.1, module version = 0.0.2
	ABI class: X.Org Video Driver, version 5.0
(II) FBDEV(0): using default device
(II) Running in FRAMEBUFFER Mode
(II) FBDEV(0): Creating default Display subsection in Screen section
	"240x320" for depth/fbbpp 15/16
(==) FBDEV(0): Depth 15, (==) framebuffer bpp 16
(==) FBDEV(0): RGB weight 555
(==) FBDEV(0): Default visual is TrueColor
(==) FBDEV(0): Using gamma correction (1.0, 1.0, 1.0)
(II) FBDEV(0): hardware:  (video memory: 150kB)
(II) FBDEV(0): checking modes against framebuffer device...
(II) FBDEV(0): checking modes against monitor...
(--) FBDEV(0): Virtual size is 240x320 (pitch 240)
(**) FBDEV(0):  Built-in mode "current": 5.0 MHz, 17.9 kHz, 55.6 Hz
(II) FBDEV(0): Modeline "current"x0.0    5.00  240 273 278 279  320 320
321 322 +hsync +vsync -csync (17.9 kHz)
(++) FBDEV(0): DPI set to (100, 100)
(II) Loading sub module "fb"
(II) LoadModule: "fb"
(II) Loading /usr/lib/xorg/modules//libfb.so
(II) Module fb: vendor="X.Org Foundation"
	compiled for 1.6.1, module version = 1.0.0
	ABI class: X.Org ANSI C Emulation, version 0.4
(**) FBDEV(0): using shadow framebuffer
(II) Loading sub module "shadow"
(II) LoadModule: "shadow"
(II) Loading /usr/lib/xorg/modules//libshadow.so
(II) Module shadow: vendor="X.Org Foundation"
	compiled for 1.6.1, module version = 1.1.0
	ABI class: X.Org ANSI C Emulation, version 0.4
(EE) FBDEV(0): FBIOBLANK: Invalid argument
(==) FBDEV(0): Backing store disabled
(II) FBDEV(0): DPMS enabled
(==) RandR enabled
(II) Initializing built-in extension Generic Event Extension
(II) Initializing built-in extension SHAPE
(II) Initializing built-in extension MIT-SHM
(II) Initializing built-in extension XInputExtension
(II) Initializing built-in extension XTEST
(II) Initializing built-in extension BIG-REQUESTS
(II) Initializing built-in extension SYNC
(II) Initializing built-in extension XKEYBOARD
(II) Initializing built-in extension XC-MISC
(II) Initializing built-in extension XINERAMA
(II) Initializing built-in extension XFIXES
(II) Initializing built-in extension RENDER
(II) Initializing built-in extension RANDR
(II) Initializing built-in extension COMPOSITE
(II) Initializing built-in extension DAMAGE
(II) AIGLX: Screen 0 is not DRI capable
(EE) AIGLX error: dlopen of /usr/lib/dri/swrast_dri.so failed
(/usr/lib/dri/swrast_dri.so: cannot open shared object file: No such
file or directory)
(EE) GLX: could not load software renderer
(II) GLX: no usable GL providers found for screen 0
(**) Option "SendCoreEvents" "on"
(**) Option "CorePointer"
(**) Touchscreen: always reports core events
(**) Touchscreen: Device: "/dev/input/touchscreen0"
(II) Touchscreen: Found x and y absolute axes
(II) Touchscreen: Found absolute touchscreen
(II) Touchscreen: Configuring as touchscreen
(**) Option "Emulate3Buttons"
(II) Touchscreen: Forcing middle mouse button emulation on.
(**) Option "Emulate3Timeout" "50"
(**) Touchscreen: YAxisMapping: buttons 4 and 5
(**) Touchscreen: EmulateWheelButton: 4, EmulateWheelInertia: 10,
EmulateWheelTimeout: 200
(II) XINPUT: Adding extended input device "Touchscreen" (type: TOUCHSCREEN)
(**) Touchscreen: (accel) keeping acceleration scheme 1
(**) Touchscreen: (accel) filter chain progression: 2.00
(**) Touchscreen: (accel) filter stage 0: 20.00 ms
(**) Touchscreen: (accel) set acceleration profile 0
(II) LoadModule: "dummy"
(WW) Warning, couldn't open module dummy
(II) UnloadModule: "dummy"
(EE) Failed to load module "dummy" (module does not exist, 0)
(EE) No input driver matching `dummy'
(II) LoadModule: "void"
(WW) Warning, couldn't open module void
(II) UnloadModule: "void"
(EE) Failed to load module "void" (module does not exist, 0)
(EE) No input driver matching `void'
(EE) FBDEV(0): FBIOBLANK: Invalid argument
(II) config/hal: Adding input device USB Keyboard
(**) USB Keyboard: always reports core events
(**) USB Keyboard: Device: "/dev/input/event3"
(II) USB Keyboard: Found 13 mouse buttons
(II) USB Keyboard: Found x and y relative axes
(II) USB Keyboard: Found scroll wheel(s)
(II) USB Keyboard: Found keys
(II) USB Keyboard: Configuring as mouse
(II) USB Keyboard: Configuring as keyboard
(**) USB Keyboard: YAxisMapping: buttons 4 and 5
(**) USB Keyboard: EmulateWheelButton: 4, EmulateWheelInertia: 10,
EmulateWheelTimeout: 200
(II) XINPUT: Adding extended input device "USB Keyboard" (type: KEYBOARD)
(**) Option "xkb_rules" "evdev"
(**) Option "xkb_model" "evdev"
(**) Option "xkb_layout" "us"
(**) USB Keyboard: (accel) keeping acceleration scheme 1
(**) USB Keyboard: (accel) filter chain progression: 2.00
(**) USB Keyboard: (accel) filter stage 0: 20.00 ms
(**) USB Keyboard: (accel) set acceleration profile 0
(II) config/hal: Adding input device USB Keyboard
(**) USB Keyboard: always reports core events
(**) USB Keyboard: Device: "/dev/input/event2"
(II) USB Keyboard: Found keys
(II) USB Keyboard: Configuring as keyboard
(II) XINPUT: Adding extended input device "USB Keyboard" (type: KEYBOARD)
(**) Option "xkb_rules" "evdev"
(**) Option "xkb_model" "evdev"
(**) Option "xkb_layout" "us"

>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 
> 


-- 
Best Regards
Ulf Samuelsson



