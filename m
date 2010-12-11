Received: from mail-px0-f178.google.com ([209.85.212.178])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PRLgB-0008Ve-1g
	for openembedded-devel@lists.openembedded.org;
	Sat, 11 Dec 2010 10:23:49 +0100
Received: by pxi9 with SMTP id 9so1177612pxi.9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Dec 2010 01:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=BHir6ZueXTPtxzsOUb8YjJH+CU64BiPV9MFenkZ2oDo=;
	b=hV2e82jrA91R3EGT2U2/F57fPXcQXGfLMkklfbDw8zDUZhQC8MGQR9nOS6xVkLMgcv
	XI6z6oyEuB694oeFa74y1gB7qWWv5MmYASQeWqDK7zY9E+AtP31lJKUkPnCtT8sRaHAo
	xR1Ca90sbxuvBGyuD1izwlTcJbdtBevg49xQQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=pFxg7wYADKW881Cc6htnEd6J2/EgNQb/Sc4fxauEmCy1nMvh2Dx8LyqTwv3BRZA0jG
	YReCUHdCmnXk5f3WxrfItLhRSaFtCOQQwZUTeXP0UyeMN3mbYOPAe0kyhi7PHm5YuS4g
	2q99VB5Sneb5sq/AWtTP/GxHF6xlJ8xc324Fw=
Received: by 10.142.163.6 with SMTP id l6mr1234458wfe.283.1292059332446;
	Sat, 11 Dec 2010 01:22:12 -0800 (PST)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id v19sm5325085wfh.0.2010.12.11.01.22.11
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 11 Dec 2010 01:22:11 -0800 (PST)
Date: Sat, 11 Dec 2010 01:22:11 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101211092211.GE8894@gmail.com>
References: <icqlst$p90$3@dough.gmane.org>
	<1290911606-9148-1-git-send-email-jayen@cse.unsw.edu.au>
MIME-Version: 1.0
In-Reply-To: <1290911606-9148-1-git-send-email-jayen@cse.unsw.edu.au>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.212.178
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Jayen Ashar <jayen@cse.unsw.edu.au>
Subject: Re: [PATCH v2] libQGLViewer: New program
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
X-List-Received-Date: Sat, 11 Dec 2010 09:23:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (28/11/10 13:33), Jayen Ashar wrote:
> * Starting with libQGLViewer 2.3.8
> * libqglviewer (also known as libQGLViewer) is a free C++ library based on
> *  Qt that enables the quick creation of OpenGL 3D viewers. It features a
> *  powerful camera trackball and simple applications simply require an
> *  implementation of the draw() function. It is a tool of choice for OpenGL
> *  beginners and assignements. It provides screenshot saving, mouse
> *  manipulated frames, stereo display, interpolated keyFrames, object
> *  selection, and much more. It is fully customizable and easy to extend to
> *  create complex applications, with a possible Qt GUI.
> 
> Signed-off-by: Jayen Ashar <jayen@cse.unsw.edu.au>

thanks applied.

> ---
>  recipes/libqglviewer/libqglviewer.inc      |   20 ++++++++++++++++++++
>  recipes/libqglviewer/libqglviewer_2.3.8.bb |    3 +++
>  2 files changed, 23 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/libqglviewer/libqglviewer.inc
>  create mode 100644 recipes/libqglviewer/libqglviewer_2.3.8.bb
> 
> diff --git a/recipes/libqglviewer/libqglviewer.inc b/recipes/libqglviewer/libqglviewer.inc
> new file mode 100644
> index 0000000..48ea5bc
> --- /dev/null
> +++ b/recipes/libqglviewer/libqglviewer.inc
> @@ -0,0 +1,20 @@
> +DESCRIPTION = "an OpenGL 3D viewer library based on Qt4 - development files\
> +libqglviewer (also known as libQGLViewer) is a free C++ library based on Qt that enables the quick creation of OpenGL 3D viewers. It features a powerful camera trackball and simple applications simply require an implementation of the draw() function. It is a tool of choice for OpenGL beginners and assignements. It provides screenshot saving, mouse manipulated frames, stereo display, interpolated keyFrames, object selection, and much more. It is fully customizable and easy to extend to create complex applications, with a possible Qt GUI."
> +HOMEPAGE = "http://www.libqglviewer.com/"
> +SECTION = "devel/libs" #seems to have more recipes than libs/devel
> +LICENSE = "GPL" #You may use, distribute and copy the QGLViewer library under the terms of GNU General Public License version 2 or version 3, both of which are included in the LICENSE file.
> +#DEPENDS = "" #requires qt4-x11-free with QT_CONFIG_FLAGS without -no-opengl
> +
> +INC_PR = "r0"
> +
> +SRC_URI = "http://www.libqglviewer.com/src/libQGLViewer-${PV}.tar.gz"
> +
> +S = "${WORKDIR}/libQGLViewer-${PV}/QGLViewer/"
> +
> +inherit qt4x11
> +
> +do_install() {
> +    oe_runmake install INSTALL_ROOT=${D}
> +}
> +
> +FILES_${PN}-dev += " ${libdir}/libQGLViewer.prl"
> diff --git a/recipes/libqglviewer/libqglviewer_2.3.8.bb b/recipes/libqglviewer/libqglviewer_2.3.8.bb
> new file mode 100644
> index 0000000..813f1a6
> --- /dev/null
> +++ b/recipes/libqglviewer/libqglviewer_2.3.8.bb
> @@ -0,0 +1,3 @@
> +require libqglviewer.inc
> +
> +PR = "${INC_PR}.0"
> -- 
> 1.7.0.4
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


