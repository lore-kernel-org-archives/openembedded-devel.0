Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id 50B0176710
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 16:58:55 +0000 (UTC)
Received: by padhy1 with SMTP id hy1so73383763pad.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 09:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=M1Bco19XVChIuzgDELVt0dxKlCI3ZPEzxOwAaIm/rYU=;
	b=x7YFnZLyLuhl6WWTgeTEVZJkejLmkIb5nhLO6mEyRyrj461Wtspskc5Gr2pL/4FsGw
	EKPgDoTmSlwgzqicDtsc7e40fapNQPDr+OMO8Pa3Efvfg9oT6o/YM83r4+IIj6ycG9NA
	UZhbEdOkVZvJmsFxHMO3JUx5AjN/si6gtSYwUWfrO0vZDBYX9R7133hneMI+QUHHc9Ov
	H0opZhQmAQPY5/UbN+WRkj5F7DNntLw758a05Z+mRc/KWlYiAWPivTyg1m9QdThXFSMi
	KbR+PDEeME8kNpF3nTGRQD+KxbBNo98QYQDurxnp/52nrdNIJjow/BL3VjWYQCYud+Ct
	IfJw==
X-Received: by 10.68.68.201 with SMTP id y9mr9300708pbt.10.1446224335556;
	Fri, 30 Oct 2015 09:58:55 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1239:b89f:56e0:63e5:80b9?
	([2601:202:4000:1239:b89f:56e0:63e5:80b9])
	by smtp.googlemail.com with ESMTPSA id
	st5sm9156268pab.42.2015.10.30.09.58.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Oct 2015 09:58:54 -0700 (PDT)
To: openembedded-devel@lists.openembedded.org
References: <1446135813-13319-1-git-send-email-fabio.berton@ossystems.com.br>
From: akuster808 <akuster808@gmail.com>
X-Enigmail-Draft-Status: N1110
Message-ID: <5633A1CB.9080508@gmail.com>
Date: Fri, 30 Oct 2015 09:58:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1446135813-13319-1-git-send-email-fabio.berton@ossystems.com.br>
Cc: Fabio Berton <fabio.berton@ossystems.com.br>
Subject: Re: [meta-networking][PATCH] lldpd: Update to version 0.7.19
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
X-List-Received-Date: Fri, 30 Oct 2015 16:58:57 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

This update also includes:

CVE-2015-8012



On 10/29/2015 09:23 AM, Fabio Berton wrote:
> The fix-libevent-configure patch has been applied upstream, so we
> removed it.
> 
> Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
> ---
>  .../lldpd/files/fix-libevent-configure.patch       | 39 ----------------------
>  .../lldpd/{lldpd_0.7.17.bb => lldpd_0.7.19.bb}     |  5 ++-
>  2 files changed, 2 insertions(+), 42 deletions(-)
>  delete mode 100644 meta-networking/recipes-daemons/lldpd/files/fix-libevent-configure.patch
>  rename meta-networking/recipes-daemons/lldpd/{lldpd_0.7.17.bb => lldpd_0.7.19.bb} (92%)
> 
> diff --git a/meta-networking/recipes-daemons/lldpd/files/fix-libevent-configure.patch b/meta-networking/recipes-daemons/lldpd/files/fix-libevent-configure.patch
> deleted file mode 100644
> index 42d6b29..0000000
> --- a/meta-networking/recipes-daemons/lldpd/files/fix-libevent-configure.patch
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -Upstream-Status: Submitted [https://github.com/vincentbernat/lldpd/issues/133]
> -
> -Subject: [PATCH] fix libevent configure
> -
> -Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
> ----
> - m4/libevent.m4 | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/m4/libevent.m4 b/m4/libevent.m4
> -index 275e5a5..dcd3309 100644
> ---- a/m4/libevent.m4
> -+++ b/m4/libevent.m4
> -@@ -45,13 +45,11 @@ AC_DEFUN([lldp_CHECK_LIBEVENT], [
> -         AC_MSG_ERROR([*** libevent not found])
> -       fi
> -     ])
> --  fi
> - 
> -   if test x"$LIBEVENT_EMBEDDED" != x; then
> -     unset LIBEVENT_LIBS
> -     LIBEVENT_CFLAGS="-I\$(top_srcdir)/libevent/include -I\$(top_builddir)/libevent/include"
> -     LIBEVENT_LDFLAGS="\$(top_builddir)/libevent/libevent.la"
> --  fi
> - 
> -   # Call ./configure in libevent. Need it for make dist...
> -   libevent_configure_args="$libevent_configure_args --disable-libevent-regress"
> -@@ -64,6 +62,8 @@ AC_DEFUN([lldp_CHECK_LIBEVENT], [
> -   libevent_configure_args="$libevent_configure_args --with-pic"
> -   libevent_configure_args="$libevent_configure_args --enable-static"
> -   lldp_CONFIG_SUBDIRS([libevent], [$libevent_configure_args])
> -+  fi
> -+  fi
> - 
> -   AM_CONDITIONAL([LIBEVENT_EMBEDDED], [test x"$LIBEVENT_EMBEDDED" != x])
> -   AC_SUBST([LIBEVENT_LIBS])
> --- 
> -2.1.4
> -
> diff --git a/meta-networking/recipes-daemons/lldpd/lldpd_0.7.17.bb b/meta-networking/recipes-daemons/lldpd/lldpd_0.7.19.bb
> similarity index 92%
> rename from meta-networking/recipes-daemons/lldpd/lldpd_0.7.17.bb
> rename to meta-networking/recipes-daemons/lldpd/lldpd_0.7.19.bb
> index 47d3c38..7d54626 100644
> --- a/meta-networking/recipes-daemons/lldpd/lldpd_0.7.17.bb
> +++ b/meta-networking/recipes-daemons/lldpd/lldpd_0.7.19.bb
> @@ -9,11 +9,10 @@ SRC_URI = "\
>      http://media.luffy.cx/files/${PN}/${PN}-${PV}.tar.gz \
>      file://lldpd.init.d \
>      file://lldpd.default \
> -    file://fix-libevent-configure.patch \
>      "
>  
> -SRC_URI[md5sum] = "8cb74065956bc32a575ee5203b0e0fb5"
> -SRC_URI[sha256sum] = "6b50b8aa47d1424a93ba3df55af26da41f7d5718db8d25e99291c4a6cd09c20e"
> +SRC_URI[md5sum] = "4e924420e00ccd5dc289506f43221820"
> +SRC_URI[sha256sum] = "aac11cb1fdc037709517372c70c9bf89c752ab8e5eaab9ce140b84ed5a0507c8"
>  
>  inherit autotools update-rc.d useradd systemd pkgconfig
>  
> 

