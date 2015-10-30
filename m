Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 9851B607A5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 12:59:47 +0000 (UTC)
Received: by ioll68 with SMTP id l68so79211154iol.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 05:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems_com_br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:content-type; bh=Agg+OSazlfPPmpB9eRn+YPOUdYkKMH5sHruIRLsrrso=;
	b=Q48nExO5lvZ79mbT77hsenqozZvLp07X3YghYehpoB2eHBEQbNFk9cn/zlZNFC01Wq
	OotKfGQKmKnRMjTmge4KLnh1E1gxIogsWwP5F35Ydrkjl4vjm/HJvV3CJWurIP6mVXAl
	rvbPCgDsibina+Tu+lVMsvPxwc5rTfRabEgTQQ7LBPkvCU4TTI9sjDvnaRserOnaLVnj
	HXm0wpac164OMytCRbAN7UoeZOFlUBy0DkkWn+CWirFJEUWAYXckjjln51lJaOzWR/dH
	BiitJJ6bFVrUdoopygdG/VR100iDNoYvhTKc8Ihx1MoG+9ap3tvT8RpZS4aqcrDOkjU9
	ppVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:content-type;
	bh=Agg+OSazlfPPmpB9eRn+YPOUdYkKMH5sHruIRLsrrso=;
	b=IVk6QBrl3gnVvbisRdm3xWJxutwOaLOuDncxiqPp2/5aolKCS9a72pHIN3iPhgapq2
	aiZ6BdrOkTGq07H312ncMxCLmyE3+gNwEanz0yYXDMtRVlGLOVdiCytypQBA7+O2IFfd
	a8gFT1BGxstkZxFkYSMbcyox2iPmFDrZDhFJu/tQX9j2CSI5efAhvMjidK5e0Vu91MfT
	Vd7tEJKZlyRCg7q9K6QsAZGSpqjXrEkPUmU2IPSkpAC92ZJbPBouktg37Xu2nyiBlwmW
	NhH13dmEMbDs1soe0u87FY5feT05FY0+7Qv2F8dCOLnDh25hHH5jiLB59g7xxp3MC6SE
	iUlg==
X-Gm-Message-State: ALoCoQlq6zgumiynBeRdqo9Le7jFZkQRsJ/BcAgvSAxHvx5L8OQTGB5hVcGrMMG3VpNF6i+3fJiw
X-Received: by 10.107.13.13 with SMTP id 13mr9316206ion.72.1446209987493;
	Fri, 30 Oct 2015 05:59:47 -0700 (PDT)
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com.
	[209.85.223.176])
	by smtp.gmail.com with ESMTPSA id je7sm902317igb.4.2015.10.30.05.59.46
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Oct 2015 05:59:46 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by ioll68 with SMTP id l68so79210483iol.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 05:59:46 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.107.17.88 with SMTP id z85mr10848481ioi.97.1446209986199;
	Fri, 30 Oct 2015 05:59:46 -0700 (PDT)
Received: by 10.36.24.4 with HTTP; Fri, 30 Oct 2015 05:59:46 -0700 (PDT)
In-Reply-To: <17C19527BD855F428F22685986FD58BEA16409@IRSMSX103.ger.corp.intel.com>
References: <4BA9AF94-31D9-4B1D-99DD-5D1DE20533EA@gmail.com>
	<17C19527BD855F428F22685986FD58BEA16318@IRSMSX103.ger.corp.intel.com>
	<25A9A07D-261D-4E51-98CB-EB3307D7D9A2@gmail.com>
	<17C19527BD855F428F22685986FD58BEA16409@IRSMSX103.ger.corp.intel.com>
Date: Fri, 30 Oct 2015 10:59:46 -0200
Message-ID: <CAP9ODKojDcEswMdNpVct53UEg7r9WcOCFZyUtx2xb74ruY8aPA@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java][PATCH 4/4] openjdk-8: add recipes for openjdk-8 and openjre-8
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
X-List-Received-Date: Fri, 30 Oct 2015 12:59:47 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Oct 30, 2015 at 10:41 AM, Kaaria, Erkka <erkka.kaaria@intel.com> wrote:
> I don't know if there are actually any issues when bootstrapping with openjdk-8-native. I just wanted to raise the issue as the openjdk build readme warns against this.

Use a "-c cleanall" for openjdk-8 and confirm the binary files are
updated. Jens, please do the same.

So we guarantee the md5 are real.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

