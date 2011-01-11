Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1Pckgi-00079u-Tl
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Jan 2011 21:19:29 +0100
Received: by fxm17 with SMTP id 17so19535087fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jan 2011 12:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=vKdv6oxDn+nEsL6u1QSvb9c3ElZos1FZTAokRs0CdWE=;
	b=RfSiVVp6BOC9/7tiWljPUOJ6inN0d6cpQEO2SEJ+Hh5LpC1t5WXquq5JSFkGE6+cTo
	DJWc1sazQy9v22S3P/9ArVYQBxVyRYCBE1LPGnAvGoN9y5zpze5cuT7dhF8VvC/9UsU4
	scnI8V9p+4vs6bvE+0mfFeRDxjMk6VVf0sSWs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=dQ4/aiWaV+7dYlJ70T5nijUIfF3xWz4k0nTfkyTBE21FtpGJliCi4AFMiPFAbA5GvD
	zlMdnoYKxLcPpiwunzlMtM31sgNHUqQQryG5d2y/2WnaqiEuqgtVEBNIeg2iSD2lMDpm
	8lH9JHlh1LKjjXYFR4JL7xZaOhv7ghmvyFyEE=
Received: by 10.223.87.72 with SMTP id v8mr58405fal.70.1294777137434;
	Tue, 11 Jan 2011 12:18:57 -0800 (PST)
Received: from s42.loc (85-127-155-31.dynamic.xdsl-line.inode.at
	[85.127.155.31])
	by mx.google.com with ESMTPS id y3sm7559272fai.38.2011.01.11.12.18.55
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 11 Jan 2011 12:18:56 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1PckgA-00023K-Kd; Tue, 11 Jan 2011 21:18:54 +0100
Date: Tue, 11 Jan 2011 21:18:54 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110111201854.GF6584@mx.loc>
References: <1294084926-3115-1-git-send-email-rep.dot.nop@gmail.com>
	<1294084926-3115-12-git-send-email-rep.dot.nop@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1294084926-3115-12-git-send-email-rep.dot.nop@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH 12/12] xz: bump version
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
X-List-Received-Date: Tue, 11 Jan 2011 20:19:29 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

ping?

A follow-up could also
diff --git a/recipes/xz/xz.inc b/recipes/xz/xz.inc
index ad23884..2ad345e 100644
--- a/recipes/xz/xz.inc
+++ b/recipes/xz/xz.inc
@@ -4,7 +4,7 @@ LICENSE = "Public Domain"
 HOMEPAGE = "http://tukaani.org/xz/"
 INC_PR = "r0"
 S ?= "${WORKDIR}/xz-${PV}"
-EXTRA_OECONF = "--enable-shared"
+EXTRA_OECONF = "--enable-shared --enable-small --disable-lzma-links"
 BBCLASSEXTEND = "native"

 inherit autotools

but that's for another day..

On Mon, Jan 03, 2011 at 09:02:06PM +0100, Bernhard Reutner-Fischer wrote:
>Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
>---
> recipes/xz/xz.inc            |    1 +
> recipes/xz/xz_4.999.9beta.bb |    5 -----
> recipes/xz/xz_5.0.0.bb       |    5 +++++
> 3 files changed, 6 insertions(+), 5 deletions(-)
> delete mode 100644 recipes/xz/xz_4.999.9beta.bb
> create mode 100644 recipes/xz/xz_5.0.0.bb
>
>diff --git a/recipes/xz/xz.inc b/recipes/xz/xz.inc
>index cc4f966..ad23884 100644
>--- a/recipes/xz/xz.inc
>+++ b/recipes/xz/xz.inc
>@@ -1,6 +1,7 @@
> DESCRIPTION = "XZ Utils is free general-purpose data compression software with high compression ratio.  XZ Utils are the successor to LZMA Utils."
> SECTION = "console/utils"
> LICENSE = "Public Domain"
>+HOMEPAGE = "http://tukaani.org/xz/"
> INC_PR = "r0"
> S ?= "${WORKDIR}/xz-${PV}"
> EXTRA_OECONF = "--enable-shared"
>diff --git a/recipes/xz/xz_4.999.9beta.bb b/recipes/xz/xz_4.999.9beta.bb
>deleted file mode 100644
>index 8733023..0000000
>--- a/recipes/xz/xz_4.999.9beta.bb
>+++ /dev/null
>@@ -1,5 +0,0 @@
>-require xz.inc
>-PR = "${INC_PR}.0"
>-SRC_URI = "http://tukaani.org/xz/xz-${PV}.tar.bz2;name=xz"
>-SRC_URI[xz.md5sum] = "cc4044fcc073b8bcf3164d1d0df82161"
>-SRC_URI[xz.sha256sum] = "330312c4397608d8b7be362cc7edbfeafa6101614bc2164d816ea767656aa15c"
>diff --git a/recipes/xz/xz_5.0.0.bb b/recipes/xz/xz_5.0.0.bb
>new file mode 100644
>index 0000000..cbf1112
>--- /dev/null
>+++ b/recipes/xz/xz_5.0.0.bb
>@@ -0,0 +1,5 @@
>+require xz.inc
>+PR = "${INC_PR}.0"
>+SRC_URI = "http://tukaani.org/xz/xz-${PV}.tar.bz2"
>+SRC_URI[md5sum] = "0652c09fdbb93ae2ce78c1368ffda612"
>+SRC_URI[sha256sum] = "47a89e65c4690364a0123871a221e663d23a9fbd1ca756a804b10dd4006056d8"
>-- 
>1.7.2.3
>


