Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f170.google.com (mail-ob0-f170.google.com
	[209.85.214.170])
	by mail.openembedded.org (Postfix) with ESMTP id 8A7526013D
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Apr 2015 19:05:43 +0000 (UTC)
Received: by obbec2 with SMTP id ec2so180574947obb.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Apr 2015 12:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=yRxAO33BTYYWDKtnLDYehENoRigZhvmJEw+Y0LKjdbk=;
	b=I/yFHdNvxmNbLLU328ZgU/019WfFgL6/xX9Vv0iBlVVBMkXTS1VtNBbWpYMzh2FOwb
	3pFy4jqgvu2MxIXqo02ggcZ2MBm2FJ7+1a5LG7HgjzrUHq7S5gCIBwOufI/ITXnpyvWi
	WsfhVYoPzotigcG28enFxMOHG8UIGVd78A2meMO6L2LL0FSQzpHcwD3t2zNtORpcJ2/z
	pIQRWndOxS5JXH7BEGmJ+Xn4wkeHMRRpx8YhBrZ2yBn13m95sGv8YO6M8c9eJM2eK7on
	erjt24zf3M+zPNQwoP9YX5uI3HloAFC4flpbOS1rW/zChtuG7DJHLq1eP+UmPOD/xvA8
	qaVg==
MIME-Version: 1.0
X-Received: by 10.60.179.99 with SMTP id df3mr4683750oec.70.1428087944383;
	Fri, 03 Apr 2015 12:05:44 -0700 (PDT)
Received: by 10.202.217.69 with HTTP; Fri, 3 Apr 2015 12:05:44 -0700 (PDT)
In-Reply-To: <1427916099-30314-1-git-send-email-gshastri@juniper.net>
References: <1427916099-30314-1-git-send-email-gshastri@juniper.net>
Date: Fri, 3 Apr 2015 12:05:44 -0700
Message-ID: <CAJ86T=Xg9h4eVbahpOLqJbxx2E89CFkj9j_OiA+utHSO71pN-g@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [[meta-filesystems][Add xorriso support]] Add xorriso tool support
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
X-List-Received-Date: Fri, 03 Apr 2015 19:05:48 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Apr 1, 2015 at 12:21 PM, Gaurang Shastri <gshastri@juniper.net> wrote:
> xorriso copies file objects from POSIX compliant filesystems into
> Rock Ridge enhanced ISO 9660 filesystems and allows session-wise
> manipulation of such filesystems.
>
> Signed-off-by: Gaurang Shastri <gshastri@juniper.net>
> ---
>  .../recipes-utils/xorriso/xorriso_1.3.8.bb         |   17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 meta-filesystems/recipes-utils/xorriso/xorriso_1.3.8.bb
>
> diff --git a/meta-filesystems/recipes-utils/xorriso/xorriso_1.3.8.bb b/meta-filesystems/recipes-utils/xorriso/xorriso_1.3.8.bb
> new file mode 100644
> index 0000000..93914b4
> --- /dev/null
> +++ b/meta-filesystems/recipes-utils/xorriso/xorriso_1.3.8.bb
> @@ -0,0 +1,17 @@
> +DESCRIPTIONS = "xorriso copies file objects from POSIX compliant filesystems into Rock Ridge enhanced ISO 9660 filesystems and allows session-wise manipulation of such filesystems"

DESCRIPTION, not DESCRIPTIONS.

> +
> +inherit autotools
> +
> +DEPENDS += "attr zlib"
> +
> +SRC_URI = "http://www.gnu.org/software/${BPN}/${BPN}-${PV}.tar.gz"
> +
> +SRC_URI[md5sum] = "a0fc534ef8f9589282a189f0e6cdf952"
> +SRC_URI[sha256sum] = "901204634651533f7cbd105eab560534702458258529aac4b2f0fc946992107e"
> +
> +LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
> +LICENSE = "GPLv3"

License fields should be nearer the top of the recipe. See
http://www.openembedded.org/wiki/Styleguide

> +EXTRA_OECONF = "--disable-libacl"

Consider making acl a PACKAGECONFIG option, controlled by the acl
DISTRO feature (see coreutils recipe for an example).

To prevent non-deterministic dependencies, consider adding a
PACKAGECONFIG option for bzip2 as well.

> +BBCLASSEXTEND = "nativesdk"
> --
> 1.7.9.5
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

