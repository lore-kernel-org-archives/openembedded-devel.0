Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-we0-f177.google.com (mail-we0-f177.google.com
	[74.125.82.177])
	by mail.openembedded.org (Postfix) with ESMTP id 61C006D700
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Nov 2013 08:34:21 +0000 (UTC)
Received: by mail-we0-f177.google.com with SMTP id p61so5463810wes.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Nov 2013 00:34:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to
	:content-type;
	bh=G24f/2wq3aJEzduXFlSkELlqxhuYCdEJTx1TQHgFWKw=;
	b=Pf/sdRDTQlCue/D9ep7spx0wHwLU+hb9vJbHo2X3U/I0qQxld4gs6l+OXIcbcHoaEW
	SSVU4XjbzcAXoTE8SSWJVzkqQPO8mbEoiDFuPsD/Qnznfr4bPt5rta6n308sYzO4PxfX
	+OyfPlVDyqmmPLliT4GxS/sd96Nb/buk3t7+yWA/Qy/gjiXDZ45zCqRQrF6Dei+1aSsJ
	AwfhTEe776x0prs9tU1U2E4oYMEJqdoqJ4es+86TO/uo4JNkTNSc65L/bYV51SeDovPk
	NKQ+srjnMI127wzlaCXp6rYGFbnhNZwjDNfZIohOiMO6W+uxITSdYn/wfTPDZWEE7k/C
	TJ4A==
X-Gm-Message-State: ALoCoQkQiwc4okKAAYC5axlIdaqarONLK4ex642dx2EdP9XgmdULUl3jzPUclfp78YHr95UWGToI
X-Received: by 10.180.219.33 with SMTP id pl1mr4786731wic.49.1385022859960;
	Thu, 21 Nov 2013 00:34:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.180.211.172 with HTTP; Thu, 21 Nov 2013 00:33:59 -0800 (PST)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Thu, 21 Nov 2013 09:33:59 +0100
Message-ID: <CAP71Wjy9mGKjDnzAKED7zFUY6J1c_2-ysUpH8uHgczZe5zNi9A@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: making qt5 package machine specific
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
X-List-Received-Date: Thu, 21 Nov 2013 08:34:22 -0000
Content-Type: text/plain; charset=ISO-8859-1

hi,

we are building a product/distro with qt5 with support for various SoC. the
way qt5 recipes are designed, it kind of forces the resulting packages to
be  <machine> specific, not <arch> specific.

first each <machine> has a different provider for GL/GLES and it impacts
the RDEPENDS, on top of that we have machine specific patches in Qt5 in
each of our BSP layer, whether we like it or not, that's a reality that we
cannot have the very same Qt5 config + source code for all platforms.

so we end up with many  <qt pkgs>-<arch> which are <machine> specific, not
<arch>, and it messes up badly with sstate for example, especially when
cleaning up the sstate (e.g. using sstate-cache-management -d).

so i have a couple of questions:

 - are we doing something really wrong here? or are we getting issues that
anyone would get when trying to have a OE based product with Qt5 and
multiple machines from the same <arch>?

 - assuming this is a typical use case... i wish there was an easy
mechanism to 'mark' all Qt5 packages as PACKAGE_ARCH = "${MACHINE_ARCH}",
without having to .bbappend every single recipe. It is indeed quite common
to have a .bbappend for qtbase, but not for the other packages...

thanks!

