Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PpqKW-0002ca-N8
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Feb 2011 23:58:40 +0100
Received: by yie16 with SMTP id 16so835669yie.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Feb 2011 14:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=lbQJp+PYq14oP10+2wt3MqK4xPRM3yGnQjIfvXy4WBw=;
	b=ZUjlE/F4dgNYBrgk/57q7hRkbdODrr+XwYYuI1c3lVsU0de+aWWi19/wYBvS9RsjUK
	uwBF5w0/ibIlVuda3foU/xhL+8n+jR+KchWsjjAOWjWGzb5MH023IE1Y+3bEoIJijJUS
	8f6M5qg9z6HNEX4lPcI/KRTEAauXDCHdOc0SI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	b=CHdIQ46kL8NPB6z3KDEAabQXf1Q4xYgvp600VdRyG0aDZcz3rYY/NzqS2x2eZa+8vl
	y4n+JYNthpEz3zJ2wpA/nRfsVPVq0LFVOutD6HHccrwfjZLAXii9FKSv4DfwgToNRguc
	aBVwDElkK/kR6PmIBTr3Pt9MGR0PwM9SdRJqI=
Received: by 10.90.18.5 with SMTP id 5mr1477724agr.204.1297897045614;
	Wed, 16 Feb 2011 14:57:25 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id d15sm288503ana.35.2011.02.16.14.57.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 Feb 2011 14:57:24 -0800 (PST)
Date: Wed, 16 Feb 2011 14:57:27 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110216225727.GK14525@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <1297852433-31160-1-git-send-email-eric@eukrea.com>
	<1297852433-31160-5-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
In-Reply-To: <1297852433-31160-5-git-send-email-eric@eukrea.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH 05/10] nodejs: add 0.4.0
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
X-List-Received-Date: Wed, 16 Feb 2011 22:58:41 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On (16/02/11 11:33), Eric Bénard wrote:
> compile tested for armv5, previous node-cross-cc_0.2.6.patch
> doesn't seems anymore necessary unless I made a mistake, AJ may
> you please check this point ?
> 
> Signed-off-by: Eric Bénard <eric@eukrea.com>
> Cc: AJ ONeal <coolaj86@gmail.com>

in general looks fine if AJ does not find anything

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
>  recipes/nodejs/files/libev-cross-cc_0.4.0.patch |   13 +++++++++
>  recipes/nodejs/nodejs_0.4.0.bb                  |   32 +++++++++++++++++++++++
>  2 files changed, 45 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/nodejs/files/libev-cross-cc_0.4.0.patch
>  create mode 100644 recipes/nodejs/nodejs_0.4.0.bb
> 
> diff --git a/recipes/nodejs/files/libev-cross-cc_0.4.0.patch b/recipes/nodejs/files/libev-cross-cc_0.4.0.patch
> new file mode 100644
> index 0000000..2b9838f
> --- /dev/null
> +++ b/recipes/nodejs/files/libev-cross-cc_0.4.0.patch
> @@ -0,0 +1,13 @@
> +diff --git a/deps/libev/wscript b/deps/libev/wscript
> +index 4f6c9a8..1796749 100644
> +--- a/deps/libev/wscript
> ++++ b/deps/libev/wscript
> +@@ -58,7 +58,7 @@ def configure(conf):
> +           return 0;
> +       }
> +   """
> +-  conf.check_cc(fragment=code, define_name="HAVE_CLOCK_SYSCALL", execute=True,
> ++  conf.check_cc(fragment=code, define_name="HAVE_CLOCK_SYSCALL", execute=False,
> +                 msg="Checking for SYS_clock_gettime")
> + 
> +   have_librt = conf.check(lib='rt', uselib_store='RT')
> diff --git a/recipes/nodejs/nodejs_0.4.0.bb b/recipes/nodejs/nodejs_0.4.0.bb
> new file mode 100644
> index 0000000..be3d23e
> --- /dev/null
> +++ b/recipes/nodejs/nodejs_0.4.0.bb
> @@ -0,0 +1,32 @@
> +DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
> +HOMEPAGE = "http://nodejs.org"
> +LICENSE = "MIT"
> +
> +DEPENDS = "openssl"
> +
> +SRC_URI = " \
> +  http://nodejs.org/dist/node-v${PV}.tar.gz \
> +  file://libev-cross-cc_${PV}.patch \
> +"
> +
> +SRC_URI[md5sum] = "18f89256751f9b8e27dee8494f508171"
> +SRC_URI[sha256sum] = "4a30bd9963373cb86a994479bdd451ab3b6f2124f0089493366315da79d3408e"
> +
> +S = "${WORKDIR}/node-v${PV}"
> +
> +# v8 errors out if you have set CCACHE
> +CCACHE = ""
> +
> +do_configure () {
> +  ./configure --prefix=${prefix} --without-snapshot
> +}
> +
> +do_compile () {
> +  make
> +}
> +
> +do_install () {
> +  DESTDIR=${D} oe_runmake install
> +}
> +
> +BBCLASSEXTEND = "native"
> -- 
> 1.7.0.4
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
-Khem


