Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gizero@gmail.com>) id 1TLYt7-0007IZ-2d
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Oct 2012 14:26:17 +0200
Received: by mail-wi0-f177.google.com with SMTP id hj13so4080015wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Oct 2012 05:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=NOzLm4VXJA7rPv0UMiVBIzgwHwPJC7fMx1T5pldgCME=;
	b=k6bftpGAnQJ2b/kbGvexA1xsCbjvO/2Naa/kdkPW1zsEFyMk2LmWBTWVK7KAM4pueo
	QdPWWoNvf9XmubXeSq/JacMmbD74x6x3fFZUFeiiuH0yhTOVvtWeQ1Cq4nCa/Jaj1dpx
	gdG/cTmMguOivIGSdCHKDO+cmgsKy0cDxxA5pKP/Yh8QGhA1aM9IsXBFmtQZ3nzaq8L3
	19VJhIVFHxKk5hvWRbCoeb5PjrLD8tVNWh1XrBzkoxuD2w0EMzyIakrbF82pKnjqaRs5
	uY2gHniQPaaaniTSKmFmXddEv+FQlOv4zj/dJcA/Sniz6Czxi4qV8YWpgveJ0ldOem4X
	2icw==
MIME-Version: 1.0
Received: by 10.216.226.154 with SMTP id b26mr10695621weq.166.1349784789541;
	Tue, 09 Oct 2012 05:13:09 -0700 (PDT)
Received: by 10.223.158.74 with HTTP; Tue, 9 Oct 2012 05:13:09 -0700 (PDT)
In-Reply-To: <1349774009-4537-1-git-send-email-gizero@gmail.com>
References: <1349774009-4537-1-git-send-email-gizero@gmail.com>
Date: Tue, 9 Oct 2012 14:13:09 +0200
Message-ID: <CAC+thW3PFdFQwgL_h6H1ix=vSux90wbLO_LrwJD=DvUfVRrsUA@mail.gmail.com>
From: Andrea Galbusera <gizero@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] libconfig: port from classic and update
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
X-List-Received-Date: Tue, 09 Oct 2012 12:26:17 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

On Tue, Oct 9, 2012 at 11:13 AM, Andrea Galbusera <gizero@gmail.com> wrote:
> * based on recipe from oe-classic
> * update to currently available upstream version 1.4.9
>
> Signed-off-by: Andrea Galbusera <gizero@gmail.com>
> ---
>  .../recipes-extended/libconfig/libconfig_1.4.9.bb  |   14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/libconfig/libconfig_1.4.9.bb
>
> diff --git a/meta-oe/recipes-extended/libconfig/libconfig_1.4.9.bb b/meta-oe/recipes-extended/libconfig/libconfig_1.4.9.bb
> new file mode 100644
> index 0000000..c7d3cf7
> --- /dev/null
> +++ b/meta-oe/recipes-extended/libconfig/libconfig_1.4.9.bb
> @@ -0,0 +1,14 @@
> +SUMMARY = "C/C++ Configuration File Library"
> +DESCRIPTION = "Library for manipulating structured configuration files"
> +HOMEPAGE = "http://www.hyperrealm.com/libconfig/"
> +SECTION = "libs"
> +
> +LICENSE = "LGPLv2.1"
> +LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=fad9b3332be894bab9bc501572864b29"
> +
> +SRC_URI = "http://www.hyperrealm.com/${BPN}/${BP}.tar.gz"
> +
> +inherit autotools pkgconfig
> +
> +SRC_URI[md5sum] = "b6ee0ce2b3ef844bad7cac2803a90634"
> +SRC_URI[sha256sum] = "09c8979252e60193e2969e9b0e1cd597f7820087867989b2f0939ad164473041"
> --
> 1.7.9.5
>

Just to clarify... this was already submitted for 1.4.8 by someone
else some time ago, but it got lost, probably due to a missing
[meta-oe] tag: re-submitting updated to latest upstream.


