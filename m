Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SDGCv-0001x9-0L for openembedded-devel@lists.openembedded.org;
	Thu, 29 Mar 2012 16:20:09 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SDG4A-0002jp-CQ for openembedded-devel@lists.openembedded.org;
	Thu, 29 Mar 2012 16:11:06 +0200
Received: from adsl-63-193-31-6.dsl.snfc21.pacbell.net ([63.193.31.6])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Mar 2012 16:11:06 +0200
Received: from koen by adsl-63-193-31-6.dsl.snfc21.pacbell.net with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Mar 2012 16:11:06 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 29 Mar 2012 07:11:04 -0700
Message-ID: <jl1qhd$fna$1@dough.gmane.org>
References: <1332898927-17745-1-git-send-email-raj.khem@gmail.com>
	<20120328022305.GD17470@denix.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: adsl-63-193-31-6.dsl.snfc21.pacbell.net
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:11.0) Gecko/20120313 Thunderbird/11.0
In-Reply-To: <20120328022305.GD17470@denix.org>
X-Enigmail-Version: 1.4
Subject: Re: [toolchain-layer][PATCH 1/2] eglibc-2.12: Move to toolchain-layer
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
X-List-Received-Date: Thu, 29 Mar 2012 14:20:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 27-03-12 19:23, Denys Dmytriyenko schreef:
> On Tue, Mar 27, 2012 at 06:42:06PM -0700, Khem Raj wrote:
>> Its relevant in toolchain layer
>> 
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> 
> Hmm, seems like we cross-posted the same change :)

Sadly both of them didn't make it into patchwork :(

> 
> Acked-by: Denys Dmytriyenko <denys@ti.com>
> 
> 
>> --- .../eglibc/cross-localedef-native_2.12.bb          |    0 
>> .../eglibc/eglibc-2.12/IO-acquire-lock-fix.patch   |    0 
>> .../eglibc-2.12/armv4-eabi-compile-fix.patch       |    0 
>> .../eglibc-svn-arm-lowlevellock-include-tls.patch  |    0 
>> .../recipes-core/eglibc/eglibc-2.12/etc/ld.so.conf |    0 
>> .../eglibc/eglibc-2.12/generate-supported.mk       |    0 
>> .../eglibc/eglibc-2.12/ld-search-order.patch       |    0 
>> .../eglibc/eglibc-2.12/mips-rld-map-check.patch    |    0 
>> .../eglibc/eglibc-2.12/ppc-enable-603e-cpu.patch   |    0 
>> .../eglibc-2.12/shorten-build-commands.patch       |    0 
>> .../recipes-core/eglibc/eglibc-initial_2.12.bb     |    0 
>> .../recipes-core/eglibc/eglibc-locale_2.12.bb      |    0 
>> .../recipes-core/eglibc/eglibc_2.12.bb             |    0 13 files
>> changed, 0 insertions(+), 0 deletions(-) rename {meta-oe =>
>> toolchain-layer}/recipes-core/eglibc/cross-localedef-native_2.12.bb
>> (100%) rename {meta-oe =>
>> toolchain-layer}/recipes-core/eglibc/eglibc-2.12/IO-acquire-lock-fix.patch
>> (100%) rename {meta-oe =>
>> toolchain-layer}/recipes-core/eglibc/eglibc-2.12/armv4-eabi-compile-fix.patch
>> (100%) rename {meta-oe =>
>> toolchain-layer}/recipes-core/eglibc/eglibc-2.12/eglibc-svn-arm-lowlevellock-include-tls.patch
>> (100%) rename {meta-oe =>
>> toolchain-layer}/recipes-core/eglibc/eglibc-2.12/etc/ld.so.conf (100%) 
>> rename {meta-oe =>
>> toolchain-layer}/recipes-core/eglibc/eglibc-2.12/generate-supported.mk
>> (100%) rename {meta-oe =>
>> toolchain-layer}/recipes-core/eglibc/eglibc-2.12/ld-search-order.patch
>> (100%) rename {meta-oe =>
>> toolchain-layer}/recipes-core/eglibc/eglibc-2.12/mips-rld-map-check.patch
>> (100%) rename {meta-oe =>
>> toolchain-layer}/recipes-core/eglibc/eglibc-2.12/ppc-enable-603e-cpu.patch
>> (100%) rename {meta-oe =>
>> toolchain-layer}/recipes-core/eglibc/eglibc-2.12/shorten-build-commands.patch
>> (100%) rename {meta-oe =>
>> toolchain-layer}/recipes-core/eglibc/eglibc-initial_2.12.bb (100%) 
>> rename {meta-oe =>
>> toolchain-layer}/recipes-core/eglibc/eglibc-locale_2.12.bb (100%) 
>> rename {meta-oe => toolchain-layer}/recipes-core/eglibc/eglibc_2.12.bb
>> (100%)
>> 
>> diff --git a/meta-oe/recipes-core/eglibc/cross-localedef-native_2.12.bb
>> b/toolchain-layer/recipes-core/eglibc/cross-localedef-native_2.12.bb 
>> similarity index 100% rename from
>> meta-oe/recipes-core/eglibc/cross-localedef-native_2.12.bb rename to
>> toolchain-layer/recipes-core/eglibc/cross-localedef-native_2.12.bb diff
>> --git
>> a/meta-oe/recipes-core/eglibc/eglibc-2.12/IO-acquire-lock-fix.patch
>> b/toolchain-layer/recipes-core/eglibc/eglibc-2.12/IO-acquire-lock-fix.patch
>>
>> 
similarity index 100%
>> rename from
>> meta-oe/recipes-core/eglibc/eglibc-2.12/IO-acquire-lock-fix.patch 
>> rename to
>> toolchain-layer/recipes-core/eglibc/eglibc-2.12/IO-acquire-lock-fix.patch
>>
>> 
diff --git
a/meta-oe/recipes-core/eglibc/eglibc-2.12/armv4-eabi-compile-fix.patch
b/toolchain-layer/recipes-core/eglibc/eglibc-2.12/armv4-eabi-compile-fix.patch
>> similarity index 100% rename from
>> meta-oe/recipes-core/eglibc/eglibc-2.12/armv4-eabi-compile-fix.patch 
>> rename to
>> toolchain-layer/recipes-core/eglibc/eglibc-2.12/armv4-eabi-compile-fix.patch
>>
>> 
diff --git
a/meta-oe/recipes-core/eglibc/eglibc-2.12/eglibc-svn-arm-lowlevellock-include-tls.patch
b/toolchain-layer/recipes-core/eglibc/eglibc-2.12/eglibc-svn-arm-lowlevellock-include-tls.patch
>> similarity index 100% rename from
>> meta-oe/recipes-core/eglibc/eglibc-2.12/eglibc-svn-arm-lowlevellock-include-tls.patch
>>
>> 
rename to
toolchain-layer/recipes-core/eglibc/eglibc-2.12/eglibc-svn-arm-lowlevellock-include-tls.patch
>> diff --git a/meta-oe/recipes-core/eglibc/eglibc-2.12/etc/ld.so.conf
>> b/toolchain-layer/recipes-core/eglibc/eglibc-2.12/etc/ld.so.conf 
>> similarity index 100% rename from
>> meta-oe/recipes-core/eglibc/eglibc-2.12/etc/ld.so.conf rename to
>> toolchain-layer/recipes-core/eglibc/eglibc-2.12/etc/ld.so.conf diff
>> --git a/meta-oe/recipes-core/eglibc/eglibc-2.12/generate-supported.mk
>> b/toolchain-layer/recipes-core/eglibc/eglibc-2.12/generate-supported.mk
>>
>> 
similarity index 100%
>> rename from
>> meta-oe/recipes-core/eglibc/eglibc-2.12/generate-supported.mk rename to
>> toolchain-layer/recipes-core/eglibc/eglibc-2.12/generate-supported.mk 
>> diff --git
>> a/meta-oe/recipes-core/eglibc/eglibc-2.12/ld-search-order.patch
>> b/toolchain-layer/recipes-core/eglibc/eglibc-2.12/ld-search-order.patch
>>
>> 
similarity index 100%
>> rename from
>> meta-oe/recipes-core/eglibc/eglibc-2.12/ld-search-order.patch rename to
>> toolchain-layer/recipes-core/eglibc/eglibc-2.12/ld-search-order.patch 
>> diff --git
>> a/meta-oe/recipes-core/eglibc/eglibc-2.12/mips-rld-map-check.patch
>> b/toolchain-layer/recipes-core/eglibc/eglibc-2.12/mips-rld-map-check.patch
>>
>> 
similarity index 100%
>> rename from
>> meta-oe/recipes-core/eglibc/eglibc-2.12/mips-rld-map-check.patch rename
>> to
>> toolchain-layer/recipes-core/eglibc/eglibc-2.12/mips-rld-map-check.patch
>>
>> 
diff --git a/meta-oe/recipes-core/eglibc/eglibc-2.12/ppc-enable-603e-cpu.patch
b/toolchain-layer/recipes-core/eglibc/eglibc-2.12/ppc-enable-603e-cpu.patch
>> similarity index 100% rename from
>> meta-oe/recipes-core/eglibc/eglibc-2.12/ppc-enable-603e-cpu.patch 
>> rename to
>> toolchain-layer/recipes-core/eglibc/eglibc-2.12/ppc-enable-603e-cpu.patch
>>
>> 
diff --git
a/meta-oe/recipes-core/eglibc/eglibc-2.12/shorten-build-commands.patch
b/toolchain-layer/recipes-core/eglibc/eglibc-2.12/shorten-build-commands.patch
>> similarity index 100% rename from
>> meta-oe/recipes-core/eglibc/eglibc-2.12/shorten-build-commands.patch 
>> rename to
>> toolchain-layer/recipes-core/eglibc/eglibc-2.12/shorten-build-commands.patch
>>
>> 
diff --git a/meta-oe/recipes-core/eglibc/eglibc-initial_2.12.bb
b/toolchain-layer/recipes-core/eglibc/eglibc-initial_2.12.bb
>> similarity index 100% rename from
>> meta-oe/recipes-core/eglibc/eglibc-initial_2.12.bb rename to
>> toolchain-layer/recipes-core/eglibc/eglibc-initial_2.12.bb diff --git
>> a/meta-oe/recipes-core/eglibc/eglibc-locale_2.12.bb
>> b/toolchain-layer/recipes-core/eglibc/eglibc-locale_2.12.bb similarity
>> index 100% rename from
>> meta-oe/recipes-core/eglibc/eglibc-locale_2.12.bb rename to
>> toolchain-layer/recipes-core/eglibc/eglibc-locale_2.12.bb diff --git
>> a/meta-oe/recipes-core/eglibc/eglibc_2.12.bb
>> b/toolchain-layer/recipes-core/eglibc/eglibc_2.12.bb similarity index
>> 100% rename from meta-oe/recipes-core/eglibc/eglibc_2.12.bb rename to
>> toolchain-layer/recipes-core/eglibc/eglibc_2.12.bb -- 1.7.9.1
>> 
>> 
>> _______________________________________________ Openembedded-devel
>> mailing list Openembedded-devel@lists.openembedded.org 
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iQIcBAEBAgAGBQJPdG12AAoJEHZqAkdh1vT6+Q4P/112Kk0pysGE2hJyhbDwos00
gxkgVbwPJmXbXAIy+aBoAZts+/oBSog8gbgbmZHrlD23PC/dTMHNj40AxJYTfUzj
Tkut3nOOPN2RqfdH6AqxpusFKIZ1f03k0ZDf++FhYhvMNfWqIxRvpVrrpuMnEp8G
t705yQJ+flueqJoJyRG+kB0YbxcdPSBkjyXZ8HcBjM/gmZGVtV2Ot1/SYyEB80jf
W+qm6tNG7klcVfzxpqwSKj6dZiBWrXHLGGReEjxUr42RoZWmVK2KMjK4ZagWQaxm
K0Z9SzRDFq6jXAJArZt8xvs4hoiDmnJVcstpJiSpkvpRDPkbsvcbtT+WFJ8wohqM
s9/w3WneskNpHNG1zkUZ7nJly0pFWccTdfnChItEQYKNlZMHV91Bm/lasYaaFjnX
Azkc45PNrNurJpDeJiz5oOr5Hc5PJ7jTSCjEyFMWkeaT6OcwhDfs9WfH0jI6aeMn
n6iqdzE8ZmK4odyo/QDaYx9lKrQQXM07lY6CPyMKbWVJpht8JJpzMOPKrioX91nD
fxpUZepw+gy4FfHPW9OkTcEzs6X9KNP1/25GZwzjs2SV7C1ReuO3m7vcfEEiIUEB
zzV75w+E04D8RVx6dZjBIx8N7FVAKQg+OqZYlo09yhSDXyRYQsuxzesojxWus/Ky
hlYAxv+9hr83+Q8SU7dQ
=btJ3
-----END PGP SIGNATURE-----



