Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OpcHw-0005Y3-Ry
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Aug 2010 09:26:49 +0200
Received: by iwn2 with SMTP id 2so3831221iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Aug 2010 00:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=4szvdhxeSu47NSrfZKp3EyIOppeNNySg5t7KHfZ2XNg=;
	b=IQn7Kuo1P5cKsfLFoslMs4tBUElLAQ45fQH/HgqN4nKzpVSFL0o4H4VEvRN7P0jqRu
	sS3vijcSEtGl7sHZsm2zkv2I2Wu+IOpi3oe8R3BLUqRDStomgwGCk/WPQ0erXCjNh1on
	F9S12lRxNeSD9DK9ELh94V6hcm5BzVAmrLLOA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=ZS6qukiN/8o8gT/o1k/bxHBCtI90GJsOg+LafKRCRl4EzKfTtE049m6QkEuvWQz3/Y
	LF/MQW3EFac0AjGKxACkU68H6NK/WI2MkJlbZjRTCHOxspgXoZ22jIHo6La7nuUH9uWn
	L16XX4xD2ryzOeVB7C/VR8r90rsRwuUbbXLwk=
MIME-Version: 1.0
Received: by 10.231.13.130 with SMTP id c2mr3502765iba.24.1283066779828; Sun,
	29 Aug 2010 00:26:19 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Sun, 29 Aug 2010 00:26:19 -0700 (PDT)
In-Reply-To: <1283027073-12308-10-git-send-email-raj.khem@gmail.com>
References: <1283027073-12308-1-git-send-email-raj.khem@gmail.com>
	<1283027073-12308-10-git-send-email-raj.khem@gmail.com>
Date: Sun, 29 Aug 2010 09:26:19 +0200
Message-ID: <AANLkTinn_UZSk4=Z29Gv+VCy0vi7=kgSHbx=iQY9z-8L@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 09/23] task-gmae.bb: it uses XSERVER but doesnt really define it so define it.
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
X-List-Received-Date: Sun, 29 Aug 2010 07:26:49 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

can't judge this one, sry

2010/8/28 Khem Raj <raj.khem@gmail.com>:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> =A0recipes/tasks/task-gmae.bb | =A0 =A07 +++++++
> =A01 files changed, 7 insertions(+), 0 deletions(-)
>
> diff --git a/recipes/tasks/task-gmae.bb b/recipes/tasks/task-gmae.bb
> index 1638c98..27f8f7f 100644
> --- a/recipes/tasks/task-gmae.bb
> +++ b/recipes/tasks/task-gmae.bb
> @@ -2,6 +2,13 @@ DESCRIPTION =3D "GNOME Mobile & Embedded Initiative"
> =A0PR =3D "r2"
>
> =A0inherit task
> +XSERVER ?=3D "xserver-xorg \
> + =A0 =A0 =A0 =A0 =A0 xf86-input-evdev \
> + =A0 =A0 =A0 =A0 =A0 xf86-input-mouse \
> + =A0 =A0 =A0 =A0 =A0 xf86-video-fbdev \
> + =A0 =A0 =A0 =A0 =A0 xf86-video-sisusb \
> + =A0 =A0 =A0 =A0 =A0 xf86-input-keyboard \
> +"
>
> =A0PACKAGES =3D 'gmae-core \
> =A0 =A0 =A0 =A0 =A0 =A0 gmae-toolkit \
> --
> 1.7.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


