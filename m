Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1PbZ1f-0008WS-T9
	for openembedded-devel@lists.openembedded.org;
	Sat, 08 Jan 2011 14:40:11 +0100
Received: by fxm17 with SMTP id 17so16934555fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 08 Jan 2011 05:39:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:in-reply-to:references
	:x-user-agent:mime-version:content-type:content-transfer-encoding
	:subject:from:date:to:message-id;
	bh=bGrA84yrQ4J6QziBXKXa0aiPDAlVrUHDRdUktYku2AU=;
	b=w6ITunAoF8Wq19XGI/bEA+pOdWS+LnjICMkg0ZnWH2lbo0yid+BmLVSG/vuz0ONazZ
	BkUvaH4qmMPVSuvjwbMUSdfWToRt0x5PhmVG6VcDNcLrjg5l3B6djojFHnwF40RH0dMF
	OJx4rSSVvACxlzBFgTlkJprZhNlTWSN0BY2hk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=in-reply-to:references:x-user-agent:mime-version:content-type
	:content-transfer-encoding:subject:from:date:to:message-id;
	b=qhrTWLm9MZy6QDAJrZ8QuuIfFjn//ZTQiJWKr0rbxGkB/cmnZO6Vgui4/RcllPsHpq
	kO7qh3WtlA3PWp/2OzXGqndWjeUxtLF3qLFYu+eOx6xv87xP+z0FQNNKe5A8HMjbi2jl
	GV44GNElAse2gQ5GP2ChHrGgJstwes/UA/BOw=
Received: by 10.223.72.14 with SMTP id k14mr1219275faj.45.1294493982734;
	Sat, 08 Jan 2011 05:39:42 -0800 (PST)
Received: from [10.106.42.193] ([213.162.68.20])
	by mx.google.com with ESMTPS id z1sm6429658fau.45.2011.01.08.05.39.00
	(version=SSLv3 cipher=RC4-MD5); Sat, 08 Jan 2011 05:39:41 -0800 (PST)
In-Reply-To: <1294392497-24747-1-git-send-email-raj.khem@gmail.com>
References: <1294392497-24747-1-git-send-email-raj.khem@gmail.com>
X-User-Agent: K-9 Mail for Android
MIME-Version: 1.0
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Sat, 08 Jan 2011 14:39:00 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <6f6982c7-8cac-4125-affd-e081e89a716d@email.android.com>
Subject: Re: [PATCH] eglibc: Make it configurable by tuning eglibc options
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
X-List-Received-Date: Sat, 08 Jan 2011 13:40:12 -0000
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

"Khem Raj" <raj.khem@gmail.com> wrote:

>* Look for disabled features in DISTRO_FEATURES and disable them while
>building eglibc
>* By default all features are built
>* One can disable a feature by specifying DISTRO_FEATURES += "noinet6
>nobsd ...." e.g.
>
>Signed-off-by: Khem Raj <raj.khem@gmail.com>
>---
>recipes/eglibc/eglibc-options.inc |   50
>+++++++++++++++++++++++++++++++++++++
> recipes/eglibc/eglibc.inc         |    7 ++++-
> 2 files changed, 56 insertions(+), 1 deletions(-)
> create mode 100644 recipes/eglibc/eglibc-options.inc
>
>diff --git a/recipes/eglibc/eglibc-options.inc
>b/recipes/eglibc/eglibc-options.inc
>new file mode 100644
>index 0000000..d552bbc
>--- /dev/null
>+++ b/recipes/eglibc/eglibc-options.inc
>@@ -0,0 +1,50 @@
>+def eglibc_cfg(feature, features, tokens, cnf ):
>+        if type(tokens) == type(""):
>+                tokens = [tokens]
>+        if type(features) == type([]) and feature in features:
>+                cnf.extend([token + ' = n' for token in tokens])
>+
>+# Map distro features to eglibc options settings
>+def features_to_eglibc_settings(d):
>+        cnf = ([])
>+        distro_features = bb.data.getVar('DISTRO_FEATURES', d,
>True).split()
>+        eglibc_cfg('noinet6',      distro_features,
>'OPTION_EGLIBC_ADVANCED_INET6', cnf)
>+        eglibc_cfg('nobacktrace',      distro_features,
>'OPTION_EGLIBC_BACKTRACE', cnf)
>+        eglibc_cfg('nobig-macros',      distro_features,
>'OPTION_EGLIBC_BIG_MACROS', cnf)
>+        eglibc_cfg('nobsd',      distro_features, 'OPTION_EGLIBC_BSD',
>cnf)
>+        eglibc_cfg('nocxx-tests',      distro_features,
>'OPTION_EGLIBC_CXX_TESTS', cnf)
>+        eglibc_cfg('nocatgets',      distro_features,
>'OPTION_EGLIBC_CATGETS', cnf)
>+        eglibc_cfg('nocharsets',      distro_features,
>'OPTION_EGLIBC_CHARSETS', cnf)
>+        eglibc_cfg('nocrypt',      distro_features,
>'OPTION_EGLIBC_CRYPT', cnf)
>+        eglibc_cfg('nocrypt-ufc',      distro_features,
>'OPTION_EGLIBC_CRYPT_UFC', cnf)
>+        eglibc_cfg('nodb-aliases',      distro_features,
>'OPTION_EGLIBC_DB_ALIASES', cnf)
>+        eglibc_cfg('noenvz',      distro_features,
>'OPTION_EGLIBC_ENVZ', cnf)
>+        eglibc_cfg('nofcvt',      distro_features,
>'OPTION_EGLIBC_FCVT', cnf)
>+        eglibc_cfg('nofmtmsg',      distro_features,
>'OPTION_EGLIBC_FMTMSG', cnf)
>+        eglibc_cfg('nofstab',      distro_features,
>'OPTION_EGLIBC_FSTAB', cnf)
>+        eglibc_cfg('noftraverse',      distro_features,
>'OPTION_EGLIBC_FTRAVERSE', cnf)
>+        eglibc_cfg('nogetlogin',      distro_features,
>'OPTION_EGLIBC_GETLOGIN', cnf)
>+        eglibc_cfg('noidn',      distro_features, 'OPTION_EGLIBC_IDN',
>cnf)
>+        eglibc_cfg('noinet',      distro_features,
>'OPTION_EGLIBC_INET', cnf)
>+        eglibc_cfg('noinet-anl',      distro_features,
>'OPTION_EGLIBC_INET_ANL', cnf)
>+        eglibc_cfg('nolibm',      distro_features,
>'OPTION_EGLIBC_LIBM', cnf)
>+        eglibc_cfg('nolibm-big',      distro_features,
>'OPTION_EGLIBC_LIBM_BIG', cnf)
>+        eglibc_cfg('nolocales',      distro_features,
>'OPTION_EGLIBC_LOCALES', cnf)
>+        eglibc_cfg('nolocale-code',      distro_features,
>'OPTION_EGLIBC_LOCALE_CODE', cnf)
>+        eglibc_cfg('nomemusage',      distro_features,
>'OPTION_EGLIBC_MEMUSAGE', cnf)
>+        eglibc_cfg('nonis',      distro_features, 'OPTION_EGLIBC_NIS',
>cnf)
>+        eglibc_cfg('nonsswitch',      distro_features,
>'OPTION_EGLIBC_NSSWITCH', cnf)
>+        eglibc_cfg('norcmd',      distro_features,
>'OPTION_EGLIBC_RCMD', cnf)
>+        eglibc_cfg('nortld-debug',      distro_features,
>'OPTION_EGLIBC_RTLD_DEBUG', cnf)
>+        eglibc_cfg('nospawn',      distro_features,
>'OPTION_EGLIBC_SPAWN', cnf)
>+        eglibc_cfg('nostreams',      distro_features,
>'OPTION_EGLIBC_STREAMS', cnf)
>+        eglibc_cfg('nosunrpc',      distro_features,
>'OPTION_EGLIBC_SUNRPC', cnf)
>+        eglibc_cfg('noutmp',      distro_features,
>'OPTION_EGLIBC_UTMP', cnf)
>+        eglibc_cfg('noutmpx',      distro_features,
>'OPTION_EGLIBC_UTMPX', cnf)
>+        eglibc_cfg('nowordexp',      distro_features,
>'OPTION_EGLIBC_WORDEXP', cnf)
>+        eglibc_cfg('noposix-clang-wchar',      distro_features,
>'OPTION_POSIX_C_LANG_WIDE_CHAR', cnf)
>+        eglibc_cfg('noposix-regexp',      distro_features,
>'OPTION_POSIX_REGEXP', cnf)
>+        eglibc_cfg('noposix-regexp-glibc',      distro_features,
>'OPTION_POSIX_REGEXP_GLIBC', cnf)
>+        eglibc_cfg('noposix-wchar-io',      distro_features,
>'OPTION_POSIX_WIDE_CHAR_DEVICE_IO', cnf)
>+        return "\n".join(cnf)
>+
>diff --git a/recipes/eglibc/eglibc.inc b/recipes/eglibc/eglibc.inc
>index 0644d49..c9765dd 100644
>--- a/recipes/eglibc/eglibc.inc
>+++ b/recipes/eglibc/eglibc.inc
>@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.eglibc.org/home"
> SECTION = "libs"
> PRIORITY = "required"
> LICENSE = "LGPL"
>-INC_PR = "r19"
>+INC_PR = "r20"
># nptl needs unwind support in gcc, which can't be built without glibc.
>DEPENDS = "virtual/${TARGET_PREFIX}gcc-intermediate linux-libc-headers"
> #this leads to circular deps, so lets not add it yet
>@@ -17,6 +17,7 @@ RPROVIDES_${PN}-dev = "libc6-dev virtual-libc-dev"
> PROVIDES_${PN}-dbg = "glibc-dbg"
> 
> inherit autotools
>+require eglibc-options.inc
> 
> LEAD_SONAME = "libc.so"
> 
>@@ -41,3 +42,7 @@ do_move_ports() {
> 	    mv ${WORKDIR}/${EGLIBC_BRANCH}/ports ${S}/
> 	fi
> }
>+OE_FEATURES := "${@features_to_eglibc_settings(d)}"
>+do_configure_prepend() {
>+	echo '${OE_FEATURES}' > ${S}/option-groups.config
>+}
>-- 
>1.7.2.3
>
>
>_______________________________________________
>Openembedded-devel mailing list
>Openembedded-devel@lists.openembedded.org
>http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

Hi,

The logic should IMO be: Disable every feature unless explicitly specified otherwise.
Take "ipv4" or "ipv6" (note: not inet6) as example: if noone asks for ipv6 then it is disabled.
This is the logic we are already using for uClibc.


