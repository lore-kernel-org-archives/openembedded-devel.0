Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <yenchengwang@gmail.com>) id 1O9rgV-0008M5-Kg
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 May 2010 05:23:40 +0200
Received: by pxi14 with SMTP id 14so2598505pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 May 2010 20:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=TD4N13BbY71Z/k8GTc429get/RzQgGznV8w8gkMzV/s=;
	b=nvo/lKc4N4BqVBtI5vZk8RDalwjtRz/Z9yOgHA3SirSzhtjcvHEy9Io48FzarI71wX
	KrIGtALZSF2+YjCXq4rubSEWeOwc67GoFYGxiv5JNYx+FbV2yf2HxPulFzD3P3zshM6b
	lQbVrFtcdrgz4qP5L+srxUkY4wAtp5y370eus=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=iHBKzDwbsKe/fpHTdzaC1OMHxx69eYZxM0Ehug/XSo8F8GLj2pCbrCYuvkPfutrz1o
	Lc/0qNuJ5wk8K7PO1ZVNP9gxV4o6y4IryCxeUdCpG5grbAn+FWDPsYFyBvtpRmrETzyU
	33jFrU9Zf5vVFcRYUtSJ5sds+uaefq4JcUc+U=
MIME-Version: 1.0
Received: by 10.140.252.7 with SMTP id z7mr6402849rvh.186.1273115986564; Wed, 
	05 May 2010 20:19:46 -0700 (PDT)
Received: by 10.141.22.11 with HTTP; Wed, 5 May 2010 20:19:46 -0700 (PDT)
In-Reply-To: <p2lad875cab1005052017k622928e3jabfe4ea684e4ef62@mail.gmail.com>
References: <mailman.6069.1273115899.24517.openembedded-devel@lists.openembedded.org>
	<p2lad875cab1005052017k622928e3jabfe4ea684e4ef62@mail.gmail.com>
Date: Thu, 6 May 2010 11:19:46 +0800
Message-ID: <l2pad875cab1005052019o60a63221ya1727def61751e98@mail.gmail.com>
From: yenchengwang <yenchengwang@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: yenchengwang@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: create ipk failed...
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
X-List-Received-Date: Thu, 06 May 2010 03:23:48 -0000
Content-Type: text/plain; charset=UTF-8

>
> hi all,
>     I have a problem when try to "bitbake -b recipes/minicom/
> minicom-mypkg_2.4.bb"
>
>     the bellow is the content of my bb file:
>     file name is minicom-mypkg_2.4.bb
> *********************************************************************************************************
>
>     SECTION = "console/network"
>     DEPENDS = "ncurses"
>     LICENSE = "GPL"
>
>     SRC_URI = "
> https://alioth.debian.org/frs/download.php/3195/minicom-${PV}.tar.gz<https://alioth.debian.org/frs/download.php/3195/minicom-$%7BPV%7D.tar.gz>
> "
>     S = "${WORKDIR}/minicom-${PV}"
>     PR = "r0"
>
>     inherit autotools gettext
>
>     do_configure() {
>         ./configure --host = arm
>     }
>
>     do_install() {
>         autotools_do_install
>     }
>
> *********************************************************************************************************
>
> then bitbake -b recipes/minicom/minicom-mypkg_2.4.bb, I always get the
> below messages:
>
>
> ****************************************************************************************************************************************************************
> NOTE: the following files were installed but not shipped in any package:
> NOTE: /usr/local/share/man/man1/ascii-xfr.1
> NOTE: /usr/local/share/man/man1/minicom.1
> NOTE: /usr/local/share/man/man1/xminicom.1
> NOTE: /usr/local/share/man/man1/runscript.1
> ... ignored
> NOTE: /usr/local/bin/xminicom
> NOTE: /usr/local/bin/ascii-xfr
> NOTE: /usr/local/bin/minicom
> NOTE: /usr/local/bin/runscript
> NOTE: /usr/local/bin/.debug/ascii-xfr
> NOTE: /usr/local/bin/.debug/minicom
> NOTE: /usr/local/bin/.debug/runscript
> NOTE: Running task 12 of 17 (ID: 10, /home/rd/oe/build/recipes/minicom/
> minicom-mypkg_2.4.bb, do_qa_staging)
> NOTE: Running task 13 of 17 (ID: 16, /home/rd/oe/build/recipes/minicom/
> minicom-mypkg_2.4.bb, do_package_write_ipk)
> Packaged contents of minicom-mypkg-dbg into
> /home/rd/oe/build/tmp/deploy/glibc/ipk/armv5te/minicom-mypkg-dbg_2.4-r0.5_armv5te.ipk
> NOTE: Not creating empty archive for minicom-mypkg-2.4-r0.5
> NOTE: Not creating empty archive for minicom-mypkg-doc-2.4-r0.5
> Packaged contents of minicom-mypkg-dev into
> /home/rd/oe/build/tmp/deploy/glibc/ipk/armv5te/minicom-mypkg-dev_2.4-r0.5_armv5te.ipk
> NOTE: Not creating empty archive for minicom-mypkg-static-2.4-r0.5
> NOTE: Not creating empty archive for minicom-mypkg-locale-2.4-r0.5
> ...ignored
>
> ****************************************************************************************************************************************************************
>
> I have no idea why I always get these messages...
> NOTE: Not creating empty archive for minicom-mypkg-2.4-r0.5
> NOTE: Not creating empty archive for minicom-mypkg-doc-2.4-r0.5
> NOTE: Not creating empty archive for minicom-mypkg-static-2.4-r0.5
> NOTE: Not creating empty archive for minicom-mypkg-locale-2.4-r0.5
>
> any information is appreciate !!
>
>

-- 
Regards
Y-C Wang

