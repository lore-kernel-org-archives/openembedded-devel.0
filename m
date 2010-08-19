Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Oly75-0005Rt-OU
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Aug 2010 07:56:32 +0200
Received: by iwn38 with SMTP id 38so1444437iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Aug 2010 22:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=d6FFaHsusb7zLfMu4FT2QiORavpBEKhK4IwgixlBjag=;
	b=AMoqSwt7wzI/i77DBOAfbQzbYio+jbZ9oJGnqhSGw66GOwq/fzvapoynLe1Fa3UddH
	6jfAJQFffk0uZFGZP7057fJvCs7sDvhwcNRrwfjgwz58AKLHsrbl7P7zyPUTJMN/UDko
	+NvJW7q9/WCQsH6ALSoaWOdH47oWDDjRoo9+I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=LMEkZVZ7Kn8f7Arkf9ptZl3ykyS29tfvNZqRWf/Q4UI5HUGUsYIXzcMoby0rW1WyaC
	Xqb1bDX+EYw/8ccqIxN3iZkVsiiCNoGPES30Iqnko2Ondv/vTpfv1UqJZHYUbTKDj41g
	ufOjsTJK2Nhb7dMdNBlUvBFkiTyYqUz45eA+g=
MIME-Version: 1.0
Received: by 10.231.182.204 with SMTP id cd12mr10844120ibb.101.1282197373400; 
	Wed, 18 Aug 2010 22:56:13 -0700 (PDT)
Received: by 10.231.208.72 with HTTP; Wed, 18 Aug 2010 22:56:13 -0700 (PDT)
In-Reply-To: <1282172296-11638-1-git-send-email-tom_rini@mentor.com>
References: <1282172296-11638-1-git-send-email-tom_rini@mentor.com>
Date: Thu, 19 Aug 2010 07:56:13 +0200
Message-ID: <AANLkTinTOZLHAxskyt4gUqyERhZchiMaqeZGKvJPycgg@mail.gmail.com>
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
Subject: Re: [PATCH] base-files: Prefer ext4 > ext3 > ext2
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
X-List-Received-Date: Thu, 19 Aug 2010 05:56:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/8/19 Tom Rini <tom_rini@mentor.com>:
> Have /etc/filesystems try and mount ext4 then ext3 then ext2
>
> Signed-off-by: Tom Rini <tom_rini@mentor.com>
> ---
> =A0recipes/base-files/base-files/filesystems | =A0 =A03 ++-
> =A01 files changed, 2 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/base-files/base-files/filesystems b/recipes/base-fil=
es/base-files/filesystems
> index 653593a..10726c6 100644
> --- a/recipes/base-files/base-files/filesystems
> +++ b/recipes/base-files/base-files/filesystems
> @@ -1,6 +1,7 @@
> =A0minix
> =A0fat
> =A0vfat
> -ext2
> +ext4
> =A0ext3
> +ext2
> =A0*

Is this the order in which they are tried?
If so I would suggest reordering them according to likelihood (e.g. minix l=
ast)

Frans


