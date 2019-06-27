Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 537EB7E6CC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jun 2019 09:06:30 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id r185so3113304iod.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jun 2019 02:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=6biUjIFUKdXQPQBC6VoVXgcutdd9RfkjB0dGAy+Z/YE=;
	b=QpxvJvm1Foi+Ya/e6nRRUiwxZkhu575J5/2DB5QMVrDZfhucABCYw0PqZPDsllGx9/
	XIFIjQBi+Xq0LnbbcahC13PkEoNdzH3t5ZnXOiEAMsmI/BOuZODAo6q4TlxFVvQPH/uv
	CthZu8tPqEN8Pw+XfRM6/fY9xAk9wIswqHXQ+z3g+mevEnJ2f2hKqrnE+CRs2HyeXnR8
	uBIwTy4boIY5WmsAEGThdNEcF5kC7BKS10sVGW1tfLV6LMVGJTJst5+qih1dgYm7PAPM
	qz34hbQl/q+9EMgZ1YbuUskCW8gFdIJsj+aMJP2SAaDK7xFg45tB7GgunyBERhdroFJJ
	QJNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=6biUjIFUKdXQPQBC6VoVXgcutdd9RfkjB0dGAy+Z/YE=;
	b=hd0jdWNYTOQ5PWH3lxxcCmz6D4Qe9NlF68rcH/vqQF81Ib1FXtChPrUR8QIhOw2Z0U
	JXh+bsS8OFrVq7rw3j58cE7/y6HB1kPH7DsQeg7cNYL7JSQgu+BFc89e8LRnaQZe7MPr
	EuQPEwZ7NhTCDjzc3Tr9Hz2TU44nCPRUxJKi1FWZ9k2Z0JCPAh476cumbCs2B47ETY0l
	h326V+KnHuzsfA4rScbRsqW30pVQ2A4uDSZHBUaCiKFDwP9Orh8PpfPDM2SRS2eDvFGi
	OxpM5K7hZYTlZZREnxG4uzuMCxG6i/jMMDV7dULBYT3w2yZlTdd47tlbmT+8Ou6qeC01
	Kbnw==
X-Gm-Message-State: APjAAAVSe2GAwUfQKUXxiug+cGd8QEJ8wGqnNIAmyrjwdmiO+KqIAV/c
	BAx9AO7wg7RTcIUhO801cMsxJvNQx9x8rc78EezPHueH
X-Google-Smtp-Source: APXvYqxtPVP5LUhIwvIfs5EtIOnKBlSgpyMQj0PQmodQZs7oIiRzkhnS1mgJmerCIeqPoGLGfc3PKQY1/5ue+P6OCbM=
X-Received: by 2002:a5d:9e11:: with SMTP id h17mr3325872ioh.261.1561626391286; 
	Thu, 27 Jun 2019 02:06:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190627085904.9461-1-jean-tiare.le-bigot@easymile.com>
In-Reply-To: <20190627085904.9461-1-jean-tiare.le-bigot@easymile.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 27 Jun 2019 10:06:19 +0100
Message-ID: <CAJTo0LY0va0AoVDBSjV8ju0=Dmy-s3x_O9SOACwAvH8wt_4_Jg@mail.gmail.com>
To: Jean-Tiare Le Bigot <jean-tiare.le-bigot@easymile.com>
Cc: =?UTF-8?Q?Jo=C3=ABl_Esponde?= <joel.esponde@easymile.com>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] package.bbclass: fix directories setuid and setgid bits
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
X-List-Received-Date: Thu, 27 Jun 2019 09:06:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This should go to openembedded-core@lists.openembedded.org, not -devel.

Ross

On Thu, 27 Jun 2019 at 09:59, Jean-Tiare Le Bigot
<jean-tiare.le-bigot@easymile.com> wrote:
>
> From: Jo=C3=ABl Esponde <joel.esponde@easymile.com>
>
> populate_packages relies on ``mkdir`` to both create a directory and set
> its permissions. However, ``mkdir`` honors the ``umask`` value.
> Therefore, some bits may be lost in the operation. In our case, the
> setgid bit on the directories were lost.
>
> This commit fixes this by having a distinct call to create the directory
> and to set the permissions.
>
> Signed-off-by: Jean-Tiare Le Bigot <jean-tiare.le-bigot@easymile.com>
> ---
>  meta/classes/package.bbclass | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index 20d72bba79..cd223a121e 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -1216,7 +1216,8 @@ python populate_packages () {
>                  src =3D os.path.join(src, p)
>                  dest =3D os.path.join(dest, p)
>                  fstat =3D cpath.stat(src)
> -                os.mkdir(dest, fstat.st_mode)
> +                os.mkdir(dest)
> +                os.chmod(dest, fstat.st_mode)
>                  os.chown(dest, fstat.st_uid, fstat.st_gid)
>                  if p not in seen:
>                      seen.append(p)
> --
> 2.19.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

