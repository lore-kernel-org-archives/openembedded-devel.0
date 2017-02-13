Return-Path: <max.oss.09@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 953D760053
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Feb 2017 22:05:02 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id o16so25885210wra.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Feb 2017 14:05:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=CBoZrWsmqtY5p2+yQjT4DuRz3LieeK/GXfJb6V/oaec=;
	b=im7mhDlFv4/TSku3v50e8kKJ/LQ57QV65HhRc5/pQiqLB2dbDBs4WxNJDZl1Xt12G9
	jy10sgMxiQ6xDkkAYsrMDgYWY6Sdc2OCFZMyUVjeKBrkm1RbD3YUwKk80pOosYP6TTtt
	MRbk8TvcP/Z0g2e5Nhi5YNkgKMnvI8WFZoIY2Y0Q2jbmWDH/YXgBWw/77GjpRUa9CfP2
	7DRJ0T0MxRvZQhh+CguYjpcYLhk4BW5FOdGD4UBCKEfTJga9K8ncmDuiohGX4/MzTKI1
	casgTZLtqtyddcbjkOk5MUH0sLspHxFGLgyigSzY842k5crpcHgyPVVtJYPdpKvwCCMk
	CZXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=CBoZrWsmqtY5p2+yQjT4DuRz3LieeK/GXfJb6V/oaec=;
	b=cHOeBLEZOaxEO0eS18HG18P9GpS1RcPFF8RYBCKhOY0lXLOcd98OjRX8tDG912jbA6
	gvp36SqXKOqYEyFUGTPwnw2CS2sTU6kuBp7OVlst03eOESuzu0rOEqdiy/pUtC6oT4oe
	kRmp1f3cnpMSGjixB3TzvIpIUayOpvThi6Bfd7ze2hJSRREr9rVFCnJWc02UQSqtUh1+
	wA37404T2ZnhjwvyT8HXrgC0Cus2zYim1q1ng27djhhfq/Ze2eP+rNou+61DvVZmeWZ3
	bX1kxlHlzSshwfn1VbDYjsMTE42FRDOXHX2haezYqHdkdJ+IsVsRqLjHonw7Iyef8OdN
	YZPQ==
X-Gm-Message-State: AMke39kVxFKmIZH4U0yl0ZS0t9ZduMXSN5zPAdG0PzQvhOpfhzdA7XfuZ9QZCKj+zs0oqQ==
X-Received: by 10.223.162.205 with SMTP id t13mr23852848wra.155.1487023501838; 
	Mon, 13 Feb 2017 14:05:01 -0800 (PST)
Received: from Saturn.local.all ([194.191.225.83])
	by smtp.gmail.com with ESMTPSA id s18sm907210wmb.18.2017.02.13.14.05.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Feb 2017 14:05:01 -0800 (PST)
Message-ID: <1487023500.2100.15.camel@gmail.com>
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Feb 2017 23:05:00 +0100
In-Reply-To: <CA+chaQdeBHucjgvjgff=kudTnTX1+cxxGv6yMnGb39UjuOxSaA@mail.gmail.com>
References: <1487019728-19329-1-git-send-email-max.krummenacher@toradex.com>
	<1487019728-19329-3-git-send-email-max.krummenacher@toradex.com>
	<CA+chaQe+tq9r35iW6JMgLDuPV+v82zmPrPTaK359NQeTdzRodw@mail.gmail.com>
	<CA+chaQdeBHucjgvjgff=kudTnTX1+cxxGv6yMnGb39UjuOxSaA@mail.gmail.com>
X-Mailer: Evolution 3.16.5 
Mime-Version: 1.0
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: Re: [meta-oe][PATCH][master-next 3/4] pywbem: depend on python-m2crypto-native and its rdepends
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
X-List-Received-Date: Mon, 13 Feb 2017 22:05:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi

Am Montag, den 13.02.2017, 22:40 +0100 schrieb Martin Jansa:
> Oh, I see what you did in master-next 1/4, but is it worth creating
> .bbclass for just 2 dependencies which probably won't be used by so many
> recipes?

That's how I understand Richard here:
http://lists.openembedded.org/pipermail/openembedded-core/2017-February/132693.html

Actually it is not 2 dependencies, it is 1 dependency on
python-m2crypto-native and the run time dependency that python-m2crypto-native
needs since it upgrade to 0.25.1.

So the issue here is that if some time in the future there is another
RDEPENDS that python-m2crypto-native needs we will have to track down
all the users of it and add the new dependency there too.

If you think this does not merit a new class I can substitute the new
class by adding python-typing-native to crda and pywbem to fix the build
in the current setup and resend the patch series.

Max



On Mon, Feb 13, 2017 at 10:39 PM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
> 
> > Did you test this change? You added it to inherit not DEPENDS..
> > 
> > On Mon, Feb 13, 2017 at 10:02 PM, Max Krummenacher <max.oss.09@gmail.com>
> > wrote:
> > 
> > > This fixed the build, remove blacklist also.
> > > 
> > > Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> > > ---
> > >  meta-oe/recipes-extended/pywbem/pywbem_0.8.0.bb | 6 +-----
> > >  1 file changed, 1 insertion(+), 5 deletions(-)
> > > 
> > > diff --git a/meta-oe/recipes-extended/pywbem/pywbem_0.8.0.bb
> > > b/meta-oe/recipes-extended/pywbem/pywbem_0.8.0.bb
> > > index 8b5394e..14d4e69 100644
> > > --- a/meta-oe/recipes-extended/pywbem/pywbem_0.8.0.bb
> > > +++ b/meta-oe/recipes-extended/pywbem/pywbem_0.8.0.bb
> > > @@ -16,14 +16,13 @@ HOMEPAGE = "http://pywbem.sf.net/"
> > >  LICENSE = "LGPLv2"
> > >  LIC_FILES_CHKSUM = "file://pywbem/LICENSE.txt;md5
> > > =fbc093901857fcd118f065f900982c24"
> > >  SECTION = "Development/Libraries"
> > > -DEPENDS = "python-m2crypto-native"
> > >  SRC_URI = "http://jaist.dl.sourceforge.net/project/${BPN}/${BPN}/${BP}
> > > /${BP}-dev.r704.zip"
> > >  SRC_URI[md5sum] = "84072451dcdd1aa9ee82363848faf7ad"
> > >  SRC_URI[sha256sum] = "898035866d3cc741bbcd62c4ac26e
> > > 633ad07b7c11d89db2472b9f923f3fd3ed8"
> > > 
> > >  S = "${WORKDIR}/${BP}-dev"
> > > 
> > > -inherit setuptools python-dir
> > > +inherit setuptools python-m2crypto-native
> > > 
> > >  do_install_append() {
> > >      mv ${D}${bindir}/wbemcli.py ${D}${bindir}/pywbemcli
> > > @@ -34,6 +33,3 @@ do_install_append() {
> > >  }
> > > 
> > >  BBCLASSEXTEND = "native"
> > > -
> > > -PNBLACKLIST[pywbem] ?= "Fails to build with RSS
> > > http://errors.yoctoproject.org/Errors/Details/130596/"
> > > -PNBLACKLIST[pywbem] ?= "Fails to build with RSS
> > > http://errors.yoctoproject.org/Errors/Details/130681/"
> > > --
> > > 2.6.6
> > > 
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > > 
> > 
> > 

