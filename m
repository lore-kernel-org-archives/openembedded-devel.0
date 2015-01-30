Return-Path: <net147@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id DA0B465C6D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jan 2015 09:08:00 +0000 (UTC)
Received: by mail-pa0-f50.google.com with SMTP id rd3so50047519pab.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jan 2015 01:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=GQNseeudthPlF9A4BL/P3zptLJ15RD3hjOrEanW10gs=;
	b=vDueUJSdPQjJ1yUOvPnCfPfxZlEMENa0vasLO4Q/PljTTRMRymmxiRubHhSSCcMfaj
	2v11uaLxljGahGlhaVYgTxzz/nKGSxmVEO2iDNpPOb7S+g3vT9ZiZdW5kqSFPelM6fZi
	SCa+sM6YXM9Mroc2Agud4wvNsXYxNqDddTWjdCu37c4AYioWC3LF5nHt546OcHZM5oam
	kJR01f15gbAaxAxi3/TmSCjz8l+f3cCQZZEG6ZvIobmuj2HjCmUTGLhXEYecORiia95Z
	eOSDYDPGCEaRw09ETuoKBr3IMgucr2nfFQpTnb5/2ZuyOF8hveRXGjkbAQuK/RLw7AHq
	tOOA==
X-Received: by 10.67.13.12 with SMTP id eu12mr7258745pad.157.1422608882071;
	Fri, 30 Jan 2015 01:08:02 -0800 (PST)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244])
	by mx.google.com with ESMTPSA id i3sm10115862pdf.39.2015.01.30.01.07.59
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Jan 2015 01:08:01 -0800 (PST)
Message-ID: <54CB49EA.5010602@gmail.com>
Date: Fri, 30 Jan 2015 20:07:54 +1100
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Raphael Freudiger <raphael.freudiger@siemens.com>
References: <1422603250-24453-1-git-send-email-raphael.freudiger@siemens.com>
In-Reply-To: <1422603250-24453-1-git-send-email-raphael.freudiger@siemens.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v2] p7zip: new recipe
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
X-List-Received-Date: Fri, 30 Jan 2015 09:08:07 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi Raphael,

On 30/01/2015 6:34 PM, Raphael Freudiger wrote:
> diff --git a/meta-oe/recipes-extended/p7zip/p7zip_9.20.1.bb b/meta-oe/recipes-extended/p7zip/p7zip_9.20.1.bb
> new file mode 100644
> index 0000000..d70cd66
> --- /dev/null
> +++ b/meta-oe/recipes-extended/p7zip/p7zip_9.20.1.bb
> @@ -0,0 +1,23 @@
> +DESCRIPTION = "7-zip is a commandline utility handling 7z archives."
> +HOMEPAGE = "http://www.7-zip.org/"
> +LICENSE = "LGPL-2.1+ & unRAR"
> +LIC_FILES_CHKSUM = "file://./DOCS/copying.txt;md5=ecfc54c9e37b63ac58900061ce2eab5a"
> +LIC_FILES_CHKSUM = "file://./DOCS/unRarLicense.txt;md5=9c87ddde469ef94aed153b0951d088de"
You're assigning LIC_FILES_CHKSHM twice and isn't the ./ redundant?

LIC_FILES_CHKSUM = 
"file://DOCS/copying.txt;md5=ecfc54c9e37b63ac58900061ce2eab5a \
file://DOCS/unRarLicense.txt;md5=9c87ddde469ef94aed153b0951d088de"

Regards,
Jonathan

