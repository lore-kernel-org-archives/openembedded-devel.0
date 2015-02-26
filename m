Return-Path: <anders@chargestorm.se>
Received: from mail-la0-f53.google.com (mail-la0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id 96EF5605B3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Feb 2015 11:33:46 +0000 (UTC)
Received: by labgd6 with SMTP id gd6so10295880lab.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Feb 2015 03:33:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-type:content-disposition
	:in-reply-to:organization:user-agent;
	bh=tqN0oun0Jl4Zm0nD642llE/Q/Fml06oKfclDU7IMQaM=;
	b=ZoP5BwwIiwKbvSNCSvIWpOsh38G0sl7u7d50QA/RV8HJ0ZrLOtFsXRagl45nnx32r6
	pWqu3VsoX/Pxq3QGMN87q34Ph3SSWV8m0gPvZTK95yhqzMKRkbUCSyh0UPMbtiRnVkIF
	RZnc9y9Zib+5hEQp7VvRJgw4NO2p3wxLemDcYp48QXXkQa37SEnnW1/W3TU1UrZRDD2k
	tV7/eoKjXr33QcpxxGXndCghvlryPFZ1XQz+eWx4eKgFsvRrB/52cN93ZfLmcBmFuVXJ
	bsJPF2AUS78Z08BEDHZJ1I4M8k0G4cI+cWEw9RyNYhqTpiEWqkJf2lwA86sr3keMDlTh
	ALSA==
X-Gm-Message-State: ALoCoQlWBEPJS4vV3o4PljLfNbDHPLB/H7O6DhQjgzCaJUJsHM4WFzfNxAQssbra+ZNp1LXSzCMc
X-Received: by 10.112.141.225 with SMTP id rr1mr6860060lbb.71.1424950426712;
	Thu, 26 Feb 2015 03:33:46 -0800 (PST)
Received: from ad.chargestorm.se (2.71.108.106.mobile.tre.se. [2.71.108.106])
	by mx.google.com with ESMTPSA id h9sm137421laa.10.2015.02.26.03.33.44
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 26 Feb 2015 03:33:45 -0800 (PST)
Date: Thu, 26 Feb 2015 12:33:36 +0100
From: Anders Darander <anders@chargestorm.se>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150226113336.GA12658@ad.chargestorm.se>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <1424945197-5406-1-git-send-email-daniel.markus@leica-geosystems.com>
MIME-Version: 1.0
In-Reply-To: <1424945197-5406-1-git-send-email-daniel.markus@leica-geosystems.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH v2] socorro-syms: Make usage less verbose
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
X-List-Received-Date: Thu, 26 Feb 2015 11:33:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Daniel Markus <daniel.markus@leica-geosystems.com> [150226 11:08]:
> ---
>  meta-oe/classes/socorro-syms.bbclass | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

As V1 hasn't been merged, squash your V2 patch into V1. Thus we're
getting a complete patch in V3... ;)

Cheers,
Anders

> diff --git a/meta-oe/classes/socorro-syms.bbclass b/meta-oe/classes/socorro-syms.bbclass
> index a4ac079..766a9e6 100644
> --- a/meta-oe/classes/socorro-syms.bbclass
> +++ b/meta-oe/classes/socorro-syms.bbclass
> @@ -7,13 +7,12 @@

>  # Use example:

> -# inherit breakpad
> -# inherit socorro-syms
>  # BREAKPAD_BIN = "YourBinary"
> +# inherit socorro-syms


>  # We depend on Breakpad creating the original symbol file.
> -DEPENDS += "breakpad"
> +inherit breakpad

>  PACKAGE_PREPROCESS_FUNCS += "symbol_file_preprocess"
>  PACKAGES =+ "${PN}-socorro-syms"
-- 
Anders Darander
ChargeStorm AB / eStorm AB

