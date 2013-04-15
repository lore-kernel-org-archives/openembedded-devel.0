Received: from mail-wg0-f47.google.com ([74.125.82.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1URn39-0002h6-BZ
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Apr 2013 19:18:45 +0200
Received: by mail-wg0-f47.google.com with SMTP id j13so2505306wgh.14
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Apr 2013 10:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:content-type;
	bh=xk6XCAhpmo3sVxh8y3i4AxzAqd3H4YKC9e0Wbhsj4TM=;
	b=QYsd2qFKsD4uuBgnEXrsj8yHZ/UXxQj/jWZhagu46PpA1UkfuTfuG0iEZmkpgqMsLQ
	40VDEg7tW/CxXRuc+bgfW4tH4AWSlfajRqJEz4FpY3xZweHepAC303nzTC+Epc4MkEWm
	fqW/OP4enCZqDkKV3FseS+un8qYeaFMznpcW5lq3h+Avu2cQdjGlY910mR08vRTBYqLN
	seI653yp4l2o/+8aaP75AohXqMZPiF7N8xXNvaiAkzMhAbYLvAlXxNAybLOQuzgIzkmE
	CmxwURt+u5a3mnEg0k69GzJ+Yueh+HSk8LWPFLY38d2rMRbE0LO4iDZQRl6+QqJ8Kzek
	jYlw==
MIME-Version: 1.0
X-Received: by 10.194.178.100 with SMTP id cx4mr19845688wjc.47.1366045270323; 
	Mon, 15 Apr 2013 10:01:10 -0700 (PDT)
Received: by 10.194.243.137 with HTTP; Mon, 15 Apr 2013 10:01:10 -0700 (PDT)
In-Reply-To: <1366044914-28257-1-git-send-email-marcin.juszkiewicz@linaro.org>
References: <1366044914-28257-1-git-send-email-marcin.juszkiewicz@linaro.org>
Date: Mon, 15 Apr 2013 19:01:10 +0200
Message-ID: <CA+chaQe41Hu=aHCiu5xvNQvJ3-+Gz_qaLxyVu=YLHJJ6WferSg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe][PATCH] gpsd: s/gpsd-dev/${PN}-dev to make bitbake happy
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
X-List-Received-Date: Mon, 15 Apr 2013 17:18:51 -0000
Content-Type: text/plain; charset=UTF-8

http://lists.linuxtogo.org/pipermail/openembedded-devel/2013-April/044943.html
is
already merged


On Mon, Apr 15, 2013 at 6:55 PM, Marcin Juszkiewicz <
marcin.juszkiewicz@linaro.org> wrote:

> WARNING: Variable key FILES_${PN}-dev (${includedir} ${FILES_SOLIBSDEV}
> ${libdir}/*.la ${libdir}/*.o ${libdir}/pkgconfig ${datadir}/pkgconfig
> ${datadir}/aclocal ${base_libdir}/*.o ${libdir}/${BPN}/*.la
> ${base_libdir}/*.la) replaces original key FILES_gpsd-dev (
> ${libdir}/pkgconfdir/libgpsd.pc ${libdir}/pkgconfdir/libgps.pc).
>
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>  meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bbb/meta-oe/recipes-navigation/gpsd/
> gpsd_3.7.bb
> index e98d795..ceb700a 100644
> --- a/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb
> +++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb
> @@ -91,7 +91,7 @@ pkg_postrm_${PN}-conf() {
>
>  PACKAGES =+ "libgps libgpsd python-pygps-dbg python-pygps gpsd-udev
> gpsd-conf gpsd-gpsctl gps-utils"
>
> -FILES_gpsd-dev += "${libdir}/pkgconfdir/libgpsd.pc
> ${libdir}/pkgconfdir/libgps.pc"
> +FILES_${PN}-dev += "${libdir}/pkgconfdir/libgpsd.pc
> ${libdir}/pkgconfdir/libgps.pc"
>
>  FILES_python-pygps-dbg += " ${libdir}/python*/site-packages/gps/.debug"
>
> --
> 1.8.1.2
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

