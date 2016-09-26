Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f51.google.com (mail-vk0-f51.google.com
	[209.85.213.51])
	by mail.openembedded.org (Postfix) with ESMTP id 1CEAB60620
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Sep 2016 07:53:20 +0000 (UTC)
Received: by mail-vk0-f51.google.com with SMTP id z126so43676264vkd.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Sep 2016 00:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=nAfkYxXr4QXB+QKLJF/5BbezU46IR+vG2C6w3CfpJSY=;
	b=z4IOra/7W9hb3Wr0OKNqGZR+l1G3Kj5fEBMz/iV6J3UsYbNrr0uqoZLe4sHy0BufcD
	R8Q9+dTwkmfFwfEXudA/H7DaWeS0jXAdMGZq5paDFBIEsdIuG53vwGud1e4pxGYLPTDg
	chVsTg16KfhmjDP1/NUW2z9MIvvSzrS9Fm9jjDVMsD8NoCxbNIIfdm65fzeFGEVKy+GH
	0AEtG8fVCWLUMX3onQX6lCwdZbh7DdzPX0O82iD00F/GSHQ8Q7a6ZEmDn3wAZWsChgTX
	+TDjKdhs5D3HeTXczjRRKggaodUWJvPSjObqMFdFYbgabLpiaCdx8EkFkNmZkRAq2REf
	I3rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=nAfkYxXr4QXB+QKLJF/5BbezU46IR+vG2C6w3CfpJSY=;
	b=ebcm++UDacY0SbdPrapoa9GN5ImtHxzEtrvNOQqIsK4fcW+52w5Ifa5jedTQovG4yc
	PCzu5j/dXKxApIC/VXQ/BWRHnREDcS1tuKSCOhDhpuWo1kISd5DLZFJrfFQ4gIkI1/ym
	07gGNqc7uEEeEJOHU4uswd9zPAFan/9UpzeZAjATYlEqBwVx3jiWDvqmNgf9p9U4/oE9
	VREP51+TA7tsHWObErZTrPO6bFlHW6IxDTJQOaA5rm+4UWW/Jhcqc8RB8MznrB+j1uO2
	f6hVi7h/4o0W4QoWCuO8C20to3OMN75KK1McgMZ41udy25xIFaduNV08ZgUEg2Aba3Xj
	cIXg==
X-Gm-Message-State: AA6/9RmB75ixJ2i5Ft02w0MHxLBXtZGZh8f7mE8JlIk2pX5QaZHWnjeKy1ua0iQTtPG2HSdvyvLBoIcOo58dow==
X-Received: by 10.31.15.85 with SMTP id 82mr5706782vkp.93.1474876402007; Mon,
	26 Sep 2016 00:53:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.80.33 with HTTP; Mon, 26 Sep 2016 00:52:51 -0700 (PDT)
In-Reply-To: <1474876068-6032-1-git-send-email-Qi.Chen@windriver.com>
References: <1474876068-6032-1-git-send-email-Qi.Chen@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 26 Sep 2016 00:52:51 -0700
Message-ID: <CAMKF1so1UVpnG2nQhSuOVXssf1SP+eAg2mHDn_j030e8XdmESQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] gperftools: fix to work on aarch64
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
X-List-Received-Date: Mon, 26 Sep 2016 07:53:22 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Sep 26, 2016 at 12:47 AM,  <Qi.Chen@windriver.com> wrote:
> +EXTRA_OECONF_aarch64 += "--disable-libunwind"

use append += is undocumented

