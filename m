Received: from qw-out-1920.google.com ([74.125.92.148])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1NuEpd-0005js-Np
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Mar 2010 01:52:26 +0100
Received: by qw-out-1920.google.com with SMTP id 4so727173qwk.36
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Mar 2010 17:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:from:date:x-google-sender-auth:message-id:subject:to
	:content-type; bh=PMEG0XPqwS1kzZXt/CiWfUhDB4hSwZ5d53pHxAJnQ1A=;
	b=utOWeZiW5X5orqhDSqoJA//s4dqp5eFAadHilXFHQ+HtIXIJnhbC5Iid11XRXumxIp
	+RMd/1swNVFjcbPzYtzBuzTNHzUociTOzXrGOvKlweIOdvxNCJzIGraU+mtDzXVwC/16
	qJlA4Lr8E+BPaPhqhSeh4+Nijr8XsgRTwcnmk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=smJnlqbCPx/ehrU5/VXQ1NT9G1PDWHxZpzHN57qSQWq2dJvof7RSXv3j9jgDY/2dLN
	KVjYwixpu+z1QwapPQq74XqTP7VnkMtsJHnJIIknR3tL+2NXv1nmbV2GbNzrHEAFRwt3
	pWXlp7qCDzbAw1Wi+Pxz4MmTUOGgpfE6bYmzA=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.88.193 with SMTP id b1mr1698756qcm.27.1269391758092; Tue, 
	23 Mar 2010 17:49:18 -0700 (PDT)
In-Reply-To: <1269383658-27562-1-git-send-email-ml@vdm-design.de>
References: <1269383658-27562-1-git-send-email-ml@vdm-design.de>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 23 Mar 2010 17:48:58 -0700
X-Google-Sender-Auth: 090528e2df8d3113
Message-ID: <b6ebd0a51003231748s293a4020v989b8cdf590ccc4@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.92.148
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] imagemagick: convert to BBCLASSEXTEND and new staging
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
X-List-Received-Date: Wed, 24 Mar 2010 00:52:26 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Mar 23, 2010 at 3:34 PM, Thomas Zimmermann <ml@vdm-design.de> wrote:

> * imagemagick-6.3.5-10 doesn't configure with autoconf > 2.63
> * problem: without removing imagemagick-native_6.3.5-10 the old version is
> build
>
> Signed-off-by: Thomas Zimmermann <ml@vdm-design.de>
> ---
>  recipes/imagemagick/imagemagick_6.4.4-1.bb |   11 +++++------
>  1 files changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/recipes/imagemagick/imagemagick_6.4.4-1.bbb/recipes/imagemagick/
> imagemagick_6.4.4-1.bb
> index bc16b0c..b02ce26 100644
> --- a/recipes/imagemagick/imagemagick_6.4.4-1.bb
> +++ b/recipes/imagemagick/imagemagick_6.4.4-1.bb
> @@ -3,8 +3,9 @@ SECTION = "console/utils"
>  LICENSE = "GPL"
>  # FIXME: There is much more checked libraries. All should be added or
> explicitly disabled to get consistent results.
>  DEPENDS = "bzip2 jpeg libpng librsvg tiff zlib"
> +DEPENDS_virtclass-native = "libtool-native bzip2-native jpeg-native
> libpng-native librsvg-native zlib-native"
>

This should not be necessary.  native.bbclass automatically sets deps on the
-native versions of what's in your DEPENDS.  Or was there a specific reason
behind adding libtool-native and removing tiff?
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

