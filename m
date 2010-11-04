Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PDuq9-0008LZ-QZ
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Nov 2010 09:06:40 +0100
Received: by ywo7 with SMTP id 7so628661ywo.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Nov 2010 01:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=XSlSqKqad2FTInky4xl43Q7NqgzF6eBzOsM/Tsht71k=;
	b=Q4TU8YFxl9SJkbeShdDp5OdMDmFCFYKnm8A6DQirmkwqQ0z37IXZOSSFWJuonYaqDI
	5QlZLkfaonjB9/iLXKnEWNQ6AXLEE670JUcYWazi3CZXPX/kS35QvvpOldgvw+Hv7hgT
	mmMUx8iUrUEikLgjBmKXwwSBfEbQ7QTq7RDJM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=KEFprvt5fRfEsiE7HHEY7PzFL+JHTaPv4WUhtcisCqeBKUmewmMOAkOWnckDEVvB0E
	vjfrwRWTYeTsasyhFHD7TgTT888ONBeVhok1WRbvd6Cp2LkuEYmRTJbnlPMONUhrwF+3
	vcNId+7hXm4ZsLy7I6PcvyR63qqp/QilqPVRw=
MIME-Version: 1.0
Received: by 10.231.35.194 with SMTP id q2mr205274ibd.26.1288857941511; Thu,
	04 Nov 2010 01:05:41 -0700 (PDT)
Received: by 10.231.40.13 with HTTP; Thu, 4 Nov 2010 01:05:41 -0700 (PDT)
In-Reply-To: <20101026112551.GD3514@jama>
References: <AANLkTim-_z6a6jX3X9Zh_s-ihE-19SFFmus3U7MXVPfY@mail.gmail.com>
	<20101026093926.GC3514@jama> <20101026112551.GD3514@jama>
Date: Thu, 4 Nov 2010 09:05:41 +0100
Message-ID: <AANLkTinrRCXZfpE-GTOZtNGmNMned0y+nJsckL8XiP4U@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: DEPENDS broken for native(sdk).bbclass Was: libgee introspection problem
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
X-List-Received-Date: Thu, 04 Nov 2010 08:06:42 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/10/26 Martin Jansa <martin.jansa@gmail.com>:
> On Tue, Oct 26, 2010 at 11:39:26AM +0200, Martin Jansa wrote:
>> On Tue, Oct 26, 2010 at 11:16:46AM +0200, Frans Meulenbroeks wrote:
>> > Hi,
>> >
>> > With the testing branch I get a problem with libgee native in
>> > combination with introspection.
>> > I'm building distro minimal, target neek (but I doubt that the latter matters)
>> >
>> > Anyone an idea?
>>
>> that should be fixed with
>> http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=df932a2769c2f6f7195363e8eb83994846805398
>>
>> but that didn't make it to DEPENDS_virtclass-native (as well as
>> glib-2.0), I'm checking why (reading native.bbclass looks like it
>> should be there automatically).
>>
>> if I don't find bug in native.bbclass I'll append it to
>> DEPENDS_virtclass-native too
>
> native.bbclass and nativesdk.bbclass use
> ORIG_DEPENDS := "${DEPENDS}"
> DEPENDS_virtclass-native ?= "${ORIG_DEPENDS}"
>
> and then for every dependency in DEPENDS_virtclass-native it does:
>
> 1) if it ends with -cross appends dependency ending -native instead
> 2) if it ends with -native it just appends
> 3) else appends dependency ending with native instead
>
> That's all nice and right and works in theory, BUT:
>
> base.bbclass:
> DEPENDS_prepend="${@base_deps(d)} "
> DEPENDS_virtclass-native_prepend="${@base_deps(d)} "
> DEPENDS_virtclass-nativesdk_prepend="${@base_deps(d)} "
>
> autotools.bbclass:
> DEPENDS_prepend = "${@autotools_deps(d)}"
> DEPENDS_virtclass-native_prepend = "${@autotools_deps(d)}"
> DEPENDS_virtclass-nativesdk_prepend = "${@autotools_deps(d)}"
>
> vala.bbclass:
> DEPENDS += "vala-native"
> DEPENDS_virtclass-native += "vala-native"
>
> so DEPENDS_virtclass-native is not empty when native.bbclass calls:
> DEPENDS_virtclass-native ?= "${ORIG_DEPENDS}"
> and ORIG_DEPENDS are just ignored
>
> we cannot fix it with
> DEPENDS_virtclass-native += "${ORIG_DEPENDS}"
>
> because sometimes we want to override DEPENDS_virtclass-native from
> recipe (ie when target recipe depends on its own ${PN}-native).
>
> Maybe it's because the order of bbclass processing was changed? It would
> work OK if we process native and nativesdk first.
>
> I've added small debug output to see order now
> DEBUG: Removing /OE/dev/recipes/libgee/libgee_0.6.0.bb from cache
> DEBUG: Parsing /OE/dev/recipes/libgee/libgee_0.6.0.bb
> DEBUG: inherited base
> DEBUG: inherited autotools
> DEBUG: inherited vala
> DEBUG: inherited base
> DEBUG: inherited autotools
> DEBUG: inherited vala
> DEBUG: inherited native
>
> No idea why I see it twice..
>
> Current broken state:
> DEBUG: OrigDepends: autoconf-native automake-native libtool-native gnu-config-native coreutils-native linux-libc-headers-native glib-2.0 vala-native gobject-introspection-native
> DEBUG: Depends: autoconf-native automake-native libtool-native gnu-config-native coreutils-native linux-libc-headers-native vala-native
> glib-2.0 is from libgee.inc, gobject-introspection-native from libgee_0.6.0.bb, but both lost
>
> If I remove those append/preppend from bbclasses:
> DEBUG: OrigDepends: autoconf-native automake-native libtool-native gnu-config-native coreutils-native linux-libc-headers-native glib-2.0 vala-native gobject-introspection-native
> DEBUG: Depends: autoconf-native automake-native libtool-native gnu-config-native coreutils-native linux-libc-headers-native glib-2.0 vala-native gobject-introspection-native
>
>
> I'll send patch for removing those DEPENDS_virtclass-native(sdk) from bbclasses.
> But that will break those recipes where DEPENDS_virtclass-native is used to override
> common DEPENDS but without still needed dependencies from classes, so enforced
> bbclass order would be probably better fix.
>

After your ping:
I'm definitely no expert in this area. Your proposal looks ok but I'm
a little bit worried about the breaking of DEPENDS_virtclass-native.
This seems to involve some 44 recipes (list at end).
Guess we should repair those first.
Did we already have that _target suffix?

Enjoy, Frans.

frans@frans-desktop:~/workspace/openembedded/recipes$ grep
DEPENDS_virtclass-native */* | grep -v "+"
autoconf/autoconf.inc:DEPENDS_virtclass-native = "m4-native gnu-config-native"
automake/automake.inc:DEPENDS_virtclass-native = "autoconf-native"
bcel/bcel_5.2.bb:DEPENDS_virtclass-native = "fastjar-native
xerces-j-native regexp-native"
classpathx/gnumail_1.1.2.bb:DEPENDS_virtclass-native = "fastjar-native
gnujaf-native inetlib-native"
dbus/dbus-glib.inc:DEPENDS_virtclass-native = "expat-native
glib-2.0-native dbus-native"
e2fsprogs/e2fsprogs.inc:DEPENDS_virtclass-native = "gettext-native
util-linux-ng-native"
efl1/ecore.inc:DEPENDS_virtclass-native = "eet-native evas-native"	
eggdbus/eggdbus_0.6.bb:DEPENDS_virtclass-native = "dbus-native
glib-2.0-native dbus-glib-native"
file/file.inc:DEPENDS_virtclass-native = ""
gettext/gettext_0.14.1.bb:DEPENDS_virtclass-native = ""
gettext/gettext_0.17.bb:DEPENDS_virtclass-native = "libxml2-native"
gettext/gettext_0.18.bb:DEPENDS_virtclass-native = "libxml2-native"
glib-1.2/glib-1.2_1.2.10.bb:DEPENDS_virtclass-native = ""
glib-2.0/glib-2.0_2.22.4.bb:DEPENDS_virtclass-native = "gettext-native
gtk-doc-native \
glib-2.0/glib-2.0_2.23.6.bb:DEPENDS_virtclass-native = "gettext-native
gtk-doc-native \
glib-2.0/glib-2.0_2.24.0.bb:DEPENDS_virtclass-native = "gettext-native
gtk-doc-native \
glib-2.0/glib-2.0_2.24.1.bb:DEPENDS_virtclass-native = "gettext-native
gtk-doc-native \
gnome/gnome-doc-utils.inc:DEPENDS_virtclass-native = "libxslt-native
libxml2-native gettext-native"
gobject-introspection/gobject-introspection_0.9.10.bb:DEPENDS_virtclass-native
= "glib-2.0-native libffi-native"
htmldoc/htmldoc_1.9.x-r1571.bb:DEPENDS_virtclass-native = ""
jakarta-libs/bsf_2.4.0.bb:DEPENDS_virtclass-native = "fastjar-native
jacl-native commons-logging-native rhino-native xalan-j-native
bcel-native"
jakarta-libs/log4j1.2_1.2.15.bb:DEPENDS_virtclass-native =
"fastjar-native gnumail-native gnujaf-native"
jakarta-libs/logkit_1.2.2.bb:DEPENDS_virtclass-native =
"fastjar-native oro-native servlet2.3-native gnumail-native
gnujaf-native log4j1.2-native avalon-framework-api-native"
jcraft/jsch_0.1.40.bb:DEPENDS_virtclass-native = "fastjar-native jzlib-native"
jikes/jikes_1.22.bb:RDEPENDS_virtclass-native = ""
kakasi/kakasi_2.3.4.bb:DEPENDS_virtclass-native = ""
libftdi/libftdi_0.18.bb:DEPENDS_virtclass-native = "virtual/libusb0-native"
libgpg-error/libgpg-error.inc:DEPENDS_virtclass-native = ""
libxml/libxml2.inc:DEPENDS_virtclass-native = "python-native"
ncurses/ncurses_5.4.bb:DEPENDS_virtclass-native = ""
ncurses/ncurses_5.7.bb:DEPENDS_virtclass-native = "unifdef-native"
opkg-utils/opkg-utils_svn.bb:RDEPENDS_virtclass-native = ""
pango/pango.inc:DEPENDS_virtclass-native = "glib-2.0-native cairo-native"
postfix/postfix.inc:DEPENDS_virtclass-native = "virtual/db-native
libpcre-native"
ruby/ruby.inc:DEPENDS_virtclass-native = ""
sqlite/sqlite3_3.6.23.1.bb:DEPENDS_virtclass-native = "readline-native
ncurses-native"
util-linux-ng/util-linux-ng.inc:DEPENDS_virtclass-native =
"zlib-native ncurses-native lzo-native gettext-native"
vala/vala.inc:DEPENDS_virtclass-native = "glib-2.0-native dbus-native"
xalan-j/xalan-j_2.7.1.bb:DEPENDS_virtclass-native = "\
xerces-j/xerces-j_2.9.1.bb:DEPENDS_virtclass-native = "fastjar-native
jaxp1.3-native xml-commons-resolver1.1-native"
xml-commons/xml-commons-resolver1.1_1.2.bb:DEPENDS_virtclass-native =
"fastjar-native jaxp1.3-native"
xorg-lib/libx11_1.3.99.902.bb:DEPENDS_virtclass-native =
"libxcb-native ${COMMON_DEPENDS}"
xorg-lib/libx11.inc:DEPENDS_virtclass-native = "${COMMON_DEPENDS}"
xorg-lib/libx11.inc:DEPENDS_virtclass-nativesdk = "${COMMON_DEPENDS}"


