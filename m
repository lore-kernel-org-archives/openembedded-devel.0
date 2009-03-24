Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <s_buschmann@gmx.de>) id 1LmEA6-00081i-02
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Mar 2009 22:27:55 +0100
Received: (qmail invoked by alias); 24 Mar 2009 21:26:21 -0000
Received: from dslb-092-076-247-030.pools.arcor-ip.net (EHLO [192.168.1.61])
	[92.76.247.30]
	by mail.gmx.net (mp053) with SMTP; 24 Mar 2009 22:26:21 +0100
X-Authenticated: #1404922
X-Provags-ID: V01U2FsdGVkX1+gm0Y8wIGgNyxnVEPfU1sY0e6exwRH3r1tVwriFS
	F/NHGEwj3MtqIg
Message-ID: <49C94FFC.1040604@gmx.de>
Date: Tue, 24 Mar 2009 22:26:20 +0100
From: Stefan Buschmann <s_buschmann@gmx.de>
User-Agent: Thunderbird 2.0.0.21 (X11/20090318)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.58,0.67,0.57
Subject: python-ecore_svn fails
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
X-List-Received-Date: Tue, 24 Mar 2009 21:27:57 -0000
Content-Type: multipart/mixed; boundary="------------080702020209030009090607"

--------------080702020209030009090607
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

I'm trying to build fso-zhone-image for my freerunner, but I get the 
following error message in python-ecore-0.3.1+svnr39502-ml0:

ecore/evas/ecore.evas.c_ecore_evas.c:19373: error: 
'ECORE_EVAS_ENGINE_SDL' undeclared (first use in this function)

The build system is KUbuntu-8.10 (32 Bit), build-log and local.conf are 
attached.

BTW, I've checked out only the OE tree from 
git://git.openembedded.net/openembedded. Is this correct, or do I need a 
different mirror/overlay for OpenMoko/FSO? I'm still a little bit 
confused about the different OpenMoko-repositories ;-)

Thanks,

Stefan

DISTRO = "openmoko"
BBFILES  = "/workspace/projekte/oe/openembedded/recipes/*/*.bb"
#BBFILES += "/workspace/projekte/oe/profile/openmoko/recipes/*/*.bb"
BBFILES += "/workspace/projekte/oe/profile/all/recipes/*/*.bb"
TMPDIR = "/workspace/projekte/oe/build-om"
MACHINE = "om-gta02"
IMAGE_FSTYPES = "jffs2 tar"
#GLIBC_GENERATE_LOCALES = "en_GB.UTF-8 de_DE.UTF-8"
ENABLE_BINARY_LOCALE_GENERATION = "0"
BB_NUMBER_THREADS = "2"
PARALLEL_MAKE = "-j 2"

# Use latest (unstable) version
require conf/distro/include/fso-autorev.inc
require conf/distro/include/moko-autorev.inc
/workspace/projekte/oe/build-om/staging/i686-linux/usr/lib/python2.6/site-packages/Pyrex/Compiler/Errors.py:17: DeprecationWarning: BaseException.message has been deprecated as of Python 2.6
  self.message = message
running build
running build_py
running build_ext
building 'ecore.evas.c_ecore_evas' extension
ccache arm-angstrom-linux-gnueabi-gcc -march=armv4t -mtune=arm920t -mthumb-interwork -mno-thumb -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -isystem/workspace/projekte/oe/build-om/staging/armv4t-angstrom-linux-gnueabi/usr/include -fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -isystem/workspace/projekte/oe/build-om/staging/armv4t-angstrom-linux-gnueabi/usr/include -fPIC -I/workspace/projekte/oe/build-om/staging/armv4t-angstrom-linux-gnueabi/usr/include/eina-0 -I/workspace/projekte/oe/build-om/staging/armv4t-angstrom-linux-gnueabi/usr/include/eina-0/eina -Iinclude -I/workspace/projekte/oe/build-om/staging/arm-angstrom-linux-gnueabi/usr/include/python2.6 -I/workspace/projekte/oe/build-om/staging/armv4t-angstrom-linux-gnueabi/usr/include/python2.6 -c ecore/evas/ecore.evas.c_ecore_evas.c -o build/temp.linux-i686-2.6/ecore/evas/ecore.evas.c_ecore_evas.o
ecore/evas/ecore.evas.c_ecore_evas.c: In function '__pyx_pf_5ecore_4evas_12c_ecore_evas_engine_type_supported_get':
ecore/evas/ecore.evas.c_ecore_evas.c:1869: warning: dereferencing type-punned pointer will break strict-aliasing rules
ecore/evas/ecore.evas.c_ecore_evas.c:1870: warning: dereferencing type-punned pointer will break strict-aliasing rules
ecore/evas/ecore.evas.c_ecore_evas.c:1871: warning: dereferencing type-punned pointer will break strict-aliasing rules
ecore/evas/ecore.evas.c_ecore_evas.c:1872: warning: dereferencing type-punned pointer will break strict-aliasing rules
ecore/evas/ecore.evas.c_ecore_evas.c:1927: warning: dereferencing type-punned pointer will break strict-aliasing rules
ecore/evas/ecore.evas.c_ecore_evas.c:1927: warning: dereferencing type-punned pointer will break strict-aliasing rules
ecore/evas/ecore.evas.c_ecore_evas.c:1927: warning: dereferencing type-punned pointer will break strict-aliasing rules
ecore/evas/ecore.evas.c_ecore_evas.c:1927: warning: dereferencing type-punned pointer will break strict-aliasing rules
ecore/evas/ecore.evas.c_ecore_evas.c:1945: warning: dereferencing type-punned pointer will break strict-aliasing rules
ecore/evas/ecore.evas.c_ecore_evas.c: In function '__pyx_pf_5ecore_4evas_12c_ecore_evas_new':
ecore/evas/ecore.evas.c_ecore_evas.c:2189: warning: dereferencing type-punned pointer will break strict-aliasing rules
ecore/evas/ecore.evas.c_ecore_evas.c:2320: warning: assignment discards qualifiers from pointer target type
ecore/evas/ecore.evas.c_ecore_evas.c: In function '__pyx_f_5ecore_4evas_12c_ecore_evas_EcoreEvas_from_instance':
ecore/evas/ecore.evas.c_ecore_evas.c:2505: warning: dereferencing type-punned pointer will break strict-aliasing rules
ecore/evas/ecore.evas.c_ecore_evas.c: In function '__pyx_f_5ecore_4evas_12c_ecore_evas_resize_cb':
ecore/evas/ecore.evas.c_ecore_evas.c:2532: warning: dereferencing type-punned pointer will break strict-aliasing rules
ecore/evas/ecore.evas.c_ecore_evas.c: In function '__pyx_f_5ecore_4evas_12c_ecore_evas_move_cb':
ecore/evas/ecore.evas.c_ecore_evas.c:2656: warning: dereferencing type-punned pointer will break strict-aliasing rules
ecore/evas/ecore.evas.c_ecore_evas.c: In function '__pyx_f_5ecore_4evas_12c_ecore_evas_show_cb':
ecore/evas/ecore.evas.c_ecore_evas.c:2780: warning: dereferencing type-punned pointer will break strict-aliasing rules
ecore/evas/ecore.evas.c_ecore_evas.c: In function '__pyx_f_5ecore_4evas_12c_ecore_evas_hide_cb':
ecore/evas/ecore.evas.c_ecore_evas.c:2904: warning: dereferencing type-punned pointer will break strict-aliasing rules
ecore/evas/ecore.evas.c_ecore_evas.c: In function '__pyx_f_5ecore_4evas_12c_ecore_evas_delete_request_cb':
ecore/evas/ecore.evas.c_ecore_evas.c:3028: warning: dereferencing type-punned pointer will break strict-aliasing rules
ecore/evas/ecore.evas.c_ecore_evas.c: In function '__pyx_f_5ecore_4evas_12c_ecore_evas_destroy_cb':
ecore/evas/ecore.evas.c_ecore_evas.c:3152: warning: dereferencing type-punned pointer will break strict-aliasing rules
ecore/evas/ecore.evas.c_ecore_evas.c: In function '__pyx_f_5ecore_4evas_12c_ecore_evas_focus_in_cb':
ecore/evas/ecore.evas.c_ecore_evas.c:3276: warning: dereferencing type-punned pointer will break strict-aliasing rules
ecore/evas/ecore.evas.c_ecore_evas.c: In function '__pyx_f_5ecore_4evas_12c_ecore_evas_focus_out_cb':
ecore/evas/ecore.evas.c_ecore_evas.c:3400: warning: dereferencing type-punned pointer will break strict-aliasing rules
ecore/evas/ecore.evas.c_ecore_evas.c: In function '__pyx_f_5ecore_4evas_12c_ecore_evas_sticky_cb':
ecore/evas/ecore.evas.c_ecore_evas.c:3524: warning: dereferencing type-punned pointer will break strict-aliasing rules
ecore/evas/ecore.evas.c_ecore_evas.c: In function '__pyx_f_5ecore_4evas_12c_ecore_evas_unsticky_cb':
ecore/evas/ecore.evas.c_ecore_evas.c:3648: warning: dereferencing type-punned pointer will break strict-aliasing rules
ecore/evas/ecore.evas.c_ecore_evas.c: In function '__pyx_f_5ecore_4evas_12c_ecore_evas_mouse_in_cb':
ecore/evas/ecore.evas.c_ecore_evas.c:3772: warning: dereferencing type-punned pointer will break strict-aliasing rules
ecore/evas/ecore.evas.c_ecore_evas.c: In function '__pyx_f_5ecore_4evas_12c_ecore_evas_mouse_out_cb':
ecore/evas/ecore.evas.c_ecore_evas.c:3896: warning: dereferencing type-punned pointer will break strict-aliasing rules
ecore/evas/ecore.evas.c_ecore_evas.c: In function '__pyx_f_5ecore_4evas_12c_ecore_evas_pre_render_cb':
ecore/evas/ecore.evas.c_ecore_evas.c:4020: warning: dereferencing type-punned pointer will break strict-aliasing rules
ecore/evas/ecore.evas.c_ecore_evas.c: In function '__pyx_f_5ecore_4evas_12c_ecore_evas_post_render_cb':
ecore/evas/ecore.evas.c_ecore_evas.c:4144: warning: dereferencing type-punned pointer will break strict-aliasing rules
ecore/evas/ecore.evas.c_ecore_evas.c: In function '__pyx_pf_5ecore_4evas_12c_ecore_evas_9EcoreEvas___new__':
ecore/evas/ecore.evas.c_ecore_evas.c:4286: warning: dereferencing type-punned pointer will break strict-aliasing rules
ecore/evas/ecore.evas.c_ecore_evas.c: In function '__pyx_pf_5ecore_4evas_12c_ecore_evas_9EcoreEvas___dealloc__':
ecore/evas/ecore.evas.c_ecore_evas.c:4365: warning: dereferencing type-punned pointer will break strict-aliasing rules
ecore/evas/ecore.evas.c_ecore_evas.c: In function '__pyx_pf_5ecore_4evas_12c_ecore_evas_9EcoreEvas_cursor_set':
ecore/evas/ecore.evas.c_ecore_evas.c:4907: warning: dereferencing type-punned pointer will break strict-aliasing rules
ecore/evas/ecore.evas.c_ecore_evas.c:4907: warning: dereferencing type-punned pointer will break strict-aliasing rules
ecore/evas/ecore.evas.c_ecore_evas.c: In function '__pyx_pf_5ecore_4evas_12c_ecore_evas_9EcoreEvas_shaped_get':
ecore/evas/ecore.evas.c_ecore_evas.c:6242: warning: dereferencing type-punned pointer will break strict-aliasing rules
ecore/evas/ecore.evas.c_ecore_evas.c: In function '__pyx_pf_5ecore_4evas_12c_ecore_evas_9EcoreEvas_alpha_get':
ecore/evas/ecore.evas.c_ecore_evas.c:6412: warning: dereferencing type-punned pointer will break strict-aliasing rules
ecore/evas/ecore.evas.c_ecore_evas.c: In function '__pyx_pf_5ecore_4evas_12c_ecore_evas_9EcoreEvas_visibility_get':
ecore/evas/ecore.evas.c_ecore_evas.c:6662: warning: dereferencing type-punned pointer will break strict-aliasing rules
ecore/evas/ecore.evas.c_ecore_evas.c: In function '__pyx_pf_5ecore_4evas_12c_ecore_evas_9EcoreEvas_title_get':
ecore/evas/ecore.evas.c_ecore_evas.c:6903: warning: assignment discards qualifiers from pointer target type
ecore/evas/ecore.evas.c_ecore_evas.c: In function '__pyx_pf_5ecore_4evas_12c_ecore_evas_9EcoreEvas_name_class_get':
ecore/evas/ecore.evas.c_ecore_evas.c:7128: warning: passing argument 2 of 'ecore_evas_name_class_get' from incompatible pointer type
ecore/evas/ecore.evas.c_ecore_evas.c:7128: warning: passing argument 3 of 'ecore_evas_name_class_get' from incompatible pointer type
ecore/evas/ecore.evas.c_ecore_evas.c: In function '__pyx_pf_5ecore_4evas_12c_ecore_evas_9EcoreEvas_focus_get':
ecore/evas/ecore.evas.c_ecore_evas.c:8353: warning: dereferencing type-punned pointer will break strict-aliasing rules
ecore/evas/ecore.evas.c_ecore_evas.c: In function '__pyx_pf_5ecore_4evas_12c_ecore_evas_9EcoreEvas_iconified_get':
ecore/evas/ecore.evas.c_ecore_evas.c:8522: warning: dereferencing type-punned pointer will break strict-aliasing rules
ecore/evas/ecore.evas.c_ecore_evas.c: In function '__pyx_pf_5ecore_4evas_12c_ecore_evas_9EcoreEvas_borderless_get':
ecore/evas/ecore.evas.c_ecore_evas.c:8691: warning: dereferencing type-punned pointer will break strict-aliasing rules
ecore/evas/ecore.evas.c_ecore_evas.c: In function '__pyx_pf_5ecore_4evas_12c_ecore_evas_9EcoreEvas_override_get':
ecore/evas/ecore.evas.c_ecore_evas.c:8860: warning: dereferencing type-punned pointer will break strict-aliasing rules
ecore/evas/ecore.evas.c_ecore_evas.c: In function '__pyx_pf_5ecore_4evas_12c_ecore_evas_9EcoreEvas_maximized_get':
ecore/evas/ecore.evas.c_ecore_evas.c:9029: warning: dereferencing type-punned pointer will break strict-aliasing rules
ecore/evas/ecore.evas.c_ecore_evas.c: In function '__pyx_pf_5ecore_4evas_12c_ecore_evas_9EcoreEvas_fullscreen_get':
ecore/evas/ecore.evas.c_ecore_evas.c:9163: warning: dereferencing type-punned pointer will break strict-aliasing rules
ecore/evas/ecore.evas.c_ecore_evas.c: In function '__pyx_pf_5ecore_4evas_12c_ecore_evas_9EcoreEvas_withdrawn_get':
ecore/evas/ecore.evas.c_ecore_evas.c:9529: warning: dereferencing type-punned pointer will break strict-aliasing rules
ecore/evas/ecore.evas.c_ecore_evas.c: In function '__pyx_pf_5ecore_4evas_12c_ecore_evas_9EcoreEvas_sticky_get':
ecore/evas/ecore.evas.c_ecore_evas.c:9698: warning: dereferencing type-punned pointer will break strict-aliasing rules
ecore/evas/ecore.evas.c_ecore_evas.c: In function '__pyx_pf_5ecore_4evas_12c_ecore_evas_9EcoreEvas_ignore_events_get':
ecore/evas/ecore.evas.c_ecore_evas.c:9867: warning: dereferencing type-punned pointer will break strict-aliasing rules
ecore/evas/ecore.evas.c_ecore_evas.c: In function '__pyx_pf_5ecore_4evas_12c_ecore_evas_9EcoreEvas_associate':
ecore/evas/ecore.evas.c_ecore_evas.c:13764: warning: dereferencing type-punned pointer will break strict-aliasing rules
ecore/evas/ecore.evas.c_ecore_evas.c: In function '__pyx_pf_5ecore_4evas_12c_ecore_evas_9EcoreEvas_dissociate':
ecore/evas/ecore.evas.c_ecore_evas.c:13808: warning: dereferencing type-punned pointer will break strict-aliasing rules
ecore/evas/ecore.evas.c_ecore_evas.c: In function '__pyx_pf_5ecore_4evas_12c_ecore_evas_11SoftwareX11_direct_resize_get':
ecore/evas/ecore.evas.c_ecore_evas.c:14362: warning: dereferencing type-punned pointer will break strict-aliasing rules
ecore/evas/ecore.evas.c_ecore_evas.c: In function '__pyx_pf_5ecore_4evas_12c_ecore_evas_5GLX11_direct_resize_get':
ecore/evas/ecore.evas.c_ecore_evas.c:14835: warning: dereferencing type-punned pointer will break strict-aliasing rules
ecore/evas/ecore.evas.c_ecore_evas.c: In function '__pyx_pf_5ecore_4evas_12c_ecore_evas_10XRenderX11_direct_resize_get':
ecore/evas/ecore.evas.c_ecore_evas.c:15308: warning: dereferencing type-punned pointer will break strict-aliasing rules
ecore/evas/ecore.evas.c_ecore_evas.c: In function '__pyx_pf_5ecore_4evas_12c_ecore_evas_14SoftwareX11_16_direct_resize_get':
ecore/evas/ecore.evas.c_ecore_evas.c:16511: warning: dereferencing type-punned pointer will break strict-aliasing rules
ecore/evas/ecore.evas.c_ecore_evas.c: In function '__pyx_tp_new_5ecore_4evas_12c_ecore_evas_EcoreEvas':
ecore/evas/ecore.evas.c_ecore_evas.c:16660: warning: dereferencing type-punned pointer will break strict-aliasing rules
ecore/evas/ecore.evas.c_ecore_evas.c: In function '__pyx_tp_clear_5ecore_4evas_12c_ecore_evas_EcoreEvas':
ecore/evas/ecore.evas.c_ecore_evas.c:16770: warning: dereferencing type-punned pointer will break strict-aliasing rules
ecore/evas/ecore.evas.c_ecore_evas.c: In function 'initc_ecore_evas':
ecore/evas/ecore.evas.c_ecore_evas.c:19150: warning: dereferencing type-punned pointer will break strict-aliasing rules
ecore/evas/ecore.evas.c_ecore_evas.c:19153: warning: dereferencing type-punned pointer will break strict-aliasing rules
ecore/evas/ecore.evas.c_ecore_evas.c:19160: warning: dereferencing type-punned pointer will break strict-aliasing rules
ecore/evas/ecore.evas.c_ecore_evas.c:19167: warning: dereferencing type-punned pointer will break strict-aliasing rules
ecore/evas/ecore.evas.c_ecore_evas.c:19174: warning: dereferencing type-punned pointer will break strict-aliasing rules
ecore/evas/ecore.evas.c_ecore_evas.c:19181: warning: dereferencing type-punned pointer will break strict-aliasing rules
ecore/evas/ecore.evas.c_ecore_evas.c:19188: warning: dereferencing type-punned pointer will break strict-aliasing rules
ecore/evas/ecore.evas.c_ecore_evas.c:19195: warning: dereferencing type-punned pointer will break strict-aliasing rules
ecore/evas/ecore.evas.c_ecore_evas.c:19199: warning: dereferencing type-punned pointer will break strict-aliasing rules
ecore/evas/ecore.evas.c_ecore_evas.c:19203: warning: dereferencing type-punned pointer will break strict-aliasing rules
ecore/evas/ecore.evas.c_ecore_evas.c:19373: error: 'ECORE_EVAS_ENGINE_SDL' undeclared (first use in this function)
ecore/evas/ecore.evas.c_ecore_evas.c:19373: error: (Each undeclared identifier is reported only once
ecore/evas/ecore.evas.c_ecore_evas.c:19373: error: for each function it appears in.)
ecore/evas/ecore.evas.c_ecore_evas.c: In function '__Pyx_PyObject_IsTrue':
ecore/evas/ecore.evas.c_ecore_evas.c:20180: warning: dereferencing type-punned pointer will break strict-aliasing rules
ecore/evas/ecore.evas.c_ecore_evas.c:20181: warning: dereferencing type-punned pointer will break strict-aliasing rules
error: command 'ccache' failed with exit status 1
FATAL: python setup.py build_ext execution failed.

--------------080702020209030009090607--
