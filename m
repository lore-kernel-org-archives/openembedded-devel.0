Received: from [209.85.198.249] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hvontres@gmail.com>) id 1LY0hM-000117-VY
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Feb 2009 17:15:29 +0100
Received: by rv-out-0708.google.com with SMTP id b17so870151rvf.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Feb 2009 08:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=TCXhWAYDQC0ETbGXX1/RV6XJFpTt0aRwsxqSMoeQWsc=;
	b=ZSrClLvOjlt+MLsQCgoq3woXGW+klvDLrhutcf/PFSOwOGQDkwYI50FzkNQgUFvKu5
	2CKocIUeAHzAgLWO4rxJ3HnvIBgZtOmQg7KN9w06ciuwmOmjJ+ro+Blr/db/u6+2S9o2
	og8xGUBfRkhNJ5y+dDS6O4PO8yy5yzpADoKd4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=YXEIWnsRjNnI+0W5YeymQzxjr855nx77V6PCZNX4Zdd47Rb7c+ihGC95fOjOldHX7P
	yIjJazBiN/NhfXffwcG2CfQ4HKb6kuZN8qDE/9KZXG6QBsjpEd/rp8Tpy/xyRiuqbYcX
	TKT4JNTyzqav+ZbDrln0o6PfifNEkl3rv+u48=
MIME-Version: 1.0
Received: by 10.141.50.11 with SMTP id c11mr222423rvk.28.1234541642178; Fri, 
	13 Feb 2009 08:14:02 -0800 (PST)
In-Reply-To: <a7f8874a0902042227w54cf3700p75006bd994f3ade7@mail.gmail.com>
References: <a7f8874a0902042227w54cf3700p75006bd994f3ade7@mail.gmail.com>
Date: Fri, 13 Feb 2009 08:14:02 -0800
Message-ID: <a7f8874a0902130814n5b6baaf1sb46ecffa1b31bcce@mail.gmail.com>
From: Hans Henry von Tresckow <hvontres@gmail.com>
To: oe-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] sg3-utils: Updated Makefile patch to deal with cross-compiling
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
X-List-Received-Date: Fri, 13 Feb 2009 16:15:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On Wed, Feb 4, 2009 at 10:27 PM, Hans Henry von Tresckow
<hvontres@gmail.com> wrote:
> Please review and if ok, push
>
>
> From a9216efa1e2f56a53d6e5c210655c0c4a7256169 Mon Sep 17 00:00:00 2001
> From: Henry von Tresckow <hvontres@gmail.com>
> Date: Wed, 4 Feb 2009 16:50:15 -0800
> Subject: [PATCH] sg3-utils: Updated Makefile patch to deal with cross-compiling
>
> Signed-off-by: Henry von Tresckow <hvontres@gmail.com>
> ---
>  packages/sg3-utils/files/Makefile-r1.patch |  263 ++++++++++++++++++++++++++++
>  packages/sg3-utils/files/Makefile.patch    |  246 --------------------------
>  packages/sg3-utils/sg3-utils_1.24.bb       |    7 +-
>  3 files changed, 268 insertions(+), 248 deletions(-)
>  create mode 100644 packages/sg3-utils/files/Makefile-r1.patch
>  delete mode 100644 packages/sg3-utils/files/Makefile.patch
>

Any reason why this got rejected? I would like to fix the problem and re-submit
-- 
Henry von Tresckow (hvontres)
Garry Shandling  - "I'm dating a woman now who, evidently, is unaware of it."


