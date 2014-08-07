Return-Path: <bobadeshrikant@gmail.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id 3FF1265CAD
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Aug 2014 12:05:55 +0000 (UTC)
Received: by mail-ig0-f179.google.com with SMTP id h18so4380897igc.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Aug 2014 05:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=J9jEacb6SXMOpVThRB1sVvZ3Q16+AB+LAGYcvVH7yMU=;
	b=UBE5rr02wrsHllt4au0tvVt3gBY7w97d6+1FWtwy/NUj5NgMbiSbA7gR7g9P73PGPO
	w/hzXq9+11qA52stEhoJzSdjpYQsaz75fcIe6fKQFeoPvvMhZVBPbCGnmJXXTAP76a/s
	bvpmOmRmU0Y8vl+neJKJyZtuwEF4KPpKIA1FBkLZW1optJUj/MSrl/PUSOkUVo7aFaqc
	ul3xe0DntbBdRlOVub1AxcggEFYLuhZ0EF6pO+fM0JxCmrzcTGqhylPhftH1ac0B5+t8
	bENDUZ0IygdQcfcPR+BJ70jjfI2ki2ogq1iDEOqUQI9K1wg9VlpKKLRhzwgJlYnZFIOS
	jZ5w==
MIME-Version: 1.0
X-Received: by 10.50.80.45 with SMTP id o13mr68601122igx.7.1407413156409; Thu,
	07 Aug 2014 05:05:56 -0700 (PDT)
Received: by 10.50.13.10 with HTTP; Thu, 7 Aug 2014 05:05:56 -0700 (PDT)
Date: Thu, 7 Aug 2014 17:35:56 +0530
Message-ID: <CALwQErryyYqTt9cJ8aAYVbHgtd3_bwSAxii5EeRJOtMNeXFQPg@mail.gmail.com>
From: Shrikant Bobade <bobadeshrikant@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [PATCH] gdk-pixbuf-native: add setscene dep on jpeg-native
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
X-List-Received-Date: Thu, 07 Aug 2014 12:05:59 -0000
Content-Type: text/plain; charset=UTF-8

Thanks Martin,

sending it to oe-core mailing list.

Thanks
Shrikant


On Thu, Aug 7, 2014 at 5:33 PM, Bobade, Shrikant <Shrikant_Bobade@mentor.com
> wrote:

>
> ________________________________________
> From: Martin Jansa [martin.jansa@gmail.com]
> Sent: Thursday, August 07, 2014 3:46 PM
> To: openembedded-devel@lists.openembedded.org
> Cc: Bobade, Shrikant
> Subject: Re: [oe] [PATCH] gdk-pixbuf-native: add setscene dep on
> jpeg-native
>
> On Thu, Aug 07, 2014 at 03:13:38PM +0530, Shrikant Bobade wrote:
> > From: Shrikant Bobade <Shrikant_Bobade@mentor.com>
> >
> > Without this, we can get setscene postinst failure due to libjpeg being
> > unavailable.
>
> This needs to go to oe-core ML.
>
> >
> > Signed-off-by: Christopher Larson <kergoth@gmail.com>
> > Signed-off-by: Shrikant Bobade <Shrikant_Bobade@mentor.com>
> > ---
> >  meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.8.bb |    1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.8.bb
> b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.8.bb
> > index 3d08146..1248529 100644
> > --- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.8.bb
> > +++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.8.bb
> > @@ -74,6 +74,7 @@ RDEPENDS_${PN}-ptest += "gnome-desktop-testing"
> >
> >  PACKAGES_DYNAMIC += "^gdk-pixbuf-loader-.*"
> >  PACKAGES_DYNAMIC_class-native = ""
> > +PIXBUFCACHE_SYSROOT_DEPS_class-native +=
> "jpeg-native:do_populate_sysroot_setscene"
> >
> >  python populate_packages_prepend () {
> >      postinst_pixbufloader = d.getVar("postinst_pixbufloader", True)
> > --
> > 1.7.9.5
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>

