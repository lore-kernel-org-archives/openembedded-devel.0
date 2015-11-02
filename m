Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id C1CD760124
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Nov 2015 17:54:14 +0000 (UTC)
Received: by igdg1 with SMTP id g1so62500103igd.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Nov 2015 09:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=jYdHmyOdk0ug/k7ViY6RKaAt+cJCeKfHv2iU2br1Rj4=;
	b=jFuMsWOmH1LGirHagENhKa7nmC6C8x3WgQWkflMWeZk9aIMsJW3TE6mMkjXk2ocX2m
	qBcspeoFHRzC/aKXCoUPaysLMGE9Zb3ESDxY/vCUbjXH74XmIT+BQgZTlhu9M4PSgjlj
	gtftzbcsAmahEXF52lcQh3Qdy+XLMxPI5CwZLH93Mhvf4bMJSHNX5kLF6rRI4SNKwLQa
	pweca2Y7+l8Z7Se9h1SQJLOOjFePgDSJaDO4qauQde0TLt/UQYetA5cOR1EXkSbvL3yk
	zbWH6U1MNxSrM2PJDrnasF4h6w9NOdsYv7xY2cMS9MRukf6ahGmPWT8tsMNpVrvVn78v
	puFg==
X-Received: by 10.50.55.42 with SMTP id o10mr13132016igp.11.1446486854292;
	Mon, 02 Nov 2015 09:54:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.38.133 with HTTP; Mon, 2 Nov 2015 09:53:44 -0800 (PST)
In-Reply-To: <20151102143330.GA28051@jama>
References: <1445585893-28183-1-git-send-email-raj.khem@gmail.com>
	<20151102143330.GA28051@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 2 Nov 2015 09:53:44 -0800
Message-ID: <CAMKF1sr_ABparFOQwsaaA6U-RKgGwA80CsopF6Knji+-=Qq1eA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] sysdig: Fix build with lua >= 5.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 02 Nov 2015 17:54:17 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Nov 2, 2015 at 6:33 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Fri, Oct 23, 2015 at 12:38:13AM -0700, Khem Raj wrote:
>> It was still using deprecated lua contructs
>> also fix for musl while at it
>
> Still fails in world builds:
> http://errors.yoctoproject.org/Errors/Details/21266/
> or
> http://errors.yoctoproject.org/Errors/Details/20809/
>
> Should it depend on luajit or lua5.1 you've recently sent?

now it could. I have earlier tried to forward port it to Lua 5.3
however, bigger problem is, it doesnt fail for me here.

>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  ...ith-musl-backtrace-APIs-are-glibc-specifi.patch |  50 ++++++++++
>>  .../0001-libsinsp-Port-to-build-with-lua-5.2.patch | 108 +++++++++++++++++++++
>>  meta-oe/recipes-extended/sysdig/sysdig_git.bb      |   7 +-
>>  3 files changed, 163 insertions(+), 2 deletions(-)
>>  create mode 100644 meta-oe/recipes-extended/sysdig/sysdig/0001-Fix-build-with-musl-backtrace-APIs-are-glibc-specifi.patch
>>  create mode 100644 meta-oe/recipes-extended/sysdig/sysdig/0001-libsinsp-Port-to-build-with-lua-5.2.patch
>>
>> diff --git a/meta-oe/recipes-extended/sysdig/sysdig/0001-Fix-build-with-musl-backtrace-APIs-are-glibc-specifi.patch b/meta-oe/recipes-extended/sysdig/sysdig/0001-Fix-build-with-musl-backtrace-APIs-are-glibc-specifi.patch
>> new file mode 100644
>> index 0000000..7d3f8a1
>> --- /dev/null
>> +++ b/meta-oe/recipes-extended/sysdig/sysdig/0001-Fix-build-with-musl-backtrace-APIs-are-glibc-specifi.patch
>> @@ -0,0 +1,50 @@
>> +From 290703a5d21f34ea5ec23efc815a9f4df241e7e8 Mon Sep 17 00:00:00 2001
>> +From: Khem Raj <raj.khem@gmail.com>
>> +Date: Fri, 23 Oct 2015 00:33:32 -0700
>> +Subject: [PATCH] Fix build with musl, backtrace() APIs are glibc specific
>> +
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +---
>> + userspace/libsinsp/utils.cpp | 4 +++-
>> + userspace/libsinsp/utils.h   | 2 +-
>> + 2 files changed, 4 insertions(+), 2 deletions(-)
>> +
>> +diff --git a/userspace/libsinsp/utils.cpp b/userspace/libsinsp/utils.cpp
>> +index 8f23f9c..c496a57 100644
>> +--- a/userspace/libsinsp/utils.cpp
>> ++++ b/userspace/libsinsp/utils.cpp
>> +@@ -21,7 +21,9 @@ along with sysdig.  If not, see <http://www.gnu.org/licenses/>.
>> + #include <limits.h>
>> + #include <stdlib.h>
>> + #include <sys/time.h>
>> ++#ifdef __GLIBC__
>> + #include <execinfo.h>
>> ++#endif
>> + #include <unistd.h>
>> + #include <sys/time.h>
>> + #include <netdb.h>
>> +@@ -741,7 +743,7 @@ uint64_t sinsp_utils::get_current_time_ns()
>> +     return tv.tv_sec * (uint64_t) 1000000000 + tv.tv_usec * 1000;
>> + }
>> +
>> +-#ifndef _WIN32
>> ++#if defined(_WIN32) && defined(__GLIBC__)
>> + void sinsp_utils::bt(void)
>> + {
>> +     static const char start[] = "BACKTRACE ------------";
>> +diff --git a/userspace/libsinsp/utils.h b/userspace/libsinsp/utils.h
>> +index 600d00b..4ab4650 100644
>> +--- a/userspace/libsinsp/utils.h
>> ++++ b/userspace/libsinsp/utils.h
>> +@@ -79,7 +79,7 @@ public:
>> +
>> +     static uint64_t get_current_time_ns();
>> +
>> +-#ifndef _WIN32
>> ++#if not defined(_WIN32) && defined(__GLIBC__)
>> +     //
>> +     // Print the call stack
>> +     //
>> +--
>> +2.6.2
>> +
>> diff --git a/meta-oe/recipes-extended/sysdig/sysdig/0001-libsinsp-Port-to-build-with-lua-5.2.patch b/meta-oe/recipes-extended/sysdig/sysdig/0001-libsinsp-Port-to-build-with-lua-5.2.patch
>> new file mode 100644
>> index 0000000..8fec0ca
>> --- /dev/null
>> +++ b/meta-oe/recipes-extended/sysdig/sysdig/0001-libsinsp-Port-to-build-with-lua-5.2.patch
>> @@ -0,0 +1,108 @@
>> +From c2782a6ca968190e221c25b0890600ba8cd43798 Mon Sep 17 00:00:00 2001
>> +From: Khem Raj <raj.khem@gmail.com>
>> +Date: Fri, 23 Oct 2015 00:23:15 -0700
>> +Subject: [PATCH] libsinsp: Port to build with lua >= 5.2
>> +
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +---
>> + userspace/libsinsp/chisel.cpp | 40 +++++++++++++++++++++++++++++-----------
>> + 1 file changed, 29 insertions(+), 11 deletions(-)
>> +
>> +diff --git a/userspace/libsinsp/chisel.cpp b/userspace/libsinsp/chisel.cpp
>> +index 3cfbd8d..2db9348 100644
>> +--- a/userspace/libsinsp/chisel.cpp
>> ++++ b/userspace/libsinsp/chisel.cpp
>> +@@ -94,7 +94,7 @@ void lua_stackdump(lua_State *L)
>> + // Lua callbacks
>> + ///////////////////////////////////////////////////////////////////////////////
>> + #ifdef HAS_LUA_CHISELS
>> +-const static struct luaL_reg ll_sysdig [] =
>> ++const static struct luaL_Reg ll_sysdig [] =
>> + {
>> +     {"set_filter", &lua_cbacks::set_global_filter},
>> +     {"set_snaplen", &lua_cbacks::set_snaplen},
>> +@@ -120,7 +120,7 @@ const static struct luaL_reg ll_sysdig [] =
>> +     {NULL,NULL}
>> + };
>> +
>> +-const static struct luaL_reg ll_chisel [] =
>> ++const static struct luaL_Reg ll_chisel [] =
>> + {
>> +     {"request_field", &lua_cbacks::request_field},
>> +     {"set_filter", &lua_cbacks::set_filter},
>> +@@ -131,7 +131,7 @@ const static struct luaL_reg ll_chisel [] =
>> +     {NULL,NULL}
>> + };
>> +
>> +-const static struct luaL_reg ll_evt [] =
>> ++const static struct luaL_Reg ll_evt [] =
>> + {
>> +     {"field", &lua_cbacks::field},
>> +     {"get_num", &lua_cbacks::get_num},
>> +@@ -853,10 +853,28 @@ bool sinsp_chisel::parse_view_info(lua_State *ls, OUT chisel_desc* cd)
>> +
>> +
>> + #ifdef HAS_LUA_CHISELS
>> ++static void chisel_lua_registerlib(lua_State *L, const char *libname,
>> ++                            const luaL_Reg *l, int ind)
>> ++{
>> ++#if LUA_VERSION_NUM >= 502
>> ++    if (libname)
>> ++    {
>> ++            lua_newtable(L);
>> ++            luaL_setfuncs(L, l, ind);
>> ++            lua_pushvalue(L, -1);
>> ++            lua_setglobal(L, libname);
>> ++    }
>> ++    else
>> ++            luaL_setfuncs(L, l, ind);
>> ++#else
>> ++    luaL_register(L, libname, l);
>> ++#endif
>> ++}
>> ++
>> + // Initializes a lua chisel
>> + bool sinsp_chisel::init_lua_chisel(chisel_desc &cd, string const &fpath)
>> + {
>> +-    lua_State* ls = lua_open();
>> ++    lua_State* ls = luaL_newstate();
>> +     if(ls == NULL)
>> +     {
>> +             return false;
>> +@@ -867,9 +885,9 @@ bool sinsp_chisel::init_lua_chisel(chisel_desc &cd, string const &fpath)
>> +     //
>> +     // Load our own lua libs
>> +     //
>> +-    luaL_openlib(ls, "sysdig", ll_sysdig, 0);
>> +-    luaL_openlib(ls, "chisel", ll_chisel, 0);
>> +-    luaL_openlib(ls, "evt", ll_evt, 0);
>> ++    chisel_lua_registerlib(ls, "sysdig", ll_sysdig, 0);
>> ++    chisel_lua_registerlib(ls, "chisel", ll_chisel, 0);
>> ++    chisel_lua_registerlib(ls, "evt", ll_evt, 0);
>> +
>> +     //
>> +     // Add our chisel paths to package.path
>> +@@ -1111,16 +1129,16 @@ void sinsp_chisel::load(string cmdstr)
>> +     //
>> +     // Open the script
>> +     //
>> +-    m_ls = lua_open();
>> ++    m_ls = luaL_newstate();
>> +
>> +     luaL_openlibs(m_ls);
>> +
>> +     //
>> +     // Load our own lua libs
>> +     //
>> +-    luaL_openlib(m_ls, "sysdig", ll_sysdig, 0);
>> +-    luaL_openlib(m_ls, "chisel", ll_chisel, 0);
>> +-    luaL_openlib(m_ls, "evt", ll_evt, 0);
>> ++    chisel_lua_registerlib(m_ls, "sysdig", ll_sysdig, 0);
>> ++    chisel_lua_registerlib(m_ls, "chisel", ll_chisel, 0);
>> ++    chisel_lua_registerlib(m_ls, "evt", ll_evt, 0);
>> +
>> +     //
>> +     // Add our chisel paths to package.path
>> +--
>> +2.6.2
>> +
>> diff --git a/meta-oe/recipes-extended/sysdig/sysdig_git.bb b/meta-oe/recipes-extended/sysdig/sysdig_git.bb
>> index 62aa433..717fab9 100644
>> --- a/meta-oe/recipes-extended/sysdig/sysdig_git.bb
>> +++ b/meta-oe/recipes-extended/sysdig/sysdig_git.bb
>> @@ -11,8 +11,11 @@ inherit cmake pkgconfig
>>  DEPENDS = "luajit zlib ncurses"
>>  RDEPENDS_${PN} = "bash"
>>
>> -SRC_URI = "git://github.com/draios/sysdig.git;branch=master"
>> -SRCREV = "b7394e29ced4f1a991af03c0381a5828abcbab7a"
>> +SRC_URI = "git://github.com/draios/sysdig.git;branch=master \
>> +           file://0001-libsinsp-Port-to-build-with-lua-5.2.patch \
>> +           file://0001-Fix-build-with-musl-backtrace-APIs-are-glibc-specifi.patch \
>> +          "
>> +SRCREV = "85d16f33a82a17f87ccdbc088749271c71d87013"
>>  PV = "0.1.102+git${SRCPV}"
>>
>>  S = "${WORKDIR}/git"
>> --
>> 2.6.2
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

