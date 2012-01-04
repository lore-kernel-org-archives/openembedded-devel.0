Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RiJMO-0007v2-69
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Jan 2012 06:26:00 +0100
Received: by iakh37 with SMTP id h37so28134905iak.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Jan 2012 21:18:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=qokVdEMIPZZMb5HMncrmZ6+yCnVLlJEiDSSz6NEdThw=;
	b=Wr0Gah5yTnK1kj8c10gc1ivM+kKrJ+XazXFmqER2Ef1Gtn4Gq5tsgT5ybg4g2ja1ky
	jcbNlbO/+TYgublIjz+eEnc27xxZsoWt+nmUAjwWPZGOdVDwklmurtYy2H31ZCmfaVFU
	x1Qp/ZZzX4CWAeCiFfTH9+ASuQp5y1MAd3xvQ=
Received: by 10.50.160.199 with SMTP id xm7mr66339982igb.24.1325654308677;
	Tue, 03 Jan 2012 21:18:28 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id yg2sm115119865igb.1.2012.01.03.21.18.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 03 Jan 2012 21:18:27 -0800 (PST)
Date: Tue, 3 Jan 2012 21:18:49 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120104051849.GG31275@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org,
	Eric =?utf-8?Q?B=C3=A9nard?= <eric@eukrea.com>
References: <1324624336-18713-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
In-Reply-To: <1324624336-18713-1-git-send-email-eric@eukrea.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Eric =?utf-8?Q?B=C3=A9nard?= <eric@eukrea.com>
Subject: Re: [meta-oe] gdb-cross-canadian: build gdb with python support
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
X-List-Received-Date: Wed, 04 Jan 2012 05:26:00 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On (23/12/11 08:12), Eric Bénard wrote:
> * python support is needed for providing finer scripting control
> in gdb, and for remote controling gdb for example from qtcreator
> * gdb/configure tries to autodetect python using python executable
> with --includes --ldflags --exec-prefix to get the right flags
> As it's difficult to achieve in OE's context, we generate a
> script which will return the right values and make gdb's build
> system happy. This idea was taken from the following article :
> http://www.mentby.com/doug-evans-2/python-enabled-gdb-on-windows-and-relocation.html
> * tested using angstrom & armv7/armv5 targets & qtcreator 201005 & 2.4.0

I think this change should go into oe-core. Can you please redo it
w.r.t. oe-core 

> 
> Signed-off-by: Eric Bénard <eric@eukrea.com>
> ---
>  .../gdb/gdb-cross-canadian_7.3.1.bbappend          |   20 ++++++++++++++++++++
>  1 files changed, 20 insertions(+), 0 deletions(-)
>  create mode 100644 meta-oe/recipes-devtools/gdb/gdb-cross-canadian_7.3.1.bbappend
> 
> diff --git a/meta-oe/recipes-devtools/gdb/gdb-cross-canadian_7.3.1.bbappend b/meta-oe/recipes-devtools/gdb/gdb-cross-canadian_7.3.1.bbappend
> new file mode 100644
> index 0000000..3bbfe38
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/gdb/gdb-cross-canadian_7.3.1.bbappend
> @@ -0,0 +1,20 @@
> +DEPENDS += "python-nativesdk"
> +RDEPENDS += "python-nativesdk-core python-nativesdk-lang python-nativesdk-re \
> +			 python-nativesdk-codecs python-nativesdk-netclient"
> +
> +EXTRA_OECONF_append = "--with-python=${WORKDIR}/python"
> +PRINC = "1"
> +
> +do_configure_prepend() {
> +cat > ${WORKDIR}/python << EOF
> +#! /bin/sh
> +case "\$2" in
> +	--includes) echo "-I${STAGING_DIR}/${HOST_ARCH}-nativesdk${HOST_VENDOR}-${HOST_OS}${exec_prefix}/include/python${PYTHON_BASEVERSION}/" ;;
> +	--ldflags) echo "-L${STAGING_DIR}/${HOST_ARCH}-nativesdk${HOST_VENDOR}-${HOST_OS}${libdir}/python${PYTHON_BASEVERSION}/config/config -lpthread -ldl -lutil -lm -lpython${PYTHON_BASEVERSION}" ;;
> +	--exec-prefix) echo "/usr" ;;
> +	*) exit 1 ;;
> +esac
> +exit 0
> +EOF
> +	chmod +x ${WORKDIR}/python
> +}
> -- 
> 1.7.6.4
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
-Khem


