Received: from mail-vc0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UPwgo-0007Td-66
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Apr 2013 17:11:58 +0200
Received: by mail-vc0-f175.google.com with SMTP id ib11so440435vcb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Apr 2013 07:54:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=77xLEQWPZoCoGKlpc5bn6bHQRQhPmYpxepJ0M/qcbTY=;
	b=ZlSGPTr1DiWTfc3gUM+eC/KS4EYDCHJNyRRabsMCK+IjdIrkSZzHraYVnqqXijc53u
	aDGxEo9t8LDhdnuXGNKjYsKjxZMFznUoP6Rv8ikeg+K5b15vNfBSasfoTlPYbijt5dh0
	+O3BstrP+lRozutM+cR8FCLJpCtaAW4/EKcld1Ah3GfnWJkR2G54qD+fHLfdUuWi3Pez
	GJ2BzQnYkwWX2MSqCFv7c8cteW7447jztcd9Sdnf4OM6l0rzSYN1RZ3WlFRHLB52MnZn
	Pc8W/8ZyOcsUYVclmanowtDvrrCu3vMH+SH0kHY9q0WthbNEjYQPBiiceNpVnv2hV5Of
	JY6A==
X-Received: by 10.52.108.10 with SMTP id hg10mr1498140vdb.34.1365605676196;
	Wed, 10 Apr 2013 07:54:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Wed, 10 Apr 2013 07:54:16 -0700 (PDT)
In-Reply-To: <1365604639-5235-1-git-send-email-ndec@linaro.org>
References: <1365604639-5235-1-git-send-email-ndec@linaro.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 10 Apr 2013 15:54:16 +0100
Message-ID: <CAJTo0LYfznJ8DH_PEaBWRF4_KVP=FqVJe8E6uZfkVtN1MhXYKw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQk9QndJc1I9r8KtwTzIvuOLPUvVeNrKdSqwLjmJFmgFxZoOFHdPgCzR7tJEafFuJ9RRQTSA
Subject: Re: [meta-multimedia][PATCH] gupnp: remove dependency on gnome-icon-theme
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
X-List-Received-Date: Wed, 10 Apr 2013 15:11:59 -0000
Content-Type: text/plain; charset=UTF-8

On 10 April 2013 15:37, Nicolas Dechesne <ndec@linaro.org> wrote:
> As discussed in [1], let's remove the dependency on gnome-icon-theme,
> since it's not required, and it brings additional unwanted dependency,
> such as the whole gtk+...
>
> [1] http://article.gmane.org/gmane.comp.handhelds.openembedded/57483
>
> It is build-tested with
>  - core-image-minimal
>  - IMAGE_INSTALL += 'gupnp'
>  - directfb in DISTRO_FEATURES
>
> The build was failing before (GTK failed to build with directfb, which
> is expected).
>
> Signed-off-by: Nicolas Dechesne <ndec@linaro.org>

You'll want to bump PR (ideally adding some form of pr in the .inc at
the same time).

Ross


