Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PQjE4-00058k-PC
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Dec 2010 17:20:13 +0100
Received: by yxd5 with SMTP id 5so1507710yxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Dec 2010 08:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=eAmY0X5AZg0LVv/ikze+CUBTK0xiajUCJfis0MPRT8Y=;
	b=a15MwgujQ4Flm9JuV4XSzZJ1Xi7tgvUXzEvWAVzPYo3DcQZwmgdrqn6XEGUm4MRyvg
	9u0QTCI2hIPv1iAw4oxmwnsjSN0eVguW0L4KZTH5F4czYtxDDb4FRccrS61n7G92YleD
	flnLc+B4QITzWj2UPBfi4Jpl6tu5GiGUo6xZI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=VgowgMePyhKw4vg5y4K+wz0nfuwQ+ajMMOqNr7ZjSpTZQ82EWJSaU7peKiD6p1YoU2
	b5nVX0JIJNqswBL2bIMw9xaoSFnw8w7X70wmcadR7tK2PDbTcAV4cdk5x+M0OyhG4DmD
	dC8zQSbPu364/LpsW2jZu4b1pKdqkg1X4z0z8=
Received: by 10.91.163.27 with SMTP id q27mr13575934ago.139.1291911521606;
	Thu, 09 Dec 2010 08:18:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Thu, 9 Dec 2010 08:18:20 -0800 (PST)
In-Reply-To: <1291911060-8451-1-git-send-email-eric@eukrea.com>
References: <1291911060-8451-1-git-send-email-eric@eukrea.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 9 Dec 2010 08:18:20 -0800
Message-ID: <AANLkTi=pVLrAmWjSOmYU9oNNqyUfgkb9M8jM=_8L9AZ7@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] meta-toolchain: fix directories rights
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
X-List-Received-Date: Thu, 09 Dec 2010 16:20:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 9, 2010 at 8:11 AM, Eric B=C3=A9nard <eric@eukrea.com> wrote:
> Actual sdk change rights of /usr and /usr/local to 775 when
> untaring the archives with sudo ... giving group write access
> to these directories.
> This patch fix the rights before creating the archive.
>
> Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>

Acked-by: Khem Raj <raj.khem@gmail.com>
> ---
> =C2=A0recipes/meta/meta-toolchain.bb | =C2=A0 =C2=A02 ++
> =C2=A01 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/recipes/meta/meta-toolchain.bb b/recipes/meta/meta-toolchain=
.bb
> index 82918ad..e949432 100644
> --- a/recipes/meta/meta-toolchain.bb
> +++ b/recipes/meta/meta-toolchain.bb
> @@ -171,8 +171,10 @@ do_populate_sdk() {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0# Package it up
> =C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p ${SDK_DEPLOY}
> =C2=A0 =C2=A0 =C2=A0 =C2=A0cd ${SDK_OUTPUT}
> + =C2=A0 =C2=A0 =C2=A0 chmod -R go-w ${SDK_OUTPUT}
> =C2=A0 =C2=A0 =C2=A0 =C2=A0fakeroot tar cfj ${SDK_DEPLOY}/${TOOLCHAIN_OUT=
PUTNAME}.tar.bz2 .
> =C2=A0 =C2=A0 =C2=A0 =C2=A0cd ${SDK_OUTPUT2}
> + =C2=A0 =C2=A0 =C2=A0 chmod -R go-w ${SDK_OUTPUT2}
> =C2=A0 =C2=A0 =C2=A0 =C2=A0fakeroot tar cfj ${SDK_DEPLOY}/${TOOLCHAIN_OUT=
PUTNAME}-extras.tar.bz2 .
> =C2=A0}
>
> --
> 1.6.3.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


