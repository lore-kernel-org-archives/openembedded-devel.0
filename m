Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 425E06BD08
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Nov 2019 07:06:16 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id t1so7316898wrv.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Nov 2019 23:06:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=8WbtIckuviLlL+Ehyh72ymMJ0YFJQWgf46LpkQHm3xk=;
	b=eEORz3PIaQuMumCY7xrmfuK6He1nXEZL6xnhy+Y4tI9D9BEqMxH1ctaZ4AvFvawLV2
	mik071kvUnR1xPfQQi3qrJ9lPHTow8ekAiCnpgrTcs3kn/8HMVj2jHKpc63l0GWXk2H7
	AxKAj1EVWVyGocGJJaqMaeJct54TgUv9zbrodcjVBaPs0IU84ysk5pO1OpUnvmD5GbpG
	Rhq2aJAJqxgzvEPINJyK+7Q358Twpu+GEZWtkNQ4wJbJ4lEG6ghc8iKLwI0vubN0lh/H
	0zXttCzjtG6THg1tiUgH7ZErL1X1AfmU/Dt91xdMvfdcXJrDG9kRNJiMs/kg57iUps3N
	VcFg==
X-Gm-Message-State: APjAAAXjCrfitWO8PkaekW+eix3Nf65q1AwTR7P3qMhMuB9FPAUIFr5n
	MBfvQZK3QFmtTV/ik0viO5vBk5It
X-Google-Smtp-Source: APXvYqwrnRDLGmJMsSBUw7i1SlYFAWVf5CyHbRds0Y1ITGadXgsWzmat7/ZiyqYVDlDM8BxIgbvu5A==
X-Received: by 2002:adf:9d87:: with SMTP id p7mr15792100wre.11.1574406377354; 
	Thu, 21 Nov 2019 23:06:17 -0800 (PST)
Received: from tfsielt31850.fritz.box ([79.97.20.138])
	by smtp.gmail.com with ESMTPSA id 17sm2307694wmg.19.2019.11.21.23.06.16
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 21 Nov 2019 23:06:16 -0800 (PST)
Message-ID: <71efcebe3de17b855452a5e0082afe393bbebef8.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Nov 2019 07:06:16 +0000
In-Reply-To: <20191119011629.3835732-2-raj.khem@gmail.com>
References: <20191119011629.3835732-1-raj.khem@gmail.com>
	<20191119011629.3835732-2-raj.khem@gmail.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH 2/2] upm: Link with libatomic on clang/x86
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Nov 2019 07:06:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-11-18 at 17:16 -0800, Khem Raj wrote:
> This is needed for atomic<double> which clang does not use intrinsic
> function for on 32bit x86
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../upm/0001-nmea_gps-Link-with-latomic.patch | 27 +++++++++++++++++++
>  meta-oe/recipes-extended/upm/upm_git.bb       |  2 ++
>  2 files changed, 29 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/upm/upm/0001-nmea_gps-Link-with-latomic.patch
> 
> diff --git a/meta-oe/recipes-extended/upm/upm/0001-nmea_gps-Link-with-latomic.patch b/meta-oe/recipes-
> extended/upm/upm/0001-nmea_gps-Link-with-latomic.patch
> new file mode 100644
> index 0000000000..c16b8dbc5a
> --- /dev/null
> +++ b/meta-oe/recipes-extended/upm/upm/0001-nmea_gps-Link-with-latomic.patch
> @@ -0,0 +1,27 @@
> +From 996d37fc0b7177ee57788399b9140032d5de2765 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Mon, 18 Nov 2019 15:50:02 -0800
> +Subject: [PATCH] nmea_gps: Link with latomic
> +
> +clang/x86 ends up with missing symbols for atomics due to atomic<double>
> +with libstdc++, it works ok with libc++
> +
> +Upstream-Status: Pending
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + src/nmea_gps/CMakeLists.txt | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/nmea_gps/CMakeLists.txt b/src/nmea_gps/CMakeLists.txt
> +index b3fb6591..5280bfed 100644
> +--- a/src/nmea_gps/CMakeLists.txt
> ++++ b/src/nmea_gps/CMakeLists.txt
> +@@ -6,4 +6,4 @@ upm_mixed_module_init (NAME nmea_gps
> +     CPP_SRC nmea_gps.cxx
> +     FTI_SRC nmea_gps_fti.c
> +     CPP_WRAPS_C
> +-    REQUIRES mraa utilities-c ${CMAKE_THREAD_LIBS_INIT})
> ++    REQUIRES mraa utilities-c atomic ${CMAKE_THREAD_LIBS_INIT})
> +-- 
> +2.24.0
> +
> diff --git a/meta-oe/recipes-extended/upm/upm_git.bb b/meta-oe/recipes-extended/upm/upm_git.bb
> index fb22e83359..dbe97370d5 100644
> --- a/meta-oe/recipes-extended/upm/upm_git.bb
> +++ b/meta-oe/recipes-extended/upm/upm_git.bb
> @@ -15,6 +15,8 @@ SRC_URI = "git://github.com/intel-iot-devkit/${BPN}.git;protocol=http \
>             file://0001-Use-stdint-types.patch \
>             "
>  
> +SRC_URI_append_toolchain-clang_x86 = " file://0001-nmea_gps-Link-with-latomic.patch "
> +
>  S = "${WORKDIR}/git"
>  
>  # Depends on mraa which only supports x86 and ARM for now
> -- 
> 2.24.0
> 

If you're planning to upstream this, I normally use something like this in CMake:

set(ATOMIC_TEST_C_SOURCE "
#include <stdatomic.h>
#include <stdint.h>
atomic_uint_fast64_t x;
atomic_uint_fast64_t y;
int main() {
    return (int)(x + y);
}")


    # libatomic check - some arches need to link against libatomic.so, some don't
    include(CheckCSourceCompiles)
    include(CMakePushCheckState)
    include(CheckLibraryExists)
    cmake_push_check_state()
    check_c_source_compiles("${ATOMIC_TEST_C_SOURCE}" HAVE_ATOMICS_WITHOUT_LIBATOMIC)
    if(NOT HAVE_ATOMICS_WITHOUT_LIBATOMIC)
        check_library_exists(atomic __atomic_load_8 "" LIBATOMIC_EXISTS)
        if(LIBATOMIC_EXISTS)
            set(CMAKE_REQUIRED_LIBRARIES atomic)
            check_c_source_compiles("${ATOMIC_TEST_C_SOURCE}" HAVE_ATOMICS_WITH_LIBATOMIC)
        endif()
        if(HAVE_ATOMICS_WITH_LIBATOMIC)
            list(APPEND EXTRA_LIBRARIES atomic)
        else()
            message(FATAL_ERROR "Could not determine support for atomic operations.")
        endif()
    endif()
    cmake_pop_check_state()


Cheers,
A.



