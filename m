Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R4Z0h-0003Aw-JN
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Sep 2011 16:03:19 +0200
Received: by mail-fx0-f47.google.com with SMTP id 1so1786584fxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Sep 2011 06:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=+wDxNpXUxacSUnK6oKkgYnWgpKlvZrrXyc3vbrZCxZI=;
	b=GRtRsxqdAVy9qOFWQ+ED0O4XFcHgKQB1iu2xUc6KGW52eUdHN7tpS8Dh+yn3aoG5BS
	N8Ef5KIeDrUCey4Gtz9EEhHTy+zQRKj9YhuN2WClOK4RNbbhRuoBCIRamCC/5umjzGRD
	9mhD0IOeIiPtm4i/xyzTAo+dzZ1lJipNa5gqY=
Received: by 10.223.85.133 with SMTP id o5mr253336fal.16.1316181402038;
	Fri, 16 Sep 2011 06:56:42 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w14sm10633665fae.13.2011.09.16.06.56.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 16 Sep 2011 06:56:40 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Sep 2011 15:56:08 +0200
Message-Id: <443990646f24d1018edc048aff09230ebab2b94f.1316181283.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <6b5477acbb0bbaf15b13f6dbc2121ba0e2fe7100.1316181283.git.Martin.Jansa@gmail.com>
References: <6b5477acbb0bbaf15b13f6dbc2121ba0e2fe7100.1316181283.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1316181282.git.Martin.Jansa@gmail.com>
References: <cover.1316181282.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 03/10] xserver-xorg-conf: drop from meta-oe, update xorg-xserver-common.inc to RDEPENDS on xserver-xf86-config from oe-core and bsp layers
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
X-List-Received-Date: Fri, 16 Sep 2011 14:03:19 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../xorg-xserver/xorg-xserver-common.inc           |    2 +-
 .../xserver-xorg-conf/am3517-evm/xorg.conf         |   29 ------
 .../xserver-xorg-conf/am37x-evm/xorg.conf          |   29 ------
 .../xserver-xorg-conf/archos5/xorg.conf            |   29 ------
 .../xserver-xorg-conf/archos5it/xorg.conf          |   29 ------
 .../xserver-xorg-conf/at91sam9263ek/xorg.conf      |   11 --
 .../xserver-xorg-conf/at91sam9g45ek/xorg.conf      |   23 -----
 .../xserver-xorg-conf/babbage/xorg.conf            |   56 -----------
 .../xserver-xorg-conf/beagleboard/xorg.conf        |   29 ------
 .../xorg-xserver/xserver-xorg-conf/bug/xorg.conf   |   75 ---------------
 .../xorg-xserver/xserver-xorg-conf/bug20/xorg.conf |   37 --------
 .../xserver-xorg-conf/cm-t35/xorg.conf             |   29 ------
 .../xserver-xorg-conf/dm37x-evm/xorg.conf          |   29 ------
 .../xserver-xorg-conf/eee701/xorg.conf             |   97 --------------------
 .../xserver-xorg-conf/htcdream/xorg.conf           |   69 --------------
 .../xserver-xorg-conf/htcleo/xorg.conf             |   73 ---------------
 .../xserver-xorg-conf/igep0020/xorg.conf           |   29 ------
 .../xorg-xserver/xserver-xorg-conf/ion/xorg.conf   |   51 ----------
 .../xserver-xorg-conf/iphone3g/xorg.conf           |   29 ------
 .../xorg-xserver/xserver-xorg-conf/mh355/xorg.conf |   47 ----------
 .../xserver-xorg-conf/nokia800/xorg.conf           |   29 ------
 .../xserver-xorg-conf/nokia900/xorg.conf           |   62 -------------
 .../xserver-xorg-conf/om-gta01/xorg.conf           |   49 ----------
 .../xserver-xorg-conf/om-gta02/xorg.conf           |   55 -----------
 .../xserver-xorg-conf/omap3-pandora/xorg.conf      |   24 -----
 .../xserver-xorg-conf/omap3-touchbook/xorg.conf    |   25 -----
 .../xorg-xserver/xserver-xorg-conf/omap3/xorg.conf |   29 ------
 .../xserver-xorg-conf/omap3evm/xorg.conf           |   29 ------
 .../xserver-xorg-conf/omapzoom/xorg.conf           |   29 ------
 .../xserver-xorg-conf/omapzoom2/xorg.conf          |   29 ------
 .../xserver-xorg-conf/omapzoom36x/xorg.conf        |   29 ------
 .../xorg-xserver/xserver-xorg-conf/overo/xorg.conf |   29 ------
 .../xserver-xorg-conf/palmpre/xorg.conf            |   58 ------------
 .../xserver-xorg-conf/ronetix-pm9263/xorg.conf     |   47 ----------
 .../xorg-xserver/xserver-xorg-conf/spitz/xorg.conf |   49 ----------
 .../xserver-xorg-conf/vortex86sx/xorg.conf         |   13 ---
 .../xserver-xorg-conf/xilinx-ml507/xorg.conf       |   39 --------
 .../xserver-xorg-conf/xilinx-virtex5/xorg.conf     |   38 --------
 .../xorg-xserver/xserver-xorg-conf_0.1.bb          |   17 ----
 .../xorg-xserver/xserver-xorg_1.10.2.bb            |    2 +-
 40 files changed, 2 insertions(+), 1481 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/am3517-evm/xorg.conf
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/am37x-evm/xorg.conf
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/archos5/xorg.conf
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/archos5it/xorg.conf
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/at91sam9263ek/xorg.conf
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/at91sam9g45ek/xorg.conf
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/babbage/xorg.conf
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/beagleboard/xorg.conf
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/bug/xorg.conf
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/bug20/xorg.conf
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/cm-t35/xorg.conf
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/dm37x-evm/xorg.conf
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/eee701/xorg.conf
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/htcdream/xorg.conf
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/htcleo/xorg.conf
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/igep0020/xorg.conf
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/ion/xorg.conf
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/iphone3g/xorg.conf
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/mh355/xorg.conf
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/nokia800/xorg.conf
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/nokia900/xorg.conf
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/om-gta01/xorg.conf
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/om-gta02/xorg.conf
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/omap3-pandora/xorg.conf
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/omap3-touchbook/xorg.conf
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/omap3/xorg.conf
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/omap3evm/xorg.conf
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/omapzoom/xorg.conf
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/omapzoom2/xorg.conf
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/omapzoom36x/xorg.conf
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/overo/xorg.conf
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/palmpre/xorg.conf
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/ronetix-pm9263/xorg.conf
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/spitz/xorg.conf
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/vortex86sx/xorg.conf
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/xilinx-ml507/xorg.conf
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/xilinx-virtex5/xorg.conf
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/xorg.conf
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf_0.1.bb

diff --git a/meta-oe/recipes-graphics/xorg-xserver/xorg-xserver-common.inc b/meta-oe/recipes-graphics/xorg-xserver/xorg-xserver-common.inc
index 06763bb..0b4a854 100644
--- a/meta-oe/recipes-graphics/xorg-xserver/xorg-xserver-common.inc
+++ b/meta-oe/recipes-graphics/xorg-xserver/xorg-xserver-common.inc
@@ -53,7 +53,7 @@ EXTRA_OECONF_append_arm = " ac_cv_header_linux_apm_bios_h=no "
 
 PACKAGES =+ "xserver-security-policy"
 FILES_xserver-security-policy += "${libdir}/xserver/SecurityPolicy"
-RRECOMMENDS_${PN} += "xserver-security-policy xkeyboard-config rgb xserver-xorg-conf"
+RRECOMMENDS_${PN} += "xserver-security-policy xkeyboard-config rgb xserver-xf86-config"
 
 PACKAGES =+ "${PN}-sdl ${PN}-fbdev ${PN}-xprint ${PN}-xvfb ${PN}-utils ${PN}-xephyr"
 
diff --git a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/am3517-evm/xorg.conf b/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/am3517-evm/xorg.conf
deleted file mode 100644
index 983bb08..0000000
--- a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/am3517-evm/xorg.conf
+++ /dev/null
@@ -1,29 +0,0 @@
-Section "Module"                                       
-        Load    "extmod"                                
-        Load    "dbe"                           
-        Load    "glx"                                           
-        Load    "freetype"                             
-        Load    "type1"                        
-        Load    "record"                    
-        Load    "dri"                       
-EndSection                            
-
-Section "Monitor"                                                                    
-        Identifier      "Builtin Default Monitor"
-EndSection                                       
-
-Section "Device"                                  
-        Identifier      "Builtin Default fbdev Device 0"
-        Driver  "omapfb"
-EndSection                                                
-
-Section "Screen"                                        
-        Identifier      "Builtin Default fbdev Screen 0"     
-        Device  "Builtin Default fbdev Device 0"            
-        Monitor "Builtin Default Monitor"               
-EndSection                                              
-
-Section "ServerLayout"                                 
-        Identifier      "Builtin Default Layout"                                     
-        Screen  "Builtin Default fbdev Screen 0"        
-EndSection                                              
diff --git a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/am37x-evm/xorg.conf b/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/am37x-evm/xorg.conf
deleted file mode 100644
index 983bb08..0000000
--- a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/am37x-evm/xorg.conf
+++ /dev/null
@@ -1,29 +0,0 @@
-Section "Module"                                       
-        Load    "extmod"                                
-        Load    "dbe"                           
-        Load    "glx"                                           
-        Load    "freetype"                             
-        Load    "type1"                        
-        Load    "record"                    
-        Load    "dri"                       
-EndSection                            
-
-Section "Monitor"                                                                    
-        Identifier      "Builtin Default Monitor"
-EndSection                                       
-
-Section "Device"                                  
-        Identifier      "Builtin Default fbdev Device 0"
-        Driver  "omapfb"
-EndSection                                                
-
-Section "Screen"                                        
-        Identifier      "Builtin Default fbdev Screen 0"     
-        Device  "Builtin Default fbdev Device 0"            
-        Monitor "Builtin Default Monitor"               
-EndSection                                              
-
-Section "ServerLayout"                                 
-        Identifier      "Builtin Default Layout"                                     
-        Screen  "Builtin Default fbdev Screen 0"        
-EndSection                                              
diff --git a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/archos5/xorg.conf b/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/archos5/xorg.conf
deleted file mode 100644
index 983bb08..0000000
--- a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/archos5/xorg.conf
+++ /dev/null
@@ -1,29 +0,0 @@
-Section "Module"                                       
-        Load    "extmod"                                
-        Load    "dbe"                           
-        Load    "glx"                                           
-        Load    "freetype"                             
-        Load    "type1"                        
-        Load    "record"                    
-        Load    "dri"                       
-EndSection                            
-
-Section "Monitor"                                                                    
-        Identifier      "Builtin Default Monitor"
-EndSection                                       
-
-Section "Device"                                  
-        Identifier      "Builtin Default fbdev Device 0"
-        Driver  "omapfb"
-EndSection                                                
-
-Section "Screen"                                        
-        Identifier      "Builtin Default fbdev Screen 0"     
-        Device  "Builtin Default fbdev Device 0"            
-        Monitor "Builtin Default Monitor"               
-EndSection                                              
-
-Section "ServerLayout"                                 
-        Identifier      "Builtin Default Layout"                                     
-        Screen  "Builtin Default fbdev Screen 0"        
-EndSection                                              
diff --git a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/archos5it/xorg.conf b/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/archos5it/xorg.conf
deleted file mode 100644
index 983bb08..0000000
--- a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/archos5it/xorg.conf
+++ /dev/null
@@ -1,29 +0,0 @@
-Section "Module"                                       
-        Load    "extmod"                                
-        Load    "dbe"                           
-        Load    "glx"                                           
-        Load    "freetype"                             
-        Load    "type1"                        
-        Load    "record"                    
-        Load    "dri"                       
-EndSection                            
-
-Section "Monitor"                                                                    
-        Identifier      "Builtin Default Monitor"
-EndSection                                       
-
-Section "Device"                                  
-        Identifier      "Builtin Default fbdev Device 0"
-        Driver  "omapfb"
-EndSection                                                
-
-Section "Screen"                                        
-        Identifier      "Builtin Default fbdev Screen 0"     
-        Device  "Builtin Default fbdev Device 0"            
-        Monitor "Builtin Default Monitor"               
-EndSection                                              
-
-Section "ServerLayout"                                 
-        Identifier      "Builtin Default Layout"                                     
-        Screen  "Builtin Default fbdev Screen 0"        
-EndSection                                              
diff --git a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/at91sam9263ek/xorg.conf b/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/at91sam9263ek/xorg.conf
deleted file mode 100644
index 7f3eb77..0000000
--- a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/at91sam9263ek/xorg.conf
+++ /dev/null
@@ -1,11 +0,0 @@
-Section "ServerLayout"
-    Identifier "default"
-    InputDevice "atmel-ts" "CorePointer"
-EndSection
-
-Section "InputDevice"
-    Identifier "atmel-ts"
-    Driver "evdev"
-    Option "SwapAxes" "1"
-    Option "Device" "/dev/input/touchscreen0"
-EndSection
diff --git a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/at91sam9g45ek/xorg.conf b/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/at91sam9g45ek/xorg.conf
deleted file mode 100644
index 0502f87..0000000
--- a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/at91sam9g45ek/xorg.conf
+++ /dev/null
@@ -1,23 +0,0 @@
-Section "ServerLayout"
-    Identifier "default"
-    InputDevice "atmel-tsadcc" "CorePointer"
-EndSection
-
-Section "InputDevice"
-    Identifier "atmel-tsadcc"
-    Driver "evdev"
-    Option "Device" "/dev/input/touchscreen0"
-EndSection
-
-Section "InputDevice"
-	Driver		"mouse"
-	Identifier	"Mouse[1]"
-	Option		"Buttons"	"10"
-	Option		"Device"	"/dev/input/mice"
-EndSection
-
-Section	"InputDevice"
-	Driver		"kbd"
-	Identifier	"Keyboard[0]"
-	Option		"Protocol" "Standard"
-EndSection
diff --git a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/babbage/xorg.conf b/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/babbage/xorg.conf
deleted file mode 100644
index d4d41db..0000000
--- a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/babbage/xorg.conf
+++ /dev/null
@@ -1,56 +0,0 @@
-#
-# X11 configuration for i.MX51 Babbage EVK
-# Based on pm9263 by Koan sas
-#
-
-Section "Monitor"
-        Identifier      "Display"
-EndSection
-
-Section "Device"
-        Identifier      "fbdevice"
-        Driver  	"fbdev"
-	Option 		"fbdev" "/dev/fb0"
-	Option 		"shadowfb" "true"
-EndSection
-
-Section "Screen"
-        Identifier      "fbscreen"
-        Device  	"fbdevice"
-        Monitor 	"Display"
-EndSection
-
-Section "InputDevice"
-        Identifier      "mxc_ts"
-        Driver          "evdev"
-        Option          "SwapAxes" "0"
-        Option          "Device" "/dev/input/touchscreen0"
-EndSection
-
-Section "InputDevice"
-        Identifier      "Generic Mouse"
-        Driver          "mouse"   
-        Option          "CorePointer"
-EndSection
-
-Section "InputDevice"
-        Identifier      "Keypad"
-        Driver          "evdev"
-        Option          "Device"        "/dev/input/event0"
-#        Option          "XkbModel"      "nokiarx51"
-#        Option          "XkbLayout"     "us"
-EndSection
-
-Section "ServerLayout"
-        Identifier      "Layout"
-        Screen  	"fbscreen"
-        InputDevice 	"mxc_ts" "CorePointer"
-	InputDevice     "Keypad"
-# Enable mouse only if necessary, it may interfere with touchscreen behaviour
-#        InputDevice     "Generic Mouse"
-EndSection
-
-#Section "ServerFlags"
-#	Option "AutoAddDevices" "false"
-#EndSection
-
diff --git a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/beagleboard/xorg.conf b/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/beagleboard/xorg.conf
deleted file mode 100644
index 983bb08..0000000
--- a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/beagleboard/xorg.conf
+++ /dev/null
@@ -1,29 +0,0 @@
-Section "Module"                                       
-        Load    "extmod"                                
-        Load    "dbe"                           
-        Load    "glx"                                           
-        Load    "freetype"                             
-        Load    "type1"                        
-        Load    "record"                    
-        Load    "dri"                       
-EndSection                            
-
-Section "Monitor"                                                                    
-        Identifier      "Builtin Default Monitor"
-EndSection                                       
-
-Section "Device"                                  
-        Identifier      "Builtin Default fbdev Device 0"
-        Driver  "omapfb"
-EndSection                                                
-
-Section "Screen"                                        
-        Identifier      "Builtin Default fbdev Screen 0"     
-        Device  "Builtin Default fbdev Device 0"            
-        Monitor "Builtin Default Monitor"               
-EndSection                                              
-
-Section "ServerLayout"                                 
-        Identifier      "Builtin Default Layout"                                     
-        Screen  "Builtin Default fbdev Screen 0"        
-EndSection                                              
diff --git a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/bug/xorg.conf b/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/bug/xorg.conf
deleted file mode 100644
index cf684ec..0000000
--- a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/bug/xorg.conf
+++ /dev/null
@@ -1,75 +0,0 @@
-#
-# Initial version of X11 configuration for BugLabs BUG device.
-#
-# Up to 2 LCD modules are supported (as DISPLAY=0.0/0.1).
-# Touchscreen on both screen works properly (req tslib 0.0.6 driver).
-#
-# Mouse is not supported yet because the evdev driver need a precise
-# dev node and evdev dev nodes are somewhat random
-#
-
-Section "Monitor"
-        Identifier      "Monitor 1"
-EndSection
-
-Section "Monitor"
-        Identifier      "Monitor 2"
-EndSection
-
-Section "Device"
-        Identifier      "fbdev Device 2"
-        Driver  "fbdev"
-	Option "fbdev" "/dev/fb2"
-	Option "shadowfb" "true"
-EndSection
-
-Section "Device"
-        Identifier      "fbdev Device 1"
-        Driver  "fbdev"
-	Option "fbdev" "/dev/fb1"
-	Option "shadowfb" "true"
-EndSection
-
-Section "Screen"
-        Identifier      "fbdev Screen 2"
-        Device  "fbdev Device 2"
-        Monitor "Monitor 2"
-EndSection
-
-Section "Screen"
-        Identifier      "fbdev Screen 1"
-        Device  "fbdev Device 1"
-        Monitor "Monitor 1"
-EndSection
-
-Section "ServerLayout"
-        Identifier      "Layout"
-        Screen  "fbdev Screen 1"
-        Screen  "fbdev Screen 2" Below "fbdev Screen 1"
-        InputDevice "ts4"
-        InputDevice "ts5"
-        InputDevice "Keyboard"
-EndSection
-
-Section "InputDevice"
-    Identifier "ts5"
-    Driver "tslib"
-    Option "Device" "/dev/input/bmi_lcd_ts5"
-    Option "ScreenNumber"  "1"
-EndSection
-
-Section "InputDevice"
-    Identifier "ts4"
-    Driver "tslib"
-    Option "Device" "/dev/input/bmi_lcd_ts4"
-    Option "ScreenNumber"  "0"
-EndSection
-
-Section "InputDevice"
-	Identifier  "Keyboard"
-	Driver      "kbd"
-EndSection
-
-Section "ServerFlags"
-	Option "AutoAddDevices" "false"
-EndSection
diff --git a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/bug20/xorg.conf b/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/bug20/xorg.conf
deleted file mode 100644
index 6301d06..0000000
--- a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/bug20/xorg.conf
+++ /dev/null
@@ -1,37 +0,0 @@
-Section "Module"                                       
-        Load    "extmod"                                
-        Load    "dbe"                           
-        Load    "glx"                                           
-        Load    "freetype"                             
-#       Load    "type1"                        
-#       Load    "record"                    
-        Load    "dri"                       
-EndSection                            
-
-Section "Monitor"                                                                    
-        Identifier      "Builtin Default Monitor"
-EndSection                                       
-
-Section "Device"                                  
-        Identifier      "Builtin Default fbdev Device 0"
-        Driver  "omapfb"
-EndSection                                                
-
-Section "Screen"                                        
-        Identifier      "Builtin Default fbdev Screen 0"     
-        Device  "Builtin Default fbdev Device 0"            
-        Monitor "Builtin Default Monitor"               
-EndSection                                              
-
-Section "ServerLayout"                                 
-        Identifier      "Builtin Default Layout"                                     
-        Screen  "Builtin Default fbdev Screen 0"        
-		InputDevice "bmi-lcd-ts" "CorePointer"
-EndSection                                              
-
-Section "InputDevice"
-		Identifier "bmi-lcd-ts"
-		Driver "tslib"
-		Option "SwapAxes" "1"
-		Option "Device" "/dev/input/touchscreen0"
-EndSection
diff --git a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/cm-t35/xorg.conf b/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/cm-t35/xorg.conf
deleted file mode 100644
index 07d849d..0000000
--- a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/cm-t35/xorg.conf
+++ /dev/null
@@ -1,29 +0,0 @@
-Section "Module"
-        Load    "extmod"
-        Load    "dbe"
-        Load    "glx"
-        Load    "freetype"
-        Load    "type1"
-        Load    "record"
-        Load    "dri"
-EndSection
-
-Section "Monitor"
-        Identifier      "Builtin Default Monitor"
-EndSection
-
-Section "Device"
-        Identifier      "Builtin Default fbdev Device 0"
-        Driver  "omapfb"
-EndSection
-
-Section "Screen"
-        Identifier      "Builtin Default fbdev Screen 0"
-        Device  "Builtin Default fbdev Device 0"
-        Monitor "Builtin Default Monitor"
-EndSection
-
-Section "ServerLayout"
-        Identifier      "Builtin Default Layout"
-        Screen  "Builtin Default fbdev Screen 0"
-EndSection
diff --git a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/dm37x-evm/xorg.conf b/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/dm37x-evm/xorg.conf
deleted file mode 100644
index 983bb08..0000000
--- a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/dm37x-evm/xorg.conf
+++ /dev/null
@@ -1,29 +0,0 @@
-Section "Module"                                       
-        Load    "extmod"                                
-        Load    "dbe"                           
-        Load    "glx"                                           
-        Load    "freetype"                             
-        Load    "type1"                        
-        Load    "record"                    
-        Load    "dri"                       
-EndSection                            
-
-Section "Monitor"                                                                    
-        Identifier      "Builtin Default Monitor"
-EndSection                                       
-
-Section "Device"                                  
-        Identifier      "Builtin Default fbdev Device 0"
-        Driver  "omapfb"
-EndSection                                                
-
-Section "Screen"                                        
-        Identifier      "Builtin Default fbdev Screen 0"     
-        Device  "Builtin Default fbdev Device 0"            
-        Monitor "Builtin Default Monitor"               
-EndSection                                              
-
-Section "ServerLayout"                                 
-        Identifier      "Builtin Default Layout"                                     
-        Screen  "Builtin Default fbdev Screen 0"        
-EndSection                                              
diff --git a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/eee701/xorg.conf b/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/eee701/xorg.conf
deleted file mode 100644
index 4ee293b..0000000
--- a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/eee701/xorg.conf
+++ /dev/null
@@ -1,97 +0,0 @@
-Section "ServerLayout"
-	Identifier     "X.org Configured"
-	Screen      0  "Screen0" 0 0
-	InputDevice    "Touchpad" 
-	InputDevice    "Keyboard"
-	InputDevice    "Mouse"
-	Option         "AllowEmptyInput"        "false"
-EndSection
-
-Section "Files"
-	ModulePath   "/usr/lib/xorg/modules"
-	FontPath     "/usr/share/fonts/X11/misc"
-EndSection
-
-Section "Module"
-	Load  "dbe"
-	Load  "extmod"
-EndSection
-
-Section "InputDevice"
-	Identifier  "Keyboard"
-	Driver      "kbd"
-	Option 	    "CoreKeyboard"
-EndSection
-
-Section "InputDevice"
-	Identifier  "Touchpad"
-	Driver      "synaptics"
-	Option      "TapButton1" "1"
-	Option	    "CorePointer"
-EndSection
-
-Section "InputDevice"
-        Identifier  "Mouse"
-        Driver      "mouse"
-	Option	    "Protocol" 		"Auto"
-EndSection
-
-
-Section "Monitor"
-	Identifier   "Monitor0"
-	VendorName   "Monitor Vendor"
-	ModelName    "Monitor Model"
-EndSection
-
-Section "Device"
-        ### Available Driver options are:-
-        ### Values: <i>: integer, <f>: float, <bool>: "True"/"False",
-        ### <string>: "String", <freq>: "<f> Hz/kHz/MHz"
-        ### [arg]: arg optional
-        #Option     "NoAccel"            	# [<bool>]
-        #Option     "SWcursor"           	# [<bool>]
-        #Option     "ColorKey"           	# <i>
-        #Option     "CacheLines"         	# <i>
-        #Option     "Dac6Bit"            	# [<bool>]
-        #Option     "DRI"                	# [<bool>]
-        #Option     "NoDDC"              	# [<bool>]
-        #Option     "ShowCache"          	# [<bool>]
-        #Option     "XvMCSurfaces"       	# <i>
-        #Option     "PageFlip"           	# [<bool>]
-	Identifier  "Card0"
-	Driver      "intel"
-	VendorName  "Unknown Vendor"
-	BoardName   "Unknown Board"
-	BusID       "PCI:0:2:0"
-EndSection
-
-Section "Screen"
-	Identifier "Screen0"
-	Device     "Card0"
-	Monitor    "Monitor0"
-	SubSection "Display"
-		Viewport   0 0
-		Depth     1
-	EndSubSection
-	SubSection "Display"
-		Viewport   0 0
-		Depth     4
-	EndSubSection
-	SubSection "Display"
-		Viewport   0 0
-		Depth     8
-	EndSubSection
-	SubSection "Display"
-		Viewport   0 0
-		Depth     15
-	EndSubSection
-	SubSection "Display"
-		Viewport   0 0
-		Depth     16
-	EndSubSection
-	SubSection "Display"
-		Viewport   0 0
-		Depth     24
-	EndSubSection
-EndSection
-
diff --git a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/htcdream/xorg.conf b/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/htcdream/xorg.conf
deleted file mode 100644
index be3c6ec..0000000
--- a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/htcdream/xorg.conf
+++ /dev/null
@@ -1,69 +0,0 @@
-Section "Monitor"
-	Identifier "Monitor0"
-	Mode "320x480"
-        	DotClock 0		
-		HTimings 320 320 320 320
-		VTimings 480 480 480 480
-		Flags    "-HSync" "-VSync"
-	EndMode
-EndSection    
-
-Section "Device"                                  
-        Identifier      "fbdev"
-        Driver  "fbdev"
-	Option "ShadowFB" "on" 
-	Option "Rotate" "CW" # comment for disabling rotation
-EndSection                                                
-
-Section "Screen"
-        Identifier "Framebuffer"
-        Device  "fbdev"
-        Monitor "Monitor0"
-        DefaultFbBpp 16
-        SubSection "Display"
-                Depth 16
-                Modes "320x480"
-        EndSubSection
-EndSection
-
-
-Section "ServerLayout"                                 
-        Identifier      "Builtin Default Layout"                                     
-        Screen  "Framebuffer"        
-	InputDevice "Trackball"
-	InputDevice "Touchscreen"
-        InputDevice "Keyboard"
-EndSection        
-
-Section "InputDevice"
-    Identifier "Trackball"
-    Driver     "evdev"
-    Option     "Device"            "/dev/input/event2"
-    Option     "ScreenNumber"      "0"
-    Option     "ReportingMode"     "Raw"
-    Option     "SwapAxes"          "True" # comment for disabling rotation
-    Option     "InvertY"           "True" # comment for disabling rotation
-EndSection
-
-
-Section "InputDevice"
-	Identifier 	"Touchscreen"
-	Driver     	"evdev"
-	Option     	"Device"        	"/dev/input/event1"
-	Option		"SwapAxes" 		"True"                  # comment for disabling rotation
-	Option		"InvertY" 		"True"			# comment for disabling rotation
-	Option		"ReportingMode"		"Raw"
-EndSection
-
-Section "InputDevice"
-        Identifier  "Keyboard"
-        Driver      "kbd"
-        Option      "XkbLayout" "us"
-        Option      "XkbModel"  "htcdream"
-EndSection
-
-
-Section "ServerFlags"
-	Option "AutoAddDevices" "false"
-EndSection
-
diff --git a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/htcleo/xorg.conf b/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/htcleo/xorg.conf
deleted file mode 100644
index 4153a26..0000000
--- a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/htcleo/xorg.conf
+++ /dev/null
@@ -1,73 +0,0 @@
-Section "Monitor"
-	Identifier "Monitor0"
-	Mode "480x800"
-        	DotClock 0		
-		HTimings 480 480 480 480
-		VTimings 800 800 800 800
-		Flags    "-HSync" "-VSync"
-	EndMode
-EndSection    
-
-
-
-Section "Device"                                  
-        Identifier      "fbdev"
-        Driver  "fbdev"
-	Option "ShadowFB" "on" 
-	#Option "Rotate" "CW" 
-EndSection                                                
-
-
-Section "Screen"                                        
-        Identifier "Framebuffer"     
-        Device  "fbdev"            
-        Monitor "Monitor"               
-	DefaultFbBpp 16
-	SubSection "Display"
-		Depth 16
-        	Modes "480x800"
-	EndSubSection
-EndSection                                              
-
-Section "Screen"
-        Identifier "480x800x16"
-        Device  "fbdev"
-        Monitor "Monitor"
-        DefaultFbBpp 16
-        SubSection "Display"
-                Depth 16
-                Modes "480x800"
-        EndSubSection
-EndSection
-
-
-Section "ServerLayout"                                 
-        Identifier      "Builtin Default Layout"                                     
-        Screen  "Framebuffer"        
-	InputDevice "Touchscreen" "CorePointer"
-        InputDevice "Keyboard" "CoreKeyboard"
-EndSection        
-
-Section "InputDevice"
-    Identifier     "Mouse0"
-    Driver         "mouse"
-    Option         "Protocol" "auto"
-    Option         "Device" "/dev/input/mice"
-    Option         "Emulate3Buttons" "no"
-    Option         "ZAxisMapping" "4 5"
-EndSection
-
-
-Section "InputDevice"
-    Identifier     "Touchscreen"
-    Driver         "tslib"
-    Option         "Protocol" "auto"
-    Option         "Device" "/dev/input/event0"
-    Option         "CorePointer"    "true"
-EndSection
-
-Section "InputDevice"
-        Identifier  "Keyboard"
-        Driver      "kbd"
-        Option      "XkbLayout" "en_US"
-EndSection
diff --git a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/igep0020/xorg.conf b/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/igep0020/xorg.conf
deleted file mode 100644
index 07d849d..0000000
--- a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/igep0020/xorg.conf
+++ /dev/null
@@ -1,29 +0,0 @@
-Section "Module"
-        Load    "extmod"
-        Load    "dbe"
-        Load    "glx"
-        Load    "freetype"
-        Load    "type1"
-        Load    "record"
-        Load    "dri"
-EndSection
-
-Section "Monitor"
-        Identifier      "Builtin Default Monitor"
-EndSection
-
-Section "Device"
-        Identifier      "Builtin Default fbdev Device 0"
-        Driver  "omapfb"
-EndSection
-
-Section "Screen"
-        Identifier      "Builtin Default fbdev Screen 0"
-        Device  "Builtin Default fbdev Device 0"
-        Monitor "Builtin Default Monitor"
-EndSection
-
-Section "ServerLayout"
-        Identifier      "Builtin Default Layout"
-        Screen  "Builtin Default fbdev Screen 0"
-EndSection
diff --git a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/ion/xorg.conf b/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/ion/xorg.conf
deleted file mode 100644
index 95a1523..0000000
--- a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/ion/xorg.conf
+++ /dev/null
@@ -1,51 +0,0 @@
-# xorg.conf (X.Org X Window System server configuration file)
-#
-# This file was generated by dexconf, the Debian X Configuration tool, using
-# values from the debconf database.
-#
-# Edit this file with caution, and see the xorg.conf manual page.
-# (Type "man xorg.conf" at the shell prompt.)
-#
-# This file is automatically updated on xserver-xorg package upgrades *only*
-# if it has not been modified since the last upgrade of the xserver-xorg
-# package.
-#
-# Note that some configuration settings that could be done previously
-# in this file, now are automatically configured by the server and settings
-# here are ignored.
-#
-# If you have edited this file but would like it to be automatically updated
-# again, run the following command:
-#   sudo dpkg-reconfigure -phigh xserver-xorg
-
-Section "Device"
-	Identifier	"NVidia"
-	Driver	"nvidia"
-#	Option	"NoLogo"	"True"
-EndSection
-
-Section "Monitor"
-        Identifier      "DELL 2007WFP"
-#        Option          "DPMS"
-        HorizSync       30.0-83.0
-        VertRefresh     56.0-76.0
-	ModeLine	"1680x1050" 119.0 1680 1728 1760 1840 1050 1053 1059 1080 -HSync +VSync
-EndSection
-
-Section "Screen"
-	Identifier	"Default Screen"
-	Device		"NVidia"
-	Monitor		"DELL 2007WFP"
-	DefaultDepth	24
-	SubSection "Display"
-		Depth		24
-		Modes		"1680x1050"
-		ViewPort	0 0
-	EndSubSection
-EndSection
-
-Section "Module"
-	Load	"glx"
-EndSection
-
-
diff --git a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/iphone3g/xorg.conf b/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/iphone3g/xorg.conf
deleted file mode 100644
index 83ac9c1..0000000
--- a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/iphone3g/xorg.conf
+++ /dev/null
@@ -1,29 +0,0 @@
-Section "Device"
-	Identifier "Builtin Default fbdev Device 0"
-	Driver  "fbdev"
-	Option "ShadowFB" "on"
-EndSection
-
-Section "Screen"
-	Identifier "Builtin Default fbdev Screen 0"
-	Device "Builtin Default fbdev Device 0"
-EndSection
-
-
-Section "InputDevice"
-	Identifier "touchscreen"
-	Driver "evdev"
-	Option "Device" "/dev/input/event2"
-	Option "ReportingMode" "Raw"
-	Option "SendCoreEvents" "On"
-	Option "GrabDevices" "True"
-	Option "InvertY" "0"
-	Option "SwapAxes" "0"
-EndSection
-
-
-Section "ServerLayout"
-	Identifier      "Builtin Default Layout"
-	Screen  "Builtin Default fbdev Screen 0"
-	InputDevice "touchscreen" "CorePointer" "AlwaysCore"
-EndSection
diff --git a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/mh355/xorg.conf b/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/mh355/xorg.conf
deleted file mode 100644
index 4c275c9..0000000
--- a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/mh355/xorg.conf
+++ /dev/null
@@ -1,47 +0,0 @@
-#
-# X11 configuration for Microhard MH355 device
-# (C)2010 Koan sas - www.KoanSoftware.com
-#
-
-Section "Monitor"
-        Identifier      "Display"
-EndSection
-
-Section "Device"
-        Identifier      "fbdevice"
-        Driver  	"fbdev"
-	Option 		"fbdev" "/dev/fb0"
-	Option 		"shadowfb" "true"
-EndSection
-
-Section "Screen"
-        Identifier      "fbscreen"
-        Device  	"fbdevice"
-        Monitor 	"Display"
-EndSection
-
-Section "InputDevice"
-        Identifier      "mh355-ts"
-        Driver          "evdev"
-        Option          "SwapAxes" "1"
-        Option          "Device" "/dev/input/touchscreen0"
-EndSection
-
-Section "InputDevice"
-        Identifier      "Generic Mouse"
-        Driver          "mouse"   
-        Option          "CorePointer"
-EndSection
-
-Section "ServerLayout"
-        Identifier      "Layout"
-        Screen  	"fbscreen"
-        InputDevice 	"mh355-ts" "CorePointer"
-# Enable mouse only if necessary, it may interfere with touchscreen behaviour
-#        InputDevice     "Generic Mouse"
-EndSection
-
-Section "ServerFlags"
-	Option "AutoAddDevices" "false"
-EndSection
-
diff --git a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/nokia800/xorg.conf b/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/nokia800/xorg.conf
deleted file mode 100644
index 983bb08..0000000
--- a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/nokia800/xorg.conf
+++ /dev/null
@@ -1,29 +0,0 @@
-Section "Module"                                       
-        Load    "extmod"                                
-        Load    "dbe"                           
-        Load    "glx"                                           
-        Load    "freetype"                             
-        Load    "type1"                        
-        Load    "record"                    
-        Load    "dri"                       
-EndSection                            
-
-Section "Monitor"                                                                    
-        Identifier      "Builtin Default Monitor"
-EndSection                                       
-
-Section "Device"                                  
-        Identifier      "Builtin Default fbdev Device 0"
-        Driver  "omapfb"
-EndSection                                                
-
-Section "Screen"                                        
-        Identifier      "Builtin Default fbdev Screen 0"     
-        Device  "Builtin Default fbdev Device 0"            
-        Monitor "Builtin Default Monitor"               
-EndSection                                              
-
-Section "ServerLayout"                                 
-        Identifier      "Builtin Default Layout"                                     
-        Screen  "Builtin Default fbdev Screen 0"        
-EndSection                                              
diff --git a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/nokia900/xorg.conf b/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/nokia900/xorg.conf
deleted file mode 100644
index d9d742f..0000000
--- a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/nokia900/xorg.conf
+++ /dev/null
@@ -1,62 +0,0 @@
-Section "Module"
-        Load    "extmod"
-        Load    "dbe"
-	Load	"glx"
-        Load    "freetype"
-        Load    "type1"
-        Load    "record"
-	Load	"dri"
-EndSection
-
-Section "Monitor"
-        Identifier      "Default Monitor"
-EndSection
-
-Section "Device"
-        Identifier      "Default omapfb Device"
-        Driver		"omapfb"
-	Option		"fb" "/dev/fb0"
-
-EndSection
-
-Section "InputDevice"
-	Identifier	"gpio-keys"
-        Driver          "evdev"
-        Option          "Device"        "/dev/input/event0"
-EndSection
-
-Section "InputDevice"
-        Identifier	"twl4030_pwrbutton"
-        Driver          "evdev"
-        Option          "Device"        "/dev/input/event3"
-EndSection
-
-
-Section "InputDevice"
-	Identifier      "Keyboard"
-	Driver          "evdev"
-	Option		"Device"	"/dev/input/event1"
-	Option		"XkbModel"	"nokiarx51"
-	Option		"XkbLayout"	"us"
-	Option          "CoreKeyboard"
-EndSection
-
-Section "InputDevice"
-	Identifier      "Touchscreen"
-	Driver          "evdev"
-	Option          "Device"        "/dev/input/event2"
-EndSection
-
-Section "Screen"
-        Identifier      "Default Screen"
-        Device		"Default omapfb Device"
-EndSection
-
-Section "ServerLayout"
-	Identifier      "Default Layout"
-	Screen		"Default Screen"
-	InputDevice     "Touchscreen"
-	InputDevice     "Keyboard"
-	InputDevice     "gpio-keys"
-	InputDevice     "twl4030_pwrbutton"
-EndSection
diff --git a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/om-gta01/xorg.conf b/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/om-gta01/xorg.conf
deleted file mode 100644
index edb5e0e..0000000
--- a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/om-gta01/xorg.conf
+++ /dev/null
@@ -1,49 +0,0 @@
-Section "Monitor"
-        Identifier      "LCD Panel"
-EndSection
-
-
-Section "Device"
-        Identifier      "Fbdev"
-        Driver          "fbdev"
-EndSection  
-
-
-Section "Screen"
-        Identifier      "Default Screen"
-        Device          "Fbdev"
-        Monitor         "LCD Panel"
-EndSection
-
-
-Section "InputDevice"
-	Identifier	"Power Button"
-	Driver		"evdev"
-	Option		"Device"	"/dev/input/event2"
-EndSection
-
-
-Section "InputDevice"
-	Identifier	"AUX Button"
-	Driver		"evdev"
-	Option		"Device"	"/dev/input/event0"
-EndSection
-
-
-Section "InputDevice"
-	Identifier	"Touchscreen"
-	Driver		"evdev"
-	Option		"Device"	"/dev/input/event1"
-EndSection
-
-Section "ServerFlags"
-	Option		"AutoAddDevices"	"False"
-EndSection
-
-Section "ServerLayout"
-        Identifier      "Default Layout"
-        Screen          "Default Screen"
-	InputDevice	"Power Button"
-	InputDevice	"AUX Button"
-	InputDevice	"Touchscreen"
-EndSection
diff --git a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/om-gta02/xorg.conf b/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/om-gta02/xorg.conf
deleted file mode 100644
index de6ed1c..0000000
--- a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/om-gta02/xorg.conf
+++ /dev/null
@@ -1,55 +0,0 @@
-Section "Module"
-        Load    "glx"
-        Load	"dri2"
-EndSection
-
-
-Section "Monitor"
-        Identifier      "LCD Panel"
-EndSection
-
-
-Section "Device"
-        Identifier      "Glamo Graphics Chip"
-        Driver          "glamo"
-EndSection  
-
-
-Section "Screen"
-        Identifier      "Default Screen"
-        Device          "Glamo Graphics Chip"
-        Monitor         "LCD Panel"
-EndSection
-
-
-Section "InputDevice"
-	Identifier	"Power Button"
-	Driver		"evdev"
-	Option		"Device"	"/dev/input/event0"
-EndSection
-
-
-Section "InputDevice"
-	Identifier	"AUX Button"
-	Driver		"evdev"
-	Option		"Device"	"/dev/input/event2"
-EndSection
-
-
-Section "InputDevice"
-	Identifier	"Touchscreen"
-	Driver		"evdev"
-	Option		"Device"	"/dev/input/event1"
-EndSection
-
-Section "ServerFlags"
-        Option "AutoAddDevices" "False"
-EndSection
-
-Section "ServerLayout"
-        Identifier      "Default Layout"
-        Screen          "Default Screen"
-	InputDevice	"Power Button"
-	InputDevice	"AUX Button"
-	InputDevice	"Touchscreen"
-EndSection
diff --git a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/omap3-pandora/xorg.conf b/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/omap3-pandora/xorg.conf
deleted file mode 100644
index 446ac97..0000000
--- a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/omap3-pandora/xorg.conf
+++ /dev/null
@@ -1,24 +0,0 @@
-Section "Module"
-        Load    "extmod"
-        Load    "dbe"
-EndSection
-
-Section "Monitor"
-        Identifier      "Builtin Default Monitor"
-EndSection
-
-Section "Device"
-        Identifier      "Builtin Default fbdev Device 0"
-        Driver  "omapfb"
-EndSection
-
-Section "Screen"
-        Identifier      "Builtin Default fbdev Screen 0"
-        Device  "Builtin Default fbdev Device 0"
-        Monitor "Builtin Default Monitor"
-EndSection                                         
-
-Section "ServerLayout"
-        Identifier      "Builtin Default Layout"
-        Screen          "Builtin Default fbdev Screen 0"
-EndSection
diff --git a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/omap3-touchbook/xorg.conf b/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/omap3-touchbook/xorg.conf
deleted file mode 100644
index 56425ab..0000000
--- a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/omap3-touchbook/xorg.conf
+++ /dev/null
@@ -1,25 +0,0 @@
-Section "Module"
-        Load    "extmod"
-        Load    "dbe"
-EndSection
-
-Section "Monitor"
-        Identifier      "Builtin Default Monitor"
-EndSection
-
-Section "Device"
-        Identifier      "Builtin Default fbdev Device 0"
-        Driver  "fbdev"
-        Option  "ShadowFB"              "false"
-EndSection
-
-Section "Screen"
-        Identifier      "Builtin Default fbdev Screen 0"
-        Device  "Builtin Default fbdev Device 0"
-        Monitor "Builtin Default Monitor"
-EndSection                                         
-
-Section "ServerLayout"
-        Identifier      "Builtin Default Layout"
-        Screen          "Builtin Default fbdev Screen 0"
-EndSection
diff --git a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/omap3/xorg.conf b/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/omap3/xorg.conf
deleted file mode 100644
index 983bb08..0000000
--- a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/omap3/xorg.conf
+++ /dev/null
@@ -1,29 +0,0 @@
-Section "Module"                                       
-        Load    "extmod"                                
-        Load    "dbe"                           
-        Load    "glx"                                           
-        Load    "freetype"                             
-        Load    "type1"                        
-        Load    "record"                    
-        Load    "dri"                       
-EndSection                            
-
-Section "Monitor"                                                                    
-        Identifier      "Builtin Default Monitor"
-EndSection                                       
-
-Section "Device"                                  
-        Identifier      "Builtin Default fbdev Device 0"
-        Driver  "omapfb"
-EndSection                                                
-
-Section "Screen"                                        
-        Identifier      "Builtin Default fbdev Screen 0"     
-        Device  "Builtin Default fbdev Device 0"            
-        Monitor "Builtin Default Monitor"               
-EndSection                                              
-
-Section "ServerLayout"                                 
-        Identifier      "Builtin Default Layout"                                     
-        Screen  "Builtin Default fbdev Screen 0"        
-EndSection                                              
diff --git a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/omap3evm/xorg.conf b/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/omap3evm/xorg.conf
deleted file mode 100644
index 983bb08..0000000
--- a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/omap3evm/xorg.conf
+++ /dev/null
@@ -1,29 +0,0 @@
-Section "Module"                                       
-        Load    "extmod"                                
-        Load    "dbe"                           
-        Load    "glx"                                           
-        Load    "freetype"                             
-        Load    "type1"                        
-        Load    "record"                    
-        Load    "dri"                       
-EndSection                            
-
-Section "Monitor"                                                                    
-        Identifier      "Builtin Default Monitor"
-EndSection                                       
-
-Section "Device"                                  
-        Identifier      "Builtin Default fbdev Device 0"
-        Driver  "omapfb"
-EndSection                                                
-
-Section "Screen"                                        
-        Identifier      "Builtin Default fbdev Screen 0"     
-        Device  "Builtin Default fbdev Device 0"            
-        Monitor "Builtin Default Monitor"               
-EndSection                                              
-
-Section "ServerLayout"                                 
-        Identifier      "Builtin Default Layout"                                     
-        Screen  "Builtin Default fbdev Screen 0"        
-EndSection                                              
diff --git a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/omapzoom/xorg.conf b/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/omapzoom/xorg.conf
deleted file mode 100644
index 983bb08..0000000
--- a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/omapzoom/xorg.conf
+++ /dev/null
@@ -1,29 +0,0 @@
-Section "Module"                                       
-        Load    "extmod"                                
-        Load    "dbe"                           
-        Load    "glx"                                           
-        Load    "freetype"                             
-        Load    "type1"                        
-        Load    "record"                    
-        Load    "dri"                       
-EndSection                            
-
-Section "Monitor"                                                                    
-        Identifier      "Builtin Default Monitor"
-EndSection                                       
-
-Section "Device"                                  
-        Identifier      "Builtin Default fbdev Device 0"
-        Driver  "omapfb"
-EndSection                                                
-
-Section "Screen"                                        
-        Identifier      "Builtin Default fbdev Screen 0"     
-        Device  "Builtin Default fbdev Device 0"            
-        Monitor "Builtin Default Monitor"               
-EndSection                                              
-
-Section "ServerLayout"                                 
-        Identifier      "Builtin Default Layout"                                     
-        Screen  "Builtin Default fbdev Screen 0"        
-EndSection                                              
diff --git a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/omapzoom2/xorg.conf b/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/omapzoom2/xorg.conf
deleted file mode 100644
index 983bb08..0000000
--- a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/omapzoom2/xorg.conf
+++ /dev/null
@@ -1,29 +0,0 @@
-Section "Module"                                       
-        Load    "extmod"                                
-        Load    "dbe"                           
-        Load    "glx"                                           
-        Load    "freetype"                             
-        Load    "type1"                        
-        Load    "record"                    
-        Load    "dri"                       
-EndSection                            
-
-Section "Monitor"                                                                    
-        Identifier      "Builtin Default Monitor"
-EndSection                                       
-
-Section "Device"                                  
-        Identifier      "Builtin Default fbdev Device 0"
-        Driver  "omapfb"
-EndSection                                                
-
-Section "Screen"                                        
-        Identifier      "Builtin Default fbdev Screen 0"     
-        Device  "Builtin Default fbdev Device 0"            
-        Monitor "Builtin Default Monitor"               
-EndSection                                              
-
-Section "ServerLayout"                                 
-        Identifier      "Builtin Default Layout"                                     
-        Screen  "Builtin Default fbdev Screen 0"        
-EndSection                                              
diff --git a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/omapzoom36x/xorg.conf b/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/omapzoom36x/xorg.conf
deleted file mode 100644
index 983bb08..0000000
--- a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/omapzoom36x/xorg.conf
+++ /dev/null
@@ -1,29 +0,0 @@
-Section "Module"                                       
-        Load    "extmod"                                
-        Load    "dbe"                           
-        Load    "glx"                                           
-        Load    "freetype"                             
-        Load    "type1"                        
-        Load    "record"                    
-        Load    "dri"                       
-EndSection                            
-
-Section "Monitor"                                                                    
-        Identifier      "Builtin Default Monitor"
-EndSection                                       
-
-Section "Device"                                  
-        Identifier      "Builtin Default fbdev Device 0"
-        Driver  "omapfb"
-EndSection                                                
-
-Section "Screen"                                        
-        Identifier      "Builtin Default fbdev Screen 0"     
-        Device  "Builtin Default fbdev Device 0"            
-        Monitor "Builtin Default Monitor"               
-EndSection                                              
-
-Section "ServerLayout"                                 
-        Identifier      "Builtin Default Layout"                                     
-        Screen  "Builtin Default fbdev Screen 0"        
-EndSection                                              
diff --git a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/overo/xorg.conf b/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/overo/xorg.conf
deleted file mode 100644
index 983bb08..0000000
--- a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/overo/xorg.conf
+++ /dev/null
@@ -1,29 +0,0 @@
-Section "Module"                                       
-        Load    "extmod"                                
-        Load    "dbe"                           
-        Load    "glx"                                           
-        Load    "freetype"                             
-        Load    "type1"                        
-        Load    "record"                    
-        Load    "dri"                       
-EndSection                            
-
-Section "Monitor"                                                                    
-        Identifier      "Builtin Default Monitor"
-EndSection                                       
-
-Section "Device"                                  
-        Identifier      "Builtin Default fbdev Device 0"
-        Driver  "omapfb"
-EndSection                                                
-
-Section "Screen"                                        
-        Identifier      "Builtin Default fbdev Screen 0"     
-        Device  "Builtin Default fbdev Device 0"            
-        Monitor "Builtin Default Monitor"               
-EndSection                                              
-
-Section "ServerLayout"                                 
-        Identifier      "Builtin Default Layout"                                     
-        Screen  "Builtin Default fbdev Screen 0"        
-EndSection                                              
diff --git a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/palmpre/xorg.conf b/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/palmpre/xorg.conf
deleted file mode 100644
index 6915b87..0000000
--- a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/palmpre/xorg.conf
+++ /dev/null
@@ -1,58 +0,0 @@
-Section "Module"
-    Load    "extmod" 
-    Load    "dbe"
-    Load    "freetype"
-    Load    "type1"
-    Load    "record"
-    Load    "dri"
-EndSection
-
-Section "Monitor"
-    Identifier  "Builtin Default Monitor"
-EndSection
-
-Section "Device"
-    Identifier  "Builtin Default fbdev Device 0"
-    Driver      "omapfb"
-    Option      "fb" "/dev/fb0"
-EndSection
-
-Section "Screen"
-    Identifier  "Builtin Default fbdev Screen 0"
-    Device      "Builtin Default fbdev Device 0"
-    Monitor     "Builtin Default Monitor"
-EndSection
-
-Section "ServerLayout"
-    Identifier  "Builtin Default Layout"
-    Screen      "Builtin Default fbdev Screen 0"
-    InputDevice "Touchscreen" "CorePointer"
-EndSection
-
-Section "InputDevice"
-    Identifier  "Touchscreen"
-    Driver      "evdev"
-    Option      "Device"                "/dev/input/event6"
-    Option      "SendCoreEvents"        "true"
-    Option      "Protocol"              "Auto"
-    Option      "Width"                 "320"
-    Option      "Height"                "528"
-    Option      "EmulateRightButton"    "1"
-    Option      "CorePointer"           "true"
-EndSection
-
-Section "InputDevice"
-    Identifier "Keyboard"
-    Driver     "palm-pre"
-    Option     "Device"                "/dev/input/event2"
-    Option      "SendCoreEvents"        "true"
-    #Option     "XkbModel"              "palm-pre"
-    Option     "XkbLayout"             "palm-pre"
-#    Option     "XKbOptions" ""
-EndSection
-
-#Section "InputDevice"
-#   Identifier   "Keyboard"
-#   Driver 	"evdev"
-#   Option       "Device"                "/dev/input/event2"
-#EndSection
diff --git a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/ronetix-pm9263/xorg.conf b/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/ronetix-pm9263/xorg.conf
deleted file mode 100644
index d4651ad..0000000
--- a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/ronetix-pm9263/xorg.conf
+++ /dev/null
@@ -1,47 +0,0 @@
-#
-# X11 configuration for Ronetix PM9263 device.
-# (C)2009-2010 Koan sas - www.KoanSoftware.com
-#
-
-Section "Monitor"
-        Identifier      "Display"
-EndSection
-
-Section "Device"
-        Identifier      "fbdevice"
-        Driver  	"fbdev"
-	Option 		"fbdev" "/dev/fb0"
-	Option 		"shadowfb" "true"
-EndSection
-
-Section "Screen"
-        Identifier      "fbscreen"
-        Device  	"fbdevice"
-        Monitor 	"Display"
-EndSection
-
-Section "InputDevice"
-        Identifier      "atmel-ts"
-        Driver          "evdev"
-        Option          "SwapAxes" "1"
-        Option          "Device" "/dev/input/touchscreen0"
-EndSection
-
-Section "InputDevice"
-        Identifier      "Generic Mouse"
-        Driver          "mouse"   
-        Option          "CorePointer"
-EndSection
-
-Section "ServerLayout"
-        Identifier      "Layout"
-        Screen  	"fbscreen"
-        InputDevice 	"atmel-ts" "CorePointer"
-# Enable mouse only if necessary, it may interfere with touchscreen behaviour
-#        InputDevice     "Generic Mouse"
-EndSection
-
-Section "ServerFlags"
-	Option "AutoAddDevices" "false"
-EndSection
-
diff --git a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/spitz/xorg.conf b/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/spitz/xorg.conf
deleted file mode 100644
index 224df5c..0000000
--- a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/spitz/xorg.conf
+++ /dev/null
@@ -1,49 +0,0 @@
-Section "Device"
-        Identifier      "Generic Video Card"
-        Driver          "fbdev"
-        Option          "UseFBDev"              "true"
-        Option          "Rotate"                "CW"
-EndSection
-
-Section "Monitor"
-        Identifier      "Generic Monitor"
-        Option          "DPMS"
-        HorizSync       28-32
-        VertRefresh     43-60
-EndSection
-
-Section "Screen"
-        Identifier      "Default Screen"
-        Device          "Generic Video Card"
-        Monitor         "Generic Monitor"
-        DefaultDepth    16
-        SubSection "Display"
-                Depth           1
-                Modes           "640x480"
-        EndSubSection
-        SubSection "Display"
-                Depth           4
-                Modes           "640x480"
-        EndSubSection
-        SubSection "Display"
-                Depth           8
-                Modes           "640x480"
-        EndSubSection
-        SubSection "Display"
-                Depth           15
-                Modes           "640x480"
-        EndSubSection
-        SubSection "Display"
-                Depth           16
-                Modes           "640x480"
-        EndSubSection
-        SubSection "Display"
-                Depth           24
-                Modes           "640x480"
-        EndSubSection
-EndSection
-
-Section "ServerLayout"
-        Identifier      "Default Layout"
-        Screen          "Default Screen"
-EndSection
diff --git a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/vortex86sx/xorg.conf b/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/vortex86sx/xorg.conf
deleted file mode 100644
index 0f03faf..0000000
--- a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/vortex86sx/xorg.conf
+++ /dev/null
@@ -1,13 +0,0 @@
-Section "Device"
-	Identifier  "Card0"
-	Driver      "vesa"
-EndSection
-
-# SIS driver is proper one for this device but fails with misc errors.
-#Section "Device"
-#	Identifier  "Card0"
-#	Driver      "sis"
-#
-#	Disable MMX/SSE tests
-#	Option      "BenchmarkMemCpy" "off"
-#EndSection
diff --git a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/xilinx-ml507/xorg.conf b/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/xilinx-ml507/xorg.conf
deleted file mode 100644
index 2950193..0000000
--- a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/xilinx-ml507/xorg.conf
+++ /dev/null
@@ -1,39 +0,0 @@
-Section "Monitor"
-	Identifier "LCD Panel"
-EndSection
-
-Section "Device"
-    Identifier  "Xilinx frame buffer"
-    Driver      "fbdev"
-EndSection
-
-Section "Screen"
-    Identifier  "Default Screen"
-    Device      "Xilinx frame buffer"
-    Monitor     "LCD Panel"
-	SubSection "Display"
-		Depth   24
-        Modes   "640x480"
-	EndSubSection
-EndSection
-
-Section "InputDevice"
-    Identifier  "Keyboard"
-    Driver      "kbd"
-#    Option      "XkbLayout" "es"
-#    Option      "XkbModel"  "pc105"
-EndSection
-
-Section "InputDevice"
-    Identifier  "Mouse"
-    Driver      "mouse"
-    Option      "protocol" "auto"
-    Option      "device" "/dev/input/mice"
-EndSection
-
-Section "ServerLayout"
-    Identifier  "Default Layout"
-    Screen      "Default Screen"
-    InputDevice "Keyboard"
-    InputDevice "Mouse"
-EndSection
diff --git a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/xilinx-virtex5/xorg.conf b/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/xilinx-virtex5/xorg.conf
deleted file mode 100644
index 61f0f9f..0000000
--- a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/xilinx-virtex5/xorg.conf
+++ /dev/null
@@ -1,38 +0,0 @@
-# Xorg conf file for Xilinx platforms
-Section "Monitor"
-	Identifier "LCD Panel"
-EndSection
-
-Section "Device"
-    Identifier  "Xilinx frame buffer"
-    Driver      "fbdev"
-EndSection
-
-Section "Screen"
-    Identifier  "Default Screen"
-    Device      "Xilinx frame buffer"
-    Monitor     "LCD Panel"
-	SubSection "Display"
-		Depth   24
-        Modes   "640x480"
-	EndSubSection
-EndSection
-
-Section "InputDevice"
-    Identifier  "Keyboard"
-    Driver      "kbd"
-EndSection
-
-Section "InputDevice"
-    Identifier  "Mouse"
-    Driver      "mouse"
-    Option      "protocol" "auto"
-    Option      "device" "/dev/input/mice"
-EndSection
-
-Section "ServerLayout"
-    Identifier  "Default Layout"
-    Screen      0 "Default Screen" 0 0
-    InputDevice "Keyboard"
-    InputDevice "Mouse"
-EndSection
diff --git a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/xorg.conf b/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/xorg.conf
deleted file mode 100644
index e69de29..0000000
diff --git a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf_0.1.bb b/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf_0.1.bb
deleted file mode 100644
index 66505bd..0000000
--- a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf_0.1.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-DESCRIPTION = "Machine specific xorg.conf files"
-PR = "r43"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-
-SRC_URI = "file://xorg.conf"
-
-do_install() {
-	install -d ${D}/${sysconfdir}/X11
-	install -m 0644 ${WORKDIR}/xorg.conf ${D}/${sysconfdir}/X11/
-}
-
-# Set some dependencies to make the confs actually work
-RDEPENDS_omap3 = "xf86-video-omapfb"
-
-CONFFILES_${PN} += "${sysconfdir}/X11/xorg.conf"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg_1.10.2.bb b/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg_1.10.2.bb
index 5810d37..1d88364 100644
--- a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg_1.10.2.bb
+++ b/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg_1.10.2.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=74df27b6254cc88d2799b5f4f5949c00"
 DESCRIPTION = "the X.Org X server"
 DEPENDS += "mesa-dri pixman libpciaccess openssl dri2proto glproto font-util-native"
 PE = "2"
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 SRC_URI += " \
             file://50b9d3142ff90af2f7fa35b7b1bf9e5a07723dbd.patch \
-- 
1.7.6.1



