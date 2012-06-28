Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1SkIOV-0001nq-QA
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Jun 2012 19:20:39 +0200
Received: by dalh21 with SMTP id h21so3044644dal.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jun 2012 10:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=7hTTkVcshdN4lTeSXIx3jNdwm0s11y65Vg4vWvJq3YY=;
	b=bWI25Hil2/FYkVCK6Yy+v7I/OodfImkYLAqMocnvWjedweDnwWsM4EJsfjrcKDusxm
	iPOsHvnING/CdFIeIxtPd/Vlr2V8EQTq3ZGflQCZnKTEaEYxk+uUcW6hZRVpkS5/2JtL
	oGcOYJ+L7FbjYm3mPCxpdRDgczYpAi+uqKr0+wd5xR1NXYhJRBW16FNM3kF2RoQc/luq
	y9SukvRn4+iC65HGkcZbrtD02tsenKXL4oyE6upUT5ELUeYZt9ObjGuq6O92G5EiQI7O
	4sIjZIJ2PApDFWMDtOikPxBNHSmBDzUJ7M3UVufP3JsAKXy10YxRaRQjpXNK09aYcXgw
	rU9Q==
Received: by 10.68.228.136 with SMTP id si8mr9779510pbc.159.1340903384112;
	Thu, 28 Jun 2012 10:09:44 -0700 (PDT)
Received: from [192.168.1.102] ([94.205.109.242])
	by mx.google.com with ESMTPS id rs4sm2652833pbc.0.2012.06.28.10.09.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 28 Jun 2012 10:09:42 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Elvis Dowson <elvis.dowson@gmail.com>
In-Reply-To: <1340336931-7978-1-git-send-email-elvis.dowson@gmail.com>
Date: Thu, 28 Jun 2012 21:09:37 +0400
Message-Id: <AF874800-B131-47EF-81EF-07B7C98BCA0F@gmail.com>
References: <1340336931-7978-1-git-send-email-elvis.dowson@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1278)
Subject: Re: [meta-openembedded] lighttpd: Set SYSTEMD_PACKAGES as lighttpd-systemd.
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
X-List-Received-Date: Thu, 28 Jun 2012 17:20:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,
      I sent this patch a while back, and this still hasn't been =
applied. I just did a git pull and noticed this. Its a trivial patch, so =
would it be possible for someone to please apply it.

Elvis

On Jun 22, 2012, at 7:48 AM, Elvis Dowson wrote:

> This commit fixes WARNING:
> /tool/yocto/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.30.bb:
> it is recommended to set SYSTEMD_PACKAGES as =
<existing-package>-systemd
>=20
> Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
> ---
> .../lighttpd/lighttpd_1.4.30.bbappend              |    2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git =
a/meta-oe/recipes-extended/lighttpd/lighttpd_1.4.30.bbappend =
b/meta-oe/recipes-extended/lighttpd/lighttpd_1.4.30.bbappend
> index 1341405..b02f35c 100644
> --- a/meta-oe/recipes-extended/lighttpd/lighttpd_1.4.30.bbappend
> +++ b/meta-oe/recipes-extended/lighttpd/lighttpd_1.4.30.bbappend
> @@ -6,5 +6,5 @@ inherit systemd
>=20
> SRC_URI +=3D "file://lighttpd.service"
>=20
> -SYSTEMD_PACKAGES =3D "${PN}"
> +SYSTEMD_PACKAGES =3D "${PN}-systemd"
> SYSTEMD_SERVICE_${PN} =3D "lighttpd.service"
> --=20
> 1.7.9.5
>=20



