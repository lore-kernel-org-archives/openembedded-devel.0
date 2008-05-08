Received: from [209.85.132.244] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1Ju51H-0001Xq-CO
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 May 2008 14:14:43 +0200
Received: by an-out-0708.google.com with SMTP id b38so157434ana.83
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 May 2008 05:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	bh=sNUIthT1fAzRKY/3235uo0tW9GzU/k7Qtw/PuU8dVfo=;
	b=vUlRNUg5uoZ1a2dxwmAEo7NabE5P82Nxk9EegaC1zHKtcsyokVBOocUtQm8L/x7wRHU6C/qczRkbVfnDXJ3uU2Mr8C9YUvcq53NorwNc8NYPWyD/HYSEG9VDoQN1HJuHYNP6YT5/I2ODlr+utfIC/VLNjb6XOMEm4awf9aqwF9Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=CnopmuU49luq1xcP50gADx4jK8qVk5JwCEInqh7snM8ahwWpVe3IvuSSsTZ8zL1e0sea7KcLrHSNqOAzbZM9qkDeoqbRpAzDLjWaXEC8X1qFgwiB6sb5pVvVccm8lZrGTeAf+SzsMbh4Afg2PrId7RX+O9OpJsWD66AsrUIxWaY=
Received: by 10.100.5.16 with SMTP id 16mr4078383ane.102.1210248842127;
	Thu, 08 May 2008 05:14:02 -0700 (PDT)
Received: by 10.100.190.7 with HTTP; Thu, 8 May 2008 05:14:01 -0700 (PDT)
Message-ID: <c384c5ea0805080514s6561aff8t273eff90fca1db85@mail.gmail.com>
Date: Thu, 8 May 2008 14:14:01 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <f96d234e0805080506t458743b8g7ea65ab4dcb15525@mail.gmail.com>
MIME-Version: 1.0
References: <200805080215.23729.zecke@selfish.org>
	<f96d234e0805080506t458743b8g7ea65ab4dcb15525@mail.gmail.com>
Subject: Re: Creating a pristine environment?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Thu, 08 May 2008 12:14:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello Cliff,

On Thu, May 8, 2008 at 2:06 PM, Cliff Brake <cliff.brake@gmail.com> wrote:
>  export TOPDIR="${OEDIR}/build/angstrom-2007.1"

A warning here, I have seen breakage with some environment variables.

I think TOPDIR is used by u-boot or some such.

Think of a better (more uniquer) namespace, such as OE_TOPDIR.

Regards,
-- 
Leon


