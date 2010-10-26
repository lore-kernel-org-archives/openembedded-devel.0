Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PAr6z-0004GE-4Q
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Oct 2010 23:31:18 +0200
Received: by ywo32 with SMTP id 32so1283653ywo.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Oct 2010 14:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=EKIjnHjZ0CSu44oVzk/CrYdPYa1HeDafxoqC4hRTxc4=;
	b=GR8gEbwGKHk0wQ77qCLXb/T7WFJrKANJxOMfTuiITQcz/R8BApv7o0H3OaYUVak8Us
	O+xgWP9CKejkPFzANy8PZJ32b7FabyGkeyvx/R46z/WCIcIIvXvspY9rYUAAGDN+wmMh
	IOoEuKutVCvpL1WA9iFR68JsUf3UEt5AwdakU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=oBONIeHg7P1AeLbGqtWVkKihho7EKyLT3y55mO+BtH4GeMQgrjTms21HutxAjFT0bE
	cgClLQYzjkWznoUiGJwB4toYt6nuilnBS4kjWH6ESjeFppbyQ4zp/4S1QGLhtYkReN8u
	APKW8u7+iR6rjsUxTzZ4vbmYty/5Cjv3xyFFE=
Received: by 10.150.95.4 with SMTP id s4mr15873161ybb.363.1288128633124; Tue,
	26 Oct 2010 14:30:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.90.105.8 with HTTP; Tue, 26 Oct 2010 14:30:12 -0700 (PDT)
In-Reply-To: <1288124872-18813-1-git-send-email-dbatzle@dcbcyber.com>
References: <1288124872-18813-1-git-send-email-dbatzle@dcbcyber.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 26 Oct 2010 14:30:12 -0700
Message-ID: <AANLkTi=W1g++5vP22Zeu+XGEsMqhk5Sr38sA88YZDcjw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v2] bullet.bb New recipe
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
X-List-Received-Date: Tue, 26 Oct 2010 21:31:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 26, 2010 at 1:27 PM, David Batzle <dbatzle@dcbcyber.com> wrote:
> ---
> =C2=A0recipes/bullet/bullet.bb | =C2=A0 14 ++++++++++++++
> =C2=A01 files changed, 14 insertions(+), 0 deletions(-)
> =C2=A0create mode 100644 recipes/bullet/bullet.bb
>
> diff --git a/recipes/bullet/bullet.bb b/recipes/bullet/bullet.bb
> new file mode 100644
> index 0000000..c466e7a
> --- /dev/null
> +++ b/recipes/bullet/bullet.bb
> @@ -0,0 +1,14 @@
> +DESCRIPTION =3D "Bullet Physics Library"
> +HOMEPAGE =3D "www.bulletphysics.org"
> +LICENSE =3D "Zlib"

if you look closely under the sources different parts are licensed
under different licenses
while you are at it could you mention all the licenses that the
package is using.

Otherwise it look ok.

> +PV =3D "2.77+svnr${SRCPV}"
> +PR =3D "r0"

you could omit PR setting when its r0 i.e. initial first rev because
bitbake will set it to r0
if it does not find a PR definition but then if some fix it done later
then it has to be bumped
to r1 then one has to add that in recipe but its ok to set it to r0 as
well its just FYI

> +
> +SRC_URI =3D "svn://bullet.googlecode.com/svn;module=3Dtrunk;proto=3Dhttp=
"
> +
> +SRCREV =3D "2218"
> +S =3D "${WORKDIR}/trunk"
> +
> +inherit cmake
> +
> +EXTRA_OECMAKE =3D "-DBUILD_DEMOS:BOOL=3DOFF -DBUILD_EXTRAS:BOOL=3DOFF -D=
USE_GLUT:BOOL=3DOFF -DBUILD_SHARED_LIBS:BOOL=3DON"
> --
> 1.6.0.6
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


