Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f171.google.com (mail-ie0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 6C74370187
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Aug 2014 02:15:45 +0000 (UTC)
Received: by mail-ie0-f171.google.com with SMTP id at1so5061665iec.30
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Jul 2014 19:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=/mH0iYKVFspQhDEA9VJD3nQrqkN5nFDuylpBo1ymxBc=;
	b=Nx7ABNO8IKWVDXZL9CuI/BNUJrwW0tSpMbDMx8FwfocMt4deVJb9pLRQb31FwFxlpX
	OECiCVJ3Ncqhzy7S4bcGpKEIS/oa3mz77ph2o0t+eOelZLDMiM2rxkGFKTVDsFG4IX0P
	b+/q82fy2bJnDbTXA+TOw63WW2YD3RazoPqEfeM1MDpC+orAh2XGtT3fmlLZPRyzgUit
	bn2+zFh3XOkmzzw/iWigbS7LJ+qXD1GZnHX/p7zWciCOHfyfCArs8QKJWL53kfKrSTYf
	5+uQag5GMA1Hw5URx82OKDCsOqUQ1atwCoCcsvSKto8d/7WGj6c4yvhupN5v4qoT8Y4D
	Is6Q==
X-Received: by 10.50.176.202 with SMTP id ck10mr2661539igc.2.1406859346446;
	Thu, 31 Jul 2014 19:15:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.78.105 with HTTP; Thu, 31 Jul 2014 19:15:16 -0700 (PDT)
In-Reply-To: <1406847485-17420-1-git-send-email-andrea.adami@gmail.com>
References: <1406847485-17420-1-git-send-email-andrea.adami@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 31 Jul 2014 19:15:16 -0700
Message-ID: <CAMKF1srma1D7zt0z3_dATNX7LZceB8xSMUP0W+Bmje_qarxWMg@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-initramfs][PATCH] kexec_tools_klibc_2.0.2: update x86_vfscanf.patch
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
X-List-Received-Date: Fri, 01 Aug 2014 02:15:48 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jul 31, 2014 at 3:58 PM, Andrea Adami <andrea.adami@gmail.com> wrote:
> fgets in while loops is expected to check for != NULL

I think the message could be slightly changes, saying that fgets
returns NULL on error thats why we check for NULL and not 0

